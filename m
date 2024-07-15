Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF4A931B0B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 21:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7C210E423;
	Mon, 15 Jul 2024 19:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="D3oUzvE5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1A910E423
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 19:33:01 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-64b29539d86so42262767b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 12:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1721071981; x=1721676781;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wX6VVF5zo6QpIl0GNcjuj6SmcU0Q6kPt3Zxz4lR//To=;
 b=D3oUzvE5kO2LFTSV2zgW5dC0Og4VLR0ClELgr/LWHoJ/WNNj0pIHgO46iYnTr0sUOC
 v0cDf0cntfNkZrtg/1cHRLkuc1+gXxOMVKzsCgLMIo9clLa6blurpTTDRbMZNUEPAY8B
 6NSI8lFzBHfvH1nV+NZunVMaQXAnmrfcgics4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721071981; x=1721676781;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wX6VVF5zo6QpIl0GNcjuj6SmcU0Q6kPt3Zxz4lR//To=;
 b=dDHQcksXzVm7H4SNcIlPFoDH295vxwZbozLKtP4n2e6kzDw2PNDSepc68HJ8ocNGGz
 D4s8Suc4vbnNzpDsPrWeqWd3bvA9IgtUosHtTOl0Ht1P6MsBE+KbKYXmYbsGlZ8m52Ft
 /s1h2RgIsVS1Bznp0s7zSGgJrXsHKS7oCrCvqb4G1ENu2r1KXzecI+VGXkIPjjtpqkEq
 YRbbYEl6i3u85Vquj9OOIUt5A8/TkilJSe7hVciY0KCd9u+g9wBUaLxxB4R1KaWHtLcL
 hs45bm+7vW9NbY72SXWvwGXRUf4Jb4mrqx1fTh1NfUcte7ZRjRRa02RZtSQ7GOMDkGTm
 1M5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXFEaVzEUaW+R/MNIJ3/WUDKtTwOECc0sYKlhfIo8sLB5Zfz0sm36EQXQSjhWy9mtexwo3+uemZ+cUY5Q+EwZ5+kZTtrian4CX72TlxwmZ
X-Gm-Message-State: AOJu0YygBWHtjLkNV7IjLH3A1ndndCW/ZemNXV3pvJDD9umDT5Xom6U9
 FmozlEQxl5IymXagBXwNch1LFNuF7duvvifszF0NsF12x68AitXfTuMncIkpmaiHZh64VVphahR
 Jqcq490WG3X9Y57LxGvSUD6WuSIfiLoP8NzVk
X-Google-Smtp-Source: AGHT+IFGwqsnaPAj7mqNI8+vo6+/u0K0j2UFb+UYDBq3/3ucIPqVmkkyljDrQrw6oWynXU33+vEOIFDTYxIYzTAJHRs=
X-Received: by 2002:a0d:c183:0:b0:65f:ca0b:5ad9 with SMTP id
 00721157ae682-66354d75631mr5659897b3.25.1721071980901; Mon, 15 Jul 2024
 12:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <bd9cb3c7-90e8-435d-bc28-0e38fee58977@schmorgal.com>
In-Reply-To: <bd9cb3c7-90e8-435d-bc28-0e38fee58977@schmorgal.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Mon, 15 Jul 2024 14:32:50 -0500
Message-ID: <CAO6MGtjxnm3Hc=T8jv-upP46XBzAc0ZNmLVF3=KNN8buGBwg1w@mail.gmail.com>
Subject: Re: [REGRESSION] drm/vmwgfx shows green Xv instead of actual video
 (bisected I think)
To: Doug Brown <doug@schmorgal.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
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

Hi Doug,

Can you try this patch with 6.10.

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
index c45b4724e414..e20f64b67b26 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
@@ -92,7 +92,7 @@ static int vmw_overlay_send_put(struct vmw_private *dev_p=
riv,
 {
        struct vmw_escape_video_flush *flush;
        size_t fifo_size;
-       bool have_so =3D (dev_priv->active_display_unit =3D=3D vmw_du_scree=
n_object);
+       bool have_so =3D (dev_priv->active_display_unit !=3D vmw_du_legacy)=
;
        int i, num_items;
        SVGAGuestPtr ptr;


On Thu, Jul 11, 2024 at 3:37=E2=80=AFPM Doug Brown <doug@schmorgal.com> wro=
te:
>
> Hello,
>
> I have discovered a problem in vmwgfx that caused Xv playback to break
> between v6.3 and v6.4-rc1. In v6.3, inside of an Ubuntu 24.04 VMware VM
> with 3D acceleration disabled, I can run the following GStreamer command
> ("sudo apt install gstreamer1.0-tools" if you don't already have it):
>
> gst-launch-1.0 videotestsrc !
> video/x-raw,format=3DYV12,width=3D640,height=3D480 ! xvimagesink
>
> And it works fine, showing a test pattern.
>
> In v6.4-rc1 and all the way up to a build I just made today of Linus's
> latest master branch and also including Zack's latest patchset [1]:
>
> Linux doug-Ubuntu-MATE-2404 6.10.0-rc7+ #55 SMP PREEMPT_DYNAMIC Thu Jul
> 11 12:46:06 PDT 2024 x86_64 x86_64 x86_64 GNU/Linux
>
> ...if I run the same command, the GStreamer window shows up containing
> solid green rather than the test pattern.
>
> I believe I have bisected the problem to commit:
>
> 39985eea5a6d ("drm/vmwgfx: Abstract placement selection")
>
> However, the bisect process was complicated because two earlier commits
> temporarily broke vmwgfx so I had to undo them during bisection, which
> also required some conflict resolution:
>
> 180253782038 ("drm/ttm: stop allocating dummy resources during BO
> creation") and
> f87c1f0b7b79 ("drm/ttm: prevent moving of pinned BOs")
>
> Note that if you have gstreamer1.0-vaapi installed, you should
> temporarily remove it first before testing because there is a separate
> Xorg bug that causes Xorg to crash when you run the above command if
> gstreamer1.0-vaapi is installed.
>
> I'm happy to do any further testing as needed. I've reproduced this
> problem across several different machines and distros. A fully-updated
> Arch Linux is also affected.
>
> As a side note, that same gst-launch-1.0 command is also currently
> broken with 3D acceleration enabled, but that's a separate issue in mesa
> that I've submitted a patch for [2].
>
> Thanks,
> Doug
>
> [1]
> https://lore.kernel.org/all/20240702021254.1610188-1-zack.rusin@broadcom.=
com/#t
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30116
>
> #regzbot introduced: v6.3..v6.4-rc1
