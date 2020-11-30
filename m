Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9482C826B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E576E44E;
	Mon, 30 Nov 2020 10:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A836E44E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 10:43:13 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AUAh31D058172;
 Mon, 30 Nov 2020 04:43:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606732983;
 bh=LARdVfnyTKuQafGDo4JhDvX+ACNwfxfqgieMVqPcEk0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=UqMHgxmlkmeSUhGaXbUJhimsaMuYUoz6W900+ilStHdWFsZHMjcNVIUnN3AAOZ9FP
 js0zpjnFi2WpIf5aIzrGX7Ni4OP5I4CkyuBue3zXKVJJtuTD8+WLrnWf5CplXJTo9i
 2RjK7chYtsQRYVGNWclFEP7GbD8U01huTJa7lr5E=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AUAh3ve099979
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 04:43:03 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 04:43:02 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 04:43:02 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AUAgxOD024315;
 Mon, 30 Nov 2020 04:43:00 -0600
Subject: Re: [PATCH RESEND v3 1/2] dt-bindings: dp-connector: add binding for
 DisplayPort connector
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201124071155.76868-1-tomi.valkeinen@ti.com>
 <20201124071155.76868-2-tomi.valkeinen@ti.com>
 <20201130101057.GP4141@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <41e8f578-ef37-9aa9-85fc-53228e2d6f6c@ti.com>
Date: Mon, 30 Nov 2020 12:42:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130101057.GP4141@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2020 12:10, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 24, 2020 at 09:11:54AM +0200, Tomi Valkeinen wrote:
>> Add binding for DisplayPort connector. A few notes:
>>
>> * Similar to hdmi-connector, it has hpd-gpios as an optional property,
>>   as the HPD could also be handled by, e.g., the DP bridge.
>>
>> * dp-pwr-supply, which provides 3.3V on DP_PWR pin, is optional, as it
>>   is not strictly required: standard DP cables do not even have the pin
>>   connected.
>>
>> * Connector type. Full size and mini connectors are identical except for
>>   the connector size and form, so I believe there is no functional need
>>   for this property. But similar to 'label' property, it might be used
>>   to present information about the connector to the userspace.
>>
>> * No eDP. There's really no "eDP connector", as it's always a custom
>>   made connection between the DP and the DP panel, although the eDP spec
>>   does offer a few suggested pin setups. So possibly there is no need for
>>   edp-connector binding, but even if there is, I don't want to guess what
>>   it could look like, and could it be part of the dp-connector binding.
>>
>> * No DP++. I'm not familiar with DP++. DP++ might need an i2c bus added
>>   to the bindings.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> ---
>>  .../display/connector/dp-connector.yaml       | 55 +++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/connector/dp-connector.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/connector/dp-connector.yaml b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
>> new file mode 100644
>> index 000000000000..b5fc3e52899e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
>> @@ -0,0 +1,55 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/connector/dp-connector.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: DisplayPort Connector
>> +
>> +maintainers:
>> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: dp-connector
>> +
>> +  label: true
>> +
>> +  type:
>> +    enum:
>> +      - full-size
>> +      - mini
> 
> I wonder if "full" would be better than "full-size" to match "mini". Up
> to you.

The DP spec (and e.g. wikipedia) uses "full-size" and "mini". Well, the spec mostly uses "mDP",
which is explained to mean "Mini DisplayPort". And full-size is used as "full-size DP".

E.g. "The plug on either end may be a full-size DP plug or an mDP plug."

We could use mDP here, but I think "mini" is more commonly used. And if we use mDP for mini, maybe
we should use DP for the full-size. But then it's maybe a bit confusing.

So I think "full-size" and "mini" match best to the spec and are still obvious for the human reader.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
