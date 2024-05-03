Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3559C8BB0D4
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF7410F97C;
	Fri,  3 May 2024 16:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ebpgr3Yg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAB410F97C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 16:23:24 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6f4496af4cdso1016118b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 09:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714753403; x=1715358203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mwKDafe28MIieMSNGIPW3eOTsHHrwRXu1m7RhuwOcZc=;
 b=ebpgr3YgfmewPrNnQPeWtBbETUIy2Q/zYiV3EkorZ08qgO+2EuNlfoil/hgJ0lAKiZ
 Xdef/mpR3wdNDGi2q4oMgJiWHeRgNXMg7Wm38E75G6SqLUN0UUalYJj2YSiWUDCofLgd
 gaJH3fLHqRjUgwEJQAkB8rXmubCPN/2DIkPgPWLFDngw5dpRDOCkQFO7L+axDcPhgh4F
 gwDQsoUFXqbv4pbPwOMB0FZS8EnNUKFj65iqJsPKN1lmDaNvU+3WBAyZ/r3Aaxxpy5rR
 TNJ7LTBB/f2ImJGmSfbzVULfiNlK/d1Zd+0QAO2kv+GRaiuvIbmRAmD31VTiH4YvsAfM
 FpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714753403; x=1715358203;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mwKDafe28MIieMSNGIPW3eOTsHHrwRXu1m7RhuwOcZc=;
 b=uu4OK2MZT0dlPCJJ/jn7eDp3gUTNmURPLKtghpFb/IxX0+Fw09GUjuWQZIyzn4tMct
 kZGxt/fmoz+jY74Edvi5RnT/4OU9B6gAJj7qn8LCZEGlGzqSZIYUDczOoEtxZvszgwTT
 VQzQ5mjE0HMj/2zVM8vV1gga73IYYJ8b7vrPNuRfAtq9nsA4DsBoEzy1ZIlxrcQS6yol
 grPJPOYr1udrwxFplGZVO+3BtHwnpuNwZcPMxERaEvIo1B8r9Qc+7r8UZaLTEtaogr9Z
 6TzykezeexxTPbUTYDHlUKDyAAUzKeqX20PeQm+x4CUuDUWszBkxsAnN/SwHop1Apjs8
 0SKw==
X-Gm-Message-State: AOJu0YzD51+gVToTE5un2lxg7fTIZsZ5B2ovWrXgnIxMNBzctL6FWxQ/
 hCs6oya80Oab9vlT917K6Emjx4xcbGC/lIimpEOOHRHZFFMD7AZC
X-Google-Smtp-Source: AGHT+IGuqVde44+OlfespuDSTAfHKUhnMDH3dyay8UhKf4umdgctT17gfataxz2qw5xl3u+0CdUBww==
X-Received: by 2002:a05:6a00:130a:b0:6f3:e6e0:d9fb with SMTP id
 j10-20020a056a00130a00b006f3e6e0d9fbmr3124846pfu.11.1714753403334; 
 Fri, 03 May 2024 09:23:23 -0700 (PDT)
Received: from ?IPV6:2402:e280:214c:86:b096:5d6e:50c3:70e5?
 ([2402:e280:214c:86:b096:5d6e:50c3:70e5])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a639351000000b0061cf79eab38sm1612625pgm.37.2024.05.03.09.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 09:23:23 -0700 (PDT)
Message-ID: <f87bfbb1-b80f-46a5-be85-058a406de99d@gmail.com>
Date: Fri, 3 May 2024 21:53:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next] gpu:ipu-v3:pre: replace of_node_put() with
 __free
To: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com,
 Julia Lawall <julia.lawall@inria.fr>
References: <20240427045024.7083-1-prosunofficial@gmail.com>
Content-Language: en-US
From: R Sundar <prosunofficial@gmail.com>
In-Reply-To: <20240427045024.7083-1-prosunofficial@gmail.com>
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

On 27/04/24 10:20, R Sundar wrote:
> use the new cleanup magic to replace of_node_put() with
> __free(device_node) marking to auto release when they get out of scope.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: R Sundar <prosunofficial@gmail.com>
> ---
>   drivers/gpu/ipu-v3/ipu-pre.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/ipu-v3/ipu-pre.c b/drivers/gpu/ipu-v3/ipu-pre.c
> index aef984a43190..95830cf8fa3e 100644
> --- a/drivers/gpu/ipu-v3/ipu-pre.c
> +++ b/drivers/gpu/ipu-v3/ipu-pre.c
> @@ -113,8 +113,8 @@ int ipu_pre_get_available_count(void)
>   struct ipu_pre *
>   ipu_pre_lookup_by_phandle(struct device *dev, const char *name, int index)
>   {
> -	struct device_node *pre_node = of_parse_phandle(dev->of_node,
> -							name, index);
> +	struct device_node *pre_node __free(device_node) =
> +		of_parse_phandle(dev->of_node, name, index);
>   	struct ipu_pre *pre;
>   
>   	mutex_lock(&ipu_pre_list_mutex);
> @@ -123,14 +123,11 @@ ipu_pre_lookup_by_phandle(struct device *dev, const char *name, int index)
>   			mutex_unlock(&ipu_pre_list_mutex);
>   			device_link_add(dev, pre->dev,
>   					DL_FLAG_AUTOREMOVE_CONSUMER);
> -			of_node_put(pre_node);
>   			return pre;
>   		}
>   	}
>   	mutex_unlock(&ipu_pre_list_mutex);
>   
> -	of_node_put(pre_node);
> -
>   	return NULL;
>   }
>   
Hi,

Any feedback on this patch.

Thanks,
Sundar
