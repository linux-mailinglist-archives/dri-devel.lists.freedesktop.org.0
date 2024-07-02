Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7176A92425F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 17:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBEE10E079;
	Tue,  2 Jul 2024 15:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XPUpsGFH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F24310E079
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 15:29:19 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42565697036so32442665e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719934157; x=1720538957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M37+WZeSe+oikF2i/7+dIIsR6vGmSE7qj6kzbbudUC0=;
 b=XPUpsGFHEXDosxvfY/Rq+maDfpmEftSf/lrQQlbo35zWLedlgkfKz2mQOZqq/aIN7U
 v5Gl5U4FQD3xLNrbner/AcUx9opmQOdo3R7W8VPqTJvm4eizttgliIKG6OrAm61oLf52
 sekLyg9injTSu9cVesbB8Ulfaa12biZwl59/88ruha4t2r6As5V9aQs1jo+kDJjgnGba
 sDUsh3zxfZd8Aj61BJdE27D9yEgWtxbNID8j+6o1Uxpa/RSFvboU6lD99y13szE16MJO
 U4/fDxuVLLPQNT28+Ww+fdAfYnWdv9sJbzsiXNm3B+gHQv/NHwwIlYrCKE3FWysIcKmD
 qIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719934157; x=1720538957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M37+WZeSe+oikF2i/7+dIIsR6vGmSE7qj6kzbbudUC0=;
 b=aqI3fFn6EJiWLhzJq3gJ2pC/ZoNwNRRzjDdGUY374Yt3dQt2TBaoNreld4ufayd1Sh
 20/fy33y2LkvVbeJi1GmxVpjR7KpWxEeXMxU4iz3ToPMTThqp3T6zZ1mJALN38eYBi6I
 10HVK2C9Jj04i4tnGV/XmSBwv5VLWmJ3F7CuPVif9BtNHetebHH3z+3kHGyUbMj1p7Fo
 /0x/d4m7vU7hzEaJ//ELX8Z9Id5lFfGp1+yYw0HqZMSptuZCyfE9qwbK2uBnsEQn76ny
 LjxEDP+CqrxnQpoSfRNeXFnNHd7PBCfqWTV9BalOJ029SYpl9ug9hm80RI5klPpUQHdh
 rMvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjqRnLij9z5NPwml5GdvU79rcg2mplNCIRE5RTe4V49ovMESk3zli90I1LNcMRMmu1rihiIq4/ac9Tku1wfeWlOBK79Beykrsb3r+ynixu
X-Gm-Message-State: AOJu0YzXzwQzs4GTpVYtHtBKxhuzF8f5eUBR8UsjlDKCe33rwxRyNJUs
 agRJ5W8uzh/SCOCHoWbOCWb5dlDtBXiUbX0oBZbapZ19vo0iPDc0gaY5aqtq
X-Google-Smtp-Source: AGHT+IFm4ASczFv+04gwkE02HpGzFWOJlA4riesLhyWmf9wxQVWR6d3VoZtP1C6Q6/pMuYMIm0DbyA==
X-Received: by 2002:adf:ec03:0:b0:367:8e63:4da4 with SMTP id
 ffacd0b85a97d-3678e634fa5mr971274f8f.14.1719934157387; 
 Tue, 02 Jul 2024 08:29:17 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at.
 [84.115.213.37]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5a3b0sm203368325e9.13.2024.07.02.08.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 08:29:16 -0700 (PDT)
Message-ID: <035757b1-5dc5-4966-9eaf-a52b707bd48e@gmail.com>
Date: Tue, 2 Jul 2024 17:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: ipu-v3: Removal of of_node_put with __free for auto
 cleanup
To: Abhinav Jain <jain.abhinav177@gmail.com>, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, julia.lawall@inria.fr
References: <20240702150109.1002065-1-jain.abhinav177@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240702150109.1002065-1-jain.abhinav177@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/07/2024 17:01, Abhinav Jain wrote:
> Remove of_node_put for device node prg_node.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
> ---
>  drivers/gpu/ipu-v3/ipu-prg.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/ipu-v3/ipu-prg.c b/drivers/gpu/ipu-v3/ipu-prg.c
> index 729605709955..d1f46bc761ec 100644
> --- a/drivers/gpu/ipu-v3/ipu-prg.c
> +++ b/drivers/gpu/ipu-v3/ipu-prg.c
> @@ -84,8 +84,8 @@ static LIST_HEAD(ipu_prg_list);
>  struct ipu_prg *
>  ipu_prg_lookup_by_phandle(struct device *dev, const char *name, int ipu_id)
>  {
> -	struct device_node *prg_node = of_parse_phandle(dev->of_node,
> -							name, 0);
> +	struct device_node *prg_node __free(device_node) =
> +		of_parse_phandle(dev->of_node, name, 0);
>  	struct ipu_prg *prg;
>  
>  	mutex_lock(&ipu_prg_list_mutex);
> @@ -95,14 +95,11 @@ ipu_prg_lookup_by_phandle(struct device *dev, const char *name, int ipu_id)
>  			device_link_add(dev, prg->dev,
>  					DL_FLAG_AUTOREMOVE_CONSUMER);
>  			prg->id = ipu_id;
> -			of_node_put(prg_node);
>  			return prg;
>  		}
>  	}
>  	mutex_unlock(&ipu_prg_list_mutex);
>  
> -	of_node_put(prg_node);
> -
>  	return NULL;
>  }
>  

Hi Abhinav,

Apart form having sent two different patches with the same title (hence
the confusion), this cleanup is right from a functional point of view.

On the other hand, the description should address why you are doing this
cleanup (e.g. to remove the need for explicit of_node_put() when the
variable goes out of scope). The need for of_node_put() does no vanish,
it is only automated and no longer visible at first glance by means of
the cleanup attribute.

Best regards,
Javier Carrasco
