Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1862D8B795A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 16:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8446E10E9BD;
	Tue, 30 Apr 2024 14:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gNPf4CHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD88810FD64
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714487302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/MM0Zw96Qb6fDdqFHf7PUfcuVaMhbi/uJt8dRXGIYQg=;
 b=gNPf4CHWrmbofEoIMetSrbUj/5XmyaQFXck2I3riS+u37pPO7bmUQigakkKsw07U6i7woP
 g0ZXdrbXiR1v24K65ZcQPylO0aY5RWHV8n8bfIdzcMML67NOljQIeiRpjw0diT1O0PHps0
 dYMQdnGX5mIP5xNRDwLQ/+PbYomTdok=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-F1el79OzNziql413RVt2hA-1; Tue, 30 Apr 2024 10:28:21 -0400
X-MC-Unique: F1el79OzNziql413RVt2hA-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2d87b880861so50414881fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 07:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714487300; x=1715092100;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/MM0Zw96Qb6fDdqFHf7PUfcuVaMhbi/uJt8dRXGIYQg=;
 b=bny787PhtJILUje6axYn0FJ97jAGFSUE7Nmu+L9aLi56Lsmq1ky8zrN/os3ctHb4rB
 VIjgIZZXVOqkKSAf/GcFXkhQ/Deh2dASQtR7jPLI/Om+BtmqnKIzHdQztUErRKi7kb3T
 CFnYjGmPgd71w/MUtv/9JGHu4pO7y7uA9maS65E6G8e/MHNih2ZvYp9tcsVJCNeoyrhr
 fLQUwu1m32goXGmvmG2DSxELANp6ElrA/JWhagu1Kf2FDI79xyjMDcjfJYGVDz19lZCM
 H8fWQM9ZFLKodTaYuqtdl82fHIqp2XiGhn5ku5kZxLTebSBh5ZSv/XsZapY1OykmK5Tf
 JqjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTKVVAEQDtLGaAb0mNPPgW0LBrEiQpmmJHhvC+M/A1+mqdG6JbKtPadFl0/XSiTkgn3wNRvQ4ivmzd1bP0kQha+7pSbfgsBxGw3xZ76lfJ
X-Gm-Message-State: AOJu0YzG4CKLcglSlXRcftFTcFXcoJgvXgnGJqkJLrj2L1vk927X8N7A
 iEwY6qSldn2+TdUjLAEFdNiuVjPXvge52loV2tI2PbLHuk+e9+1W4A8uADTuhHMGzS78uGbP5xL
 aQTr6u8IrZt+S0Iz7Wa2nXSDviBdaB10JTJwfMPoPHxFETAMKzSXrYPYbCyROqIq8UQ==
X-Received: by 2002:a2e:780d:0:b0:2e0:b713:6bc1 with SMTP id
 t13-20020a2e780d000000b002e0b7136bc1mr3375488ljc.1.1714487299835; 
 Tue, 30 Apr 2024 07:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd6fssLgRyfH/vGDmKq0ffIOhd6yz08RDVy6Jh4KZgUjwuBfI1xrx/kB8L2ydCD//3VjqM1Q==
X-Received: by 2002:a2e:780d:0:b0:2e0:b713:6bc1 with SMTP id
 t13-20020a2e780d000000b002e0b7136bc1mr3375398ljc.1.1714487297289; 
 Tue, 30 Apr 2024 07:28:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 iv20-20020a05600c549400b00418e4cc9de7sm45112298wmb.7.2024.04.30.07.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 07:28:16 -0700 (PDT)
Message-ID: <a94e756f-1d1c-4b3a-ae87-dcd7508e94c5@redhat.com>
Date: Tue, 30 Apr 2024 16:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: Add missing break statement
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: ttabi@nvidia.com, lucas.demarchi@intel.com, airlied@redhat.com,
 lyude@redhat.com, bskeggs@nvidia.com
References: <20240430131840.742924-1-chaitanya.kumar.borah@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240430131840.742924-1-chaitanya.kumar.borah@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 4/30/24 15:18, Chaitanya Kumar Borah wrote:
> Add the missing break statement that causes the following build error
> 
> 	  CC [M]  drivers/gpu/drm/i915/display/intel_display_device.o
> 	../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function ‘build_registry’:
> 	../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:3: error: label at end of compound statement
> 	1266 |   default:
> 	      |   ^~~~~~~
> 	  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.o
> 	  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
> 	  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0.o
> 	make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o] Error 1
> 	make[7]: *** Waiting for unfinished jobs....
> 
> Fixes: b58a0bc904ff ("nouveau: add command-line GSP-RM registry support")
> Closes: https://lore.kernel.org/all/913052ca6c0988db1bab293cfae38529251b4594.camel@nvidia.com/T/#m3c9acebac754f2e74a85b76c858c093bb1aacaf0
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Applied to drm-misc-next, thanks!

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 0b46db5c77b8..63619512e7f6 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1264,6 +1264,7 @@ static void build_registry(struct nvkm_gsp *gsp, PACKED_REGISTRY_TABLE *registry
>   			str_offset += reg->vlen;
>   			break;
>   		default:
> +			break;
>   		}
>   
>   		i++;

