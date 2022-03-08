Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0684D1610
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 12:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2099B10E5BB;
	Tue,  8 Mar 2022 11:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E36410E5D5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:21:15 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 264513201C39;
 Tue,  8 Mar 2022 06:21:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 08 Mar 2022 06:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=vUt/hjyYKhUFZD
 0GhNOiqTdU+eUWZ03MPpM5Tk05368=; b=jbJXNIhNlNT0Kxp99CnpljQebPdruO
 GZMLyOJwrrf2ul8HxXpy+WHjtTAV5fw9hlNelPjLa7emZ8xbs/wqoqnr/v20Y1GP
 voXzjOa4/RvBX0v7zfVJqVs+xHlctYFa+izR+OtcaZX2ZtOohXUW12V9FMiSb4Wq
 jql2OmB6KrVe8Xn73e6laNyh9bakeo9JasaYZ7Mx4NTySLUko57f0Fww6GM/M8Fi
 npRvON/QUFGwoR7oz1Y1BJf7X+Je/eU3+0pqZJ8TAVQ3eweNPOqs0vxkjEtioOx5
 R1PS+rQ58Rel5VCHFi2oXywNmeWlhrVFLq5egPG0EvTysJAHrE7mgjlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=vUt/hjyYKhUFZD0GhNOiqTdU+eUWZ03MPpM5Tk053
 68=; b=Qijw5CGdpPaIJWJXNogQyuxbMqHss/mcKfkHpXd9XtnyUT6UqoMI+d3/h
 7XteXLn7fc6IzwPEh7PfDw+fpKLZBJm4Bd7ExI+pwBgnEd2RU3YezN/zbM4wGPmG
 lc8mJQmsa58VSwUbCFEYlWceeOLMTAOnopZogs6/1iI0LcdCwUg5h2BtIEWBwOGe
 B/qmQPDReW0Gl4Dc5RHlc3fb+PV55veXx8O83QVMRde8vQH5hkHP9cU0MUzB6cKg
 63//ryNUqaxW04GWShO5y7K1XezU+F7PnpUGk7DslZ7eJXMvSRBJa5zGS2Eecpji
 Mda0mzrddAwiWcnaVrZ+0H2uAWiPg==
X-ME-Sender: <xms:KTwnYlZz3SwecXiiFtzhXErSu6clnZ5l93aZCqAIYR1Wh_vBuhLB8A>
 <xme:KTwnYsZ7Jz-EyO-XAyg5X2ZwkW5TfZcvSxx0f4-0a2OBU_THx6ZSv2ro_x4Eu0ius
 uNDuuvQ2Kggw68lDy8>
X-ME-Received: <xmr:KTwnYn_v6yKzq1s9KxCIBj0q3yW-cYmuTei2b6Hrp-20Drla1Zb-cwGXyVLvT2BmljxswVbeqE5vP2Yo6nxXGlxqf_yJKebuilRPo58>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KTwnYjp_mAdHd0J9fgmfKiNMFxzYq9TvRkBlajrvGB1dObcCqy-ypg>
 <xmx:KTwnYgoM-A93FUjMnNFUjbnbOLe1qf1GCSei_9ydjyTPGGlFuuZaCw>
 <xmx:KTwnYpS4jO2HGN8Icj-WTJVY56sS81p0mb42zX5g5MmrO2uVh0S50g>
 <xmx:KTwnYti0AcNLBT5gU7J0vyFTzQNe69HY3Y5e0wxk0lqXo-BYW95J0w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 06:21:13 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 andrzej.hajda@intel.com
Subject: Re: (subset) [PATCH] drm/bridge: parade-ps8622: switch to
 devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 12:21:02 +0100
Message-Id: <164673846305.2436174.1857157702611077242.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228182904.22982-1-jose.exposito89@gmail.com>
References: <20220228182904.22982-1-jose.exposito89@gmail.com>
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
Cc: jernej.skrabec@gmail.com, narmstrong@baylibre.com, airlied@linux.ie,
 robert.foss@linaro.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Feb 2022 19:29:04 +0100, José Expósito wrote:
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
> 
> Switch to the new function and reduce boilerplate.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
