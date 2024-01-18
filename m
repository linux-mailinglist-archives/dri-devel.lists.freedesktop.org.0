Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61375831FC8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 20:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB9B10E8D5;
	Thu, 18 Jan 2024 19:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [46.30.211.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291D010E8D5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 19:32:17 +0000 (UTC)
X-HalOne-ID: 11caf4e8-b638-11ee-9f02-dfbeffc51846
Received: from mailrelay5.pub.mailoutpod3-cph3.one.com (unknown [104.37.34.42])
 by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPS
 id 11caf4e8-b638-11ee-9f02-dfbeffc51846;
 Thu, 18 Jan 2024 19:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=BWvtIZzeIG8OQ9lhdg7O1Ah8L08MbdZeVVuTjMHxWYY=;
 b=G8nzFqblNhH5mYOI6VDQG/LovZIk7vAPPrdqS6byoV1ORZvE6we8m/wbGOq5EsHZ/SHcjQ9DA9H/c
 jKsF0sVymxb+vKwY6eZOrYfA4WcQexqXmw2Pjn8aUzEXH7XSMnEksFwZNo2exOJI863AVpN+zEYacy
 554O5ixTJXSRsh4A0c9Jz5lfs96bhgykZsS0YPGOVevF4wegBryTiFoa8j0rg+Z0BzpuVbdeZye1tV
 2qG4Gjq5AXWSJ6A6dacB7ByKwKdhFcNreuUKu2ykJSeB3DbQ9F2+bJ9ju9stO1gYDI3IH/VR/WLJ16
 dBl1+msMY1omwZxActJHL1PsFxpKqnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=BWvtIZzeIG8OQ9lhdg7O1Ah8L08MbdZeVVuTjMHxWYY=;
 b=M2IhRQzuVcfPvogIfXlOznEYNzckT9lZDdlcuSr1btDeg4DaqaHqJGGheQ4gFS7G0lQl80XLqCEdw
 hyDFgxHAA==
X-HalOne-ID: 0fb75f5f-b638-11ee-a200-9fce02cdf4bb
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 0fb75f5f-b638-11ee-a200-9fce02cdf4bb;
 Thu, 18 Jan 2024 19:30:42 +0000 (UTC)
Date: Thu, 18 Jan 2024 20:30:40 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH v3 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Message-ID: <20240118193040.GA223383@ravnborg.org>
References: <20240118092612.117491-1-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118092612.117491-1-dharma.b@microchip.com>
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
Cc: linux4microchip@microchip.com, linux-pwm@vger.kernel.org,
 alexandre.belloni@bootlin.com, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, conor.dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dharma et al.

On Thu, Jan 18, 2024 at 02:56:09PM +0530, Dharma Balasubiramani wrote:
> Converted the text bindings to YAML and validated them individually using following commands
> 
> $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/
> $ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/
> 
> changelogs are available in respective patches.
> 
> Dharma Balasubiramani (3):
>   dt-bindings: display: convert Atmel's HLCDC to DT schema
>   dt-bindings: atmel,hlcdc: convert pwm bindings to json-schema
>   dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format

I know this is a bit late to ask - sorry in advance.

The binding describes the single IP block as a multi functional device,
but it is a single IP block that includes the display controller and a
simple pwm that can be used for contrast or backlight.

If we ignore the fact that the current drivers for hlcdc uses an mfd
abstraction, is this then the optimal way to describe the HW?


In one of my stale git tree I converted atmel lcdc to DT, and here
I used:

+  "#pwm-cells":
+    description:
+      This PWM chip use the default 3 cells bindings
+      defined in ../../pwm/pwm.yaml.
+    const: 3
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    maxItems: 2
+    items:
+      - const: lcdc_clk
+      - const: hclk

This proved to be a simple way to describe the HW.

To make the DT binding backward compatible you likely need to add a few
compatible that otherwise would have been left out - but that should do
the trick.

The current atmel hlcdc driver that is split in three is IMO an
over-engineering, and the driver could benefit merging it all in one.
And the binding should not prevent this.

	Sam
