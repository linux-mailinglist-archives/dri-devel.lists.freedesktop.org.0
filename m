Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD150FD57
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5866210E763;
	Tue, 26 Apr 2022 12:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431D510E712
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:41:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 93E935C012A;
 Tue, 26 Apr 2022 08:41:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 26 Apr 2022 08:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650976916; x=
 1651063316; bh=43oL6nzXpWN7Ko46+Lo/od8SaCpk5zQZgOiPCkZK3zk=; b=o
 Qp70Yw9lmQskXj2TEk+b6j0P3vi103dFxwNkXhVkGWeiw6IEuHvKJW/scOty5iD0
 gQ+c6FGafepb3eDk9iNO95af9XpHS3kDK7HOhVcBs4Z2szD4+3XGXwv35yxdl1mB
 M8y35Tv4DKJhS2i/dYAskg6GrgQFIV2z+/etUVwWHSKab/X1z87WH9ZMk8g6LxJB
 cbJRjUR5EQw0c3kklyHiakC4JiqHcL9qL1Pqem4HmzDYBCInJKHQM1NGNoqv+rbQ
 +aQ/A4FxB7w2QhFaaw8SaWL6AapDdkLTzjDebkkYH5th2mlg30qYN0e18F1BkyLQ
 2wyMVGiE0ltY9+ZXgqzmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650976916; x=1651063316; bh=43oL6nzXpWN7K
 o46+Lo/od8SaCpk5zQZgOiPCkZK3zk=; b=MNilcpDKkJyeQF7EFq5SjQyYqSZcw
 zjmNuTV2scjeYWQf6UkxHVhM7krtEhHNctnj51UXoQ3UgMvxAlGmGjNBA841USzB
 JumZFxrwH15XlkxzroNOzqBg2ySh8T5sm0oQsUJcCVBppdWxSF3ANszdYqULpG65
 dn+GwVPzU/ASrvrj9wP0KHwXGRl5BZ7OUtgFhxpanm0YJYGFJaf+erU2JVBrSkk2
 sKm+92AMiS+JwLhyrcBHf1bPk2zfXDKozqBIOmiX5Zzytxq1vk43QqnGgOBVE4kT
 jxGkFl74rm3EYVNcgO1EK1+hPn4vsW0i91iOXACR5L13eZ3+O/5VfGWUQ==
X-ME-Sender: <xms:lOhnYjSxSynwhnESSJoXY1RrQJKu2PbY-NMLlRnI7JN1IBV27rDUPg>
 <xme:lOhnYkxHVVIIx311t0IyQxJ9ZlR8kUduMsngNjuOCmZsmIHP6FqkCCPtIJnTZEWRt
 i_9vbs03MrbO_Eez-M>
X-ME-Received: <xmr:lOhnYo37zUUTw3NUvBtyrbTKh5kLkJGDnZNffpavA1V1DrGT9mgxEDVPa9Q_wOUNWvWUSWskOPmHqWnWBqOmAsicd9OfP1nEaFi9MYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lOhnYjA1lDlRa4poVAMCG0zukhFiBcvFcgh7PDTkAfHfWho6H9W8Fw>
 <xmx:lOhnYsiJZ5C5EOtCcmbMfYyctgebFnc_1WqzMFhr_LR6LJ79S9sxDg>
 <xmx:lOhnYnr2JXcCqpB9FarPoIgikS7tpBeQnPFK68t3HxAMjr1TB7upTA>
 <xmx:lOhnYtbtQwWeTwYVnPGa4jqoITbvi_iJpop1QmRazWgCBb5Mf0kx1A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 08:41:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 07/14] sun4i/drm: backend: use mode_set engine
 callback
Date: Tue, 26 Apr 2022 14:41:36 +0200
Message-Id: <165097689885.514433.13950094495953016224.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-8-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-8-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Apr 2022 11:26:25 -0500, Samuel Holland wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Newly introduced mode_set callback in engine structure is a much better
> place for setting backend output size and interlace mode for following
> reasons:
> 1. Aforementioned properties change only when mode changes, so it's
>    enough to be set only once per mode set. Currently it's done whenever
>    properties of primary plane are changed.
> 2. It's assumed that primary plane will always cover whole screen. While
>    this is true most of the time, it's not always. Planes are universal.
>    There is no reason to add artificial limitation to primary plane.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
