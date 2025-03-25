Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD91A6EC0F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4379210E516;
	Tue, 25 Mar 2025 09:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CVUV8AGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7C010E516
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 09:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742893320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N4LhaTYwa8RvyEUg75c3OBECN63iLTGOyykdihD1vhI=;
 b=CVUV8AGMQnML3BFGSBrK8Y1yAo4lZR2LyFG6AWzmTJd5sjKWqDITCXeBMwtBTEb/n2NQL7
 DThMXyOaQ5R79Qz1zthQHeixbW4+wCHDdvY51apPJzEnZ3Z9vP7wI6CgIQ8u6LpxdGKFGp
 didbIJCHZc9C3i7DR9AePgIZG4+w1JI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-9lzZaOYoPAiLxn8AWF6aZQ-1; Tue, 25 Mar 2025 05:01:58 -0400
X-MC-Unique: 9lzZaOYoPAiLxn8AWF6aZQ-1
X-Mimecast-MFC-AGG-ID: 9lzZaOYoPAiLxn8AWF6aZQ_1742893317
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf5196c25so24844035e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 02:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742893317; x=1743498117;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N4LhaTYwa8RvyEUg75c3OBECN63iLTGOyykdihD1vhI=;
 b=FMzpTa/cHCdn/4WUT4cBi0LNyeEFGsUlK+807GjZzQlIMN/sDkFh4sO2mQ47jnGZf0
 M05EsCAUBuzMdJlEEMZXbCHS8NL3pV1Sf0++i7AGOqL4L8vcoPgKvISx5ylFd4D9LhDk
 4IeV7fDxdWDP60GiXEdxXaAZSKe9el7Pbwf9/Ss2DvVMK37+dbUFJzTH4JwAN+C+uAn7
 InN4EufcRlw8Pjpp4UElaTafOVtevWEKPnRn5aPAdOl1MmF1iQ+7bhLpQT+TsK6cpTSv
 CWa/oZDLQy2dajJ6m/6php7X8RXamELlbgZyHcS7e0oYzVzQRDnmP+91vObIySlJijXK
 9icw==
X-Gm-Message-State: AOJu0YzF9cSRq062rqhz8vvWu2pzmhwzuHa12jS+FrUhf6wVZBk9u+Gu
 nIsrcjIsbiQE+pTPitwGX7moPQsNTCaNhYkVQMBXAohdr8nJm6jpqBccGVvggKP17C74jgLjcPS
 K5gtjl9c8QMkHK+GI5j9w9UJRWL40SMm8Hm4l3GDDTqVSF7GJD0LZnFe/s1+n22JU7w==
X-Gm-Gg: ASbGncsztsMtKG0BkN0U6mDI4ru7ek4zVmCmlv+k4gXJpd6bDaXYltZ29XVCuAxm9QY
 NPsxPqQqLFWCyd1A1qnG5ge598syR0AiYEjAvagCPJ9YaoBdnnEffmhAU0AsMprhN66VN1+Z+cK
 /wIMM7e06WCirrkTs9zDvGdCBOsfZ1UGGx0/SuJNr4ngHYO/HKoQ6khmHwTaCOxDX7WL454Qi3i
 Eh6Jp2+A/IRaQuK2Om8nebal8AY78aZ+8Fph2vmb+uqhtcdn0I5meKpyZiPVNTCcj2CQdWKeabI
 aB9RMos4AdvhWqwGoYexg57M1AxIZukuZbwS9LPuyD6+O/D4UXbiOt8=
X-Received: by 2002:a05:6000:1f86:b0:390:f394:6274 with SMTP id
 ffacd0b85a97d-3997f93cd81mr14650744f8f.52.1742893316780; 
 Tue, 25 Mar 2025 02:01:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ68KeF2rmP1pOZfnL8RNSotkZubqTg+GyvXwW8o5aYQfYdIVBiw1LnA96SjNSwUIoVjyFBA==
X-Received: by 2002:a05:6000:1f86:b0:390:f394:6274 with SMTP id
 ffacd0b85a97d-3997f93cd81mr14650704f8f.52.1742893316308; 
 Tue, 25 Mar 2025 02:01:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b409fsm13374305f8f.50.2025.03.25.02.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 02:01:55 -0700 (PDT)
Message-ID: <e50f121e-1e63-47a4-ac1e-bb6666ecf1f1@redhat.com>
Date: Tue, 25 Mar 2025 10:01:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/ast: Validate display modes against framebuffer
 and format limits
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250324094520.192974-1-tzimmermann@suse.de>
 <20250324094520.192974-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250324094520.192974-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IiTYJAYduot2cnd5VfHo4CfeabhWREaEsctv4pkXQb4_1742893317
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

On 24/03/2025 10:44, Thomas Zimmermann wrote:
> Reimplement ast_mode_config_mode_valid() with DRM format helpers and
> ast's helpers for framebuffer size calculation. Replaces ast's open-
> coded assumptions on bpp and page-alignments.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index d3ed27faefd1..a9a3252ff3c2 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -51,6 +51,8 @@
>   
>   #define AST_LUT_SIZE 256
>   
> +#define AST_PRIMARY_PLANE_MAX_OFFSET	(BIT(16) - 1)
> +
>   static unsigned long ast_fb_vram_offset(void)
>   {
>   	return 0; // with shmem, the primary plane is always at offset 0
> @@ -960,16 +962,20 @@ static const struct drm_mode_config_helper_funcs ast_mode_config_helper_funcs =
>   static enum drm_mode_status ast_mode_config_mode_valid(struct drm_device *dev,
>   						       const struct drm_display_mode *mode)
>   {
> -	static const unsigned long max_bpp = 4; /* DRM_FORMAT_XRGB8888 */
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB8888);
>   	struct ast_device *ast = to_ast_device(dev);
> -	unsigned long fbsize, fbpages, max_fbpages;
> -
> -	max_fbpages = ast_fb_vram_size(ast) >> PAGE_SHIFT;
> -
> -	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
> -	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
> -
> -	if (fbpages > max_fbpages)
> +	unsigned long max_fb_size = ast_fb_vram_size(ast);
> +	u64 pitch;
> +
> +	if (drm_WARN_ON_ONCE(dev, !info))
> +		return MODE_ERROR; /* driver bug */
> +
> +	pitch = drm_format_info_min_pitch(info, 0, mode->hdisplay);
> +	if (!pitch)
> +		return MODE_BAD_WIDTH;
> +	if (pitch > AST_PRIMARY_PLANE_MAX_OFFSET)
> +		return MODE_BAD_WIDTH; /* maximum programmable pitch */
> +	if (pitch > max_fb_size / mode->vdisplay)
>   		return MODE_MEM;
>   
>   	return MODE_OK;

