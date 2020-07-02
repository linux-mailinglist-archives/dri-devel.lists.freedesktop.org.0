Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A32F2125ED
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 16:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CDA6E0AD;
	Thu,  2 Jul 2020 14:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35036E0AD
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 14:15:55 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id d4so24259336otk.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9A7iY5vgoWTo7GNwa7G63eYFYvMacp50tlztFrDTtic=;
 b=MTS+DY37g24tK3D8pt2+U8KwQfmhQUXnYI74XgJj3V7kT/uYoUcT9IrsWGpHBoagcY
 qP2mCi82Yr4+2GBLslXn0mA3qDebBbuA63m8UPq5VJHYK3Q8yc9JNsMerUbq8w2R5vHy
 O0M9Xm4Ek/saTssTVrfAmwSbCKdT4MYzVS3Uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9A7iY5vgoWTo7GNwa7G63eYFYvMacp50tlztFrDTtic=;
 b=d65x5xwQMM8MwrH8IqHTo8nJxiZu6lDh6T7jcyhY8CD4IosIJr1TqsNMRsOAYIQKOn
 Ry2gnQVL1RzS4omtjYlOwDtJWF899AizVaET6MjrOTxy7mWmj6v5EaSuu85Kwg4xwxa0
 uEU/L+WhIHqEEgfNYs1l6QRWu9TOOSpMCd876EwxsMaNgVtQQXHaTY9v1iGSBvrVtuUt
 tPGR8tPeUmQ4LTxzT19eTPOhrLpZ8LLXrSqEvll0XU8iBaAsOtuH2H6kNNzW25p+no0I
 xgK3oTiy0b85s7+h9Y/IUb82oqOwb7TFD2cGCuHclxvb9ST7MfJ5sLTaiAcMpyilAwbq
 49lg==
X-Gm-Message-State: AOAM530scDk8Aj1qXVYDDXCShlwA88jZ6eauy/IG/UdWemHmGx9B3Oty
 1zDdXsCwkDH4SqFtpoODREHqBGnSsQzehCRJ6jNmlw==
X-Google-Smtp-Source: ABdhPJwaoRuELQ86SMBX24OJmZreO2Szy92aZ3dQsxrJRTUi1P616DpufT08jo7MpSCeSJZoPYNU7WeJQ7wwc5qWVOE=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr15024239ota.188.1593699355009; 
 Thu, 02 Jul 2020 07:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200702074759.32356-1-narmstrong@baylibre.com>
 <20200702074759.32356-2-narmstrong@baylibre.com>
 <8cBfZpkc4pHBLhihlvJMD_Hq1DEsNRcSY4Y8JaGwklMWcxiYzUMVEx7wH9f_DuCBMVUhXvOR0PcHVslILtKI2wdw79Nfih0N3VnrxfMQd08=@emersion.fr>
 <20200702131834.GZ3278063@phenom.ffwll.local>
 <044964ad-b927-57d7-9361-beda5c8d99a8@baylibre.com>
In-Reply-To: <044964ad-b927-57d7-9361-beda5c8d99a8@baylibre.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 2 Jul 2020 16:15:44 +0200
Message-ID: <CAKMK7uHa4ajC5_SA_fFUhB-Amxcbt7T9UZ+pvRhqDeUeX9Ez6A@mail.gmail.com>
Subject: Re: [PATCH v8 1/6] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: "jianxin.pan@amlogic.com" <jianxin.pan@amlogic.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 2, 2020 at 3:34 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 02/07/2020 15:18, Daniel Vetter wrote:
> > On Thu, Jul 02, 2020 at 09:23:11AM +0000, Simon Ser wrote:
> >> On Thursday, July 2, 2020 9:47 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >>> Finally is also adds the Scatter Memory layout, meaning the header contains IOMMU
> >>> references to the compressed frames content to optimize memory access
> >>> and layout.
> >>>
> >>> In this mode, only the header memory address is needed, thus the content
> >>> memory organization is tied to the current producer execution and cannot
> >>> be saved/dumped neither transferrable between Amlogic SoCs supporting this
> >>> modifier.
> >>
> >> Still not sure how to handle this one, since this breaks fundamental
> >> assumptions about modifiers.
> >
> > I wonder whether we should require special allocations for these, and then
> > just outright reject mmap on these buffers. mmap on dma-buf isn't a
> > required feature.
>
> Yes, it's the plan to reject mmap on these buffers, but it can't be explained
> in the modifiers description and it's a requirement of the producer, not the
> consumer.

Hm I think worth to add that as a note to the modifier. Just to make
sure. And avoids questions like the one from Simon.
-Daniel

>
> >
> > That would make sure that userspace cannot look at them.
> >
> > Also I'm kinda suspecting that there's not unlimited amounts of this magic
> > invisible storage available anyway.
> > -Daniel
> >
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
