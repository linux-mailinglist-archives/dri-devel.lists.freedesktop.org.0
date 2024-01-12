Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CF582C069
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 14:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9DF10E0BC;
	Fri, 12 Jan 2024 13:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AA710EB14
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 13:05:06 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a28f12a12e5so186043366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 05:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705064704; x=1705669504; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vAbZchzI0iGmOu/a8rn2udlF7BOKYbAuYwZzGRVm3BU=;
 b=JPy/3dLDf3dPfMgMTsZwlDh9mR03Mgs3nuNxmC3C08v2gUEpG100jyU0tdEUHsfvP0
 sOmDyZXCLTwzh/2LV7Rp2h2lrLfxbjWIkHZWZG0Yy1SEyI2/bSVdQDZSAdmOqAfVKTsc
 SS+jHpED047zbUUbyNNcPrJ7KqVK0pGOkkHlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705064704; x=1705669504;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vAbZchzI0iGmOu/a8rn2udlF7BOKYbAuYwZzGRVm3BU=;
 b=I8VdA6yOYob2IkPzwRixtXQHgNKEAJx+zzDLMBn0NPhPynSBTUfl+McZJUXjp20taj
 2MWYhUgfC1a5k71HRH8XIFK9rjUa23hxC1Tq1S8HIGN26ubaWzDJbcp/cCcZY6RMXtm2
 yW6g0XR5UQwvKdnlyZUJf2pqwaHa0OTIBHEd8YlCW3OyIWhtZ7IkBvO8cKnSou3dsKnW
 vKkGoff9joGGd4NYDsf87PgP9oh899YWsanLX5p/Qz6TAT2wk+Gg2Ve32StcmrdacIJj
 zjOhtGsoTzHLMdX4/WtW0kjWwnMjq7hm+qfeLc0zUHmSxhqt4unNaCg4rn24wOErI+SU
 +O7w==
X-Gm-Message-State: AOJu0Yyl20aHxrX3pGqoG4s1jmeiPhVfFvOyP/S9cYioeqtgetsbEpYH
 XtfLLW79rhUGOcU//l1d12M31hr65TV8Hw==
X-Google-Smtp-Source: AGHT+IFtm6FukgWCJmvMOWGIQAQ4rW/HJgSEIzEjtdiyxsAnvXu1fGEvnNuGMsdglBVovqejvpW9Xg==
X-Received: by 2002:a17:907:720e:b0:a2b:d12c:ee42 with SMTP id
 dr14-20020a170907720e00b00a2bd12cee42mr1179501ejc.0.1705064704572; 
 Fri, 12 Jan 2024 05:05:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a1709060ad300b00a2687065e28sm1761878ejf.45.2024.01.12.05.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 05:05:04 -0800 (PST)
Date: Fri, 12 Jan 2024 14:05:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/dma-resv: fix spelling
Message-ID: <ZaE4_l8PzXx9Isjp@phenom.ffwll.local>
References: <20240111041202.32011-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240111041202.32011-1-rdunlap@infradead.org>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 08:11:55PM -0800, Randy Dunlap wrote:
> Fix spelling mistakes as reported by codespell.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linaro-mm-sig@lists.linaro.org

Both dma-buf spell fixes applied to drm-misc-next, thanks!
-Sima
> ---
>  drivers/dma-buf/dma-resv.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff -- a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -405,7 +405,7 @@ static void dma_resv_iter_walk_unlocked(
>   *
>   * Beware that the iterator can be restarted.  Code which accumulates statistics
>   * or similar needs to check for this with dma_resv_iter_is_restarted(). For
> - * this reason prefer the locked dma_resv_iter_first() whenver possible.
> + * this reason prefer the locked dma_resv_iter_first() whenever possible.
>   *
>   * Returns the first fence from an unlocked dma_resv obj.
>   */
> @@ -428,7 +428,7 @@ EXPORT_SYMBOL(dma_resv_iter_first_unlock
>   *
>   * Beware that the iterator can be restarted.  Code which accumulates statistics
>   * or similar needs to check for this with dma_resv_iter_is_restarted(). For
> - * this reason prefer the locked dma_resv_iter_next() whenver possible.
> + * this reason prefer the locked dma_resv_iter_next() whenever possible.
>   *
>   * Returns the next fence from an unlocked dma_resv obj.
>   */
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
