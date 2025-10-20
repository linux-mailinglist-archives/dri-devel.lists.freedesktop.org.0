Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD681BF2316
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CFA10E47A;
	Mon, 20 Oct 2025 15:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EUmFc3rr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AD210E474
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:46:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi
 [87.94.110.32])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A5C8782E;
 Mon, 20 Oct 2025 17:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1760975093;
 bh=sNxXee+W1+T0QQqYoZjUQPLYVU/MxS9aOZB5QdQS9ek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EUmFc3rrfBxKRn2+DXvEc1xUEtm8JTz1bNCs9ssWuUL1dWVnQywDAlGX2ql3aBA1U
 SNSkDg/T6rRFd/A8NI4HjvZ6yjfafbIPjhU3J41NHmMcHDuVnBtaNXDvuVB74UxgQH
 sNLxo2Fk+KZB6IHjDVZbRrKQX6I+Oo/yyGq7T8rA=
Date: Mon, 20 Oct 2025 18:46:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Alexey Charkov <alchark@gmail.com>, Algea Cao <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Cenk Uluisik <cenk.uluisik@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
 Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: rockchip: Add device tree for the
 Orange Pi CM5 Base board
Message-ID: <20251020154625.GB6159@pendragon.ideasonboard.com>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
 <2328202.iZASKD2KPV@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2328202.iZASKD2KPV@phil>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 20, 2025 at 04:44:21PM +0200, Heiko Stuebner wrote:
> Am Montag, 6. Oktober 2025, 01:55:36 Mitteleuropäische Sommerzeit schrieb Laurent Pinchart:
> > Hello,
> > 
> > This patch series adds a device tree for the Orange Pi CM5 Base board
> > from Xunlong. This is a combination of a compute module and a carrier
> > board, so the device tree is split in two files.
> > 
> > The work is based on a combination of upstream device trees for other
> > RK3588-based Orange Pi boards and the downstream device tree, all
> > checked against the available schematics for the carrier board. The
> > compute module schematics is unfortunately not available.
> > 
> > The series starts with three patches that add a new tmds-enable-gpios
> > property to the rk3588-dw-hdmi-qp DT binding (1/5) and update the driver
> > accordingly (2/5 and 3/5). Those patches have been authored by Cristian
> > Ciocaltea as part of a larger series, I have incorporated them here
> > as-is.
> > 
> > Patch 4/5 then add a new compatible for the board to arm/rockchip.yaml.
> > The last patch (5/5) adds the device tree for the board.
> > 
> > Patches 2/5 and 3/5 could be merged separately through the DRM tree,
> > but patch 1/5 needs to be merged with the device tree in 5/5 to avoid
> > introducing DT validation warnings. I'd appreciate advice from the DT
> > maintainers regarding how to handle this, as I have been told before
> > that DT bindings and DT sources can't be merged through the same tree.
> 
> I think we generally only care about binding warnings happening
> in linux-next.
> 
> I.e. in most cases, the binding is merged with the driver and
> the dts then into a separate tree - sort of ignoring the local
> binding error, because everything will be fine once stuff comes
> together in linux-next.

Assuming they get merged together in linux-next. If there's a delay,
linux-next will exhibit warnings for some time. I don't know what the
rule is regarding that.

> Speaking of bindings, does your board _need_ the frl-gpio to produce
> any hdmi output? Like could we merge the board without the (optional)
> gpio and then add it later, once the binding+driver have made it in?

With a suitable pull-up I think so. I can submit a v3 with that.

> Just me trying to grab the big chunks earlier in the cycle.

-- 
Regards,

Laurent Pinchart
