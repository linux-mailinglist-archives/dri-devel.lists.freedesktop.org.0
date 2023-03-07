Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0CC6AE4B6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A6E10E582;
	Tue,  7 Mar 2023 15:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B6210E582
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 15:30:09 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id A97B92B071D6;
 Tue,  7 Mar 2023 10:30:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 07 Mar 2023 10:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1678203006; x=1678210206; bh=MRcKO6pD8Tc+Ex6F7GSZYpROWLf8RaYsLIo
 /Rd7Ddn4=; b=VLeRC4RRakZxwsCBaCfdbEijLT5NIOhOjuKdOzlcSq3CeFWt4hc
 /Y+yUgKmGxQrqD5b+JJ+/zTP4DLh8zxL6Us0kLorJNzpAcIgp3ukw3Vwnrxvn8Xg
 QA70bbfC6dpk4J9qR+Oi0u9zs9M2rzYaeKG0+cf/eftU7uCv1i1TpXo6XN8gMGMs
 4WzKUbffHBIoQ+IyGF1RoyS5Z49Uc1OEQSHJxaVhQVDrK7QGyMIxLnVkerji1U85
 eLXwfby8p5dq8XCvolTNuRLC0ydlfViVQxCssi0uYA723yaidQ/75hSL03TBfFYk
 79HiHX1dPSFUbVKqRMgWgekjGdpB6aIVaWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678203006; x=1678210206; bh=MRcKO6pD8Tc+Ex6F7GSZYpROWLf8RaYsLIo
 /Rd7Ddn4=; b=MoUg8SUoJjhWmcJyn+qEZoysvXzlay61F4eG+nuZE+hjqrqO1tN
 Ab4lEqRtCC+CEK37DGEq3QlITo7QxZLy1Lka47OlacwD2XLgbKOkVmeYl7NnRh0x
 jL5XcbMRHYiv4QAgzGs2gLAWrJvaKMrJB8qEhfqp+LxSwThSVoiJjtUtm17IQQ0e
 xZBZ84FNPz1t7Cu90PkGaWa/hdqaoWAuFulDN2Azvf9KoO++tmiQ2cRC/MGfvBhk
 Unvscwx0T6jTLWfCrvCxlUodrnQ/sUQE7azvK2djNaaJviFM3u6dU6ddpAAnGSr7
 y9SsWikCWucWNUoQCQH+439jqpgToKEMGPw==
X-ME-Sender: <xms:fVgHZC6ag0xA6TP6Yz4rYMVqHyyq9mpPjQTJRyCTpQ7Smv8kXiiDoA>
 <xme:fVgHZL4V7B4H6jCYhacSk73BFS6UpgZzIkLt3IV5rci8TRPIzygjUZng1tCXVJcGE
 t1uwQi6UzMaCOiR_4o>
X-ME-Received: <xmr:fVgHZBdOlgx0ZsE0G8N5FkrfWFawCHrc4AyTw6pXG30FWjny7NqeLcVbHuutUJ8PaB-oTaTpY9qdy6fOXuWPo712xhQjti0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleeifffgvdetjeejueejieehuedvteeigeehtefhhfeifeegleekudek
 teegueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fVgHZPJVP5ryypiRBzeseFg74QqhrObdWuXlWGsKt4RYsjf__-0Ajw>
 <xmx:fVgHZGLIiucFzjFD66_RMAJ2zX5CDho8p_HyTkMOGhB1j7nxQAF1xA>
 <xmx:fVgHZAz6XX3yaGDasZaVrlkgOgcFNBiDKnALVFEgqdDwMwhv9HyGYg>
 <xmx:flgHZL4HCc8QZ-_C5ww9Am64rj9EehJZMHrG9hdusoO5TCLd8VCGPZ6UcQk>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Mar 2023 10:30:04 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Johan Hovold <johan+linaro@kernel.org>
In-Reply-To: <20230306103242.4775-1-johan+linaro@kernel.org>
References: <20230306103242.4775-1-johan+linaro@kernel.org>
Subject: Re: (subset) [PATCH] drm/sun4i: fix missing component unbind on
 bind errors
Message-Id: <167820298545.105326.9045991101528563547.b4-ty@cerno.tech>
Date: Tue, 07 Mar 2023 16:29:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 stable@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Mar 2023 11:32:42 +0100, Johan Hovold wrote:
> Make sure to unbind all subcomponents when binding the aggregate device
> fails.
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

