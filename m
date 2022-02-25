Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B2F4C4BC9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0695710E857;
	Fri, 25 Feb 2022 17:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D25610E84C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 17:14:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5CC615C01A1;
 Fri, 25 Feb 2022 12:14:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 25 Feb 2022 12:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=7HxxPK6XszLGN6
 tByxsdmtu2CIBt7tPLU9nZpY4edXc=; b=bUYf8adfrW6GU9EUfNnvTHf8Ha1hvl
 MnhmkiyVCxkLz3YjJIt8SMmfM5cPnhaFL35y9vitpdXlMlbcJQVqrUwXgnFW9JOB
 OVo4g2SKIfmX5oJKR00Nb7GC1oFf9ssycxmV/1EdBhAnRP93mduEM7o7cNZ5lb5U
 HQqIR9nOtztX1ZVTjRJEWtESsgk4YFZ3sPam2sRNB+YS5Ui7qj/pX7ahs56O2LzO
 0fu542B4oREhPmqnPmFTkjHECtzolTC+tOEK6U7MTWrt4PlnW3AOA8czJ57EUlGM
 Vc/E5UzFfPS01AzDqW6db3exSuEd0AxejUTG+eAnPXwxmo2lyVTXfyTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=7HxxPK6XszLGN6tByxsdmtu2CIBt7tPLU9nZpY4ed
 Xc=; b=UqL5Jec6GEdDe9DW8hg8knlLKFIu3x5UYOkdf+LGuYaZEYlJGcStgTmq3
 7h2xk2ypQKpK6vxpMmD7SEneJvbaD6IZ58BkaBb6apO7gWSwOaWpck/pVYRb+zWz
 1qaLqbqez0HCNQoe4hRddidXFwbJ/sHaqAGk234PlrsMwWUdbZsJyhxne5HqFwls
 X1q/0ABIVV0RNs6F4WTRZ48awkwqyh1Aiez/m21OfXE7lYuC+Q2aYjzHTiS5O9mS
 dSN0lD/pSD5HC17YIeq1YPsqDcBDpfCIS+RDHigWov1qT3eoqHIxQh/wcb8Onsxx
 MENpSJd4MYbGVjz6aYKKsTrX6vkZA==
X-ME-Sender: <xms:jw4ZYtjiHD_vaRhbBoccJOl5Hbk25-qY1kfH7hdwlayEPLIrIUb4OQ>
 <xme:jw4ZYiDCMIpqxaGR9jHnBDJh0XvB28XLjkraNCG0D_osTFRrBGoTbGJuw9upDTiaX
 iM8qLJSylK4d4dUdcc>
X-ME-Received: <xmr:jw4ZYtG_C1Lp53HD6v13znKCycsmFxpf1HNTU6CWpW_M99C_NIAnbIOhTEv3jouFXre6AW4uymoM4MTyn5rC8t6bBrVCNvI7cFjj8Tc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jw4ZYiTe5dTgWKpGXn621hdCdVUXot-d5rsXlbmaR-JolCfciYb1vA>
 <xmx:jw4ZYqyx52g70HlIixca763xCIj1OlvidIQybgO4fnVPordbcynrjg>
 <xmx:jw4ZYo7KvUf9r2HL6HkLaoplm69q_UjfbXhYJOsu7UJ23wrgAcGmog>
 <xmx:kA4ZYpk-3m6fMWdKoG4BXnySTnpSQTBYsrStt0a89K7RqCX7ktngsw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 12:14:55 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v2 04/22] drm/omap: plane: Fix zpos initial value
 mismatch
Date: Fri, 25 Feb 2022 18:14:40 +0100
Message-Id: <164580928297.726994.13830610725254267103.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-5-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-5-maxime@cerno.tech>
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 10:59:00 +0100, Maxime Ripard wrote:
> While the omap_plane_init() function calls
> drm_plane_create_zpos_property() with an initial value of 0,
> omap_plane_reset() will force it to another value depending on the plane
> type.
> 
> Fix the discrepancy by setting the initial zpos value to the same value
> in the drm_plane_create_zpos_property() call.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
