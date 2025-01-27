Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C981A1D8B2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1F810E56B;
	Mon, 27 Jan 2025 14:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G29bq2tq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7BD10E31A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737989439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xz3x9+R4stGnrrNrJrnqJDVU1Zwj8b3KvYPjrk33mTk=;
 b=G29bq2tqReIn0RrXkh6IuPV8TZtz8IAz0xIfE3F8I1IbaTiXH8sZoiQak8XKcWWviAIjow
 iNg8OsW7eOhLaM7atCjmrPvbADKKQ40C/EW4RlxUYdvZvh8LILMVMibeGIm4SWwvW03IyN
 6zJX0mCRZm5+4RNsrOpMJ0Jo0qayXgg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-hZtBVwSKPUeH9wXScTjF-w-1; Mon, 27 Jan 2025 09:50:38 -0500
X-MC-Unique: hZtBVwSKPUeH9wXScTjF-w-1
X-Mimecast-MFC-AGG-ID: hZtBVwSKPUeH9wXScTjF-w
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-385d52591d6so1925468f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737989436; x=1738594236;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xz3x9+R4stGnrrNrJrnqJDVU1Zwj8b3KvYPjrk33mTk=;
 b=N/QJdgjAz1cVsuI2DRHK5vGF0v1bWuVdbfgZ8eVPIiapV5H5nbjoJK3uCKBjOB8bSs
 a7VfdKSaHYhcySDROSeod2tRKfUIZ2hBU6zUfZXBBtkqqqt+SbCVxYmeg/qkhYLG9CLc
 ltp06fpXKwnocFMba11C2vmD6XBbgpBInQQKkIZX3F48S4lc1vO73a5v1eqsoCt0VucN
 YKvWepcr5ODrCZxYcpNzsgAoScW6ZdrrFVl/7SuxtSjFYjFHU9tnMP/E2vUFm+1A8gPQ
 hDnd8Gp8GP+VhwemkTXXw+m25vw9juaJOgW+LguJNCD9+jrr3E0IbW50PywgwYYPveoP
 J9PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2X3vDfykKlDubFPcOr0WLUakzAlFy5o62iHmhfvl0TKzmn9bPClCBlQWgUYpl92GsEojgsQq5j6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHTobVFUsRnm5BqoKyqdMPiSK/eAGaVL27vWns6O6dyPmmOCzn
 uc4SgnoI9/YpVGJV1r44NP0qy9+rpJtQfTNkUJRtaIBTVbsjKBT3WiSiEfgI45t6BBUwPxACglD
 LlC59h6f3FThFrUayVLgdLQXZDUPy5nDzWhnos7Ps4ivjVo1znihCZsAn4ohznbNepfz4hZz+WA
 ==
X-Gm-Gg: ASbGncsN9Aue+BFJEx7FbCKOwsJTIrXnUDgD3lyr3YgZ+yrFAp2vv2Vg13EFsVOK+z6
 G56ClCuY6iADaTqYDbahRNXSRLY10vNr/7RLUdh7r4LbyM9KWOYHFjfhh4U+QNDNqw/St7pEz04
 HmpXce2nMupXA9JAWq8cM5ZtUaiM3AJLHibEWnWKXaQXvlqFggnxXeOuwHVdjzv0IGcMQSPaIXg
 eQpZBQGTgfjkap6uERuXPYUpYJNL2pQdTpclWT8bWXI5qBL0jxh2nZJcZbN3hElGGbfXxJuklem
 zcwBXnAlG2qBcoMW4s94x/lYsB+dAc79W2ni6+lJltjK
X-Received: by 2002:a05:6000:4024:b0:386:374b:e8bc with SMTP id
 ffacd0b85a97d-38c2b783fdbmr10545977f8f.15.1737989436599; 
 Mon, 27 Jan 2025 06:50:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEn/Ms7J57pQwKFvDZ8MXJ3eZPnlE9CXXArbGiDkgjSz6YEClFt0lvrQmt8xrHQHp64Orprog==
X-Received: by 2002:a05:6000:4024:b0:386:374b:e8bc with SMTP id
 ffacd0b85a97d-38c2b783fdbmr10545947f8f.15.1737989436169; 
 Mon, 27 Jan 2025 06:50:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188673sm11036675f8f.46.2025.01.27.06.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:50:35 -0800 (PST)
Message-ID: <e477f25a-f2a1-4246-9954-665254b999d6@redhat.com>
Date: Mon, 27 Jan 2025 15:50:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] drm/ast: Inline ast_get_vbios_mode_info()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250124080546.9956-1-tzimmermann@suse.de>
 <20250124080546.9956-13-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250124080546.9956-13-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hZQ1kmFuGWoFnVL4dbBBlerJ0w6fDynS9DhRUOdWpY0_1737989437
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 24/01/2025 08:57, Thomas Zimmermann wrote:
> The helper ast_get_vbios_mode_info() retrieves hardware-specific format
> and display-mode information. Inline the function into its only caller.
> 
> While at it, also replace a use of struct drm_format_info.cpp with the
> correct DRM 4CC codes.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 112 ++++++++++++++++-----------------
>   1 file changed, 54 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 372abff1c8673..a823dcbf73c4b 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -107,59 +107,6 @@ static void ast_crtc_set_gamma(struct ast_device *ast,
>   	}
>   }
>   
> -static bool ast_get_vbios_mode_info(struct ast_device *ast,
> -				    const struct drm_format_info *format,
> -				    const struct drm_display_mode *mode,
> -				    struct drm_display_mode *adjusted_mode,
> -				    struct ast_vbios_mode_info *vbios_mode)
> -{
> -	u32 hborder, vborder;
> -
> -	switch (format->cpp[0] * 8) {
> -	case 8:
> -		vbios_mode->std_table = &vbios_stdtable[VGAModeIndex];
> -		break;
> -	case 16:
> -		vbios_mode->std_table = &vbios_stdtable[HiCModeIndex];
> -		break;
> -	case 24:
> -	case 32:
> -		vbios_mode->std_table = &vbios_stdtable[TrueCModeIndex];
> -		break;
> -	default:
> -		return false;
> -	}
> -
> -	vbios_mode->enh_table = ast_vbios_find_mode(ast, mode);
> -	if (!vbios_mode->enh_table)
> -		return false;
> -
> -	hborder = (vbios_mode->enh_table->flags & HBorder) ? 8 : 0;
> -	vborder = (vbios_mode->enh_table->flags & VBorder) ? 8 : 0;
> -
> -	adjusted_mode->crtc_hdisplay = vbios_mode->enh_table->hde;
> -	adjusted_mode->crtc_htotal = vbios_mode->enh_table->ht;
> -	adjusted_mode->crtc_hblank_start = vbios_mode->enh_table->hde + hborder;
> -	adjusted_mode->crtc_hblank_end = vbios_mode->enh_table->ht - hborder;
> -	adjusted_mode->crtc_hsync_start = vbios_mode->enh_table->hde + hborder +
> -		vbios_mode->enh_table->hfp;
> -	adjusted_mode->crtc_hsync_end = (vbios_mode->enh_table->hde + hborder +
> -					 vbios_mode->enh_table->hfp +
> -					 vbios_mode->enh_table->hsync);
> -
> -	adjusted_mode->crtc_vdisplay = vbios_mode->enh_table->vde;
> -	adjusted_mode->crtc_vtotal = vbios_mode->enh_table->vt;
> -	adjusted_mode->crtc_vblank_start = vbios_mode->enh_table->vde + vborder;
> -	adjusted_mode->crtc_vblank_end = vbios_mode->enh_table->vt - vborder;
> -	adjusted_mode->crtc_vsync_start = vbios_mode->enh_table->vde + vborder +
> -		vbios_mode->enh_table->vfp;
> -	adjusted_mode->crtc_vsync_end = (vbios_mode->enh_table->vde + vborder +
> -					 vbios_mode->enh_table->vfp +
> -					 vbios_mode->enh_table->vsync);
> -
> -	return true;
> -}
> -
>   static void ast_set_vbios_color_reg(struct ast_device *ast,
>   				    const struct drm_format_info *format,
>   				    const struct ast_vbios_mode_info *vbios_mode)
> @@ -990,13 +937,17 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
>   					struct drm_atomic_state *state)
>   {
>   	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>   	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
>   	struct ast_crtc_state *old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
>   	struct drm_device *dev = crtc->dev;
>   	struct ast_device *ast = to_ast_device(dev);
>   	struct ast_crtc_state *ast_state;
>   	const struct drm_format_info *format;
> -	bool succ;
> +	struct ast_vbios_mode_info *vbios_mode;
> +	const struct ast_vbios_enhtable *vmode;
> +	unsigned int hborder = 0;
> +	unsigned int vborder = 0;
>   	int ret;
>   
>   	if (!crtc_state->enable)
> @@ -1028,11 +979,56 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
>   		}
>   	}
>   
> -	succ = ast_get_vbios_mode_info(ast, format, &crtc_state->mode,
> -				       &crtc_state->adjusted_mode,
> -				       &ast_state->vbios_mode_info);
> -	if (!succ)
> +	vbios_mode = &ast_state->vbios_mode_info;
> +
> +	/*
> +	 * Set register tables.
> +	 *
> +	 * TODO: These tables mix all kinds of fields and should
> +	 *       probably be resolved into various helper functions.
> +	 */
> +	switch (format->format) {
> +	case DRM_FORMAT_C8:
> +		vbios_mode->std_table = &vbios_stdtable[VGAModeIndex];
> +		break;
> +	case DRM_FORMAT_RGB565:
> +		vbios_mode->std_table = &vbios_stdtable[HiCModeIndex];
> +		break;
> +	case DRM_FORMAT_RGB888:
> +	case DRM_FORMAT_XRGB8888:
> +		vbios_mode->std_table = &vbios_stdtable[TrueCModeIndex];
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Find the VBIOS mode and adjust the DRM display mode accordingly.
> +	 */
> +
> +	vmode = ast_vbios_find_mode(ast, &crtc_state->mode);
> +	if (!vmode)
>   		return -EINVAL;
> +	ast_state->vbios_mode_info.enh_table = vmode;
> +
> +	if (vmode->flags & HBorder)
> +		hborder = 8;
> +	if (vmode->flags & VBorder)
> +		vborder = 8;
> +
> +	adjusted_mode->crtc_hdisplay = vmode->hde;
> +	adjusted_mode->crtc_hblank_start = vmode->hde + hborder;
> +	adjusted_mode->crtc_hblank_end = vmode->ht - hborder;
> +	adjusted_mode->crtc_hsync_start = vmode->hde + hborder + vmode->hfp;
> +	adjusted_mode->crtc_hsync_end = vmode->hde + hborder + vmode->hfp + vmode->hsync;
> +	adjusted_mode->crtc_htotal = vmode->ht;
> +
> +	adjusted_mode->crtc_vdisplay = vmode->vde;
> +	adjusted_mode->crtc_vblank_start = vmode->vde + vborder;
> +	adjusted_mode->crtc_vblank_end = vmode->vt - vborder;
> +	adjusted_mode->crtc_vsync_start = vmode->vde + vborder + vmode->vfp;
> +	adjusted_mode->crtc_vsync_end = vmode->vde + vborder + vmode->vfp + vmode->vsync;
> +	adjusted_mode->crtc_vtotal = vmode->vt;
>   
>   	return 0;
>   }

