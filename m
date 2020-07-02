Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33037212BDF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 20:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB32E6E5B9;
	Thu,  2 Jul 2020 18:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93E56E39C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 18:03:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f18so21494844wrs.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 11:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=UpAJNr8vpfTKtPQlj/e/glrJ9ulcMqPbKalh3VG00pM=;
 b=SDEAl+v4mwYH2FWXjETOOYOvRfmikj7NShBSNRHJW2UZNJ4YUd+TJJryD9LzQ9QhpA
 eN1lwTgoQwINeLc3RXJ4cU+Y5hdSlkBU1BmgJDNVMOiGHcpYH6pcgDLK52aLrzVZmv6r
 PFnkOFxN+vObKR9N+rJ+7S6/i/cxfEcUkp7XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=UpAJNr8vpfTKtPQlj/e/glrJ9ulcMqPbKalh3VG00pM=;
 b=k5CDaGZ0E6v/tPNN+v8wZgb8qnDIG2l+1KyndljoeY8XSIgwAwMZhE2X6Z0pDobZIa
 kLJyJyqg8jyU+pGnbU3q24V7kQM1ePyg5dBBnXMgXe2nYJ8/+bcN+Vpfj00HBDJmbUmZ
 wMBFkTR15VnkaQLT0va4C5R7lgmfRmG1DfgjMOl6LqNhe4Rt/DV918eZOy7IRgES+n7E
 s3qriZyBAziFi4LcyfevifJ31OA3SfOixQdMdThYI5Rocjq260MMgUmfd+TkMB8j9q12
 05tbSQ8B2MKVUJVw+CFgG7cK/JFP2/KkB87t32GIxgvRlltU8vGYEv1nyTDHy8nJ1Caq
 0ftQ==
X-Gm-Message-State: AOAM533PVZGNqbLtNxw/gK2ngvhs8gPAV8zsdh3CfpB+HSmIMgGmkg43
 ZP9Uk50JMPMioEHpIzFN/OpJMQ==
X-Google-Smtp-Source: ABdhPJwUPiRqviJX4p/wQ4ZlfWVQDt88ex2g1XXDueh/V48dmaVm3xrRzZwLDYoIIaTkFo3VMCW82w==
X-Received: by 2002:adf:f104:: with SMTP id r4mr34105603wro.90.1593713019519; 
 Thu, 02 Jul 2020 11:03:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n16sm11595673wra.19.2020.07.02.11.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 11:03:38 -0700 (PDT)
Date: Thu, 2 Jul 2020 20:03:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v8 1/6] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
Message-ID: <20200702180336.GB3278063@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 Simon Ser <contact@emersion.fr>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jianxin.pan@amlogic.com" <jianxin.pan@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20200702074759.32356-1-narmstrong@baylibre.com>
 <20200702074759.32356-2-narmstrong@baylibre.com>
 <8cBfZpkc4pHBLhihlvJMD_Hq1DEsNRcSY4Y8JaGwklMWcxiYzUMVEx7wH9f_DuCBMVUhXvOR0PcHVslILtKI2wdw79Nfih0N3VnrxfMQd08=@emersion.fr>
 <20200702131834.GZ3278063@phenom.ffwll.local>
 <044964ad-b927-57d7-9361-beda5c8d99a8@baylibre.com>
 <CAKMK7uHa4ajC5_SA_fFUhB-Amxcbt7T9UZ+pvRhqDeUeX9Ez6A@mail.gmail.com>
 <190ac909-c78b-81e0-35a1-353cd24e9f44@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <190ac909-c78b-81e0-35a1-353cd24e9f44@baylibre.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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

On Thu, Jul 02, 2020 at 05:11:25PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 02/07/2020 16:15, Daniel Vetter wrote:
> > On Thu, Jul 2, 2020 at 3:34 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> On 02/07/2020 15:18, Daniel Vetter wrote:
> >>> On Thu, Jul 02, 2020 at 09:23:11AM +0000, Simon Ser wrote:
> >>>> On Thursday, July 2, 2020 9:47 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>>>
> >>>>> Finally is also adds the Scatter Memory layout, meaning the header contains IOMMU
> >>>>> references to the compressed frames content to optimize memory access
> >>>>> and layout.
> >>>>>
> >>>>> In this mode, only the header memory address is needed, thus the content
> >>>>> memory organization is tied to the current producer execution and cannot
> >>>>> be saved/dumped neither transferrable between Amlogic SoCs supporting this
> >>>>> modifier.
> >>>>
> >>>> Still not sure how to handle this one, since this breaks fundamental
> >>>> assumptions about modifiers.
> >>>
> >>> I wonder whether we should require special allocations for these, and then
> >>> just outright reject mmap on these buffers. mmap on dma-buf isn't a
> >>> required feature.
> >>
> >> Yes, it's the plan to reject mmap on these buffers, but it can't be explained
> >> in the modifiers description and it's a requirement of the producer, not the
> >> consumer.
> > 
> > Hm I think worth to add that as a note to the modifier. Just to make
> > sure. And avoids questions like the one from Simon.
> 
> Something like:
> 
>  /*
>   * Amlogic FBC Scatter Memory layout
>   *
>   * Indicates the header contains IOMMU references to the compressed
>   * frames content to optimize memory access and layout.
>   *
>   * In this mode, only the header memory address is needed, thus the
>   * content memory organization is tied to the current producer
>   * execution and cannot be saved/dumped neither transferrable between
>   * Amlogic SoCs supporting this modifier.
> + *
> + * Due to the nature of the layout, these buffers are not expected to
> + * be accessible by the user-space clients but only accessible by the
> + * hardware producers and consumers.
> + *
> + * The user-space clients should expect a failure while trying to mmap
> + * the DMA-BUF handle returned by the producer.
>   */

lgtm, Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Thanks,
> Neil
> 
> > -Daniel
> > 
> >>
> >>>
> >>> That would make sure that userspace cannot look at them.
> >>>
> >>> Also I'm kinda suspecting that there's not unlimited amounts of this magic
> >>> invisible storage available anyway.
> >>> -Daniel
> >>>
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
