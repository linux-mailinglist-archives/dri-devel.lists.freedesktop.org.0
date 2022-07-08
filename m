Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DBC56B8CE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 13:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A5E10FB38;
	Fri,  8 Jul 2022 11:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518F710FB38
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 11:46:15 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 76290320092E;
 Fri,  8 Jul 2022 07:46:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 07:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1657280772; x=
 1657367172; bh=9OS3JlaziCyFeTqBhOLIaUNPTkkWU1V04mZgY4gh4L4=; b=X
 NzQAcbou0q6ntdF8KC8QBV63CWkjlik6rXelIxEj6MaAPY+lpbLQJWi21myRM5MW
 2wf0vy0mUfEO52QUdn4Ofqdkk/WEQemEHEkHRmmvrq1N2YZUaid/wRMFf1QwOssH
 djcuY8FQcPSLim7RmfO7IPjCsxbh2XBlPNpVaNKZm8FdAqP22TflO9uZ7usGiYn5
 XplHZf+DTiNpPKsH+5lC+caETjmI3sNHzarA5CFUDMw4Naq7s7H5TPwcM+5QjttS
 J9fm/UtMbk/LUwAXcdLg6IKtfjt9jFEpmIYeHQ/lppxA9hxHYFaujNLNUcGQxUog
 1rwxK/Cl4EesoGtKWAtOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657280772; x=
 1657367172; bh=9OS3JlaziCyFeTqBhOLIaUNPTkkWU1V04mZgY4gh4L4=; b=W
 vDbmFaYBTUwg3HxzPImNvozlUVNgouRW2VIZurKpbHXOivn82CMgb+Bei5d92T6m
 sm+A7+PUkTHqohpoQY/AwzGtYQjoSVVcXMT1dD6SbCrBoAmPKpZkIgq1C6D0qlci
 d0VCBA7HgJTJprHnHNfRmadqk72LAlXBWclhftpw1ZPKEtYJgLzoHOl0bMjT3lC/
 FfJCcoWY4tv/WrKbepTzYo/lRlfARCfWhdJ17/9JBDeqzqOjxw28wucELW68Xgfo
 K0OpQt3RBAHFl4Bv2pSJZz3/c7slpiP2mrLxRm13+P79ICCxr5fzDPQ2TJUjQ9Vx
 A+y8mKkaVKFCaXpiEmc9Q==
X-ME-Sender: <xms:BBnIYt5nXYE-zWGcpjA1lMmYFS4YzHwEaX2xucXmdB_uP7EY13Pp5Q>
 <xme:BBnIYq7JtIwlEn6RTtaMFw9i4zf10P7AHsQcWEe4QTCzoO9Goki98EmiKZ8jA-DQC
 Y0qOh7kzprzq9-XJcM>
X-ME-Received: <xmr:BBnIYkeL9B02p0G7XRddq_8RG7fuNbrQQN3xeKGS9MEi0ma1p4bTfLUk1p4liJ7S69rZQc3D1To7KTDHACzZiPLmbmZHFZkjrvxAjsE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
 ekredtredtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvges
 tggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeeuieeggffhffffieefheduie
 euvdetgeeufeffvefgtedvffehheekffevudefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BBnIYmKDmLLljjXsuDxlwAhz02vUgVECw6fdJKtYF138f_ggFMkTdA>
 <xmx:BBnIYhLBlWdRdLx182YSjZgPCmYJo5rvCnIJlSTimk90UXfV6AKVFg>
 <xmx:BBnIYvz8t79giFs94quSzgXQ6tUpFupVp0xZMGm5xszSO4HdNA_Taw>
 <xmx:BBnIYqVAPe_eWIxvGJJpV2wQEmwqpaFV1CPFk6N0bZaC3t5p8XtT6Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 07:46:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 mripard@kernel.org
Subject: Re: (subset) [PATCH] drm/sun4i: Update Kconfig defaults and
 descriptions
Date: Fri,  8 Jul 2022 13:46:04 +0200
Message-Id: <165728076203.379115.16788305683989938923.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220702193250.52959-1-samuel@sholland.org>
References: <20220702193250.52959-1-samuel@sholland.org>
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
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2 Jul 2022 14:32:50 -0500, Samuel Holland wrote:
> Allwinner display drivers are split roughly into two generations. The
> first generation was found on early 32-bit ARM SoCs and contains DE1.0
> and a custom HDMI controller. Clarify that these options only apply to
> a specific list of SoCs, and limit selecting them to 32-bit ARM, to
> avoid confusion.
> 
> The second generation, found in A83T and newer SoCs (both 32-bit and
> 64-bit), contains a DE2.0 and a DesignWare HDMI controller. Since this
> is the most widely-used generation, enable it by default. The previous
> default condition (MACH_SUN8I) was limited to 32-bit SoCs. Also enable
> the DSI controller by default, which is found on 64-bit SoCs as well.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
