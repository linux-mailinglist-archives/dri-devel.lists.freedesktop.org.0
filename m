Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB9252FA37
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 11:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CCB11AD21;
	Sat, 21 May 2022 09:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE9011AD20;
 Sat, 21 May 2022 09:17:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C199B5C00E0;
 Sat, 21 May 2022 05:17:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 21 May 2022 05:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1653124675; x=
 1653211075; bh=tSnVUwRgkIan0g05mJZYFNNv+SUzSaOd09kahxAg1rw=; b=h
 95GWU0jeLj958g55gzl2t8b8Id8N4+oKTBAfK5Sste9K6tC/nU5FY9iB5TtjE8Bm
 1xF3vxIGNxTvG+OujgkuJshqEVBGO6bIYtyoJjK6AIdj69Hwnk/HVJiaW4G/wBmk
 vQ5pHzCtJlM84hts9w5bZnxrB2zCEuJJ+chsfPIzVJS7gttf6KItSr1JT2GyPd4K
 Nph0cnoF7nZAdRBEk4gmELoM5p+/yDE2hbtWDgxPdI73tyDHQguwtcjikh0pvFUJ
 iBHiGYUERPSWuRbh7CIymRE+vC0G/bhdMII3UIcSU1leUDDURq/uU+eRrd3jdNyh
 BbLsqKISsG0yvPAj5KxDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653124675; x=
 1653211075; bh=tSnVUwRgkIan0g05mJZYFNNv+SUzSaOd09kahxAg1rw=; b=F
 BzyzQSXPexamp04Xoi34eEM+p28ClmXflxOxvz3uDnS6d3QUmMPI8ha+HwqlzCjG
 izV4OWOYKe2yoM5zkFPhsl1GeB20Ao9xiaIqXdScG2MqX8d+lvkqwQxuzpJwrWBG
 QKEzEcRyFUkAHgLCI35Pb1R/zN3AsUzNY+vVzIavtyyoV6m2dN4kD7TLydiUOpe2
 d8J6gBijtxuR7+f0JSicuAjb1wV0Un2360muscfugOcXJ26w1JuG1Ffx4QOtO6MO
 W7sqW5e3E6rfgmbL7J1iaRX0AHMmK6X9RLvBidKTNSA/+QEKoJeS0xOvG2jGQZg+
 V2wcQHxg4Wz20ythBnpiw==
X-ME-Sender: <xms:Qq6IYrXi6tgcwroDAryeztq43ACQIuhqzJpcoWhczgMMJZNEU9-Tmg>
 <xme:Qq6IYjlBg6ADlBd46elz5uAARkP3tUhBMioqx8fybJ3EFN9K9YcPBXjSKDUgdLcbO
 Qj8avwGehF5E1axsz0>
X-ME-Received: <xmr:Qq6IYnZTaMoJGd8BI1YIUhLV8qoOtSKl4zQW3A-ju3uoD8C73UdypDcZcvJZxLJVMcrd9KD99xuQx1kUUNLWm7ZPR_tGJzHfeW8WeYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrieeigddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteef
 teefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Qq6IYmX5EnMoY8tVNERTNOlE1aC4PNwXAAeTgMvNnFEuaZnpbIJOOg>
 <xmx:Qq6IYlmyhMafBCp4RU2B7oUKV5gboicdUv3xQI71wcpPPgdfN2vNlg>
 <xmx:Qq6IYjeCrtdgEjHaIAVLxD03RqqyPWuIjjuWEbF2sCBjq0iX1D-zaw>
 <xmx:Q66IYq-3CSZZbbSQClpxpipR4iPen0OzP1gwUntfhLdUAK-ne95P8Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 May 2022 05:17:54 -0400 (EDT)
Date: Sat, 21 May 2022 11:17:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
Message-ID: <20220521091751.opeiqbmc5c2okdq6@houat>
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrote:
> This adds a devm managed version of drm_bridge_add(). Like other
> "devm" function listed in drm_bridge.h, this function takes an
> explicit "dev" to use for the lifetime management. A few notes:
> * In general we have a "struct device" for bridges that makes a good
>   candidate for where the lifetime matches exactly what we want.
> * The "bridge->dev->dev" device appears to be the encoder
>   device. That's not the right device to use for lifetime management.
>=20
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

If we are to introduce more managed helpers, I think it'd be wiser to
introduce them as DRM-managed, and not device managed.

Otherwise, you'll end up in a weird state when a device has been removed
but the DRM device is still around.

Maxime
