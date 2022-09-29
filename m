Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095785EEA81
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 02:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E322B10E28C;
	Thu, 29 Sep 2022 00:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE4810E28C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 00:23:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F68861129;
 Thu, 29 Sep 2022 00:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD5CC433D6;
 Thu, 29 Sep 2022 00:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664411022;
 bh=L85UmdSjhG3JVcpSLPn/ZMDE+UMdrUzT3VbSiE8dFGM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=N2lp/0VQNRfEu/GVTFx3/zAL8wSjTiQpplphMETeylaZ+mpLiiGNbTJs2D0Ca3m52
 7RgQsfuhyWeSfGRS5+4/+AdiZsVln36xVE6yIZiBh0wk9XooVjhfLcGT9+Eu8kbtSC
 MtYd7grSVZVDhyF3yWd0qHYhE6tNYokveCsyPWS7KLT4Bw9VqS0Yc7tb23mPU42q+j
 Xzbq7wsqRILrLzj/j4mJTsfQRY7mLeQvHJ6FFXd7KloQ/T/4/20Yw0Sf7krNe4zDeh
 gnH2hqb11Uh4/b84j2o/mjsqZp+wHmhFP89lnFx1eGOyp2LXpqUol7QY5QFlKg3rJ5
 acdn63wGuaTrg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220815-rpi-fix-4k-60-v2-3-983276b83f62@cerno.tech>
References: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
 <20220815-rpi-fix-4k-60-v2-3-983276b83f62@cerno.tech>
Subject: Re: [PATCH v2 3/7] firmware: raspberrypi: Provide a helper to query a
 clock max rate
From: Stephen Boyd <sboyd@kernel.org>
To: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Date: Wed, 28 Sep 2022 17:23:39 -0700
User-Agent: alot/0.10
Message-Id: <20220929002342.9DD5CC433D6@smtp.kernel.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-09-20 05:50:22)
> The firmware allows to query for its clocks the operating range of a
> given clock. We'll need this for some drivers (KMS, in particular) to
> infer the state of some configuration options, so let's create a
> function to do so.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
Acked-by: Stephen Boyd <sboyd@kernel.org>
