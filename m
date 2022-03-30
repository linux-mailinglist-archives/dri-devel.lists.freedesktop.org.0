Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 632AA4EBCB2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 10:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3E410F72A;
	Wed, 30 Mar 2022 08:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4C010F729
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 08:25:40 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 007AD3201ECF;
 Wed, 30 Mar 2022 04:25:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 30 Mar 2022 04:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=pGJcvOeyrDcEBW
 odSaY4vbrj2TeGyO6ZoLS8RvmBbxw=; b=N8RS0iA3RAlMwOd3Gg0XRtj8tz1LNt
 703div5If5iyXcrZlJgC962a1xUfVqxZLmT/ekp67XEI7yGpJnWPrJsAvhT8UAuc
 FrfqAQM46r5bZ8l0awaSVHzfuxiJO+QMWJBo/4sbwaMwhvPJgXJ6BFuD/oeNEnIp
 goKf45guLpiwGFNmEmYkoi0mPdaKNt0x5wDo2oFg6g9zru6Kg7sojXtv+si0BjlC
 GnJuXKGD1S2ASEEISLcaqMg3MUl9XswMM09tk6uKCVEIEnWRNUWH26JwoDGb9k0S
 imp3zVphLsYTvT4f2fql+jvcTkEDJ91bOXWwH3k5D+TzRUlJy6hcewoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=pGJcvOeyrDcEBWodSaY4vbrj2TeGyO6ZoLS8RvmBb
 xw=; b=gzwtwBkSGLQqxr8ijNRX4Fo0vb05+oXQV1SxUkKAFg05DiosiUz6EJfJb
 AbpxEjIZbStJzg/VFFDhmplaEoQ/by5yKKlu/wJWp5DzSfNngZlIuyHSfaD8PdGp
 UIvEDXXJUvSIuh0UBiY/hX6Esny7kNVCdnklrkSEiRotnyuUSpiphDtEtbjYNjf6
 u9KFY+EEk8BlkbJeorPxw9xiNHQ86h891DT2nrWns5cntHwRIPflIkVwbldi7EOw
 6DruM5V1kmdjjDPDPyls/w5p7od3xrqgehG1GvORjH2NE3orCLRuyM6gUrD0/Lf4
 xvhhb+v+k3xIcji56QVmaWtFNFLfA==
X-ME-Sender: <xms:AhREYlBRXRQyNTXDJX8NRmBP5eDaJU_U7DYQuefk3gc1HGtFv8dbWA>
 <xme:AhREYjibfyDRUaF8Kpw0oHh4a1wOKohoT8M5-BhbTAcvbv5w7HDpOqVXi9H694RF1
 3Sn6Qfix1JxAnRPuxA>
X-ME-Received: <xmr:AhREYgm_yRr4BbopNdfsuF6OZZBkX_Z1Chhs2muRUKVG3IVBxR7upKDEpAY_74hPeIvtTNdpynScfZPl4mCSUYA31-LxILBOy-Akm7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeivddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucdnkfhovfculdeitddmnecujfgurhephffvufffkf
 fojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcu
 oehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeejuefgge
 ekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeegieekkeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrh
 hnohdrthgvtghh
X-ME-Proxy: <xmx:AhREYvzYt9jb0MLI7IE4o00nmyTg-hA7gEHrjtJOFfSJGv0XPQOQYg>
 <xmx:AhREYqSPzT_qug1sV1hEfdwh2DAUW3bERch1Z8iBcWBDq2ZD8r2hew>
 <xmx:AhREYiYdqv1nh8luUZMb1eIkXQ98tCD6eVus1lwao-9bWxAi3VYytGopsg>
 <xmx:AhREYvJSB_UPJ2dSqjWBQKAGGPps9ypXBnjMi_uykjN9zCxMMkkgyQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Mar 2022 04:25:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v3] drm: of: Properly try all possible cases for
 bridge/panel detection
Date: Wed, 30 Mar 2022 10:25:35 +0200
Message-Id: <164862868776.152576.939299098675970686.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
References: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Mar 2022 15:27:32 +0200, Paul Kocialkowski wrote:
> While bridge/panel detection was initially relying on the usual
> port/ports-based of graph detection, it was recently changed to
> perform the lookup on any child node that is not port/ports
> instead when such a node is available, with no fallback on the
> usual way.
> 
> This results in breaking detection when a child node is present
> but does not contain any panel or bridge node, even when the
> usual port/ports-based of graph is there.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next-fixes).

Thanks!
Maxime
