Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95616CF13E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 19:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1F310EBD9;
	Wed, 29 Mar 2023 17:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1964010EBE5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 17:39:43 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5458dde029bso163740477b3.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 10:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680111582;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=rKUZwXO4eu1KrVRThRIUC8dswnDcFstDLCSkCZwVrBc=;
 b=ru8VKbIm2uC4fJ+yeTntLLM92QWCeHH5ZBo7GzCZaX31Gu2LVZrJuCCY4wQIfunoaz
 TLcGVn9w2pmm7pjq3uFFD9j3d15XbumwrhjBJFEWX7KgAE8jZFp2iy/i4tavVNpoap3y
 GvYdiRnI9c+gz5K3xIFYJUb0sI5in0AcxdHOmZFr34jryAWnCuYZmEQ1UbD1NL7lxjR4
 vgfnwmvvoDVHmSuoHuopmagsvWuM+FxlYDcETaSI+WmrA0zdGcm8WLZSFCeKhTP4qBbl
 Y3XdZACjsxo++7M3znZe1hE/4M0267u9apCV/HWI2tusBMCMyyN2/RC+5fkkIweD+k/d
 zqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680111582;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rKUZwXO4eu1KrVRThRIUC8dswnDcFstDLCSkCZwVrBc=;
 b=Ie/AOJK31R0CkollmBW6T2LD09fZ/ufzjsdPJdb9MwA7kUif08ChuhBX0KXCcs3adi
 O/cG5bATgsIch5+mpMDy7Lriehfml516486E9pNHdkFMTbnA6VKHoq8vFEQ8A1u1RUMt
 nyPeNd6bIm729Aii+n5H7/lxhRwanj2jFPUcRzDLvvXUx61gwCgx+0U2BnqbRFV1yN0b
 UATj+q936zOI8uTZglbjl2zuTMqDdP5/670JvkyRm4Wgid4Q2sKT6zkuVCzxUz4DXmc1
 sMc8p5razrTfs0D35sjtc/7j8fHwOJbqsKd828FZQs3J2KzqThz3TRxPZiGb1nDPUDVD
 6PdA==
X-Gm-Message-State: AAQBX9fSRLrgX83rFQY4xNsSFPNCIcUM3NuoRILq8Vktg3Z2gvdGoYth
 uA3YRxqba/3BWLiINoRgTEn+KzVLZTA=
X-Google-Smtp-Source: AKy350aFGM+LCacZ4jJ5xhYOuPXFPlSQAX/EMJwVofB5g/ww5gqiGQfAtvev48irbHZk4mJ+7FaCj2p53JE=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1586:b0:b77:676c:773c with SMTP id
 k6-20020a056902158600b00b77676c773cmr13603145ybu.2.1680111582365; Wed, 29 Mar
 2023 10:39:42 -0700 (PDT)
Date: Wed, 29 Mar 2023 10:39:40 -0700
In-Reply-To: <980e7a13-ea49-70de-700c-597ad7a4e103@gmail.com>
Mime-Version: 1.0
References: <20230329135401.105592-1-christian.koenig@amd.com>
 <46f01fc0-ec64-c215-b027-bd748711e6d8@redhat.com>
 <0080e53d-b597-ad34-7e66-6384cae456ae@redhat.com>
 <cf2f0771-39b0-49d6-011c-66b60b6a95c9@gmail.com>
 <ab8ed64b-5c4a-4948-7067-bac5351a45f0@redhat.com>
 <7e2845db-0a8c-c9f2-b858-89d7cb09d098@gmail.com>
 <4a60cf2a-193f-c06c-5747-766bca1ca01f@redhat.com>
 <ZCRzzi7bmDyOra4X@google.com> <980e7a13-ea49-70de-700c-597ad7a4e103@gmail.com>
Message-ID: <ZCR33FvKsvEmDLRQ@google.com>
Subject: Re: [PATCH] drm/ttm: set TTM allocated pages as reserved
From: Sean Christopherson <seanjc@google.com>
To: "Christian =?iso-8859-1?Q?K=F6nig?=" <ckoenig.leichtzumerken@gmail.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Stevens <stevensd@chromium.org>,
 dri-devel@lists.freedesktop.org, npiggin@gmail.com,
 Pierre-eric.Pelloux-prayer@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023, Christian K=EF=BF=BDnig wrote:
> Am 29.03.23 um 19:22 schrieb Sean Christopherson:
> > +David
> >=20
> > On Wed, Mar 29, 2023, Paolo Bonzini wrote:
> > > On 3/29/23 18:43, Christian K=EF=BF=BDnig wrote:
> > > > >=20
> > > > > 3) other uses of kmap() must switch to MMU-notifier protection.
> > > > I would rather suggest to return the page additionally to the pfn f=
rom
> > > > hva_to_pfn() when the function was able to grab a reference to it.
> > > >=20
> > > > When the page is then not available you can't call kmap() on that e=
ither.
> > > >=20
> > > > > If the DRM people are okay with SetPageReserved() as a temporary
> > > > > hack, we can change or remove the WARN in kvm_is_zone_device_page=
(),
> > > > > since that is what you are referring to in the commit message.
> > > > Adding Daniel for additional comments on this, but essentially we h=
ave
> > > > changed quite some infrastructure to make sure that everybody uses
> > > > VM_PFNMAP to prevent stuff like this from happening.
> > > >=20
> > > > I would really prefer a proper solution in KVM instead.
> > > Hmm... Now that I think about it that would be
> > >=20
> > > https://lore.kernel.org/kvm/Yc4H+dGfK83BaGpC@google.com/t/
> > >=20
> > > Time to resurrect that work.
> > Ya.  I had previously asked David to first eliminated the usage that is=
n't
> > protected by mmu_notifiers, but after seeing the resulting complexity, =
I had a
> > change of heart[2].  Can you weigh in on the latter thread, specificall=
y my
> > proposal of using a module param to let the admin opt-in to "unsafe" km=
ap usage.
>=20
> I don't think that this is something an admin should be able to decide.

Why not?  Assuming the admin has CAP_SYS_ADMIN, they can reboot the host in=
 a
myriad of ways.  The idea with the KVM module param is to allow curated set=
ups
where the userspace VMM is trusted to a large extent, e.g. AWS' Nitro, to o=
pt-in
to the unsafe behavior.  I.e. by enabling the flag, the admin is acknowledg=
ing
that bad things can happen if untrusted/compromised userspace gets ahold of
/dev/kvm.

> x86 system are rather grateful, but if you kmap() pages accessed by GPUs =
on
> ARM the system might just reboot spontaneously.

FWIW, the dangers of an unsafe kmap() are arguably far worse than spontaneo=
us
reboots, e.g. there's potential for use-after-free and possibly even write =
access
to arbitrary memory.
