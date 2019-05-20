Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DF8231CC
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 12:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D7E89266;
	Mon, 20 May 2019 10:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031E189266
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 10:53:49 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190520105348euoutp0210b3cfa2f152d8ecc1ada177d8cb7fef~gXrsEGM9m0507105071euoutp02O
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 10:53:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190520105348euoutp0210b3cfa2f152d8ecc1ada177d8cb7fef~gXrsEGM9m0507105071euoutp02O
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190520105347eucas1p1e301abf7a59734a1b15f14ce6704e88a~gXrrsP-1c0811308113eucas1p1G;
 Mon, 20 May 2019 10:53:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 6C.03.04377.B3782EC5; Mon, 20
 May 2019 11:53:47 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190520105347eucas1p2e7081383380fc7a18910d3a929b5c512~gXrq-4fDm0847908479eucas1p2I;
 Mon, 20 May 2019 10:53:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190520105347eusmtrp235095f561ca9d4d24f0647456690dfec~gXrqxvpm10767307673eusmtrp2Y;
 Mon, 20 May 2019 10:53:47 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-da-5ce2873b6280
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C3.C4.04146.A3782EC5; Mon, 20
 May 2019 11:53:46 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190520105346eusmtip24a8bc5cca25ee0b1e4e3aeb0d0c6f256~gXrqWlafn1041810418eusmtip2c;
 Mon, 20 May 2019 10:53:46 +0000 (GMT)
Subject: Re: [PATCHv3 11/23] drm/bridge: tc358767: disable only video stream
 in tc_stream_disable
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <fc8789cf-f6a4-7d20-c996-237e43ef274e@samsung.com>
Date: Mon, 20 May 2019 12:53:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503122949.12266-12-tomi.valkeinen@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SXUhTYRju2/nZcTQ5m4ZvmoWLCCV/yi5OaVIQtIuMgi4spZrupKKbsqMr
 6yLT1KkX6obKZqbRTBNDKzd/IKEZmxGKVhe61KmZWSkhaij4k+5M8u55n/d5vvd54KMwaQ/h
 T6Wqs1iNWpEuI0W41b46EBpVNJUQ0bscwuTrzjB5tlyC+VtWgDNflv+QTGmxjmAmakcETHGF
 WciMjffhjGlhhWBa65zkWZF8onJTIO8yjQnlNTojIXeVOgTysvUIuWO4Q3CZvC6KVrLpqVpW
 Ex5zS5Tyo2caZVrxu7P1abnoM1aCvCigT8Ls0hRZgkSUlG5CUP4pH+OHJQSm3heIHxYRTH/9
 iXYsefoNAb9oRGAsr/T45xEYWp1ulQ+dBEOuJ267L/0Ygw1DkfsiSQfD+psRchuL6Rio6Zh0
 G3D6CPy22wXbeB8dBy57G8FrJPDBOI1vYy86GmbmR90ajD4E+ZYajMd+4Jyuc0cCukcI316O
 erKehxlrraeqD/xytAt5fAA2u+oEPH4ArqZHGG/WIbC0dXkMUdDrGNpKQW1dCIbW7nCePgcd
 5mHhNg20NwzPS/gM3qC3VmM8LQZdoZRXB4Gr3+J50A8aBpdJHsvBWpErLEdBpl0tTbuamXY1
 M/3PUI/wZuTHZnOqZJY7oWbvhHEKFZetTg5LylC9Rlu/6uOGY6kTda8l2hBNIdlesbx6MkFK
 KLRcjsqGgMJkvuLIo64EqVipyLnHajJuarLTWc6GAihc5ie+v2ciXkonK7LYNJbNZDU7WwHl
 5Z+LiKcBnTn9+QPvbsRZl5V9+sQRoeH2WiOhfhbrZWnI8O6LN1SpRyeqVHpzi9LoVEvWDh4z
 j0gW+hMHXmU+XzMkXGumAx8Ovtce9rcslMV/379+SRugXay4ErQUWlEY0n7RPBlIX/CZO22P
 fYuNX41ZsYdtVgtPRYwVrM5lRLaADOdSFMdDMA2n+AeCFmoIUQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsVy+t/xe7pW7Y9iDPZusLFo7rC1aDrUwGrx
 rb+VxeLK1/dsFt2dHawWD+beZLLonLiE3eLuvRMsFrM+/mC1WD//FpsDl8eDqf+ZPHbOusvu
 MbtjJqvH/e7jTB79fw08jt/YzhTAFqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5r
 ZWSqpG9nk5Kak1mWWqRvl6CX8XzfE8aCbSwVLxZkNzBeZu5i5OSQEDCRaJr0jwnEFhJYyijx
 6UcsRFxcYvf8t1A1whJ/rnWxdTFyAdW8ZpTY3POMDSQhLJAscfH+PEaQhIjAAmaJ7iuX2SGq
 DjBK/Po8GaydTUBT4u/mm2AdvAJ2ErO3P2QEsVkEVCVeHzsGtlpUIELizPsVLBA1ghInZz4B
 szkFbCSevb0DVsMsoC7xZ94lZghbXqJ562woW1zi1pP5TBMYBWchaZ+FpGUWkpZZSFoWMLKs
 YhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIzBbcd+bt7BeGlj8CFGAQ5GJR7eD1MexgixJpYV
 V+YeYpTgYFYS4TVWvx8jxJuSWFmVWpQfX1Sak1p8iNEU6LmJzFKiyfnA9JBXEm9oamhuYWlo
 bmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoGxcKbS6TdpzQ+rZ8auypteq56dtluL
 sYFj2UHt2N4YcW/P+Z0La3YFdsp9Xvn97cSPnz+ejc3YsPntdHXtiLKeXE1LkU8cLjPSfeOu
 VTZfqfn6Z5Fat3i9X/j1hLNG7bqcZ/Uk5k3oelB1SNSzc+Gfq9L2frbcm1mV0/WY6lMvnzDo
 ZT7dfVCJpTgj0VCLuag4EQAhvw7M1wIAAA==
X-CMS-MailID: 20190520105347eucas1p2e7081383380fc7a18910d3a929b5c512
X-Msg-Generator: CA
X-RootMTR: 20190503123115epcas2p2d387f6654acd674898c8e65954289fda
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190503123115epcas2p2d387f6654acd674898c8e65954289fda
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
 <CGME20190503123115epcas2p2d387f6654acd674898c8e65954289fda@epcas2p2.samsung.com>
 <20190503122949.12266-12-tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558349628;
 bh=IgcBy58xIh5I2sVaZCIjKTZyMRujIhCtJwbeyCof488=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=tzxlrLXJ4YDQVQJnDf3huXF9MvuVG3CV5+OdBYfQsVXDy5KSOsZNfiW4apOAzpKQG
 A1xLtwIgBtrm4yqYG83k4eV3YdLhWEA26gmf+DIPHE3/3iPQd6SV/8ESsdtCISsH5U
 +VQIT4i8w2l8EN61stoscrLnLixK0d7pBbuUW1xw=
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

T24gMDMuMDUuMjAxOSAxNDoyOSwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gQ3VycmVudGx5IHRo
ZSBjb2RlIHdyaXRlcyAwIHRvIERQMENUTCBpbiB0Y19zdHJlYW1fZGlzYWJsZSgpLCB3aGljaAo+
IGRpc2FibGVzIHRoZSB3aG9sZSBEUCBsaW5rIGluc3RlYWQgb2YganVzdCB0aGUgdmlkZW8gc3Ry
ZWFtLiBXZSBhbHdheXMKPiBkaXNhYmxlIHRoZSBsaW5rIGFuZCB0aGUgc3RyZWFtIHRvZ2V0aGVy
IGZyb20gdGNfYnJpZGdlX2Rpc2FibGUoKSwgc28KPiB0aGlzIGRvZXNuJ3QgY2F1c2UgYW55IGlz
c3Vlcy4KPgo+IE5ldmVydGhlbGVzcywgZml4IHRoaXMgYnkgb25seSBjbGVhcmluZyBWSURfRU4g
aW4gdGNfc3RyZWFtX2Rpc2FibGUgdG8KPiBzdG9wIHRoZSB2aWRlbyBzdHJlYW0gd2hpbGUga2Vl
cGluZyB0aGUgbGluayBlbmFibGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4g
PHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFq
ZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJlZ2FyZHMKQW5kcnplagpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
