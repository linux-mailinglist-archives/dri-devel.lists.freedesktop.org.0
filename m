Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2555435C76
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93626EC1E;
	Thu, 21 Oct 2021 07:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEE86EC1E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:53:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id A99D1320100E;
 Thu, 21 Oct 2021 03:53:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 21 Oct 2021 03:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 O+ihxC6+a8hsyBFVP4aRMPlZa6WIr1zpcOAhP1S05Fk=; b=FXRT0gobhGitctju
 frTegO8Ty1EQaLy9ZgsxWmNtIcBKQtRG24osioU1pCXL5V3TvWcE48frOaZ3HGul
 K3vLM5UnD5Z0g3BbpkMKUTHQnKosMXQ9D3Lf6eDMWCzTA6SB4d2SR09bU2GaTCNr
 uMFQepNXvScgOzzqU+DeQaRUKG5t35kFq1A2r/7FsF7W33IfLFVI3zrgeuWi7lyH
 XCt/5TXCvdscraJQzeRrTOKCnDKbaEwzM9qD6wzBKF88EMNFHdU8ABJEkT2pUdgd
 Xa3yBHllcRFa07JJ6Hjl6L8/rKZ85+FWabGeHHmTgSbOS5stTn7QhFhe8EEm/5eP
 7OcnFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=O+ihxC6+a8hsyBFVP4aRMPlZa6WIr1zpcOAhP1S05
 Fk=; b=G+nHXRGq3ox3v57XAVnyl6/K0PuuRJ+h+iK2DOTvoUkcJJLAX4NXY/Wdc
 +B5zSf/YZdfUYgLePcw+ii/JDVv5seziTAIbNr6803I6n7PrlPFVQ9Ro2CguQ9hF
 ITrC97/rqnh4SmVnm/+B1G42hDkmoGytZTpA5enf2SuecT95SnW+0mHNA2i80+4G
 Xgk3vdg/JFZfcW7dRosDKJNojdvM688y1+wT3RaGiuLgnHaJANXTCBvYXRvD1+gV
 jBrxwAnlKtpk1w2OqZT4STd6+HvuHK3x12lt+XaDrsB75W15cP1t9VriMKro8JCA
 kvsCTZd7o8tb8EI8Pr8M0mgaDjcOw==
X-ME-Sender: <xms:gRxxYUGziBSzLvNfhVenJI-64ZVg6wV8oxDa87yU6jbfiEPAC49k4w>
 <xme:gRxxYdXUInV0jo22_hVC-Yn_Q00zWKncVWdq-KrV9X3OP9jk9QAmnR2rDIIKEJsL2
 b76KevDUlAZaX0Uvpc>
X-ME-Received: <xmr:gRxxYeJUyAwYUFVsy1cQdtsNYey6DTSeJFZYQM7p-Sm70MaEuM_DYZWQSVkwjf-XIomOGCVtX9p_p-JpsD9GAxiiYrw-EbMFxbyW6QwX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gRxxYWGcyu6KJQ_mzrytbEox8WJAjcnlPpdxGZTNIHdmZJwdVSqU_Q>
 <xmx:gRxxYaV_czh9aXvq2AbfMGAWy_gGJSW4nNq7Bdfi4jb1wBKyKo9tFA>
 <xmx:gRxxYZMz3hDbhZ8aPofbSI91LxDEcGSVEQzuSNqp-4GmRsci6W5ztw>
 <xmx:gRxxYeo5nj0qHCAAHjbVhPUWQVZGkXDn7FZtrcI3QdQrt9G-Cn5-NA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:53:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, mripard@kernel.org,
 wens@csie.org
Cc: Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev,
 airlied@linux.ie, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] drm/sun4i: virtual CMA addresses are not needed
Date: Thu, 21 Oct 2021 09:53:34 +0200
Message-Id: <163480280299.501699.809157203649061929.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211019181028.4190737-1-jernej.skrabec@gmail.com>
References: <20211019181028.4190737-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 19 Oct 2021 20:10:28 +0200, Jernej Skrabec wrote:
> Driver never uses virtual address of DRM CMA buffers. Switch to CMA
> helpers which don't deal with virtual mapping.
> 
> This was actually already the case before commit ad408c766cef
> ("drm/sun4i: Use DRM_GEM_CMA_VMAP_DRIVER_OPS for GEM operations"),
> but only convenient macro at the time used helpers with virtual
> mapping.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
