Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DF819ECB9
	for <lists+dri-devel@lfdr.de>; Sun,  5 Apr 2020 18:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E926889ADC;
	Sun,  5 Apr 2020 16:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 462 seconds by postgrey-1.36 at gabe;
 Sun, 05 Apr 2020 16:48:45 UTC
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F3489ADC
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 16:48:45 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id C22A1580084;
 Sun,  5 Apr 2020 12:41:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 05 Apr 2020 12:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=0tXJRElr7BDueItOzw3JF8FMO6D
 wZZ6S27H7eTNZmDY=; b=e6P4ik73A8ZRZCAWVa6AracLqG7LJeDADvOOw+rcCfa
 GXDXxPSXpf8fD+vnxt7SoG92lsTaMP6ZSLfSywL96k6/CIjG5KuEzUV4LS+xUqXm
 FS2BqhfZO1o1saeuTWVCJHye9PE/Ik6Mret8ollNa9MM6+8amYWLDCZlnXQFQrep
 3ewjs6nm4mQ4yp1EjelVOBbT8tPcuywiqqgvRG1amzknQNrYiZCeNdPqhJLGC8G7
 EMg2b/b5BoVQTn2Kjk75ioIVa+214jwajVFJEUw4zG9XCIOHn3TVNJaWxv/Vcpse
 8HMXmo+LSPfT20eL2i6wW5J6P4HEmEdMoK1xv/+FKMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0tXJRE
 lr7BDueItOzw3JF8FMO6DwZZ6S27H7eTNZmDY=; b=vl9myuJPGhUgWZEpVDwaIn
 HoACoCLhv3zCeZv3PRcwF3JVJUbkDGl6JXBZ7VlJTqxpYOslIkPp5f0yJ7xJagpF
 JhjoI9ZzTP3JusW2QRkxKAvJPL3welgj00f1RyOUjQPNJyyDx2JnCUN+etDz/ZcL
 0xsNGuJiYy2zhyAVypntd2PylHGcstqhHEc2GmVJixsaP0h7iJk27UEMJNlmXZJG
 9NPT8ogSciCIwwdWNdgExP+AP5ssf4qPjUMsbAjrUkqRDrZ7J4fXQySeGv0s3Jxd
 ey9DVeVuRLXk+dAvT3s3ozmAfXUMqXeJbDgv5Eff2dB7Bz3I6P43KLzIK+MQMbiA
 ==
X-ME-Sender: <xms:GAqKXmxcN_bKCeo8I3fLxYZtGgP719wduXxQV9io2Bu0DNd3xQl1_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddugddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinhepkhgvrhhnvghlrd
 horhhgnecukfhppeekfedrkeeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:GAqKXr9vfWQGoEP8wX6drUhvA9A7mqrp7x02khCc4Nl-PJ4PkouL7A>
 <xmx:GAqKXvQNW90Nz-HRuvd1ghxON2yQVfMIgZgjiZPpe1pFhBskrWfdQA>
 <xmx:GAqKXglGdifCzcRhgbFKjAp1YE4EqTDBzENju6xUUn6sSSnEvJyPwQ>
 <xmx:HAqKXuN5tVwgndqDYrnbF_aqUrBB4UyWOLxH2bH0E6tiX0e9CFh8iw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 68AEB328005D;
 Sun,  5 Apr 2020 12:40:56 -0400 (EDT)
Date: Sun, 5 Apr 2020 18:40:53 +0200
From: Greg KH <greg@kroah.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v2] drm/prime: fix extracting of the DMA addresses from a
 scatterlist
Message-ID: <20200405164053.GB1582475@kroah.com>
References: <CGME20200327162330eucas1p1b0413e0e9887aa76d3048f86d2166dcd@eucas1p1.samsung.com>
 <20200327162126.29705-1-m.szyprowski@samsung.com>
 <CADnq5_NpHvmRvzvh1aF293UDUXiHF4Dg1rRNkt7XbM_VB98JCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NpHvmRvzvh1aF293UDUXiHF4Dg1rRNkt7XbM_VB98JCg@mail.gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Shane Francis <bigbeeshane@gmail.com>,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 "for 3.8" <stable@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 05, 2020 at 10:47:49AM -0400, Alex Deucher wrote:
> On Fri, Mar 27, 2020 at 12:23 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> >
> > Scatterlist elements contains both pages and DMA addresses, but one
> > should not assume 1:1 relation between them. The sg->length is the size
> > of the physical memory chunk described by the sg->page, while
> > sg_dma_len(sg) is the size of the DMA (IO virtual) chunk described by
> > the sg_dma_address(sg).
> >
> > The proper way of extracting both: pages and DMA addresses of the whole
> > buffer described by a scatterlist it to iterate independently over the
> > sg->pages/sg->length and sg_dma_address(sg)/sg_dma_len(sg) entries.
> >
> > Fixes: 42e67b479eab ("drm/prime: use dma length macro when mapping sg")
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> 
> Applied.  Thanks and sorry for the breakage.


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
