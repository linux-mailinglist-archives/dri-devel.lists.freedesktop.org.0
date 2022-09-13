Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A8F5B74A1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 17:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBD910E769;
	Tue, 13 Sep 2022 15:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1413610E769
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 15:25:59 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A34175C00EB;
 Tue, 13 Sep 2022 11:25:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 13 Sep 2022 11:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663082756; x=
 1663169156; bh=cUHyP+/2myHgsrvQchESA0jQT3NxKkQJ1XENaNBav/k=; b=r
 Ticp4b/cGst6IqvXVWH89sLPPuHfBEjV/plZ8GwSo7eDNZaUXn8xHLQoTPh+kMkA
 3hEzLeiVDYMExbIxlagEH1WCqSONVeJ9EOz7LUW2sYras57W9LAqXfy/idnzYpmn
 l8J2srnjoML64NwBOnCda0Ns2uTgDxxXO+vz4okr9Uwg/PnefKHueR5OC/cUPc+c
 zkTPUVOzvtooDCfQA+mCLMAT4FRIn/00d86MB1xfeILc4xjJt3Sg60/7xxknDgnB
 du8lQFyaK6ukGcMeT6WIErHT7ASMvi4JcnrTCejfotbEzh2/5R2pbNDpz8g7BdJy
 14S4NNb+r4FeFr/x76g6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663082756; x=
 1663169156; bh=cUHyP+/2myHgsrvQchESA0jQT3NxKkQJ1XENaNBav/k=; b=J
 JscQ2F3iN+l2JToeUvamiuQNw0prsKnf0kgEGFVJsxGEdjYc4FlfkmQ57DWk3awn
 cR1+EVtcKw7RshGUgvWCv4AjIL4wZy3rI23VSawkeLC2g5TPLsftlgbsChmaB2UJ
 ME1+mGCPnerlq3demcdiEWCnV0tmAfujMsnk3zHZlQgri7vYfwUpk7smRJLyM85r
 nSZC9Qb7wja23ggryOIT8S/wr7U7YOrrvQXQCKLePgvBFTTOkqg2Kimb13B4m3Kf
 c0vN1cgibansA/RIf2O3sO9UMY/qxdRpOIhQpttpxWuYYj1zQRm99KtF5oH8kJdT
 x65HKRR2/T/Cb5B2q5oVg==
X-ME-Sender: <xms:BKEgY66kPqYBqUl7OutiHsDstou4E8cPYSCsOXbjdu3hgcb_-XTQiQ>
 <xme:BKEgYz6O_gyO-A2SRmKrwhbqpSmN9wk6nt38Zz0ilZdhOGrrzCC0Hugl7Arep0cYe
 ekX1FMrNEHn8N4Yoz0>
X-ME-Received: <xmr:BKEgY5ecthg261kTQPJuxhwYiJ5LjacJu9eSo5oKPiye_vLzj1RZ9jWUq8mO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugedgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
 ekredtredtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvges
 tggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeefvdffhefgleeffeehuedute
 dutdehffdutddtkedtgefgvdettdevgffhteeghfenucffohhmrghinhepkhgvrhhnvghl
 rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BKEgY3LChyh1bTWsqxPDPXgsth9nI2tQlSq9FEGervpJe8y0kaIZsw>
 <xmx:BKEgY-L625Oz-Ex2FpHxph9AcRv4MDRfkAqaJqpRQ0-GD0SeUvavDg>
 <xmx:BKEgY4x6T13w3gk70R-Kkm6cys745L8Iwb9jjDAlIs5e2x7rwHew2Q>
 <xmx:BKEgY9_YsX-IgMzAvLU93vrXgyb67yVu53c0GeEx42ZtR8OV-GrVTA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Sep 2022 11:25:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: airlied@linux.ie, daniel.vetter@intel.com,
 maarten.lankhorst@linux.intel.com, maxime@cerno.tech, tzimmermann@suse.de
Subject: Re: [PATCH v4 0/8] drm/vc4: Reset HDMI link at hotplug
Date: Tue, 13 Sep 2022 16:25:52 +0100
Message-Id: <166308273937.48017.16781654964708349083.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220829134731.213478-1-maxime@cerno.tech>
References: <20220829134731.213478-1-maxime@cerno.tech>
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
Cc: phil@raspberrypi.com, dri-devel@lists.freedesktop.org, dom@raspberrypi.com,
 tim.gover@raspberrypi.com, dave.stevenson@raspberrypi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Aug 2022 15:47:23 +0200, Maxime Ripard wrote:
> This is a follow-up of the work to support the interactions between the hotplug
> and the scrambling support for vc4:
> 
> https://lore.kernel.org/dri-devel/20210507150515.257424-11-maxime@cerno.tech/
> https://lore.kernel.org/dri-devel/20211025152903.1088803-10-maxime@cerno.tech/
> https://lore.kernel.org/dri-devel/20211118103814.524670-1-maxime@cerno.tech/
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
