Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FF294C008
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 16:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B749110E61C;
	Thu,  8 Aug 2024 14:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dRWh4hbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC1910E61C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 14:45:13 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-81f8d55c087so4535639f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 07:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1723128313; x=1723733113;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LOyLR96pj1FmhAY2pd0AwP2D0CmcEpgxNczBjEIKOY0=;
 b=dRWh4hbqQa9bpCu+1G4WWvzjTQP5ICt0dP84vq8qgabZ+6peL3EWETg6HLYxIfBsU+
 DDM26/vjstyysMgAYmJFQRm4C/FbgtC365oYfISADZl4WunD3zoGUyDl0uZUbxQzFY1t
 NNpv3Vebj2njnHWabRT7/aoCagklmFcwhFmFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723128313; x=1723733113;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LOyLR96pj1FmhAY2pd0AwP2D0CmcEpgxNczBjEIKOY0=;
 b=KknqwYUAyIE6RuP9El9Tr+/d5Ggem7qcE0IL/GTYJEHbwRNXQ61cuTk8EMlEBNF86s
 EP4cd0uWbnOhG5zPW1Wzeq4z/RHmjfL1c9vMCGTMoAp7gGqzyRcZLSsy4YFAUJIZsbF3
 u0rcujeD9ac51N9P2La4XaSRXHBtKK8JDodYYy95Mm37k2HA5d/pbBmYjqY/vZXPD1AF
 Mk0dSKbOl5X4Yxt5vL9/+0lugQm/c2xOhcBxJextDwgvv5ooLI3B6cReMxrkC20EGZcm
 7K5vJgmwWHe+KtPVzz2mZjA17OE22S1Xiil0T6fZ/4PQ/m4Oq+V1thBCPK1KRUItnHlK
 l0Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbQfKL0Z40DC8hGP8coG4Du9CZoySidMgR3CdWgKJTecqgqGNpBILZmFd7LrSfVAYKDBHD1p5lseaR94CLnJdRjO2OKNoBL6EPiVB8mn0M
X-Gm-Message-State: AOJu0Yy2NyUKEjY9rCUCZOZriwbewEE/hvfmGV4WobLWPpxMHT7aaDjX
 m+kjPrwc1CIMEH0TlnfZ7tsmAPWaPxiZ63w0zvXwK4Y1fspF0Wvy1wtMdOn4nUE=
X-Google-Smtp-Source: AGHT+IGIrmSZpTANKFadpi4Xa8lpeuWa1JDx7izZT0ePNLlGrzbH9rBwlgoGg+JdS+CnC09zUSfpqg==
X-Received: by 2002:a5d:9317:0:b0:821:dad2:cc0 with SMTP id
 ca18e2360f4ac-82253773b3bmr160018039f.0.1723128312636; 
 Thu, 08 Aug 2024 07:45:12 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ca6300b223sm240120173.131.2024.08.08.07.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 07:45:12 -0700 (PDT)
Message-ID: <86c0af63-d5b6-4076-ac50-36ac4334c8b0@linuxfoundation.org>
Date: Thu, 8 Aug 2024 08:45:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kerneldoc: Fix two missing newlines in drm_connector.c
To: Daniel Yang <danielyangkang@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240808084058.223770-1-danielyangkang@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240808084058.223770-1-danielyangkang@gmail.com>
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

On 8/8/24 02:40, Daniel Yang wrote:
> drm_connector.c has two kerneldoc comments that were missing newlines.
> This results in the following warnings when running make htmldocs:
> 
> ./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2344:
> WARNING: Definition list ends without a blank line; unexpected unindent.
> [docutils] ./Documentation/gpu/drm-kms:538:
> 
> ./drivers/gpu/drm/drm_connector.c:2346: ERROR: Unexpected indentation.
> [docutils] ./Documentation/gpu/drm-kms:538:
> 
> ./drivers/gpu/drm/drm_connector.c:2368: WARNING: Block quote ends without a
> blank line; unexpected unindent. [docutils] ./Documentation/gpu/drm-kms:538:
> 
> ./drivers/gpu/drm/drm_connector.c:2381: ERROR: Unexpected indentation.
> [docutils]

Add a line to say "Fix the unexpected indentation errors"

drm maintainers will have a final say on this. :)

> 
> Signed-off-by: Daniel Yang <danielyangkang@gmail.com>
> ---
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

thanks,
-- Shuah
