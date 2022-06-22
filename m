Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE1D554395
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 09:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADC5113BA2;
	Wed, 22 Jun 2022 07:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422D5113BA0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 07:29:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 75CEB5C00E6;
 Wed, 22 Jun 2022 03:29:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 03:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655882991; x=
 1655969391; bh=pbobVvTrDvCWy60hjRxYkSgR6i7yeenNbIJBAiqpw+g=; b=q
 /Zil05qJ33h7dpV3MibHup/v31TpMY/FtERQi64DfqdrWowZZDGNMfESGbj7Nl+A
 jKF1V2pMk8Ju4Z6tmL2gTaODjhaE7mpelBgXzZLAEDHXzHkAfQAfEDIWi6WG8TSw
 cR2U6/7OpEZoMkJiPgHRyEIMkPBuNdeNx+LIOH2bmQBySB9e6AX9ePjEPvhMlLHe
 XX9kDlWSx1wSMZHY/2afOazzLgNdWxGSuYxTybxZqHls3J1mcA+OsldFD6mNGVHh
 H8SsUTzIneeI4lGD1C1JnuJGQemuIQdTjfxy63zkIwelbyquc58Q3TMbDo0k85J7
 eu3UjKn3gO5BzVH4GbDUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655882991; x=
 1655969391; bh=pbobVvTrDvCWy60hjRxYkSgR6i7yeenNbIJBAiqpw+g=; b=K
 tkUJWWvsRrG5DL3ztZ3ZmjB8RkCYXerkKnJTygmZ5wAmf2jcnsKoxqiiW/2BcUy7
 Hnu/0o3GoO5nGbHDSJrR/mwuG1X/oACqdet061YbXyp/W3YrOdC6g8/SGrht6nkz
 biVEoPAQQg+Sl58gw00q9ALLV9dvVBcgLVlO4mCbrwj2rLlYp1MUb2ndy8mN8dS5
 VdnqdE23pFxV1fHmune2a9vFtjHR5Ba89hiN/CswIEu7w6ougc0q5+0Q+7WKsQJP
 WwReLQx9YIgZqFC1M93QEymluAS5Q7U/2JKnNjrKEsRpAiFcGzV26og3KL6ssBD6
 rCHCXwS9hlZCT1miG2n0A==
X-ME-Sender: <xms:78SyYgr5mF1deCVOWBqAZvVLoI2k2aWhKvdDjiGzz_l3g4jLsp4kBA>
 <xme:78SyYmohD9OsHXRsoXSWKnq4IfM1LJ0p16UOQS9twufx39sNu7zFGanIH05NntHMP
 5P7LiS5G3IeMa7qacI>
X-ME-Received: <xmr:78SyYlPOjibmMY53-5xTnLrfExwzB25KEW0kixmI_X5Wt8vReGwRbEwUH87DMyGMS3Iylh_IFFKYVTYav4Tphj-6L4OpxA94AZvdI1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhggtgfgse
 htkeertdertdejnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgv
 segtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepueeigefghfffffeifeehud
 eiuedvteegueefffevgfetvdffheehkeffvedufeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:78SyYn7XkytEhS4DcBw_8aYoGHsU_bOQiwZiB11Odfugxy3iaWs5vA>
 <xmx:78SyYv64-Yl232jl4V-AFcsm9wnK_nAX9DjdTNxQ2NPHdV9B2ECh3Q>
 <xmx:78SyYniUlmrQSHISlHeDYcw5mNNL5GXifZsBemmTpGlFuK1Ws0Ix4Q>
 <xmx:78SyYibai4saUMSu_0H8eT3YuZcFQL9JoRsuXNjwo34cofquYkkMYg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 03:29:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: jiangjian@cdjrlc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de
Subject: Re: (subset) [PATCH] drm/prime: drop unexpected word "the" in the
 comments
Date: Wed, 22 Jun 2022 09:29:42 +0200
Message-Id: <165588297922.13818.13524716037059627396.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621130210.125461-1-jiangjian@cdjrlc.com>
References: <20220621130210.125461-1-jiangjian@cdjrlc.com>
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
Cc: airlied@linux.ie, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Jun 2022 21:02:10 +0800, Jiang Jian wrote:
> there is an unexpected word "the" in the comments that need to be dropped
> 
> file: drivers/gpu/drm/drm_prime.c
> line: 842
> * of the the buffer described by the provided sg_table.
> changed to
> * of the buffer described by the provided sg_table.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
