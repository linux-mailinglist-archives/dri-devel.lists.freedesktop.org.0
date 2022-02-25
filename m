Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34E84C4BD4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1C710E854;
	Fri, 25 Feb 2022 17:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C5F10E865
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 17:15:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 20509580207;
 Fri, 25 Feb 2022 12:15:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 25 Feb 2022 12:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=ad+myDbTraiDib
 LD9Wd2binLWjCGhZXOo9yQK1aIxPM=; b=C9bY2w9vIj6SJHNekqsUNprIsj51NA
 AfQSrN75BFK4y7jQhlmIXIa72ok1NTLzUOnLaTlF8vdluiah5GdXDGueISnKLpjT
 NriIVDn04F7jdRNpiWQyNtOklIWj98bdb81MKVvcWzWcvnilElfL9MbA+MPXAqYL
 7doHd6P5GVtrKZMK2QQBzHz1hO4jShWqslS+SS5lK3brQ8CkC9DmCK/gdBLpyuu+
 8nreXk6NAzge6kHmtdOW9TospdyVxiQUmbizbSO/JHcRKrolIic+E7Z/B+wtykyB
 DlUwGlbbHdmLID5fMCqzq/4A8jGKoX9fEX7JB8RfJtUp9Y8JGjCG5v3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=ad+myDbTraiDibLD9Wd2binLWjCGhZXOo9yQK1aIx
 PM=; b=ItAkbYAQDEgz8sZWwT/LMrGx/FgQK4tUe3HFqRlI8I8gTJgGMYLDbsKkS
 mgWaseznmMZ+YXVhnvFw3utGfwSbmWTXOulUO7La2DZ+RJvyn+rc+eT7izzRLCSg
 aorlodduKo1J41mdaLRIkekV3lbWZqRkbv1gnU4aYSQqiBOtGG5u0AZEMjxdPn6h
 XpBVuWoR+Msnei8lG0D1Hk6984Ur7Hm0TjEXeAr/Gr1EHp6YDcQyd8jOXt5fV4vY
 rkHYYIIlMf14Bz0RDTnWcq/jrvcaUYEQvGFlEOq7eZZl8SSpNCuFRk434XvXyF3/
 j2uLfv9PIFOHLUd118WVy9dPKXfhw==
X-ME-Sender: <xms:nw4ZYmeHYxBiFyauELegiNYhTZzNf1Ajwu4ZfFzD0xJlY3kebkFyHg>
 <xme:nw4ZYgNN8dIxMqDLNj9Aur4yo5XtNI8X-1ZX-Ej8fq9018J7CeOqnw98kamxyDhxN
 N5DZCetv8_8flvBY2o>
X-ME-Received: <xmr:nw4ZYnjUEiyP0vjW_MH-stMLE-7DZsl39C9XOVezCh3DPmhZaIbNQo6WIG8YB7DGe7d4nsVVsUleObXDeJkXughExbh0R006WtqVYSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:nw4ZYj-za-LyemJQQBOLaXoqLN8nvCj_-jMLzEqbNRJsFWpAXWuyZg>
 <xmx:nw4ZYiuwPUdDmVUGD35yjfobn0EkcHMy6jHv1jdubgltPdbeotuwNQ>
 <xmx:nw4ZYqFAFfQlgNyqelWgS9Q-b5z74nCdlIr3G01QpphDHQgQiosKww>
 <xmx:oA4ZYjHnlYDG661p3pa6xKRPS3fReqa8h4t9Uo-8FVybtS0RScwT6Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 12:15:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v2 17/22] drm/sun4i: layer: Remove redundant zpos
 initialisation
Date: Fri, 25 Feb 2022 18:14:47 +0100
Message-Id: <164580928298.726994.16982977770024379725.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-18-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-18-maxime@cerno.tech>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 10:59:13 +0100, Maxime Ripard wrote:
> The sun4i KMS driver will call drm_plane_create_zpos_property() with an
> init value depending on the plane type.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in sun4i_backend_layer_reset().
> However, the helpers have been adjusted to set it properly at reset, so
> this is not needed anymore.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
