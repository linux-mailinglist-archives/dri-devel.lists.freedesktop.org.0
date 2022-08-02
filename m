Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FFA5881C1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 20:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0BF10FFCC;
	Tue,  2 Aug 2022 18:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB37C10F842
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 18:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659463930;
 bh=/PnZxeTelrU5mVfGxtaJ64m/9eOLaUJbl8usCbg2SNc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LgYRm14MUFte20OCihrkbT74L01b0L2n4utiCpRcUHiuSQudAzvgu8xhPGKzugaoC
 2TEZZENnrx3A919mqPF7IpEqgL1EL0Upk5fgaf1TY8zMooZVXTza69SJVxGSFQYLrb
 R/rY3Y6B4iVm7ZiUKApvBZ69FtTC7xIHDzFsyMFc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [4.28.11.157] ([4.28.11.157]) by web-mail.gmx.net
 (3c-app-mailcom-bs08.server.lan [172.19.170.176]) (via HTTP); Tue, 2 Aug
 2022 20:12:10 +0200
MIME-Version: 1.0
Message-ID: <trinity-bb318071-05ea-48e5-88a0-f4e658791d1f-1659463930841@3c-app-mailcom-bs08>
From: Kevin Brace <kevinbrace@gmx.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Content-Type: text/plain; charset=UTF-8
Date: Tue, 2 Aug 2022 20:12:10 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YukF7guP0EBIz0PT@ravnborg.org>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com>
 <f7a47d59-d4d2-61fb-4e42-1decff2e7d62@suse.de>
 <trinity-e1f9136b-24dd-44ed-861b-a0735c91422e-1659221316349@3c-app-mailcom-bs07>
 <Yufl737qQnxlHeGd@ravnborg.org>
 <trinity-4501b716-d008-4a86-9e0c-681c301e4b87-1659399030120@3c-app-mailcom-bs06>
 <YukF7guP0EBIz0PT@ravnborg.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:+imLnV8mCZCDLW2qEwCEBsTTzky41PXoM4x99Nvp3naQg8t8kYQDCLeetRKWoOTP5IRFv
 cepJkK8EXZ7dHPeH6d56pB3YzRlJ2Z19cnmmRHor4nlPIrPTcIKampSD6Z0fLg99hHCsoTdL3fvI
 ivMBeICDEWBYijkuz4d9gH08DHMNsP11oWgp68dczQCZpodTnaGw2q7ndFTdul8xue3IFUDjvr5E
 KnkOg5iVbDQOpr3SFVezUdw05RsENo8Dqy8jNkzdzDd/G2hmT6DfSm21NMz8/cexbSpu/EDY/Itn
 wU=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:otxCq5Bo4BY=:go5QuWnRKBWFWihuSFWaj+
 gLE3/lFZCAxLuWxd8pCoWFzRj5IFhvzJ7w7Y/wiC1MphVMPIqIhdHaviKerk3XIbr1cLUGnyE
 YdkdBtfYcXOuxZSrIP6S0TPFzv+DaIRhIFgM/dR8V83o69ayFZEun54Ig0SYoTYTJdCUt5XHb
 gk6VmMp49QRqTUmekK/8mHGr0kV4+TFtiLOxOmDPwN/VSr43CLgh5o/Ci1HvoO6gX+GGCNw5i
 SIxB6EYSqWdMn5ly6NYkG1+lKFZL63mWDsbGa35BxQpsa+koPODzIGHCI/wP1KjqbFZTKOz8J
 WIMsi9Tixa+z8mOzvuItB3GsmFLtrZ97xtyhrEVsA8XEJO2lWT/WhJDi9ekRNjw/eWwjHQcHO
 u/b25hDtjv3Li68D7j5B3CplbgatiD/LmV27chCitt+22FgKzXRvZB9r0B3Ph+5xsTwQBwTNp
 vgHxfqYrbNFYB05jSxAoBqmRaoqM8rDPsv29JJw1rpLq+XpIDrHCv0zzIvQH9ArpUC2W7ExAu
 /W/zq/zev7/+p7uJHAXtK7Tk3Q2sZWsOCghP3faMy+GLTRDZ0h0ojusWOH8mvUk3ea67dO7R0
 Odpniipm6iBf56cLTqvhPoeggLvb0pXtx1y2hTAzbOaGzPx3b7rhJ/AheDgxbZZhEc/pxTdAx
 D5KyaLVFbcA6uSAXgNXDivfsK4qDySxXLN1MnAOltF593V91+3WY45qCJ7BwG8aiyKT5FZ3Wr
 zJHkc7hCt17mlR0epK7K5f/60bCGje9KTD7orGgaYtB5drvQQE8tuXjlOsXHqOUSFmoeZNH78
 Dfdym/6
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Regarding DRI1 era uAPI, I believe I am handling the matter similar to how=
 Radeon DRM header (include/uapi/drm/radeon_drm.h) handled the matter.
The header still contains old DRI1 uAPI calls, and it then adds new KMS ge=
neration uAPI calls.
At this point, using drm_invalid_op() for OpenChrome DRM is the least intr=
usive option, and that's the way I will like to keep it.
It is just that I did not know its existence, so it was not in the code.
The older OpenChrome DDX releases might assume uAPI backward compatibility=
, but the use of drm_invalid_op() should gracefully tell the DDX that the =
legacy DRI1 VIA DRM uAPI is no longer supported.
    Personally, I do not anticipate Wayland use with OpenChrome.
It will end up living out its life as X.Org X Server only solution conside=
ring its hardware age.
Although it is somewhat hard, I use Gentoo Linux as development platform f=
or OpenChrome, and 32-bit x86 ISA and X.Org X Server are still fully suppo=
rted.

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab.com


> Sent: Tuesday, August 02, 2022 at 4:09 AM
> From: "Sam Ravnborg" <sam@ravnborg.org>
> To: "Kevin Brace" <kevinbrace@gmx.com>
> Cc: "Thomas Zimmermann" <tzimmermann@suse.de>, dri-devel@lists.freedeskt=
op.org
> Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
>
> Hi Kevin,
> >
> > OpenChrome DDX carries lots of legacy code.
> >
> > https://cgit.freedesktop.org/openchrome/xf86-video-openchrome/tree/src=
/via_drm.h?h=3Dmain&id=3Ddc661c59257e855cd9b29c14b91a8ee2d9b86ccb
> >
> > There is a requirement to use the same via_drm.h with both DDX and DRM=
.
> > Hence, I need to keep a lot of the legacy DRI1 definitions inside via_=
drm.h.
>
> This part is fully understood. Also on top of this the via DRI1 driver
> uses this. I am not asking to have anything deleted from the existing
> uapi via_drm.h file.
>
>
> My feedback is that the following code should be dropped from the
> openchrome driver:
>
> +	DRM_IOCTL_DEF_DRV(VIA_ALLOCMEM, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF_DRV(VIA_FREEMEM, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF_DRV(VIA_AGP_INIT, drm_invalid_op, DRM_AUTH | DRM_MASTER)=
,
> +	DRM_IOCTL_DEF_DRV(VIA_FB_INIT, drm_invalid_op, DRM_AUTH | DRM_MASTER),
> +	DRM_IOCTL_DEF_DRV(VIA_MAP_INIT, drm_invalid_op, DRM_AUTH | DRM_MASTER)=
,
> +	DRM_IOCTL_DEF_DRV(VIA_DEC_FUTEX, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF_DRV(VIA_DMA_INIT, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF_DRV(VIA_CMDBUFFER, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF_DRV(VIA_FLUSH, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF_DRV(VIA_PCICMD, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF_DRV(VIA_CMDBUF_SIZE, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF_DRV(VIA_WAIT_IRQ, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF_DRV(VIA_DMA_BLIT, drm_invalid_op, DRM_AUTH),
> +	DRM_IOCTL_DEF_DRV(VIA_BLIT_SYNC, drm_invalid_op, DRM_AUTH),
>
> (Copied from openchrome-drm - I recall you did not post this code yet).
>
> The new openchrome driver should not care at all about the old UAPI,
> so just drop the above.
>
> The comment above is based on the understanding that when we have a kms
> compliant driver the user space is generic and we do not expect or need
> any via specifics in user space.
>
> In other words - x86-video-openchrome should - according to my
> understanding - not be needed. And we can have a fully operational
> wayland (and maybe X) userspace using the generic UAPI. This is where
> Thomas Zimmermann's comment about dumb buffers are relevant.
>
> Do I miss something obvious here?
>
> 	Sam
>
