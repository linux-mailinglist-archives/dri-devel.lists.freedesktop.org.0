Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ABE17BAC2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 11:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DC36ECCD;
	Fri,  6 Mar 2020 10:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422796ECCD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 10:52:24 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id j1so1856029wmi.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 02:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=8x4FtQ0d/oXsHbBXZA0a8FImN+v9SImsm+MT1st6RXw=;
 b=MYor/+16j73bXX7/uGT0c3cBr72JfnsMFC9zRoQ8tKBqGaSnpuyBtQ/Pc2pT+i/T6+
 CadE482Jsn71oGcSH5NclZrfr7GH+WANRp/Nf85yOg0G8anIbUpha/p6B8Mwxcqx5yJ+
 dFkah+87JAvoVMiwxnQYqq5DlvArwxiNaUMmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=8x4FtQ0d/oXsHbBXZA0a8FImN+v9SImsm+MT1st6RXw=;
 b=UTrfKicb8NczXID+GWqoxIc+ZMAQ9ReMACvU5NLLEdXqXMgHQTGkLMBIG9zoyUaW4a
 lHvdUjTYef979FFsMwWNleoWTiqtfcf1VwZShp6Zvy9GJHax19xH1StG30VRXNT11mkY
 YxLVgPD9fS95b0wv5XINN6uo6B+k6P7cx+Iqjq2g7ucNxllnA81WFDqLqczqKDsjZZJi
 StvR5jXgYdbEeDvHoWeVAK+K0aCyQeclouL7k9irMncyb3zCjMFrJFlhyQaE6P3bcrZR
 nBBXvOwnR1EndE5nHN1ix8zyPww4++a8/fP8z+Ki79aVeVvbDz9CfYqjPiTXKYoHo2NN
 LmoA==
X-Gm-Message-State: ANhLgQ0Puh02cbbnPuG2YhwHCoRYkyVIDzvgNRZPjiNoE4w4GoUmdjSi
 AEd9eQyh8ZZHy2dIeyLzZRE96A==
X-Google-Smtp-Source: ADFU+vvjzNcrEzP63jJVwo52keCCnOQtunBv4Ani1bZvt0MX8d8L9RvSU/GreJShkmBXFGphA1K55w==
X-Received: by 2002:a1c:7419:: with SMTP id p25mr3261622wmc.129.1583491942868; 
 Fri, 06 Mar 2020 02:52:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f6sm13125791wmc.9.2020.03.06.02.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 02:52:22 -0800 (PST)
Date: Fri, 6 Mar 2020 11:52:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] drm/bridge/mhl.h: Replace zero-length array with
 flexible-array member
Message-ID: <20200306105220.GX2363188@phenom.ffwll.local>
Mail-Followup-To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200305110011.GA21056@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305110011.GA21056@embeddedor>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 05, 2020 at 05:00:11AM -0600, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied to drm-misc-next, thanks for your patch.
-Daniel


> ---
>  include/drm/bridge/mhl.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/bridge/mhl.h b/include/drm/bridge/mhl.h
> index 1cc77bf38324..d96626a0e3fa 100644
> --- a/include/drm/bridge/mhl.h
> +++ b/include/drm/bridge/mhl.h
> @@ -327,13 +327,13 @@ struct mhl_burst_bits_per_pixel_fmt {
>  	struct {
>  		u8 stream_id;
>  		u8 pixel_format;
> -	} __packed desc[0];
> +	} __packed desc[];
>  } __packed;
>  
>  struct mhl_burst_emsc_support {
>  	struct mhl3_burst_header hdr;
>  	u8 num_entries;
> -	__be16 burst_id[0];
> +	__be16 burst_id[];
>  } __packed;
>  
>  struct mhl_burst_audio_descr {
> -- 
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
