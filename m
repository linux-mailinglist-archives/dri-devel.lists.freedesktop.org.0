Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D675098A5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 09:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD2510F2EF;
	Thu, 21 Apr 2022 07:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783B910F2EF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 07:08:09 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D5816320221D;
 Thu, 21 Apr 2022 03:08:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 21 Apr 2022 03:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650524887; x=
 1650611287; bh=upiI/YVhpoda97m7B+pi4PFq7DtKDQ4iutvgGHrzZaM=; b=e
 XOrSSlRqX3bY9s130Wvcbwz53sx8JsNNjgWVZ18Xe80d957VqqcDxiJOOyf6QFS6
 u79sIVXrv22ps7OFfCUnEmQyzWNCqsTECmSkFona+DiPMOf3y9qsEbwB95JVkor1
 fQ4XiqGzDtFEstaRCFwhQg8Z293Akl879eq9Sa+gZt3qcXWadEObo/2EhUpR+96i
 H6/RKZ8ab9lt8DYxZ3E9aky1DqStmwSEor1E4AwfGBaEz7TaoEy+4pGSX3h7dikZ
 +3WmM0AZqiyAAHOtLxV0dpYbyjIxuImydUYLSRPnVbx9PFPjL6OyBUrkhrrtd4vW
 ggAaF8slR6wprYDClSfiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650524887; x=1650611287; bh=upiI/YVhpoda9
 7m7B+pi4PFq7DtKDQ4iutvgGHrzZaM=; b=iev8b1XYGfENlJLge+a85SQNub0kJ
 wUmLfHC+xlZtynZgOWVXAnV7X2Eg8XJPVack7xuzXu7InjeMJlhEnPaHrhy7fxxk
 Tp64p9pMQfmv7iY0jsEvrDc5ISEy5OhSbjYxBPfCWk/1ya1ewZUZAuJp14IFyOQe
 bxgVaA4gcLJpWkxoE50ZQSIWW190MYustwxZBlQY5fLw9tAI/huWLtvUlTr34T/4
 e6G3NQICutMValeTSPKDlYuGGsqwnTBLCS9r7ArOvDQf2C+mo28nRWYiRHoquxyi
 mdGM/wfn4i7lbFDbEuHOgYSbipcPTsy1khH3WcNYEvfbni0uJW0dLngjw==
X-ME-Sender: <xms:1wJhYtfdeYZw2t8XtK3mcJjQxn_R7d9rdK8b-3tKmvK0N58uSLVBZQ>
 <xme:1wJhYrO6XPsDOfVIfelnnujhA0Sjjx717vBMuU4ljSXlM_Xspw6O_lpiyO-CWO1Pr
 tEMPj0TFemRReYAtpw>
X-ME-Received: <xmr:1wJhYmionKSMLpzOG_4H3PukbRdNKCYqAeXpWYlYlJgXgUl_bf05W62zPxdsmbjLBprCZKieSwqPT0aVw5b4UqPTFXS9GpBQVPthQTE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddugdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1wJhYm-QxIrTDG3p07EzdfKZlhtyAspxBBBye-27Z4z16ptiIx1wUw>
 <xmx:1wJhYpv9DFTYvK3eH0EPno34-BFDf1u9DQFkfzj3HYCRdcV8X55G8g>
 <xmx:1wJhYlHZKyvG4pKp0FBpXCz1t2QAtejEOogx_rVFWfZJa3gJ-TpZ8g>
 <xmx:1wJhYvB65oshBqud3HlL7bcxNwoIpq4WM7dn6Agykx_fBISg9N8_TQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Apr 2022 03:08:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: emma@anholt.net,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: Re: (subset) [PATCH v3 2/2] drm/vc4: hdmi: Remove vc4_hdmi_encoder
Date: Thu, 21 Apr 2022 09:07:59 +0200
Message-Id: <165052487605.604528.14856933687018225203.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420114500.187664-3-jose.exposito89@gmail.com>
References: <20220420114500.187664-1-jose.exposito89@gmail.com>
 <20220420114500.187664-3-jose.exposito89@gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Apr 2022 13:45:00 +0200, José Expósito wrote:
> The vc4_hdmi_encoder struct was used exclusively to cache the value
> returned by drm_detect_hdmi_monitor() in order to avoid calling it
> multiple times.
> 
> Now that drm_detect_hdmi_monitor() has been replaced with
> drm_display_info.is_hdmi, there is no need to have an extra struct.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
