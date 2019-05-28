Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8BD2C5E1
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 13:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C0E6E222;
	Tue, 28 May 2019 11:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953E16E222
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 11:54:44 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190528115443euoutp01bf01297da5d0ec411079832a1c4d7bac~i1rKAKphB2664826648euoutp01P
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 11:54:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190528115443euoutp01bf01297da5d0ec411079832a1c4d7bac~i1rKAKphB2664826648euoutp01P
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190528115442eucas1p1d60daff913a120b783fb89ef8e55f5ac~i1rJsL2pZ3206732067eucas1p1d;
 Tue, 28 May 2019 11:54:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 7D.4E.04298.2812DEC5; Tue, 28
 May 2019 12:54:42 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190528115441eucas1p20663e0b0a816d3b5db0c2f7d0f2f8b48~i1rI363Gb1109311093eucas1p26;
 Tue, 28 May 2019 11:54:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190528115441eusmtrp2151af52d99a2acb2fec76ec57e26e290~i1rIl5DWm2558825588eusmtrp2a;
 Tue, 28 May 2019 11:54:41 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-d9-5ced21823345
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8E.2C.04140.1812DEC5; Tue, 28
 May 2019 12:54:41 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190528115441eusmtip23cd153683f68fadc6243182679dd581e~i1rIInK_p1299712997eusmtip2Q;
 Tue, 28 May 2019 11:54:41 +0000 (GMT)
Subject: Re: [PATCHv4 21/24] drm/bridge: tc358767: read display_props in
 get_modes()
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>, Andrey Gusakov
 <andrey.gusakov@cogentembedded.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Ujfalusi
 <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <097401ba-3b47-9973-2495-fc74afe90d9e@samsung.com>
Date: Tue, 28 May 2019 13:54:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528082747.3631-22-tomi.valkeinen@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0gUURiGPTOzs+PS6jhafmlRrlgoeAOJAVMMRJcIqj9hKeSWg1qulx01
 L5CLlq1roXkr11uSklioec36IazhesnSMFJD3cgMrUUzTUXUXEfJf895v+89533hUDjzRuRA
 RccmcqpYRYyMlBDtPWvv3TOdTGFeI2PH2SyNH5upV4vYv3l3CXZkeZ5kc3M0ItZYMYaxOQ9r
 xOzEZC/B6n6vitjGqnEyQCI3Fm9h8k7dhFhepikVyadyDZg8b8NLbhjtwC6QVySnI7iY6GRO
 5ekfLola6UqLX7dMaa7tR2pUQGmRJQW0D7SXfSW0SEIxdB2Chvp83Dxg6CUES3N+Av9BsPj8
 4p4h+0c1LhieIVitHCeFgwlB68CsSIsoypa+BAPFdmbdjq7EYSurBjO7SdoVNlrGSDNLaX8o
 VGvEZiZoF3gw/o4w80E6BKZ6mkTCjg30lU7v6Ja0Lyx9Me7s4/QxyGorwwW2h/HpKsz8GNB6
 MeSXNIiFqIHQYBgkBbaFOUPrrn4EtjqrMIEzYKruDi6YNQjamjpxYeAL3YbhnTb4durG156C
 fAa0899Jswy0FYyabIQMVlDQ/ggXZCloshlh2wmmBtt2L7SH2qHl3TRyKF8ZxPKRk25fS92+
 Zrp9zXT/MzxBRD2y55J4ZSTHe8dytzx4hZJPio30uB6nbEbbX2pg07D4Ci1/vKZHNIVkB6Th
 h01hjEiRzKcq9QgoXGYn9Sv6FcZIIxSpaZwq7qoqKYbj9ciRImT20nQLYyhDRyoSuZscF8+p
 9qYYZemgRoULxqXy1a176g67RleVi+d8L2O9sPatz+dE7ad1+oNHypCj7HbG05OGZKYoZvNx
 SILS5Hju5WSzc1Oo9FSbu8XseTwo+kZ3ef9gxNG3kz4VXdWHAj8bg6DUWXs/g6hJ77k848R7
 9zi0/AwlS+KDXSSL1glpwZqzBrdh/sVMcYCM4KMU3m64ilf8A6SzWRZOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xe7qNim9jDE6dVbVo7rC1aDrUwGrx
 rb+VxeLK1/dsFt2dHawWD+beZLLonLiE3eLuvRMsFrM+/mC1WD//FpsDl8eDqf+ZPHbOusvu
 MbtjJqvH/e7jTB79fw08jt/YzhTAFqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5r
 ZWSqpG9nk5Kak1mWWqRvl6CX8X1/VcFvzopNS08xNjBO4uhi5OSQEDCRaHu+kLmLkYtDSGAp
 o8TKm2eYIBLiErvnv2WGsIUl/lzrYgOxhQReM0o82pfexcjBISwQJnF6qghIr4jAAmaJOy1v
 2SEG7WOUmP7kHyNIA5uApsTfzTfBmnkF7CQmN3Swg9gsAqoSvbfOsIDYogIREmfer2CBqBGU
 ODnzCZjNKWAt8eX2A7B6ZgF1iT/zLjFD2PISzVtnQ9niEreezGeawCg4C0n7LCQts5C0zELS
 soCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgBG479nPLDsaud8GHGAU4GJV4eBMk38YI
 sSaWFVfmHmKU4GBWEuG1nfImRog3JbGyKrUoP76oNCe1+BCjKdBzE5mlRJPzgckhryTe0NTQ
 3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHpxQwYj5YMFsFMH9nTpq878xu3QAm
 MRt2zhl8izaUGLE7h93PkH8YHKcXLq0X5s4e9mvButfX7OPim2YpLXHfdmt9nVlId5PSL9uk
 2WfXivSvFf5aLWb+b3ly0FE/M82YiDhOEybNtRz7ClVu5W9cGFq4V0OFQbnGKdg5xnWRvNrb
 s3yWj1e0FSqxFGckGmoxFxUnAgDuRPqO1gIAAA==
X-CMS-MailID: 20190528115441eucas1p20663e0b0a816d3b5db0c2f7d0f2f8b48
X-Msg-Generator: CA
X-RootMTR: 20190528082904epcas1p12b3b2b43ee70af5b3269b3eb68851534
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190528082904epcas1p12b3b2b43ee70af5b3269b3eb68851534
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
 <CGME20190528082904epcas1p12b3b2b43ee70af5b3269b3eb68851534@epcas1p1.samsung.com>
 <20190528082747.3631-22-tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559044483;
 bh=bWFiO3A8rFUQcrI63KL/pVYmzJNxv30SkihTY8vg9M0=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=u/pfa4GeWk45YTykJwIvLHchIdcUnJQvoLXnb2Eeh34bxrzuyENFR1/l1k5bCvUX6
 E3LhU59fLVqhEPC9oiZ9Qrd8HAYrWrK7gFmCZamNfhQP/BayH20DMknzfI7Exoq1DM
 0DyEy+yu7zUCqBF6tvOO/ZXQc1q9IAjNk7oFyIFI=
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

T24gMjguMDUuMjAxOSAxMDoyNywgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gV2UgbmVlZCB0byBr
bm93IHRoZSBsaW5rIGJhbmR3aWR0aCB0byBmaWx0ZXIgb3V0IG1vZGVzIHdlIGNhbm5vdAo+IHN1
cHBvcnQsIHNvIHdlIG5lZWQgdG8gaGF2ZSByZWFkIHRoZSBkaXNwbGF5IHByb3BzIGJlZm9yZSBk
b2luZyB0aGUKPiBmaWx0ZXJpbmcuCj4KPiBUbyBlbnN1cmUgd2UgaGF2ZSB1cCB0byBkYXRlIGRp
c3BsYXkgcHJvcHMsIGNhbGwgdGNfZ2V0X2Rpc3BsYXlfcHJvcHMoKQo+IGluIHRoZSBiZWdpbm5p
bmcgb2YgdGNfY29ubmVjdG9yX2dldF9tb2RlcygpLgo+Cj4gU2lnbmVkLW9mZi1ieTogVG9taSBW
YWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCgpSZXZpZXdlZC1ieTogQW5kcnplaiBI
YWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpBbmRyemVqCgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCA3ICsrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+
IGluZGV4IGZmY2JlY2Y2OWQ0MC4uMmI5ZDYwNDZkNzZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGMzNTg3NjcuYwo+IEBAIC0xMTg4LDYgKzExODgsMTMgQEAgc3RhdGljIGludCB0Y19jb25uZWN0
b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIAlzdHJ1Y3Qg
dGNfZGF0YSAqdGMgPSBjb25uZWN0b3JfdG9fdGMoY29ubmVjdG9yKTsKPiAgCXN0cnVjdCBlZGlk
ICplZGlkOwo+ICAJdW5zaWduZWQgaW50IGNvdW50Owo+ICsJaW50IHJldDsKPiArCj4gKwlyZXQg
PSB0Y19nZXRfZGlzcGxheV9wcm9wcyh0Yyk7Cj4gKwlpZiAocmV0IDwgMCkgewo+ICsJCWRldl9l
cnIodGMtPmRldiwgImZhaWxlZCB0byByZWFkIGRpc3BsYXkgcHJvcHM6ICVkXG4iLCByZXQpOwo+
ICsJCXJldHVybiAwOwo+ICsJfQo+ICAKPiAgCWlmICh0Yy0+cGFuZWwgJiYgdGMtPnBhbmVsLT5m
dW5jcyAmJiB0Yy0+cGFuZWwtPmZ1bmNzLT5nZXRfbW9kZXMpIHsKPiAgCQljb3VudCA9IHRjLT5w
YW5lbC0+ZnVuY3MtPmdldF9tb2Rlcyh0Yy0+cGFuZWwpOwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
