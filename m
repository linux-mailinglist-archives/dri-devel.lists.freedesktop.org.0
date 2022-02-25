Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA134C4BD5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C3F10E860;
	Fri, 25 Feb 2022 17:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E5C10E854
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 17:14:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 532A75C01E2;
 Fri, 25 Feb 2022 12:14:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 25 Feb 2022 12:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=wOwi3JTZVwiXEI
 sBF7ugW36OW3mfmNje3jQY43p+Zr8=; b=bN6HRkzNjwFkZGmyvLDwjuheyj55Wg
 I3+rjwiflHAIj6ulThRx2zaKdVQcmhaC4qbLYu8kD6361BqfOmSL1M9Y09k+xTn5
 s9lg1ELaygn0CTlZ/vj1Nrm1OWAEuBt2Fyn24zvOrRiSjkwu1Zhj6hImufvAVgrn
 f5yHasRY9vXt7ynT98bn2a+dtCQDDpT4FfJ2sGpxj3cOx0Wi07+GDfGEgKliHqX6
 vHrJz+Y8+J+a4xDEBqErAeyUQLc5Rwat4VRMX3jzBhwhoNPnDywPiZ1f0jcbwmh4
 r+hh30CrTRou9chHyPLM1/7MNrP1zy3PVex3q6LixBzAF01uYVh18toA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=wOwi3JTZVwiXEIsBF7ugW36OW3mfmNje3jQY43p+Z
 r8=; b=joES+k0LFIhmoOwje2dfgmpoOnpiMnfQvr+n295SbogAgXmREsggzJg1c
 lOmktWLCWYP12Rt2Sjxn3+00bJ5wNnOUUFMitzx1w4/D/1p8/vKBvFmE98pwtDCb
 29YEFaP3xhP2BRJJzs0eDW3K6GlcbcTTGcbn255Mdtc0zhfkWZG7MgFZhgZ4AErt
 zeZk2AjIOiFEKvzY6Xxj658EuQa+3syfLpdb3pg2VQ+k/JliP2dtgeTwGZQ089HW
 V8taiaar4Xv+Bp4K9gAzIT2e5EsluFKD1YP4UAqQp7MyDwQMYUFks3GRxXNLVva0
 14fBbD8ci8BEhS2PZ61qyVPUO/enw==
X-ME-Sender: <xms:kg4ZYtXHj5hVIag0cYgEBfwiMoQkxfJTYXK_gZFuvmtkyN6AsVo2HQ>
 <xme:kg4ZYtmPE1nQFck0LRZoJyrN-U_UGqFvN3CAejthb_xXa_y2ndWcUFZcPwhv8tLii
 kw4cT0LrFVPgjCSfes>
X-ME-Received: <xmr:kg4ZYpaN_UFR0U8yRBdi1ZQnU2wXYpgeUJKY2FS0AiaU-g7sJxkBSTlwvs1EsSJnIUP0oLcB1GxdneeJC1P0dR-VS2WsHNKTLZFVq0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kg4ZYgV5VcVu6AMvnIho_GvG7vV-97kZ4LDJDkqM2raVkoVs55B2HQ>
 <xmx:kg4ZYnnJ_vLQo9tI2VKWLA33uoe0Mq9bpr9Mg6XsoItNGGUjqhnEZQ>
 <xmx:kg4ZYtca8YlOPM7kIbPvbXHzFHd64mnfsjRx-H1dSsIOASmIDhBNjQ>
 <xmx:kg4ZYp4HI1xcwteAkakWN7SUdw4WXQUlx6ZlPmifB5n99B9DDGTWeQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 12:14:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v2 06/22] drm/object: Add
 drm_object_property_get_default_value() function
Date: Fri, 25 Feb 2022 18:14:41 +0100
Message-Id: <164580928297.726994.16474436146828616970.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-7-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-7-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 10:59:02 +0100, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Some functions to create properties (drm_plane_create_zpos_property or
> drm_plane_create_color_properties for example) will ask for a range of
> acceptable value and an initial one.
> 
> This initial value is then stored in the values array for that property.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
