Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B97114B13
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 15:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CEE8994D;
	Mon,  6 May 2019 13:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B8E8994D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:41:43 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190506134141euoutp01f60de02454488b687d76fd4b36d721c1~cG8R9kivs0465904659euoutp01P
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:41:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190506134141euoutp01f60de02454488b687d76fd4b36d721c1~cG8R9kivs0465904659euoutp01P
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190506134141eucas1p18dde8dd80374db7916ef2363a0f7ed48~cG8Rb36zC3245032450eucas1p1r;
 Mon,  6 May 2019 13:41:41 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C1.27.04298.49930DC5; Mon,  6
 May 2019 14:41:41 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190506134140eucas1p29e5a027ded96d45ed98146c0d0c33c3d~cG8QxEbB11505115051eucas1p23;
 Mon,  6 May 2019 13:41:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190506134140eusmtrp296f57ecfa8984c035f8e9a11310c251f~cG8QjFDlz1709717097eusmtrp2j;
 Mon,  6 May 2019 13:41:40 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-ce-5cd039949c30
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 33.01.04140.49930DC5; Mon,  6
 May 2019 14:41:40 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190506134139eusmtip2a5473d0c71e132156a81adcadffffc25~cG8QI4ENT1261212612eusmtip2e;
 Mon,  6 May 2019 13:41:39 +0000 (GMT)
Subject: Re: [PATCH v2 45/79] docs: console.txt: convert docs to ReST and
 rename to *.rst
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <56e029b0-f0e7-cc43-f99d-0a5e5d432472@samsung.com>
Date: Mon, 6 May 2019 15:41:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <27d8c7ddc7aac8af43152b8f37a23edd2d73bdfc.1555938376.git.mchehab+samsung@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7djP87pTLS/EGEzdyWTx5EA7o8WVr+/Z
 LJoXr2ezmLLhA5PFwrYlLBYn+j6wWlzeNYfN4v2nTiaLHacWMTtwemxeoeWxaVUnm8f+uWvY
 Pe53H2fyWNw3mdVj/ZarLB6fN8kFsEdx2aSk5mSWpRbp2yVwZbx4c5u94D1zxeztbA2M05i7
 GDk5JARMJLr/bmDpYuTiEBJYwSjxe+Y0JgjnC6PEvePzwaqEBD4zSkz75AvTsfjxanaIouWM
 EnfPLIZqf8soMfX4PLAOYYFoiYm3D7CA2CICZhInzx1lAyliFtjFJHFr33F2kASbgJXExPZV
 jCA2r4CdxM73P9lAbBYBFYmOiauBbA4OUYEIif4z6hAlghInZz4Bm8kpkChx4chXVhCbWcBA
 4siiOVC2vMT2t3OYQXZJCOxjl9i/9BoTxNkuEjcbvkA9LSzx6vgWdghbRuL/zvlMEA3rGCX+
 dryA6t7OKLF88j82iCpricPHL7JC2I4Sn+ctYAe5TkKAT+LGW0GIzXwSk7ZNZ4YI80p0tAlB
 VKtJbFi2gQ1mV9fOlVA3eEic3vCCaQKj4iwkv81C8s8sJP8sYGRexSieWlqcm55abJiXWq5X
 nJhbXJqXrpecn7uJEZiUTv87/mkH49dLSYcYBTgYlXh4PZTOxwixJpYVV+YeYpTgYFYS4U18
 di5GiDclsbIqtSg/vqg0J7X4EKM0B4uSOG81w4NoIYH0xJLU7NTUgtQimCwTB6dUA2OHQMDa
 9IV/07/kWc/I7E/cbL3xenac7Q7v7HbdICeX1QJncmPFLEwsZXkN1s5LElqjk85x2XbPq8dW
 te9NpqdZVNjaSz8s5Kr8K7nyqeyE41P2i6/eq3K5w2Nl4pMnjYI5icKzhT8pLVZo+a3o79hz
 xfyB9auYFe5rA684i81NPBb4rEyjS4mlOCPRUIu5qDgRABEs2cZGAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsVy+t/xe7pTLC/EGNyaJmrx5EA7o8WVr+/Z
 LJoXr2ezmLLhA5PFwrYlLBYn+j6wWlzeNYfN4v2nTiaLHacWMTtwemxeoeWxaVUnm8f+uWvY
 Pe53H2fyWNw3mdVj/ZarLB6fN8kFsEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvH
 WhmZKunb2aSk5mSWpRbp2yXoZbx4c5u94D1zxeztbA2M05i7GDk5JARMJBY/Xs3excjFISSw
 lFHiy+zzrF2MHEAJGYnj68sgaoQl/lzrYoOoec0osfr7VLBmYYFoiYm3D7CA2CICZhInzx2F
 KnrBKPG+YxZYgllgD5PEzl4VEJtNwEpiYvsqRhCbV8BOYuf7n2wgNouAikTHxNVgtqhAhMSt
 hx0sEDWCEidnPgGzOQUSJS4c+coKMVNPYsf1X1C2vMT2t3OYJzAKzkLSMgtJ2SwkZQsYmVcx
 iqSWFuem5xYb6RUn5haX5qXrJefnbmIERtq2Yz+37GDsehd8iFGAg1GJh9dD6XyMEGtiWXFl
 7iFGCQ5mJRHexGfnYoR4UxIrq1KL8uOLSnNSiw8xmgI9MZFZSjQ5H5gE8kriDU0NzS0sDc2N
 zY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MHKs7U2c5ZakIXV7kcf/C6Uvm7a8sbB5
 pbRUP8VH87BLwNmVjpOuaeVq2obuvf7uUfByhr5J6hlS2+6vecZkkPtLfU1Y8dsbDSsePd8b
 UKDot712a5b4YQ//oBmZF1+dfcCkz1Zr7uktsJdzfiP759wwK+3ZJzct/VG+79b0mtm3dx/q
 uajpyKbEUpyRaKjFXFScCAAP2Nd6ygIAAA==
X-CMS-MailID: 20190506134140eucas1p29e5a027ded96d45ed98146c0d0c33c3d
X-Msg-Generator: CA
X-RootMTR: 20190422132824epcas2p228a2213c6e871011553efb5359861aea
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190422132824epcas2p228a2213c6e871011553efb5359861aea
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
 <CGME20190422132824epcas2p228a2213c6e871011553efb5359861aea@epcas2p2.samsung.com>
 <27d8c7ddc7aac8af43152b8f37a23edd2d73bdfc.1555938376.git.mchehab+samsung@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1557150101;
 bh=HdrrQuulAETTeoDffC8tBc4CccL9dP0cGYUz6ngs41c=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=DURRU7YaGUxa9wa9nWMUID0JcWA7BALHH9AHtBHJhiY0/qRx7vSJO7bObY3T2uQ/P
 sq8P9VeIxhXpO78XpPrDCRw2cU9uLYFciBuCfziIPIvBiL0Ncv+oAbUX3jYgoc6XNG
 9Jxlp2wmdUYsXYMFwjCSjzG+vE21goKyY7Yc/aCI=
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
Cc: linux-fbdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA0LzIyLzIwMTkgMDM6MjcgUE0sIE1hdXJvIENhcnZhbGhvIENoZWhhYiB3cm90ZToKPiBD
b252ZXJ0IHRoaXMgc21hbGwgZmlsZSB0byBSZVNUIGluIHByZXBhcmF0aW9uIGZvciBhZGRpbmcg
aXQgdG8KPiB0aGUgZHJpdmVyLWFwaSBib29rLgo+IAo+IFdoaWxlIHRoaXMgaXMgbm90IHBhcnQg
b2YgdGhlIGRyaXZlci1hcGkgYm9vaywgbWFyayBpdCBhcwo+IDpvcnBoYW46LCBpbiBvcmRlciB0
byBhdm9pZCBidWlsZCB3YXJuaW5ncy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxo
byBDaGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPgoKQWNrZWQtYnk6IEJhcnRsb21p
ZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KCkJlc3QgcmVnYXJk
cywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9s
YW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
