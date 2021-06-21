Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06353AECD9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293976E1F2;
	Mon, 21 Jun 2021 15:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B7D6E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:53:49 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id l1so29693758ejb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 08:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=MNRL4AH4MT8dZpE3HVQWPA/V/jrnUQwdA9q5faDgCZs=;
 b=l3wQ/2sDIBQhUh20E9bcOr13AZfQnhs4foQlPgF1PTUrSKMBclC7KTNF8P9EbYS84n
 OPHKUU1FLMzoHRBOiMMln1CuypFpnSx/IqYnQ7+4F8HP9RV6EypXNpeCV3kn+Y0gTYa4
 gzwhOHtM0gnNcqmGbRhvUybEK8Ke1y7Kc22/tvEV+KyV2wALQkl1Hj4p2fY5MrFPisaI
 PpO21C/eBwxv1Q2AA6aKpFfLdlSlBVKrrFyXPR9xOzmtrTEDSI1n/fjESb0pEfEE0mVT
 z3noNvhkt810gj+0pej9GeM3bO446Z5SWFM71zChzUAvmQM4EMJal/0E4d8fJ9JevI9F
 xbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MNRL4AH4MT8dZpE3HVQWPA/V/jrnUQwdA9q5faDgCZs=;
 b=lLtQtpMVcKFXKjXTybK5BW9K7H+Li3TaGyBU/3jyLTf+Iz4jbEkc+8w+j0llQxnTYj
 oRADQcnKjxYbYUf4/+srVDTmeLB+4HSXYhItzPYFrVsrxqsJwS1ALLRBFQK+Q7hz5QeY
 9wAt7f6xFM4yUXwZub5qKg70K7iSLkd2A9He7Zc1Gny76XNIymV7QOw9EfKwFf7KeFnI
 nxSaoZqYyEdF6QxPuhLr3EdjpJUYtZHn8H7pFWH+oZefdqTmwgMTgDN+RB0eKn2Aoamg
 qO9BWS0OxHzw0kjYhRtgvLuMP1InttWSWpLrV5AudxysMXoHe1+nlNnPXWio9Y8DDMw2
 gl7g==
X-Gm-Message-State: AOAM531/CpZrHk69TsM17cJ2DWwTmi3tfpgjH+z6E54qWG9Xdm6WTpJ4
 9xHp6g/Iw6Lw8NGxcmRm9+I=
X-Google-Smtp-Source: ABdhPJysq43cRysC5km4ATO9z8osEUnjjwUCnXOD+KvuojHbLN+/jiBs23rhG9qsaxD5cItkljeuUA==
X-Received: by 2002:a17:906:dbd5:: with SMTP id
 yc21mr11898653ejb.223.1624290827794; 
 Mon, 21 Jun 2021 08:53:47 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:98e4:7a7c:4972:8db6?
 ([2a02:908:1252:fb60:98e4:7a7c:4972:8db6])
 by smtp.gmail.com with ESMTPSA id yd2sm3202880ejb.124.2021.06.21.08.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 08:53:47 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: Document non-dynamic exporter expectations better
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210621150732.2345632-1-daniel.vetter@ffwll.ch>
 <20210621151758.2347474-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <75e2dff9-41e3-b24a-5c9c-068c8b1a18c9@gmail.com>
Date: Mon, 21 Jun 2021 17:53:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621151758.2347474-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.21 um 17:17 schrieb Daniel Vetter:
> Christian and me realized we have a pretty massive disconnect about
> different interpretations of what dma_resv is used for by different
> drivers. The discussion is much, much bigger than this change here,
> but this is an important one:
>
> Non-dynamic exporters must guarantee that the memory they return is
> ready for use. They cannot expect importers to wait for the exclusive
> fence. Only dynamic importers are required to obey the dma_resv fences
> strictly (and more patches are needed to define exactly what this
> means).
>
> Christian has patches to update nouvea, radeon and amdgpu. The only
> other driver using both ttm and supporting dma-buf export is qxl,
> which only uses synchronous ttm_bo_move.
>
> v2: To hammer this in document that dynamic importers _must_ wait for
> the exclusive fence after having called dma_buf_map_attachment.
>
> Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-buf.c |  3 +++
>   include/linux/dma-buf.h   | 15 +++++++++++++++
>   2 files changed, 18 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index e3ba5db5f292..65cbd7f0f16a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -956,6 +956,9 @@ EXPORT_SYMBOL_GPL(dma_buf_unpin);
>    * the underlying backing storage is pinned for as long as a mapping exists,
>    * therefore users/importers should not hold onto a mapping for undue amounts of
>    * time.
> + *
> + * Important: Dynamic importers must wait for the exclusive fence of the struct
> + * dma_resv attached to the DMA-BUF first.
>    */
>   struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   					enum dma_data_direction direction)
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 342585bd6dff..92eec38a03aa 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -96,6 +96,12 @@ struct dma_buf_ops {
>   	 * This is called automatically for non-dynamic importers from
>   	 * dma_buf_attach().
>   	 *
> +	 * Note that similar to non-dynamic exporters in their @map_dma_buf
> +	 * callback the driver must guarantee that the memory is available for
> +	 * use and cleared of any old data by the time this function returns.
> +	 * Drivers which pipeline their buffer moves internally must wait for
> +	 * all moves and clears to complete.
> +	 *
>   	 * Returns:
>   	 *
>   	 * 0 on success, negative error code on failure.
> @@ -144,6 +150,15 @@ struct dma_buf_ops {
>   	 * This is always called with the dmabuf->resv object locked when
>   	 * the dynamic_mapping flag is true.
>   	 *
> +	 * Note that for non-dynamic exporters the driver must guarantee that
> +	 * that the memory is available for use and cleared of any old data by
> +	 * the time this function returns.  Drivers which pipeline their buffer
> +	 * moves internally must wait for all moves and clears to complete.
> +	 * Dynamic exporters do not need to follow this rule: For non-dynamic
> +	 * importers the buffer is already pinned through @pin, which has the
> +	 * same requirements. Dynamic importers otoh are required to obey the
> +	 * dma_resv fences.
> +	 *
>   	 * Returns:
>   	 *
>   	 * A &sg_table scatter list of or the backing storage of the DMA buffer,

