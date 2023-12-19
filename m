Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C498184B7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 10:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4820610E449;
	Tue, 19 Dec 2023 09:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D7910E44B;
 Tue, 19 Dec 2023 09:45:55 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3b9f11fee25so447571b6e.1; 
 Tue, 19 Dec 2023 01:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702979154; x=1703583954; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MkQbC/xyNrZkIWiwDp6IMwy7SGyY0b5UmnK4l5m5LgI=;
 b=SlY2OVD3gTsznS/iL0YeCy2Vqz7zMZ6K54Gqnb2BR52bDYcXnuDX/tkq6aW2NW2O6s
 IEi2K7Qpy0RNJTwDwVJ5siPwGuED+BnB3zilnMPHoavpP7JGml7rfzSK00orkRsy6/5o
 9zgu2DtQ+3XSVC8fACNnDfZB4LpXS7NWPNoPRWjAEy29LVUnZEqeX3dnxifKSFIxSC0x
 Xr7e1g+u0goa9LoDd77KiG9hLfgfM6nnJQMIfSzfYwb9L3VJcf2oYe9OmU6aO+7iWN6F
 lpn2tYsuVD3cMPOj4yskYi18TUgFZhNN9ADM3SelDuIbqiQyZRtPnbz+R6YteL+1hsig
 HJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702979154; x=1703583954;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MkQbC/xyNrZkIWiwDp6IMwy7SGyY0b5UmnK4l5m5LgI=;
 b=Rh6YqWpQ2SPSdeETuuQZ4r3hRp9h1z1chpjAYZCgMojguzJBoAc/u746sWNxT/zg9b
 NoMPv+ajw6hVQn0/7pSsbs4HVrwl2R4pHv98HdxYEo5793Mxo/1tmGSF2THEWXwrfLMd
 n5OunMxlrHYF0tr2yLKzKO/t2FCyusQ/Vs5OGDqZi1I9imy6GWpb2eOqP+X1uBO+9nY7
 2pBq2kWxdEVrbsK6e9PVzpElNps1shQrLe2Vp5Dbx9ynJFVVi7lWDWiwqCfoJGDeXNIa
 k63SajjlswS4gfHPIz5LOvSBe4ljiX0Z68GO6NFioIgQTHrEPhBtbK7VeUYdWuMLaPrx
 ojGQ==
X-Gm-Message-State: AOJu0YxWCQs2KwVAqbanWVa/+HgP3PKYgBHCuq4onsYj02vw9MKjiBeb
 4+XAH3zBO9bCFmN3yXe+zSp/5l711OuXWfTW8qc=
X-Google-Smtp-Source: AGHT+IGGNEiDhBcG8iHFE34HsdZISle57F+NS7CHQs5424Fk99e58FsftGrr8GxBUXq4xroikWAXO3kHBVOTaP4Fpj4=
X-Received: by 2002:a05:6808:20a2:b0:3b9:de19:2fb9 with SMTP id
 s34-20020a05680820a200b003b9de192fb9mr34191884oiw.3.1702979154479; Tue, 19
 Dec 2023 01:45:54 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsMbqw2qzWSCDfp3cNrYVJ1oxLv8Aixfm_Dt91x1cvFX4w@mail.gmail.com>
 <a99e6def-68be-3f2b-4e01-ac26cdb80f49@gmail.com>
 <CABXGCsM7JPxtQm6B7vk+ZcXfphgQm=ArJZKiDUdbk9hujyRtmg@mail.gmail.com>
 <43016018-4d0a-94dc-ce93-b4bff2dce71c@gmail.com>
 <90b1c9f8-1674-e9ec-e6d8-2fa1967439b3@gmail.com>
 <CABXGCsN2NutEmi==JBDD5G2Bj=DJ6vm87_Cbubycz-WowUOh5w@mail.gmail.com>
 <e2975d53-840c-a104-8b2d-c302f502c894@gmail.com>
 <CABXGCsOJkF=c4B+oQm7cuEO7Fr_oknmH2iB6e6OCzmFy=KYtAw@mail.gmail.com>
 <5cbba992-c4ce-01c1-2691-ed65ce66aad5@gmail.com>
 <CABXGCsMBWwRFRA+EJKF0v6BwZ+uTQHr4Yn9E9_iYgZ6KRbwsJQ@mail.gmail.com>
 <8bce512e-abb6-495d-85a4-63648229859e@gmail.com>
In-Reply-To: <8bce512e-abb6-495d-85a4-63648229859e@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 19 Dec 2023 14:45:43 +0500
Message-ID: <CABXGCsNAP_FOTOkNZ+BuJcPH8p1qpVsdiCyUEw9QWzJv81ut6w@mail.gmail.com>
Subject: Re: amdgpu didn't start with pci=nocrs parameter, get error "Fatal
 error during GPU init"
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 5:37=E2=80=AFPM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> I have no idea :)
>
>  From the logs I can see that the AMDGPU now has the proper BARs assigned=
:
>
> [    5.722015] pci 0000:03:00.0: [1002:73df] type 00 class 0x038000
> [    5.722051] pci 0000:03:00.0: reg 0x10: [mem
> 0xf800000000-0xfbffffffff 64bit pref]
> [    5.722081] pci 0000:03:00.0: reg 0x18: [mem
> 0xfc00000000-0xfc0fffffff 64bit pref]
> [    5.722112] pci 0000:03:00.0: reg 0x24: [mem 0xfca00000-0xfcafffff]
> [    5.722134] pci 0000:03:00.0: reg 0x30: [mem 0xfcb00000-0xfcb1ffff pre=
f]
> [    5.722368] pci 0000:03:00.0: PME# supported from D1 D2 D3hot D3cold
> [    5.722484] pci 0000:03:00.0: 63.008 Gb/s available PCIe bandwidth,
> limited by 8.0 GT/s PCIe x8 link at 0000:00:01.1 (capable of 252.048
> Gb/s with 16.0 GT/s PCIe x16 link)
>
> And with that the driver can work perfectly fine.
>
> Have you updated the BIOS or added/removed some other hardware? Maybe
> somebody added a quirk for your BIOS into the PCIe code or something
> like that.

No, nothing changed in hardware.
But I found the commit which fixes it.

> git bisect unfixed
92e2bd56a5f9fc44313fda802a43a63cc2a9c8f6 is the first fixed commit
commit 92e2bd56a5f9fc44313fda802a43a63cc2a9c8f6
Author: Vasant Hegde <vasant.hegde@amd.com>
Date:   Thu Sep 21 09:21:45 2023 +0000

    iommu/amd: Introduce iommu_dev_data.flags to track device capabilities

    Currently we use struct iommu_dev_data.iommu_v2 to keep track of the de=
vice
    ATS, PRI, and PASID capabilities. But these capabilities can be enabled
    independently (except PRI requires ATS support). Hence, replace
    the iommu_v2 variable with a flags variable, which keep track of the de=
vice
    capabilities.

    From commit 9bf49e36d718 ("PCI/ATS: Handle sharing of PF PRI Capability
    with all VFs"), device PRI/PASID is shared between PF and any associate=
d
    VFs. Hence use pci_pri_supported() and pci_pasid_features() instead of
    pci_find_ext_capability() to check device PRI/PASID support.

    Signed-off-by: Vasant Hegde <vasant.hegde@amd.com>
    Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
    Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
    Link: https://lore.kernel.org/r/20230921092147.5930-13-vasant.hegde@amd=
.com
    Signed-off-by: Joerg Roedel <jroedel@suse.de>

 drivers/iommu/amd/amd_iommu_types.h |  3 ++-
 drivers/iommu/amd/iommu.c           | 46 ++++++++++++++++++++++-----------=
----
 2 files changed, 30 insertions(+), 19 deletions(-)


> git bisect log
git bisect start '--term-new=3Dfixed' '--term-old=3Dunfixed'
# status: waiting for both good and bad commits
# fixed: [33cc938e65a98f1d29d0a18403dbbee050dcad9a] Linux 6.7-rc4
git bisect fixed 33cc938e65a98f1d29d0a18403dbbee050dcad9a
# status: waiting for good commit(s), bad commit known
# unfixed: [ffc253263a1375a65fa6c9f62a893e9767fbebfa] Linux 6.6
git bisect unfixed ffc253263a1375a65fa6c9f62a893e9767fbebfa
# unfixed: [7d461b291e65938f15f56fe58da2303b07578a76] Merge tag
'drm-next-2023-10-31-1' of git://anongit.freedesktop.org/drm/drm
git bisect unfixed 7d461b291e65938f15f56fe58da2303b07578a76
# unfixed: [e14aec23025eeb1f2159ba34dbc1458467c4c347] s390/ap: fix AP
bus crash on early config change callback invocation
git bisect unfixed e14aec23025eeb1f2159ba34dbc1458467c4c347
# unfixed: [be3ca57cfb777ad820c6659d52e60bbdd36bf5ff] Merge tag
'media/v6.7-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect unfixed be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
# fixed: [c0d12d769299e1e08338988c7745009e0db2a4a0] Merge tag
'drm-next-2023-11-10' of git://anongit.freedesktop.org/drm/drm
git bisect fixed c0d12d769299e1e08338988c7745009e0db2a4a0
# fixed: [4bbdb725a36b0d235f3b832bd0c1e885f0442d9f] Merge tag
'iommu-updates-v6.7' of
git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
git bisect fixed 4bbdb725a36b0d235f3b832bd0c1e885f0442d9f
# unfixed: [25b6377007ebe1c3ede773fd6979f613386db000] Merge tag
'drm-next-2023-11-07' of git://anongit.freedesktop.org/drm/drm
git bisect unfixed 25b6377007ebe1c3ede773fd6979f613386db000
# unfixed: [67c0afb6424fee94238d9a32b97c407d0c97155e] Merge tag
'exfat-for-6.7-rc1-part2' of
git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat
git bisect unfixed 67c0afb6424fee94238d9a32b97c407d0c97155e
# unfixed: [3613047280ec42a4e1350fdc1a6dd161ff4008cc] Merge tag
'v6.6-rc7' into core
git bisect unfixed 3613047280ec42a4e1350fdc1a6dd161ff4008cc
# fixed: [cedc811c76778bdef91d405717acee0de54d8db5] iommu/amd: Remove
DMA_FQ type from domain allocation path
git bisect fixed cedc811c76778bdef91d405717acee0de54d8db5
# unfixed: [b0cc5dae1ac0c18748706a4beb636e3b726dd744] iommu/amd:
Rename ats related variables
git bisect unfixed b0cc5dae1ac0c18748706a4beb636e3b726dd744
# fixed: [5a0b11a180a9b82b4437a4be1cf73530053f139b] iommu/amd: Remove
iommu_v2 module
git bisect fixed 5a0b11a180a9b82b4437a4be1cf73530053f139b
# fixed: [92e2bd56a5f9fc44313fda802a43a63cc2a9c8f6] iommu/amd:
Introduce iommu_dev_data.flags to track device capabilities
git bisect fixed 92e2bd56a5f9fc44313fda802a43a63cc2a9c8f6
# unfixed: [739eb25514c90aa8ea053ed4d2b971f531e63ded] iommu/amd:
Introduce iommu_dev_data.ppr
git bisect unfixed 739eb25514c90aa8ea053ed4d2b971f531e63ded
# first fixed commit: [92e2bd56a5f9fc44313fda802a43a63cc2a9c8f6]
iommu/amd: Introduce iommu_dev_data.flags to track device capabilities

--=20
Best Regards,
Mike Gavrilov.
