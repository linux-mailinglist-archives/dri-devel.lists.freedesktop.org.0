Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9733334C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 03:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661EC6E18F;
	Wed, 10 Mar 2021 02:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic310-25.consmr.mail.ne1.yahoo.com
 (sonic310-25.consmr.mail.ne1.yahoo.com [66.163.186.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FB76E18F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 02:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1615344613; bh=XCfXkK4BiDMzp82jTEMs8Mv5duQH3+NQE3G2gFQJEPc=;
 h=From:To:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=TrDYdBMtzIOtus/JMLChr7wcJ2ECico1CNJ1QgD2zN7XBjz3qDBYhgSQHoXPIyctL+TveBA2QceVD9csCU/zLMyRxP5eVVBpS/cseS+avJvq5M3hlbUD4j5jlKViacQoqNWMqvW4w6SM9jz83wBijb7Ll9AQjEbjjveFInKIWELi/B5Ys5nDhqRn65nPn+9QjBNCy2/OixDwAWdgyxD8ITPSOMQMUzFfu3GPCuKj8WNWiW8wXr0tyrIUlKMueaUXoDpTFflzYFDth5Sc4jvTrlASNteGXAtBl959pcJtV7aWJdHDp7H0+jKXYO8Mmu3Nor6tUeQhqozw7VZ3mEJsiA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1615344613; bh=iUAfY8MaPxm7rfxVl2QDG6xUx5xm9eAIibdBhghszCm=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=kP0LPCH/vHvAjxoFmChSh20r06voSbqy1NGtLyqzsqYWTUUqHSU+3QMQlXivIeaV2p/8B1VO9HxXR2a38uM7DIDiDUKi1gn5tQ5JfYr/+TsvEeCDFDAOGuhBYyLIs9UUTmlIW8APzUIxJqhw35P2GPsRk/9eHwQQ3+GVrhorWLKoPRozzPuIXLEll1tmVXzcFd87qBuzL+2Mga1T0TuC9FqAtK+DfIrI3Ra8mAb3iwWmg1BRgLoYbH9A4y1j27/p1gh1n/52AqNydcb3hIoX1X/kSofEK7uCxlQVMuySHaGrFMu8ht60NPPPffwlS6bp5UW/eETlozL0tV0TcbRTKw==
X-YMail-OSG: P2.K2gMVM1nnfOxUoGVkfDOg5ByaWsx2MG94udc_yQlmoIYbzQBwaSGpurYHPFd
 yHhB2c.ub2CfujLwhhfzQHXqVR8HhxE7e.V_5j7yrnWPJ2YkWOxQa6eNembIm4l53kV8d_XfcoD3
 5oKhNGzAV7yMbPihNnHS6aNw92mHcuaxLj.aE3iBrFwk5zdCo4lytxg4ys9tg2ryvQbtHIj0rBTh
 znTM3gjueEL.G6PTHYgsgoDxyThH9.yatzGRuhhtH41lN0o2F40WGgRkXchzbCV_bsp.9QqC.tZ4
 xENi8XPJjJuOIJEYFt9m7tju.8s44ZlXDETWULKjOTDhlsxMnWhckJDkNaNXmvnA4G_MJ8dMCWxn
 fVDLUz4TPwvhBoAj97KUiBV3CNfeedz43B_IaaVzmcyu0c5_K3noR2GFgY1K61aDk8PEaQPDp3mp
 mdAUV3T7FYRuwKSTV02KaDPZoRIwpbE0qIRFNebx.93V2TisgsVusHIhHkmRLK0yaELD81mqv1AE
 J7mAMBuv1PfuZ7X9EyXpnDzifD4vRVuR_sCt.YaGyejrEzssohlCB_V64UwMJ_rmJ9GhKryE8188
 gUIAJwWQHRcTHa_wNnwhqE9GfmIfBXs1KAxafPRmk_wKNL.l3_rQw1wEVfI_leppNSjv3sLwqw_c
 vMigBh3qZ5QphlqKqM6Vg1njbx765XdWWzjRAaofi2hWIt0qhhgT77C8obqeR3BWahuJ.WlXJ43f
 gmebMPML_rMyDD_JGjxmesZZ04TtJyTq4L61klsGDTAKyBtZP.IbUyMHkP7iQ.MuHsu.5T4L3XeO
 CJJS1ekhEmtUCXNzHzjv_QlTdsFhGqOflUIEDStjI19GiE_RwB.f5mlaR4fFxuLSwBRbqm6VJ06s
 moY0hpbyiMJdBZLhJfSZR5vinBp4NvKzLh8e9CantP3.YBvJD3e8d7ZqRdMlfd2TcVgUD.L1Jkr2
 dE13DopwVNtRqNhmZYF3FArUE5BU3N2AMu4fz8424VLlFwvIM1QTkCUYSJad0UpfJn8.Ez_Djmn3
 .1XWrQmGR2_8UvYzZAsaldor4O3pAnKXvNkYq2dq0Pl3emzdzkHe.1tWOuz66kkQFXJorxAXOFTk
 Jz.DDrwu.iN0u6Hj4MyYV2c9sJ_U2Wa5GKQ5b_6ShfCb0pTHTxyAMp4rfPS4s92mE1DFT47gKrQL
 fVuGIvkHqP8Nf5akFEGxYJUPg6MO6VOE_80xHr8qbfZzNJ5PPkhs4OxoSU49LaPfV9R7itYO4y3N
 1uscI12M7Zx2kGwROGr4GubS0rnGNrvmUfjJG3icW9O8Z4v.VyR.lp9XD6lRTUy2d3DiOrBhlcGP
 y9ZfVJZ9qD3OqIwZs9iooR4La3lZhMetuIAF68OaWmm1LhvA7ej3WpTQks6xm6oZtCpqJKK7qph0
 AUbr_V0_oBMVCUNpLYCEtdQIljQcVeDsSXGHWqxtpIZxVtPA.zoz8.dI5oSTr5DlATjrzWH5Y5KG
 J.Qo1lwBuTOVQ.HVxwZT4F71FhhJagdAHlyXZhWAbI2TUFZU7qR1Iwk1bVNgYyR7khI_AV5icT.k
 uO8vrfaJTMenPOCGwq0WULx5UluBR9SxBalF07AbohaBPRFSxe154pEXZgLoi32Llid5upah3ntC
 .izLf8_lF7qupvlpS8YLWnMVEDfWBMMwKJtb8tXRz.sbwpjlBpkxo2Tyd2Kw9mhyMioxnTSJYD7t
 EBM8zDDELA1Bq7YyXDTm3SW.pQwnjKeW2Gk8tupocx11r1xYg0CEEUrpZ6m8kGp6CzYY5qdf2GrZ
 xyyz9MOrOZ66Cu8U.lKcFS_ByX7TlQKeOb8ecWori78QszqpOu1dM7kJin6.EgMSxyfvc25JFcGy
 mVpZf4moW9EH2GF3TI4afy6xzMW6MJhmXzVodjIYHRfSV5PKiEmT1jlKyuu7qwZtB7NJjGd7YZUN
 .sMAptKOSyVEdpV9jV6wmgd3Zn7j3HH52ID1kWkSNDRCcEMp3TK6kyGAvbxryAiBT6pIcoUhQ4rg
 7k14OLkIlFyRGtm5I9pLOBRVLlxwGJt88qxmK1yTAI_Yr_oW11.TSVO6txak5sATZNyF.ngcNEal
 Wu7HQet5_j2LPFr5g6beut9BWLHNugvUH6YbTOzOU0Zgq2MXtuZC1NExumhdpbuf7kKgTXuSLaCl
 xBCs.X.bkJd2gZe.cLHKh_H1lD5lwhmQiMxjz6TMmngPYK5QRhqrgeNgHnvlbXnKqhIylSuzfExQ
 fjs8qly.QdaufLw3b3DvTuEqsU6vO_LMy4myM8iHB9qqVkeD.tA_LsOM9jnGAKQteR1myq0w8fa5
 mfg92tEpBY88jWWTcIyxl0ixRi0Wtw2IC6ZsP9xW5rdNML_NuaYpMom8ZFNrDXqfTulxXPu9asKP
 Zvvj3BMA.KZPzlYZdA4_.F7cIvR1P.p4VcjsVfBToBdA0TfXpbr65EJ5FUcE0.bU-
X-Sonic-MF: <bluescreen_avenger@verizon.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ne1.yahoo.com with HTTP; Wed, 10 Mar 2021 02:50:13 +0000
Received: by smtp409.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 56463bb45baba4be7c0ad1980d1dd07f; 
 Wed, 10 Mar 2021 02:50:10 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 0/7] drm: add simpledrm driver
Date: Tue, 09 Mar 2021 21:50:09 -0500
Message-ID: <1819978.CKrAbXhGjX@nerdopolis>
In-Reply-To: <20160902082245.7119-1-dh.herrmann@gmail.com>
References: <20160902082245.7119-1-dh.herrmann@gmail.com>
MIME-Version: 1.0
X-Mailer: WebService/1.1.17872
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
 Apache-HttpAsyncClient/4.1.4 (Java/11.0.9.1)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, September 2, 2016 4:22:38 AM EST David Herrmann wrote:
> Hey
> 
> On request of Noralf, I picked up the patches and prepared v5. Works fine with
> Xorg, if configured according to:
>     https://lists.freedesktop.org/archives/dri-devel/2014-January/052777.html
> If anyone knows how to make Xorg pick it up dynamically without such a static
> configuration, please let me know.
> 
> Thanks
> David
> 
> David Herrmann (7):
>   x86/sysfb: add support for 64bit EFI lfb_base
>   x86/sysfb: fix lfb_size calculation
>   of/platform: expose of_platform_device_destroy()
>   video: add generic framebuffer eviction
>   drm: switch to sysfb_evict_conflicts()
>   drm: add SimpleDRM driver
>   drm/simpledrm: add fbdev fallback support
> 
>  MAINTAINERS                                  |   6 +
>  arch/x86/kernel/sysfb_simplefb.c             |  39 ++-
>  drivers/gpu/drm/Kconfig                      |   3 +
>  drivers/gpu/drm/Makefile                     |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      |  24 +-
>  drivers/gpu/drm/bochs/bochs_drv.c            |  19 +-
>  drivers/gpu/drm/i915/i915_drv.c              |  73 +---
>  drivers/gpu/drm/mgag200/mgag200_drv.c        |  27 +-
>  drivers/gpu/drm/mgag200/mgag200_main.c       |   9 -
>  drivers/gpu/drm/nouveau/nouveau_drm.c        |  33 +-
>  drivers/gpu/drm/radeon/radeon_drv.c          |  24 +-
>  drivers/gpu/drm/simpledrm/Kconfig            |  19 ++
>  drivers/gpu/drm/simpledrm/Makefile           |   9 +
>  drivers/gpu/drm/simpledrm/simpledrm.h        |  91 +++++
>  drivers/gpu/drm/simpledrm/simpledrm_damage.c | 194 +++++++++++
>  drivers/gpu/drm/simpledrm/simpledrm_drv.c    | 477 +++++++++++++++++++++++++++
>  drivers/gpu/drm/simpledrm/simpledrm_fbdev.c  | 143 ++++++++
>  drivers/gpu/drm/simpledrm/simpledrm_gem.c    | 109 ++++++
>  drivers/gpu/drm/simpledrm/simpledrm_kms.c    | 270 +++++++++++++++
>  drivers/gpu/drm/simpledrm/simpledrm_of.c     | 265 +++++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_drv.c            |  24 +-
>  drivers/gpu/drm/vc4/vc4_drv.c                |  25 +-
>  drivers/gpu/drm/virtio/virtgpu_drm_bus.c     |  24 +-
>  drivers/of/platform.c                        |  35 +-
>  drivers/video/Kconfig                        |   4 +
>  drivers/video/Makefile                       |   1 +
>  drivers/video/sysfb.c                        | 327 ++++++++++++++++++
>  include/linux/of_platform.h                  |   1 +
>  include/linux/sysfb.h                        |  34 ++
>  29 files changed, 2054 insertions(+), 256 deletions(-)
>  create mode 100644 drivers/gpu/drm/simpledrm/Kconfig
>  create mode 100644 drivers/gpu/drm/simpledrm/Makefile
>  create mode 100644 drivers/gpu/drm/simpledrm/simpledrm.h
>  create mode 100644 drivers/gpu/drm/simpledrm/simpledrm_damage.c
>  create mode 100644 drivers/gpu/drm/simpledrm/simpledrm_drv.c
>  create mode 100644 drivers/gpu/drm/simpledrm/simpledrm_fbdev.c
>  create mode 100644 drivers/gpu/drm/simpledrm/simpledrm_gem.c
>  create mode 100644 drivers/gpu/drm/simpledrm/simpledrm_kms.c
>  create mode 100644 drivers/gpu/drm/simpledrm/simpledrm_of.c
>  create mode 100644 drivers/video/sysfb.c
>  create mode 100644 include/linux/sysfb.h
> 
> 
Hi

I am kind of curious as I do have interest in seeing this merged as well. 

There is an email in this thread from 2018, but when I tried to import an mbox
file from the whole month for August 2018, for some reason, kmail doesn't see 
the sender and mailing list recipient in that one, so I will reply to this one,
because I was able to import this into my mail client. 
https://www.spinics.net/lists/dri-devel/msg185519.html

I was able to get this to build against Linux 4.8, but not against a newer
version, some headers seem to have been split, and some things are off by 8
and other things. I could NOT find a git repo, but I was able to find the 
newest patches I could find, and import those with git am against 4.8 with
some tweaks. If that is needed, I can link it, but only if you want.

However in QEMU I wasn't able to figure out how to make it create a 
/dev/dri/card0 device, even after blacklisting the other modules for qxl, 
cirrus, etc, and then modprobe-ing simpledrm

In my view something like this is would be useful. There still could be 
hardware devices that don't have modesetting support (like vmvga in 
qemu/virt-manager as an example). And most wayland servers need a 
/dev/dri/card0 device as well as a potential user-mode TTY replacement would
also need /dev/dri/card0

I will admit I unfortunately failed to get it to build against master. I 
couldn't figure out some of the changes, where some new structs were off by
a factor of 8. 


Thanks



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
