Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDE72D273C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 10:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE5B6E834;
	Tue,  8 Dec 2020 09:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8311F6E834
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 09:15:06 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B89EuW6003469;
 Tue, 8 Dec 2020 03:14:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607418896;
 bh=yroQjFBQCunG2A/eYWLA5pl0YyKFg0Hg+n8O5a+lJ5Y=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=OHGm7Y8RJI/d3pxz0wd+5pbC0nPaqIj8boVSV0pXWor78yrQNTnvpt2ewYg2hs7kl
 dPlI7NzGOjiXi/WIuF/wxlltrMR6Rj6XDudI2UXw4PrWncRjwLHp/Hr2O83ZKdXN4c
 hpdLO+cRzWqWVkvZVoTztcSTJIrjqocAACm5EZHc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B89EuDs005882
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 03:14:56 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 03:14:56 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 03:14:56 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B89Eqxm003024;
 Tue, 8 Dec 2020 03:14:53 -0600
Subject: Re: [PATCH v4 0/2] drm: add DisplayPort connector
To: Sam Ravnborg <sam@ravnborg.org>
References: <20201130112919.241054-1-tomi.valkeinen@ti.com>
 <0110944b-f531-1a2c-2263-e5cba86730e4@ti.com>
 <20201203212422.GA81406@ravnborg.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ccdc8627-76da-cfee-f66a-10ed2cbf9740@ti.com>
Date: Tue, 8 Dec 2020 11:14:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203212422.GA81406@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/12/2020 23:24, Sam Ravnborg wrote:
> Hi Tomi,
> On Thu, Dec 03, 2020 at 01:52:21PM +0200, Tomi Valkeinen wrote:
>> Hi DRM Bridge maintainers,
>>
>> On 30/11/2020 13:29, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> This series adds the DT bindings and a driver for DisplayPort connector.
>>>
>>> Minor changes since v3:
>>> - Added Laurent's reviewed-bys
>>> - Added $ref to graph schema
>>> - Use 'ret' instead of 'r'
>>> - Add the missing period
>>>
>>>  Tomi
>>>
>>> Tomi Valkeinen (2):
>>>   dt-bindings: dp-connector: add binding for DisplayPort connector
>>>   drm/bridge: display-connector: add DP support
>>>
>>>  .../display/connector/dp-connector.yaml       | 56 +++++++++++++++++++
>>>  drivers/gpu/drm/bridge/display-connector.c    | 46 ++++++++++++++-
>>>  2 files changed, 100 insertions(+), 2 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/display/connector/dp-connector.yaml
>>>
>>
>> Is it ok for me to push this to drm-misc-next, or does one of the bridge maintainers want to handle
>> that?
> 
> IMO apply them to drm-misc-next.
> But I am not bridge maintainer so...

There has been no comments, so pushing today.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
