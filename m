Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2429D213CF5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 17:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A90F6E563;
	Fri,  3 Jul 2020 15:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B946E563
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 15:47:12 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200703154711euoutp025bd77f4e3567fdf6862f2217a5e04086~eSK4zBlZH2238822388euoutp02n
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 15:47:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200703154711euoutp025bd77f4e3567fdf6862f2217a5e04086~eSK4zBlZH2238822388euoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593791231;
 bh=hXG7nSsJj4KbFe1ryZzHaLXyVYJ+8CRyqDltiTfPu50=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=N5M/t8OrlKWz2k3P0to7l8W4JIWUz9AhV3eQOLkAZ4o2gEaaMxndkz0ma8FyRf+ta
 eWd2pc7eJHhoHfqamXeFeydETXTZiAriFuAV5DV5ouV2ZKwYn7gX3Rw89PqNfSfriS
 QgBQEGudgADPmWr4Qkm57sQMTbk4mAsAD2dy+a/g=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200703154710eucas1p25e987aa5b426a8e7be74ce7eb718344e~eSK4c2L-R0472304723eucas1p2p;
 Fri,  3 Jul 2020 15:47:10 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id D1.2E.05997.EF25FFE5; Fri,  3
 Jul 2020 16:47:10 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200703154710eucas1p1f4a0eefefbfc22929ac3793f43bd9086~eSK4AFFvB0556405564eucas1p1G;
 Fri,  3 Jul 2020 15:47:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200703154710eusmtrp24af4b46df4353b5f7e19359cb9e1f46a~eSK3-aQPm0427804278eusmtrp2d;
 Fri,  3 Jul 2020 15:47:10 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-9f-5eff52fe8d3d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 63.A8.06314.EF25FFE5; Fri,  3
 Jul 2020 16:47:10 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200703154709eusmtip211c45ce9d7c41a962c68ae26ee65787c~eSK3EANWp0117701177eusmtip2S;
 Fri,  3 Jul 2020 15:47:09 +0000 (GMT)
Subject: Re: DSI probe/bind ordering in vc4
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
 Thierry Reding <thierry.reding@gmail.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <e20d7884-7a3c-4707-dc7a-742ccb753515@samsung.com>
Date: Fri, 3 Jul 2020 17:47:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200630132711.ezywhvoiuv3swo57@gilmour.lan>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02SeUgUcRTH+c3Mzo5LK9Nq+bKkdgkhKystmFIko2IMigoMOjzWHNTyakdN
 i3LVFA/KA8lczzxQI1G09cowNtRqU7MVs3IxyxSLRUKlNI9cR2H/+3zfe9/3fl/4UbjMILKn
 QsKjOFW4MlRBSoimrrm+vUvnl333f1U7Mfp3bzHGVFROMAOzUyTzMsGAmLTsCjGT/aVezDz6
 u4SYJk0VyXzIzMaYubZi4qiETZzqIlnDYD/ODvf2kWyLsQKxrRqjmC1IzRexIxndGNtYEc8m
 d84TbKP+9lnJJYl7IBcaEsOp9nn4S4JrW/9hkT9cYhvmhzA1qndKR1YU0AehKG+JTEcSSkZX
 I+goGFwTMwjSdDpMENMIKrMyReuW5up0sdCoQpBgakCCmEJQ0GtYERRlQ+8G9egOs8GWvgED
 D5NE5hmc7sQg4+Ov1U0kvQsWGz+RZpbSHmAaLyHMTNA7oSinHZl5E+0LdZPNmDCzEd7kjxHm
 /Vb0EcjV3zWXcdoTFr7rRAJvh2ZTIS6wHSTO1KzeBXpWDM9z+3AhwXFoya7BBLaBn93PxAJv
 g+XWkrV6PIxU38MFcyoCbX3rmtkNhnvnSYE9oS9lmjQ/CGhrGDJtFA5bQ05THi6UpZCaIhOm
 5TDSo13bYgeV72fJLKTQWCTTWMTRWMTRWMQpRcQTZMdF82FBHO8Szt105pVhfHR4kPPViLAG
 tPLV9EvdMy2obSFAh2gKKTZIs7oXfWUiZQwfF6ZDQOEKW+mxHr2vTBqojLvFqSL8VNGhHK9D
 WylCYSd1LZv0kdFByijuOsdFcqr1LkZZ2auRvOObwUurmSDH+k+emDg0Hm3jE+UWKm234fJf
 fx4Odp2tu5Jcy56KG99zrdnxcVZSPh844v9n6PBTF7V3cUTZ5Uqi0Ou+l2Kz4ysH74QAv0zM
 ZG2kKhfl2jvlbU6Qc8YzQ5v3wP1FbFL66YuOvIN8S6bEPbd0HI2eM7IXfseZFAQfrDzghKt4
 5X+ZfUomZgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7r/gv7HGfzbw29x+swpJou3cxez
 WFz5+p7N4kDjZUaLzolL2C0m3t7AbjHjxz9Gi22zlrNZXOqfyGTxc9c8Fgcuj6b3x9g8Ll+7
 yOxx59x5No8dd5cweuycdZfdY3bHTFaP+93HmTw2L6n3aD36i8Vj8+nqAK4oPZui/NKSVIWM
 /OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYy1O38zFTw1qtj06wZT
 A+MGrS5GTg4JAROJ7Su62EFsIYGljBIP/1dBxMUlds9/ywxhC0v8udbF1sXIBVTzllFiSe9j
 1i5GDg5hAW2JhocKIDUiAoUSH+9/AathFjjOJNF+ZTUrREMvo0Rjy102kCo2AU2Jv5tvgtm8
 AnYSb5/NZwGxWQRUJOZO2sMIYosKxEks3zKfHaJGUOLkzCcsIMs4BawkppyuAwkzC9hK3Jm7
 mxnClpfY/nYOlC0u0fRlJesERqFZSLpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz
 0vWS83M3MQIjeNuxn5t3MF7aGHyIUYCDUYmHd8Lxv3FCrIllxZW5hxglOJiVRHidzp6OE+JN
 SaysSi3Kjy8qzUktPsRoCvTbRGYp0eR8YHLJK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5Y
 kpqdmlqQWgTTx8TBKdXAmBm58AHPg7UPbrO3r/OP4lvadoN55anAZE7JBUHiDJZfbvG/6H79
 7NfUGY+ctr9WFV7+ZmleVr/Q/TcvyxyfmpzuNlWaepJx5ZmtFmWnfmVdO/ud8cM5+Saf07w8
 kxI+aAUf/Xgl9UXIxtvRvtvilkyuPLQjQptFVmC7pvWW5Ed/jz8vNZjXwq7EUpyRaKjFXFSc
 CACp/htY9gIAAA==
X-CMS-MailID: 20200703154710eucas1p1f4a0eefefbfc22929ac3793f43bd9086
X-Msg-Generator: CA
X-RootMTR: 20200701071310eucas1p1881528cda359db40be582d71c02c3d81
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200701071310eucas1p1881528cda359db40be582d71c02c3d81
References: <CGME20200701071310eucas1p1881528cda359db40be582d71c02c3d81@eucas1p1.samsung.com>
 <20200630132711.ezywhvoiuv3swo57@gilmour.lan>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Russell King <rmk+kernel@armlinux.org.uk>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 30.06.2020 15:27, Maxime Ripard wrote:
> Hi,
>
> I've tried to bring-up the DSI controller on the RaspberryPi4, and I've
> just encountered something that could make it troublesome to support.
>
> For context, the RaspberryPi has an official panel that uses a DSI->DPI
> bridge, a DPI panel, a touchscreen and a small micro-controller. That
> microcontroller controls the power management on the screen, so
> communicating with it is very much needed, and it's done through an i2c
> bus.
>
> To reflect that, the entire panel has been described in the Device Tree
> as an I2C device (since that's how you would control it), together with
> an OF-Graph endpoint linking that i2c device to the DSI controller[1].
>
> That deviates a bit from the generic DSI binding though[2], since it
> requires that the panel should be a subnode of the DSI controller (which
> also makes sense since DCS commands is usually how you would control
> that device).
>
> This is where the trouble begins. Since the two devices are on entirely
> different buses, there's basically no guarantee on the probe order. The
> driver has tried to address this by using the OF-Graph and the component
> framework. Indeed, the DSI driver (component-based) will register a
> MIPI-DSI host in its probe, and call component_add[3]. If component_add
> fails, it will remove the DSI host and return the error code. It makes
> sense.
>
> The panel on the other hand will probe, and look for a DSI host through
> the OF-Graph [4]. If it isn't there, it will return EPROBE_DEFER, hoping
> that it will be available at some point. It also makes complete sense.
>
> Where the issue lies is that component_add has two very different
> behaviours here that will create the bug that we see on the RPi4:
>
>    - If there's still components to probe, component_add will simply
>      return 0 [5][6]
>
>    - And if we're the last component to probe, component_add will then
>      run all the bind callbacks and return the result on error of the
>      master bind callback[7]. That master bind will usually have
>      component_bind_all that will return the result of the bind callback
>      of each component.
>
> Now, on the RPi4, the last component to probe is the DSI controller
> since it relies on a power-domain exposed by the firmware driver, so the
> driver core will defer its probe function until the power-domain is
> there [8]. We're thus pretty much guaranteed to fall in the second case
> above and run through all the bind callbacks. The DSI bind callback
> however will try to find and attach its panel, and return EPROBE_DEFER
> if it doesn't find it[9]. That error will then be propagated to the
> return code of component_bind_all, then to the master bind callback, and
> finally will be the return code of component_add.
>
> And since component_add is failing, we remove the DSI host. Since the
> DSI host isn't there, on the next occasion the i2c panel driver will not
> probe either, and we enter a loop that cannot really be broken, since
> one depends on the other.
>
> This was working on the RPi3 because the DSI is not the last driver to
> probe: indeed the v3d is depending on the same power domain[10][11] and
> is further down the list of components to add in the driver [12], so
> we're always in the first component_add case for DSI above, the DSI host
> sticks around, and the i2c driver can probe.
>
> I'm not entirely sure how we can fix that though. I guess the real flaw
> here is the assumption that component_add will not fail if one of the
> bind fails, which isn't true, but we can't really ignore those errors
> either since it might be something else than DSI that returns that
> error.
>
> One way to work around it is to make the mailbox, firmware and power
> domain drivers probe earlier by tweaking the initcalls at which they
> register, but it's not really fixing anything and compiling them as
> module would make it broken again.


Forgive me - I have not read whole post, but I hope you have a problem 
already solved.

As I understand you have:

1. Componentized DSI-host.

2. Some sink laying on DSI bus.


General rule I promote: "do not expose functionality, until you have all 
dependencies", in this case it would be "do not call component_add until 
you know sink(your dependency) is ready".


Already tested solution (to be checked in drivers):

1. In DSI-host you register dsi bus in probe, but do not call component_add.

2. In DSI-host callback informing about DSI device registration you get 
the sink and since you have all resources then you call component_add.


I hope it will be helpful.


Regards

Andrzej


>
> Maxime
>
> 1: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.yaml
> 2: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/dsi-controller.yaml
> 3: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1661
> 4: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c#n397
> 5: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/component.c#n685
> 6: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/component.c#n241
> 7: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/component.c#n255
> 8: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/platform.c#n742
> 9: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1574
> 10: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/bcm2835-rpi-common.dtsi
> 11: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/bcm2835-rpi.dtsi#n79
> 12: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/vc4/vc4_drv.c#n337
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://protect2.fireeye.com/url?k=44989d8e-194c21e6-449916c1-0cc47a3356b2-0aae5582ddccab36&q=1&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
