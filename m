Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 433003F4E67
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 18:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6499489F0A;
	Mon, 23 Aug 2021 16:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39F389F0A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 16:32:15 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210823163214euoutp02d27880eee429fd2f89642a2df07925c6~d-I_ocZI92538625386euoutp020
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 16:32:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210823163214euoutp02d27880eee429fd2f89642a2df07925c6~d-I_ocZI92538625386euoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1629736334;
 bh=O9U6BQsouLSVjO3boLuxdxwJiLra8Cy9p2rlTaTzXCw=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=HkAOHnAF90ShRqjDOnQcqqf5exrGSW9xgdISqHlluTz7cv1D6CRkZOGAci1WoebRt
 IMPpBKi+0E6wSqqnjHU2Lwu6X+KdOXsscpU/lxDmyi6vkvAsNUuxx55J1aTp3EW45e
 cAIKdFPx9FEEAweuPev6/nLX3MCnVHUdTc7fspL0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210823163213eucas1p282dee5100ff2aa68a9a1886665c59455~d-I_BmU8C1521015210eucas1p2t;
 Mon, 23 Aug 2021 16:32:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 2C.7E.56448.D8DC3216; Mon, 23
 Aug 2021 17:32:13 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210823163212eucas1p295cdf32fe45316e308b77c1d799f3eab~d-I9dqwgs2157321573eucas1p2M;
 Mon, 23 Aug 2021 16:32:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210823163212eusmtrp2248bab501e8dffb7542e32d22b55a151~d-I9c3qPW1398113981eusmtrp2X;
 Mon, 23 Aug 2021 16:32:12 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-25-6123cd8de024
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E4.98.31287.C8DC3216; Mon, 23
 Aug 2021 17:32:12 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210823163212eusmtip2ba17251034bc64c16bf66eca3058e658~d-I8tnMzC1550515505eusmtip2R;
 Mon, 23 Aug 2021 16:32:12 +0000 (GMT)
Message-ID: <792b1a4b-7a82-e633-0266-787205ae279a@samsung.com>
Date: Mon, 23 Aug 2021 18:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.0
Subject: Re: [PATCH v3 2/8] drm/bridge: Document the probe issue with
 MIPI-DSI bridges
Content-Language: en-GB
To: Maxime Ripard <maxime@cerno.tech>, Jonas Karlman <jonas@kwiboo.se>, Sam
 Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Neil Armstrong <narmstrong@baylibre.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Robert Foss
 <robert.foss@linaro.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210823084723.1493908-3-maxime@cerno.tech>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUwTZxzPc9der2StZ8X1P51zHDGKW2GkLDmmMWD2cn6AzGwZi1sCN7kg
 UgppgYHG4ejAAmFDMkSqkxlwFHGI2AItRBIypAykjI5NJ6x0kXSaCqvQDXDAoIcZ335v/7cn
 D4krvOJtZLo2h9dpOQ1NhIjaby84VRV3wrnX/C3PMxXDAxjTONSCMz8HZgjGW9eCmAHfmIgp
 PdsgYVz2iwRz2W8VMefnlxHT++VHzBOTB2fMC1bELNgviRiL76w4Ts7O3C2WsOPDToK1mSYk
 7AVjrZit736IsY7KUYwd/6WbYDv+nhSzlwYOs+7yfoxtODdGsDcHT7KzbS+9KzsSsj+V16Tn
 8bqoAykhx8qNfSj7h6j8Cs998Wn03a4yJCWBioHiYqukDIWQCsqMYGLqX7FA5hBM+h1IILMI
 upp96FlJY9fQutGIwNcZIAQyg+CP8YfitZSMOgCeqTNBLKJ2QVGZVyTom2Gg9kEQb6VSoNLV
 F+y6hfoQGkqnghinlFA01xTcI5R6ioPF4CQEIx7uVd8ONiWoCFi6eS+oS6lYcLQ9EAuZndDx
 +CK+VgxUjxRuVTeJhb3fhD8N9nW8BR71WyQCfhFWbHWYgAvBbf5ivdiIwNpqwwVjH4wPL65O
 I1cnRMB1e5Qgx8PK7Ai2JgMlh7uPNws7yKGqvQYXZBkYSxRCOgzcd6zrDZVwZSRAVCLatOFZ
 TBvON224xvT/3G+R6CpS8rn6zDRer9byn0bquUx9rjYt8mhWZhta/YuDy/2BTmR+5I/sRRiJ
 ehGQOB0qW8LCOYUslSs4weuyknW5Gl7fi7aTIlops1uvJSuoNC6Hz+D5bF73zMVI6bbTmJR9
 W1k/8kZ462x7wnV3SXToHkpSEzeZ0lGvkhqdLoujaW7ovKMqa8nbV2v8Z5NzcGr33onn/AkF
 CXkn2hbjHNR88wcvqJRqQ3f5mR3KbzS/etWeREPscn/n4ZXlpLyDf92gpy9f2A2pyRrNIjQP
 1f0+rfKMHv1R+cnXYy5t4Ss7LDu320+VVIcnJSVmTBT0yG3qyZ9yCl+N3wPRvuMZ+deefjWY
 VxibkO3OLxp1kZuwj80Bg+3ge/IezWetT/LPbe1IVF05hYeFXf3cpaNL7/dVnTw0ndl8Aze8
 rv+NdsRk73+nS1tzKCJm38u1nN1C3HorPqX1/ePzlnT3Efp79TQt0h/jovfiOj33H2vA4Yz6
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsVy+t/xe7o9Z5UTDRaf1LHoPXeSyWL5mXXM
 Fle+vmezeD5/HaPFyTdXWSw6Jy5ht7i8aw6bxcKPW1ksZvz4x2hxqC/a4tOsh8wWK35uZbT4
 uWsei8WWNxNZHfg83t9oZfe4c+48m8fOWXfZPWZ3zGT1WLznJZPHiQmXmDzuXNvD5rH92wNW
 j3knAz3udx9n8lgy7Sqbx+bT1R6fN8kF8Ebp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZ
 GpvHWhmZKunb2aSk5mSWpRbp2yXoZXR3HGUsOKJf0fvwNmsD4zLVLkZODgkBE4nlu88wdjFy
 cQgJLGWUmHdjAyNEQlxi9/y3zBC2sMSfa11sEEVvGSU2NlxjBUnwCthJPHzaDmazCKhKNHU9
 Z4GIC0qcnPkEzBYVSJA4cH0PmC0sECFxb9EvJhCbGWhB05eVYL0iAn+ZJb4sioWIO0rcnHqM
 FWLZbkaJ70/ugTWzCWhK/N18kw3E5hSwlDix6QkrRIOZRNfWLkYIW15i+9s5zBMYhWYhuWMW
 kn2zkLTMQtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmAa2Hbs5+YdjPNefdQ7xMjE
 wXiIUYKDWUmE9y+TcqIQb0piZVVqUX58UWlOavEhRlNgYExklhJNzgcmorySeEMzA1NDEzNL
 A1NLM2Mlcd6tc9fECwmkJ5akZqemFqQWwfQxcXBKNTBZbQ/es5rnusdzgclPe/eVvLOQ5/Ge
 WixjYHD2q3GvpNVs9Y0lHlJOZW4zCx1feQYuC/6rvkvAJ7G5kueP/mk+BY72dZGKHdceaSUE
 eWZ6sLX5+lRc8ckxnjODf4XHvnlLs+8b1lTF5eVf2yj4/++LyMW6k75xLmp5M1lMgz9h4cTO
 OT4CDNct0zpea973eOFjVGV8ZRP/U6PshTbmLB3PuxgNVz2d6PxTv7Gt0ZxltdJVA/mFcw6Z
 qHBvj7x/at6bc5fMPR2ZeDr/n9P8cEYscLLs479HmHRC7qiKCd5XPxua/7igweBLUEWw1pcv
 LkLpMsGdU759Mt9eeuNDw6OTPkqlk1J7CjguX2bdqsRSnJFoqMVcVJwIAM8dKNiMAwAA
X-CMS-MailID: 20210823163212eucas1p295cdf32fe45316e308b77c1d799f3eab
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210823084750eucas1p24cd5dd54a967f63fda4184773b98c135
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210823084750eucas1p24cd5dd54a967f63fda4184773b98c135
References: <20210823084723.1493908-1-maxime@cerno.tech>
 <CGME20210823084750eucas1p24cd5dd54a967f63fda4184773b98c135@eucas1p2.samsung.com>
 <20210823084723.1493908-3-maxime@cerno.tech>
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

Hi Maxime,

On 23.08.2021 10:47, Maxime Ripard wrote:

> Interactions between bridges, panels, MIPI-DSI host and the component
> framework are not trivial and can lead to probing issues when
> implementing a display driver. Let's document the various cases we need
> too consider, and the solution to support all the cases.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   Documentation/gpu/drm-kms-helpers.rst |  6 +++
>   drivers/gpu/drm/drm_bridge.c          | 58 +++++++++++++++++++++++++++
>   2 files changed, 64 insertions(+)
>
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 10f8df7aecc0..ec2f65b31930 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -157,6 +157,12 @@ Display Driver Integration
>   .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
>      :doc: display driver integration
>   
> +Special Care with MIPI-DSI bridges
> +----------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> +   :doc: special care dsi
> +
>   Bridge Operations
>   -----------------
>   
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index baff74ea4a33..794654233cf5 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -96,6 +96,64 @@
>    * documentation of bridge operations for more details).
>    */
>   
> +/**
> + * DOC: special care dsi
> + *
> + * The interaction between the bridges and other frameworks involved in
> + * the probing of the display driver and the bridge driver can be
> + * challenging. Indeed, there's multiple cases that needs to be
> + * considered:
> + *
> + * - The display driver doesn't use the component framework and isn't a
> + *   MIPI-DSI host. In this case, the bridge driver will probe at some
> + *   point and the display driver should try to probe again by returning
> + *   EPROBE_DEFER as long as the bridge driver hasn't probed.
> + *
> + * - The display driver doesn't use the component framework, but is a
> + *   MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
> + *   controlled. In this case, the bridge device is a child of the
> + *   display device and when it will probe it's assured that the display
> + *   device (and MIPI-DSI host) is present. The display driver will be
> + *   assured that the bridge driver is connected between the
> + *   &mipi_dsi_host_ops.attach and &mipi_dsi_host_ops.detach operations.
> + *   Therefore, it must run mipi_dsi_host_register() in its probe
> + *   function, and then run drm_bridge_attach() in its
> + *   &mipi_dsi_host_ops.attach hook.
> + *
> + * - The display driver uses the component framework and is a MIPI-DSI
> + *   host. The bridge device uses the MIPI-DCS commands to be
> + *   controlled. This is the same situation than above, and can run
> + *   mipi_dsi_host_register() in either its probe or bind hooks.
> + *
> + * - The display driver uses the component framework and is a MIPI-DSI
> + *   host. The bridge device uses a separate bus (such as I2C) to be
> + *   controlled. In this case, there's no correlation between the probe
> + *   of the bridge and display drivers, so care must be taken to avoid
> + *   an endless EPROBE_DEFER loop, with each driver waiting for the
> + *   other to probe.
> + *
> + * The ideal pattern to cover the last item (and all the others in the
> + * display driver case) is to split the operations like this:
> + *
> + * - In the display driver must run mipi_dsi_host_register() and
> + *   component_add in its probe hook. It will make sure that the
> + *   MIPI-DSI host sticks around, and that the driver's bind can be
> + *   called.


I guess component_add is leftover from previous iteration (as you wrote 
few lines below) component_add should be called from dsi host attach 
callback.


> + *
> + * - In its probe hook, the bridge driver must try to find its MIPI-DSI
> + *   host, register as a MIPI-DSI device and attach the MIPI-DSI device
> + *   to its host. The bridge driver is now functional.
> + *
> + * - In its &struct mipi_dsi_host_ops.attach hook, the display driver
> + *   can now add its component. Its bind hook will now be called and
> + *   since the bridge driver is attached and registered, we can now look
> + *   for and attach it.
> + *
> + * At this point, we're now certain that both the display driver and the
> + * bridge driver are functional and we can't have a deadlock-like
> + * situation when probing.
> + */
> +


Beside small mistake the whole patch looks OK for me. Maybe it would be 
worth to mention what is the real cause of this "special DSI case" - 
there is mutual dependency between two following entities in display chain:

1. display driver - it provides DSI bus, and requires drm_bridge or 
drm_panel provided by child device.

2. bridge or panel with DSI transport - it requires DSI bus provided by 
display driver, and provides drm_bridge or drm_panel interface required 
by display driver.

I guess similar issues can appear with other data/control bus-es, 
apparently DSI case is the most common.


And one more thing - you use "display driver" term but this is also case 
of any bridge providing DSI bus - there are already 3 such bridges in 
kernel - cdns, nwl, synopsys, tc358768, maybe "DSI host" would be better 
term.

And another thing - downstream device can be bridge or *panel*, it would 
be good to mention that panels also should follow this pattern.

Btw this is another place where word bridge can be 1:1 replaced by word 
panel - it clearly suggest that DRM subsystem waits for brave men who 
proposes patches unifying them, we would save lot of words, and lines of 
code if we could use drm_sink instead of "if (sink is bridge) do sth 
else do sth-similar-but-with-drm_panel-interface".


Regards

Andrzej


>   static DEFINE_MUTEX(bridge_lock);
>   static LIST_HEAD(bridge_list);
>   
