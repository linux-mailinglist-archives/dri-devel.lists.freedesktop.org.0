Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE4925F9D8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 13:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CBE6E301;
	Mon,  7 Sep 2020 11:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1EF6E301
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 11:49:37 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200907114934epoutp03bf3d2c79f8d9b59049b56202a2b6ab57~yfgRX4Wcl0143501435epoutp03h
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 11:49:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200907114934epoutp03bf3d2c79f8d9b59049b56202a2b6ab57~yfgRX4Wcl0143501435epoutp03h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599479374;
 bh=JuJEikmWQ9aFfoxm8rT1yo9Xqd5OSbSLucviXZCpLU8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=qHlnUdukYTtW1xw4wQnzSIlKhcAr+z6SAaSBSTAzGzWy58eNkfnuyQQYwEe2W5ohr
 0Ays4+pi1EBiVVz1XgUc2lVn9F5lzeQ7pwmDmIFmDbLykhEPu3AVwyJGPwF2fVlyja
 ao1IQ49vUi/f9FQYlqHN7AtRmAS7RhLDdtiI/0sA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200907114934epcas1p3ac102e5d964a9b8209008cec692e9914~yfgQ9iuNk2657026570epcas1p3i;
 Mon,  7 Sep 2020 11:49:34 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.152]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4BlRQh18YMzMqYkY; Mon,  7 Sep
 2020 11:49:32 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 EE.AF.18978.B4E165F5; Mon,  7 Sep 2020 20:49:32 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200907114930epcas1p4156f15f93e18b0824dc366033f9d82df~yfgN1-Dob1148911489epcas1p4a;
 Mon,  7 Sep 2020 11:49:30 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200907114930epsmtrp1a1d2cf27cd08ae880c50d6835a3b908d~yfgN1JghN3100631006epsmtrp1c;
 Mon,  7 Sep 2020 11:49:30 +0000 (GMT)
X-AuditID: b6c32a35-5edff70000004a22-dc-5f561e4bc92d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E1.0B.08382.A4E165F5; Mon,  7 Sep 2020 20:49:30 +0900 (KST)
Received: from [10.113.111.64] (unknown [10.113.111.64]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200907114930epsmtip209df81b3885b5496fea475ad45e0b04c~yfgNizmuu1278912789epsmtip2y;
 Mon,  7 Sep 2020 11:49:30 +0000 (GMT)
Subject: Re: [PATCH v5 00/80] drm/vc4: Support BCM2711 Display Pipeline
To: Maxime Ripard <maxime@cerno.tech>, Nicolas Saenz Julienne
 <nsaenzjulienne@suse.de>, Eric Anholt <eric@anholt.net>
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Message-ID: <cca5234f-e1e8-b642-048b-b710f402409d@samsung.com>
Date: Mon, 7 Sep 2020 20:49:12 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAJsWRmVeSWpSXmKPExsWy7bCmnq6PXFi8wfWljBZre4+yWLydu5jF
 Yv6Rc6wWV76+Z7M40HiZ0eL98i42i51X1rJYbHp8jdXi8q45bBYTb29gt5jx4x+jxbZZy9ks
 1t16zWbRuvcIu8W/axtZLB5Nvc/oIODR9P4Ym8es+2fZPO6cO8/msXPWXXaPTas62Tzudx9n
 8ti8pN6j9egvFo++LasYPTafrvb4vEkugDsq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzA
 UNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6B8lhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFK
 ToFlgV5xYm5xaV66XnJ+rpWhgYGRKVBhQnZG74P1TAVzBCrO/njE2sB4m6eLkZNDQsBE4nn/
 Q2YQW0hgB6NEe4N5FyMXkP2JUeLKu79MEM43Rolr/7exwXTce7aCBSKxF6jj2gso5y2jxNqV
 U1m7GDk4hAXcJRo2mYM0iAiUS7R37gdbwSzwnFni2EVOEJtNQFfia891JhCbV8BO4sbRw2A2
 i4CKxO+Ox+wgtqhApMTOpy/ZIWoEJU7OfMICYnMKpEqsWHYAaqa8xPa3c6BscYlbT+aDXS0h
 8IND4vP2XVBXu0g8urOPGcIWlnh1fAs7hC0l8bK/Dcoulrgy8xULRHMDo0T/xNlQCWOJ/Usn
 M4E8xiygKbF+lz5EWFFi5++5jBCL+STefe0B+11CgFeio00IokRN4lnDAVYIW0biVO9yJgjb
 Q2LVwWfMExgVZyF5bRaSd2YheWcWwuIFjCyrGMVSC4pz01OLDQsMkSN7EyM4qWuZ7mCc+PaD
 3iFGJg7GQ4wSHMxKIrxdh0LjhXhTEiurUovy44tKc1KLDzGaAgN7IrOUaHI+MK/klcQbmhoZ
 GxtbmBiamRoaKonzPrylEC8kkJ5YkpqdmlqQWgTTx8TBKdXAFJj3e9I0+d9Ns0Qm6f0y3xbL
 t2R1x6RFvGonG3O+NTDszHy+baKV3u8Go1Cfe9a5XCf05/UaFG6Tmh/E6tGitXc5+/5SyxgD
 0ehujobijTUl5l+YuV0npLyq/Fnx6fl1z7XOB7YtXvqt/4urTZpXQWdKlNaGizYMl7v1zmx6
 +13qqO/BGLn5ou5flv+dIHP5yOJX/4NeNOzxtFiR1Rj6Rts51OHb5M1Pktb2bVl29MVFiXnn
 zOSuJaz3M516dv0HnmirJ7kZ/qm/Z0VfmaR/dvMBJYk3G+ovhJt+nMQcWqN02DL+zLlJqkX3
 9JuKTl08NH2G59kkhvnyutyfN8VoHRVRm3f2/nPfqsrwzrgbXEosxRmJhlrMRcWJAJ1RhF1z
 BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsWy7bCSvK6XXFi8wa2j5hZre4+yWLydu5jF
 Yv6Rc6wWV76+Z7M40HiZ0eL98i42i51X1rJYbHp8jdXi8q45bBYTb29gt5jx4x+jxbZZy9ks
 1t16zWbRuvcIu8W/axtZLB5Nvc/oIODR9P4Ym8es+2fZPO6cO8/msXPWXXaPTas62Tzudx9n
 8ti8pN6j9egvFo++LasYPTafrvb4vEkugDuKyyYlNSezLLVI3y6BK6P3wXqmgjkCFWd/PGJt
 YLzN08XIySEhYCJx79kKli5GLg4hgd2MEtuOfWCDSMhIrOrfwtrFyAFkC0scPlwMUfOaUWL+
 jQPsIHFhAXeJhk3mIOUiApUSn+fsYgapYRZ4zixxYc97JoiGHYwSLw5cZQSpYhPQlfjac50J
 xOYVsJO4cfQwmM0ioCLxu+Mx2FBRgUiJnTssIUoEJU7OfMICYnMKpEqsWHaAGcRmFjCTmLf5
 IZQtL7H97RwoW1zi1pP5TBMYhWYhaZ+FpGUWkpZZSFoWMLKsYpRMLSjOTc8tNiwwzEst1ytO
 zC0uzUvXS87P3cQIjmMtzR2M21d90DvEyMTBeIhRgoNZSYS361BovBBvSmJlVWpRfnxRaU5q
 8SFGaQ4WJXHeG4UL44QE0hNLUrNTUwtSi2CyTBycUg1M7W6C91iztvVWVeQ8ebDX6T3DFnf2
 qt5VJgtFJWdstlVkq8tQP7XhgcqdttbqtN/3Jl/Qqf4x8ajLmbeb2w9WpGpudS0PX711MrvS
 otPOti8+rV/22yTx6FvponJzTz8vtZcm0ao8PpNfqekrzZWb/+mn3PRzHD+Ul1xT51u+mZun
 ZFPDw2sqf++9m/u07md0LE+yO6N9Vem1enMrjwrNid/2rPu98Jhl/ao5wfN9UlNZKplmqHpL
 P779PKhuq90l69cXyq5+bd6+lffJb/kpi9ut6/t5H13R/uzAdpfDJ/GgWtihVUUBHBy7ugSb
 X+ee8jPeeiVZUfm082y2u2ZhZdn1CXMaOjguF16fW3tLiaU4I9FQi7moOBEAIfEHLFIDAAA=
X-CMS-MailID: 20200907114930epcas1p4156f15f93e18b0824dc366033f9d82df
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200904071259epcas1p3de4209531c0bc5ed6ea9ef19827b6ed5
References: <CGME20200904071259epcas1p3de4209531c0bc5ed6ea9ef19827b6ed5@epcas1p3.samsung.com>
 <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 9/3/20 5:00 PM, Maxime Ripard wrote:
> Hi everyone,
>
> Here's a (pretty long) series to introduce support in the VC4 DRM driver
> for the display pipeline found in the BCM2711 (and thus the RaspberryPi 4).
>
> The main differences are that there's two HDMI controllers and that there's
> more pixelvalve now. Those pixelvalve come with a mux in the HVS that still
> have only 3 FIFOs. Both of those differences are breaking a bunch of
> expectations in the driver, so we first need a good bunch of cleanup and
> reworks to introduce support for the new controllers.
>
> Similarly, the HDMI controller has all its registers shuffled and split in
> multiple controllers now, so we need a bunch of changes to support this as
> well.
>
> Only the HDMI support is enabled for now (even though the DPI and DSI
> outputs have been tested too).
>
> Let me know if you have any comments
> Maxime
>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: devicetree@vger.kernel.org
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
>
> Changes from v4:
>    - Rebased on top of next-20200828
>    - Collected the various tags
>    - Fixed some issues with 4k support and dual output (thanks Hoegeun!)

Thanks for your v5 patchset.

I tested all patches based on the next-20200812.

Everything else is fine, but the dual hdmi modetest doesn't work well in my
environment...

In my environment, dsi is not connected, I have seen your answer[1].

Do you have any other settings? For example in config.txt.


[1] https://lkml.org/lkml/2020/9/2/566

>    - Fixed typos in commit logs (thanks Dave!)
>    - Split the csc setup hook into its own patch again
>    - Added the CEC clock to the DT binding
>    - Fixed the DT binding example
>    - Reduced the number of calls to of_device_is_compatible in vc4_kms_load
>    - Added back the check for the state commit in our commit hook

Best regards,

Hoegeun

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
