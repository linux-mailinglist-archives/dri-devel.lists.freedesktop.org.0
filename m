Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FC3A3BFD9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C346A10E316;
	Wed, 19 Feb 2025 13:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3838510E316
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:27:12 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1tkk6L-0003h1-Mj; Wed, 19 Feb 2025 14:26:57 +0100
Message-ID: <37d2a7bb-1c8c-4c33-a277-dc1a7448433b@pengutronix.de>
Date: Wed, 19 Feb 2025 14:26:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] dt-bindings: display/lvds-codec: add
 ti,sn65lvds822
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 Frank Li <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
 <20250106-skov-dt-updates-v2-5-4504d3f00ecb@pengutronix.de>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250106-skov-dt-updates-v2-5-4504d3f00ecb@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear DRM bridge maintainers,

On 06.01.25 17:06, Ahmad Fatoum wrote:
> Add compatible strings for TI SN65LVDS822, a FlatLink LVDS receiver.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Shawn has asked that the DT or display maintainers take this one patch
through their tree. He has already applied the remainder of the series.

Can you take a look? DT maintainers already acked it.

Thanks,
Ahmad

> ---
> v1 -> v2:
>   - Add Rob's Acked-by
> 
> To: Andrzej Hajda <andrzej.hajda@intel.com> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
> To: Neil Armstrong <neil.armstrong@linaro.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
> To: Robert Foss <rfoss@kernel.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS,in file)
> Cc: Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
> Cc: David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
> Cc: Simona Vetter <simona@ffwll.ch> (maintainer:DRM DRIVERS)
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
> Cc: Maxime Ripard <mripard@kernel.org> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
> Cc: Thomas Zimmermann <tzimmermann@suse.de> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
> Cc: dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 6ceeed76e88ece6d86ecd6588ead7a65362dfe62..0487bbffd7f7c4bcce3f71df19548d601715fb98 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -41,6 +41,7 @@ properties:
>            - enum:
>                - ti,ds90cf364a # For the DS90CF364A FPD-Link LVDS Receiver
>                - ti,ds90cf384a # For the DS90CF384A FPD-Link LVDS Receiver
> +              - ti,sn65lvds822  # For the SN65LVDS822 FlatLink LVDS Receiver
>                - ti,sn65lvds94 # For the SN65DS94 LVDS serdes
>            - const: lvds-decoder # Generic LVDS decoders compatible fallback
>        - enum:
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
