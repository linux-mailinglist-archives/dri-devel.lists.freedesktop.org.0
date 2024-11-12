Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B039C5A85
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 15:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050AC10E048;
	Tue, 12 Nov 2024 14:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XDW0tpaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B1B10E048
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731422309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OosTLshp4/x2QvoY6SGsLv1aK4oQibARJhy5rL9XreI=;
 b=XDW0tpaROAFAaxoFq6PH0eKrjL+66VQOBr6UE757ZcRUao0OFBqMSA9cXMLcaJCI3bfeeL
 9ASR2QieA7+AwmHUhBPHKQQyrALwNhm/GqmCImN3Su9VsSFMyLwwsCVFpTKFfOpR94SASr
 SvuYXOTfSTKnhkkbKWj7VcwbG8xV1Dw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-f8m_ArkgPeWMXLvf4gbYlw-1; Tue, 12 Nov 2024 09:38:27 -0500
X-MC-Unique: f8m_ArkgPeWMXLvf4gbYlw-1
X-Mimecast-MFC-AGG-ID: f8m_ArkgPeWMXLvf4gbYlw
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d43e7acd9so3125382f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 06:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731422306; x=1732027106;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OosTLshp4/x2QvoY6SGsLv1aK4oQibARJhy5rL9XreI=;
 b=Z+CXSvGN7uT0dGosJvgnbqTICnp0Toc05yLdRy8RXwiBVRrZz/D496y6gsLRQqnu+N
 xEUVNXS7jhmN0vJRl7oVPEQTD8yNLsMn7kVCMSJYsQChu1hCT7Mn4D2mD4+l1wnaskAj
 P8K2HUZWc3H0Nuy7UIR/XH9NgOPC2RM3wBF9rv7AFNLACr30LHz7BAmx9roioLmA6J8r
 ESG/Sqsu56oyh5ZYxdPgyulZmvbRUlgpU/Y0AqYbztm2y0fDI+QZ8yogHnQNVUb6m437
 4pkrBEjsYJhfl7Y0atomKIX0PDPehRSxyos6TFr0gLdt6wX56Zz6cRoHmQEOUrQSB0jA
 jtrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAeYpohchShDU2CX5TdVG+qr/aatmfUFFWIHBSHXo0E/v9RiZWxtJcgvgRk/oj+QczDlYRNgfK8t8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgA3xMf5wQjJcRbHI4sBQ3e40hs3QSO6X2QI58rjNOo890s35Q
 m/JfNs0iHgaKOPtulHAmrWBKzkEg4BdQmg4Z3l30YUG522MCX3Frty2DaW7WotVN248jziXxyHX
 Z0GHbphX71YrSlpx4b/DAL3d40weN0tR/aymtDIshh+AXhp6P7pgFwxI5cSFJh6wLQv7+sHnROg
 ==
X-Received: by 2002:a5d:5f53:0:b0:37d:45ab:4241 with SMTP id
 ffacd0b85a97d-381f1866f9dmr14891545f8f.12.1731422305670; 
 Tue, 12 Nov 2024 06:38:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOjJqV1/2yQvJMahNwjTM+hPBOadmmtoRh85RX5Cq6B09Wy9R7IM311Ul5Qw3fZ6kKrggVOQ==
X-Received: by 2002:a5d:5f53:0:b0:37d:45ab:4241 with SMTP id
 ffacd0b85a97d-381f1866f9dmr14891526f8f.12.1731422305276; 
 Tue, 12 Nov 2024 06:38:25 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed970729sm15491488f8f.15.2024.11.12.06.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 06:38:24 -0800 (PST)
Message-ID: <0830c7240f624747bdba8d0c28ac87eb010dd586.camel@redhat.com>
Subject: Re: Document drm_sched_fini and add some warnings and a BUG_ON()
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dakr@kernel.org, ltuikov89@gmail.com, simona.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>
Date: Tue, 12 Nov 2024 15:38:23 +0100
In-Reply-To: <ab0007a3-6298-49e4-92d5-0732cbbdbba5@gmail.com>
References: <20240927142755.103076-1-christian.koenig@amd.com>
 <ab0007a3-6298-49e4-92d5-0732cbbdbba5@gmail.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eHE6jbkmdgR-8uZb86oOn3Wn6QE_zmVLi3Da001wOu4_1731422306
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-11-12 at 13:36 +0100, Christian K=C3=B6nig wrote:
> Gentle ping.
>=20
> Dave Philip noted in private chat that you had some comments? I don't
> see anything in my inbox.

Hi,

that was a misunderstanding =E2=80=93 Dave answered on this one:

https://lore.kernel.org/all/CAPM=3D9tzACady1QN_wMaZ_WP3n_pftAGgGkATOQWOG+n+=
Zvjifg@mail.gmail.com/

Regarding drm_sched_fini(), sorry, that got overlooked, I was
travelling when you sent that and wasn't aware of it.

We recently *merged* my own drm_sched_fini() docu improvement:

https://lore.kernel.org/all/1c27295862e10dd958c01ef3ab5ef2f3757e446b.camel@=
redhat.com/

You even reviewed it off-list :)
Do you think we need to rework something in it with a follow-up?

Cheers,
P.

>=20
> Thanks,
> Christian.
>=20
> Am 27.09.24 um 16:27 schrieb Christian K=C3=B6nig:
> > Sorry for sending incomplete patches earlier today, I've messed up
> > my
> > branch and had to re-create it.
> >=20
> > Let's try this again,
> > Christian.
> >=20
> >=20
>=20

