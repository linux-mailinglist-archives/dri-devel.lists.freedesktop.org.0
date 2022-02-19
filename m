Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD134BC4CE
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 03:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA5010E17C;
	Sat, 19 Feb 2022 02:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384D310E17C
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 02:24:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CBD5EB81EF8;
 Sat, 19 Feb 2022 02:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6557FC340E9;
 Sat, 19 Feb 2022 02:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645237450;
 bh=yPRKtgQu4GoU2E3EJ/r7/t6YDtCFdyLtldZqUmtKk1I=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=CHMAQy2Fx1KB3hk0uLcpyvmJmCAeVSZimmmYQzlR2ryLPph3ywj5Duxj9AKHMW6LV
 q1o0i2NM6HdfmcrYuMW+y4J7KkeoFZllzlZo2WB/0zCoaeQ2cGwUAdhoyyAov7/IUg
 cUCHNKVSLJIWt+QbVCgnv2k4CMwu3CuzaN7cNJa8XN+rqmGOZ5RZziPK74KyrQQnlP
 hP7+ETsKvC4ccBmXIr6MEj7aNQQ7v44XvykHzmi3iBLkPqitzqGS0jJCXN0/dKTMX0
 N88QNMR3HCDsGsdAqqy/l22InaL752izL6ro/cJRBnjdh3hhthna6ATgdm3WjQtc4g
 0b6mMWVAhNGyg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Ygok1IPElQ8Zn4Ii@pendragon.ideasonboard.com>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <Ygok1IPElQ8Zn4Ii@pendragon.ideasonboard.com>
Subject: Re: [PATCH v4 0/10] clk: Improve clock range handling
From: Stephen Boyd <sboyd@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Date: Fri, 18 Feb 2022 18:24:08 -0800
User-Agent: alot/0.10
Message-Id: <20220219022410.6557FC340E9@smtp.kernel.org>
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
 Mike Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2022-02-14 01:45:56)
> Hi Maxime and Stephen,
>=20
> We have recently posted a driver for the BCM2711 Unicam CSI-2 receiver
> (see [1]) which is a perfect candidate for this API, as it needs a
> minimum rate for the VPU clock. Any chance we can get this series merged
> ? :-)

The rate range API already exists, but it's busted. I can see you like
the patch series, can you provide any Reviewed-by or Tested-by tags?
