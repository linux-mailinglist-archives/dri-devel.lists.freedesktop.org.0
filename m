Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F56B3F5E95
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 15:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C6289F99;
	Tue, 24 Aug 2021 13:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616D789F99
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 13:03:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210824130337euoutp02d7ea2644baaad8241887cd6ad4bef528~eP8HydGtA2721527215euoutp02C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 13:03:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210824130337euoutp02d7ea2644baaad8241887cd6ad4bef528~eP8HydGtA2721527215euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1629810217;
 bh=bb8pQFEXO/MIbUlxo4KF8yePNUpI8ibwbBLI5ne0iOI=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=cKfNjX4KwvwRQS0xZ/52vZlDSdLtT1zwN2289gLOWJmxYF//+q1vvAtxjf2QufKOU
 377RC9SWRqznOrLh3dKWnFVQ0kACtGt9kVnzs7tm4fz8ejMTOEJUVwOr6N1c4/ZosD
 4WfCMCPajz6N300x4BYvySBfgoAWkZnwSwmptz5E=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210824130336eucas1p14d92cd82544546a931fa58d8bb51796d~eP8HNfLhv1982019820eucas1p1w;
 Tue, 24 Aug 2021 13:03:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id A4.76.45756.82EE4216; Tue, 24
 Aug 2021 14:03:36 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210824130335eucas1p14f3a4a042dbfddf621c9ac6cff1f1319~eP8Gbyrfz1983619836eucas1p1o;
 Tue, 24 Aug 2021 13:03:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210824130335eusmtrp249c0a8ed21b857d5f83fa53f7b319193~eP8Ga2Tqx2079420794eusmtrp2G;
 Tue, 24 Aug 2021 13:03:35 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-b4-6124ee28a897
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 96.81.20981.72EE4216; Tue, 24
 Aug 2021 14:03:35 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210824130335eusmtip25128605e5ccfd5ace35f41a1250716e7~eP8FuEAzT0255502555eusmtip2P;
 Tue, 24 Aug 2021 13:03:35 +0000 (GMT)
Message-ID: <3132aa24-43ae-9f1e-01db-a66aaa9b4076@samsung.com>
Date: Tue, 24 Aug 2021 15:03:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0)
 Gecko/20100101 Thunderbird/92.0
Subject: Re: [PATCH v3 3/8] drm/mipi-dsi: Create devm device registration
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
In-Reply-To: <20210823084723.1493908-4-maxime@cerno.tech>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGKsWRmVeSWpSXmKPExsWy7djP87oa71QSDU5uU7XoPXeSyWL5mXXM
 Fle+vmezeD5/HaPFyTdXWSw6Jy5ht7i8aw6bxcKPW1ksZvz4x2hxqC/a4tOsh8wWK35uZbT4
 uWsei8WWNxNZHfg83t9oZfe4c+48m8fOWXfZPWZ3zGT1WLznJZPHiQmXmDzuXNvD5rH92wNW
 j3knAz3udx9n8lgy7Sqbx+bT1R6fN8kF8EZx2aSk5mSWpRbp2yVwZfzqmsBaMIm1ovP7OaYG
 xkUsXYycHBICJhLHtv9h72Lk4hASWMEose/iE1aQhJDAF0aJsxPsIBKfGSXut21kgum4fP0O
 I0RiOaPEze+7oNrfM0o8OnyZGaSKV8BOYvGx22A2i4CqxOvrq6DighInZz4B2y0qkCDxfOlX
 sKnCAp4S199MZQOxmQXEJZq+rGQFGSoi8JtZYkvzeaiEo8TNqcfA7mMT0JT4u/kmWJxTwFJi
 4YsWqBp5ieats5lBmiUEDnNKLFn6gR3ibheJmY++Qv0gLPHq+BaouIzE/53zoeL1EvdXtEA1
 dzBKbN2wkxkiYS1x59wvoA0cQBs0Jdbv0ocIO0rcWtPEChKWEOCTuPFWEOIGPolJ26YzQ4R5
 JTrahCCqFSXun90KNVBcYumFr2wTGJVmIQXLLCTvz0LyzSyEvQsYWVYxiqeWFuempxYb5qWW
 6xUn5haX5qXrJefnbmIEJsXT/45/2sE499VHvUOMTByMhxglOJiVRHj/MiknCvGmJFZWpRbl
 xxeV5qQWH2KU5mBREuddNXtNvJBAemJJanZqakFqEUyWiYNTqoHJYeU0q0Vfll44mFTkv267
 BivD/JMyvlXn9y9eqSjHeFHjaWyVy4sivWixv5u4YpXay/T2/jH+En+jwTst867oM5GgNzz6
 It+zOsReWZk6njC/FR148H5o4AFD1mol2aMH73ysObNx3oOHdZrbvNjm75yyZcmOJg59S1vn
 vENfX688q9X5b6GWYjjDg+jq0L2yxwtOvDzzXH9RAO/6zWUVqWtf8ukflmI/eK9M0+Zvkzfv
 tUfPuG7XRjvMVe2IZDh9xvDW+70zRGwdrENeL406/yTpwKy5UxdK/XPWc2456+fqZjPz/99L
 bsH/O6qnRddXtlVZp19KE5DOvnLrxzsfrSDpJVuuda2ZerJV/90SJZbijERDLeai4kQA+spK
 /vkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsVy+t/xe7rq71QSDe4fMrboPXeSyWL5mXXM
 Fle+vmezeD5/HaPFyTdXWSw6Jy5ht7i8aw6bxcKPW1ksZvz4x2hxqC/a4tOsh8wWK35uZbT4
 uWsei8WWNxNZHfg83t9oZfe4c+48m8fOWXfZPWZ3zGT1WLznJZPHiQmXmDzuXNvD5rH92wNW
 j3knAz3udx9n8lgy7Sqbx+bT1R6fN8kF8Ebp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZ
 GpvHWhmZKunb2aSk5mSWpRbp2yXoZfzqmsBaMIm1ovP7OaYGxkUsXYycHBICJhKXr99h7GLk
 4hASWMoo0XK7AyohLrF7/ltmCFtY4s+1LjaIoreMEosPLWMHSfAK2EksPnYbrIhFQFXi9fVV
 zBBxQYmTM5+ADRIVSJDYfbgLrF5YwFPi+pupbCA2M9CCpi8rWUFsEYG/zBJfFsVCxB0lbk49
 xgqxbDejxP0t7WBD2QQ0Jf5uvgnWzClgKbHwRQvUIDOJrq1djBC2vETz1tnMExiFZiG5YxaS
 fbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYBrYduznlh2MK1991DvEyMTB
 eIhRgoNZSYT3L5NyohBvSmJlVWpRfnxRaU5q8SFGU2BgTGSWEk3OByaivJJ4QzMDU0MTM0sD
 U0szYyVxXpMja+KFBNITS1KzU1MLUotg+pg4OKUamGZwm+1uZ722g195XvBcqbgygQBDj82f
 rHXDWPSDjddteq6uo/SiLSN75jzTKIml/14acLawiQZ0xIV+3re3I7g0ualRcMnjzbsOLwlK
 Up77oEbJZnvd0tDF4pV3VontkeGvOeUa9VTfcoXO6c097pv2LOOcL5PCMK/uQWiLNp9W/OMH
 G876yH5N1Nz+IiPEq3/b/g27rh+fmOtp/e/XFU/DW6uuX311ft3Uyysn3z16dspiQ+6JgVvv
 9ZxN3vKpsPSq8KEFs5/PPte1mO1K6euo2x+vd++1K91d+OvJ/z0NKz47HrminHw911T2SNP3
 dYlL31j/C3JO8pY3tPbafyjFdvtCn6sPPsqu3r+kePZKJZbijERDLeai4kQAggqi9owDAAA=
X-CMS-MailID: 20210824130335eucas1p14f3a4a042dbfddf621c9ac6cff1f1319
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210823084759eucas1p2fadefcbf8b70a88c7f3c062a74b701d7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210823084759eucas1p2fadefcbf8b70a88c7f3c062a74b701d7
References: <20210823084723.1493908-1-maxime@cerno.tech>
 <CGME20210823084759eucas1p2fadefcbf8b70a88c7f3c062a74b701d7@eucas1p2.samsung.com>
 <20210823084723.1493908-4-maxime@cerno.tech>
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


W dniu 23.08.2021 o 10:47, Maxime Ripard pisze:
> Devices that take their data through the MIPI-DSI bus but are controlled
> through a secondary bus like I2C have to register a secondary device on
> the MIPI-DSI bus through the mipi_dsi_device_register_full() function.
>
> At removal or when an error occurs, that device needs to be removed
> through a call to mipi_dsi_device_unregister().
>
> Let's create a device-managed variant of the registration function that
> will automatically unregister the device at unbind.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
