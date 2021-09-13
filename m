Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733874084B9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 08:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0136E0E1;
	Mon, 13 Sep 2021 06:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF61C6E0E1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 06:29:44 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210913062942euoutp02f1fa0bcb516f46c66c3cdc11a22139a4~kTd5uZUs22567425674euoutp02N
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 06:29:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210913062942euoutp02f1fa0bcb516f46c66c3cdc11a22139a4~kTd5uZUs22567425674euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1631514582;
 bh=yfqRkQDKxR6+pW3E/XXVEL3wgEDDUumbRF/U8EODWTs=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=jRD38euYljheO/7pj5Rc330gciJe5MzWqdeRRFHVFFZTaFQ2W0KQwTRP3IYU4O5Mj
 IPDDMHsP/S42MgbwZtQl05R/1kmJjqTiQfM8nq4z7DA/a3VLC0Cfdz2dGR/F9QFCgr
 /gDaqqtRq0QByztEzBLv5OVOaDFrTc1dZX2FZNfU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210913062942eucas1p10063f9b5e36ebe923689ebfe2045518f~kTd5NWl0g2716427164eucas1p1F;
 Mon, 13 Sep 2021 06:29:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E9.8E.56448.5DFEE316; Mon, 13
 Sep 2021 07:29:42 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210913062941eucas1p24e96143ba4ab25cb1c9c5e7cef29812e~kTd4bc3MY3092830928eucas1p2s;
 Mon, 13 Sep 2021 06:29:41 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210913062941eusmtrp1adb246ecd37f99f51f61a2ecbe2601ad~kTd4aX5Ic1726917269eusmtrp1e;
 Mon, 13 Sep 2021 06:29:41 +0000 (GMT)
X-AuditID: cbfec7f5-d53ff7000002dc80-7b-613eefd58a9b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 2D.3C.31287.5DFEE316; Mon, 13
 Sep 2021 07:29:41 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210913062940eusmtip1a1cdacd97e897a0713826f91501e2edb~kTd3LcC591305313053eusmtip1K;
 Mon, 13 Sep 2021 06:29:39 +0000 (GMT)
Message-ID: <7ad18d53-3ad6-a614-a8e1-cce6505f90a8@samsung.com>
Date: Mon, 13 Sep 2021 08:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0)
 Gecko/20100101 Thunderbird/92.0
Subject: Re: [PATCH v4 02/24] drm/bridge: Document the probe issue with
 MIPI-DSI bridges
Content-Language: en-GB
To: Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Thierry Reding
 <thierry.reding@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Neil Armstrong <narmstrong@baylibre.com>, Robert Foss
 <robert.foss@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org, Kyungmin
 Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, Xinliang Liu
 <xinliang.liu@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao
 <tiantao6@hisilicon.com>, Inki Dae <inki.dae@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Clark
 <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, John Stultz
 <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, Joonyoung Shim <jy0922.shim@samsung.com>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210910101218.1632297-3-maxime@cerno.tech>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTdxTO797be287Sy6Vrb+gU9fFbTpE3MP9yAZjCVluostkS1jGlmGd
 d8B41LQwhyadQyCAUp5hUBhQRa2ovGyLdKxkVYSmtugQBgYtExiI3Tp5jUfA0V6W8d93vnPO
 d75zcmhcco0MpBNSUjllijxJRooI080F565+T7g8ZKwJQ/lOG4Yu3GrA0d1ZD4mqxh0AFbsK
 CTRe0wDQraVdyObuI9DEgzsEml+2CJAjw02h3KI6ChV1OCjUa64iUXmPBUO6J0YClc+vAGTV
 fIZcZdpVDd08jqa0v+NIv2AE6H7JDYDKSx6RaMFcTaBLjy0UMriLBKizo14QsZn1DGRR7JCz
 h2TbtPcpduTHZoqtzKkQsGfbH2Fsd+GvGDvU306yrXPDArbaFsW6TnVhbJf5HsXWlfWRrMZQ
 D9ir9uPsdMuWA0yM6J3DXFLCN5xyd/hBUfxDjfhI3Y5vT57uByeAa1seoGnIvAFndKo8IKIl
 jB7A/Mkugg9mAKzNvY3zwTSA5t/yyDwg9HW0/t2OebGEuQBg4/XjfJEHwOLMRsqbEDPh8HHp
 BO7FBLMdnipYIXjeH9oqRn34WeYgHD83i3ltbGRi4KIDeGmckcKMmYsCr2YAs4TDpoVBnyWc
 uUNA48M8nyjJ7IDLVwd9joRMKMxa7hPw3VvhSWOlzzZkOkXQZmwkeNuRUGMaFfB4I5zsMlA8
 3gztJafXar6DLn3mWnMOgMamNpxPvA2HnIuk1yq+OrnRvJun34PXK+wEf0g/OPCnP+/BDxab
 fsB5WgxzsiV89QvQ5TCuCUrhuduzZCGQadedRbtuf+26bbT/z60FRD2Qcmmq5DhO9XoKdzRY
 JU9WpaXEBX+pSG4Bq89tX+mavQb0k0+CrQCjgRVAGpcFiE3uMLlEfFiefoxTKmKVaUmcygo2
 0YRMKjYbL8dKmDh5KpfIcUc45X9ZjBYGnsA+D+7t/cK/WvbKV+nPmY5Go8Swj1WKM7KWgkXz
 mTn1M0F/1AZ299ivRBk3vFiaUZOaOPh+yd2d7r0HrNb+1IE56HcogKjRTcWz52toT0hM5EuS
 iPy4hn2/PGjeX9WKpH3CraP2iNfG4JgneiQkzROBWUMU2cKRn4FNERrqzAhR36gM89e8Kj8/
 IUE2+96v0zOf/rOFzvV796Oq5YLsD+LbL+fc27S9E7QtWLsNGnWQfXFYGv69eqX+046o3qms
 S0hrc3BBT4Oe19btv7Ln5jbDElG0YYb5ybJPrjMUvNnz11vl01W0LetsUllkvvrDjmZLQqy+
 9JNjiRdfjtY1DLcdkhGqePmenbhSJf8XdYjUSksEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLKsWRmVeSWpSXmKPExsVy+t/xu7pX39slGqzdym3Re+4kk8XyM+uY
 La58fc9mMef5WUaLSfcnsFg8n7+O0eLMb12Lk2+usli8uHeRxeLH332sFmeb3rBbdE5cwm4x
 cf9ZdovLu+awWcw4v4/JYuHHrSwWM378Y7Q41BdtcX/aLKAZC38wW3ya9ZDZYsXPrYwWdycf
 YbSYMfklm8XPXfNYLFa/3sduseXNRFaLo/tXsTrIeLy/0crucefceTaPnbPusns8nruR3WN2
 x0xWj8V7XjJ5nJhwicnjzrU9bB7bvz1g9Zh3MtDjfvdxJo/ju26xeyyZdpXNo2/LKkaPzaer
 PT5vkgsQiNKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3
 S9DLeNTHW7BEs6K55xpjA+N9hS5GTg4JAROJ7R/2MHUxcnEICSxllLjb84ENIiEusXv+W2YI
 W1jiz7UuNoiit4wSV/fPBEvwCthJvJ7yAsxmEVCV6O7/xwIRF5Q4OfMJmC0qkCCx+3AXexcj
 B4ewQJTEr7OMIGFmoPlNX1aygswUEfjPLNE1fRUziMMscJVFouHoLKhtuxkl7l9aCraBTUBT
 4u/mm2DncQpYSrT+vcoKMcpMomtrF9RYeYnmrbOZJzAKzUJyyCwkG2chaZmFpGUBI8sqRpHU
 0uLc9NxiQ73ixNzi0rx0veT83E2MwHS17djPzTsY5736qHeIkYmD8RCjBAezkgjvtje2iUK8
 KYmVValF+fFFpTmpxYcYTYGhMZFZSjQ5H5gw80riDc0MTA1NzCwNTC3NjJXEebfOXRMvJJCe
 WJKanZpakFoE08fEwSnVwLSOV+LvRbl98pEXD6/bcGeWw77F7jGfH11u32XKzFPyRePchS0l
 i9jZlvpqm6amyJjvP3ooW85rB0OdxZvMwq6i+40/Y/Zp8Fy+P139t+j9qqvvbE1ecIco/r8V
 J8mVrliTmue9cwnPozUxeY83cmh0tvNH3ly5tFh7euuMixZ50oWyB17fyEmxDRJkP3VmKfsf
 iZkX53o9SErnOha69pJ8nRf7tQovkZpPs2zmdl+fOIHr6eLn1zbdsIw4tDztNU8+18nD/9eZ
 9x+wXN3KuMQ8vHyS27EM1xOFer8sdz4Q6Wp61K//4sLs9neGam+9Z4u7uLWq2lSEq4fMeqT+
 tKTafXLu2sf6IidX3s+4cViJpTgj0VCLuag4EQCy6bx04AMAAA==
X-CMS-MailID: 20210913062941eucas1p24e96143ba4ab25cb1c9c5e7cef29812e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210910101246eucas1p17191a80c37b0e1784d6d9b8bf6fbcd60
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210910101246eucas1p17191a80c37b0e1784d6d9b8bf6fbcd60
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CGME20210910101246eucas1p17191a80c37b0e1784d6d9b8bf6fbcd60@eucas1p1.samsung.com>
 <20210910101218.1632297-3-maxime@cerno.tech>
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


W dniu 10.09.2021 o 12:11, Maxime Ripard pisze:
> Interactions between bridges, panels, MIPI-DSI host and the component
> framework are not trivial and can lead to probing issues when
> implementing a display driver. Let's document the various cases we need
> too consider, and the solution to support all the cases.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   Documentation/gpu/drm-kms-helpers.rst |  6 +++
>   drivers/gpu/drm/drm_bridge.c          | 57 +++++++++++++++++++++++++++
>   2 files changed, 63 insertions(+)
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
> index baff74ea4a33..7cc2d2f94ae3 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -96,6 +96,63 @@
>    * documentation of bridge operations for more details).
>    */
>   
> +/**
> + * DOC: special care dsi
> + *
> + * The interaction between the bridges and other frameworks involved in
> + * the probing of the upstream driver and the bridge driver can be
> + * challenging. Indeed, there's multiple cases that needs to be
> + * considered:
> + *
> + * - The upstream driver doesn't use the component framework and isn't a
> + *   MIPI-DSI host. In this case, the bridge driver will probe at some
> + *   point and the upstream driver should try to probe again by returning
> + *   EPROBE_DEFER as long as the bridge driver hasn't probed.
> + *
> + * - The upstream driver doesn't use the component framework, but is a
> + *   MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
> + *   controlled. In this case, the bridge device is a child of the
> + *   display device and when it will probe it's assured that the display
> + *   device (and MIPI-DSI host) is present. The upstream driver will be
> + *   assured that the bridge driver is connected between the
> + *   &mipi_dsi_host_ops.attach and &mipi_dsi_host_ops.detach operations.
> + *   Therefore, it must run mipi_dsi_host_register() in its probe
> + *   function, and then run drm_bridge_attach() in its
> + *   &mipi_dsi_host_ops.attach hook.
> + *
> + * - The upstream driver uses the component framework and is a MIPI-DSI
> + *   host. The bridge device uses the MIPI-DCS commands to be
> + *   controlled. This is the same situation than above, and can run
> + *   mipi_dsi_host_register() in either its probe or bind hooks.
> + *
> + * - The upstream driver uses the component framework and is a MIPI-DSI
> + *   host. The bridge device uses a separate bus (such as I2C) to be
> + *   controlled. In this case, there's no correlation between the probe
> + *   of the bridge and upstream drivers, so care must be taken to avoid
> + *   an endless EPROBE_DEFER loop, with each driver waiting for the
> + *   other to probe.
> + *
> + * The ideal pattern to cover the last item (and all the others in the
> + * MIPI-DSI host driver case) is to split the operations like this:
> + *
> + * - The MIPI-DSI host driver must run mipi_dsi_host_register() in its
> + *   probe hook. It will make sure that the MIPI-DSI host sticks around,
> + *   and that the driver's bind can be called.
> + *
> + * - In its probe hook, the bridge driver must try to find its MIPI-DSI
> + *   host, register as a MIPI-DSI device and attach the MIPI-DSI device
> + *   to its host. The bridge driver is now functional.
> + *
> + * - In its &struct mipi_dsi_host_ops.attach hook, the MIPI-DSI host can
> + *   now add its component. Its bind hook will now be called and since
> + *   the bridge driver is attached and registered, we can now look for
> + *   and attach it.
> + *
> + * At this point, we're now certain that both the upstream driver and
> + * the bridge driver are functional and we can't have a deadlock-like
> + * situation when probing.
> + */
> +
>   static DEFINE_MUTEX(bridge_lock);
>   static LIST_HEAD(bridge_list);
>   


Nice work with documenting this initialization dance. It clearly shows 
that bridge API lacks better mechanism - usage of mipi dsi callbacks to 
get notifications about bridge appearance is ugly. It remains me my 
resource tracking patches which I have posted long time ago [1] - they 
would solve the issue in much more elegant way, described here [2]. 
Apparently I was not stubborn enough in promoting this solution.

Anyway:

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>


[1]: https://lkml.org/lkml/2014/12/10/342

[2]: 
https://events19.linuxfoundation.org/wp-content/uploads/2017/12/Deferred-Problem-Issues-With-Complex-Dependencies-Between-Devices-in-Linux-Kernel-Andrzej-Hajda-Samsung.pdf


Regards
Andrzej


