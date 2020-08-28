Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10598256648
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E52E6E1B7;
	Sat, 29 Aug 2020 09:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB906EB8B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 09:44:46 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id EF2DA8D9;
 Fri, 28 Aug 2020 05:44:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 28 Aug 2020 05:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=P
 tXB5hSLgVKMT2j7Z0Zf6VjUGFj2dGFbBan+VqncaY8=; b=WaxiOLCG1wd63Ab8p
 nEomIFSHutNxqnOOT0uiTJQjuFRgyeHL3s0CYiCO6ElyoBYIrRDyGfqGxVSLOcam
 +qaVN9OAPUwle2vIXuw+bJSrda7XxaRHE+S9ljasCf2J8Xe5eh0+DYURyq3cxOOd
 MPBS7lYgpd0CEXhHyY50tOtZKK0tbRZwlqT4zFBhVCCb8Jd+cX7OI+HZZyJL6AN2
 5phncL0hhAgZC5RjTtEv1iH4YvaddVO0er2I/RXtOjRKardVzoXmesG9TaQKF525
 jwfWKfRWGiyG6FfkEAv7rrmceN+DqtVmN2+fZ12nWRNnCnMoxel/xxwHejD2PUQ6
 ux5iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=PtXB5hSLgVKMT2j7Z0Zf6VjUGFj2dGFbBan+Vqnca
 Y8=; b=F6T3vOg5RkD/XnZfWJ6BPo+sYfYwPZQ6XdWeZ1JTC8PGr1+s4y//RPov7
 OF/EtlUzJ4xzZgNg5pb1QKTAjH2O3E1PgwLlgj5nOFuzuoQ2jjyDC3SP7TIK4h8r
 PpyELbuiO1ceQj+YWrNRPU1tX/CJFVKHtY0HAPwf7HprU7bVH7DjO86MmCw8N78p
 ChaqVE53fIE6dMYLP9dxcMPHrSboZP639jgFqC8DPdP2UQu17aG/LhhCvnawVQiK
 n79C01mXl0wcEPhbUqS51NXSKwFjbtSAK4X1svaP3ZQG4HMrYU7Ykj1AgDTW3Yr+
 A4JquaiK6cN0B4EFaBUD2Cg9U7ezQ==
X-ME-Sender: <xms:C9JIX7W03dadeG8PEMoGoVQfbh_sjVanI-guPv-3VbPVr-Oi5EBHlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvjedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:C9JIXzmrkoEGwVijS9wdGLeWSJS48ripl0cKVPDQWgVYh2iEL7bEvg>
 <xmx:C9JIX3Z1NC_o9diyU9cdZgnc4uiDqV49Hs_EHT4shiolZMYtIB42MQ>
 <xmx:C9JIX2VziRx8voA1cfGPjtE0YegQ1TiWRfZRBVq-WPf1uXwtS--Sjw>
 <xmx:DNJIX3n7To6TC90qWslSds0yFEFG8Ls9wjHb99y34G1AY1Aqqje_4DLiu6E>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 602503280063;
 Fri, 28 Aug 2020 05:44:43 -0400 (EDT)
Date: Fri, 28 Aug 2020 11:44:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH 0/3] drm/vc4: Support HDMI QHD or higher output
Message-ID: <20200828094441.6h6siehqbebayffn@gilmour.lan>
References: <CGME20200821071121epcas1p12225cf2891c2bbe22b90ac65e826dcaa@epcas1p1.samsung.com>
 <20200821071045.24501-1-hoegeun.kwon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200821071045.24501-1-hoegeun.kwon@samsung.com>
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 tim.gover@raspberrypi.com, dave.stevenson@raspberrypi.com, sboyd@kernel.org,
 mturquette@baylibre.com, kdasu.kdev@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phil@raspberrypi.com, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, nsaenzjulienne@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

On Fri, Aug 21, 2020 at 04:10:42PM +0900, Hoegeun Kwon wrote:
> Hi everyone,
> 
> There is a problem that the output does not work at a resolution
> exceeding FHD. To solve this, we need to adjust the bvb clock at a
> resolution exceeding FHD.
> 
> Rebased on top of next-20200708 and [1].
> 
> [1] : [PATCH v4 00/78] drm/vc4: Support BCM2711 Display Pipeline (Maxime's patchset)

Thanks a lot for figuring it out

I have to send a new (and hopefully final) version next week to address some changes suggested by
Dave, so I'll squash your patches into the series

Thanks again!
Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
