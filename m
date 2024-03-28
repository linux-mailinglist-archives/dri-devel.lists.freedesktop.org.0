Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5B4890689
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 18:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9261C1123AC;
	Thu, 28 Mar 2024 17:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N9vFuzaX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32CE10ED39
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711645260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qd6vtGEjaeTzV1f2AcS0milHcb/EgWIylwqRgm6gjBE=;
 b=N9vFuzaXUvc+mV1jJPW1Vk8GGVtMz9rabNMIdaRceGn2VdHniPkR4eQ+VQd4KO6q11vWil
 YTxM0MAgb8Vrjm3mWAIirGTIiE9XphxQ0UNb8cyOB9TDMFjRVLZkAa4aEwFOOpFz/cHikh
 QAYpJMhRaLSRndQzhqooEERz3JaV9Xk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-DRD6x3avO7-iIIAtx2_Feg-1; Thu, 28 Mar 2024 13:00:58 -0400
X-MC-Unique: DRD6x3avO7-iIIAtx2_Feg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-41489176bd5so5651275e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 10:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711645257; x=1712250057;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qd6vtGEjaeTzV1f2AcS0milHcb/EgWIylwqRgm6gjBE=;
 b=dtlkh/18Z5VnDh9l8gbufNyXT1TXL7ZEOommMeZBRk1OjiQfd8l92YSXtmD/mZXbjK
 xDLZ0sqG+ylb2FGgs0sleETDutEp0scjSrZxrbYKuom79HhCRXhKVmEERuri5E0yiI69
 JrRwKcUl7JMB4VbxfiTjCET1a+Rz5dqzIgxzLsQnyiasViCFZtyy+AK8nIb8thQe48rO
 JvaZlJa7hEW5BE64kzf0CMZD3J1SApqTFcfAftGhfpmtfro2snq7gG70W2k9JlQIdAYn
 QQ0YDLeY2rD5qqRIDWbN4QZ45te6MRbf8X7kgHC8zbtU/Ewg9gRlACYOJn/4fL0OG9S5
 aKGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbGtUBAhAxQ3rNgFhbwuksprTQR2wubAx0nveswMn7O0wQ9EAi9KPDlL6jXKsglTQrw7rsYKmsdOc9EbjYC9Qo8POaiOeUDwRmG7M3u9M4
X-Gm-Message-State: AOJu0Yy7WPsEQq6pk/LUqn2X1vybazi/xmTuRSFo0bUpY7JCoTm3/D/g
 1OcG6r9F4bugk6JAOqEptsfPuM3VNX3kDS57rkxNnnmnTviH6EqXGiLRaPtmrjnM+XVKMpX4VfT
 d06r2Y9g34/jxu0s0ac7BG+zLlE7uIwprgxXrM1nczWgEvfCku3fxn75/+5DVd6pfxw==
X-Received: by 2002:a05:600c:1546:b0:414:c5:8503 with SMTP id
 f6-20020a05600c154600b0041400c58503mr2315124wmg.38.1711645257209; 
 Thu, 28 Mar 2024 10:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMU1YeDRsoWUWg166ruOHtocc/arSMbGoFCV9vPwHpC+elMIiA2PAku43lcB8JHeDBeeyjlg==
X-Received: by 2002:a05:600c:1546:b0:414:c5:8503 with SMTP id
 f6-20020a05600c154600b0041400c58503mr2315108wmg.38.1711645256913; 
 Thu, 28 Mar 2024 10:00:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c4f9200b004148c3685ffsm2893798wmq.3.2024.03.28.10.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 10:00:56 -0700 (PDT)
Message-ID: <a3eda30d-920b-4913-a207-a475d490115b@redhat.com>
Date: Thu, 28 Mar 2024 18:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau/gr/gf100: Remove second semicolon
To: Colin Ian King <colin.i.king@gmail.com>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240315090930.2429958-1-colin.i.king@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240315090930.2429958-1-colin.i.king@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 3/15/24 10:09, Colin Ian King wrote:
> There is a statement with two semicolons. Remove the second one, it
> is redundant.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> index 986e8d547c94..060c74a80eb1 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -420,7 +420,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>   			return ret;
>   	} else {
>   		ret = nvkm_memory_map(gr->attrib_cb, 0, chan->vmm, chan->attrib_cb,
> -				      &args, sizeof(args));;
> +				      &args, sizeof(args));
>   		if (ret)
>   			return ret;
>   	}

