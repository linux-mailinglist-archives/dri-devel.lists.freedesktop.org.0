Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2A94D237B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 22:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C7B10E2D9;
	Tue,  8 Mar 2022 21:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2678110E2D9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 21:41:08 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 00C95836A9;
 Tue,  8 Mar 2022 22:41:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646775666;
 bh=0IQ8IXNeS9lA2lyfxxFvkjzy0+XM6xMIYiHmOgh4Rq0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Zf7UZX5iD0ZiMUEpOpe8CgQIFfhKDJZcZBm5+KMBSeFoXEn5affkEUBpYS+CRBoay
 63D94L8SCB1G9LqR3jQs3fnNl2Xohqt2a4VPC978JpwFxPIPe4KCIKHc4jDR7mBG3P
 KeU+/TUi1F18TL3XUfYxy7EQQ4exFRWNANKiVuff4iBeN4op2hbdXeND3tsZpCKPhb
 lLIQstorcdRzzJmn1j5hYNuRI1qReK/X7LflU358rEJk2XMGN1jkn2ellqK8pvvSQC
 m1Ql+vxqZoKvkgv/j2FRCHO5XRYDRG87Z5NVv2AifhMwREoGkctGTqhfIacBKyLLdK
 a/5wPjP4uEQDQ==
Message-ID: <423c5f19-7b7c-dbc7-7482-34a0537bec21@denx.de>
Date: Tue, 8 Mar 2022 22:41:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-6-marex@denx.de>
 <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
 <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
 <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
 <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
 <20220308125140.e7orpvocrerr5xdv@houat>
 <dd68f569-7fe3-dc00-b2f0-536b066ec37a@denx.de>
 <20220308134921.zebs533xeazq46ts@houat>
 <1ac9057e-fb6d-02f8-78df-c6518fb6e897@denx.de>
 <20220308162158.j5czx7krscaeqtsy@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220308162158.j5czx7krscaeqtsy@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/8/22 17:21, Maxime Ripard wrote:
> On Tue, Mar 08, 2022 at 03:47:22PM +0100, Marek Vasut wrote:
>> On 3/8/22 14:49, Maxime Ripard wrote:
>>> On Tue, Mar 08, 2022 at 02:27:40PM +0100, Marek Vasut wrote:
>>>> On 3/8/22 13:51, Maxime Ripard wrote:
>>>>> On Tue, Mar 08, 2022 at 11:29:59AM +0100, Marek Vasut wrote:
>>>>>> On 3/8/22 11:07, Jagan Teki wrote:
>>>>>>> On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@denx.de> wrote:
>>>>>>>>
>>>>>>>> On 3/8/22 09:03, Jagan Teki wrote:
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> [...]
>>>>>>>>
>>>>>>>>>> @@ -314,7 +321,9 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
>>>>>>>>>>       static int chipone_parse_dt(struct chipone *icn)
>>>>>>>>>>       {
>>>>>>>>>>              struct device *dev = icn->dev;
>>>>>>>>>> +       struct device_node *endpoint;
>>>>>>>>>>              struct drm_panel *panel;
>>>>>>>>>> +       int dsi_lanes;
>>>>>>>>>>              int ret;
>>>>>>>>>>
>>>>>>>>>>              icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
>>>>>>>>>> @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct chipone *icn)
>>>>>>>>>>                      return PTR_ERR(icn->enable_gpio);
>>>>>>>>>>              }
>>>>>>>>>>
>>>>>>>>>> +       endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
>>>>>>>>>> +       dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
>>>>>>>>>> +       icn->host_node = of_graph_get_remote_port_parent(endpoint);
>>>>>>>>>> +       of_node_put(endpoint);
>>>>>>>>>> +
>>>>>>>>>> +       if (!icn->host_node)
>>>>>>>>>> +               return -ENODEV;
>>>>>>>>>
>>>>>>>>> The non-ports-based OF graph returns a -19 example on the Allwinner
>>>>>>>>> Display pipeline in R16 [1].
>>>>>>>>>
>>>>>>>>> We need to have a helper to return host_node for non-ports as I have
>>>>>>>>> done it for drm_of_find_bridge.
>>>>>>>>>
>>>>>>>>> [1] https://patchwork.amarulasolutions.com/patch/1805/
>>>>>>>>
>>>>>>>> The link points to a patch marked "DO NOT MERGE", maybe that patch is
>>>>>>>> missing the DSI host port@0 OF graph link ? Both port@0 and port@1 are
>>>>>>>> required, see:
>>>>>>>>
>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml#n53
>>>>>>>>
>>>>>>>> What is "non-ports-based OF graph" ?
>>>>>>>>
>>>>>>>> I don't see drm_of_find_bridge() in linux-next , what is that ?
>>>>>>>
>>>>>>> port@0 is optional as some of the DSI host OF-graph represent the
>>>>>>> bridge or panel as child nodes instead of ports. (i think dt-binding
>>>>>>> has to fix it to make port@0 optional)
>>>>>>
>>>>>> The current upstream DT binding document says:
>>>>>>
>>>>>>        required:
>>>>>>          - port@0
>>>>>>          - port@1
>>>>>>
>>>>>> So port@0 is mandatory.
>>>>>
>>>>> In the binding, sure, but fundamentally the DT excerpt Jagan provided is
>>>>> correct. If the bridge supports DCS, there's no reason to use the OF
>>>>> graph in the first place: the bridge node will be a child node of the
>>>>> MIPI-DSI controller (and there's no obligation to use the OF-graph for a
>>>>> MIPI-DSI controller).
>>>>>
>>>>> I believe port@0 should be made optional (or downright removed if
>>>>> MIPI-DCS in the only control bus).
>>>>
>>>> That's out of scope of this series anyway, so Jagan can implement patches
>>>> for that mode if needed.
>>>
>>> Not really? You can't count on the port@0 being there generally
>>> speaking, so you can't count on data-lanes being there either, which
>>> exactly what you're doing in this patch.
>>
>> I can because the upstream DT bindings currently say port@0 must be present,
>> see above. If that requirement should be relaxed, sure, but that's a
>> separate series.
> 
> And another upstream DT bindings say that you don't need them at all.

Which "another upstream DT bindings" do you refer to ?

> Yes, there's a conflict. Yes, it's unfortunate. But the generic DSI
> binding is far more relevant than a single bridge driver.

That seems to be the wrong way around, how can generic subsystem-wide 
binding take precedence over specific driver binding ?

> So figuring it out is very much a prerequisite to that series,
> especially since those patches effectively make the OF-graph mandatory
> in some situations, while it was purely aesthetics before.

The OF-graph is mandatory per the DT bindings of this driver. If you 
implement invalid DT which does not contain port@0, it will fail DT 
validation.

If this requirement should be relaxed, sure, it can and I don't think it 
would be hard to do, but I don't see why that should be part of this 
series, which follows the upstream DT binding document for this driver.

If I cannot trust the driver DT bindings to indicate what is and is not 
mandatory, what other document can I trust then ...
