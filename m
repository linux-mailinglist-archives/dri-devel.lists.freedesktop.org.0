Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927FE95AC52
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 06:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3784F10E03D;
	Thu, 22 Aug 2024 04:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nbo++jSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C32010E03D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 04:00:45 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7a18ba4143bso311731a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 21:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1724299244; x=1724904044;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IC6CfuTtEHvKBNzqsZ0ny4OYlztAT2lA7Mfqh0zGmfs=;
 b=Nbo++jSUuilJgwyFwvt3FUfAt9lzEV2l1CLmayWIiLQkDMCdwr2XsWWhNy+oubeoOf
 ckugPcd+AJIfXNWeJKI5iGo/sT+9Xgh1PftxJ3OtPW1QKB6ckjrSuQYB4ofN054P2h6Q
 iEPtl9Nz6ClUpO/PLRBfwveZuqgSzBC774m94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724299244; x=1724904044;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IC6CfuTtEHvKBNzqsZ0ny4OYlztAT2lA7Mfqh0zGmfs=;
 b=sh4Sh5SM+H1xykQnMulvYCBA6ghVnisrR8Tu9//6u5nvt4YqztbBiWPsgYaNRHar3Z
 SdabuuFnHP+1Un+B4h4gp/ic57PXBeI4rq8qdoVe8n20LVgwaCehFltBfLvJh1tLfsY3
 ygKsfDhEeKeV+fc1idOFmW8EpjOU/QyhdYBdL/pbrP/nTZgBp7Shp5Oqsm4RsMeYrzy3
 erv/CHYFYZxAz0691MGf4/Zt8VbjB9vRXlmrrBTC0UGOJC9uDopSjdOWfFykzucsPTqm
 87BMLbbzTtBz3Wku4cjTsA1BtVOK2LhGG5y0DCqu2ZFPUjJSpcgXfbziFM5vdoL6L0/Y
 GuHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVld+idoWXcOa7tSgZxjqQKMDuw6NmbI8lSNMYs2Y1UIWK2J5FMei5TbiCqNjVm/BDYyYW8YdAGirQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTXs30yzQkRChKJJab0QvfPHHcY073ctRHGeYXitiNe6DUk+yD
 MfdpphnpBIYk+zgmg/1xe3DHGRl5iaz/jC6S+uosFlxhM/MbiB5303WiCavotAEb+gezpQFb03i
 CM88=
X-Google-Smtp-Source: AGHT+IGpiUh7868KEC0x1i2/YY+kSSNWvJC4PyummMLhe5yqtFWXCz4fCtcDkQFRLNryHKTDBEqj/A==
X-Received: by 2002:a05:6a21:918a:b0:1c6:a83c:d5db with SMTP id
 adf61e73a8af0-1cad7fd2893mr4553030637.31.1724299244174; 
 Wed, 21 Aug 2024 21:00:44 -0700 (PDT)
Received: from [172.20.0.208] ([218.188.70.188])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd9ad55b2asm391187a12.71.2024.08.21.21.00.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 21:00:43 -0700 (PDT)
Message-ID: <d18ac213-a4cf-4a29-a696-0e99b45b96e2@linuxfoundation.org>
Date: Wed, 21 Aug 2024 22:00:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include: uapi: drm: drm_mode: fix documentation and
 coding style issue
To: Nihar Chaithanya <niharchaithanya@gmail.com>,
 maarten.lankhorst@linux.intel.com
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240821202039.63516-1-niharchaithanya@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240821202039.63516-1-niharchaithanya@gmail.com>
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

On 8/21/24 14:20, Nihar Chaithanya wrote:
> Fix documentation and coding style issue in include/uapi/drm/drm_mode.h.
> Changes include:
> - Adding description of function parameter.
> - Correcting block comment style.
> 
> Fix documentation warnings in include/uapi/drm/drm_mode.h encountered
> from make htmldocs:
> ./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member 'width' not described in 'drm_plane_size_hint'
> ./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member 'height' not described in 'drm_plane_size_hint'
> 
> Fix coding style warning in include/uapi/drm/drm_mode.h reported
> by checkpatch.pl:
> WARNING: Block comments use a trailing */ on a separate line
> 
> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
> ---
>   include/uapi/drm/drm_mode.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index d390011b89b4..bbdba76a5d25 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -147,7 +147,8 @@ extern "C" {
>   
>   /* Scaling mode options */
>   #define DRM_MODE_SCALE_NONE		0 /* Unmodified timing (display or
> -					     software can still scale) */
> +					   * software can still scale)
> +					   */
>   #define DRM_MODE_SCALE_FULLSCREEN	1 /* Full screen, ignore aspect */
>   #define DRM_MODE_SCALE_CENTER		2 /* Centered, no scaling */
>   #define DRM_MODE_SCALE_ASPECT		3 /* Full screen, preserve aspect */
> @@ -864,7 +865,9 @@ struct drm_color_lut {
>    * array of struct drm_plane_size_hint.
>    */
>   struct drm_plane_size_hint {
> +	/** @width: Width of the plane in pixels. */
>   	__u16 width;
> +	/** @height: Height of the plane in pixels. */
>   	__u16 height;
>   };
>   

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
