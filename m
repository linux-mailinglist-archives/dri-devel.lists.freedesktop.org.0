Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4FB4E7C3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 14:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6604B6E89E;
	Fri, 21 Jun 2019 12:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A530D6E89E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 12:06:34 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190621120633euoutp020fcb0a1b698d791627f7cb01039bf750~qNUVsFfBh1676116761euoutp02-
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 12:06:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190621120633euoutp020fcb0a1b698d791627f7cb01039bf750~qNUVsFfBh1676116761euoutp02-
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190621120632eucas1p24898bee4b69c79fb4754857af9460303~qNUVWL4Gl1704417044eucas1p2D;
 Fri, 21 Jun 2019 12:06:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 83.21.04325.848CC0D5; Fri, 21
 Jun 2019 13:06:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190621120631eucas1p1e60ddd1453700646cd5047ad827bc4d4~qNUUiC8Qq1150611506eucas1p1m;
 Fri, 21 Jun 2019 12:06:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190621120631eusmtrp223f06cc93abf6e2f27356ccb6bf424ee~qNUUT_oGx0548605486eusmtrp2L;
 Fri, 21 Jun 2019 12:06:31 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-48-5d0cc8480065
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 58.21.04146.748CC0D5; Fri, 21
 Jun 2019 13:06:31 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190621120631eusmtip2f1b4a55176fe14258383b48918d52a15~qNUT6JzGS0297302973eusmtip2i;
 Fri, 21 Jun 2019 12:06:31 +0000 (GMT)
Subject: Re: [PATCH][next] video: fbdev: atmel_lcdfb: remove redundant
 initialization to variable ret
To: Ludovic Desroches <ludovic.desroches@microchip.com>, Nicolas Ferre
 <Nicolas.Ferre@microchip.com>, Colin King <colin.king@canonical.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <fae5c288-cf9b-5b54-1aeb-06126f140b84@samsung.com>
Date: Fri, 21 Jun 2019 14:06:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190612141356.riiesqub4zvxafh3@M43218.corp.atmel.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djPc7oeJ3hiDZ5OlbZof7eM3eL36l42
 iytf37NZbL0lbbHp8TVWixN9H1gtLu+aw2bxYu11VovtmxcyO3B6zFtT7TGroZfN4373cSaP
 zUvqPe78WMro8XmTXABbFJdNSmpOZllqkb5dAlfG77mzWAtOslX07L7A1sC4nbWLkYNDQsBE
 4tguni5GLg4hgRWMEm2d65kgnC+MErs2v2CDcD4zSvw4upe9i5ETrGP/+mPMEInljBJX+p+x
 QjhvGSW2v/kMViUskC7xet5PFpCEiEAv0Kw/U8AcZoFpzBLtMxewglSxCVhJTGxfxQhi8wrY
 SeydtIENxGYRUJVYcvcXE4gtKhAhcf/YBlaIGkGJkzOfsIDYnAIuEh+n7wKrYRYQl7j1ZD6U
 LS+x/e0csPskBE6xS1x9s4AN4nAXia9XF7JA2MISr45vgXpIRuL/zvlMEA3rGCX+dryA6t7O
 KLF88j+obmuJw8cvggONWUBTYv0ufYiwo8SKU6uYIGHJJ3HjrSDEEXwSk7ZNZ4YI80p0tAlB
 VKtJbFi2gQ1mbdfOlcwTGJVmIXltFpJ3ZiF5ZxbC3gWMLKsYxVNLi3PTU4uN81LL9YoTc4tL
 89L1kvNzNzECE9Tpf8e/7mDc9yfpEKMAB6MSD++BWdyxQqyJZcWVuYcYJTiYlUR4eXJ4YoV4
 UxIrq1KL8uOLSnNSiw8xSnOwKInzVjM8iBYSSE8sSc1OTS1ILYLJMnFwSjUwzo2zuFO8+thT
 2Qurs459TI1a+Ga22BYFSw+GPJ9nOyst94XIVve/Mjq2fMkk175zNn2rwhZZPPqs3rZOtTrx
 ZqDA6csMIsYT1k74JaS/3XTfc1G2TXGxoqrWn+PXH172SP/5jINlXDLS6eLK7kZOjftbV94X
 dcsXSSl6/GK63ML17cyMvTc/KLEUZyQaajEXFScCAB1Prw9MAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xe7ruJ3hiDU7vVbFof7eM3eL36l42
 iytf37NZbL0lbbHp8TVWixN9H1gtLu+aw2bxYu11VovtmxcyO3B6zFtT7TGroZfN4373cSaP
 zUvqPe78WMro8XmTXABblJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1N
 SmpOZllqkb5dgl7G77mzWAtOslX07L7A1sC4nbWLkZNDQsBEYv/6Y8xdjFwcQgJLGSVad39k
 6mLkAErISBxfXwZRIyzx51oXG0TNa0aJ9utr2EASwgLpEq/n/WQBSYgI9DNKTF4yHaqqiUli
 35QnYA6zwDRmiRnLf7CAtLAJWElMbF/FCGLzCthJ7J20AWwUi4CqxJK7v5hAbFGBCIkz71ew
 QNQISpyc+QTM5hRwkfg4fRdYDbOAusSfeZeYIWxxiVtP5kPF5SW2v53DPIFRaBaS9llIWmYh
 aZmFpGUBI8sqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwIjcduzn5h2MlzYGH2IU4GBU4uE9
 MIs7Vog1say4MvcQowQHs5IIL08OT6wQb0piZVVqUX58UWlOavEhRlOg5yYyS4km5wOTRV5J
 vKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsaOK8nPPCbG7DLUNrQ4
 fvmG6XpRX4s1DoFnFqq3ZUxfs1nb0IqXY57V+7M/FhRvYUo/zGmo0RP1ODYpbaYUzyHBhgKp
 OWuOr/1SElNXJMJ09ag/2xnOU+0uuyd5KFZt0ky5sPiK+sJvmy/XPD7hfHX/V8teByWG9/3b
 /54UzGYqPHU5zTMs9ooSS3FGoqEWc1FxIgBPO8a23gIAAA==
X-CMS-MailID: 20190621120631eucas1p1e60ddd1453700646cd5047ad827bc4d4
X-Msg-Generator: CA
X-RootMTR: 20190612141513epcas2p32873b9574f918732b4cf8a6838cdd54d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190612141513epcas2p32873b9574f918732b4cf8a6838cdd54d
References: <20190611170913.20913-1-colin.king@canonical.com>
 <37ac8530-6601-a1a0-37e0-8c6d5d1702cd@microchip.com>
 <CGME20190612141513epcas2p32873b9574f918732b4cf8a6838cdd54d@epcas2p3.samsung.com>
 <20190612141356.riiesqub4zvxafh3@M43218.corp.atmel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561118793;
 bh=wGGB2gDtNWG7yizzChvNAFBQWnf3VqAELSTaAtE7vS4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=dZY/zS5xyTSzY4Fw1J6fjICFzrSSXBGkvtiMgbYHPLeP5fQlv23R0afqRQ/cKP4Hc
 DD0TpkZlMPM1qPNX8IGx1EzNR30d2lhnNdtZ551rQCgDDNxc51NlLKaQGGwxJ32Z0c
 WN6+oriMBtb2EW+RuuKRB09vCjd/bMEGvWigavGg=
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTIvMTkgNDoxMyBQTSwgTHVkb3ZpYyBEZXNyb2NoZXMgd3JvdGU6Cj4gT24gV2VkLCBK
dW4gMTIsIDIwMTkgYXQgMDk6NTU6MzBBTSArMDIwMCwgTmljb2xhcyBGZXJyZSAtIE00MzIzOCB3
cm90ZToKPj4gT24gMTEvMDYvMjAxOSBhdCAxOTowOSwgQ29saW4gS2luZyB3cm90ZToKPj4+IEV4
dGVybmFsIEUtTWFpbAo+Pj4KPj4+Cj4+PiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2lu
Z0BjYW5vbmljYWwuY29tPgo+Pj4KPj4+IEN1cnJlbnRseSB2YXJpYWJsZSByZXQgaXMgYmVpbmcg
aW5pdGlhbGl6ZWQgd2l0aCAtRU5PRU5UIGhvd2V2ZXIgdGhhdAo+Pj4gdmFsdWUgaXMgbmV2ZXIg
cmVhZCBhbmQgcmV0IGlzIGJlaW5nIHJlLWFzc2lnbmVkIGxhdGVyIG9uLiBIZW5jZSB0aGlzCj4+
PiBhc3NpZ25tZW50IGlzIHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4+Pgo+Pj4gQWRk
cmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCB2YWx1ZSIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBDb2xp
biBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+Pgo+PiBJbmRlZWQ6Cj4+IEFj
a2VkLWJ5OiBOaWNvbGFzIEZlcnJlIDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+Cj4gCj4g
QWNrZWQtYnk6IEx1ZG92aWMgRGVzcm9jaGVzIDxsdWRvdmljLmRlc3JvY2hlc0BtaWNyb2NoaXAu
Y29tPiAKClBhdGNoIHF1ZXVlZCBmb3IgdjUuMywgdGhhbmtzLgoKQmVzdCByZWdhcmRzLAotLQpC
YXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ft
c3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
