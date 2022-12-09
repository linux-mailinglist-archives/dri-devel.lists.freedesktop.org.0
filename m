Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFDC648031
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 10:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BD210E50A;
	Fri,  9 Dec 2022 09:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F4010E50A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670578583; x=1702114583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H4oNmNKbd0KtTR7A0x/ozm1FrpgdZJCRB1IuoQDPWys=;
 b=kDC3oVy/PtqEsIp8voV7xStPUvhRohQxV2khjMr2Kn+Hzf3I7qrHPXmN
 eZr4UO6xX9o+jH+y4Z6F3oCvhlW6kl08XmqOfd6IdXIzSuuYjqtBR15jH
 Ug3yAFVEQFKez6UKHukRRHjhyu0BHOQm5jJs+7WXnCbTbsx6VHr6qechL
 9zhs/lB0wlJYNrd0lK9VEj/VnSanm27KxSJ7holHedcgiJXAadAYgBISB
 +wYKFHUuf1AjH+id+jhqvTV4Lvi7+RRHhTpaBvzSH6ARGLoZ1/mCfQh9/
 epwSTUCAznc07KtCfKZ9LbEK+wnrmXGQDeeggYoIWcnRxSw9jHwWCt/wK Q==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27860072"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 09 Dec 2022 10:36:20 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 09 Dec 2022 10:36:21 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 09 Dec 2022 10:36:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670578580; x=1702114580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H4oNmNKbd0KtTR7A0x/ozm1FrpgdZJCRB1IuoQDPWys=;
 b=RUyrvxTDjAcZzZBRJXE495sf7UqgYpt+oPBD+Z6fBBjzbnKJBonio42P
 n65aJUPpDTi3Bq57AsPcOwLvZDKv6y6hvwcAFmXV/J5QZlVzfysiFiW7G
 WoF32JldgIKstvvV6RKNMc9hjpV0QdKjTqGdK/WGU1nfzezOnTLh5+Lhb
 T7LlMSpk6AwCQxXeECN/UPLNr/NYoWWk2BlmeiI/SussluLvWcMqXkHwe
 wyD8k1orGLEpAl9PD7SssBoiEsNeY3ccTfUHl6fhh7l6jVPyW7Cx/NVxR
 +2EiQ9jdVje2QcMJyk/qfgTmpXN0k+bhRSDC+YEtrNpJ+YdkcP48Fn9Zf g==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27860071"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 09 Dec 2022 10:36:20 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6ABB7280071;
 Fri,  9 Dec 2022 10:36:20 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Date: Fri, 09 Dec 2022 10:36:16 +0100
Message-ID: <3394586.QJadu78ljV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <e1844fdc-c640-747d-e38f-400669f2a1a8@linaro.org>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <7463917.EvYhyI6sBW@steina-w>
 <e1844fdc-c640-747d-e38f-400669f2a1a8@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Krzysztof,

Am Freitag, 9. Dezember 2022, 10:07:45 CET schrieb Krzysztof Kozlowski:
> On 09/12/2022 09:54, Alexander Stein wrote:
> > Hello Krzysztof,
> > 
> > thanks for the fast feedback.
> > 
> > Am Freitag, 9. Dezember 2022, 09:39:49 CET schrieb Krzysztof Kozlowski:
> >> On 09/12/2022 09:33, Alexander Stein wrote:
> >>> It takes some time until the enable GPIO has settled when turning on.
> >>> This delay is platform specific and may be caused by e.g. voltage
> >>> shifts, capacitors etc.
> >>> 
> >>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>> ---
> >>> 
> >>>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>> 
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>> index 48a97bb3e2e0d..3f50d497cf8ac 100644
> >>> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>> 
> >>> @@ -32,6 +32,10 @@ properties:
> >>>      maxItems: 1
> >>>      description: GPIO specifier for bridge_en pin (active high).
> >>> 
> >>> +  ti,enable-delay-us:
> >>> +    default: 10000
> >>> +    description: Enable time delay for enable-gpios
> >> 
> >> Aren't you now mixing two separate delays? One for entire block on (I
> >> would assume mostly fixed delay) and one depending on regulators
> >> (regulator-ramp-delay, regulator-enable-ramp-delay). Maybe you miss the
> >> second delays in your power supply? If so, the first one might be fixed
> >> and hard-coded in the driver?
> > 
> > Apparently there are two different delays: reset time (t_reset) of 10ms as
> > specified by datasheet. This is already ensured by a following delay after
> > requesting enable_gpio as low and switching the GPIO to low in disable
> > path.
> > 
> > When enabling this GPIO it takes some time until it is valid on the chip,
> > this is what this series is about. It's highly platform specific.
> > 
> > Unfortunately this is completely unrelated to the vcc-supply regulator.
> > This one has to be enabled before the enable GPIO can be enabled. So
> > there is no regulator-ramp-delay.
> 
> Your driver does one after another - regulator followed immediately by
> gpio - so this as well can be a delay from regulator (maybe not ramp but
> enable delay).

But this will introduce a section which must not be interrupted or delayed. 
This is impossible as the enable gpio is attached to an i2c expander in my 
case.

Given the following time chart:

 vcc                  set             EN
enable               GPIO             PAD
  |                    |               |
  |                    |<-- t_raise -->|
  | <-- t_vcc_gpio --> |               |
  | <--        t_enable_delay      --> |

t_raise is the time from changing the GPIO output at the expander until 
voltage on the EN (input) pad from the bridge has reached high voltage level.
This is an electrical characteristic I can not change and have to take into 
account.
t_vcc_gpio is the time from enabling supply voltage to enabling the bridge 
(removing from reset). Minimum t_vcc_gpio is something which can be addressed 
by the regulator and is no problem so far. But there is no upper bound to it.

If I understand you correctly, you want to specify t_enable_delay in a 
regulator property. This only works if you can upper bound t_vcc_gpio which is 
not possible due to e.g. scheduling and i2c bus contention.

IMHO that's why there needs to be an configurable delay in the bridge driver.

Best regards,
Alexander



