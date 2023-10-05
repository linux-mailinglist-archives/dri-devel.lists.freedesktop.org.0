Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0D7B9FF2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 16:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544F110E40E;
	Thu,  5 Oct 2023 14:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE47E10E40E;
 Thu,  5 Oct 2023 14:32:04 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3226b8de467so1074198f8f.3; 
 Thu, 05 Oct 2023 07:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696516323; x=1697121123; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7lZZZ4/1+PKPxfykJQx+K5x1JSysyKZLvsajzTAsxdk=;
 b=VzWCQ1QvMI2ABMGR1MwEPq56d9Z00PLDPIbTphazw+twPyuEML6dqVcQTfTS8m6UGt
 yNMrrACss6dZxzzZmixpP75Svl3F3h61UZCPbdnmduvlzRl4A6xc3fPtBLRI1xUT2dZY
 pjgJ47eJRvkB0eQRlJ6FJNhPr+GMr1R+gs1RYrQyFQZgxRqH4Jg+D+HyOk6pxu6Jf2mR
 Bxvg3+VMV3OY50P+1oiY11/9e5e8R+1JKdDQlYYEmVE0cwWnnJZP0q7DGvZfLs4aOWUR
 o67xEMrR/x1E7m0tGR7KAwaNrg+7LJdrpgcmrJr70CrUmV8+YJrjeeNTFT86+s6O7kW4
 EVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696516323; x=1697121123;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7lZZZ4/1+PKPxfykJQx+K5x1JSysyKZLvsajzTAsxdk=;
 b=XKsQ7v30wc0FLsftHi2guon0QQndoNLmUzVw477QG3EM6Ga3SCgulFXIwARcebimfv
 GVHCDk0CRqHkd6mgQLapVmzwgzMmmeQ3wnBHBH/OE7JAmuCJnIogb/SAeHembtoWyHRn
 yC4zuQYmdc/b9PPf45zmkbHILngm3Lfvj7hzOORFWRshCBxUw2TWms1HN422+ArTqhpz
 SAH2haWzc/JKB5QgesEuCUcgfPJosKY2fRauKsJJ5hyMzfc9pH1XyClhItqAQe4AHkiT
 2u6qjKSqZ2ocShzuTIUQycHc41gIvGqnr2k+aJQLdPFxyT2RiaSjakAfsuM8CrMIcbmv
 rrfQ==
X-Gm-Message-State: AOJu0YzB1J1Eq2uFUtKfIfllhVhUG0jlnPHpQe+dvm8+uaPdGJuLreIK
 6cnJ1zZT5B2znO3v5O29ZGI=
X-Google-Smtp-Source: AGHT+IGeNwFRiaR2N0eH2gDEphyHTycBq3NZEolG4ZYAdI003Zqp47OEBzOniXtW8LVUM2/Bd1MTnw==
X-Received: by 2002:a05:6000:1946:b0:327:e073:d604 with SMTP id
 e6-20020a056000194600b00327e073d604mr4536663wry.45.1696516322757; 
 Thu, 05 Oct 2023 07:32:02 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a5d4d92000000b00327cd5e5ac1sm1954639wru.1.2023.10.05.07.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 07:32:02 -0700 (PDT)
Message-ID: <ca2006f4-a038-460d-a9ca-d14dca8e4a8b@gmail.com>
Date: Thu, 5 Oct 2023 16:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Annotate struct amdgpu_bo_list with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Alex Deucher <alexander.deucher@amd.com>
References: <20231003232952.work.158-kees@kernel.org>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20231003232952.work.158-kees@kernel.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Tom Rix <trix@redhat.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.10.23 um 01:29 schrieb Kees Cook:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct amdgpu_bo_list.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-hardening@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> index 6f5b641b631e..781e5c5ce04d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> @@ -84,6 +84,7 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
>   
>   	kref_init(&list->refcount);
>   
> +	list->num_entries = num_entries;
>   	array = list->entries;
>   
>   	for (i = 0; i < num_entries; ++i) {
> @@ -129,7 +130,6 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
>   	}
>   
>   	list->first_userptr = first_userptr;
> -	list->num_entries = num_entries;
>   	sort(array, last_entry, sizeof(struct amdgpu_bo_list_entry),
>   	     amdgpu_bo_list_entry_cmp, NULL);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> index 6a703be45d04..555cd6d877c3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> @@ -56,7 +56,7 @@ struct amdgpu_bo_list {
>   	 */
>   	struct mutex bo_list_mutex;
>   
> -	struct amdgpu_bo_list_entry entries[];
> +	struct amdgpu_bo_list_entry entries[] __counted_by(num_entries);
>   };
>   
>   int amdgpu_bo_list_get(struct amdgpu_fpriv *fpriv, int id,

