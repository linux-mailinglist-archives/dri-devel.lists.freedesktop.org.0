Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9068F648251
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 13:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E7A10E078;
	Fri,  9 Dec 2022 12:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC41E10E078
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 12:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670588501; x=1702124501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K3lJW0Uus1z+S8b7/YeTxtglEzL06touIBpOZIQnlTE=;
 b=P8PxiDla1cR+IRqOXJVgYJujQnyMUj4mRLI2/QIVz69GYnqm/iTUUE2U
 RwYcEL+Sg6Z/Spa6niY7x92Ftlz9GtZ/zAuuaRHzagiIwQe3ihJYAEt5Z
 dkk3dFaDPvtC+dMFwFuKgP+hgwasUI3Wotk7PW+xJjbAVLVHRV9Neu1F+
 EntAfpj0phZFe89A6XEz9YrG4hO6K+ewnfWWdzy9gPVNv7evOX5MK+z37
 eWgEhAYPi6juiahamNOlJl/D0uLV9WdAvMZpJDFb/RS9l2NIfj6MM7Wv0
 YTi37uztTOYEfwAu6dNJtiCbVCgLQpwdbhucPTw/BgpTO4qVmpdgNht0N g==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27865036"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 09 Dec 2022 13:21:38 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 09 Dec 2022 13:21:39 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 09 Dec 2022 13:21:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670588498; x=1702124498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K3lJW0Uus1z+S8b7/YeTxtglEzL06touIBpOZIQnlTE=;
 b=ezAUQQST8YUxXQsjt8N2ZWIZWao8cn8DOqlUcWDGTvj6d/aDYRq4L7Ht
 ptc2IhNREfqDYk3wnv1Zf+z+BeNVcj81mFyoIg9hKWfaxnhHDnlp98vE5
 gWxrxjtUKf+E4oj/VkDp9vU4JOfEQ9IIlGkOKUqQrrIyt1TS9tkD2NpXI
 oywc95PuyGbhTB+cLvPXW8jDFclCpBPZuVpN4at27LVZDFr7lon1cCnZW
 8aBvYOD8PPryB8Nff3WpF9QOiGNVx3D4GMOPF+okERaG3BdYVJWCrh51j
 N9/aG0GVDygJLsn/sfbebO+kMwmf0pItDWpz86a4mLXWo1iSbtVutgNi7 w==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27865035"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 09 Dec 2022 13:21:38 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 83A20280071;
 Fri,  9 Dec 2022 13:21:38 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Date: Fri, 09 Dec 2022 13:21:36 +0100
Message-ID: <45157029.fMDQidcC6G@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <df7e4c0d-2e30-a808-584f-d302233c2931@denx.de>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <3394586.QJadu78ljV@steina-w> <df7e4c0d-2e30-a808-584f-d302233c2931@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Am Freitag, 9. Dezember 2022, 13:02:10 CET schrieb Marek Vasut:
> On 12/9/22 10:36, Alexander Stein wrote:
> > Hello Krzysztof,
> 
> Hi,
> 
> > Am Freitag, 9. Dezember 2022, 10:07:45 CET schrieb Krzysztof Kozlowski:
> >> On 09/12/2022 09:54, Alexander Stein wrote:
> >>> Hello Krzysztof,
> >>> 
> >>> thanks for the fast feedback.
> >>> 
> >>> Am Freitag, 9. Dezember 2022, 09:39:49 CET schrieb Krzysztof Kozlowski:
> >>>> On 09/12/2022 09:33, Alexander Stein wrote:
> >>>>> It takes some time until the enable GPIO has settled when turning on.
> >>>>> This delay is platform specific and may be caused by e.g. voltage
> >>>>> shifts, capacitors etc.
> >>>>> 
> >>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>>>> ---
> >>>>> 
> >>>>>   .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4
> >>>>>   ++++
> >>>>>   1 file changed, 4 insertions(+)
> >>>>> 
> >>>>> diff --git
> >>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>> index 48a97bb3e2e0d..3f50d497cf8ac 100644
> >>>>> ---
> >>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>> +++
> >>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>> 
> >>>>> @@ -32,6 +32,10 @@ properties:
> >>>>>       maxItems: 1
> >>>>>       description: GPIO specifier for bridge_en pin (active high).
> >>>>> 
> >>>>> +  ti,enable-delay-us:
> >>>>> +    default: 10000
> >>>>> +    description: Enable time delay for enable-gpios
> >>>> 
> >>>> Aren't you now mixing two separate delays? One for entire block on (I
> >>>> would assume mostly fixed delay) and one depending on regulators
> >>>> (regulator-ramp-delay, regulator-enable-ramp-delay). Maybe you miss the
> >>>> second delays in your power supply? If so, the first one might be fixed
> >>>> and hard-coded in the driver?
> >>> 
> >>> Apparently there are two different delays: reset time (t_reset) of 10ms
> >>> as
> >>> specified by datasheet. This is already ensured by a following delay
> >>> after
> >>> requesting enable_gpio as low and switching the GPIO to low in disable
> >>> path.
> >>> 
> >>> When enabling this GPIO it takes some time until it is valid on the
> >>> chip,
> >>> this is what this series is about. It's highly platform specific.
> >>> 
> >>> Unfortunately this is completely unrelated to the vcc-supply regulator.
> >>> This one has to be enabled before the enable GPIO can be enabled. So
> >>> there is no regulator-ramp-delay.
> >> 
> >> Your driver does one after another - regulator followed immediately by
> >> gpio - so this as well can be a delay from regulator (maybe not ramp but
> >> enable delay).
> 
> The chip has two separate input pins:
> 
> VCC -- power supply that's regulator
> EN -- reset line, that's GPIO
> 
> Alexander is talking about EN line here.
> 
> > But this will introduce a section which must not be interrupted or
> > delayed.
> > This is impossible as the enable gpio is attached to an i2c expander in my
> > case.
> > 
> > Given the following time chart:
> >   vcc                  set             EN
> > 
> > enable               GPIO             PAD
> > 
> >    |                    |<-- t_raise -->|
> >    | 
> >    | <-- t_vcc_gpio --> |               |
> >    | <--        t_enable_delay      --> |
> > 
> > t_raise is the time from changing the GPIO output at the expander until
> > voltage on the EN (input) pad from the bridge has reached high voltage
> > level. This is an electrical characteristic I can not change and have to
> > take into account.
> > t_vcc_gpio is the time from enabling supply voltage to enabling the bridge
> > (removing from reset). Minimum t_vcc_gpio is something which can be
> > addressed by the regulator and is no problem so far. But there is no
> > upper bound to it.
> What exactly is your EN signal rise time (should be ns or so)? Can you
> look at that with a scope , maybe even with relation to the VCC regulator ?

I checked EN rise time using a scope, it's ~110ms. I not an expert in hardware 
but on the mainboard there is some capacitor attached to this line, which 
increased the time, independent from the internal pull-up.

> The DSI84 EN pin already has a built-in pullup per DSI84 datasheet (see
> Table 5-1. Pin Functions), so that should make the signal rise fast,
> certainly not for seconds.

Here it is >100ms, so the current waiting time is far too less. This results 
in errors regarding PLL lock failure.

Best regards,
Alexander



