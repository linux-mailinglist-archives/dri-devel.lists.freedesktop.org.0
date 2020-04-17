Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E535A1ADF02
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DBD6EC15;
	Fri, 17 Apr 2020 14:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AE26EC15
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:08:12 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200417140810euoutp021f8fdb8a37564fb0d2db79816d8a5bd3~GoJdlBQ8T1552515525euoutp02w
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:08:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200417140810euoutp021f8fdb8a37564fb0d2db79816d8a5bd3~GoJdlBQ8T1552515525euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587132490;
 bh=fLaWqIeK65/g1ahWZCdiAY0bKhithxNEwtt9QffX0Rs=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=AxeZOeIz6Oyw6NXEZ7HTVwftvZmoLd35738hBGEqSr7FRe3DnHz813+DmeRCzF16w
 jJC6ud2LU85S7LmDgEj9Td/XiSMvZBXECBLCvJIGVY+/UJsCpL7o/G2HzQ8Y01btNq
 FeQSMqnCD6tkmJ5POCeNtpV5JDB489MnFrL6/UN0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200417140810eucas1p24b8b56eb6790fb89ee0357889ea25283~GoJdb66MB1677816778eucas1p2l;
 Fri, 17 Apr 2020 14:08:10 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 17.5C.61286.A48B99E5; Fri, 17
 Apr 2020 15:08:10 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200417140810eucas1p1b57dacb13bd60223b474d37d5c3d12df~GoJdIRCMv0071400714eucas1p1M;
 Fri, 17 Apr 2020 14:08:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200417140810eusmtrp119c960141c4878ddddfa1d8806202662~GoJdHsbzd2228222282eusmtrp1K;
 Fri, 17 Apr 2020 14:08:10 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-5a-5e99b84a9bb8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7E.C2.08375.A48B99E5; Fri, 17
 Apr 2020 15:08:10 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140809eusmtip247323fbec38e30efe3efec7945989bbc~GoJcoSBqD2969929699eusmtip2g;
 Fri, 17 Apr 2020 14:08:09 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: aty128fb: remove unused 'sdr_64'
To: Jason Yan <yanaijie@huawei.com>
Message-ID: <aec78fff-4a5b-1222-7758-99e9ea892a0c@samsung.com>
Date: Fri, 17 Apr 2020 16:08:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200417092318.13978-1-yanaijie@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7djP87peO2bGGUzdqGqx8OFdZosrX9+z
 WfxffoXR4kTfB1aLy7vmsFmsObKY3WLRnk5mB3aPvd8WsHi0HHnL6nG/+ziTx9xdfYwenzfJ
 BbBGcdmkpOZklqUW6dslcGX8efCfqWAdV8WHjddZGxj/sXcxcnJICJhIzLg5C8jm4hASWMEo
 0djRwwrhfGGU2HZ7DzOE85lRYsqPp6wwLW17X7FAJJYzSmxpfQrV/5ZR4vmN/2BVbAJWEhPb
 VzGC2MICzhIv35wAWygioCzReH862A5mgTWMEsv3L2LqYuTg4BWwk7i+MQSkhkVAVeL/y/1g
 vaICERKfHhwGm8krIChxcuYTFhCbU8BS4ujSL8wgNrOAuMStJ/OZIGx5ieats8HOlhDYxi7x
 /eonFoizXSRmz5nPDGELS7w6vgUaAjISpyf3sEA0rGOU+NvxAqp7O9B1k/+xQVRZS9w594sN
 5FJmAU2J9bv0IcKOEkdXzWUGCUsI8EnceCsIcQSfxKRt06HCvBIdbUIQ1WoSG5ZtYINZ27Vz
 JfMERqVZSF6bheSdWUjemYWwdwEjyypG8dTS4tz01GLDvNRyveLE3OLSvHS95PzcTYzANHT6
 3/FPOxi/Xko6xCjAwajEw2vQMzNOiDWxrLgy9xCjBAezkgjvQTegEG9KYmVValF+fFFpTmrx
 IUZpDhYlcV7jRS9jhQTSE0tSs1NTC1KLYLJMHJxSDYy1i09uXZKsn8aeJjX1okTJrzkJbms1
 qtP3hnWlqkw//qr8iob1vWcb018/CH6tXCWmwmOqXjx5UdmCcPkZ/16aeE2zP8P3L1+4ROGN
 2YuIUNn4opXv/tyvfRv5OU2v181Ub8Kc2RXf9nUdTUqMFWDna68OMCned3HGC/+UqlOvuaVW
 fJu845ESS3FGoqEWc1FxIgDOsWHkPwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRmVeSWpSXmKPExsVy+t/xe7peO2bGGfw9zG2x8OFdZosrX9+z
 WfxffoXR4kTfB1aLy7vmsFmsObKY3WLRnk5mB3aPvd8WsHi0HHnL6nG/+ziTx9xdfYwenzfJ
 BbBG6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GX8
 efCfqWAdV8WHjddZGxj/sXcxcnJICJhItO19xdLFyMUhJLCUUeLP541ADgdQQkbi+PoyiBph
 iT/XuthAbCGB14wSk7aIg9hsAlYSE9tXMYLYwgLOEi/fnACbKSKgLNF4fzoriM0ssIZRYupE
 Noj5PYwSL063soHM5xWwk7i+MQSkhkVAVeL/y/1gc0QFIiQO75gFZvMKCEqcnPmEBcTmFLCU
 OLr0CzPETHWJP/MuQdniEreezGeCsOUlmrfOZp7AKDQLSfssJC2zkLTMQtKygJFlFaNIamlx
 bnpusaFecWJucWleul5yfu4mRmDEbTv2c/MOxksbgw8xCnAwKvHwGvTMjBNiTSwrrsw9xCjB
 wawkwnvQDSjEm5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cBkkFcSb2hqaG5haWhubG5sZqEk
 ztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgTFs/tTm4KT+u61rlC8nKsbq+kdN2vSuu+POvWjl
 vTb1C0SS2Fa1eehYpmkJWr0Ntv37e9+55pxj0g/jXFy46lfa/FLb9GG71V5fj6Sqznuztmkd
 Oxkcb/333/+krZeEDV8kGF/Rt8xbsdrpvbbkoUUzpxwytDuhtKRJKuy+U+bcqoarjk/qLiqx
 FGckGmoxFxUnAgBtblGRzgIAAA==
X-CMS-MailID: 20200417140810eucas1p1b57dacb13bd60223b474d37d5c3d12df
X-Msg-Generator: CA
X-RootMTR: 20200417085705eucas1p12357601660992a5fbef90358cc7aa219
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200417085705eucas1p12357601660992a5fbef90358cc7aa219
References: <CGME20200417085705eucas1p12357601660992a5fbef90358cc7aa219@eucas1p1.samsung.com>
 <20200417092318.13978-1-yanaijie@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hulk Robot <hulkci@huawei.com>, paulus@samba.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDQvMTcvMjAgMTE6MjMgQU0sIEphc29uIFlhbiB3cm90ZToKPiBGaXggdGhlIGZvbGxvd2lu
ZyBnY2Mgd2FybmluZzoKPiAKPiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHkxMjhmYi5jOjMz
NzozNjogd2FybmluZzog4oCYc2RyXzY04oCZIGRlZmluZWQgYnV0Cj4gbm90IHVzZWQgWy1XdW51
c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdHkxMjhfbWVtaW5m
byBzZHJfNjQgPSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
Cj4gCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEphc29uIFlhbiA8eWFuYWlqaWVAaHVhd2VpLmNvbT4KClBhdGNoIHF1ZXVlZCBm
b3IgdjUuOCwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3
aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwoKPiAt
LS0KPiAgZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5MTI4ZmIuYyB8IDE0IC0tLS0tLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5MTI4ZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
YXR5L2F0eTEyOGZiLmMKPiBpbmRleCBkN2U0MWM4ZGQ1MzMuLmQwNWQ0MTk1YWNhZCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHkxMjhmYi5jCj4gKysrIGIvZHJpdmVy
cy92aWRlby9mYmRldi9hdHkvYXR5MTI4ZmIuYwo+IEBAIC0zMzQsMjAgKzMzNCw2IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgYXR5MTI4X21lbWluZm8gc2RyXzEyOCA9IHsKPiAgCS5uYW1lID0gIjEy
OC1iaXQgU0RSIFNHUkFNICgxOjEpIiwKPiAgfTsKPiAgCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qg
YXR5MTI4X21lbWluZm8gc2RyXzY0ID0gewo+IC0JLk1MID0gNCwKPiAtCS5NQiA9IDgsCj4gLQku
VHJjZCA9IDMsCj4gLQkuVHJwID0gMywKPiAtCS5Ud3IgPSAxLAo+IC0JLkNMID0gMywKPiAtCS5U
cjJ3ID0gMSwKPiAtCS5Mb29wTGF0ZW5jeSA9IDE3LAo+IC0JLkRzcE9uID0gNDYsCj4gLQkuUmxv
b3AgPSAxNywKPiAtCS5uYW1lID0gIjY0LWJpdCBTRFIgU0dSQU0gKDE6MSkiLAo+IC19Owo+IC0K
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdHkxMjhfbWVtaW5mbyBzZHJfc2dyYW0gPSB7Cj4gIAku
TUwgPSA0LAo+ICAJLk1CID0gNCwKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
