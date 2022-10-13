Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC075FD8DC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 14:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DF010E201;
	Thu, 13 Oct 2022 12:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34BB10E8A1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 12:11:06 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 260DC58020D;
 Thu, 13 Oct 2022 08:11:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 13 Oct 2022 08:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665663066; x=
 1665670266; bh=qcZsBTf58+HESkQB33dGWzDH6NKnBJENLMiHvWdxzLk=; b=d
 xIgbA+IpkGqBRnPFDaFcWLWqbvfApoE9jpIIv/7uvQ7BKT11dyuasLvoVEhlCSwR
 OQKfpIflEqSca0zKSAxyo+o46RRlZciDBF4kH6qtviJkC/oDRz1NBW4WJOcNoiUI
 fLiWFZWMsGua+NGI5DvzPo/jencfmP7l3nfTw/34j1r5Bq3E00lJJ0cGhfwWTU2U
 uMQcVceZhjS7dZ9RvyANAQVre4c46vRgk+I7V/T2VXTZ4+wEPgYu/njJOWPmJ35Y
 ux/nVwtggmSFmvr/exV1D4d0lNLVFyjvOR9j/hPbdm67vYmADxU8d51vcipYCihg
 /xeazrVDBer1jvyBmTPHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665663066; x=
 1665670266; bh=qcZsBTf58+HESkQB33dGWzDH6NKnBJENLMiHvWdxzLk=; b=r
 p0DnD5CzLVnqFr9XjslUsXQocWaxkUEqI4lDK+KM8RqhG1FwTHenRKpQtYFzjp6v
 vSkxEt2bTJboNDIGytVRN2bMcdk6/mzBZvn/HoPyKzTWdiHgK76Fjc88dm/z5ImW
 V86/36+LnzjHbAGqvmz89/L2dQH1Y0CZr2L84ukvs+P8FdLNiUpcyRRGdd0HBj1k
 5Zis/UlbX8zT6YisDcibytq3spBpJ0oEzdBjRUOVEkrh09nmefhSxAAXM/JuLVP/
 R9SJCExB3ORrbx0Qlp11zFflQTkVRwIb6qTKV8Hk+Phbq3MuKzxqV9rQQ5nPIcOT
 44WPEASR8no7vMEN93ceA==
X-ME-Sender: <xms:WQBIY2ATDGFJMYMv5AJ_EI09D7ahHT21A7nsWuV88os7StWV3q464g>
 <xme:WQBIYwicApClxfNCWVC85v6UMGN8LTJWYxc_VgOVWBwCDUyaW4KQWEeVbDF4T4RCn
 bY0uK0T8EOztxFDqhY>
X-ME-Received: <xmr:WQBIY5n3C2jVTDNYQUcZ0EQL7s-yaV2TfO105HPJZdfYyTi1Hog50TBhESqebs40brtHnTl339ztlU1k_MtXEXQROghx693hwV98>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WQBIY0xOe0GZU8R7aCDvrBtqsBibY3nccCWp4eOhJjAwkHop-iaAvw>
 <xmx:WQBIY7RiLPwpe2Ktf4fXYGwtAvPRueKHFan6G-eDNZepG0la-_rnLg>
 <xmx:WQBIY_ZaatYNSXScEKL6RM1Oa26rpdJzVH02s6qXz-XmImSTfA8Ojg>
 <xmx:WgBIY8ROE0jqv6zptajvDWVdJ78SEydNnDHSFMkJTdFrf0ANHiP2EA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 08:11:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>
Subject: Re: (subset) [PATCH 1/2] drm/vc4: hdmi: Enforce the minimum rate at
 runtime_resume
Date: Thu, 13 Oct 2022 14:11:00 +0200
Message-Id: <166566305526.1731673.3705584062975325232.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929-rpi-pi3-unplugged-fixes-v1-1-cd22e962296c@cerno.tech>
References: <20220929-rpi-pi3-unplugged-fixes-v1-0-cd22e962296c@cerno.tech>
 <20220929-rpi-pi3-unplugged-fixes-v1-1-cd22e962296c@cerno.tech>
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

On Thu, 29 Sep 2022 11:21:17 +0200, Maxime Ripard wrote:
> This is a revert of commit fd5894fa2413 ("drm/vc4: hdmi: Remove clock
> rate initialization"), with the code slightly moved around.
> 
> It turns out that we can't downright remove that code from the driver,
> since the Pi0-3 and Pi4 are in different cases, and it only works for
> the Pi4.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
