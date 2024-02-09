Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5715984F9EF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 17:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6570110F77A;
	Fri,  9 Feb 2024 16:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vu974V3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2730A10F786;
 Fri,  9 Feb 2024 16:48:34 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-604b23fc6a7so12891447b3.0; 
 Fri, 09 Feb 2024 08:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707497313; x=1708102113; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BDoPqGVOIDy3+wcfjHtZEb4REQzExwRWYroEz4tWuME=;
 b=Vu974V3HCtdEeH/aoFcxboQFnOncTBg/2Olr42WNTYAYBUU+AeLgIa4BlXDS3nYE29
 0m3kw0dicYTgK3gBlvPGnKFhI3dOgZ80eofzyq8myv5IfH1aW4Uh9K0BzYhPMsYWW76X
 2DQL8DnW83zNv8Jvcr5i8UO/SndYWjUJl/qraY5g7EYilitdHO9aMSglOc+h14qUY6XX
 SJJEmBgY7E5oMIwyXNnC7m2llGhhFmlZjmZEXDTIpq8RYWownOekrg5ddcKyNuhVAPfE
 AX1Cdrz/yGJClmgjdEbEiaUHKPgLhlByoA979/cbr7XNbJjxA25owXScf2PBODbx8HMt
 39jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707497313; x=1708102113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDoPqGVOIDy3+wcfjHtZEb4REQzExwRWYroEz4tWuME=;
 b=Q+Gg4FtlmlBBjLQO85L6LzkotavCvbODlUmP+tSjHg1oUSKnfwIyPe5CKIyVXkjr4z
 R48lSbG7+NSWUxiiAGAcCCn75DWdMsoSt4iM7ZbFdQdIHrWQyyWQPP4OmCF2jDbfGiDD
 I2rf2XGylf8PvDEJBP03MtgPaKVN9uExb1hlAz1Z3JF9fYdXWOcOYavLziRBOid1KiP2
 603e4Tx6wlJc27WBzMB8st0UND1dgobABiEAO1du/lpy3U4hOnNydG+QcIlTJcmjiJIq
 JtMtNt4t34YLn/sHdoMGXlZudTo0q4e26/5WXsGvZZCvFg3zL5R+jhIRdvhBXZYxAL0l
 xiIA==
X-Gm-Message-State: AOJu0Yz7umDjltqDVmbeuDcB4qlCCsL7oTrImD3AbSycxy7+9F60SMPf
 3v47BYfvtT7saQpFdctF4cmQ2Dz6a/PJ9RRchlAzPp3QGfnY7obE
X-Google-Smtp-Source: AGHT+IGHAnv5j3jjPmcR0JvcThZ6kL5WrGr+U2/FCDlRiQcke87L3mDwYTKNqb9aPzjJNAz1t/g7uw==
X-Received: by 2002:a25:8686:0:b0:dc6:e622:f52 with SMTP id
 z6-20020a258686000000b00dc6e6220f52mr1943504ybk.31.1707497313092; 
 Fri, 09 Feb 2024 08:48:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW1a/+E+9DbNMri1t+AZUcIPf+wUz5mu1p6q31+fZg7aHGQ+BTynXWQVqxWa3/iQqp4U4MVW5MrWnWSm0WmQ19DldbgQ2tEZz0/3YNdMdDlGtqViDcAmRH0VWc4bxs6hnQkMMNvvq0rm+gf7lWdpRehASNNnUAzTj6o6TglEqnf1ukaIx5e0mn0UwNjf9xuEOzBnRYhMW86aYSk8C0HYiIx2RyurvnbhgYV3SDQcBKaIghNqJcXnKTZGkIMNNe2eUf/lA73dsI65yIvzp2tnUCZ
Received: from localhost ([2601:344:8301:57f0:be3a:6fd4:1110:3284])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5b0b8c000000b00dc74ac54f5fsm217643ybq.63.2024.02.09.08.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 08:48:32 -0800 (PST)
Date: Fri, 9 Feb 2024 08:48:31 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/3] bits: Introduce fixed-type BIT
Message-ID: <ZcZXXzEBxvyH470g@yury-ThinkPad>
References: <20240124050205.3646390-1-lucas.demarchi@intel.com>
 <20240124050205.3646390-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124050205.3646390-3-lucas.demarchi@intel.com>
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

On Tue, Jan 23, 2024 at 09:02:04PM -0800, Lucas De Marchi wrote:
> Implement fixed-type BIT() to help drivers add stricter checks, like was
> done for GENMASK.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Yury Norov <yury.norov@gmail.com>

> ---
>  include/linux/bits.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/bits.h b/include/linux/bits.h
> index cb94128171b2..5754a1251078 100644
> --- a/include/linux/bits.h
> +++ b/include/linux/bits.h
> @@ -24,12 +24,16 @@
>  #define GENMASK_INPUT_CHECK(h, l) \
>  	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
>  		__is_constexpr((l) > (h)), (l) > (h), 0)))
> +#define BIT_INPUT_CHECK(type, b) \
> +	((BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
> +		__is_constexpr(b), (b) >= BITS_PER_TYPE(type), 0))))
>  #else
>  /*
>   * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
>   * disable the input check if that is the case.
>   */
>  #define GENMASK_INPUT_CHECK(h, l) 0
> +#define BIT_INPUT_CHECK(type, b) 0
>  #endif
>  
>  #define __GENMASK(t, h, l) \
> @@ -44,4 +48,9 @@
>  #define GENMASK_U32(h, l)	__GENMASK(u32, h, l)
>  #define GENMASK_U64(h, l)	__GENMASK(u64, h, l)
>  
> +#define BIT_U8(b)		((u8)(BIT_INPUT_CHECK(u8, b) + BIT(b)))
> +#define BIT_U16(b)		((u16)(BIT_INPUT_CHECK(u16, b) + BIT(b)))
> +#define BIT_U32(b)		((u32)(BIT_INPUT_CHECK(u32, b) + BIT(b)))
> +#define BIT_U64(b)		((u64)(BIT_INPUT_CHECK(u64, b) + BIT(b)))
> +
>  #endif	/* __LINUX_BITS_H */
> -- 
> 2.43.0
