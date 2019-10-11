Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A015D41DA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 15:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4470A6EC45;
	Fri, 11 Oct 2019 13:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EA16EC44
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 13:54:56 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191011135455euoutp02f4905049471332228b945d3cbe6579f8~MnC7qIx7T3112031120euoutp02w
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 13:54:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191011135455euoutp02f4905049471332228b945d3cbe6579f8~MnC7qIx7T3112031120euoutp02w
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191011135455eucas1p2bdb4c611856fdcd85aba0ed4e2c090bd~MnC7XWdHu3271332713eucas1p2c;
 Fri, 11 Oct 2019 13:54:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id CA.C4.04309.EA980AD5; Fri, 11
 Oct 2019 14:54:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191011135454eucas1p22a68b1487035c582b0e2bb6dde10b795~MnC7AFeUk3271932719eucas1p2Z;
 Fri, 11 Oct 2019 13:54:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191011135454eusmtrp102037f6c5a01854012a2225eebf4d0ad~MnC6-MhFH2735327353eusmtrp1k;
 Fri, 11 Oct 2019 13:54:54 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-bf-5da089ae3f2b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 71.95.04117.EA980AD5; Fri, 11
 Oct 2019 14:54:54 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191011135453eusmtip1ead68e86d286a85748edd3382fa06059~MnC6NqZOc2442424424eusmtip19;
 Fri, 11 Oct 2019 13:54:53 +0000 (GMT)
Subject: Re: [PATCH v2 04/21] drm/exynos: Fix potential unbalanced calls to
 pm_runtime_put
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <19d2998a-1b54-f5c2-1c9c-3eeced8b6f6d@samsung.com>
Date: Fri, 11 Oct 2019 15:54:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190826152649.13820-5-boris.brezillon@collabora.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0wTWRT2ztxOB2LJdaj2BDXEGmM0Cj6T64rGjbubya4/jD+ICkRHmSCh
 gGnBd9QgmorYRQgKFbQaDMQYfNSiEDFaH7XWaq1S0YSHim9YfFAXVoV1GIz8+873ne+c79xc
 nhVsXAyfnpUjm7Mkk5GLxHU3++5Nr93rSJnx5VEC3WVdQH13bjPUkfePhg7UHWDpw3A3R4vb
 ijBt+vcNS72dTZi+br2PqfNuoYb68zq1tL3yMUP3HqjSUrctibafzqAtrbcwfXWsl6U1fS5E
 y0recLSv4QhepBe7m3drxfbSAUa82FKFxMbPDizW21u04mFruUa8VRRkxLZ9Hkb8+9sMsepg
 Eyfazp9E4pX9JVi8W+pnlupWRiakyqb0DbI5fuHqyHX+yutovU2/qSN8VbsT5ZMCxPNA5kD9
 M3MBiuQFUoPA2diD1aIHQfkjN6cWnxBcDt5gC1DEoKPzTMUgFkg1gl35Q/YuBKW3XVgRokky
 NHtqNQrWk0R4PlCGlCaWPNCA/1IFUgSOTIFvzseckkNHFsKDnkSFxmQSBF4GsUKPJsvBF5YU
 WkdGgbe8Y3B8BFkM7zv2DGKWxMKFLjUPSwzwpOMoo6wCcp2HYOPbodC/wbugi1NxNLz1nNeq
 eBz4SgqxindAW00+q5qtCFxn6ofM8+Ga575GCcR+z3y6IV6lfwXv/m6sPmMUNHeNUjNEQXHd
 IValdWDdI6jdE6DN7xoaaIATgTBXhIz2YZfZh11jH3aN/edeB8InkUHOtWSmyZZZWfLGOIuU
 acnNSotbm515Dn3/pb5+T89F1PB1jRsRHhlH6qxWR4qgkTZYNme6EfCsUa87bq9IEXSp0uYt
 sjl7lTnXJFvcaCyPjQbd1hHtSQJJk3LkDFleL5t/qAwfEbMTjf9ouyP8vuRL6x/SX2uqsyXT
 65iqcOwp05izvquTGYOz96gvEF+IoTPtY0juFUwB07wJXRnJoWIp4cqCd6GmRH1o0cTKuYHk
 ol/iqqOTpngdA7XLZmn7+/e9tEYVT1uR1y/9t/1pruHDuNlLc7alOtPzX2T8uSz187bY7k3e
 UFm9EVvWSTOnsmaL9D+8O851oQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfyyUcRzH973nubuHuvU4J9/5J12ZaXOcX/f1M9YfHn/VxqyF6cYz5H7o
 nmP0TyYZV35P5TiuMLGG5TfZotaRUBfC5leJ6NAfKRaJO23+e+39/rw+22f7EBi/hu1AJCnU
 tEohlQk51vjwX8Osa1OePsa9tfI8upMbiIbfvWUhfdYGG+13FGNofGuTg0rmi3A08XsVQ0Om
 CRx9m/uAo9bR+2w0kmXiogXdNAvlFddy0UBBFFpoTkazc4M4Wnm8jaGnO+0APSpd5aCdnio8
 WEBtTt3lUgtl+yyqa7YWUH2/9DjVrZ3lUhW55WxqsMjIoubvGVhU4Z47VftggkMVtDUC6mV+
 KU6Nlo2wrvCuiQJUylQ17ZioZNSBwigx8hCJfZHIw8tXJPaUxPh5eAvdggLiaVlSGq1yC7ou
 ShzRvQYpBYL0pa1+bibIJjXAioCkFzS1VGIaYE3wyToAXxW045bCHvZWr2MWtoW7kxqOZeg7
 gEMmHfuwsCWj4ZShycwCMhKuGxvMMkZ+YkNT9ymLMAbgYkkv57DgkC5wr3X6gAmCRwbBjz8j
 D2OcdILvl41m1468Clc6p8Ah80gbOFS+ZM6tyEvwx1LO0X5nuFtlxCx8BnauVx6xPZxZqmYV
 Ab72mK49pmiPKdpjih7gjUBApzLyBDnjIWKkciZVkSCKU8qfg4MH6Xiz09YFNBvhA4AkgPAk
 zz1HH8NnS9OYDPkAgAQmFPCeaCtj+Lx4acYtWqWMVaXKaGYAeB8cV4w52MUpD95NoY4Ve4sl
 yFcs8ZR4+iChPS+X7I/mkwlSNZ1M0ym06r/HIqwcMkFnXDM79/bamKP8RUVYXGzNcM8zr9N+
 Gsl4b84N+CdZFtq3dzkicfBmiKLdJURlnwKLggzL0Z/P+qe3pthE1PuJdA/lDcjVuy7/RHNe
 wExIOHbuS6w+ryTcp6OlJPvrnGl4Ldi23qm2OUK2bSQLJ+3CFkPHLuZEJvc2dfjrnNVCnEmU
 ii9gKkb6DyzIYmw2AwAA
X-CMS-MailID: 20191011135454eucas1p22a68b1487035c582b0e2bb6dde10b795
X-Msg-Generator: CA
X-RootMTR: 20190826152700epcas1p34f6efa9f4c77885901f4cb9181bcaffe
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190826152700epcas1p34f6efa9f4c77885901f4cb9181bcaffe
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <CGME20190826152700epcas1p34f6efa9f4c77885901f4cb9181bcaffe@epcas1p3.samsung.com>
 <20190826152649.13820-5-boris.brezillon@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1570802095;
 bh=AmIsxE9NF7Diclb4hfEVs+Qafvl7WtT5nrTdu5FgFX4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=iwHBX8e899Ld88sB5tfoO6C98gzp6uOn4/3XsNMaYH79O8AClS9+4baBaQK+crFdH
 tZlLcGu6VnR5t/4yL3Vc+haoR/8c6TwYyM3d8nrJUpudSxBbNpjm5e7EU844kaW3Lz
 nQn9Zv3sXh9HYEbrsXyNZX4y+HWROyvq7PosN/Lo=
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYuMDguMjAxOSAxNzoyNiwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IFRoZSBlbmNvZGVy
LT5lbmFibGUoKSBjYW4ndCByZXBvcnQgZXJyb3JzIGFuZCBpcyBleHBlY3RlZCB0byBhbHdheXMK
PiBzdWNjZWVkLiBJZiB3ZSBjYWxsIHBtX3J1bnRpbWVfcHV0KCkgaW4gdGhlIGV4eW5vc19kc2lf
ZW5hYmxlKCkgZXJyb3IKPiBwYXRoIChhcyBjdXJyZW50bHkgZG9uZSkgd2UnbGwgaGF2ZSB1bmJh
bGFuY2VkIGdldC9wdXQgY2FsbHMgd2hlbgo+IGVuY29kZXItPmRpc2FibGUoKSBpcyBjYWxsZWQu
CgoKVHJ1ZQoKCj4KPiBUaGUgc2l0dWF0aW9uIGlzIG5vdCBpZGVhbCBzaW5jZSBkcm1fcGFuZWxf
e3ByZXBhcmUsZW5hYmxlfSgpIGNhbgo+IHRoZW9yZXRpY2FsbHkgcmV0dXJuIGFuIGVycm9yIChl
dmVuIGlmIGluIHByYWN0aWNlIEkgZG9uJ3QgdGhpbmsgYW55Cj4gcGFuZWwgZHJpdmVyIGRvZXMg
dGhhdCkuCgoKU28gd2h5IGRvIHlvdSB3YW50IHRvIGZpeCBpdCBhdCBhbGwsIGlmIHlvdSB0aGlu
ayByZXR1cm4gdmFsdWUgaXMgYWx3YXlzCjAgOikgPwoKCmdpdCBncmVwIC1wIC1BMzAgJ19wcmVw
YXJlJyBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvIHNob3dzIHRoYXQgbWFueSBvZgp0aGVtIGNhbiBy
ZXR1cm4gZXJyb3JzLgoKCj4gIFB1dHRpbmcgYSBXQVJOX09OKCkgaXMgdGhlIGJlc3Qgd2UgY2Fu
IGRvLAo+IHVuZm9ydHVuYXRlbHkuCgoKSSBndWVzcyBvcHRpbWFsbHkgd2Ugc2hvdWxkIHVzZSBE
Uk1fTU9ERV9MSU5LX1NUQVRVU19CQUQsIGJ1dCBJIGFtIG5vdApzdXJlIGhvdyBleGFjdGx5IGl0
IHNob3VsZCBiZSBoYW5kbGVkLgoKCj4gTm90ZSB0aGF0IC1FTk9TWVMgaXMgYWN0dWFsbHkgYSB2
YWxpZCBjYXNlLCBpdCBqdXN0Cj4gbWVhbnMgdGhlIHBhbmVsIGRyaXZlciBkb2VzIG5vdCBpbXBs
ZW1lbnQgdGhlIGhvb2suCgoKSXQgd291bGQgYmUgZ29vZCB0aGVuIHRvIGZpeCBpdCBpbiBwYW5l
bCBmcmFtZXdvcmssIGllIHdpdGhvdXQgaG9vawpkcm1fcGFuZWxfKiBmdW5jdGlvbiBzaG91bGQg
cmV0dXJuIDAsIEVOT1NZUyBtYWtlcyBubyBzZW5zZSBoZXJlLgoKClJlZ2FyZHMKCkFuZHJ6ZWoK
Cgo+Cj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29s
bGFib3JhLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+ICogTmV3IHBhdGNoCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYyB8IDE0ICsrLS0tLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYyBi
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYwo+IGluZGV4IDhlNjU1YWUx
ZmIwYy4uYzU1NWNlY2ZlMWY1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9kc2kuYwo+IEBAIC0xMzg3LDggKzEzODcsNyBAQCBzdGF0aWMgdm9pZCBleHlub3NfZHNpX2Vu
YWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4gIAo+ICAJaWYgKGRzaS0+cGFuZWwp
IHsKPiAgCQlyZXQgPSBkcm1fcGFuZWxfcHJlcGFyZShkc2ktPnBhbmVsKTsKPiAtCQlpZiAocmV0
IDwgMCkKPiAtCQkJZ290byBlcnJfcHV0X3N5bmM7Cj4gKwkJV0FSTl9PTihyZXQgJiYgcmV0ICE9
IC1FTk9TWVMpOwo+ICAJfSBlbHNlIHsKPiAgCQlkcm1fYnJpZGdlX3ByZV9lbmFibGUoZHNpLT5v
dXRfYnJpZGdlKTsKPiAgCX0KPiBAQCAtMTM5OCwyMiArMTM5NywxMyBAQCBzdGF0aWMgdm9pZCBl
eHlub3NfZHNpX2VuYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4gIAo+ICAJaWYg
KGRzaS0+cGFuZWwpIHsKPiAgCQlyZXQgPSBkcm1fcGFuZWxfZW5hYmxlKGRzaS0+cGFuZWwpOwo+
IC0JCWlmIChyZXQgPCAwKQo+IC0JCQlnb3RvIGVycl9kaXNwbGF5X2Rpc2FibGU7Cj4gKwkJV0FS
Tl9PTihyZXQgJiYgcmV0ICE9IC1FTk9TWVMpOwo+ICAJfSBlbHNlIHsKPiAgCQlkcm1fYnJpZGdl
X2VuYWJsZShkc2ktPm91dF9icmlkZ2UpOwo+ICAJfQo+ICAKPiAgCWRzaS0+c3RhdGUgfD0gRFNJ
TV9TVEFURV9WSURPVVRfQVZBSUxBQkxFOwo+ICAJcmV0dXJuOwo+IC0KPiAtZXJyX2Rpc3BsYXlf
ZGlzYWJsZToKPiAtCWV4eW5vc19kc2lfc2V0X2Rpc3BsYXlfZW5hYmxlKGRzaSwgZmFsc2UpOwo+
IC0JZHJtX3BhbmVsX3VucHJlcGFyZShkc2ktPnBhbmVsKTsKPiAtCj4gLWVycl9wdXRfc3luYzoK
PiAtCWRzaS0+c3RhdGUgJj0gfkRTSU1fU1RBVEVfRU5BQkxFRDsKPiAtCXBtX3J1bnRpbWVfcHV0
KGRzaS0+ZGV2KTsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgZXh5bm9zX2RzaV9kaXNhYmxlKHN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
