Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81F524D2D
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 12:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F360892E4;
	Tue, 21 May 2019 10:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F946892E4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 10:50:02 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190521105000euoutp010bf995ad0050a40095abbe8f5ce6f68d~grRqhOf2M2274222742euoutp01C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 10:50:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190521105000euoutp010bf995ad0050a40095abbe8f5ce6f68d~grRqhOf2M2274222742euoutp01C
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190521105000eucas1p2de8daa7b95a6cb95f22c55b0aa3017a0~grRqJEwjG2901629016eucas1p2t;
 Tue, 21 May 2019 10:50:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 7C.B4.04298.8D7D3EC5; Tue, 21
 May 2019 11:50:00 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190521104959eucas1p14de9d183967e7f50bfede732d3fd8764~grRpWSfWJ0449704497eucas1p17;
 Tue, 21 May 2019 10:49:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190521104959eusmtrp1125d2801ddbdde695f772d7737f1f3a5~grRpVQ2wS1426514265eusmtrp1n;
 Tue, 21 May 2019 10:49:59 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-e4-5ce3d7d898ab
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id FA.A4.04140.7D7D3EC5; Tue, 21
 May 2019 11:49:59 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190521104959eusmtip19adb8d743f0d05719dbe628d27bb5007~grRpIn8l22509625096eusmtip1C;
 Tue, 21 May 2019 10:49:59 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2] video: fbdev: pxa168fb: add COMPILE_TEST support
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <1059f924-7bbb-37b1-42ee-52cad878f572@samsung.com>
Date: Tue, 21 May 2019 12:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleLIzCtJLcpLzFFi42LZduznOd0b1x/HGPz8JmBx5et7NosTfR9Y
 LS7vmsPmwOxxv/s4k8fnTXIBTFFcNimpOZllqUX6dglcGQ2njzEXrGer2Nwa08C4nrWLkZND
 QsBE4urvCyxdjFwcQgIrGCXOnTwJ5XxhlNi66i0bhPOZUeLonfMsMC27Hk2CqlrOKNH4fB0j
 hPMWqP/YS0aQKjYBK4mJ7auAbA4OYQEXiSVPKkHCIgIJEiumzwAr4RWwk7j59wPYHSwCqhKf
 N+xkB7FFBSIk7h/bwApRIyhxcuYTsMXMAuISt57MZ4Kw5SW2v53DDLJXQuA6m8SHX9cYIa5z
 kVh+5xzUpcISr45vYYewZSROT+5hgWhYxyjxt+MFVPd2Ronlk/+xQVRZSxw+fpEV5GpmAU2J
 9bv0IcKOEk1PNzGBhCUE+CRuvBWEOIJPYtK26cwQYV6JjjYhiGo1iQ3LNrDBrO3auZIZwvaQ
 +Hr2GgtIuZBArMTJKwETGBVmIflyFpIvZyH5chbCOQsYWVYxiqeWFuempxYb5qWW6xUn5haX
 5qXrJefnbmIEpo7T/45/2sH49VLSIUYBDkYlHt6MKY9ihFgTy4orcw8xSnAwK4nwnj4FFOJN
 SaysSi3Kjy8qzUktPsQozcGiJM5bzfAgWkggPbEkNTs1tSC1CCbLxMEp1cDI2hR19F3fMeWe
 OLkFJbEus97eV5yirCBeY7r3T+WkmVmSZUqZqz/Neiu41c0n5UbQ7uJ5WSG7mO/82jUrm4cr
 /mmCsq7c0oDySvVDmvNWRK39rPXnaNIGx9q3M+d9MV0rMeWI1JQ0xYOh0krLdCMK+xLEv+73
 f1ny7Unh+Xlzf9/4eL7nUckEJZbijERDLeai4kQAzCkFnRkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsVy+t/xu7rXrz+OMXj7Qt3iytf3bBYn+j6w
 WlzeNYfNgdnjfvdxJo/Pm+QCmKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxM
 lfTtbFJSczLLUov07RL0MhpOH2MuWM9Wsbk1poFxPWsXIyeHhICJxK5Hk1i6GLk4hASWMkr0
 3t7H3MXIAZSQkTi+vgyiRljiz7UuNoia14wSc8+dAmtmE7CSmNi+ihGkXljARWLJk0qQsIhA
 gsTT1/PZQGxeATuJm38/gJWzCKhKfN6wkx3EFhWIkDjzfgULRI2gxMmZT8BsZgF1iT/zLjFD
 2OISt57MZ4Kw5SW2v53DPIGRfxaSlllIWmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0
 veT83E2MwADfduznlh2MXe+CDzEKcDAq8fBmTHkUI8SaWFZcmXuIUYKDWUmE9/QpoBBvSmJl
 VWpRfnxRaU5q8SFGU6CHJjJLiSbnA6MvryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2
 ampBahFMHxMHp1QD4xUTfv5ZD86lykWaX96y6azDO74daxd/9DdiOM+0+q/VgoacG/mMaUeX
 f5Gv3TjPTP13f2rpJPlF6hFBZVxsJ3M/p4kcna7hcfCM0TLjME47nulv7/5Z1e/ae1ft8ALX
 e7b/9CTknohy6XxZ3/wk+ogkA+/r+wvETzt9TPzLdc6/c2/JaZUnN5VYijMSDbWYi4oTAXSw
 6R+GAgAA
X-CMS-MailID: 20190521104959eucas1p14de9d183967e7f50bfede732d3fd8764
X-Msg-Generator: CA
X-RootMTR: 20190521104959eucas1p14de9d183967e7f50bfede732d3fd8764
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190521104959eucas1p14de9d183967e7f50bfede732d3fd8764
References: <CGME20190521104959eucas1p14de9d183967e7f50bfede732d3fd8764@eucas1p1.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558435800;
 bh=dVrDy17Ux0GSIhBmM0IvoBwOz6MznLg3cinUw4GbxOo=;
 h=From:Subject:To:Date:References:From;
 b=Hloqy+7Or3Z4CTSJWG32MYQsvW8jhgV2SahtZrhCP7yhSJ2r8aXE714HNqlMwbYrG
 eB0OIatPJWds08bFlJUjjHeW7uyvJxKwd8gjnX3HZPXuRiSlZ6/NJNxQ0aCUdffQl9
 pW6FfUOOK0Z9kSBsJsEVcFGo0kb5qyXpJkGSFfx0=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIENPTVBJTEVfVEVTVCBzdXBwb3J0IHRvIHB4YTE2OGZiIGRyaXZlciBmb3IgYmV0dGVyIGNv
bXBpbGUKdGVzdGluZyBjb3ZlcmFnZS4KClNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9sbmll
cmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KLS0tCnYyOiBhZGQgbWlzc2luZyBI
QVZFX0NMSyAmJiBIQVMgSU9NRU0gZGVwZW5kZW5jaWVzCgogZHJpdmVycy92aWRlby9mYmRldi9L
Y29uZmlnIHwgICAgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCkluZGV4OiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZwo9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZworKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L0tjb25maWcKQEAgLTE3MjksNyArMTcyOSw4IEBAIGNvbmZpZyBGQl82ODMyOAogCiBjb25m
aWcgRkJfUFhBMTY4CiAJdHJpc3RhdGUgIlBYQTE2OC85MTAgTENEIGZyYW1lYnVmZmVyIHN1cHBv
cnQiCi0JZGVwZW5kcyBvbiBGQiAmJiAoQ1BVX1BYQTE2OCB8fCBDUFVfUFhBOTEwKQorCWRlcGVu
ZHMgb24gRkIgJiYgSEFWRV9DTEsgJiYgSEFTX0lPTUVNCisJZGVwZW5kcyBvbiBDUFVfUFhBMTY4
IHx8IENQVV9QWEE5MTAgfHwgQ09NUElMRV9URVNUCiAJc2VsZWN0IEZCX0NGQl9GSUxMUkVDVAog
CXNlbGVjdCBGQl9DRkJfQ09QWUFSRUEKIAlzZWxlY3QgRkJfQ0ZCX0lNQUdFQkxJVApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
