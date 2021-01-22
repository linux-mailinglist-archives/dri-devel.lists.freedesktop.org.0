Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F69C2FFFE1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 11:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A4589DEC;
	Fri, 22 Jan 2021 10:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F9489DBA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 10:15:00 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id i63so3782955wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 02:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6ahfAKWx+AVchSpaPvCuUAFtYBdb28oTbdhKh2YLPOk=;
 b=ZHRoro/WPgGZLm75dVfdG9rN+F346F4Pd0w6EGDLNUDb+sCCgtWYsSf9aygEdZ3BmG
 5MNzVEvHXcGmsKFJufIVTJxVW7D/7rd9WBZiq+YUqbzE9jW1paw2JMXGXPB7Zoiy07HJ
 JetsaHLRcmJ+VcJlqOX5cWSv9xzkkPIz7Ym55tonyquTCw2O3mYZG7wmoawdqH7DZkZv
 fzYVi3GHCIhNWI5g0m9JZI5JfuOcrYD3iK1TLCRDWmxCgnRr4JdYiQlvLJ2AVd9iFRfB
 yXIN9WNmuQOLOwB/i63RPm7cCv/sWT6mu2Fe1XpRMaiL5lUnbtnRMJyO+lhYS0gyRMhb
 nytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6ahfAKWx+AVchSpaPvCuUAFtYBdb28oTbdhKh2YLPOk=;
 b=TFoF5WiqY7mVjyD3i349VNiTDjkwGw7ZQeIzmRqUKnCOU9giN5pe60bJCBgnBgZAub
 REUHhX+JNdhsMWQMEUumB8WS3dYyTYLlEvFyrL/eaj+MzHvAdgrkYfdIdApKz8d39tvC
 LuAoQQiHQk4WvHmmXmn0aTqMFAbZCTdIYsrifpNVjz9c1UTFqWq3gUUGlR55CTf77+gM
 VrSGpFgDEPvYoSBTzuLhxXqQDM+zTieioeLZ/WKfkVcCqvl+VvwKpMzIfeP6vJhCNdXy
 VZQxGPdWRXErIHNV2WIhACPSsOajRXHs+NsKLGj23E6X2MXeFngixvHVlSr2Hq52a3SY
 Sjfw==
X-Gm-Message-State: AOAM533/H5Sl9sF9SJAsbNd2ByTftY8yxaahtTUc5dMKfrJkTehshaJG
 g9U67TBW5DpqcM4QI5nJ9wevTpXrqWRM+EoYMwQmOg==
X-Google-Smtp-Source: ABdhPJx0xKTsCGo4bmEnP7kiqbgdDaec9f8ob9t5gauS05SMLpNTZstFRaLJpVGlWhLUvGG6KS6TAYCZVP1lwTUfFvU=
X-Received: by 2002:a1c:27c3:: with SMTP id n186mr3263484wmn.96.1611310499665; 
 Fri, 22 Jan 2021 02:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20210121105759.1262699-1-maxime@cerno.tech>
 <20210121105759.1262699-2-maxime@cerno.tech>
In-Reply-To: <20210121105759.1262699-2-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 22 Jan 2021 10:14:44 +0000
Message-ID: <CAPY8ntBU7BNCYTTughmPBisk0pX5riaRW05MEq5zmhmxFhhYdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/vc4: Correct POS1_SCL for hvs5
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Dom Cobley <popcornmix@gmail.com>, Lucas Nussbaum <lucas@debian.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime.

On Thu, 21 Jan 2021 at 10:58, Maxime Ripard <maxime@cerno.tech> wrote:
>
> From: Dom Cobley <popcornmix@gmail.com>
>
> Fixes failure with 4096x1080 resolutions
>
> [  284.315379] WARNING: CPU: 1 PID: 901 at drivers/gpu/drm/vc4/vc4_plane.c:981 vc4_plane_mode_set+0x1374/0x13c4
> [  284.315385] Modules linked in: ir_rc5_decoder rpivid_hevc(C) bcm2835_codec(C) bcm2835_isp(C) bcm2835_mmal_vchiq(C) bcm2835_gpiomem v4l2_mem2mem videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc cdc_acm xpad ir_rc6_decoder rc_rc6_mce gpio_ir_recv fuse
> [  284.315509] CPU: 1 PID: 901 Comm: kodi.bin Tainted: G         C        5.10.7 #1
> [  284.315514] Hardware name: BCM2711
> [  284.315518] Backtrace:
> [  284.315533] [<c0cc5ca0>] (dump_backtrace) from [<c0cc6014>] (show_stack+0x20/0x24)
> [  284.315540]  r7:ffffffff r6:00000000 r5:68000013 r4:c18ecf1c
> [  284.315549] [<c0cc5ff4>] (show_stack) from [<c0cca638>] (dump_stack+0xc4/0xf0)
> [  284.315558] [<c0cca574>] (dump_stack) from [<c022314c>] (__warn+0xfc/0x158)
> [  284.315564]  r9:00000000 r8:00000009 r7:000003d5 r6:00000009 r5:c08cc7dc r4:c0fd09b8
> [  284.315572] [<c0223050>] (__warn) from [<c0cc67ec>] (warn_slowpath_fmt+0x74/0xe4)
> [  284.315577]  r7:c08cc7dc r6:000003d5 r5:c0fd09b8 r4:00000000
> [  284.315584] [<c0cc677c>] (warn_slowpath_fmt) from [<c08cc7dc>] (vc4_plane_mode_set+0x1374/0x13c4)
> [  284.315589]  r8:00000000 r7:00000000 r6:00001000 r5:c404c600 r4:c2e34600
> [  284.315596] [<c08cb468>] (vc4_plane_mode_set) from [<c08cc984>] (vc4_plane_atomic_check+0x40/0x1c0)
> [  284.315601]  r10:00000001 r9:c2e34600 r8:c0e67068 r7:c0fc44e0 r6:c2ce3640 r5:c3d636c0
> [  284.315605]  r4:c2e34600
> [  284.315614] [<c08cc944>] (vc4_plane_atomic_check) from [<c0860504>] (drm_atomic_helper_check_planes+0xec/0x1ec)
> [  284.315620]  r9:c2e34600 r8:c0e67068 r7:c0fc44e0 r6:c2ce3640 r5:c3d636c0 r4:00000006
> [  284.315627] [<c0860418>] (drm_atomic_helper_check_planes) from [<c0860658>] (drm_atomic_helper_check+0x54/0x9c)
> [  284.315633]  r9:c2e35400 r8:00000006 r7:00000000 r6:c2ba7800 r5:c3d636c0 r4:00000000
> [  284.315641] [<c0860604>] (drm_atomic_helper_check) from [<c08b7ca8>] (vc4_atomic_check+0x25c/0x454)
> [  284.315645]  r7:00000000 r6:c2ba7800 r5:00000001 r4:c3d636c0
> [  284.315652] [<c08b7a4c>] (vc4_atomic_check) from [<c0881278>] (drm_atomic_check_only+0x5cc/0x7e0)
> [  284.315658]  r10:c404c6c8 r9:ffffffff r8:c472c480 r7:00000003 r6:c3d636c0 r5:00000000
> [  284.315662]  r4:0000003c r3:c08b7a4c
> [  284.315670] [<c0880cac>] (drm_atomic_check_only) from [<c089ba60>] (drm_mode_atomic_ioctl+0x758/0xa7c)
> [  284.315675]  r10:c3d46000 r9:c3d636c0 r8:c2ce8a70 r7:027e3a54 r6:00000043 r5:c1fbb800
> [  284.315679]  r4:0281a858
> [  284.315688] [<c089b308>] (drm_mode_atomic_ioctl) from [<c086e9f8>] (drm_ioctl_kernel+0xc4/0x108)
> [  284.315693]  r10:c03864bc r9:c1fbb800 r8:c3d47e64 r7:c089b308 r6:00000002 r5:c2ba7800
> [  284.315697]  r4:00000000
> [  284.315705] [<c086e934>] (drm_ioctl_kernel) from [<c086ee28>] (drm_ioctl+0x1e8/0x3a0)
> [  284.315711]  r9:c1fbb800 r8:000000bc r7:c3d47e64 r6:00000038 r5:c0e59570 r4:00000038
> [  284.315719] [<c086ec40>] (drm_ioctl) from [<c041f354>] (sys_ioctl+0x35c/0x914)
> [  284.315724]  r10:c2d08200 r9:00000000 r8:c36fa300 r7:befdd870 r6:c03864bc r5:c36fa301
> [  284.315728]  r4:c03864bc
> [  284.315735] [<c041eff8>] (sys_ioctl) from [<c0200040>] (ret_fast_syscall+0x0/0x28)
> [  284.315739] Exception stack(0xc3d47fa8 to 0xc3d47ff0)
> [  284.315745] 7fa0:                   027eb750 befdd870 00000000 c03864bc befdd870 00000000
> [  284.315750] 7fc0: 027eb750 befdd870 c03864bc 00000036 027e3948 0281a640 0281a850 027e3a50
> [  284.315756] 7fe0: b4b64100 befdd844 b4b5ba2c b49c994c
> [  284.315762]  r10:00000036 r9:c3d46000 r8:c0200204 r7:00000036 r6:c03864bc r5:befdd870
> [  284.315765]  r4:027eb750
>
> Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index b98eabb52920..8c55679cbaef 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -917,9 +917,9 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
>                 if (!vc4_state->is_unity) {
>                         vc4_dlist_write(vc4_state,
>                                         VC4_SET_FIELD(vc4_state->crtc_w,
> -                                                     SCALER_POS1_SCL_WIDTH) |
> +                                                     SCALER5_POS1_SCL_WIDTH) |
>                                         VC4_SET_FIELD(vc4_state->crtc_h,
> -                                                     SCALER_POS1_SCL_HEIGHT));
> +                                                     SCALER5_POS1_SCL_HEIGHT));
>                 }
>
>                 /* Position Word 2: Source Image Size */
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
