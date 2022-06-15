Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5EC54C3DB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 10:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0587410E9B6;
	Wed, 15 Jun 2022 08:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F66E10E9B6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 08:45:37 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5FFF966016CE;
 Wed, 15 Jun 2022 09:45:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655282735;
 bh=ig8964Pis3U0xmrv25bzOpvQC450sNHC3GS2vgea2vE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NSbZ9O2mvG+kvEwG/FE6u4dUr1wC35qYVWum6oK8RGl+oxZr81kxh2GENXiCCbPPa
 rYIozjo+Edc8uLzJV6bg1PgSSezGBeBbjxMdlH4Q4zUAHE/U2ifUKrx0rXwpBGnjDL
 UuK05auuOUhn+ZHUvRoySp/oBkYlt26K4g5W/vt3BUuZTIkwW2h1eHi2bhPSBRZHRE
 Wo8gFy3YQIKAgsfecFk5dPHM7y5ii6iVMwaU1ARBcLAcBu8kgw2h9NWlSKm5En8kSo
 FfIiq6UPzpDNiu6PKfRKrqy5npwwAk053WfXFyB7K47/r28yCFZ2tMI5I5D13dviod
 K69g7f+e/HXvw==
Message-ID: <28135a2f-bf02-fd0b-e881-0ce9d68bd764@collabora.com>
Date: Wed, 15 Jun 2022 10:45:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 6/7] drm/bridge: anx7625: Register Type-C mode switches
Content-Language: en-US
To: Prashant Malani <pmalani@chromium.org>
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-7-pmalani@chromium.org>
 <b3b9768d-e0d0-7132-5f50-dd6aa53a68ee@collabora.com>
 <CACeCKaexczFCja_ndndb_A58yZYQ98rTtgY4vHMknENTLxBPPA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CACeCKaexczFCja_ndndb_A58yZYQ98rTtgY4vHMknENTLxBPPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 14/06/22 18:57, Prashant Malani ha scritto:
> On Tue, Jun 14, 2022 at 1:18 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 09/06/22 20:09, Prashant Malani ha scritto:
>>> When the DT node has "switches" available, register a Type-C mode-switch
>>> for each listed "switch". This allows the driver to receive state
>>> information about what operating mode a Type-C port and its connected
>>> peripherals are in, as well as status information (like VDOs) related to
>>> that state.
>>>
>>> The callback function is currently a stub, but subsequent patches will
>>> implement the required functionality.
>>>
>>> Signed-off-by: Prashant Malani <pmalani@chromium.org>
>>> ---
>>>
>>> Changes since v2:
>>> - No changes.
>>>
>>>    drivers/gpu/drm/bridge/analogix/anx7625.c | 73 +++++++++++++++++++++++
>>>    drivers/gpu/drm/bridge/analogix/anx7625.h |  6 ++
>>>    2 files changed, 79 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
>>> index 07ed44c6b839..d41a21103bd3 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
>>> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
>>> @@ -15,6 +15,7 @@
>>>    #include <linux/regulator/consumer.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/types.h>
>>> +#include <linux/usb/typec_mux.h>
>>>    #include <linux/workqueue.h>
>>>
>>>    #include <linux/of_gpio.h>
>>> @@ -2581,9 +2582,59 @@ static void anx7625_runtime_disable(void *data)
>>>        pm_runtime_disable(data);
>>>    }
>>>
>>> +static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
>>> +                              struct typec_mux_state *state)
>>> +{
>>> +     return 0;
>>> +}
>>> +
>>> +static int anx7625_register_mode_switch(struct device *dev, struct device_node *node,
>>> +                                     struct anx7625_data *ctx)
>>> +{
>>> +     struct anx7625_port_data *port_data;
>>> +     struct typec_mux_desc mux_desc = {};
>>> +     char name[32];
>>> +     u32 port_num;
>>> +     int ret;
>>> +
>>> +     ret = of_property_read_u32(node, "reg", &port_num);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     if (port_num >= ctx->num_typec_switches) {
>>> +             dev_err(dev, "Invalid port number specified: %d\n", port_num);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     port_data = &ctx->typec_ports[port_num];
>>> +     port_data->ctx = ctx;
>>> +     mux_desc.fwnode = &node->fwnode;
>>> +     mux_desc.drvdata = port_data;
>>> +     snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
>>> +     mux_desc.name = name;
>>> +     mux_desc.set = anx7625_typec_mux_set;
>>> +
>>> +     port_data->typec_mux = typec_mux_register(dev, &mux_desc);
>>> +     if (IS_ERR(port_data->typec_mux)) {
>>> +             ret = PTR_ERR(port_data->typec_mux);
>>> +             dev_err(dev, "Mode switch register for port %d failed: %d", port_num, ret);
>>> +     }
>>
>> Please return 0 at the end of this function.
>>
>>          if (IS_ERR(....)) {
>>                  ......code......
>>                  return ret;
>>          }
>>
>>          return 0;
>> }
> 
> May I ask why? We're not missing any return paths. I would rather we
> keep it as is (which has the valid return value).
> 

I know that you're not missing any return paths.

That's only because the proposed one is a common pattern in the kernel
and it's only for consistency.

Regards,
Angelo

