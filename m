Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0536124D1E
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 12:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC407892D4;
	Tue, 21 May 2019 10:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDF0892D4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 10:47:06 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190521104704euoutp0183cab0dc9af02e2ccf97d72932459d03~grPGSI2SA2274522745euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 10:47:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190521104704euoutp0183cab0dc9af02e2ccf97d72932459d03~grPGSI2SA2274522745euoutp01Q
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190521104704eucas1p14b5f9ab0a0bc5e903728df820de21c68~grPF4Njr-1139911399eucas1p16;
 Tue, 21 May 2019 10:47:04 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 92.54.04298.727D3EC5; Tue, 21
 May 2019 11:47:03 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190521104703eucas1p2c1b6163a4ff9bb4d6caed325a4d0ee23~grPFKd54O0490104901eucas1p2s;
 Tue, 21 May 2019 10:47:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190521104703eusmtrp167559fd1883421c3d769812772bf4af1~grPE61d5t1258812588eusmtrp1W;
 Tue, 21 May 2019 10:47:03 +0000 (GMT)
X-AuditID: cbfec7f2-3615e9c0000010ca-d5-5ce3d72752c7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D7.44.04140.727D3EC5; Tue, 21
 May 2019 11:47:03 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190521104702eusmtip25d8dd0574a912089ec3d01d6ece3f592~grPEcYX2z2274322743eusmtip22;
 Tue, 21 May 2019 10:47:02 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2] video: fbdev: imxfb: add COMPILE_TEST support
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <33fc4837-599d-0d5c-c530-58b283c4c095@samsung.com>
Date: Tue, 21 May 2019 12:47:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0gUYRTt25mdHZdWxlXxZqa0ZGXlC6QmC1Hyx/jLiKJFpdpyckVdZce3
 P9Io0+3h+7UJPjLNDUw38YUvVnIrwyzTzBSfkQZmuAkqabmOkv/Ouffcc++BS2LSbqE9Ga6K
 ZdUqRaSMEONNvav9rkc+z4R4FA2cpD8tLxL01FAgrStoxWn9zLCQfv3ol5DWrNVi9GBbKUGv
 N+txeq7Rjv6ak4d8xUyrdlzE6HWZBDNx3yhgXlbdYhp+tgiYrHUPxqR3PC8KEp8NZSPD41m1
 u881sXJsuhqPKSQSF6dvo1RULNQgCxIoL8iuNIk0SExKqWcIlkseCnjyG8HG03khT0wI6u92
 iHZGFt7NIr5Rg6Dk1TjBkwUEmsIyZFYRlDfk3NNtYWvKDwz9o7gZ21C+kD+SvbUQowYF0LPa
 viWSUD6Qm9spMGOccoaxplLCjG0pOUz01gt5jRW8KZndMsIoOxidLRPw2AmaF0oxsylQnSJY
 rVncHCY3iT8YMo/zZ1vDD2PjdgQH6Mt7gPP6OgTrGXPbw80IavI2CF51BnqMH4RmI4xygRdt
 7nzZDxoqv237W8LIghV/gyXkNhVhfFkCGelSXn0Y6qvriZ21mtbabQkDjV0HstFB7a5g2l3B
 tLuCaf+fUI5wHbJj47ioMJbzVLEJbpwiiotThbndiI7So82/6tswLrWg5Y/XDYgikWyvRJk/
 HSIVKuK5pCgDAhKT2Uj63m6WJKGKpGRWHX1VHRfJcga0n8RldpKUPZPBUipMEctGsGwMq97p
 CkgL+1QUMVBFflnzku1r4Cw6l5zqht+fmJrf473qGuBB3rTyHxNHP3ZdKmAPPTel+6S1Jzte
 8JRPXszBO/RBRtWdLjrFI68YrUQ6uLQF6c4FnEqQ//0zGZyUtnJ09jL6nrhoqy72x4rL9fL+
 7sArjMNExRNlg0XWkG2W1ll+Otm6ouySDOeUCs9jmJpT/AOgeW9rUwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsVy+t/xe7rq1x/HGHRfYba48vU9m8XDq/4W
 q6buZLHY9Pgaq8WJvg+sFl2/VjJbXN41h83i7/ZNLBYvtohb3J44mdGBy2PnrLvsHptWdbJ5
 3O8+zuSxeUm9x8Z3O5g8+v8aeHzeJBfAHqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdo
 bB5rZWSqpG9nk5Kak1mWWqRvl6CXcefRMpaCaWwV7x81MTYwzmDtYuTkkBAwkXh75gljFyMX
 h5DAUkaJOXuXMXcxcgAlZCSOry+DqBGW+HOtiw2i5jWjxMYlR1lAEmwCVhIT21cxgtjCAo4S
 h87dAouLCDhITLkxgR2kgVngKpPEo/0LwbbxCthJTJq0jwnEZhFQlbizbQ4biC0qECFx5v0K
 FogaQYmTM5+A2cwC6hJ/5l1ihrDFJW49mc8EYctLbH87h3kCo8AsJC2zkLTMQtIyC0nLAkaW
 VYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIHxtu3Yzy07GLveBR9iFOBgVOLhzZjyKEaINbGs
 uDL3EKMEB7OSCO/pU0Ah3pTEyqrUovz4otKc1OJDjKZAD01klhJNzgemgrySeENTQ3MLS0Nz
 Y3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYw15yQ6Lrilxlq9PPt8vvk7p52+O771
 /tZ7xRTH1av2sI+9YFGYAqNS6WQ77ZZfT+5eepQkyTnLTlwg7vcHwbLGZz+MdDn/8a5nM8n9
 xf1IbjWPV9Uzpy8P1TdzFSiXbPE2ZDszNU7llE35wRdJzJ69/w/qs37r2s/Akr9z2aIXb5Z8
 n+VSNl+JpTgj0VCLuag4EQD1VV9czQIAAA==
X-CMS-MailID: 20190521104703eucas1p2c1b6163a4ff9bb4d6caed325a4d0ee23
X-Msg-Generator: CA
X-RootMTR: 20190521104703eucas1p2c1b6163a4ff9bb4d6caed325a4d0ee23
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190521104703eucas1p2c1b6163a4ff9bb4d6caed325a4d0ee23
References: <CGME20190521104703eucas1p2c1b6163a4ff9bb4d6caed325a4d0ee23@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558435624;
 bh=vQno20hUkZmhifVARxLJWy7RbMpjq90Z0tVRxBtH4n8=;
 h=From:Subject:To:Cc:Date:References:From;
 b=AeDr8IS/O+lN0F3Sj2flEfE0+bmL+kZaa3S4giydP4guwkYJaD90K4o0XhX0+/zkH
 29tlUtkZB0HkMQqmfiEtHwC9cbuhRAa/5YnVMAiFzn+bnWFbz5yHAF2FgJEr6t4it1
 javfLc+thLvprINwEd8FE5FQRv/qAe7mE8I6uBgw=
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
Cc: Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIENPTVBJTEVfVEVTVCBzdXBwb3J0IHRvIGlteGZiIGRyaXZlciBmb3IgYmV0dGVyIGNvbXBp
bGUKdGVzdGluZyBjb3ZlcmFnZS4KClNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9sbmllcmtp
ZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KLS0tCnYyOiBhZGQgbWlzc2luZyBIQVZF
X0NMSyAmJiBIQVMgSU9NRU0gZGVwZW5kZW5jaWVzIChub3RlZCBieSBVd2UpCgpkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L0tjb25maWcgfCAgICAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKSW5kZXg6IGIvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmln
Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnCisrKyBiL2RyaXZl
cnMvdmlkZW8vZmJkZXYvS2NvbmZpZwpAQCAtMzMxLDcgKzMzMSw4IEBAIGNvbmZpZyBGQl9TQTEx
MDAKIAogY29uZmlnIEZCX0lNWAogCXRyaXN0YXRlICJGcmVlc2NhbGUgaS5NWDEvMjEvMjUvMjcg
TENEIHN1cHBvcnQiCi0JZGVwZW5kcyBvbiBGQiAmJiBBUkNIX01YQworCWRlcGVuZHMgb24gRkIg
JiYgSEFWRV9DTEsgJiYgSEFTX0lPTUVNCisJZGVwZW5kcyBvbiBBUkNIX01YQyB8fCBDT01QSUxF
X1RFU1QKIAlzZWxlY3QgTENEX0NMQVNTX0RFVklDRQogCXNlbGVjdCBGQl9DRkJfRklMTFJFQ1QK
IAlzZWxlY3QgRkJfQ0ZCX0NPUFlBUkVBCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
