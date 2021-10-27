Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3051D43D222
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0766E8DB;
	Wed, 27 Oct 2021 20:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29716E8DC;
 Wed, 27 Oct 2021 20:10:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id A99D62B01443;
 Wed, 27 Oct 2021 16:10:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 27 Oct 2021 16:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 174Tv2ikzgiRBSTtownAlIa8Hc51jyjcuiG0KQ+hbd4=; b=klhpQktTVF61lxXN
 z6RCvTo2tny/dJjRuxboJyG1CMUDkRlJEpybOBXpRKDEODVD4d9xuW1WYDpYdx+C
 KulO2TB5DowEHlq8mZyvDiTPBqGYri8i3hOikVl1Dib0hjseyPj2m3Jt7bhpv1bW
 CWBUOATejnIDgEb1BPneBdBQvHKxNzrQiB9yMhfeXmh614FK6O8NTbYvmv58qVWo
 kLHHu2KwNA0kV70AXZQz/s8Wfk/6u1v2trJzo98j9ldksC3Cd3tfTYuG99vf2iSy
 PrfZAJvoFLz8S5HIw5k2pKVN+ELyy9aVSKOtCZXKh7vKXVKhw8rcGRZgPatdVVxn
 k8u44A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=174Tv2ikzgiRBSTtownAlIa8Hc51jyjcuiG0KQ+hb
 d4=; b=axByOoFcgh/+Az9kxCAWrpeZ+pr1oBtjvspPcqjQDmggOrhT6eQp5dOyQ
 f+dBmGLg57skwzqsyfsNvnC/IkfJ40ghAzlNUXnxt9O/vOAYx91mb3sA4e5kyp1G
 9iRhLuNtAfD9cIKOT0z2snPjGjH+vMdZyvg9UAXfBAVLl2o/kB1jbxxblWbMc43I
 8piqXiFWnD/ytNrYWExKS4Q47PiaG+MAcUTJVMIcq2D2esDjbdemR6Y1q2yt58qb
 DGaTP5EEN+f4UcWsYvq3tQsPSH9q2VENRNQHyBqhk2QTV+Hj1ACJgfMETs7ssbVK
 2uap3uKjqzPMG5qGJ4XSjKfvhMCUg==
X-ME-Sender: <xms:E7J5YdAY0n9flJiRx5R0OECAz0MRM-T0-3OXKy0Besh0Rcrt8zH7Ow>
 <xme:E7J5YbiMdbYr7gJWxYbszTBZxteZRqJaBXd0iTVipXlI-OLPv_XMOk7uW-pqhnxJw
 ef3aMxyYLCY5hapZf4>
X-ME-Received: <xmr:E7J5YYmSeo1YK4dfYwkF0CatVXGEjyK5u8Ec-hv0lu_pERSVwncofednqCWir9U0focRTQ0fGoHuY_EplfHuh7oHEXYVykjrXiUGe5qO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:E7J5YXzmBoYwJDS2qv2M1HB3Uma-QDNHhBuH_lLh6v9Be4Bch1ji6g>
 <xmx:E7J5YSRPl4I1q8F6RqB0KEMDScNFcGyKk2pIpURIof-etyvcqXKfcQ>
 <xmx:E7J5YaamnTlyH3tkt3g4lPSW_1pfw3CaS4xPO9rlVqR_kLDTbNL5dg>
 <xmx:GLJ5YWwe5m9gr5x4nWinl-9JeTHzLO56Nqf2In0qEr3XLcz6bnvpKQCWZ8Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:09:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen Feng <puck.chen@hisilicon.com>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 01/21] drm/bridge: adv7533: Switch to devm
 MIPI-DSI helpers
Date: Wed, 27 Oct 2021 22:09:32 +0200
Message-Id: <163532324662.18245.12411673920991418196.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-2-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-2-maxime@cerno.tech>
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

On Mon, 25 Oct 2021 17:15:16 +0200, Maxime Ripard wrote:
> Let's switch to the new devm MIPI-DSI function to register and attach
> our secondary device. This also avoids leaking the device when we detach
> the bridge.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
