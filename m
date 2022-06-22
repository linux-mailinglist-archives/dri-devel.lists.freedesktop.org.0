Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E303554DA9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AEA10F482;
	Wed, 22 Jun 2022 14:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9540E10F482
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:42:50 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 222BC3200564;
 Wed, 22 Jun 2022 10:42:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 Jun 2022 10:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655908967; x=
 1655995367; bh=cbLMw3N8GUrZQk0a1DLFYHdSrm5fnAWrW3eMjhJA0ZU=; b=N
 EbPZqWc+/YOtdNgqEU2/o06trWoeX3GH5UgC7MPRYfixA/LA8Gs0svk9mz4bUBoD
 KeW3nI7S+04K1++hC7rWtmu05Y9Y9kRHLuHC3W9ADAwtkHqd192iJQ6RlGptceeL
 JZoUph17dGefcacsnHUOfS5SvBVeya1VovWaAzMpISG0CFe+Eaj/hctPdzMNbyWk
 5SzIIL8LN4FHnHcWs0xobBkihcPSsDi44jgfUQkdJbO7bD1iAh97qjnejhxdIG/D
 gQDvMkedyjb243hKBH/03g1jvReWUEktlPp8j0BEIfgaM2QiGVvmq/UDu16Av5JR
 aeD7rUm74SIngtU5tWJlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655908967; x=
 1655995367; bh=cbLMw3N8GUrZQk0a1DLFYHdSrm5fnAWrW3eMjhJA0ZU=; b=V
 idgRKlHsldbVRGTvbxsLau/6nptiCvfEanjLUmw6fgIovoUzfzNUs3OjC27HouXs
 TfzkR+wMhlN6CDSqCQjluHTEF+ZKuGMBb5yz+DE3uNG+SCDRTAdifEAvvxqddi+z
 3CutDezfKFVHD2iLZcL1PuGKQSdbQrJS8Zwr6I0tODq+fJLMuX5wq2Ck1htPmCKH
 Or9pqclIR3cVkx3wDEaYWhWD+xCpJvIoIhP7VPKKYvc8v2b1c1z27j7OrVzAMfv+
 T3YBT7Wgq3KPo1vYpqXS8oHDV15B8+2pP+udQgSZTrTyn7oydWFcNTwwjfWcpj9e
 djB17nmHrWa5FYlSvFbig==
X-ME-Sender: <xms:ZyqzYjVEN4rc_Zd3rnCx4VRbjz8mzpl6RLRB6kojnmOcYtgDQWKJYw>
 <xme:ZyqzYrnEoZ_Y4Fung-N9c_4LMx1p_4gXUpkSi8bou5m7raZ2BTgY4X_TlBXd_8XZq
 IRcR-o42_ueROXCOxM>
X-ME-Received: <xmr:ZyqzYvZQiw4RwtZBrhdCSN5oyGBkVrGpb1CKm2HSOEJn1yEMarvPF9cUusHW-T3tyEQCEUM0RusLB_qHlTDNMfpt2z6Wb3A3Fk2t9HI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
 ekredtredtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvges
 tggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeeuieeggffhffffieefheduie
 euvdetgeeufeffvefgtedvffehheekffevudefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZyqzYuXouZfCVX8e98z0h4-Ald9twU_WUKOogzj4B70fyuMgq6zbSg>
 <xmx:ZyqzYtmrxSYPUFmK7uuUx3WtWR38rz99x6yfS7pRrRZgEnA9dFCsPQ>
 <xmx:ZyqzYre9gTUSDRjQoQrpPl5Q7d-o5tvwjYidh6ANlSg3R9su_DOxTw>
 <xmx:ZyqzYjXv2UHiX-F7pxuhktgeVef749z5h80CS8lyvhUSjP4HYXTJ9Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:42:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dan.carpenter@oracle.com,
	mripard@kernel.org,
	emma@anholt.net
Subject: Re: (subset) [PATCH] drm/vc4: fix error code in vc4_check_tex_size()
Date: Wed, 22 Jun 2022 16:42:43 +0200
Message-Id: <165590895783.604863.3284375984657879373.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <YrMKK89/viQiaiAg@kili>
References: <YrMKK89/viQiaiAg@kili>
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
Cc: airlied@linux.ie, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mwen@igalia.com,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Jun 2022 15:25:15 +0300, Dan Carpenter wrote:
> The vc4_check_tex_size() function is supposed to return false on error
> but this error path accidentally returns -ENODEV (which means true).
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
