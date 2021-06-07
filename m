Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204A639DC97
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 14:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7206E88B;
	Mon,  7 Jun 2021 12:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F666E88B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 12:36:41 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m18so17435528wrv.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 05:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jFzM9VgsT8Fh9btLQ76JMGV4VlqloGiTenVMTHBRlWk=;
 b=lAYc7CTUi4P4J467+K5u1kmzlbXzJx43b1Gz6m1swSm7JKFzJLTwKGkFTVqa12p0a6
 DwODkdvTUjnAKaBqMxIH/S03T0lm7ONkL1iroadiNJw5xLevU36zf98dU041pcrDDQuk
 7P7lswCRWDDb2ITJTSjSqmYRRMa/IqVIB20xjaOOz7taO3p8PdmnTr+FLuZxD47xcH7p
 Z75gghLyW+kgb3UR9uj/nW/QGNyqyB5Xn8cudTL7m8hgOgDhkwScI/U1FseK2C79+KhP
 oWNqY8tJbmKrtWoHZTUBSyI31pK1WkfNoewz0aQ0cvblfTRZ9T16NyJZInzW+JegJ2Qd
 4M/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jFzM9VgsT8Fh9btLQ76JMGV4VlqloGiTenVMTHBRlWk=;
 b=apg/PUyHpLt5s97etucdFxCKD7hcpp9WBk0ApszdwBugbGRjenmszzaC0mgQ17iIx0
 Lb19qBkong67Wrw6WZcB3CkVF3Jq3hStHmQtys/3ALRyewPt1v20eOXqABcsAZiz/6+S
 2yrb9OYBWk9Lt6saTm8NmIH3EEdcPF9Uop9Q5pfdPpFvWBFuedw3YFDc6+nizYe4PBIu
 MVUx3UuM+dPhqsQgOg8idq/5yFD08V/35agjjIEoaJ2l4KtuBtR1cdUNCs9COqljr1E0
 X5N072tyb9MeI2bIEbnB/ikRdVrg6m8zK4PPy4H/S2oi15FMnPxKw/0lH+tqcrDTHjyZ
 jMHg==
X-Gm-Message-State: AOAM532t8VUX2n4IwFoUtMBGyZMBdEQ4COzjdTT6w4to6+DPBwgTNj0p
 xjcPfeZd1QXyJ63DvLOOOmfSGnUqyD4=
X-Google-Smtp-Source: ABdhPJwKhct+s1+nmdFFP7IOdPyQK+BAaL8lOPv9MORhCHmKXSOiGjdzDLMmzfvUlhByBCk6CLWQnQ==
X-Received: by 2002:a05:6000:2cc:: with SMTP id
 o12mr412568wry.279.1623069399823; 
 Mon, 07 Jun 2021 05:36:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb?
 ([2a02:908:1252:fb60:ce67:4e4d:875d:ffeb])
 by smtp.gmail.com with ESMTPSA id n20sm14077772wmk.12.2021.06.07.05.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 05:36:39 -0700 (PDT)
Subject: Re: [PATCH 1/4] drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Lang.Yu@amd.com, thomas_os@shipmail.org
References: <20210601122528.1643-1-christian.koenig@amd.com>
Message-ID: <0051cab9-8d65-d28f-956e-3a60718bf000@gmail.com>
Date: Mon, 7 Jun 2021 14:36:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601122528.1643-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas any comments on this?

Is the purpose of this now clear enough?

Thanks,
Christian.

Am 01.06.21 um 14:25 schrieb Christian König:
> From: Lang Yu <Lang.Yu@amd.com>
>
> Sometimes drivers need to use bounce buffers to evict BOs. While those reside
> in some domain they are not necessarily suitable for CS.
>
> Add a flag so that drivers can note that a bounce buffers needs to be
> reallocated during validation.
>
> v2: add detailed comments
> v3 (chk): merge commits and rework commit message
>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c    | 3 +++
>   include/drm/ttm/ttm_placement.h | 7 +++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 51a94fd63bd7..6b393502198e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -929,6 +929,9 @@ static bool ttm_bo_places_compat(const struct ttm_place *places,
>   {
>   	unsigned i;
>   
> +	if (mem->placement & TTM_PL_FLAG_TEMPORARY)
> +		return false;
> +
>   	for (i = 0; i < num_placement; i++) {
>   		const struct ttm_place *heap = &places[i];
>   
> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
> index aa6ba4d0cf78..8995c9e4ec1b 100644
> --- a/include/drm/ttm/ttm_placement.h
> +++ b/include/drm/ttm/ttm_placement.h
> @@ -47,8 +47,11 @@
>    * top of the memory area, instead of the bottom.
>    */
>   
> -#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
> -#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
> +#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
> +#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
> +
> +/* For multihop handling */
> +#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>   
>   /**
>    * struct ttm_place

