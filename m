Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048BA89A2A1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 18:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F3E10E3D2;
	Fri,  5 Apr 2024 16:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Y3LrAovs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6360E10E3D2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712335056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HhqXEsjcQfRnbT+Watd5B6B0qa6OPofOH0VzzxL2RKw=;
 b=Y3LrAovsOPV8ceN6G3k/bRjiRE/UVG5PDBJLfLJ2tMNZAS28KX3h32uoCsXth2H0o/Nn0D
 KCFPy5w7nkerGypf7chfvGP/goGxdOHhRWYfIgsQxc1c5PTwqrVze+MAvgrcPBE090rQNK
 TD5KbStem9MaiGuJAViXAv5oTkJtvTA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-94l1bYdrPZO8BX6TUJGyog-1; Fri, 05 Apr 2024 12:37:32 -0400
X-MC-Unique: 94l1bYdrPZO8BX6TUJGyog-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4162ebc5a88so5099555e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 09:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712335051; x=1712939851;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhqXEsjcQfRnbT+Watd5B6B0qa6OPofOH0VzzxL2RKw=;
 b=g7Z5MMF6UmlSKs9N0DU9bEcxO0XYF3GwIPbUevp156QZlKuzu+twgefkB5rII9B8jB
 KzvhrQuevDkDNZ27Gu71AmFDeJMKDeY5Uto/IE+fkXplu7Vk+VNrsaAP9SmTa3KP6tyQ
 hpnlKIuqMz0mw8Z3jZqjJiYDo+GGa6PFM3ZMO8hIxP+W6xniOcBzzpF4ZYTPBDws8ImV
 BNSmpie9TVBk2vtjLJBwgreIwaEfp6QPUGwIV8VS3CuEyn0eZJFph+e/e6yVRDsbklpu
 DKPGIaur9PzuFTzet5DFZJql8ntGxnyCaJsnS7TBCFNLYkHqVVHermAsWFTQPRzVvXwE
 CMnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjzzFEvULWcop/U0UBW7w9C7oaqRW9tJ8HHgVO1xKXexs3r+RkPU07xpfP/GTAoA9fiZsZ77ZYpLWRxwjOBvpPEPoB4gxaMIPkiX0QBtR6
X-Gm-Message-State: AOJu0YwqkQvoD36xzningKRFymVk+5YiP3TvZjvBNckXbnzOtH4kUc48
 4qvDTDbKJeQ0oKRsHTBsq2rPpSDwfR95BVBtdiqrjlhrXoK/2GqBUeBenht5rjqgUajaB3v6Ftt
 SF5LT1xwYxsYGAqHRDl6aRxBtjjHOetqTPxuMBprJBBi+HRgDy+SYMN9YK61v99TZBQ==
X-Received: by 2002:a05:600c:4510:b0:414:767e:6e76 with SMTP id
 t16-20020a05600c451000b00414767e6e76mr1596280wmo.21.1712335051627; 
 Fri, 05 Apr 2024 09:37:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDPCc0VTMBhL7MNqvTz5tlRMoWQPFY1L2zr/0sqh9d3YOQmi5yQiu02UsFqppTmlfZ8bZ/Jg==
X-Received: by 2002:a05:600c:4510:b0:414:767e:6e76 with SMTP id
 t16-20020a05600c451000b00414767e6e76mr1596272wmo.21.1712335051297; 
 Fri, 05 Apr 2024 09:37:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c444d00b00416306c17basm2328956wmn.14.2024.04.05.09.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 09:37:29 -0700 (PDT)
Message-ID: <593a8479-741a-44de-a52c-8d34810bfb3e@redhat.com>
Date: Fri, 5 Apr 2024 18:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/gsp: Avoid addressing beyond end of rpc->entries
To: Kees Cook <keescook@chromium.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Timur Tabi <ttabi@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Karol Herbst <kherbst@redhat.com>
References: <20240330141159.work.063-kees@kernel.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240330141159.work.063-kees@kernel.org>
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

On 3/30/24 15:12, Kees Cook wrote:
> Using the end of rpc->entries[] for addressing runs into both compile-time
> and run-time detection of accessing beyond the end of the array. Use the
> base pointer instead, since was allocated with the additional bytes for
> storing the strings. Avoids the following warning in future GCC releases
> with support for __counted_by:
> 
> In function 'fortify_memcpy_chk',
>      inlined from 'r535_gsp_rpc_set_registry' at ../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1123:3:
> ../include/linux/fortify-string.h:553:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
>    553 |                         __write_overflow_field(p_size_field, size);
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> for this code:
> 
> 	strings = (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
> 	...
>                  memcpy(strings, r535_registry_entries[i].name, name_len);
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied to drm-misc-fixes, thanks!

> ---
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 9994cbd6f1c4..9858c1438aa7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1112,7 +1112,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
>   	rpc->numEntries = NV_GSP_REG_NUM_ENTRIES;
>   
>   	str_offset = offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_ENTRIES]);
> -	strings = (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
> +	strings = (char *)rpc + str_offset;
>   	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
>   		int name_len = strlen(r535_registry_entries[i].name) + 1;
>   

