Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFB95AFF25
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 10:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDAD10E46C;
	Wed,  7 Sep 2022 08:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D9510E461;
 Wed,  7 Sep 2022 08:35:49 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 8110E2B059B2;
 Wed,  7 Sep 2022 04:35:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 07 Sep 2022 04:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1662539745; x=
 1662546945; bh=D8IwJpe38ngTqDpXuDooltjCXbTXB1hM4K9sb2AeGwI=; b=s
 hmePre9qZwgHk65Qo/1YPE0ZRfsIfYLkuPp+a29DhFrSCnvxtMjDSfI4wQ4MDnHf
 pYegekdiKhkBVaYgYAkugAm/dHD+6ILdjuYAEqrICW9ieorLGmSL2cQiZNutdlOH
 AivbdsDRUGVmcYZRy//2WMGEc3G8H0JsD7Mx9JcofYqhy1+Isb9BPLeFRL9Abhgx
 /AJTfYBGHUNWiOZBFc8VgMyFvty6M2gfw3GSHhvV53NaD/Vfh4bXlkdU88HSosDm
 1UUULEKgs9RQ0QyCkdZMPUgTZ5dH2anQuPCiBwi8/wfdvCna+nrKNcolw+P8iBUI
 J5v4GKL2W+gV7to9zqMjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662539745; x=
 1662546945; bh=D8IwJpe38ngTqDpXuDooltjCXbTXB1hM4K9sb2AeGwI=; b=1
 9fgOsnl6ENiHJFqVxQUzrERFje57iD1iOaroHrGbEKArhcZV6BhOTKasWM/a/uHY
 KQ4xaP0rZyIhndWbOHzt1S2BEaaWyghs99dnYNUkWJ6W2sjTZPBoRTC3AK6ExWL2
 hrEcYh0yLWGoXja2uXqSIkRzYwbJTnbU40+QrIxW8gmayQ4HMbbVhmLtdeE72WTb
 3m5MCAE6kPQy8Al8k9kE4OyUCPCoI+7LTkv+AfkN74gU9PmSkERkUv2Qs5zsXvgI
 t9VlVV+JW3EC93LFiw+GotIOtjTQ/CGPqfz6++K0C3odlB1wvs5Q3LXvaI/Q1ncA
 XBBMkoAQzKmzXoFJUqAVw==
X-ME-Sender: <xms:4FcYYygBRsOruA9xZ7Tg7mJll8X8p4qNIeBm5nNNOCZKCs_Xmbn4yQ>
 <xme:4FcYYzCKrhJQElRzUSNRm5pWS8fzibxC3ClBg2cM6V410pcDZbazoI6QBmvU84YxC
 ybdi0Xj9QYykkWjEAc>
X-ME-Received: <xmr:4FcYY6FOGMAeM8t29VfOxMADej9kubTAqK5L7FV9rE8EEf7LkeY3HoycXHo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4FcYY7SMTQD8VcYGbenm7TLDZduyOevqKP2XuRVaRqrW9aHlfxuf-Q>
 <xmx:4FcYY_xkotdxKyaRm1FFfVlvybHa4X5CtQTanffxf-v73KPX7-4vgA>
 <xmx:4FcYY54DFtgJoMuTZhLnkZPz9gH8cL0k5GjZ4pasgOUWbwq2xaYC3A>
 <xmx:4VcYY9rjtATBRWJ_MTcJ7_FUZoKCPFMiiiKNXh5mkH8xj6fswXLTSwALACM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 04:35:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>, Samuel Holland <samuel@sholland.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH v2 28/41] drm/vc4: vec: Fix timings for VEC modes
Date: Wed,  7 Sep 2022 10:35:03 +0200
Message-Id: <166253967461.2236193.6013044039038178739.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-28-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-28-459522d653a7@cerno.tech>
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
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Aug 2022 15:11:42 +0200, Maxime Ripard wrote:
> From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> 
> This commit fixes vertical timings of the VEC (composite output) modes
> to accurately represent the 525-line ("NTSC") and 625-line ("PAL") ITU-R
> standards.
> 
> Previous timings were actually defined as 502 and 601 lines, resulting
> in non-standard 62.69 Hz and 52 Hz signals being generated,
> respectively.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
