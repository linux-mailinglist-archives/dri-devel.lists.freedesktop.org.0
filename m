Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4054AEF9A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 12:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFFF10E2C9;
	Wed,  9 Feb 2022 11:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBBC10E31E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 11:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644404570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nef1goY/slt7UBZOkizAts7GcGY5ITyc9fc+g3Ej4is=;
 b=IptJsJ52CczIaRV6a/goK862eheAU2CfcMJS/rxEDLo1VDIptWQ2/VtAU4uTNr94eBhr6E
 6CDVsxpOF8+DqbJ4dWawnXdg7IyL57jXUuBHukxLfq7LNllxCVs7KPdf3dnFKJQGdTSMrT
 rdt2r0PdbVJYrZO2aZg8Vb/teB+JpQ8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-oP9N5fS1MkGy34oP5TmwBQ-1; Wed, 09 Feb 2022 06:02:49 -0500
X-MC-Unique: oP9N5fS1MkGy34oP5TmwBQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so972138wrc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 03:02:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nef1goY/slt7UBZOkizAts7GcGY5ITyc9fc+g3Ej4is=;
 b=ssujxZPb1DLT2gohwQV/vxF/DpA8eeUgOfp8OOY7g8s+i2epqnhPGZOAsQ+6kiVdxY
 mQtU6eCusdtwsplTSYAbaYcDoTEpYDSq9A3wtJJVeT2siaIc1FF53HoWWo5eWR0x+T+J
 ohViLHnvURX8oqvxDULg6KsGo7t8ZcRoGk2AGdJtElz+nKAzUmYeypGRN/MRW+uGdlGo
 gAIP7O96D9udFzpHyLXinlWP+z87QnPbj7gpCJPwQkPpV9TmWGWhsVRTjtDiUIJGgDYY
 hTEq8CZc0tdm3twL/mqv6jHTjQtXT17vQqqgR94mUkv2MKyoIXqnk6OKrghfTV1BXJB7
 vtNw==
X-Gm-Message-State: AOAM532RcozZq7Ni94UPSw479F9wcKisujH/PTxY7jHGSo1Vr8Z+i4W3
 4qHPZUFzMPTXl9RkedwVHM0aTdtDdGnph5v2EJFOp3rzXz1dB1m+45PgaLLTDEUKYCqchuxa/R5
 lKCIeyOV2ejbclEBhZm1fqkB33Vrc
X-Received: by 2002:adf:ea11:: with SMTP id q17mr1628940wrm.204.1644404568541; 
 Wed, 09 Feb 2022 03:02:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJuwR//wwSHP0DQR6RaZg1S41g4bceGx5FADwVg4VgnLDZBwky1cJ7TcTQMycU2J7+8TJEdQ==
X-Received: by 2002:adf:ea11:: with SMTP id q17mr1628929wrm.204.1644404568358; 
 Wed, 09 Feb 2022 03:02:48 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id d7sm5250241wmb.18.2022.02.09.03.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 03:02:48 -0800 (PST)
Message-ID: <978298f5-3775-c19a-37b0-8eec2f3aa696@redhat.com>
Date: Wed, 9 Feb 2022 12:02:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] drm/fb-helper: Calculate damaged area in separate
 helper
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 sam@ravnborg.org, noralf@tronnes.org
References: <20220206192935.24645-1-tzimmermann@suse.de>
 <20220206192935.24645-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220206192935.24645-4-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/6/22 20:29, Thomas Zimmermann wrote:
> Add drm_fb_helper_clip_to_memory_range(), a helper function that
> accepts an linear range of video memory and converts it into a
> rectangle. The computed rectangle describes the damaged area in
> terms of scanlines and pixels per scanline.
> 
> While at it, make the code more readable by using struct drm_rect
> and related helpers.
> 
> The code was previously part of the deferred I/O helpers, but is
> also useful for damage handling of regular write operations. Update
> the deferred I/O code to use the new function.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 87c47093c3a2..ae98990c7b66 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -680,6 +680,19 @@ static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
>  	schedule_work(&helper->damage_work);
>  }
>  
> +/* Convert memory region into area of scanlines and pixels per scanline */
> +static void drm_fb_helper_clip_to_memory_range(struct fb_info *info, off_t off, size_t len,
> +					       struct drm_rect *clip)
> +{

Shouldn't be called drm_fb_helper_clip_from_memory_range() or
drm_fb_helper_memory_range_to_clip() instead ?

Otherwise it looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

