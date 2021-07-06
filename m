Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFE83BCD8F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55656E3AC;
	Tue,  6 Jul 2021 11:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5426E3AC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:20:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 i2-20020a05600c3542b02902058529ea07so1988065wmq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 04:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=jy7B1eNocEomHYb8Q2ONw/tio4h/NyFzZ4ujY4LjXSg=;
 b=Q54tcSgwVwzQfNcMewf3KLLck3MfQ5g9qHYgEqOW7xKjh3VZLSssHbR3i/nwnA6iwA
 ti6CIAD02mte+bGvVkh5FPnyoaSu+9EexjAQCDvgcmmLY6SJFqvAA9AFdY91AbKflcPO
 g1Dr4k8lKrw3SIPKnDeZvopgkM4moOlfVv1pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=jy7B1eNocEomHYb8Q2ONw/tio4h/NyFzZ4ujY4LjXSg=;
 b=gxml51upXrEdFYNbSwTKzQPI2txQushAQV4cpjwQ5MeEOVCYNOUSZNnKevYp3ZNeya
 xt8GT1ZlBqm4G1kVN2Lr7HuY2w+NdIcK8Ier/gznmhg5mlschp4yt4GEfqCJSZsz4YEG
 vwBHKm+bTAqf/UOaaALdKRXnh7psddGgJXvg9vF0cEjkG2DiAyVmksRv7TgMt5aD1M5H
 pV3NX31eH85ZQkBcls4Rc6oAuSEFWda4lr5l5NjdB0k9KsEcHY6RreL+i8bnns1dw5ob
 zoLUy7T6sBp2KL5Q04vAXYXVW31WYMZLgcX8YvmVF1CBFzJqjSfduW6Cx1pspqeHD/Uy
 FI2Q==
X-Gm-Message-State: AOAM530wB3df2n7fWXXUog7/ACnRFTy1T7CgUhlZfSZ5JUbRvGDWhbsf
 y7V5fksIjkKIBIeQagiEUCiWvA==
X-Google-Smtp-Source: ABdhPJwIUmMewDo0npWJUD3aDGWq7wQ1eq3cuVj7WQOGwB2f1W0doPqcB/ahrPnxocjCEhqZnlaKvQ==
X-Received: by 2002:a7b:c0c1:: with SMTP id s1mr17752031wmh.70.1625570453124; 
 Tue, 06 Jul 2021 04:20:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r18sm18222326wmh.23.2021.07.06.04.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 04:20:52 -0700 (PDT)
Date: Tue, 6 Jul 2021 13:20:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Message-ID: <YOQ8ktv1MypezrEy@phenom.ffwll.local>
Mail-Followup-To: Frank Wunderlich <frank-w@public-files.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 06, 2021 at 11:54:39AM +0200, Frank Wunderlich wrote:
> Hi,
> 
> i've noticed that HDMI is broken at least on my board (Bananapi-r2,mt7623) on 5.13.
> 
> after some research i noticed that it is working till
> 
> commit 2e477391522354e763aa62ee3e281c1ad9e8eb1b
> Author: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Date:   Tue Mar 30 13:09:02 2021 +0200
> 
>     drm/mediatek: Don't support hdmi connector creation
> 
> 
> which is the last of mtk-drm-next-5.13 [1] so i guess a problem with core-patches
> 
> dmesg shows the following:
> 
> [    7.071342] mediatek-drm mediatek-drm.1.auto: bound 14007000.ovl (ops mtk_dis
> p_ovl_component_ops)
> [    7.080330] mediatek-drm mediatek-drm.1.auto: bound 14008000.rdma (ops mtk_di
> sp_rdma_component_ops)
> [    7.089429] mediatek-drm mediatek-drm.1.auto: bound 1400b000.color (ops mtk_d
> isp_color_component_ops)
> [    7.098689] mediatek-drm mediatek-drm.1.auto: bound 14012000.rdma (ops mtk_di
> sp_rdma_component_ops)
> [    7.107814] mediatek-drm mediatek-drm.1.auto: bound 14014000.dpi (ops mtk_dpi
> _component_ops)
> [    7.116338] mediatek-drm mediatek-drm.1.auto: Not creating crtc 1 because com
> ponent 9 is disabled or missing
> ....
> [   38.403957] Console: switching to colour frame buffer device 160x64
> [   48.516398] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> [   48.516422] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:41:cr
> tc-0] commit wait timed out
> [   58.756384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> [   58.756399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:
> 32:HDMI-A-1] commit wait timed out
> [   68.996384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> [   68.996399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:33:p
> lane-0] commit wait timed out
> [   68.996423] [drm:mtk_drm_crtc_atomic_begin] *ERROR* new event while there is
> still a pending event
> [   69.106385] ------------[ cut here ]------------
> [   69.106392] WARNING: CPU: 2 PID: 7 at drivers/gpu/drm/drm_atomic_helper.c:151
> 1 drm_atomic_helper_wait_for_vblanks.part.0+0x2a0/0x2a8
> [   69.106414] [CRTC:41:crtc-0] vblank wait timed out
> 
> so i guess the breaking commit may be this:
> 
> $ git logone -S"drm_crtc_commit_wait" -- drivers/gpu/drm/
> b99c2c95412c 2021-01-11 drm: Introduce a drm_crtc_commit_wait helper
> 
> in drivers/gpu/drm/drm_atomic{,_helper}.c
> 
> but i cannot confirm it because my git bisect does strange things (after
> defining 5.13 as bad and the 2e4773915223 as good, second step is before
> the good commit till the end, last steps are 5.11...). sorry, i'm still
> new to bisect.

drm history runs in parallel with the main tree, so occasionally the
version that's reported as baseline is confusing and older than what you
might expect. Just trust git bisect, it's doing the right thing, and make
sure you test exactly the kernel you're supposed to test. Compiling with
CONFIG_LOCALVERSION_AUTO helps a lot to make sure you're really booting
into the right sha1.

> the fix is targeting to 5.12-rc2, is guess because CK Hu's tree is based
> on this...but the fix was not included in 5.12-rc2 (only after
> 5.12.0...got it by merging 5.12.14)

Yeah that can also happen because of all the non-linear trees involved in
linux development.

> maybe you can help me?

So now I'm confused, you're talking about a fix, or is it still broken in
latest upstream?
-Daniel

> 
> regards Frank
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next-5.13

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
