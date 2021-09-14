Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B9140B763
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 21:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366FD6E595;
	Tue, 14 Sep 2021 19:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97526E595
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 19:00:32 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210914190031euoutp0248297d2975a89e2680434218a7e77d11~kxWujXfOe1945519455euoutp025
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 19:00:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210914190031euoutp0248297d2975a89e2680434218a7e77d11~kxWujXfOe1945519455euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1631646031;
 bh=xm1zaqXeyvV2esoGirppTvrBf0GA4uTS8Yww/fX/oqc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=M7QKMNs/1PdJgacqnxuCPAjPZkqsMt6XVUrOQw00rGQakWaUY3cQ6Gx3ewjGE21FY
 0FsF0CPLhD5ffAn3GSvNbDCvm2/tS20dZsnAJpiJr+Dr2ivnTt98EVZ1OsPimCjXaa
 s4iM+KuiGWh4SjD/GXJnKzuEsAX+dn5MWb+STUXc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210914190030eucas1p175b756fbaec2a0c514695fcec70152f1~kxWuLC4EH2248322483eucas1p1c;
 Tue, 14 Sep 2021 19:00:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id BD.1E.45756.E41F0416; Tue, 14
 Sep 2021 20:00:30 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210914190030eucas1p25f2fca6b8abc3f09e9c3eec15ef95675~kxWtnXQVj3156731567eucas1p2f;
 Tue, 14 Sep 2021 19:00:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210914190030eusmtrp2a4b24888128433c0437039bb0067ea99~kxWtmOi7o2400724007eusmtrp22;
 Tue, 14 Sep 2021 19:00:30 +0000 (GMT)
X-AuditID: cbfec7f2-7d5ff7000002b2bc-55-6140f14e43a7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 68.FE.20981.D41F0416; Tue, 14
 Sep 2021 20:00:29 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210914190028eusmtip236a1fe4ead5a72d804ca1ce148a75845~kxWsHqeHR2441624416eusmtip2j;
 Tue, 14 Sep 2021 19:00:28 +0000 (GMT)
Message-ID: <e5ec9763-37fe-6cd8-6eca-52792afbdb94@samsung.com>
Date: Tue, 14 Sep 2021 21:00:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0)
 Gecko/20100101 Thunderbird/93.0
Subject: Re: [PATCH v4 02/24] drm/bridge: Document the probe issue with
 MIPI-DSI bridges
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jonas Karlman
 <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Neil Armstrong <narmstrong@baylibre.com>, Robert Foss
 <robert.foss@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Sean
 Paul <sean@poorly.run>, freedreno@lists.freedesktop.org, Kyungmin Park
 <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, Xinliang Liu
 <xinliang.liu@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao
 <tiantao6@hisilicon.com>, Inki Dae <inki.dae@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Clark
 <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, John Stultz
 <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, Joonyoung Shim <jy0922.shim@samsung.com>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210914143541.433ucx2kvz36tw42@gilmour>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0wTZxj2u7veHTVlR6n2i4PhMJrpBDQj5osKgUWXW7IZN2MCnRMPuCFZ
 +bFWnJNECTjtMLgCpkKrIFOEgGMCLY5GIIFhbaCADkz5ZZkQfpPyeyCDDXqY8d/zPu/7PM/7
 fvloXFpNbqNj48/xqnhO6UuKiaqni61+x6ZCuH35y9tRRosVQ0XNZThqn3OS6PaQDaAsh5ZA
 Q/llADUv+SHreAeBhl89J9DCcq0I2VLHKfRT5n0KZdbZKPSn+TaJclprMVQwZSJQzsIKQPU3
 vkIOnX7Vo2ABR9P6v3BUvGgCqDf7D4ByskdItGjOI1DpWC2FjOOZItRYVyIK8WKd9h8ptqel
 lWSr9b0U23+nnGINmlwRe+/JCMY+077A2J6XT0j28XyfiM2zfsE6rlsw1mLuotj7ug6SvWEs
 AWxlUzI7U/HecUYhPhzNK2PP86qA4DPisy9Su6nEXwMuPGxGKaBmZzpwoyETCDsrJ7B0IKal
 TDGAhddLSaGYBTBvbEokFDMAatPSibeS1HYzITSKAJyx9+JC4QTQONcG1qYkTDDUlTuxNUww
 O6E9/SYh8B7QmjvgwluYM3DsVcVqHk17Mgr4xuaS4owM2l9fcWHZqrQ9o8bljzNFNMzOm3Z5
 ksxuuFzZSa5hN+YA7DKWkoLYB6aZDC4BZBrFUFNZtr72Edg/mSISsCcctRgpAXvBf6vzMQFf
 ho7iK+tiDYCmR9W40DgEe1reuDbFV5N/MwcIdChsyG0i1mjIuEP7hIewgzvMqrqFC7QEaq5K
 hen3ocNmWjeUw8K2OVILfPUbXkW/4Xz9hmv0/+feBUQJkPNJ6rgYXr0/nv/eX83FqZPiY/yj
 EuIqwOrvblqxTP8O7oxO+dcDjAb1ANK4r0xSNR7ESSXR3A8XeVVChCpJyavrwbs04SuXlBge
 RkiZGO4c/y3PJ/Kqt12MdtuWgsUOns4YzAgNDDu1wkqtz1+bUayf48ulZi5186HEx5EB2x0d
 WZ4L8WPMPUstmH9WHa1yXB36rl/uF9btoxyejAybmF/pKwgqPPpR8lwnTobenU39PKe87YPD
 u3n5P3U+8r2z0pentv49otPuuCSW7Y32jtApL3/oeS306UTHiSbLJu/uopqu/uPGroPTSQcU
 n34SGh7uD7Uej7zHlxsunR9U7pjzTDPEKA2N33zc+5ly4KjXBNfg3DRJDybLQn7p2+qj6D0S
 HHVMMgyvRUX53XxHodm1L6179GB2xUyfLfBB+Anr6fagJXBBk0DrNhu3XGz2znwQ8bP71wmR
 3s49mQMnx3wJ9Vlu/x5cpeb+A6vxcsBMBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGd+69vbdgGq+lhBM0bGtkmy4U+kE9GECmZrkZIUP/FDda4QrG
 fmBbmCAZroBxnRg6lED5ECIMRTGjtKCIJelgXcOHkWEF5WMyEwaDECY4OhTX0i3hv1+e932e
 5+Tk5eL8AU4495TGwOo0SpWQDCYGNlxTUSnLScqYyflYVDbsxlDL4B0cja4ukah2dgig76fL
 CTR77Q5Ag+tRyL3wmEB/TD0i0NobBwcNGRco9K25iULm3iEK/dpdS6Kqhw4MNS7bCVS1tgGQ
 83Iamq60+DIa13D0l+U5jm547QBNVvQBVFUxRyJvdz2Bbv3poJBtwcxB/b2tnKRdzNJYKcVM
 DD8kmXuWSYr5va6dYmouVnOY6z1zGPNL+QjGTHh6SKbr1W8cpt59hJn+zoUxru6nFNNU+Zhk
 LttaAdMxcI55aY1IpY+J4nXaXAP7XrZWb0gQpomRRCSOQyKJLE4klu77Yr8kVhidGJ/Jqk7l
 sbroRIUoe8T4jMppiz57exCdBw8iTSCIC2kZNI52E37m080A3pgLD+hh8P61RTzAIfC1x0Sa
 QLBvZxHAqepLlH/AoxNhZfsS5meCjoRjpitEQN8B3dUvNjmUVsCK8XqOCXC5IfQx+M8Q8Ms4
 LYBjMyWbLPBZR8se4P58nG7jwl5PLwiU1WKwzmzeLCDpPfBNxzjp5yBaDp/abpGBJDk02U3/
 pb4Li+01eDngW7a8w7Kl0LLFYtliaQBEKxCwuXp1llovEemVan2uJkuUoVVbge+qOn/22u6C
 m/PLIifAuMAJIBcXCnidCwlKPi9TmV/A6rTpulwVq3eCWN9nmPHw0Ayt7yw1hnSxPCZWLJPH
 xcTGyaXCMJ6s73Y6n85SGtjTLJvD6v73Ydyg8PNYobFo3VrwFjaXKjXt1/NKZ+XB+ac/0Ryu
 PZjdnbxRbvpcmpP9d8qzvhMtRUEXVhZ3j7R8tmSd3TZ+dKD/wtVdJ1/vLLR5X0zHY/cdj2yu
 M5fwvYXr1uGCt8BbkuRSHHpy9wR2pOtefWOm7PnRjh8i2xMORITWnXRHlLz8MZXzTrB4Irkq
 5JuP912dLzZ6pY6PPsX7B53Vbmlbc1lL8UzU6iHXwdSUud05rtxh47kGj92iqqkrylPyftqf
 cXznmeUDHxaOyVpXbJKzatv7G01pCV+tenM6V7Z9ULL9yUWIKHJHn6Pi8Kse9UyDQqXK31P+
 pS7fE6aI+7qyizReSRZs7ywSEvpspXgvrtMr/wW07rSo3gMAAA==
X-CMS-MailID: 20210914190030eucas1p25f2fca6b8abc3f09e9c3eec15ef95675
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210910101246eucas1p17191a80c37b0e1784d6d9b8bf6fbcd60
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210910101246eucas1p17191a80c37b0e1784d6d9b8bf6fbcd60
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CGME20210910101246eucas1p17191a80c37b0e1784d6d9b8bf6fbcd60@eucas1p1.samsung.com>
 <20210910101218.1632297-3-maxime@cerno.tech>
 <7ad18d53-3ad6-a614-a8e1-cce6505f90a8@samsung.com>
 <20210914143541.433ucx2kvz36tw42@gilmour>
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


W dniu 14.09.2021 o 16:35, Maxime Ripard pisze:
> Hi,
>
> On Mon, Sep 13, 2021 at 08:29:37AM +0200, Andrzej Hajda wrote:
>> W dniu 10.09.2021 o 12:11, Maxime Ripard pisze:
>>> Interactions between bridges, panels, MIPI-DSI host and the component
>>> framework are not trivial and can lead to probing issues when
>>> implementing a display driver. Let's document the various cases we need
>>> too consider, and the solution to support all the cases.
>>>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>> ---
>>>    Documentation/gpu/drm-kms-helpers.rst |  6 +++
>>>    drivers/gpu/drm/drm_bridge.c          | 57 +++++++++++++++++++++++++++
>>>    2 files changed, 63 insertions(+)
>>>
>>> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
>>> index 10f8df7aecc0..ec2f65b31930 100644
>>> --- a/Documentation/gpu/drm-kms-helpers.rst
>>> +++ b/Documentation/gpu/drm-kms-helpers.rst
>>> @@ -157,6 +157,12 @@ Display Driver Integration
>>>    .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
>>>       :doc: display driver integration
>>>    
>>> +Special Care with MIPI-DSI bridges
>>> +----------------------------------
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
>>> +   :doc: special care dsi
>>> +
>>>    Bridge Operations
>>>    -----------------
>>>    
>>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>>> index baff74ea4a33..7cc2d2f94ae3 100644
>>> --- a/drivers/gpu/drm/drm_bridge.c
>>> +++ b/drivers/gpu/drm/drm_bridge.c
>>> @@ -96,6 +96,63 @@
>>>     * documentation of bridge operations for more details).
>>>     */
>>>    
>>> +/**
>>> + * DOC: special care dsi
>>> + *
>>> + * The interaction between the bridges and other frameworks involved in
>>> + * the probing of the upstream driver and the bridge driver can be
>>> + * challenging. Indeed, there's multiple cases that needs to be
>>> + * considered:
>>> + *
>>> + * - The upstream driver doesn't use the component framework and isn't a
>>> + *   MIPI-DSI host. In this case, the bridge driver will probe at some
>>> + *   point and the upstream driver should try to probe again by returning
>>> + *   EPROBE_DEFER as long as the bridge driver hasn't probed.
>>> + *
>>> + * - The upstream driver doesn't use the component framework, but is a
>>> + *   MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
>>> + *   controlled. In this case, the bridge device is a child of the
>>> + *   display device and when it will probe it's assured that the display
>>> + *   device (and MIPI-DSI host) is present. The upstream driver will be
>>> + *   assured that the bridge driver is connected between the
>>> + *   &mipi_dsi_host_ops.attach and &mipi_dsi_host_ops.detach operations.
>>> + *   Therefore, it must run mipi_dsi_host_register() in its probe
>>> + *   function, and then run drm_bridge_attach() in its
>>> + *   &mipi_dsi_host_ops.attach hook.
>>> + *
>>> + * - The upstream driver uses the component framework and is a MIPI-DSI
>>> + *   host. The bridge device uses the MIPI-DCS commands to be
>>> + *   controlled. This is the same situation than above, and can run
>>> + *   mipi_dsi_host_register() in either its probe or bind hooks.
>>> + *
>>> + * - The upstream driver uses the component framework and is a MIPI-DSI
>>> + *   host. The bridge device uses a separate bus (such as I2C) to be
>>> + *   controlled. In this case, there's no correlation between the probe
>>> + *   of the bridge and upstream drivers, so care must be taken to avoid
>>> + *   an endless EPROBE_DEFER loop, with each driver waiting for the
>>> + *   other to probe.
>>> + *
>>> + * The ideal pattern to cover the last item (and all the others in the
>>> + * MIPI-DSI host driver case) is to split the operations like this:
>>> + *
>>> + * - The MIPI-DSI host driver must run mipi_dsi_host_register() in its
>>> + *   probe hook. It will make sure that the MIPI-DSI host sticks around,
>>> + *   and that the driver's bind can be called.
>>> + *
>>> + * - In its probe hook, the bridge driver must try to find its MIPI-DSI
>>> + *   host, register as a MIPI-DSI device and attach the MIPI-DSI device
>>> + *   to its host. The bridge driver is now functional.
>>> + *
>>> + * - In its &struct mipi_dsi_host_ops.attach hook, the MIPI-DSI host can
>>> + *   now add its component. Its bind hook will now be called and since
>>> + *   the bridge driver is attached and registered, we can now look for
>>> + *   and attach it.
>>> + *
>>> + * At this point, we're now certain that both the upstream driver and
>>> + * the bridge driver are functional and we can't have a deadlock-like
>>> + * situation when probing.
>>> + */
>>> +
>>>    static DEFINE_MUTEX(bridge_lock);
>>>    static LIST_HEAD(bridge_list);
>>
>> Nice work with documenting this initialization dance. It clearly shows
>> that bridge API lacks better mechanism - usage of mipi dsi callbacks to
>> get notifications about bridge appearance is ugly.
> Yeah, there's so many moving parts it's definitely not great.
>
>> It remains me my resource tracking patches which I have posted long
>> time ago [1] - they would solve the issue in much more elegant way,
>> described here [2]. Apparently I was not stubborn enough in promoting
>> this solution.
> Wow, that sounds like a massive change indeed :/
>
>> Anyway:
>>
>> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> I assume you'll want me to hold off that patch before someone reviews
> the rest?

The last exynos patch should be dropped, kirin patch should be 
tested/reviewed/acked by kirin maintaner. I am not sure about bridge 
patches, which ones have been tested by you, and which one have other users.

If yes it would be good to test them as well - changes in initialization 
flow can beat sometimes :)

I think patches 1-4 can be merged earlier, if you like, as they are on 
the list for long time.


Regards

Andrzej


>
> Thanks!
> Maxime
