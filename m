Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1443759860
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 12:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199B96E8CD;
	Fri, 28 Jun 2019 10:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E7B6E8CD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:27:56 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628102755euoutp0256a706107834ee0a2ac891762967eb90~sVfOpTDjA2641226412euoutp02O
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:27:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190628102755euoutp0256a706107834ee0a2ac891762967eb90~sVfOpTDjA2641226412euoutp02O
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190628102755eucas1p13eea98a7e53b27980b995e5dbdcdbb4f~sVfODwN5O1398813988eucas1p1J;
 Fri, 28 Jun 2019 10:27:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 95.FF.04325.AABE51D5; Fri, 28
 Jun 2019 11:27:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190628102754eucas1p283e1ad580a242323137a4b6c7024028c~sVfNShlCk0105401054eucas1p2m;
 Fri, 28 Jun 2019 10:27:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190628102754eusmtrp1a2a1cdb60391acefd19dbd378702a250~sVfNEbRd01758517585eusmtrp1J;
 Fri, 28 Jun 2019 10:27:54 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-cf-5d15ebaacabb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A8.8A.04146.9ABE51D5; Fri, 28
 Jun 2019 11:27:54 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190628102753eusmtip2e8a5388597214e975461aa5455e6fff7~sVfMrJtwU1098610986eusmtip2f;
 Fri, 28 Jun 2019 10:27:53 +0000 (GMT)
Subject: Re: [PATCH 3/3] video: fbdev: don't print error message on
 framebuffer_alloc() failure
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Message-ID: <4a534d3e-0ce6-9dfd-b3f2-e69aa0a1fcd8@samsung.com>
Date: Fri, 28 Jun 2019 12:27:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3da197ed-a701-2aa7-d775-2bdbe9deab4a@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7djP87qrXovGGjw8bWZxfcpmVotzk14z
 W1z5+p7N4tbxVkaLE30fWC1ufvrGanF51xw2B3aPTas62TzezBXwuN99nMnj/b6rbB6fN8kF
 sEZx2aSk5mSWpRbp2yVwZTy8tIG5YDVrxd0tG9kaGPeydDFyckgImEgc2/SduYuRi0NIYAWj
 RPOk00wQzhdGiQtfj7FCOJ8ZJVYv/sIE03L43CFGiMRyRomtS09D9b9llHjwdT87SJWwQKLE
 hx8LwDrYBKwkJravYgSxRQRqJeY39IHtYBaYwiix8/BhVpAEr4CdxMrLq8CuYhFQlbjceBys
 QVQgQuL+sQ1QNYISJ2c+AavhFLCXuPbxPhuIzSwgLnHryXwmCFteonnrbLCLJAS2sUvs2PgP
 6lUXibkN55khbGGJV8e3sEPYMhKnJ/ewQDSsY5T42/ECqns7o8Tyyf/YIKqsJQ4fvwh0BgfQ
 Ck2J9bv0IcKOEl83rmECCUsI8EnceCsIcQSfxKRt05khwrwSHW1CENVqEhuWbWCDWdu1cyXz
 BEalWUhem4XknVlI3pmFsHcBI8sqRvHU0uLc9NRi47zUcr3ixNzi0rx0veT83E2MwDR0+t/x
 rzsY9/1JOsQowMGoxMOrsFMkVog1say4MvcQowQHs5IIr+Q5oBBvSmJlVWpRfnxRaU5q8SFG
 aQ4WJXHeaoYH0UIC6YklqdmpqQWpRTBZJg5OqQbG5Pyz59LOSy1S5p2b5/HDenNlmYpGhJ1P
 3NUJee7FRSFsH1PaG788WJSfWr6V+3rJl6/KLA6aHZ63LGujOkL8duV7T3IKl0t64VC7U9Xs
 /vTpSZJ/HYRN+2Uy5s8Q7lnV9/pBdYG44MOmn3fMjG42aTXovt+5rJJDlXMey+OTNx5Gq96K
 PqnEUpyRaKjFXFScCAAdKagpPwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRmVeSWpSXmKPExsVy+t/xe7qrXovGGjxXtLg+ZTOrxblJr5kt
 rnx9z2Zx63gro8WJvg+sFjc/fWO1uLxrDpsDu8emVZ1sHm/mCnjc7z7O5PF+31U2j8+b5AJY
 o/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyHl7a
 wFywmrXi7paNbA2Me1m6GDk5JARMJA6fO8TYxcjFISSwlFHi99Sd7F2MHEAJGYnj68sgaoQl
 /lzrYoOoec0o8fXELVaQhLBAosSHHwuYQGw2ASuJie2rGEFsEYFaiYnL/7OANDALTGOUONzX
 zAySEBKwkziw5AobiM0LZK+8vArsChYBVYnLjcfBmkUFIiTOvF/BAlEjKHFy5hMwm1PAXuLa
 x/tgvcwC6hJ/5l1ihrDFJW49mc8EYctLNG+dzTyBUWgWkvZZSFpmIWmZhaRlASPLKkaR1NLi
 3PTcYkO94sTc4tK8dL3k/NxNjMCI23bs5+YdjJc2Bh9iFOBgVOLhVdgpEivEmlhWXJl7iFGC
 g1lJhFfyHFCINyWxsiq1KD++qDQntfgQoynQcxOZpUST84HJIK8k3tDU0NzC0tDc2NzYzEJJ
 nLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA2O53HPeIxqiF/z4qpZtjHI8O+/RJKlXv388X+X0
 /Y52+JyZ1b8zpZ/kZ/6btu1j9ynpKVH/p+3Km7JqQ+DU2aqHnnG2K/aw39N+Vu7kwv7yUPd+
 6WcH0uV2e3pnTlGy2jdVfk2sin3Fh/Q+1RuuToseb52j9V0upmqnRstro1kVChde1oRpxK1S
 YinOSDTUYi4qTgQAnCepTc4CAAA=
X-CMS-MailID: 20190628102754eucas1p283e1ad580a242323137a4b6c7024028c
X-Msg-Generator: CA
X-RootMTR: 20190628102754eucas1p283e1ad580a242323137a4b6c7024028c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190628102754eucas1p283e1ad580a242323137a4b6c7024028c
References: <3da197ed-a701-2aa7-d775-2bdbe9deab4a@samsung.com>
 <CGME20190628102754eucas1p283e1ad580a242323137a4b6c7024028c@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561717675;
 bh=Bsjy2CgLzbj8VVIl5VheX4ReDw3a8PH2su9cRZoqQPo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ZtYZPd6N9uwNSjW1U4iZCktnkWD/tb3W/518bmwwFj2UtUXpO+CSbBNMtPrqeQsQS
 Kg/vDS9hWC/qaKFv0hrI2mntpLonaoEByI4L2meAFZRLNxHltPJwUrsHnWs38YPn+I
 U6A4+SVz3t2xz8AoMd8RaoMqgk+MZNcJBu6o/gtA=
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
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTQvMTkgNDo1MSBQTSwgQmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPiBm
cmFtZWJ1ZmZlcl9hbGxvYygpIGNhbiBmYWlsIG9ubHkgb24ga3phbGxvYygpIG1lbW9yeSBhbGxv
Y2F0aW9uCj4gZmFpbHVyZSBhbmQgc2luY2Uga3phbGxvYygpIHdpbGwgcHJpbnQgZXJyb3IgbWVz
c2FnZSBpbiBzdWNoIGNhc2UKPiB3ZSBjYW4gb21pdCBwcmludGluZyBleHRyYSBlcnJvciBtZXNz
YWdlIGluIGRyaXZlcnMgKHdoaWNoIEJUVyBpcwo+IHdoYXQgdGhlIG1ham9yaXR5IG9mIGZyYW1l
YnVmZmVyX2FsbG9jKCkgdXNlcnMgaXMgZG9pbmcgYWxyZWFkeSkuCj4gCj4gQ2M6ICJCcnVubyBQ
csOpbW9udCIgPGJvbmJvbnNAbGludXgtdnNlcnZlci5vcmc+Cj4gQ2M6IEppcmkgS29zaW5hIDxq
aWtvc0BrZXJuZWwub3JnPgo+IENjOiBCZW5qYW1pbiBUaXNzb2lyZXMgPGJlbmphbWluLnRpc3Nv
aXJlc0ByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdp
Y3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KCkkgcXVldWVkIHRoZSBwYXRjaCBmb3IgdjUu
My4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpTYW1zdW5nIFIm
RCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
