Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6934D1599
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 12:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023A110E260;
	Tue,  8 Mar 2022 11:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13C610E260
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:05:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 611833200D60;
 Tue,  8 Mar 2022 06:05:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 08 Mar 2022 06:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=qmqR5H8sosiOXR
 0AfYVYuyGKuqgI3h8DG2aJojKmmVc=; b=uCHf0xXLcUziZXzCLv9JYuFCMGYxDr
 j9xIY4lbXnDdVo7pRr3tMnRtLVPqer8r/D2G149ZZj9M0V9wi24AbLMtSOUZkPpV
 HsnXT56EdssLdagcXIVfwDU5VrqtPGDjGDrGd4bGCzypThAEB4EwK6900UiVUD+S
 iZ+i/mo5qkiPEqRftTka7zhhLOtnH7eA/7mJK7CeUxeTukYUX9Ar2uf3+wyM5rHd
 TmvvRmY12M1Zjy6XKII/nj8KfvptI1UcjV/QQksq9vnUh0i7vXIKFP5QpErGnnBJ
 RgZ5OskVOdQJ8C0iNG/YoJB0clrnqR1+DgY6UDG33Wkd41wb6Dix1/LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=qmqR5H8sosiOXR0AfYVYuyGKuqgI3h8DG2aJojKmm
 Vc=; b=obpBlceBbChnIIZVmS+YUKyK8peCJMkBMr2W3dkyEHb4Lh4j1nvSoHAuT
 XQgFR4Z47t6M0aTIQKTfHlaEXBz/4560foDfDkgHWICQZ6w7Ry6LQP5hworC6Nkj
 YAhKwyC3TBtriJJe7aK+EtxEAg2WHd3fvXS/fFt9Ri5uM1WJQGhEzEqX0sXGl5OK
 h2CWi0aHJis0qRoM5J4G/dxOizS+AoVtfSBJ9OzlAgvv6UDdTKZJCER53H8JlNDQ
 3XnwGiyspC1pOOZhaKoME12GP8cPIu1FwHKPUPcRJOzJf24OX3R0SzLwbQSZC3yM
 kJagLxh+SPKrVESV37Tn8QjxWYEkg==
X-ME-Sender: <xms:XzgnYq7cSvlQTpHaBAZGX03PLzJtUEnRrhf-zwvxSewCgLGcQUGfmg>
 <xme:XzgnYj5mggPpsCg4B8D-8uix6I56tM41EHAvSO0VOkhqrAQ-27Ma1FakzmxbuybGw
 vRdepQzlNQZ5fhJbBQ>
X-ME-Received: <xmr:XzgnYpeU6aLT2QpdgNRCI1ZLjD-6L5R_4ZOT9iq7R8bjqX5ILzIbip6Q1Aeq4PD4FDM21h1MMVyZv5rD2nmiNDbExYa9ZsLcQ8fkOfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XzgnYnJaC2tgl8ukFtvu9flRcKOvWjrgTpO9B8eVRhU7APrCrCo2GA>
 <xmx:XzgnYuKyc0D5EPSbwk3r3a_fmxyQfpM1jq0vB8JPCD18UlQsc6Y5_g>
 <xmx:XzgnYozSOMm--yPBa_HkPc0f0dbJc7Fzw0mD6ja-oCz9AG0jhtXXLQ>
 <xmx:XzgnYrDBlKPaQs8jxzObpieTBp8f8otOuorO5iiEujcIH3ZBU9dNUA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 06:05:03 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH v2 19/22] drm/komeda: plane: Remove redundant
 color encoding and range initialisation
Date: Tue,  8 Mar 2022 12:04:52 +0100
Message-Id: <164673748850.2320194.5599548171158538063.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-20-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-20-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 10:59:15 +0100, Maxime Ripard wrote:
> The komeda KMS driver will call drm_plane_create_color_properties() with
> a default encoding and range values of BT601 and Limited Range,
> respectively.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in komeda_plane_reset(). However, the helpers have been
> adjusted to set it properly at reset, so this is not needed anymore.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
