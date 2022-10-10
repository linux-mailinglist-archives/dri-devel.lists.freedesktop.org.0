Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE0A5F9E73
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 14:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9476D10E4E0;
	Mon, 10 Oct 2022 12:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08E210E4D2;
 Mon, 10 Oct 2022 12:11:15 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id E17F82B05E7C;
 Mon, 10 Oct 2022 08:11:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 10 Oct 2022 08:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665403870; x=
 1665411070; bh=yOXrb8Qp+4qgwcgNsbRM6UGC7UshR8MKqJsY8Pq42Cs=; b=A
 c/aDZxIvSd0X09MnrNkuj4r0YNzyvZPR3N4OX6u+sQSa8tVeoX8CLtHPczGvhtsy
 QUH5qtbXDixYen4h6x1iT5zq0fF3cSuRMJGrgdVePXp4fKiI+yGdb5WBnHJakBe/
 7j0/f52SChC7RJu02AOy+16FCN6k0dYN8uaRILN1IvJDe2GsIezt6fZPqUwos3no
 8ksSjjNKfKAYznD9egv6ewt6oh8jCGsvzfw0jAhbuwQMsHEp4UYflAM2u0lQ2vjA
 rH2vFyvrbL4Xv5fGtkzl/uswPlFhjtRT5ptekuXIiYjSHlGBxJAPRMb4ajIM4XxU
 lhkHvfnpQCG7pM6pFt8qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665403870; x=
 1665411070; bh=yOXrb8Qp+4qgwcgNsbRM6UGC7UshR8MKqJsY8Pq42Cs=; b=t
 th2t9MbFYpTZpoyzsEJwHnBWITDfhyfjQWR0cccoM5yXJZ8OFdweaibrx2Jj5fMF
 S+DflOmEz2OIaDWzFPFle4fKxvXYEkNdRSpHBu4ETEFgq4nGmZqsEZUQL5gAzyN+
 Wr5UpvIeMCl2IyOmDQzJhoeiNqiw+AJ7RGypehUCp3QMbk8A7//ND9LJutY33rT3
 CWQJMqBGXrwdCCy1MhvabDI8qqGXXxQdj0DcDNp+FhwCb6LAUBchMZR8nAGzzrWn
 XaAyuXwgGvuLQTk39lOPSs88/FeRZgOzL16UlAZNhaT2kA1fKIC+ysmHK89wsWCj
 0tqYAb9Z5qm1AiWf7yQjQ==
X-ME-Sender: <xms:3QtEY_f0QK04kU2SBnS6KISacizS5bAIQwjtRtyF-r-YqnH81wLXtA>
 <xme:3QtEY1NTaG4JjFUNkjO_AKki368JuXQ8x1WR6MP_e2NJlY3o8XSzkpr0Kj9Nfx5fF
 7Jj1ez3Cjh6Cdw_yJg>
X-ME-Received: <xmr:3QtEY4hkLH9OeZs3eza_07rfedbVtS7iLLrVVw3PT_kZ6OXpaIfHQpzUE3ao>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3QtEYw9qfOom3Qvdj3j3q5b8SE6Hois2eHONPQdfKpiBsTX4DZIJzQ>
 <xmx:3QtEY7tmWqJKZnnZ0TBgJG9OVbRuYAh4toPKTtFzk4QRn6IIXx8EKw>
 <xmx:3QtEY_FbFLjZ1UEzemCFCBMTbu1N8G_Fat5RxCkc79AgdR_lKjPTkg>
 <xmx:3gtEYzIC3_cfqOt15oXLxtvVibOIi0tKbTE9Z1hbzoVYBy7g8EQ7cvBtLt4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 08:11:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Samuel Holland <samuel@sholland.org>, Ben Skeggs <bskeggs@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Maxime Ripard <maxime@cerno.tech>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: (subset) [PATCH v4 06/30] drm/atomic: Add TV subconnector
 property to get/set_property
Date: Mon, 10 Oct 2022 14:10:39 +0200
Message-Id: <166540374295.183315.3294508007715819278.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-6-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
 <20220728-rpi-analog-tv-properties-v4-6-60d38873f782@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=EF=BF=BD=EF=BF=BDnnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Sep 2022 18:31:00 +0200, Maxime Ripard wrote:
> The subconnector property was created by drm_mode_create_tv_properties(),
> but wasn't exposed to the userspace through the generic
> atomic_get/set_property implementation, and wasn't stored in any generic
> state structure.
> 
> Let's solve this.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
