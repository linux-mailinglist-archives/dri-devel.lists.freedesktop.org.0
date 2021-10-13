Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B2942BFF6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 14:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C87A89DB8;
	Wed, 13 Oct 2021 12:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110DD89DB8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 12:28:15 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k7so7679748wrd.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 05:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=GBfsD8UcuCc9Dt0hmFf6Zq9716ejUwy0ObqDAs31b9M=;
 b=OnPrdqkeW6KK+v4GtIWQEAP/y0NXlBOJfLLip0R6eL/o1mtuFJTFgay4jHqZMrnEbV
 BFk19Yq0fbDLBwYgTb5OKhRnhJB10Hph+fkhm/ziLAE0zS4ujDGvrciDKTMlZzk1p1xS
 fkEP/26CUSLtkv8wmM7jqKgBsivsz9/KAQcJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=GBfsD8UcuCc9Dt0hmFf6Zq9716ejUwy0ObqDAs31b9M=;
 b=tbAuhI75MJSrirFvsGYAE+wvRfEGe8CQngQW36Y8HQj6XNubwYf25OcufrPfUhILJE
 mGaMUHUb4SyR4Y2vWf0m/C/g5m07YnJQp3zbROs8ktLqDNdjRRS3TazZA4IJ7Sv9swfi
 dw1qdw4sH7WQ5o2UghDygf+AtnKN86WmU+ETJe7vfHGkdFt+OZIvAHO9zFgme6FrNO/Y
 tVRoUaakwTvoYtrEet7IIgKhGmHB0/TOfQAySOhLi0RG5WMYkOGKm+oFET/LNJyJFqeI
 SOElT4v8yim7vMd1IBkvYVQ38QlmETqmu6a3hbZhfQKry+alh9UQC7KkKORuuBWdZkeq
 ajAQ==
X-Gm-Message-State: AOAM531RbPizFmFvR8mlZbB1ZxMWwqis3rARzqWBj6X9fIZbB955lM4D
 0vDyI/gpIf8I+YLBag6PXFhU3Q==
X-Google-Smtp-Source: ABdhPJz8xtdME6jjgj/yh0FBDVkiYhtiLOa+f1ojHCjME36GpjcRyNASGQaKNjCalwH1kesstw0dwQ==
X-Received: by 2002:a05:600c:1989:: with SMTP id
 t9mr12250949wmq.48.1634128093632; 
 Wed, 13 Oct 2021 05:28:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k10sm12930288wrh.64.2021.10.13.05.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:28:13 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:28:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Shunsuke Mie <mie@igel.co.jp>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Update obsoluted comments on
 dma_buf_vmap/vunmap()
Message-ID: <YWbQ28oOQnzg9cJS@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Shunsuke Mie <mie@igel.co.jp>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20211008112009.118996-1-mie@igel.co.jp>
 <5ae41c5a-0ff4-5a82-2100-56bc415b5638@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ae41c5a-0ff4-5a82-2100-56bc415b5638@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Fri, Oct 08, 2021 at 02:09:41PM +0200, Christian König wrote:
> Am 08.10.21 um 13:20 schrieb Shunsuke Mie:
> > A comment for the dma_buf_vmap/vunmap() is not catching up a
> > corresponding implementation.
> > 
> > Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

You're also pushing?
-Daniel

> 
> > ---
> >   drivers/dma-buf/dma-buf.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index beb504a92d60..7b619998f03a 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1052,8 +1052,8 @@ EXPORT_SYMBOL_GPL(dma_buf_move_notify);
> >    *
> >    *   Interfaces::
> >    *
> > - *      void \*dma_buf_vmap(struct dma_buf \*dmabuf)
> > - *      void dma_buf_vunmap(struct dma_buf \*dmabuf, void \*vaddr)
> > + *      void \*dma_buf_vmap(struct dma_buf \*dmabuf, struct dma_buf_map \*map)
> > + *      void dma_buf_vunmap(struct dma_buf \*dmabuf, struct dma_buf_map \*map)
> >    *
> >    *   The vmap call can fail if there is no vmap support in the exporter, or if
> >    *   it runs out of vmalloc space. Note that the dma-buf layer keeps a reference
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
