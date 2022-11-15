Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D4B6293FD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 10:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A96810E389;
	Tue, 15 Nov 2022 09:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD3810E387;
 Tue, 15 Nov 2022 09:14:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id AF4F12B067C0;
 Tue, 15 Nov 2022 04:14:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 15 Nov 2022 04:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668503657; x=
 1668510857; bh=QVtIw/Y9KtoCntXzzfTXbTAVgaNNlVUhyJyAL6sHpPY=; b=V
 CsWb5ifjNvx6+/NWM24hujYYOQB1Fogv4DYY5Bcj8G8jgMyA0QYotPA5vItweyvs
 OExq9bNT1iPOTi1zbTqNt22qX/WkKBoO8rEMRt6ClxrgV5HothtCe5thnZOfjYlW
 MTMdGL5tKWy9PXJLraFZuHdJtCKBPK+qY1zzHMLWsowtECFXLjR8LThSXXYghpYQ
 qBSU/wcmYcP3vn8Mmr7IdB2++h1+zvuFKE1bLo4LvF6oCpf6RNpIB8u4hOtIXpY0
 oFckmS+XgxwhRfQNCIRpMYVe3jVjTDqJ/sGAME+fqoD5Br/sEvYHZOrA1KBCPIrB
 5LcnROWKvubfVkM993Wpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668503657; x=
 1668510857; bh=QVtIw/Y9KtoCntXzzfTXbTAVgaNNlVUhyJyAL6sHpPY=; b=l
 WROtZPBu8bmI8iGai6V0kIzuUaGu5xyED5z6Xwr1YFqkHffRknPG42jBuBEmCyhn
 ymus8GVFZixL/A+s6JB4HIhslV6+CmpntG87uePP13IlZFKitVg65zSDgRgnYZR8
 3i9x10I3ugzWECG1eVbtUvnPubiPXH3BBXNJZUvFXUNqMg7Max3rdSx2SQqgJc/f
 AiesCIsXY5KQce+LX0ETTOY1u3VL1XTAo/850vvhNT64ODCBQ5J6kzDbFb4+Ieb/
 vGprk90Onaby61m3irlcw/FaXrfUeZsDoyC7vdtys5jPJsc5qR1GqDOsZitvNw1h
 5Gn8XjQccz4ZDT0AiPPnQ==
X-ME-Sender: <xms:aFhzY3tMoNMAyI6FN5KNqtzLj4jwa1BbM9HZz-AzkT3WEBEged8Z4w>
 <xme:aFhzY4cuUZNXc5VotaCY-IedgrDlEgilsmGefvXz5iymBR1NBeA1gP8qCbRGWlhIC
 KLCJ_a0TkS_5F3YUYw>
X-ME-Received: <xmr:aFhzY6xxMpd3Z78I-iYLmV3ciWFlwtYtX_0cAKezbMrCl8OGHb-vcUoDu6k7QrPwHYq_C5i_ipzW1gzKjDgmFMqpyHrR6IZRzWcVghh-QJTbaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
 gfehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aFhzY2NaDurz4r4KzSDVxoh7BXNlFUg8TX2ZI-7W-ZDKTBIZqFGCPQ>
 <xmx:aFhzY38y2fbwlsGvKClqgwth1OJC-mPAarz27Svr47IfsmWMGagO5Q>
 <xmx:aFhzY2U20238DUG_7WZIToGhKdgBp-N6TyT3o3qdJS_07T4-stFJ3w>
 <xmx:aVhzY_YxachXRSv1oy6sT74UEDKSWVvYwU3VgHaGfpaqRhOoo5QXn1bywq4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 04:14:16 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, 
 Chen-Yu Tsai <wens@csie.org>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Karol Herbst <kherbst@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Lyude Paul <lyude@redhat.com>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-2-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
 <20220728-rpi-analog-tv-properties-v9-2-24b168e5bcd5@cerno.tech>
Subject: Re: (subset) [PATCH v9 02/25] drm/tests: Add Kunit Helpers
Message-Id: <166850357412.1237314.5112893845627847606.b4-ty@cerno.tech>
Date: Tue, 15 Nov 2022 10:12:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Tr��nnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Nov 2022 14:00:21 +0100, Maxime Ripard wrote:
> As the number of kunit tests in KMS grows further, we start to have
> multiple test suites that, for example, need to register a mock DRM
> driver to interact with the KMS function they are supposed to test.
> 
> Let's add a file meant to provide those kind of helpers to avoid
> duplication.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
