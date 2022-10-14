Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D940C5FF419
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 21:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA53A10E0A0;
	Fri, 14 Oct 2022 19:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C27F10E0A0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 19:31:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4AE1161C00;
 Fri, 14 Oct 2022 19:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48C8C433C1;
 Fri, 14 Oct 2022 19:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665775901;
 bh=tUBPE8pgS14Vo1Xv8t8dwBDPEUaw9xIL3GQsyiJxdeQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ESk+l1AjA5D4CHUMEGShawJE/ElnWJ+d9Urkmoq7c5IIp1ACXvyv2lZWZY1SSvFul
 a9IIAemS/2lFkww8GzfZG7u4MmNHuA4n9GInj9sph7O51vTFYOe28WM1pqJCCsd+Ew
 jVqHY+OUqyM20XDQemUl6aopAautE6lAz28L8tZjURk4FNGADYCVWpnGdRo2pMI9pc
 ySTbzEW9vYfcMGiUvCzTBhyz9eMVMoJzc8O5eBO0G1aBxj1ZbCJ7om+FcGCgprEeK/
 D+fkbDjly7N3sPj+Hk2AXjABjbTCTmZlvP3SojzGspeOL5Eg88L0HUP4QYYVUso5qt
 /impH1mfV1T6w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220815-rpi-fix-4k-60-v3-2-fc56729d11fe@cerno.tech>
References: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
 <20220815-rpi-fix-4k-60-v3-2-fc56729d11fe@cerno.tech>
Subject: Re: [PATCH v3 2/7] firmware: raspberrypi: Move the clock IDs to the
 firmware header
From: Stephen Boyd <sboyd@kernel.org>
To: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Date: Fri, 14 Oct 2022 12:31:39 -0700
User-Agent: alot/0.10
Message-Id: <20221014193141.A48C8C433C1@smtp.kernel.org>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-10-13 02:13:09)
> We'll need the clock IDs in more drivers than just the clock driver from
> now on, so let's move them in the firmware header.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
