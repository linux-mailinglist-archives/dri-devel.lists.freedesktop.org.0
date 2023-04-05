Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E75556D7CF2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936C410E938;
	Wed,  5 Apr 2023 12:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1163E10E938
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 12:49:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 d11-20020a05600c3acb00b003ef6e6754c5so18221939wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 05:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680698997;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=//TCpmlDK+r12TIu8yp8kcAUkat2lRdgyoF6EXv1SeU=;
 b=EAGfNn9+cxJx3P5u80zJECA9hUsJSQFiTkukOTxPYPygNP/yizp5vWr4TnHKeRhH0P
 pK9t/AM5wPY0moP6Xp7Y8JHpLo60WUgdHs6SXlnZvAUBOjchUfUp7qdR25O/L0fOo2O4
 Jb0DUNompeaLJ7bO0qn+TEdcRLka/3xC3Fk4ySMTCX468Q0qIfFZa9JBr4lDt7pQUI2R
 g6Y7EK24Kdw1Ph4oa9oxLPi0rkClDILXBD/PlfBA1aM9fEgtlZyPIdFyGgHCAORFNZb3
 73KBHtglM6g8x+q+e7jIBVidUO4unMEVUJkut+VkXTIUNNCkpVfnW4T4JW+yyhqIbE1T
 tC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680698997;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=//TCpmlDK+r12TIu8yp8kcAUkat2lRdgyoF6EXv1SeU=;
 b=mox+Fd7UTsx4YQ8y+801gUCh4EvMT2EpiMLPo9sm0TT6vkGHzqpNEsnP7yiIg8wIGG
 g3+tzolgjoOBf3f+oKyDo2kPrkqaSuGkrUExgUPWfnXAc/cmEdKt031Ty7t3kNtFNFXH
 kz7rQmtKc/1fxofqo3UbVO3Ajl/XkGhE6yRYYQtf8nlKtKEztOZ4uDnBQVR102zREmCO
 AfvuRzN4k8UF61wHNj97VrvOPnGJxSjebSguYgEp2xddgkPQTuHmhkH6nqSJ41W3Tw1f
 vRKHhaP6vq+wnQl1FXMG4v+YCdw92jfCYFteLnELafjwoBG2odOREAMp5grly1ZkKrBm
 h3pA==
X-Gm-Message-State: AAQBX9eFkz+cHovpNVbtQNJWlNgxoqlNKFaemBcnAm6xjMdaLjoN+zR/
 5kN518RaPdTWerhBRtCCZJ4=
X-Google-Smtp-Source: AKy350YRqQtTiGuTpsQg0+ThkYXYaIIBwZdN3hjjiG+th9lT8ODrT9X44bllBgKUkoBYgVjVqwhIPQ==
X-Received: by 2002:a7b:cd87:0:b0:3df:de28:f819 with SMTP id
 y7-20020a7bcd87000000b003dfde28f819mr4819267wmj.15.1680698996981; 
 Wed, 05 Apr 2023 05:49:56 -0700 (PDT)
Received: from [192.168.2.181] (46-10-148-211.ip.btc-net.bg. [46.10.148.211])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003ef7058ea02sm2156191wmq.29.2023.04.05.05.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 05:49:56 -0700 (PDT)
Message-ID: <84ca69a4-f773-cad5-04e2-1f1af6188f06@gmail.com>
Date: Wed, 5 Apr 2023 15:49:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/atomic-helper: Do not assume vblank is always present
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230405045611.28093-1-zack@kde.org>
Content-Language: en-US
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20230405045611.28093-1-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 banackm@vmware.com, krastevm@vmware.com, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


LGTM!

Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,

Martin


On 5.04.23 г. 7:56 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> Many drivers (in particular all of the virtualized drivers) do not
> implement vblank handling. Assuming vblank is always present
> leads to crashes.
>
> Fix the crashes by making sure the device supports vblank before using
> it.
>
> Fixes crashes on boot, as in:
> Oops: 0000 [#1] PREEMPT SMP PTI
> CPU: 0 PID: 377 Comm: systemd-modules Not tainted 6.3.0-rc4-vmwgfx #1
> Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 11/12/2020
> RIP: 0010:drm_crtc_next_vblank_start+0x2c/0x80 [drm]
> Code: 1e fa 0f 1f 44 00 00 8b 87 90 00 00 00 48 8b 17 55 48 8d 0c c0 48 89 e5 41 54 53 48 8d 1c 48 48 c1 e3 04 48 03 9a 40 01 00 00 <8b> 53 74 85 d2 74 3f 8b 4>
> RSP: 0018:ffffb825004073c8 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> RDX: ffff9b18cf8d0000 RSI: ffffb825004073e8 RDI: ffff9b18d0f40000
> RBP: ffffb825004073d8 R08: ffff9b18cf8d0000 R09: 0000000000000000
> R10: ffff9b18c57ef6e8 R11: ffff9b18c2d59e00 R12: 0000000000000000
> R13: ffff9b18cfa99280 R14: 0000000000000000 R15: ffff9b18cf8d0000
> FS:  00007f2b82538900(0000) GS:ffff9b19f7c00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000074 CR3: 00000001060a6003 CR4: 00000000003706f0
> Call Trace:
>   <TASK>
>   drm_atomic_helper_wait_for_fences+0x87/0x1e0 [drm_kms_helper]
>   drm_atomic_helper_commit+0xa1/0x160 [drm_kms_helper]
>   drm_atomic_commit+0x9a/0xd0 [drm]
>   ? __pfx___drm_printfn_info+0x10/0x10 [drm]
>   drm_client_modeset_commit_atomic+0x1e9/0x230 [drm]
>   drm_client_modeset_commit_locked+0x5f/0x160 [drm]
>   ? mutex_lock+0x17/0x50
>   drm_client_modeset_commit+0x2b/0x50 [drm]
>   __drm_fb_helper_restore_fbdev_mode_unlocked+0xca/0x100 [drm_kms_helper]
>   drm_fb_helper_set_par+0x40/0x80 [drm_kms_helper]
>   fbcon_init+0x2c5/0x690
>   visual_init+0xee/0x190
>   do_bind_con_driver.isra.0+0x1ce/0x4b0
>   do_take_over_console+0x136/0x220
>   ? vprintk_default+0x21/0x30
>   do_fbcon_takeover+0x78/0x130
>   do_fb_registered+0x139/0x270
>   fbcon_fb_registered+0x3b/0x90
>   ? fb_add_videomode+0x81/0xf0
>   register_framebuffer+0x22f/0x330
>   __drm_fb_helper_initial_config_and_unlock+0x349/0x520 [drm_kms_helper]
>   ? kmalloc_large+0x25/0xc0
>   drm_fb_helper_initial_config+0x3f/0x50 [drm_kms_helper]
>   drm_fbdev_generic_client_hotplug+0x73/0xc0 [drm_kms_helper]
>   drm_fbdev_generic_setup+0x99/0x170 [drm_kms_helper]
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank")
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/gpu/drm/drm_vblank.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 299fa2a19a90..6438aeb1c65f 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -997,12 +997,16 @@ int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
>   {
>   	unsigned int pipe = drm_crtc_index(crtc);
>   	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
> -	struct drm_display_mode *mode = &vblank->hwmode;
> +	struct drm_display_mode *mode;
>   	u64 vblank_start;
>   
> +	if (!drm_dev_has_vblank(crtc->dev))
> +		return -EINVAL;
> +
>   	if (!vblank->framedur_ns || !vblank->linedur_ns)
>   		return -EINVAL;
>   
> +	mode = &vblank->hwmode;
>   	if (!drm_crtc_get_last_vbltimestamp(crtc, vblanktime, false))
>   		return -EINVAL;
>   
