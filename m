Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E0994D3FF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 17:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9647A10E965;
	Fri,  9 Aug 2024 15:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YhcXRB7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2CA10E965
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 15:52:02 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-812796ac793so7833439f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1723218722; x=1723823522;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KF0ax7W1P20MaxQnCV8sySibamf26ozw3OigTBi50ug=;
 b=YhcXRB7XUqZqDWR8s4k5UjOLzd0HyvUsIvPJxq+6M4DxaLA20+sP8meQbQFTfhHU5K
 RrY6hkNkoZQcSICXGKfiqeBxii+ml+52rZOdKSZ8CiNQTjwtiq2dqrh38pnsooEk1ril
 Zu4VsMEp5iRliPubI52jZs/08cxsWRS82dWVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723218722; x=1723823522;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KF0ax7W1P20MaxQnCV8sySibamf26ozw3OigTBi50ug=;
 b=AXQEqeIs0wBfNtNVxqSRSedcjTjdMagsDv7prMveXyGKH3Npr2ye/S0Qjf/elQ/mb6
 lgi+OzThd/D7ipw4VoWcYt5oBAwvuzW83R5wNe+GSg2Eg1Vr9t2uGO/JnqBSpNSJsBkd
 3DPYALc10JwimiHwPyGGvO0qsffeQRxgZ66bqmmUaYzZJNLDG7G8E+H5oQp4nb89o0Ko
 RoeubdH2MdE2gUlHq439+PYxe6pj9uTzFsC2UM1c/E++6MM7DKN3J7E/M5RUp+AITkMF
 8ZZ7dZtUIMe9DHBbbk7G8yH1fLVhGbOnfKUsFcoc6Z/YKir3LJjlotvrmb5t74u8cpJm
 n2cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8I7p2MmWFhF89xTASk8uVVA0bCHIu9UO3F030WLFnhiLYnSdzwI8wvMeGAuEPreZ2Iv5M3ZY2X40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbqji6AYXFA/84uP5y84jp8pgcUn2a0lv/RHUip0ZLXAxmjAZm
 AgtYRicdynwi+Tumbu7mSvGyk54mhL+qG5/FVKAXfG1dnfApOxu+5OVX9E/+eVg=
X-Google-Smtp-Source: AGHT+IEacVzfZxGYgS2156+QwFCiFEXj4BEbmIa8BBPXXEUNPS4UZLc9VOdK5aRJKr56+itJk9oxfw==
X-Received: by 2002:a05:6e02:1aa9:b0:39a:ef62:4e96 with SMTP id
 e9e14a558f8ab-39b86f8553dmr14604925ab.4.1723218721875; 
 Fri, 09 Aug 2024 08:52:01 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39b20ab6c3bsm65747215ab.47.2024.08.09.08.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 08:52:01 -0700 (PDT)
Message-ID: <2036d89d-0387-4477-92b5-7d220b0430ba@linuxfoundation.org>
Date: Fri, 9 Aug 2024 09:52:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kerneldoc: Fix two missing newlines in drm_connector.c
To: Daniel Yang <danielyangkang@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240808084058.223770-1-danielyangkang@gmail.com>
 <20240809032350.226382-1-danielyangkang@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240809032350.226382-1-danielyangkang@gmail.com>
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

On 8/8/24 21:23, Daniel Yang wrote:
> Fix the unexpected indentation errors.
> 
> drm_connector.c has some kerneldoc comments that were missing newlines.
> This results in the following warnings when running make htmldocs:
> ./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2344: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> ./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2346: ERROR: Unexpected indentation. [docutils]
> ./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2368: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> ./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2381: ERROR: Unexpected indentation. [docutils]
> 
> Signed-off-by: Daniel Yang <danielyangkang@gmail.com>
> ---
> 
> Notes:
>      v2: added "Fix the unexpected indentation errors" line to description.
> 
>   drivers/gpu/drm/drm_connector.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 80e239a6493..fc35f47e284 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2342,7 +2342,9 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
>    *
>    *	Default:
>    *		The behavior is driver-specific.
> + *
>    *	BT2020_RGB:
> + *
>    *	BT2020_YCC:
>    *		User space configures the pixel operation properties to produce
>    *		RGB content with Rec. ITU-R BT.2020 colorimetry, Rec.
> @@ -2366,6 +2368,7 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
>    *		range.
>    *		The variants BT2020_RGB and BT2020_YCC are equivalent and the
>    *		driver chooses between RGB and YCbCr on its own.
> + *
>    *	SMPTE_170M_YCC:
>    *	BT709_YCC:
>    *	XVYCC_601:
> @@ -2378,6 +2381,7 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
>    *	DCI-P3_RGB_Theater:
>    *	RGB_WIDE_FIXED:
>    *	RGB_WIDE_FLOAT:
> + *
>    *	BT601_YCC:
>    *		The behavior is undefined.
>    *

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
