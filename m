Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE10F47E0BF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 10:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6C810E2AD;
	Thu, 23 Dec 2021 09:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902AB10E2AB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 09:15:18 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20211223091516euoutp0129469e02ccc51556bc3efa1a13284d46~DV4Sx-ciF1965519655euoutp01W
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 09:15:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20211223091516euoutp0129469e02ccc51556bc3efa1a13284d46~DV4Sx-ciF1965519655euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1640250916;
 bh=qIYcYdQyZB/X8IUC9MaeWJ2uimK4WJjptCZ4fHSx6rY=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=lQlUUcioUvu40FUMz4g6t+0isH55AK/BQlBlfB58ir49ThyGOqKaOozWBJ3b8raYa
 56+00DRipWMoDHRx2Uf6ew+fJ0dtxGVHOWsWHGxV4q1QrtngTTs5p+fem246ysSBne
 0+IW4V12zsrBfrnRboLdaXRtcsIA8Gin4o1VHxNI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20211223091516eucas1p286329c54a224b3bf2a1e54908b22d156~DV4SYLwIa3234632346eucas1p2J;
 Thu, 23 Dec 2021 09:15:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F8.F3.10009.32E34C16; Thu, 23
 Dec 2021 09:15:16 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20211223091515eucas1p2f67012dfc9f5d95398c76f31882aaa40~DV4R1JrK83234632346eucas1p2F;
 Thu, 23 Dec 2021 09:15:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211223091515eusmtrp1590969ce888bfa0b51388bc3c572acc3~DV4R0TN2r1093510935eusmtrp1O;
 Thu, 23 Dec 2021 09:15:15 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-3c-61c43e2354e6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id EF.B5.09404.32E34C16; Thu, 23
 Dec 2021 09:15:15 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211223091514eusmtip22d9595c639075b7f877917a96f27780a~DV4Q-LOQ32859328593eusmtip2q;
 Thu, 23 Dec 2021 09:15:14 +0000 (GMT)
Message-ID: <012176de-a246-4dfe-1779-e15f498f1d72@samsung.com>
Date: Thu, 23 Dec 2021 10:15:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v4 0/6] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Jagan Teki <jagan@amarulasolutions.com>
In-Reply-To: <fc773566-760d-19ec-0879-3ee88c06b425@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsWy7djP87oqdkcSDd62M1rcX/yZxeLK1/ds
 FpPuT2Cx+LJpApvF+fMb2C06Jy5ht1g+YR+bxanGVhaLQ33RFp9mPWS2WPFzK6MDt8faj/dZ
 Pd7faGX3mN0xk9Vj8Z6XTB6bVnWyedy5tofN4373cSaPJdOusnn0bVnFGMAZxWWTkpqTWZZa
 pG+XwJWx/NchxoKuyoovx5pZGxhnZXQxcnBICJhItN436mLk5BASWMEo8eKSaBcjF5D9hVHi
 7sEjTBDOZ0aJb+sWM4FUgTSsPHWKBSKxnFFiax+M85FRov33Z2aQKl4BO4mv/U8ZQVawCKhK
 rOuSgAgLSpyc+YQFxBYVSJJo7fgDNlRYwEGioeMzK4jNLCAucevJfLA4m4ChRNfbLjYQW0RA
 W+LbzNdsILuYBZYzS9y69gIswSlgLzG3cSE7RLO8RPPW2cwgRRIC0zklej5sZ4X400ViwhYR
 iA+EJV4d38IOYctInJ7cwwJR38wo8fDcWnYIp4dR4nLTDEaIKmuJO+d+sYEMYhbQlFi/Sx8i
 7Cjx/tRpRoj5fBI33gpC3MAnMWnbdGaIMK9ER5sQRLWaxKzj6+DWHrxwiXkCo9IspGCZheT9
 WUi+mYWwdwEjyypG8dTS4tz01GLDvNRyveLE3OLSvHS95PzcTYzAhHb63/FPOxjnvvqod4iR
 iYPxEKMEB7OSCG/7hMOJQrwpiZVVqUX58UWlOanFhxilOViUxHmTMzckCgmkJ5akZqemFqQW
 wWSZODilGphqK/nmP/rBfGV+Tf3Jtin5R+eUh01p1px/KoRBgO+sp+iv4/++/H3ON///ySW5
 L84/40ls2XI4Ni9n3edELRY304RsIYMnql2PPnS1X5Vd4NUm2fyv5fZl/oL/WyvikhZPZ+m3
 W7g68HWNzu4vcmZmuk9Dg5oPG/1K3l8xu0zeWNL2XNCEwKwlp5pSV/bOVZ2RtDHKNtxyv92b
 M2bbmqoNlkZ46sc4MuuofpvqHWC3ZE+25fyv+3WOturZPfBnreLv51k668rf5UzHn6y0Z5Z/
 0xLbnfLRw6zx2IqyPj/1MEPN95e7eCuqz6Z8PcD/8+EpiQWfuKRXv04tvvJttoX4+s7rskVn
 U/64L5lyxU2JpTgj0VCLuag4EQBGk8zZ1wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsVy+t/xe7rKdkcSDTZtV7O4v/gzi8WVr+/Z
 LCbdn8Bi8WXTBDaL8+c3sFt0TlzCbrF8wj42i1ONrSwWh/qiLT7NeshsseLnVkYHbo+1H++z
 ery/0cruMbtjJqvH4j0vmTw2repk87hzbQ+bx/3u40weS6ZdZfPo27KKMYAzSs+mKL+0JFUh
 I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j+a9DjAVdlRVfjjWz
 NjDOyuhi5OSQEDCRWHnqFEsXIxeHkMBSRomOz39ZIBIyEienNbBC2MISf651sUEUvWeUWLNh
 JVgRr4CdxNf+p4xdjBwcLAKqEuu6JCDCghInZz4BKxEVSJLYvW4rG4gtLOAg0dDxGWwms4C4
 xK0n85lAbDYBQ4mut11gNSIC2hLfZr4G28UssJJZ4tnlv1DXHWCW+H/1NDNIFaeAvcTcxoXs
 EJPMJLq2djFC2PISzVtnM09gFJqF5JBZSBbOQtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV5
 6XrJ+bmbGIFxvO3Yzy07GFe++qh3iJGJg/EQowQHs5IIb/uEw4lCvCmJlVWpRfnxRaU5qcWH
 GE2BgTGRWUo0OR+YSPJK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqYODil
 GphSWivz1xgELGeIeuy9Is9p0ZW2x+cVKhcHMt2taC9k8Kx9s6lOzPt2gMyWaK/n7pXCUiFL
 fO2X/gy7Gs4tllS4rTr9oZZjqsTql/OnKrzLYZK/O1crMU3myE/2r1K/hf1Vnrncsf1YOuNg
 03P2LQYv934X5Zn37kjiDZEFLQoM/5vO3ZS74hd/vPsue7Oi9N+K/dn9V8+9nTc9QL5gAcdR
 qwe/kowbZq8NiD5ewZytaM69TLKiZ2uo23a1ZMYFMzYcudN5pb5KYIJT5KltGdOWMpdEd/RE
 ZeUe5FeTOrErxLXziUoUf1Dp/SKLVMeWtPR7k/NbvusU1bw/tzu0lX2H0pcP0fWfuZt2LDj0
 UYmlOCPRUIu5qDgRAN9OsS9sAwAA
X-CMS-MailID: 20211223091515eucas1p2f67012dfc9f5d95398c76f31882aaa40
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7
References: <CGME20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7@eucas1p2.samsung.com>
 <20211215101534.45003-1-jagan@amarulasolutions.com>
 <39f646d7-9d49-045a-2cf5-3cdc12486cb3@samsung.com>
 <CAMty3ZBmZo3wqzj2Si4Ydm1RtzGs7f89aCktgVvD==appfSCPQ@mail.gmail.com>
 <fe49e59a-1df7-fcdc-8258-581509bb8fe2@samsung.com>
 <CAMty3ZCSrqcnO1i5ADJhQx_Dt5GbT+-eyhauJhqg=wJXOTWK-A@mail.gmail.com>
 <fc773566-760d-19ec-0879-3ee88c06b425@samsung.com>
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amarula@amarulasolutions.com,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 18.12.2021 00:16, Marek Szyprowski wrote:
> On 15.12.2021 15:56, Jagan Teki wrote:
>> On Wed, Dec 15, 2021 at 7:49 PM Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>> On 15.12.2021 13:57, Jagan Teki wrote:
>>>> On Wed, Dec 15, 2021 at 5:31 PM Marek Szyprowski
>>>> <m.szyprowski@samsung.com> wrote:
>>>>> On 15.12.2021 11:15, Jagan Teki wrote:
>>>>>> Updated series about drm bridge conversion of exynos dsi.
>>>>>> Previous version can be accessible, here [1].
>>>>>>
>>>>>> Patch 1: connector reset
>>>>>>
>>>>>> Patch 2: panel_bridge API
>>>>>>
>>>>>> Patch 3: Bridge conversion
>>>>>>
>>>>>> Patch 4: Atomic functions
>>>>>>
>>>>>> Patch 5: atomic_set
>>>>>>
>>>>>> Patch 6: DSI init in enable
>>>>> There is a little progress! :)
>>>>>
>>>>> Devices with a simple display pipeline (only a DSI panel, like
>>>>> Trats/Trats2) works till the last patch. Then, after applying 
>>>>> ("[PATCH
>>>>> v4 6/6] drm: exynos: dsi: Move DSI init in bridge enable"), I get no
>>>>> display at all.
>>>>>
>>>>> A TM2e board with in-bridge (Exynos MIC) stops displaying anything 
>>>>> after
>>>>> applying patch "[PATCH v4 2/6] drm: exynos: dsi: Use drm 
>>>>> panel_bridge API".
>>>>>
>>>>> In case of the Arndale board with tc358764 bridge, no much 
>>>>> progress. The
>>>>> display is broken just after applying the "[PATCH v2] drm: bridge:
>>>>> tc358764: Use drm panel_bridge API" patch on top of linux-next.
>>>>>
>>>>> In all cases the I had "drm: of: Lookup if child node has panel or
>>>>> bridge" patch applied.
>>>> Just skip the 6/6 for now.
>>>>
>>>> Apply
>>>> - 
>>>> https://protect2.fireeye.com/v1/url?k=a24f3f76-fdd40659-a24eb439-0cc47a31cdf8-97ea12b4c5258d11&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1825%2F
>>>> - 
>>>> https://protect2.fireeye.com/v1/url?k=a226360f-fdbd0f20-a227bd40-0cc47a31cdf8-ebd66aebee1058d7&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1823%2F
>>>>
>>>> Then apply 1/6 to 5/6.  and update the status?
>>> Okay, my fault, I didn't check that case on Arndale.
>>>
>>> I've checked and indeed, Trats/Trats2 and Arndale works after the above
>>> 2 patches AND patches 1-5.
>>>
>>> The only problem is now on TM2e, which uses Exynos MIC as in-bridge for
>>> Exynos DSI:
>>>
>>> [    4.068866] [drm] Exynos DRM: using 13800000.decon device for DMA
>>> mapping operations
>>> [    4.069183] exynos-drm exynos-drm: bound 13800000.decon (ops
>>> decon_component_ops)
>>> [    4.128983] exynos-drm exynos-drm: bound 13880000.decon (ops
>>> decon_component_ops)
>>> [    4.129261] exynos-drm exynos-drm: bound 13930000.mic (ops
>>> exynos_mic_component_ops)
>>> [    4.133508] exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach]
>>> *ERROR* failed to find the bridge: -19
>>> [    4.136392] exynos-drm exynos-drm: bound 13900000.dsi (ops
>>> exynos_dsi_component_ops)
>>> [    4.145499] rc_core: Couldn't load IR keymap rc-cec
>>> [    4.145666] Registered IR keymap rc-empty
>>> [    4.148402] rc rc0: sii8620 as /devices/virtual/rc/rc0
>>> [    4.156051] input: sii8620 as /devices/virtual/rc/rc0/input1
>>> [    4.160647] exynos-drm exynos-drm: bound 13970000.hdmi (ops
>>> hdmi_component_ops)
>>> [    4.169923] exynos-drm exynos-drm: [drm] Cannot find any crtc or 
>>> sizes
>>> [    4.173958] exynos-drm exynos-drm: [drm] Cannot find any crtc or 
>>> sizes
>>> [    4.182304] [drm] Initialized exynos 1.1.0 20180330 for 
>>> exynos-drm on
>>> minor 0
>>>
>>> The display pipeline for TM2e is:
>>>
>>> Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel
>> If Trats/Trats2 is working then it has to work. I don't see any
>> difference in output pipeline. Can you please share the full log, I
>> cannot see host_attach print saying "Attached.."
>
> Well, there is a failure message about the panel:
>
> exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] *ERROR* failed 
> to find the bridge: -19
>
> however it looks that something might be broken in dts. The in-bridge 
> (Exynos MIC) is on port 0 and the panel is @0, what imho might cause 
> the issue.
>
> I've tried to change in in-bridge ('mic_to_dsi') port to 1 in 
> exynos5433.dtsi. Then the panel has been attached:
>
> exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] Attached s6e3hf2 
> device
>
> but the display is still not working, probably due to lack of proper 
> Exynos MIC handling. I will investigate it later and let You know.


I've played a bit with the Exynos DRM code and finally I made it working 
on TM2(e). There are basically 3 different issues that need to be fixed 
to get it working with the $subject patchset:

1. Port numbers in exynos5433 dsi/dts are broken. For all pre-Exynos5433 
boards the panel was defined as a DSI node child (at 'reg 0'), what 
means it used port 0. Then, Exynos5433 introduced so called RGB-in at 
port 0 and panel at port 1 (as described in the dt bindings). However 
the committed Exynos5433 dtsi and TM2(e) dts still defined panel as a 
DSI child (with reg=0, so port 0) and Exynos MIC as of-graph at port 0. 
The Exynos DSI code however always searched for a panel as a DSI child 
node, so it worked fine, even though the panel and exynos mic used in 
fact the 'port 0'. IMHO this can be fixed by the following patch:

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi 
b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index bfe4ed8a23d6..2718c752d916 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1046,8 +1046,8 @@
                                 #address-cells = <1>;
                                 #size-cells = <0>;

-                               port@0 {
-                                       reg = <0>;
+                               port@1 {
+                                       reg = <1>;
                                         dsi_to_mic: endpoint {
                                                 remote-endpoint = 
<&mic_to_dsi>;
                                         };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c 
b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index d2933a70c01f..e8e2df339c5f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -220,8 +220,8 @@ enum exynos_dsi_transfer_type {
  };

  enum {
-       DSI_PORT_IN,
-       DSI_PORT_OUT
+       DSI_PORT_OUT,
+       DSI_PORT_IN
  };

  struct exynos_dsi_transfer {
--

2. (devm_)drm_of_get_bridge() ignores panel's 'reg' property and it is 
unable to find a panel if there is a 'ports' child node (even if it 
describes completely different port than the one requested by the 
caller). I don't have time now to fix this, a simple and ugly workaround 
for that is to define the complete of-graph for the DSI child panel:

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts 
b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
index 22d26460f3dd..4726c325bd2c 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
@@ -58,6 +58,27 @@
                 vci-supply = <&ldo28_reg>;
                 reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
                 enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
+
+               ports {
+                       #address-cells = <1>;
+                       #size-cells = <0>;
+
+                       port@0 {
+                               reg = <0>;
+                               panel_to_dsi: endpoint {
+                                       remote-endpoint = <&dsi_to_panel>;
+                               };
+                       };
+               };
+       };
+
+       ports {
+               port@0 {
+                       reg = <0>;
+                       dsi_to_panel: endpoint {
+                               remote-endpoint = <&panel_to_dsi>;
+                       };
+               };
         };
  };

--

3. Lack of proper handling of the 'in-bridge' in the Exynos DSI after 
Your conversion. Initially I thought that this could be fixed with the 
following simple patch:

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c 
b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e8e2df339c5f..2fe9c995549f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -259,6 +259,7 @@ struct exynos_dsi {
         struct mipi_dsi_host dsi_host;
         struct drm_bridge bridge;
         struct drm_bridge *out_bridge;
+       struct drm_bridge *in_bridge;
         struct device *dev;

         void __iomem *reg_base;
@@ -1535,7 +1536,7 @@ static int exynos_dsi_host_attach(struct 
mipi_dsi_host *host,

         drm_bridge_add(&dsi->bridge);

-       drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
+       drm_bridge_attach(encoder, &dsi->bridge, dsi->in_bridge, 0);

         /*
          * This is a temporary solution and should be made by more 
generic way.
@@ -1674,7 +1675,6 @@ static int exynos_dsi_bind(struct device *dev, 
struct device *master,
         struct drm_encoder *encoder = &dsi->encoder;
         struct drm_device *drm_dev = data;
         struct device_node *in_bridge_node;
-       struct drm_bridge *in_bridge;
         int ret;

         printk("drm: %s enter\n", __func__);
@@ -1688,9 +1688,10 @@ static int exynos_dsi_bind(struct device *dev, 
struct device *master,
         }
         in_bridge_node = of_graph_get_remote_node(dev->of_node, 
DSI_PORT_IN, 0);
         if (in_bridge_node) {
-               in_bridge = of_drm_find_bridge(in_bridge_node);
-               if (in_bridge)
-                       drm_bridge_attach(encoder, in_bridge, NULL, 0);
+               dsi->in_bridge = of_drm_find_bridge(in_bridge_node);
+               if (dsi->in_bridge) {
+                       drm_bridge_attach(encoder, dsi->in_bridge, NULL, 0);
+               }
                 of_node_put(in_bridge_node);
         }

--

but it turned out that in such case the order of the bridge 'enable' 
calls is not correct for display pipeline operation. The one that 
actually works is (sorry for the hacky code):

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c 
b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e8e2df339c5f..51b568556fce 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -259,6 +259,7 @@ struct exynos_dsi {
         struct mipi_dsi_host dsi_host;
         struct drm_bridge bridge;
         struct drm_bridge *out_bridge;
+       struct drm_bridge *in_bridge;
         struct device *dev;

         void __iomem *reg_base;
@@ -1424,6 +1425,9 @@ static void exynos_dsi_atomic_pre_enable(struct 
drm_bridge *bridge,

         dsi->state |= DSIM_STATE_ENABLED;
         printk("drm: %s finish: %d\n", __func__, 0);
+
+       if (dsi->in_bridge)
+ dsi->in_bridge->funcs->pre_enable(dsi->in_bridge);
  }

  static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
@@ -1439,6 +1443,9 @@ static void exynos_dsi_atomic_enable(struct 
drm_bridge *bridge,

         printk("drm: %s finish: %d\n", __func__, 0);

+       if (dsi->in_bridge)
+ dsi->in_bridge->funcs->enable(dsi->in_bridge);
+
         return;
  }

@@ -1455,6 +1462,8 @@ static void exynos_dsi_atomic_disable(struct 
drm_bridge *bridge,
         dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
         printk("drm: %s finish: %d\n", __func__, 0);

+       if (dsi->in_bridge)
+ dsi->in_bridge->funcs->disable(dsi->in_bridge);
  }

  static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
@@ -1470,6 +1479,8 @@ static void exynos_dsi_atomic_post_disable(struct 
drm_bridge *bridge,

         printk("drm: %s finish: %d\n", __func__, 0);

+       if (dsi->in_bridge)
+ dsi->in_bridge->funcs->post_disable(dsi->in_bridge);
  }

  static void exynos_dsi_mode_set(struct drm_bridge *bridge,
@@ -1482,6 +1493,10 @@ static void exynos_dsi_mode_set(struct drm_bridge 
*bridge,

         drm_mode_copy(&dsi->mode, adjusted_mode);
         printk("drm: %s finish: %d\n", __func__, ret);
+
+       if (dsi->in_bridge)
+ dsi->in_bridge->funcs->mode_set(dsi->in_bridge, mode,
+                                               adjusted_mode);
  }

  static int exynos_dsi_attach(struct drm_bridge *bridge,
  @@ -1674,7 +1689,6 @@ static int exynos_dsi_bind(struct device *dev, 
struct device *master,
         struct drm_encoder *encoder = &dsi->encoder;
         struct drm_device *drm_dev = data;
         struct device_node *in_bridge_node;
-       struct drm_bridge *in_bridge;
         int ret;

         printk("drm: %s enter\n", __func__);
@@ -1688,9 +1702,11 @@ static int exynos_dsi_bind(struct device *dev, 
struct device *master,
         }
         in_bridge_node = of_graph_get_remote_node(dev->of_node, 
DSI_PORT_IN, 0);
         if (in_bridge_node) {
-               in_bridge = of_drm_find_bridge(in_bridge_node);
-               if (in_bridge)
-                       drm_bridge_attach(encoder, in_bridge, NULL, 0);
+               dsi->in_bridge = of_drm_find_bridge(in_bridge_node);
+               if (dsi->in_bridge) {
+                       drm_bridge_attach(encoder, dsi->in_bridge, NULL, 0);
+ INIT_LIST_HEAD(&encoder->bridge_chain);
+               }
                 of_node_put(in_bridge_node);
         }

--

I hope the above findings helps somehow in finishing this patchset. I'm 
not deep in the DRM bridge development, but it looks that there is 
something seriously broken in the design or Exynos MIC and DSI should 
not be modeled as bridges.

I will be on holidays till 10th Jan 2022.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

