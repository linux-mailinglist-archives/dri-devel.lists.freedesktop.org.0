Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DB8A4CC73
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 21:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636CD10E238;
	Mon,  3 Mar 2025 20:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="WXjVaEnB";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="PmI0BGAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-b6-smtp.messagingengine.com
 (flow-b6-smtp.messagingengine.com [202.12.124.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983EE10E238
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 20:04:10 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailflow.stl.internal (Postfix) with ESMTP id D2E521D411E3;
 Mon,  3 Mar 2025 15:04:08 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Mon, 03 Mar 2025 15:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm2;
 t=1741032248; x=1741039448; bh=pD70oFS3M4Bnr8rEfLIbi5W0ZWGc/ux+
 HB8INioexGU=; b=WXjVaEnBX6IOGqXQHJ2m4dPzu0BGbHs8jAYcklH1EsVXpUXA
 pqUGVJJnJcqmW2tTkd4SDwFl+vvxlTF/9Ex485SAzkL1LsuEbavHI51bhrSvn8Eb
 RDcHwgX5RV+Kt9bkX3l/3hjBzOluvkVazeqmK+JI7ZSJD3DRSUDjlA+r0ksurTS0
 3656EgNb/UC60rxKFY+ixNTfUc2J/5WFwFsJqRRJrNmzj3u1iAE74pZt9hRbNjh0
 7nxYSB9jXXbu6lOrkqSr8ybvaNgCXvvEbIiLrE3IIgieadqaHJ0EHPHQlkvYtDg/
 5HEfzNx4Ez0bZFuB4GbprEUpWLPiLgDs2tWYLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741032248; x=
 1741039448; bh=pD70oFS3M4Bnr8rEfLIbi5W0ZWGc/ux+HB8INioexGU=; b=P
 mI0BGApw4lGroXEvS3GMBBbu5wz/SwprNLdFIrFs0JrYT28a9rwrj93ED2MJ6rXZ
 tlnb+yZ1spjol6GrqGnYmBBlUXo0O7kmxnnnNFAxX3aU31zCHckx9w+H2IGdOWPr
 HA6r/VQjvIB0qFk8RtYr+tFgl4hUKkoppEd9lcGyE5PWGWZTLscqW1ZfP/4GdMAV
 52QnrFhcfj6GpanBBMdXN3ZSGS+3CwifkzIJrDWo8DMji//3+0Zy0yCqvn6q+dgx
 n2fGiHGWxbYkjOJYa0CwC9m5r5bQXgmINdLrl9Pqc093V9e53oeClFjOZyhvTLv1
 a/7JSQ5SMgSbAui/6En/g==
X-ME-Sender: <xms:NQvGZ_VMM3RtP1DKODTRwtlwJzNkwcbcmPn1s-O22DbPhk3WmR7GpA>
 <xme:NQvGZ3n-zUADSrIYQbPCxcyd8SqQa4YWv9dAYP3FcuTmo2XJtGXQw5z1hJwUfI4V8
 rigKHwTmTvjJQIJSuo>
X-ME-Received: <xmr:NQvGZ7ZnQiedxDTR5CEajnguSPyYFsheJa4MtuRHvJ-RqCiqbUarzWHEAtzZxiH6XIqs3UmrI3X1k47UsDdmQcLdSbAzyKliGlVA24Hk3WCOkEfRux8vCJvExEkI8SU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddttdegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
 tdejnecuhfhrohhmpefuvhgvnhcurfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrh
 druggvvheqnecuggftrfgrthhtvghrnhepgeeihefftefhhffffefhheekveelveeiteef
 geekhefhieffgfehheeijeehiefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgt
 phhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhnkhhlrdhkvg
 hrnhgvlhesghhmrghilhdrtghomhdprhgtphhtthhopehsvhgvnhesshhvvghnphgvthgv
 rhdruggvvhdprhgtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsthdprhgtphhtth
 hopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehmrggrrhht
 vghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoh
 epmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhm
 rghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtoh
 hmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
X-ME-Proxy: <xmx:NQvGZ6UYHxVWkZf7UtPX9TwDArprBk0BWSBdpveHMJd4CkkzrHt6kw>
 <xmx:NQvGZ5mAwfjIDz1C18jwijwve-ADRksOJRo2PDpzeZQ6xiOeQaWbDA>
 <xmx:NQvGZ3fT339mfLcSW5qQfav0c8o47LLgQ5fG1WVOxCQQ8dkF_dD1EA>
 <xmx:NQvGZzGFmyC2hu3N7Vq5zjNkUx1dHg92NTiwpEThN4TPfcGOgk03-Q>
 <xmx:OAvGZ7UFo6yl2jRQYv7xu9S__Twf17INMbiJr6VmJP1Hhx5oxAy2M1kN>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Mar 2025 15:04:02 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neal Gompa <neal@gompa.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nick Chan <towinchenmi@gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display
 controller.
Date: Mon,  3 Mar 2025 21:03:58 +0100
Message-Id: <174103187680.75921.8965235926191911132.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
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


On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
> 
> 

Since the dt-bindings are now part of drm-misc-next I've also applied
the dts change, thanks!

[4/5] arm64: dts: apple: Add touchbar screen nodes
      commit: 7275e795e520c7064af52ba67c74d7bac27eea4f

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>
