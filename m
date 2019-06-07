Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0A438A30
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFD6893D5;
	Fri,  7 Jun 2019 12:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C249389CAD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:26:00 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607122559euoutp0251dacadb3174a52995365772f0d195ca~l6jUIvEQk3051930519euoutp02L
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:25:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190607122559euoutp0251dacadb3174a52995365772f0d195ca~l6jUIvEQk3051930519euoutp02L
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190607122559eucas1p1d5c895dc98fbc36b3a6532d394d5158c~l6jTyfblQ0424004240eucas1p1h;
 Fri,  7 Jun 2019 12:25:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 74.D4.04298.6D75AFC5; Fri,  7
 Jun 2019 13:25:58 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190607122558eucas1p147ed7c29bc60ff99073f4ba67375ad3e~l6jSy4Dd-0422904229eucas1p1c;
 Fri,  7 Jun 2019 12:25:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190607122557eusmtrp14c6b9319e71cfd1a95f35383f12c4bee~l6jSjXncA3225232252eusmtrp1V;
 Fri,  7 Jun 2019 12:25:57 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-f2-5cfa57d6fced
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 2F.D7.04146.5D75AFC5; Fri,  7
 Jun 2019 13:25:57 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190607122557eusmtip1f514c8a5b30bdfd4282244140bb9c9ff~l6jSNtPUm2114021140eusmtip1R;
 Fri,  7 Jun 2019 12:25:57 +0000 (GMT)
Subject: Re: [PATCH v3] video: fbdev: atmel_lcdfb: add COMPILE_TEST support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <7f6b5d26-de84-c38a-7510-fee1f7e7eea3@samsung.com>
Date: Fri, 7 Jun 2019 14:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190601210651.GB3558@piout.net>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djPc7rXwn/FGHycZGDR/m4Zu8WVr+/Z
 LDY9vsZqcaLvA6vF5V1z2CxerL3OarF980JmB3aPeWuqPe53H2fy2Lyk3uPOj6WMHp83yQWw
 RnHZpKTmZJalFunbJXBlfH6wiK3gM3vFyg3PmRsYd7N1MXJySAiYSKxYeJGxi5GLQ0hgBaPE
 rNtXmCCcL4wSd199ZoZwPjNKnDs6iRmm5fvBF2wQieWMEqdalkC1vGWU2PLuBCtIlbCAt8Sy
 LxfBbBEBU4nWxl1gHcwCbxgl3uxaADaKTcBKYmL7KkYQm1fATqL/6l4WEJtFQEXi6LXP7CC2
 qECExP1jG1ghagQlTs58AlbDKaAncfx6J9gcZgFxiVtP5jNB2PIS29/OAbtbQmAbu8TbY2tZ
 IO52keg9txPqbWGJV8e3sEPYMhKnJ/ewQDSsY5T42/ECqns7o8Tyyf+gOqwlDh8H+YcDaIWm
 xPpd+hBhR4kfXR8ZQcISAnwSN94KQhzBJzFp23RmiDCvREebEES1msSGZRvYYNZ27VzJPIFR
 aRaS12YheWcWkndmIexdwMiyilE8tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzAJnf53/NMO
 xq+Xkg4xCnAwKvHwerD/jBFiTSwrrsw9xCjBwawkwlt24UeMEG9KYmVValF+fFFpTmrxIUZp
 DhYlcd5qhgfRQgLpiSWp2ampBalFMFkmDk6pBsZI6cXfCprM0iWEdMWDfsc6f7KomPSJU+iD
 Qv4l610zVqlZtbCvTHiRVjo/usJOmkvYeOGz7XHrfh6omdAraxcWu7a/Z7WhfMH9rt+2ShdZ
 dRcy/bgyu61gthrbtO+TZt61L1z0aa73PqdLy7Y92H268d3EVdlcLx7bF33dnf7r4e4uk1ec
 T88osRRnJBpqMRcVJwIAoD56jT4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xu7pXw3/FGPw7rG3R/m4Zu8WVr+/Z
 LDY9vsZqcaLvA6vF5V1z2CxerL3OarF980JmB3aPeWuqPe53H2fy2Lyk3uPOj6WMHp83yQWw
 RunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlfH6w
 iK3gM3vFyg3PmRsYd7N1MXJySAiYSHw/+ALI5uIQEljKKLFsyyTGLkYOoISMxPH1ZRA1whJ/
 rnVB1bxmlHi68wY7SEJYwFti2ZeLrCC2iICpRGvjLrAiZoE3jBJ/zv9lhOjYxiixueEYE0gV
 m4CVxMT2VYwgNq+AnUT/1b0sIDaLgIrE0WufwaaKCkRInHm/ggWiRlDi5MwnYDangJ7E8eud
 zCA2s4C6xJ95l6BscYlbT+YzQdjyEtvfzmGewCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56
 brGhXnFibnFpXrpecn7uJkZgzG079nPzDsZLG4MPMQpwMCrx8Dow/IwRYk0sK67MPcQowcGs
 JMJbduFHjBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnA9NBXkm8oamhuYWlobmxubGZhZI4
 b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxpnOC6JDl8nMYZP4mrPC7NPKC6zXDm/IDbn5z/X3
 dM8baif/fTHZYS1qGXnKeZP91P8iDjGSJsFXTlx4svLxwyeOWwx/c65V6Fy77h8by5c/vrqh
 Lzs0YlPcZKTDcixNcu1L9t+RuTn98MT1C1h62q/M4H6jXzv/O/cCbzWR0+emz9x2esNSubNK
 LMUZiYZazEXFiQAbay/ZzwIAAA==
X-CMS-MailID: 20190607122558eucas1p147ed7c29bc60ff99073f4ba67375ad3e
X-Msg-Generator: CA
X-RootMTR: 20190530123016eucas1p2e18747b8ac1d156657232eab52876a61
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190530123016eucas1p2e18747b8ac1d156657232eab52876a61
References: <CGME20190530123016eucas1p2e18747b8ac1d156657232eab52876a61@eucas1p2.samsung.com>
 <69cd6b8b-1fd1-86fa-2070-99d0ce15a868@samsung.com>
 <20190601210651.GB3558@piout.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559910359;
 bh=v55UW7qRKcueFOO4F7D06p3S+rnoOobSIhpjaAMDbnw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ajetDQ4u/o85Fuo7OgszrawNg6lMFIq6qjY9097sQx3y1rP6qGHGuKp3u5APbugaZ
 q45ujPeadoAkOgKxqXT00D60EkasrnnrxzvX3EVKm4D+W4+9xCPtWxhLWBWFBDH6AR
 ACCKsuPkrVLRWx67YskG6e7Q43L2ZfjOufEtdHBA=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMS8xOSAxMTowNiBQTSwgQWxleGFuZHJlIEJlbGxvbmkgd3JvdGU6Cj4gT24gMzAvMDUv
MjAxOSAxNDozMDoxOSswMjAwLCBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IHdyb3RlOgo+PiBB
ZGQgQ09NUElMRV9URVNUIHN1cHBvcnQgdG8gYXRtZWxfbGNkZmIgZHJpdmVyIGZvciBiZXR0ZXIg
Y29tcGlsZQo+PiB0ZXN0aW5nIGNvdmVyYWdlLgo+Pgo+PiBXaGlsZSBhdCBpdCBmaXggaW1wcm9w
ZXIgdXNlIG9mIFVMICh0byBzaWxlbmNlIGJ1aWxkIHdhcm5pbmdzIG9uCj4+IHg4Nl82NCkuCj4+
Cj4+IENjOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+
Cj4gQWNrZWQtYnk6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGlu
LmNvbT4KClRoYW5rcywgSSBxdWV1ZWQgdGhlIHBhdGNoIGZvciB2NS4zLgoKPj4gQ2M6IEx1ZG92
aWMgRGVzcm9jaGVzIDxsdWRvdmljLmRlc3JvY2hlc0BtaWNyb2NoaXAuY29tPgo+PiBTaWduZWQt
b2ZmLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5j
b20+Cj4+IC0tLQo+PiB2MzogZml4IGJ1aWxkIHdhcm5pbmdzIG9uIHg4Nl82NAo+IAo+IEhvcGVm
dWxseSwgbm8gYnVpbGRpbmcgZXJyb3JzIGFueW1vcmUgOykKCkkgaG9wZSBzby4gOikKCj4+IHYy
OiBhZGQgbWlzc2luZyBIQVZFX0NMSyAmJiBIQVMgSU9NRU0gZGVwZW5kZW5jaWVzCj4+Cj4+ICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcgICAgICAgfCAgICAzICsrLQo+PiAgZHJpdmVycy92
aWRlby9mYmRldi9hdG1lbF9sY2RmYi5jIHwgICAgNCArKy0tCj4+ICAyIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9t
aWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBF
bGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
