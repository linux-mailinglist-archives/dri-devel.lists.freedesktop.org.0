Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E710254DC20
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF7F10F0E4;
	Thu, 16 Jun 2022 07:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DBA10F762
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:48:00 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E0345C0770;
 Thu, 16 Jun 2022 03:47:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 16 Jun 2022 03:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655365679; x=
 1655452079; bh=3O2r1YgyB2oeAhAg4TGS0qOoqO2cLHTA+vhcEDWUkhY=; b=D
 OYN0KxlANO5WF2q6PDdwXYhWguzeIRiNAefeqiLtSEUjeb/lRGEu1w9o//5cK5X4
 eeTc3XHK1E7ufGgn0l45rC8BmJnlfxf8xtXHCE5OoMXmYlc9S7Ds1qa1yh1N9b+u
 nyvYA5sMQfZ+87shRDam2zlsjiU6Z99YEGkemxxxJuqxITKPD/GDsalzgefVLNjZ
 RtK/cdfaivVig7OY/UsKzEeTGYepo3nxaVwA1qUHmClwE9yrXfhxWbiLTRNsDA82
 aLFyQDQS2+UrV1hs9Lw0ZSa8Ci57NySe/uodzixQflSeljql2MdsZtI2vONLzjSu
 mdieq4hzAWoC3u6DyheCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655365679; x=
 1655452079; bh=3O2r1YgyB2oeAhAg4TGS0qOoqO2cLHTA+vhcEDWUkhY=; b=r
 NCvz7NPU3pQSgVoxG67boXfuYScG3RgqY0zH58KUiyKRVXWy8XtN9rppXMdHIlTp
 8E3B6fYAVeON9DVSlDrA6d2/+s5047ZVZw6dlvv7J8kDwJZyLox6yX9TWrnXY58a
 nN5625afAC/drIyse8nHRetE/Q8ekF1EOfm3+KIWyMCz03VJtoGFMLA6yOanF9uL
 SO+fUuli6MlhvTX/WlL0hi+kPDPr7wIIlmSRqoZoF2lY/ls0vNdzviE6ratTEvd6
 Ho7i0vHZisByGbC2DyAOUIZqE+/xJbOQpvGhx7QElFOqT1X1hFA+7gIIHrV3pw32
 zvz5akpjiT2Hc7rd7zaWg==
X-ME-Sender: <xms:LuCqYjtXIOQ3KgXqHf_fYpYWpOezOxzgvY58XgQGYuGwCMyOU0iQmA>
 <xme:LuCqYkdCfgxch285e4mOAJOEj3FBHhlZxWkVTaCMroNE7BEGQdZVcUxTpTpCVUkNh
 _vcDjzY0YYY6EhKj-4>
X-ME-Received: <xmr:LuCqYmxaImTfRl2SM0f3MLF4wVHGaa0JZDJ5de1Psp3F1kQtOqN-L0F6yWB343KYkMjo2gzrRnaTshqw-WDehMPr9r7a8fmKdt7ZAa0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheek
 ffevudefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LuCqYiP0UMhOpqgfw7mMpv3B72CilrEWKThnpa47LctXUQxUxNgTug>
 <xmx:LuCqYj8pV6zEQ0ZNkMWZFp8yIpuHiNV3egck2XwXvcvUsQDIeEIZHQ>
 <xmx:LuCqYiXGJdkwGKjySYKJX7RAhZaiCNvQPUzfmHQfAnhCSXbOLSQPRA>
 <xmx:L-CqYk2JZlFVs4e0G6MHk3usUXzH7sue3z5gSIguzTnv-y6k2KjXfA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 03:47:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 0/6] drm/sun4i: HDMI PHY cleanup/refactoring
Date: Thu, 16 Jun 2022 09:47:56 +0200
Message-Id: <165536567243.1272810.1608686605887335667.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615045543.62813-1-samuel@sholland.org>
References: <20220615045543.62813-1-samuel@sholland.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Jun 2022 23:55:37 -0500, Samuel Holland wrote:
> This series prepares the sun8i HDMI PHY driver for supporting the new
> custom PHY in the Allwinner D1 SoC. No functional change intended here.
> 
> This series was tested on D1, H3, and H6.
> 
> Changes in v2:
>  - Move error handling inside variant checks in probe function
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
