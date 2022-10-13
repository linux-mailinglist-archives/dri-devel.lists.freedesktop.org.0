Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E08E5FD8E1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 14:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9701610E217;
	Thu, 13 Oct 2022 12:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A5410E201
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 12:11:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5264B58020F;
 Thu, 13 Oct 2022 08:11:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 13 Oct 2022 08:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665663068; x=
 1665670268; bh=fBL2ugTdU6bR0J59qTCJMS8/Y4g/sqBnGoNZZfoa3gQ=; b=B
 1A+LoT/3W4lXQlbkjZvhnOkPnrHex+kscyu//5aAJUzeACq2EduseagSCOCDWGW+
 39mbfXCIMtkvgLOdetM3Ap8d+sIzIo3HpJhv9PwdhQv3Ms7GqT1dIf6TuBl3FpWP
 8xlSKu54rK022k2vR7tzuIaNwRN+fXrLhU0HJbz/eiUarkkf9VisfBsKIt8lJcQm
 xHwMVZoO0+si8stYlmrNz+Ctbm8m0vEfF7xTZwup2YtdLp/IFeT/95dl+/0ftD+z
 CUEriZC2sUSn3ExIPb0ZRiJqRIPDE2KG/g0M8XWCgH9AeJIDe38BDwHBZrx1e+Y5
 utYcEoqY+rHXpoOYaFlsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665663068; x=
 1665670268; bh=fBL2ugTdU6bR0J59qTCJMS8/Y4g/sqBnGoNZZfoa3gQ=; b=N
 tlfpF1TGEMfqY422maYA7yk1G9AiOIX0H6utBOG/J1L7CTuYan0XGtKGMHb1r6Qm
 RrPUOXGgpDIfSv8Ti76Pj4QvfCBoIy4T2l079+iq38vDclsyWyrmAfTx8Mxsj8Xx
 n8MioK+G/jWnu8M83cb8YchL0/MDMlMKKImQn9eOPOmycwc/aE0frRwHWghT3bdA
 ubqPwNGxdKkfE9pP6KIy2Vs6Nx4su1EWZTZ4wob9+VETx+jkQ++ptsnTgr6MGwQv
 T2hCViqFyK9B5XnEPlG7WxVr0BJALr1SgcComTQ133kB7nOBDyaodYLHyurlbU5M
 mp2eU8XyHVrVTWu675c5Q==
X-ME-Sender: <xms:XABIY06_L3ZWng41ujTo1cPRN7hGxqo8La56P6XvI8ui35nToGolMw>
 <xme:XABIY16kEoDImUC1eKqvN781kiBxC7Wu0raTvlisW3sgn8ixbokw2ehJ8LRuVITtH
 QbtaZR8jfvEJhIFjC8>
X-ME-Received: <xmr:XABIYzfIpEmHiCHuwRt9yFrbCR65YbQts0VZxkibbjhY8zc56qk9u3HpOT-YXWYGC6ReCFOwxjfD81Zv-XYbwZ0WON2VInGmU8ld>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XABIY5IVovBTBdLOKZWFqdUmgalF2e3O_Y18zPuGPVyGtvPX3GCh1A>
 <xmx:XABIY4IfQM-GTeBXHvGfh0rOwPHbfoK2a6HDgN9n2HiSIKCGr2Dujg>
 <xmx:XABIY6zSWiOkUy7k837ndUOfcxDZ9yfr8fT6VEqLbDX4mXc15WDojQ>
 <xmx:XABIY4KoK7vDtt6JOF2vtsnwXpNjNqWwNJXNuF4d5vKEF7MQUExVSA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 08:11:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>
Subject: Re: (subset) [PATCH 2/2] drm/vc4: hdmi: Check the HSM rate at
 runtime_resume
Date: Thu, 13 Oct 2022 14:11:01 +0200
Message-Id: <166566305526.1731673.7313352763401370465.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929-rpi-pi3-unplugged-fixes-v1-2-cd22e962296c@cerno.tech>
References: <20220929-rpi-pi3-unplugged-fixes-v1-0-cd22e962296c@cerno.tech>
 <20220929-rpi-pi3-unplugged-fixes-v1-2-cd22e962296c@cerno.tech>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Sep 2022 11:21:18 +0200, Maxime Ripard wrote:
> If our HSM clock has not been properly initialized, any register access
> will silently lock up the system.
> 
> Let's check that this can't happen by adding a check for the rate before
> any register access, and error out otherwise.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
