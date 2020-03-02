Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BD7175E78
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A97F6E4AB;
	Mon,  2 Mar 2020 15:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5FB6E4AB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200302154216euoutp0209b83857433410e9da8d06b34e5b09d2~4hwfRWgQD1227412274euoutp02Y
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200302154216euoutp0209b83857433410e9da8d06b34e5b09d2~4hwfRWgQD1227412274euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583163736;
 bh=ju1g/QHt4/Lu7DgJ5e4q0GaQjBNKoE5bq5Z7iurWP/k=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=DQyJrYAcx9Q5zqFoTrILuzTHCa+g3ZGx3iTCpxYOmcce5TZc3x1epQMjUJ2lFHOIl
 59FzoND8uUkRl8RlhFmv+UDsw8BVd6bl0wWAUnj6S+oIIvCrZjZv0Zn9Hcuz95I4Bv
 QGT5iXFypEq1WHHEWEQLN5t/DkjcSegUAviozGls=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200302154216eucas1p2874d79f9055f0e620c27b0361ff97782~4hwfF4fgT2400924009eucas1p25;
 Mon,  2 Mar 2020 15:42:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id FE.8D.61286.8592D5E5; Mon,  2
 Mar 2020 15:42:16 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200302154216eucas1p1bd4c6c0450617d11ffc3136a86f9cbbe~4hwe00ReK0815708157eucas1p1I;
 Mon,  2 Mar 2020 15:42:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200302154216eusmtrp15ae7fc9811ab1db043978f2c9c2cb1c2~4hwe0LDJL2862728627eusmtrp1c;
 Mon,  2 Mar 2020 15:42:16 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-c6-5e5d29587535
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 67.FF.07950.8592D5E5; Mon,  2
 Mar 2020 15:42:16 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200302154215eusmtip21aaf1e0de7a3a4158e7ddc2b0bec5f52~4hweXxq9p2155721557eusmtip2t;
 Mon,  2 Mar 2020 15:42:15 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/4] video: fbdev: remove set but not used variable
 'hSyncPol'
To: yu kuai <yukuai3@huawei.com>
Message-ID: <f05e964b-2a4c-1fc4-b0f4-16c3e6d1ec34@samsung.com>
Date: Mon, 2 Mar 2020 16:42:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200119121730.10701-2-yukuai3@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djP87oRmrFxBvN3SFl8aGpltrjy9T2b
 xYm+D6wWl3fNYbO49u4Mm8WchWwWCx/dYHNg92g58pbVo+dNC6vH/e7jTB6fN8kFsERx2aSk
 5mSWpRbp2yVwZSz684etYApvxYm1N5gbGO9zdTFyckgImEhMvXSPuYuRi0NIYAWjRN+tPywQ
 zhdGiUVblzGBVAkJfGaU6LnDAdPRvv4SVNFyRonHJ25COW8ZJU5te84GUsUmYCUxsX0VI4gt
 LBAi8ap/NwuILSKgIHGr+QU7SAMzyL5lz8+xgiR4BewkDr3aDWazCKhIXG+dAbZaVCBC4tOD
 w1A1ghInZz4BG8QpYCFx7O0dsAXMAuISt57MZ4Kw5SWat84Ge0hCYBO7ROOUs2wQd7tIvDvx
 iwnCFpZ4dXwLO4QtI3F6cg8LRMM6Rom/HS+gurczSiyf/A+q21rizrlfQDYH0ApNifW79CHC
 jhKPDswGC0sI8EnceCsIcQSfxKRt05khwrwSHW1CENVqEhuWbWCDWdu1cyXzBEalWUhem4Xk
 nVlI3pmFsHcBI8sqRvHU0uLc9NRiw7zUcr3ixNzi0rx0veT83E2MwNRz+t/xTzsYv15KOsQo
 wMGoxMMbwBwbJ8SaWFZcmXuIUYKDWUmE15czOk6INyWxsiq1KD++qDQntfgQozQHi5I4r/Gi
 l7FCAumJJanZqakFqUUwWSYOTqkGRh17ljmVNv/N3FT++/E/uDOH2dPE1XTCNKXFJ0LzXi3L
 3Mt7oXPj2xuXXxkk+SRzXj767b7A0qC2gKlh12vKDTXf351z8Nj96ZtYpinNOPJ488TQ0qe/
 uIWvWDk82hKTvoU9p98kaYVfR13AaUbRvewno4Oad77qzLDrkDEP38CTvU/LYImjhxJLcUai
 oRZzUXEiAHyOV4U5AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7oRmrFxBrsXsFh8aGpltrjy9T2b
 xYm+D6wWl3fNYbO49u4Mm8WchWwWCx/dYHNg92g58pbVo+dNC6vH/e7jTB6fN8kFsETp2RTl
 l5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZSz684etYApv
 xYm1N5gbGO9zdTFyckgImEi0r7/E0sXIxSEksJRR4tTVBUAOB1BCRuL4+jKIGmGJP9e62CBq
 XjNKfPz5mg0kwSZgJTGxfRUjiC0sECLxqn83C4gtIqAgcav5BTtIA7PACkaJFysus0N072SU
 mLvoJTtIFa+AncShV7tZQWwWARWJ660zmEBsUYEIicM7ZjFC1AhKnJz5BGwqp4CFxLG3d8Di
 zALqEn/mXWKGsMUlbj2ZzwRhy0s0b53NPIFRaBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9Nxi
 I73ixNzi0rx0veT83E2MwFjbduznlh2MXe+CDzEKcDAq8fD+YIiNE2JNLCuuzD3EKMHBrCTC
 68sZHSfEm5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cA0kFcSb2hqaG5haWhubG5sZqEkztsh
 cDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgTEv5lk0z3mv8MKvEc0aT8+mXdyepJ59dHmnelKvjoTJ
 w9BPxfpzYoK3qMhWvon6d7FRRO6f1utXXEc0t7w+/T1yf2zT5pBLdyp7HzyVWXRhY8OFDq5u
 1puZge9sN/+WWvBSs1hPhCN92bXe7GIri4g9QtbnzV5M2iekveiEQ++alsk9R59mZSixFGck
 GmoxFxUnAgAQyRogywIAAA==
X-CMS-MailID: 20200302154216eucas1p1bd4c6c0450617d11ffc3136a86f9cbbe
X-Msg-Generator: CA
X-RootMTR: 20200119121831eucas1p2da620aa87a0fdcc73e6a9db46a3e8243
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200119121831eucas1p2da620aa87a0fdcc73e6a9db46a3e8243
References: <20200119121730.10701-1-yukuai3@huawei.com>
 <CGME20200119121831eucas1p2da620aa87a0fdcc73e6a9db46a3e8243@eucas1p2.samsung.com>
 <20200119121730.10701-2-yukuai3@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, yi.zhang@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEvMTkvMjAgMToxNyBQTSwgeXUga3VhaSB3cm90ZToKPiBGaXhlcyBnY2MgJy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy92aWRlby9mYmRldi9hdHkv
cmFkZW9uX2Jhc2UuYzogSW4gZnVuY3Rpb24KPiDigJhyYWRlb25mYl9zZXRfcGFy4oCZOgo+IGRy
aXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmM6MTY1Mzo2OiB3YXJuaW5nOiB2YXJp
YWJsZQo+IOKAmGhTeW5jUG9s4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCj4gCj4gSXQgaXMgbmV2ZXIgdXNlZCwgYW5kIHNvIGNhbiBiZSByZW1vdmVkLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IHl1IGt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KClBhdGNoIHF1
ZXVlZCBmb3IgdjUuNywgdGhhbmtzLgogCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xu
aWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25p
Y3MKCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmMgfCAzICst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmMgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9yYWRlb25fYmFzZS5jCj4gaW5kZXggM2FmMDBlM2I5NjVlLi5k
MmU2OGVjNTgwYzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9u
X2Jhc2UuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmMKPiBA
QCAtMTY1MCw3ICsxNjUwLDcgQEAgc3RhdGljIGludCByYWRlb25mYl9zZXRfcGFyKHN0cnVjdCBm
Yl9pbmZvICppbmZvKQo+ICAJc3RydWN0IGZiX3Zhcl9zY3JlZW5pbmZvICptb2RlID0gJmluZm8t
PnZhcjsKPiAgCXN0cnVjdCByYWRlb25fcmVncyAqbmV3bW9kZTsKPiAgCWludCBoVG90YWwsIHZU
b3RhbCwgaFN5bmNTdGFydCwgaFN5bmNFbmQsCj4gLQkgICAgaFN5bmNQb2wsIHZTeW5jU3RhcnQs
IHZTeW5jRW5kLCB2U3luY1BvbCwgY1N5bmM7Cj4gKwkgICAgdlN5bmNTdGFydCwgdlN5bmNFbmQs
IHZTeW5jUG9sLCBjU3luYzsKPiAgCXU4IGhzeW5jX2Fkal90YWJbXSA9IHswLCAweDEyLCA5LCA5
LCA2LCA1fTsKPiAgCXU4IGhzeW5jX2Z1ZGdlX2ZwW10gPSB7MiwgMiwgMCwgMCwgNSwgNX07Cj4g
IAl1MzIgc3luYywgaF9zeW5jX3BvbCwgdl9zeW5jX3BvbCwgZG90Q2xvY2ssIHBpeENsb2NrOwo+
IEBAIC0xNzMwLDcgKzE3MzAsNiBAQCBzdGF0aWMgaW50IHJhZGVvbmZiX3NldF9wYXIoc3RydWN0
IGZiX2luZm8gKmluZm8pCj4gIAllbHNlIGlmICh2c3luY193aWQgPiAweDFmKQkvKiBtYXggKi8K
PiAgCQl2c3luY193aWQgPSAweDFmOwo+ICAKPiAtCWhTeW5jUG9sID0gbW9kZS0+c3luYyAmIEZC
X1NZTkNfSE9SX0hJR0hfQUNUID8gMCA6IDE7Cj4gIAl2U3luY1BvbCA9IG1vZGUtPnN5bmMgJiBG
Ql9TWU5DX1ZFUlRfSElHSF9BQ1QgPyAwIDogMTsKPiAgCj4gIAljU3luYyA9IG1vZGUtPnN5bmMg
JiBGQl9TWU5DX0NPTVBfSElHSF9BQ1QgPyAoMSA8PCA0KSA6IDA7Cj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
