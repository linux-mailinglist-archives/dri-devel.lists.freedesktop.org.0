Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DD637913A
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 16:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF2F89CD8;
	Mon, 10 May 2021 14:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F9F89CD8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 14:47:17 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lg7Bb-0005Em-Ef; Mon, 10 May 2021 16:47:07 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lg7BZ-0001jS-In; Mon, 10 May 2021 16:47:05 +0200
Message-ID: <6dc43e369107d470d85dc541dc67432744bd4d01.camel@pengutronix.de>
Subject: Re: [PATCHv2 2/5] drm/imx: Add 8 pixel alignment fix
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>
Date: Mon, 10 May 2021 16:47:05 +0200
In-Reply-To: <20210428222953.235280-3-sebastian.reichel@collabora.com>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-3-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

On Thu, 2021-04-29 at 00:29 +0200, Sebastian Reichel wrote:
> Some standard resolutions like 1366x768 do not work properly with
> i.MX6 SoCs, since the horizontal resolution needs to be aligned
> to 8 pixels (so 1360x768 or 1368x768 would work).
>=20
> This patch allocates framebuffers allocated to 8 pixels. The extra
> time required to send the extra pixels are removed from the blank
> time. In order to expose the correct display size to userspace,
> the stride is increased without increasing the width.
>=20
> Without this patch systems with this display resolution hang
> indefinitely during boot up.
>=20
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thank you, I've rebased and applied this patch on top of imx-drm/next.

regards
Philipp
