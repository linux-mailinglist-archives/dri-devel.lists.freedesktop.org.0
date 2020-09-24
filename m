Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8D4276B44
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 09:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD886EAB4;
	Thu, 24 Sep 2020 07:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E2D6EAB4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 07:56:33 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08O7uQtO060735;
 Thu, 24 Sep 2020 02:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600934186;
 bh=/yATLCN5q6Cjvshai8qlwwUrwig4jXc4w8GkdezmhCg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=p30UiPF1WFfDhMdFlN3EPSHIycLtNsHeKQc5M05Y+X/C9w2gnUVjljTYfflS/iwC6
 9ECOvzH7U5+daM3TGNcXWd5yqCnwDc67IJLA6rND/gXBKWKnHaE8+dWQFHUonaTfW0
 7NF8r8KD3imAnLaAzuwIldrS5IOCVsgjwLSaiLG4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08O7uPhn055233
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 02:56:26 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 24
 Sep 2020 02:56:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 24 Sep 2020 02:56:25 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08O7uMjO048814;
 Thu, 24 Sep 2020 02:56:23 -0500
Subject: Re: [PATCHv2] dt-bindings: dp-connector: add binding for DisplayPort
 connector
To: Rob Herring <robh@kernel.org>
References: <20200917055210.22868-1-tomi.valkeinen@ti.com>
 <20200923161712.GA836725@bogus> <04d93618-12b1-d8f5-ece5-0f87e644d52e@ti.com>
 <CAL_Jsq+q4JVs=e2kueCATXLw00FWL=nx_eqCTj5ANHkESD8uTg@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <6bb017e8-7681-46c1-9152-a3c55add394d@ti.com>
Date: Thu, 24 Sep 2020 10:56:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+q4JVs=e2kueCATXLw00FWL=nx_eqCTj5ANHkESD8uTg@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/09/2020 23:00, Rob Herring wrote:
> On Wed, Sep 23, 2020 at 11:15 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>>
>> Hi Rob,
>>
>> On 23/09/2020 19:17, Rob Herring wrote:
>>
>>>> * No eDP. There's really no "eDP connector", as it's always a custom
>>>>    made connection between the DP and the DP panel. So possibly there is
>>>>    no need for edp-connector binding, but even if there is, I don't want
>>>>    to guess what it could look like, and could it be part of the
>>>>    dp-connector binding.
>>>
>>> I don't think that's true. Do an image search for 'edp pinout'. AFAICT,
>>> there's 2 lane 30 pin and 4 lane 40 pin. One image says 'Table 5-3 in
>>> eDP v1.2'. Of course, I'm sure there's custom ones too. From a binding
>>> perspective, we probably don't care about the differences, but just need
>>> to be able to describe HPD, backlight power, enable, and pwm, and LCD
>>> power.
>>
>> That's true. The eDP spec lists 4 different standard pinouts (how
>> strictly those are followed, I have no idea). But it does not define a
>> connector or a cable. And afaik eDP is defined to be not user-detachable.
> 
> Yes, but HPD is still used (or sometimes broken). We could just put
> that all in panel nodes, but IIRC the last time this came up the issue
> was handling devices with different panels stuffed by the
> manufacturer. An eDP connector binding would be one way to handle that
> as it is somewhat standardized while panel connections aren't at all.

HPD in DisplayPort, and especially in eDP, is not strictly speaking "cable inserted or removed", but
rather signaling that the monitor/panel is ready (e.g. after powering it up), or there has been a
link issue, or there has been a major change in settings, or signaling DP interrupt, etc. And HPD
(and EDID and some other things) are optional with eDP.

I don't think those rule out an edp-connector, but just things to consider.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
