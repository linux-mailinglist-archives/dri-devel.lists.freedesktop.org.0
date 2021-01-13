Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F542F544C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 21:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0056EC62;
	Wed, 13 Jan 2021 20:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC7B6EC61
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 20:50:22 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id d189so3571527oig.11
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 12:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rqFgc2dzKme0zr+aU1JENA4xdAtd9mmh2guoOC2yjew=;
 b=MQQhT8WVByeSlgDj2m+Ianm+DeZbxWW0a6i6/UvKUWT/ZY2Aj6ipHsJ68EcJzntahX
 ba+ftlZmyowIXRFKfr4fb1svh06/VzwQK94Rd6u8ryCRX75PDJwi6duabIiS9/7tB0uY
 6pZYvzSKFeUmpwcrO2+fI7/fbNdSBgwzk46J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqFgc2dzKme0zr+aU1JENA4xdAtd9mmh2guoOC2yjew=;
 b=JstWmPAbVTR2b888CxAKQay3rxNrwxhrx+ofbkg+YNdCNtUk54fBxNDb4lAcdct1h6
 q22xqJaO0zOeI0rmlvXsV+ropMgbxz33/97Xy++zXGCDoMn3TU8ZHUCibB3iD+sF+UwD
 X8k/2K83VCIiCnGU7ITB3uL5aJKDSkUhJdDNp0SiyjivMfrUDepTf8yyTv1sRNNBPD2e
 aW4gbnAjf2zNn1Fd3tzMrmSkaGKrqLN9twd/tr3JJG1K69wEgWofWbUZa4L6Dp+YSVtn
 HfJrZ+YEEYLNeNQ7yNYzkIblnhMnQnflAQhWQ7sx402tf0Y018Xz90ZTxVdkuMDDsk0P
 OBHQ==
X-Gm-Message-State: AOAM5310n6nOAOYw9AENqKc8dZjHW8sZkSJ8ttXPYRAPTpDTbY+Rg8Co
 GwU6ykz/xvhOBKQUKbBn6pOnuL9I1FF/SkzxPXLKMA==
X-Google-Smtp-Source: ABdhPJy67Q/SiF12KAy9W+l33TI2jHio6EqyjNUlwUVXtpcm2GTUEw2G9L6akaRObc+uz+7EkfYii6J6G5enil+o9lE=
X-Received: by 2002:aca:54d8:: with SMTP id i207mr651674oib.101.1610571022183; 
 Wed, 13 Jan 2021 12:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
 <161055261490.6195.7986280621869334351@build.alporthouse.com>
In-Reply-To: <161055261490.6195.7986280621869334351@build.alporthouse.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 13 Jan 2021 21:50:11 +0100
Message-ID: <CAKMK7uEnnEj_YAR5Tm3jpS7MNPkqB43JBhQnY_K0YQ+LE9wL1g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm-buf: Add debug option
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 David Stevens <stevensd@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 4:43 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Daniel Vetter (2021-01-13 14:06:04)
> > We have too many people abusing the struct page they can get at but
> > really shouldn't in importers. Aside from that the backing page might
> > simply not exist (for dynamic p2p mappings) looking at it and using it
> > e.g. for mmap can also wreak the page handling of the exporter
> > completely. Importers really must go through the proper interface like
> > dma_buf_mmap for everything.
>
> If the exporter doesn't want to expose the struct page, why are they
> setting it in the exported sg_table?

You need to store it somewhere, otherwise the dma-api doesn't work.
Essentially this achieves clearing/resetting the struct page pointer,
without additional allocations somewhere, or tons of driver changes
(since presumably the driver does keep track of the struct page
somewhere too).

Also as long as we have random importers looking at struct page we
can't just remove it, or crashes everywhere. So it has to be some
debug option you can disable.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
