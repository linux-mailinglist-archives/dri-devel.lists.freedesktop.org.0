Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3C53B31A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 07:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CA81133BE;
	Thu,  2 Jun 2022 05:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1870F1133BE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 05:41:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B8675C00F7;
 Thu,  2 Jun 2022 01:41:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 02 Jun 2022 01:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654148462; x=1654234862; bh=okT/wK74HG
 j2Zt3jawMlNMBrXagDcLm9t4AJ79DfOfg=; b=V9d0PVS5Hosn/JHdyumKDayhkj
 I44ACViwIG+LxQNjJB1S+45z4Sy4SGM1gJxJTw2h6taVwoNhAGnj8fz6SwAmXzCY
 0tsPHthz7eQ081vNvlhP2g8VcP1iToLy3SKB43VATxXroh3nzQvEPJd3En/qW9R5
 cuuFYO1QTuO8rf9Rm81wnFnW3cW+qIWqghSjNADkVGM6WJ+TBBxJ2jffbe1RNwQS
 ClNJFgq3Osig5zKsYVQaCUFR5kzKIVTs4ZMXJqUKuLeaZ0m1SKkXhhVh89W/SnPy
 BaCiU1R+JXQXWwwp3bueZlaBnNcNDKURIoPvblqmnMMBmxOH/TpZu8O+fywQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654148462; x=1654234862; bh=okT/wK74HGj2Zt3jawMlNMBrXagD
 cLm9t4AJ79DfOfg=; b=XKQrPwK4ImgePhv5SIYsjVcnNGZt3YVBvExi0w/m9/1D
 S0k9tfFmrUIQT7/NqmQKWVxt9PoXbH2LhlP0ECE5DdAVEIzdE1wb20M2NRPU8+LO
 s3hTciqF4N3I1eV51UkI4T3PDPVVanxP+i8hp4Eaf6eYSiBN8XOtaGc4a31hnHfR
 f0HlFRY28SuXrFHB/rLBRQwJHNGSrv/qsyGiI8VWzfZRisla98pNiwzWWbfRU8m5
 kbtDwleDfXODzXx7QjVWfjSHtA+q88zEUt+0l6NCSVRVAcLkBt7QAnbnP2L+boHw
 41G0Y1TlAigudtfFR0niTR1S/cn3O+qjMXONwmtfeQ==
X-ME-Sender: <xms:bU2YYpJr6SbaxqY8aFsE29R7QKdlJPYbJCW5FKBacVFW5Wk043eOtg>
 <xme:bU2YYlIVllZBsn4rT4QMhKC753l5fnJ6wTMJpyzQ10TruMZGMrqBgkqVDZHR_OMqh
 m0Plj1Uw-05ZQ>
X-ME-Received: <xmr:bU2YYhsYB3D3MjwSD2dW5ksnM4PAkSIijsh1LzTPURtEcNOcEvTG4P46f73zCBnjZg8pO8wptI0oXooltZ1KVj4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledugdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
 dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
 drtghomh
X-ME-Proxy: <xmx:bU2YYqbxdPq2JDwUWoQS7iiZ9udZ1JL6FiYP8j3T__lP8Rr1tSJ2UA>
 <xmx:bU2YYgbMMarc5SkeVttTrr4moHDWrW_S6Dgi0m7mmG0pRqcaMDVZZA>
 <xmx:bU2YYuDe7_5FsDGIOBKFjF0wmZ-TExMtmEE01sUtGogpqzrmxNuSzw>
 <xmx:bk2YYtRrW91BMoN8G28mSI63Jt4n2Ch7ZLFrtA9_fg0dDor8I51Wtw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jun 2022 01:41:01 -0400 (EDT)
Date: Thu, 2 Jun 2022 07:40:58 +0200
From: Greg KH <greg@kroah.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4] dma-buf: Add a capabilities directory
Message-ID: <YphNaq/JZdlTW8S7@kroah.com>
References: <20220601161303.64797-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601161303.64797-1-contact@emersion.fr>
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 01, 2022 at 04:13:14PM +0000, Simon Ser wrote:
> To discover support for new DMA-BUF IOCTLs, user-space has no
> choice but to try to perform the IOCTL on an existing DMA-BUF.

Which is correct and how all kernel features work (sorry I missed the
main goal of this patch earlier and focused only on the sysfs stuff).

> However, user-space may want to figure out whether or not the
> IOCTL is available before it has a DMA-BUF at hand, e.g. at
> initialization time in a Wayland compositor.

Why not just do the ioctl in a test way?  That's how we determine kernel
features, we do not poke around in sysfs to determine what is, or is
not, present at runtime.

> Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF
> subsystem to advertise supported features. Add a
> sync_file_import_export entry which indicates that importing and
> exporting sync_files from/to DMA-BUFs is supported.

No, sorry, this is not a sustainable thing to do for all kernel features
over time.  Please just do the ioctl and go from there.  sysfs is not
for advertising what is and is not enabled/present in a kernel with
regards to functionality or capabilities of the system.

If sysfs were to export this type of thing, it would have to do it for
everything, not just some random tiny thing of one kernel driver.

So no, sorry, this is not ok to be merged.

greg k-h
