Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED60CA5685F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 13:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB8710E7EF;
	Fri,  7 Mar 2025 12:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xn8rLXXC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617B110E7EF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 12:58:54 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43bcfa6c57fso10372185e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 04:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741352333; x=1741957133; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YomAr+jLWfyA0js2DUztzDdpoJnP9vpapwzHnnzJhTM=;
 b=Xn8rLXXCgTY2cRGM4UBqqzV1Jx9k/S+FsfawRRbUpaOFBUE9nA1RFMmpuQTrY8r+1/
 R0eKVdHC0egaYbib09Okjc0vnP47erKQ+DnDIuB/UfCylwvkgx581Xnhd6yci6toyWNc
 1jEcn6hl9wAVtyS+kfLi7S9B2jkLS/IjQ77m5lTfym9CilmN3XDvz54xFvDf6JttyY8t
 c7YkAb+9o1KkgdQ7fg0bjaMtR2qh7eTOLQaTSrEf0YRKuVzloc7qzRHi6InPkhnh+eQS
 7gQu/Fv08l69cDdZZUtb/pzaOcq/2U/OG7UGsGXXP7V5izAVsOv88iGhKMA5caFSOTWS
 azUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741352333; x=1741957133;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YomAr+jLWfyA0js2DUztzDdpoJnP9vpapwzHnnzJhTM=;
 b=c4UwZOApqWYbucMngFKQ9DyE/OibtOnmNHhW8KkOl4G5GQcmP28sazZ44ma5GUTsG5
 poDId5u8Q04gUUBvHy9mwMgG7cvQCN27LgY435bjp0ieFfbSrHi/zzB2TZMcF5AAqkk3
 qW2FQRaZbQa4GXP26MLHr5uhmNp2ZSMeY2ey43rzhT8UOigOWe4ZE7lzl9TXwVwS0Hrg
 /SaJXi/9+v2P55lJYJTX62QICa4JOdLZfZ5TInyEj6Ewh3WVXezH8P1l70sWK+NKOqf5
 Iuq8HX0dP/zKQ10fjkjnIV34ASMlGemtj+GC3s8q3J3Hj1+fi05GKK6cULqmd2LUZoaZ
 FsEw==
X-Gm-Message-State: AOJu0Yz25o8SdJZuCux7BGOyd3g181/TuuuFJ1ZD5H2s21dpHwFQ/79Y
 cJXS+QG83OENcBjXrEho3ucNVfQ3D5Wo1tMUhSx5Qq+qJG2BD2sE
X-Gm-Gg: ASbGncu+TnCvgzChc8pf8B7UsA4CANF6lImYXOtIOq1HDFzoNprGHU8j3BvsZKsb64e
 ijZZ6ViKyurW6haQxH2zg2HH/P7gb9+RCncWY49L3Cn7e3ROzD1cepJdTD7aH4HGkWIiMbr4j3e
 y8JLPBPHtjNGYGRvTljza4zgBp6O8RV8/c8IxR7uWZBCH5q4pdA3We6TXwjbDbdkndZga0fS2rO
 1jbqB/yN8peqyvnRm3LNVsjriB4HERnjGQK7bLqMyXV1zDpv1oCKVsPvEnmEsnEVCgfStWnQ2e5
 5qdSpzZFAV2FKqogEns+COI0iocr8T1dQD8BNscuoU5dLcjU+ZkfnAJ3bj+Xd6O5ErC7CplF5Wt
 YDHKe1peOlFgq2Q==
X-Google-Smtp-Source: AGHT+IHMt8TRlwPSb4W92+vucsZxD3dN6Z2G83XFOb+e9H+0srYcaupVFJUs2dMUm7RWODeqky3+lg==
X-Received: by 2002:a05:600c:19d0:b0:439:8a8c:d3ca with SMTP id
 5b1f17b1804b1-43c5cf3cea3mr22038715e9.29.1741352332403; 
 Fri, 07 Mar 2025 04:58:52 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfdfdsm5426950f8f.34.2025.03.07.04.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 04:58:52 -0800 (PST)
Message-ID: <ee3989a0-e03b-4947-acef-7174fef9d36b@gmail.com>
Date: Fri, 7 Mar 2025 13:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sti: fix inconsistent indenting warning
To: Charles Han <hanchunchao@inspur.com>, alain.volmat@foss.st.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250305101641.2399-1-hanchunchao@inspur.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20250305101641.2399-1-hanchunchao@inspur.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le 05/03/2025 à 11:16, Charles Han a écrit :
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/sti/sti_hda.c:696 sti_hda_bind() warn: inconsistent indenting
> 
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Hi,

Acked-by: Raphaël Gallais-Pou <rgallaispou@gmail.com>

Thanks,
Raphaël
> ---
>   drivers/gpu/drm/sti/sti_hda.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
> index 14fdc00d2ba0..6c9a49146f44 100644
> --- a/drivers/gpu/drm/sti/sti_hda.c
> +++ b/drivers/gpu/drm/sti/sti_hda.c
> @@ -693,7 +693,7 @@ static int sti_hda_bind(struct device *dev, struct device *master, void *data)
>   
>   	connector->hda = hda;
>   
> -		bridge = devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
> +	bridge = devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
>   	if (!bridge)
>   		return -ENOMEM;
>   

