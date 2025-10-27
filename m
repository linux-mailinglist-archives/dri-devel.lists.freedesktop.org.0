Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED755C0E30E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2903A10E4AE;
	Mon, 27 Oct 2025 13:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F13A5wDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA43710E4AB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761573389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V3irM8CbIPCte8reRirdD1cSk2401dcfm+9V1CR/mWQ=;
 b=F13A5wDVdNXqOoO1tU+DjF84j8EBEoLsP0bIITzGLZFUe/sKMjP/k4H2pD2mT5gb023KlU
 PMBf3PHCQA+yAqQ2BwvgA4f6HeFgZBnJguIRNZe6ni+8m20s7vNzrzQPXhELXgjBTRpfms
 rX0F107NnTq4oSFy/mjEW+enRiydQUw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-zD5ZC4foOKy81nMtFf7HLg-1; Mon, 27 Oct 2025 09:56:28 -0400
X-MC-Unique: zD5ZC4foOKy81nMtFf7HLg-1
X-Mimecast-MFC-AGG-ID: zD5ZC4foOKy81nMtFf7HLg_1761573387
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-428567f67c5so2845558f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 06:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761573387; x=1762178187;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V3irM8CbIPCte8reRirdD1cSk2401dcfm+9V1CR/mWQ=;
 b=H43TZH+uTTcynaEpTeKvm5tcrd6RSP8gqCMEfJECTt/3ubmHGSdyUq4NQMHWui2SfV
 peBmtGVtFXtX+/wKhU+2ch/YiqJlY0czG27Z7k+Im7gEwqEelv7iZwOBXFq/UNOl8C9k
 Yo+0JxwRv0YoadtiIHOMrl7JnOqVpO89xjipard5beJFkpbHHzwaCgj8Nfbm96Qjvd6e
 zOEFJNbV31iS5RpVYhO7nHhBUTW9wuRn+8iFaqHBZOSv41h6nAMs7JBRftED89BtQkgJ
 S5gGWs2XwVUfj++1p4IzfInVIkBjm9BpYMjBW1J20NQWSIVMTsaGJe6FABs6hKNXbXb9
 JsEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL3Q1CzDED9YjqENrOBWTkQ3b32zW+rHDQrsUhGJEuD00ofk2mhUXkyidogKGxGLi0H9kGjE/FGKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoA1Vg/KLNTf5i2uQ57jcu7suodSGd2VmX6si1o+H366L2Vzoq
 Ixw3bnG7+njkylkHb3mQW8GjgByWEtrzrBW2+oJ18FH2gWb1/cK8E3c32/wjQvwlSyXr51apOPU
 GwxJ8L3R5MQmqNe8BWv0na/3xfSAnbPV/0dusgqPJ7s6rEU/Lza/wjEW2esfsGrzqUAnbGA==
X-Gm-Gg: ASbGncvnJmOByD5A/9FIT5O5+2br9H2F7M8PMQvVc9baD+YJ0eGSGglzyO0S38l5mak
 0MCHZPlztQpBA8dsKWAhkf8i4yzB7gd/mMMtYs/w1la9BhWPYZD1E1f5Iopnyofp3BU1jS9P48R
 rDtp8pXqui18N/QmgMw6OjJgUiDfqTn/eGyOIHi74AMA3ka/UgBzUh2HHICW4ZafyHo64hRasNh
 ah2mkio9I82RdTcHY8WQP6fFTARKTmwPLQxOlfifMD3ZADMJ33G7ZwUPuHf31iTTFlWtMvuORsT
 +1auVhOnkDMMWjKBWlXVpvo9QTW1UbOHdf+Acf+wYjRf6oFDNlOsUHHURx2xnk41u3TyPMV3Qa0
 OV8IqIDFmltPcdzDqEkWXCPgorjf1iIOm7mELMWw=
X-Received: by 2002:a05:6000:420b:b0:3c8:d236:26bd with SMTP id
 ffacd0b85a97d-42704d144eemr27607651f8f.11.1761573387105; 
 Mon, 27 Oct 2025 06:56:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ4Qqwt/6CWKociRv++gv8yJFULv46QhHLCVXZlAJV8wIo9QkntyL8O7lkfBvicbLVpgdxPA==
X-Received: by 2002:a05:6000:420b:b0:3c8:d236:26bd with SMTP id
 ffacd0b85a97d-42704d144eemr27607629f8f.11.1761573386710; 
 Mon, 27 Oct 2025 06:56:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5768sm14779967f8f.24.2025.10.27.06.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 06:56:26 -0700 (PDT)
Message-ID: <b4c069b6-b932-45a9-a681-f661bb0a89cf@redhat.com>
Date: Mon, 27 Oct 2025 14:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Add drm_panic support
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ryosuke Yasuoka <ryasuoka@redhat.com>
References: <20251023200447.206834-1-ian.forbes@broadcom.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251023200447.206834-1-ian.forbes@broadcom.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uKJS1fgfe52qEZ6eoYDhJWj3MJ5RQ8SGJHbq_tmOfTY_1761573387
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

On 23/10/2025 22:04, Ian Forbes wrote:
> Sets up VRAM as the scanout buffer then switches to legacy mode.

Thank you and Ryosuke for working on drm_panic support on vmwgfx.
For the use of the drm_panic API, it looks good to me.

Acked-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Suggested-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 33 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |  5 +++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  2 ++
>   3 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 54ea1b513950..4ff4ae041236 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -20,6 +20,7 @@
>   #include <drm/drm_rect.h>
>   #include <drm/drm_sysfs.h>
>   #include <drm/drm_edid.h>
> +#include <drm/drm_panic.h>
>   
>   void vmw_du_init(struct vmw_display_unit *du)
>   {
> @@ -2022,3 +2023,35 @@ bool vmw_user_object_is_null(struct vmw_user_object *uo)
>   {
>   	return !uo->buffer && !uo->surface;
>   }
> +
> +int
> +vmw_get_scanout_buffer(struct drm_plane *plane, struct drm_scanout_buffer *sb)
> +{
> +	void  *vram;
> +	struct vmw_private *vmw_priv = container_of(plane->dev, struct vmw_private, drm);
> +
> +	// Only call on the primary display
> +	if (container_of(plane, struct vmw_display_unit, primary)->unit != 0)
> +		return -EINVAL;
> +
> +	vram = memremap(vmw_priv->vram_start, vmw_priv->vram_size,
> +			MEMREMAP_WB | MEMREMAP_DEC);
> +	if (!vram)
> +		return -ENOMEM;
> +
> +	sb->map[0].vaddr = vram;
> +	sb->format = drm_format_info(DRM_FORMAT_RGB565);
> +	sb->width  = vmw_priv->initial_width;
> +	sb->height = vmw_priv->initial_height;
> +	sb->pitch[0] = sb->width * 2;
> +	return 0;
> +}
> +
> +void vmw_panic_flush(struct drm_plane *plane)
> +{
> +	struct vmw_private *vmw_priv = container_of(plane->dev, struct vmw_private, drm);
> +
> +	vmw_kms_write_svga(vmw_priv,
> +			   vmw_priv->initial_width, vmw_priv->initial_height,
> +			   vmw_priv->initial_width * 2, 16, 16);
> +}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> index 445471fe9be6..8e37561cd527 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> @@ -500,6 +500,11 @@ int vmw_kms_stdu_readback(struct vmw_private *dev_priv,
>   
>   int vmw_du_helper_plane_update(struct vmw_du_update_plane *update);
>   
> +struct drm_scanout_buffer;
> +
> +int vmw_get_scanout_buffer(struct drm_plane *pl, struct drm_scanout_buffer *sb);
> +void vmw_panic_flush(struct drm_plane *plane);
> +
>   /**
>    * vmw_du_translate_to_crtc - Translate a rect from framebuffer to crtc
>    * @state: Plane state.
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> index 20aab725e53a..37cb742ba1d9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -1506,6 +1506,8 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_helper_funcs = {
>   	.atomic_update = vmw_stdu_primary_plane_atomic_update,
>   	.prepare_fb = vmw_stdu_primary_plane_prepare_fb,
>   	.cleanup_fb = vmw_stdu_primary_plane_cleanup_fb,
> +	.get_scanout_buffer = vmw_get_scanout_buffer,
> +	.panic_flush = vmw_panic_flush,
>   };
>   
>   static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {


