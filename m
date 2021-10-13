Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA842C0D4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 14:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF146EA5E;
	Wed, 13 Oct 2021 12:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75A56EA5E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 12:59:40 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4DE245C0191;
 Wed, 13 Oct 2021 08:59:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 13 Oct 2021 08:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 4spSPRIWjuUrV2txmbSvLrfH1gDLlxcwdIFq4PhT1Ao=; b=GpziRESWPV89+DNV
 imySKJmQDf2BCK3Rjq+t8Yd8c5U/nbnXd5/K/dhvnvc2RZjEeHaK6ZZklxroRYWK
 q+IREW71TdZiokLgKwr+f6KAxPH2yWfvu6mW2h9b9w2J0nd7ddgvq/1ufEPkhC0z
 +SSpOr6ZSmIMNiKpmtVGtKg8+KHn5fAv8Ecjy3YTSNqzuoNyN8IBOlJpoOubTZ6M
 61j2uvG/gnCHPaixdu1lo5TxZhfKbxHhdVJ5cl2tOTpQFHukrMeNb4UattHhBo7w
 vkm491YmLNT5xPBCXoMMf3CO1Fl8aHP9wy1pCIdQewFFW+f7vmaQma/c3Y1gL3XL
 lzL/tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=4spSPRIWjuUrV2txmbSvLrfH1gDLlxcwdIFq4PhT1
 Ao=; b=GguG9tlr1dD3ryYNqJ2NwyVcgl8AImEPemzh/msLArATSiy0xJlUs/ult
 MQoLswQEKziEQ5tftWnWXq+Gkm6lM6QJOpxBHw5dMN1T95ovdeEjf+YY66qxcNl+
 9gFvb8rv9v5LlwRGUxHG5L0fe9iM6Flv1swazAlcG/sGvp5/zE0JRSSqVnnxCd0S
 YGZH0aYiqnCCZ82kfRHliiRgP4ZjIh2mc9a3bAm5Y6viymZLm9T8Z3BYobfg2mp3
 yQpF4ukeHBvajp0DQo1bqK4pSN9sLgrchrB3Gy9moDnKvGSzZ4tjptciI5w0nvHa
 rdPUd6VHd+XHJ/YOMjuonx7Fv+59w==
X-ME-Sender: <xms:OthmYRHwM0-_q8r6YX0Ybad9rJ5uxlG9LvlvywBjVi-TydWBRAGDnA>
 <xme:OthmYWWZbrhOgxTvAZM5iqViK_SQa0VvBfu8XxY8oAFXJtJ9n2qecT51dPju7ll1k
 J_pHtYrqLRGS3wYPWM>
X-ME-Received: <xmr:OthmYTJmZNuEhPm-eucQT_Ae5VGOmbaIK7vYRuxhPbqpbz9t1MfiNpNiDVUbleZtoJeV_nGpV5l_0B2yEPV8rlNsgfDZ6D93fvdJdeFn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OthmYXHbi3TBECnT4090s8WLnVz_cclt_5OLx0iew6Z3n3H_LMjdlg>
 <xmx:OthmYXW5I812F6LNgakwfu7hWPqZZPxaBZIZRIEFrbP1E98FFTGq7w>
 <xmx:OthmYSOxl19Yf6BjfTUf1nO0IL3VhHhRKs4r6Dv4AZQz0tHos-5mVw>
 <xmx:OthmYTo_ocNK3wGbfHLpNdPCjDzOvkdbP9CJhKM2qW9W7-B0lZ8YWQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 08:59:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-rpi-kernel@lists.infradead.org,
 Florian Fainelli <f.fainelli@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH] drm/vc4: crtc: Make sure the HDMI controller is
 powered when disabling
Date: Wed, 13 Oct 2021 14:59:26 +0200
Message-Id: <163412979205.237205.9972264219486680135.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210923185013.826679-1-maxime@cerno.tech>
References: <20210923185013.826679-1-maxime@cerno.tech>
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

On Thu, 23 Sep 2021 20:50:13 +0200, Maxime Ripard wrote:
> Since commit 875a4d536842 ("drm/vc4: drv: Disable the CRTC at boot
> time"), during the initial setup of the driver we call into the VC4 HDMI
> controller hooks to make sure the controller is properly disabled.
> 
> However, we were never making sure that the device was properly powered
> while doing so. This never resulted in any (reported) issue in practice,
> but since the introduction of commit 4209f03fcb8e ("drm/vc4: hdmi: Warn
> if we access the controller while disabled") we get a loud complaint
> when we do that kind of access.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
