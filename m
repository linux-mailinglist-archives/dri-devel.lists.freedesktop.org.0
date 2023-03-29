Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBF26CF0F1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 19:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDFA10E566;
	Wed, 29 Mar 2023 17:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A430E10E566
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 17:22:24 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 j18-20020a170902da9200b001a055243657so9761803plx.19
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 10:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680110544;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=SfAiYrjkYq3sfZQSOh5fMdoNkVwbWy39/QILbTaZ0W4=;
 b=CqrDKGejKKiotc0lMuXrX5u3iXN78mA7qgA/OHSN9atgtfK5yZUo37/bSzdF3e7eFh
 8ptGc8YNssnyBq0EHbDSVFLKZd1VeaZiUXI0zJAtEoio46+Vz4hAzGA4MrGUt/Xnq6/m
 +nFvq6wQpmMwDNlKu+AP6kqwLQRaX2AMla8S7xBNwozP5bQlF7zPH765UBxmP2HwlvN3
 uAe5vphg/g/IHRv799RMM9rvmDBBbULQLPo8L9RscAFUbKRrHiLOXnlGcbEXCcgkmM7d
 Bw4LEdy9iUyQ4KZCHY7lO6I00b/cIhakJL1iRRly0dNEvM4uyyM1ap/v2Rgb/wXNRiZp
 wKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110544;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SfAiYrjkYq3sfZQSOh5fMdoNkVwbWy39/QILbTaZ0W4=;
 b=ROe6FlGWcr9CdTHXmLZn7UMEZHy7fGgJCN1TyX5n6qwgRl+VoNHf1EBc14bC1O24wQ
 nYYJLeDn/BPqBDdIixTuPheF04mzWNXueZhKQyydj6Z0gl/O//MkxKBE0WC2eBE7rg8W
 6jUtbwj0gw8sBgyy2ULiAmZiH1VT8O0LeHBK+m473KxW0bQF825JhY9q3s/J5oFoU+WE
 aAYUFWzVWeETYXDOsLS0y56V+D1LKJaooi5Vy1Iu3d8jGELquS293FxKdOv5qm0AEIqt
 vRmO6kBfBomW1oZGNeDlfK73VSTZ6ktRF/lRkh19y3JR+6KAw0P6aLVeEP/x2rRzw+lu
 q22w==
X-Gm-Message-State: AAQBX9f1Plnn8Wt4C5QAhfTG7yXJcPQYtMn6tiMi3i01FcjBzazoKIxf
 F2T+Y1XFhXe8kj/d1m/ZlYXHbr+Amfw=
X-Google-Smtp-Source: AKy350aFcqLhilvisQ4sdq1oy3k3Is8L7iB4H2Ue01jdc24MFBdPYX7r1UwU6JfVNgvuGLks0tXTK0Gwasc=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:a605:b0:1a1:aea7:6d6d with SMTP id
 u5-20020a170902a60500b001a1aea76d6dmr7043699plq.9.1680110544093; Wed, 29 Mar
 2023 10:22:24 -0700 (PDT)
Date: Wed, 29 Mar 2023 10:22:22 -0700
In-Reply-To: <4a60cf2a-193f-c06c-5747-766bca1ca01f@redhat.com>
Mime-Version: 1.0
References: <20230329135401.105592-1-christian.koenig@amd.com>
 <46f01fc0-ec64-c215-b027-bd748711e6d8@redhat.com>
 <0080e53d-b597-ad34-7e66-6384cae456ae@redhat.com>
 <cf2f0771-39b0-49d6-011c-66b60b6a95c9@gmail.com>
 <ab8ed64b-5c4a-4948-7067-bac5351a45f0@redhat.com>
 <7e2845db-0a8c-c9f2-b858-89d7cb09d098@gmail.com>
 <4a60cf2a-193f-c06c-5747-766bca1ca01f@redhat.com>
Message-ID: <ZCRzzi7bmDyOra4X@google.com>
Subject: Re: [PATCH] drm/ttm: set TTM allocated pages as reserved
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Pierre-eric.Pelloux-prayer@amd.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, npiggin@gmail.com,
 David Stevens <stevensd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+David

On Wed, Mar 29, 2023, Paolo Bonzini wrote:
> On 3/29/23 18:43, Christian K=EF=BF=BDnig wrote:
> > >=20
> > >=20
> > > 3) other uses of kmap() must switch to MMU-notifier protection.
> >=20
> > I would rather suggest to return the page additionally to the pfn from
> > hva_to_pfn() when the function was able to grab a reference to it.
> >=20
> > When the page is then not available you can't call kmap() on that eithe=
r.
> >=20
> > >=20
> > > If the DRM people are okay with SetPageReserved() as a temporary
> > > hack, we can change or remove the WARN in kvm_is_zone_device_page(),
> > > since that is what you are referring to in the commit message.
> >=20
> > Adding Daniel for additional comments on this, but essentially we have
> > changed quite some infrastructure to make sure that everybody uses
> > VM_PFNMAP to prevent stuff like this from happening.
> >=20
> > I would really prefer a proper solution in KVM instead.
>=20
> Hmm... Now that I think about it that would be
>=20
> https://lore.kernel.org/kvm/Yc4H+dGfK83BaGpC@google.com/t/
>=20
> Time to resurrect that work.

Ya.  I had previously asked David to first eliminated the usage that isn't
protected by mmu_notifiers, but after seeing the resulting complexity, I ha=
d a
change of heart[2].  Can you weigh in on the latter thread, specifically my
proposal of using a module param to let the admin opt-in to "unsafe" kmap u=
sage.

[1] https://lore.kernel.org/kvm/Ydhq5aHW+JFo15UF@google.com
[2] https://lore.kernel.org/all/ZBEEQtmtNPaEqU1i@google.com/
