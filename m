Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45264D5FC5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 11:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D2E10E8DF;
	Fri, 11 Mar 2022 10:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B218F10E8DF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 10:37:01 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B3D7D8306E;
 Fri, 11 Mar 2022 11:36:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646995019;
 bh=xPvGLiS5hx6T4kqE/G8onmHNjUoemvjTYRV6dWQU8Ls=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IHWboSsj1kv6DbcNofOH2sCoSrWemEcvW1+AApRDlZdX3LyttlzZfnRRj4GZQr+aj
 q437YxDoYw2O8ddr7C2siyUC9KqPqEZxbcWwYM/zT9Y2QPsDrxvHDk9MEVdzFiZLyd
 vxt4KWplHmzq/w1bv4v6DvyF1XBKCvOS4XSSM7zA8HQOj/36Dq7sH2fMKv4JFZAENR
 2eHei5/MUXcmnwUo0WLJFRd64K+qsfrc4XLaifKriXCuA5J52rfhcb/JowD6Lh2GSB
 bjaz8sPqjUuvccffyuTKUiXkz4YP4sSfVl1eqeMN/6O2GVb/BKDCnHsAsC873t1XB1
 B24wHSO4ApyTQ==
Message-ID: <17281de1-1299-19ee-ece3-767ef7e8a32b@denx.de>
Date: Fri, 11 Mar 2022 11:36:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
 <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
 <20220308125140.e7orpvocrerr5xdv@houat>
 <dd68f569-7fe3-dc00-b2f0-536b066ec37a@denx.de>
 <20220308134921.zebs533xeazq46ts@houat>
 <1ac9057e-fb6d-02f8-78df-c6518fb6e897@denx.de>
 <20220308162158.j5czx7krscaeqtsy@houat>
 <423c5f19-7b7c-dbc7-7482-34a0537bec21@denx.de>
 <20220310105352.v7jqjchshaaajsmd@houat>
 <c60112b4-5095-11ad-0da4-c84bb30bf77f@denx.de>
 <20220310141807.5yqho4gloz4lrdjt@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220310141807.5yqho4gloz4lrdjt@houat>
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
Cc: dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/10/22 15:18, Maxime Ripard wrote:
> On Thu, Mar 10, 2022 at 01:47:13PM +0100, Marek Vasut wrote:
>> On 3/10/22 11:53, Maxime Ripard wrote:
>>> On Tue, Mar 08, 2022 at 10:41:05PM +0100, Marek Vasut wrote:
>>>> On 3/8/22 17:21, Maxime Ripard wrote:
>>>>> On Tue, Mar 08, 2022 at 03:47:22PM +0100, Marek Vasut wrote:
>>>>>> On 3/8/22 14:49, Maxime Ripard wrote:
>>>>>>> On Tue, Mar 08, 2022 at 02:27:40PM +0100, Marek Vasut wrote:
>>>>>>>> On 3/8/22 13:51, Maxime Ripard wrote:
>>>>>>>>> On Tue, Mar 08, 2022 at 11:29:59AM +0100, Marek Vasut wrote:
>>>>>>>>>> On 3/8/22 11:07, Jagan Teki wrote:
>>>>>>>>>>> On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@denx.de> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> On 3/8/22 09:03, Jagan Teki wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> [...]
>>>>>>>>>>>>
>>>>>>>>>>>>>> @@ -314,7 +321,9 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
>>>>>>>>>>>>>>         static int chipone_parse_dt(struct chipone *icn)
>>>>>>>>>>>>>>         {
>>>>>>>>>>>>>>                struct device *dev = icn->dev;
>>>>>>>>>>>>>> +       struct device_node *endpoint;
>>>>>>>>>>>>>>                struct drm_panel *panel;
>>>>>>>>>>>>>> +       int dsi_lanes;
>>>>>>>>>>>>>>                int ret;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>                icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
>>>>>>>>>>>>>> @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct chipone *icn)
>>>>>>>>>>>>>>                        return PTR_ERR(icn->enable_gpio);
>>>>>>>>>>>>>>                }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +       endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
>>>>>>>>>>>>>> +       dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
>>>>>>>>>>>>>> +       icn->host_node = of_graph_get_remote_port_parent(endpoint);
>>>>>>>>>>>>>> +       of_node_put(endpoint);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +       if (!icn->host_node)
>>>>>>>>>>>>>> +               return -ENODEV;
>>>>>>>>>>>>>
>>>>>>>>>>>>> The non-ports-based OF graph returns a -19 example on the Allwinner
>>>>>>>>>>>>> Display pipeline in R16 [1].
>>>>>>>>>>>>>
>>>>>>>>>>>>> We need to have a helper to return host_node for non-ports as I have
>>>>>>>>>>>>> done it for drm_of_find_bridge.
>>>>>>>>>>>>>
>>>>>>>>>>>>> [1] https://patchwork.amarulasolutions.com/patch/1805/
>>>>>>>>>>>>
>>>>>>>>>>>> The link points to a patch marked "DO NOT MERGE", maybe that patch is
>>>>>>>>>>>> missing the DSI host port@0 OF graph link ? Both port@0 and port@1 are
>>>>>>>>>>>> required, see:
>>>>>>>>>>>>
>>>>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml#n53
>>>>>>>>>>>>
>>>>>>>>>>>> What is "non-ports-based OF graph" ?
>>>>>>>>>>>>
>>>>>>>>>>>> I don't see drm_of_find_bridge() in linux-next , what is that ?
>>>>>>>>>>>
>>>>>>>>>>> port@0 is optional as some of the DSI host OF-graph represent the
>>>>>>>>>>> bridge or panel as child nodes instead of ports. (i think dt-binding
>>>>>>>>>>> has to fix it to make port@0 optional)
>>>>>>>>>>
>>>>>>>>>> The current upstream DT binding document says:
>>>>>>>>>>
>>>>>>>>>>          required:
>>>>>>>>>>            - port@0
>>>>>>>>>>            - port@1
>>>>>>>>>>
>>>>>>>>>> So port@0 is mandatory.
>>>>>>>>>
>>>>>>>>> In the binding, sure, but fundamentally the DT excerpt Jagan provided is
>>>>>>>>> correct. If the bridge supports DCS, there's no reason to use the OF
>>>>>>>>> graph in the first place: the bridge node will be a child node of the
>>>>>>>>> MIPI-DSI controller (and there's no obligation to use the OF-graph for a
>>>>>>>>> MIPI-DSI controller).
>>>>>>>>>
>>>>>>>>> I believe port@0 should be made optional (or downright removed if
>>>>>>>>> MIPI-DCS in the only control bus).
>>>>>>>>
>>>>>>>> That's out of scope of this series anyway, so Jagan can implement patches
>>>>>>>> for that mode if needed.
>>>>>>>
>>>>>>> Not really? You can't count on the port@0 being there generally
>>>>>>> speaking, so you can't count on data-lanes being there either, which
>>>>>>> exactly what you're doing in this patch.
>>>>>>
>>>>>> I can because the upstream DT bindings currently say port@0 must be present,
>>>>>> see above. If that requirement should be relaxed, sure, but that's a
>>>>>> separate series.
>>>>>
>>>>> And another upstream DT bindings say that you don't need them at all.
>>>>
>>>> Which "another upstream DT bindings" do you refer to ?
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
>>>
>>>>> Yes, there's a conflict. Yes, it's unfortunate. But the generic DSI
>>>>> binding is far more relevant than a single bridge driver.
>>>>
>>>> That seems to be the wrong way around, how can generic subsystem-wide
>>>> binding take precedence over specific driver binding ?
>>>
>>> This is the binding of the bus. You're part of that bus. You're a child
>>> node of that bus, but nothing ever mandates that your parent node uses
>>> the same convention. And some don't. And since your bridge can be
>>> connected to pretty much any DSI controller, you have to use the lowest
>>> common denominator, not make up some new constraints that not all
>>> controller will be able to comply with.
>>
>> It seems to me the ICN6211 DT bindings currently further constraint the
>> generic DSI bus bindings, and that seems OK to me.
>>
>> Let me reiterate this again -- if someone wants to relax the requirements
>> currently imposed by the ICN6211 DT bindings, fine, but that can be done in
>> a separate patchset AND that needs DT bindings update. Furthermore, there
>> are no users of this ICN6211 bridge in upstream DTs, so there is currently
>> no bridge which would operate without OF graph using this driver.
> 
> And let me reiterate this again: something that used to work for a user
> doesn't anymore when your series is applied. This is a textbook
> regression. I suggested a way forward, that you don't like for some
> reason, fine. But pushing through a regression is just not acceptable.

How can this be a regression if this mode of operation could not have 
ever been supported with valid upstream DT bindings in the first place ?

Should we now require that kernel drivers somehow magically support all 
kinds of random broken DT bindings in addition to ones which pass YAML 
DT validation ?

>>>>> So figuring it out is very much a prerequisite to that series,
>>>>> especially since those patches effectively make the OF-graph mandatory
>>>>> in some situations, while it was purely aesthetics before.
>>>>
>>>> The OF-graph is mandatory per the DT bindings of this driver. If you
>>>> implement invalid DT which does not contain port@0, it will fail DT
>>>> validation.
>>>>
>>>> If this requirement should be relaxed, sure, it can and I don't think it
>>>> would be hard to do, but I don't see why that should be part of this series,
>>>> which follows the upstream DT binding document for this driver.
>>>>
>>>> If I cannot trust the driver DT bindings to indicate what is and is not
>>>> mandatory, what other document can I trust then ...
>>>
>>> Oh, come on. Doing that, you also require OF-Graph support for the DSI
>>> controller you attach to, and you can't require that. This is very
>>> different from just requiring a property that doesn't have any impact on
>>> any other device, and you know that very well.
>>
>> Currently the ICN6211 DT bindings DO require that kind of bridge.
> 
> And while this wasn't enforced before, you make it a hard requirement
> with this series. This is what changed, and what caused this whole
> discussion.

The current DT bindings already make it a hard requirement, so no, 
nothing changed here.

Unless what you are trying to ask for is support for broken DT bindings 
which do not pass YAML DT validation by this driver, but that is very 
dangerous, because then the question is, how far should we support such 
broken bindings. What kind of broken is still OK and what kind of broken 
is no longer OK ?
