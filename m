Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B645A62D2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 14:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26C010E073;
	Tue, 30 Aug 2022 12:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B9E10E073;
 Tue, 30 Aug 2022 12:03:38 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7213D5802D9;
 Tue, 30 Aug 2022 08:03:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 30 Aug 2022 08:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661861016; x=
 1661868216; bh=Un4EFnpmCrjF0op+CQJbf6xj3KV7/HPMuOuXK7AEo2I=; b=D
 tvEwgKsQqnUenjfacp4PZwK0ZhaN/HT87mq75are5HFk0XfZglYSMRXUP2aNVpdO
 tabv3AyDoz4CT5k++l9c3y9JHGnsYqDVm7cgR/iWQye24reLcluU/RRGezMHMa3o
 26lJD1g9RgnfgW/OANYyo9K4c6vWlN71CduB2tRPAJqZq16cgjpZieIr87H4Jlg7
 CMhS9/azps7Am17rwoqUK1Uzi2DSu+b8JpaWS9CO4G+HZmfnAPs/5HNsjBkwTnzN
 ipQSgsrTKotKvLM9y8XxkH7d+I9Z2kpDV/7B7h5Pj3SpiRe4LvYuUnsxAp9CyoMZ
 AwL0Hm7CQETZv9e626ipQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661861016; x=
 1661868216; bh=Un4EFnpmCrjF0op+CQJbf6xj3KV7/HPMuOuXK7AEo2I=; b=3
 6dbXYWyKPwm/+6hbuyU/giI2uQ63drNFQSePRhBlilQ67WGUWjcWLI1p+LqEK73g
 fs0NRJU95nYgN8bDHN8FFYkRwp8xIREz5mPdBI26UdsvXS/065X+RwB5GxhnS7De
 rKK6aH8bgofjNfDGB4pg6ieTA8OIAtlPiMqiN5aA38ZA7g7KDM7sUn9DyxZVOCOe
 vrAeQ7vrwxvCPu8swnYxmAZY1Ax1Ud1UUMQ8fqiDPb28jmFFKhi09+a0LWmcu3Xn
 7E4+8+7+U/xAMvq+LZ7fMjdTdaqwxfwhcecTw/1UJu+ZPvkslXODYswUAoZdUdOo
 vaJgClnI41QuGh/kzRTgA==
X-ME-Sender: <xms:l_wNY6oGFCuPrXLu_lICDTdCbSEu35J3iVJVjDE6nUcPvveRoHEZiw>
 <xme:l_wNY4quMS5CXVM1erpTf7cw2djyVbwpuQRrcz2Jhxok1vKHyOF8yaKwhraLbbSse
 sSXcX3CLE88lmpFNxA>
X-ME-Received: <xmr:l_wNY_Okj9gTra9L6Fm8reAM8HlENdzUrpVeFZ0H_Ckc2Ky9DkU-Uuh76b0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekfedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
 feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:l_wNY575QlKLJhE0dUITZhr1Y2xjKtL3jvcKcW6f6p2TbHDxlpTffA>
 <xmx:l_wNY54AtJBpBRMzVSilS5LlYoWV0xW1oilUo4CAO7DJ4OoEQbFw9A>
 <xmx:l_wNY5jTwGvBb8C8tqMpNARDm_YnrE5LfgJuayPRMJOXWiSvsec9ig>
 <xmx:mPwNY16sLANYyD2X2vgc2p_03AS9Unm3tT13yoQ8vkPx2iJxXj6aNQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Aug 2022 08:03:34 -0400 (EDT)
Date: Tue, 30 Aug 2022 14:03:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 14/41] drm/modes: Move named modes parsing to a
 separate function
Message-ID: <20220830120330.6f5f22d35gu7cbr3@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-14-459522d653a7@cerno.tech>
 <CAMuHMdV9wVgHFfwHoqtBoYzJDnjDmKTfaZkAKvTVKh1Y-2x1pA@mail.gmail.com>
 <87czcidnb8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87czcidnb8.fsf@intel.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Aug 30, 2022 at 01:43:07PM +0300, Jani Nikula wrote:
> On Tue, 30 Aug 2022, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Aug 29, 2022 at 3:13 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >> +#define STR_STRICT_EQ(str, len, cmp) \
> >> +       ((strlen(cmp) =3D=3D len) && !strncmp(str, cmp, len))
> >
> > This is not part of the move, but newly added.
>=20
> The same construct is also duplicated elsewhere in the series, and I
> kept being confused by it.

I'm not sure what is confusing, but I can add a comment if needed.

> The above is precisely the same as:
>=20
> 	str_has_prefix(str, cmp) =3D=3D len

Here, it's used to make sure we don't have a named mode starting with
either e, d, or D.

If I understood str_has_prefix() right, str_has_prefix("DUMB-MODE", "D")
=3D=3D strlen("DUMB-MODE") would return true, while it's actually what we
want to avoid.

It's also used indeed in drm_get_tv_mode_from_name(), where we try to
match a list of names with one passed as argument.

With drm_get_tv_mode_from_name("NSTC", strlen("NTSC")), we would end up
calling str_has_prefix("NTSC-J", "NTSC") =3D=3D strlen("NTSC-J") which would
work. However, we end up calling prefix not a prefix, but an entire
string we want to match against, which is very confusing to me too.

Maxime
