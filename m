Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F3EBC3C63
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 10:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95D310E1D9;
	Wed,  8 Oct 2025 08:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jAfJD4JJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B568510E1D9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 08:15:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi
 [82.203.166.19])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ECADF191B;
 Wed,  8 Oct 2025 10:13:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1759911212;
 bh=tsaypD/DbPUWMTuZH0R026MpaDXXQ9sm7bRAfALfNJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jAfJD4JJX4a9In7LufZltWn8J6npzIvGlDXb8HmftJmNA76CuiIxrgz/njxp20d8K
 GNr2kd4pjRvwTA/siGW+bAV5KVcHpZKiTYDg7SfoG/iSj3uAws7iQp1vlhdlysevgg
 e2WMrb9xIBgf3L3Z6hSJW0ivjPCz6Nz17WipET/Q=
Date: Wed, 8 Oct 2025 11:14:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Alexey Charkov <alchark@gmail.com>, Algea Cao <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Cenk Uluisik <cenk.uluisik@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
 Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: rk3588-dw-hdmi-qp: Add
 tmds-enable-gpios property
Message-ID: <20251008081459.GF16422@pendragon.ideasonboard.com>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
 <20251005235542.1017-2-laurent.pinchart@ideasonboard.com>
 <c5kwmvu3j72evbgdmjn6qn5nqx7ywbiwpzhnpeh6hjjhbz5vwo@jpe3onblwhmy>
 <20251006162518.GJ5944@pendragon.ideasonboard.com>
 <d423560e-dcd4-45d8-a1e4-5a8b2a21ef86@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d423560e-dcd4-45d8-a1e4-5a8b2a21ef86@collabora.com>
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

On Mon, Oct 06, 2025 at 07:42:56PM +0300, Cristian Ciocaltea wrote:
> On 10/6/25 7:25 PM, Laurent Pinchart wrote:
> > On Mon, Oct 06, 2025 at 02:19:24PM +0300, Dmitry Baryshkov wrote:
> >> On Mon, Oct 06, 2025 at 02:55:37AM +0300, Laurent Pinchart wrote:
> >>> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>>
> >>> Add an optional property to RK3588 HDMI TX Controller binding describing
> >>> a GPIO line to be asserted when operating in HDMI 1.4/2.0 TMDS mode and
> >>> deasserted for HDMI 2.1 FRL.
> >>>
> >>> This is used to control an external level shifter for HDMI data lines.
> >>>
> >>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> ---
> >>>  .../display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml   | 10 ++++++++++
> >>>  1 file changed, 10 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> >>> index 96b4b088eebe..eec0d40c91ea 100644
> >>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> >>> @@ -113,6 +113,13 @@ properties:
> >>>      description:
> >>>        Additional HDMI QP related data is accessed through VO GRF regs.
> >>>  
> >>> +  tmds-enable-gpios:
> >>> +    description:
> >>> +      Optional GPIO line to be asserted when operating in HDMI 1.4/2.0
> >>> +      TMDS mode and deasserted for HDMI 2.1 FRL. It can be used to control
> >>> +      an external level shifter for HDMI data lines.
> >>> +    maxItems: 1
> >>
> >> Just my 2c: since TMDS is assumed to be a default mode, shouldn't this
> >> be a frl-enable-gpios instead?
> > 
> > I don't mind either way. Cristian, any opinion ?
> 
> No strong opinion either; we could go for Dmitry's suggestion.

OK, I'll flip it.

> >>> +
> >>>  required:
> >>>    - compatible
> >>>    - reg

-- 
Regards,

Laurent Pinchart
