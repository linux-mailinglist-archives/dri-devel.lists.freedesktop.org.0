Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B85F4E47
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 15:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9D86F9B7;
	Fri,  8 Nov 2019 14:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E146F9B7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 14:39:50 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191108143948euoutp0127ebcc6811be0a3e61c9c1054b710eac~VNuH38lET3073730737euoutp01K
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 14:39:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191108143948euoutp0127ebcc6811be0a3e61c9c1054b710eac~VNuH38lET3073730737euoutp01K
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191108143948eucas1p2b2c756dcdd6e0f8791a6282eb71dd3c0~VNuHypcrP0626906269eucas1p2S;
 Fri,  8 Nov 2019 14:39:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C8.3C.04469.43E75CD5; Fri,  8
 Nov 2019 14:39:48 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191108143948eucas1p29ae2cf253068f2b62af12720669614fb~VNuHThaJv0626906269eucas1p2R;
 Fri,  8 Nov 2019 14:39:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191108143948eusmtrp140652a1479d6fdc751fec181be2ef06d~VNuHNtxvY1383413834eusmtrp1X;
 Fri,  8 Nov 2019 14:39:48 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-cd-5dc57e3460f5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E7.99.04117.43E75CD5; Fri,  8
 Nov 2019 14:39:48 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191108143947eusmtip2fb7dcbfd588e54581fcccae15248c7ab~VNuGsSw031049310493eusmtip2s;
 Fri,  8 Nov 2019 14:39:47 +0000 (GMT)
Subject: Re: [PATCH 06/46] ARM: pxa: stop using mach/bitfield.h
To: Arnd Bergmann <arnd@arndb.de>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <ec86366a-c2fc-9400-31dc-ed1440ec9904@samsung.com>
Date: Fri, 8 Nov 2019 15:39:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191018154201.1276638-6-arnd@arndb.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRj22zlnOxMnn/OyV7OkEYHhJcNolFhC1H74I/olleXMk1o6dcd7
 ZGZR4gWvIQ5DS8vSUjHzjqWmppaZloWlDRJRc5SXEWrTdnaU/Pe8z/O8l+fjowlpO+VEh6tj
 GY1aFSEXWpKNvStD7t4pPYH7DcMHFMb8XpEizThHKj4afgkVwzWHFIV/KwWK+h9jlGK0tUSo
 0M7bHqOVa6v5SJlTs0QpW7QTIuW3sXah8ntmn0D5vOK6cql+l7KprZI8RZ+x9AlhIsLjGY2n
 b5BlWOlysSi6wyHxnl6LUlGjNAOJacDekKdrF2YgS1qKHyOo+aOjOEGKlxHUrlG8sIRgZqpN
 uNXxsHmV5IVKBEPpGyK+0CNoyHwh4Fy2+CjU94+IOGyHd8PdmWmCMxE4SwD3B8tJThDiw5B3
 pwpxWIJ9YTZbb8Yk3gNvZ96bsT0OgEVdN8V7bKC/eMrcK8YHoboz18wTWAbjU6UCHrtAk77E
 vAzwkAjKOmpNAm0qjsObT758BFuY62sQ8dgZBguySN5fg8CYPrPZ3ISgsmB9M/QR6O77QHGD
 COwKta2ePO0HTxe5o7n51vBFb8PfYA35jUUET0sg/fbmW++Fukd1wq21GS1PiFwk125Lpt2W
 Rrstjfb/3jJEViEZE8dGhjKsl5pJ8GBVkWycOtTjYlRkPTL9qcH1vsVmZBgJ7kKYRnIrSYDz
 60AppYpnkyK7ENCE3E4ivmWiJCGqpGRGE3VBExfBsF1oB03KZZKrFrqzUhyqimWuMEw0o9lS
 BbTYKRURCb93+vlXJ7E9ruMpyVmJbuJLaka6QCZgV9nlDfHoDdrRhnK0nzR8HTo51fTumdjZ
 o6Pi5YmbFmMVZfqsn9MLD7IdZoOLjPNpzqEyH8lA4umBhN7OoBzD6go7Vubu/zkwvDpm0qoq
 2O2868SruOm6cqLcpVBGxZTaXWskdefkJBum8tpHaFjVPwtjp0BPAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xe7omdUdjDf784bH4O+kYu0XT31cs
 Fle+vmezuLDO3GLKn+VMFpseX2O1uLxrDpvFrDfCDhwev39NYvToX/eZ1WPnrLvsHneu7WHz
 uN99nMlj85J6j8+b5Dy2717OEsARpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtl
 ZKqkb2eTkpqTWZZapG+XoJcx/8tM9oJ9YhVz385ibGDcJtTFyMkhIWAisXTHL5YuRi4OIYGl
 jBI37i5j62LkAErISBxfXwZRIyzx51oXG0TNa0aJNzNbWEASwgL2EptOXmIHsUUEFCWmvnjG
 DFLELNDDJLF61xOojs2MEv3XbjOBVLEJWElMbF/FCGLzCthJvOx9C2azCKhInHlxHswWFYiQ
 OLxjFlSNoMTJmU/AtnEKmEqsPjiBFcRmFlCX+DPvEjOELS5x68l8JghbXmL72znMExiFZiFp
 n4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjMxtx35u2cHY9S74EKMA
 B6MSD++L6qOxQqyJZcWVuYcYJTiYlUR4OVuOxArxpiRWVqUW5ccXleakFh9iNAV6biKzlGhy
 PjBp5JXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYPS72isxq8fm
 XhX74rBuF1WRO7XLlFnuH059oZ2mYn20/cVC/+ufVv1f/zlzgq9JatkmI7k1LgeS4tyUzscG
 7J+uLiEXLvBIm/3dnEOC/avXZu8/IsBlFJ7//2iXhMoMxkLXCcVPP+e7bg7pSJjI15yedcHf
 99N3Xpf1zgsKbnnUaPG49DWXKrEUZyQaajEXFScCAH5ir3viAgAA
X-CMS-MailID: 20191108143948eucas1p29ae2cf253068f2b62af12720669614fb
X-Msg-Generator: CA
X-RootMTR: 20191018154225epcas4p2b2e722620511ada1014107d9e100ab35
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191018154225epcas4p2b2e722620511ada1014107d9e100ab35
References: <20191018154052.1276506-1-arnd@arndb.de>
 <CGME20191018154225epcas4p2b2e722620511ada1014107d9e100ab35@epcas4p2.samsung.com>
 <20191018154201.1276638-6-arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1573223989;
 bh=WRCpWfnxwI9IkpzX1p5dfM2HQZ4Vsv8ktaxb/cXKeoQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=C21Z+1B7T/a716efS4zN5pAstupQdaH2NBcQCIp//eTIzrcMFEHubD0goUrHDV3bQ
 UReIQtZkbRBevzVAX8zR3Lj3V/qla7f7jkCZg4GmCEtG7FnT4MqO4I7PtuW4evfzm3
 LVqoCPRAk1lSH48zUUp+PebyvsaEO5PY+b9iigyY=
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEwLzE4LzE5IDU6NDEgUE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gVGhlcmUgYXJlIHR3
byBpZGVudGljYWwgY29waWVzIG9mIG1hY2gvYml0ZmllbGQuaCwgb25lIGZvcgo+IG1hY2gtc2Ex
MTAwIGFuZCBvbmUgZm9yIG1hY2gtcHhhLiBUaGUgcHhhZmIgZHJpdmVyIG9ubHkKPiBtYWtlcyB1
c2Ugb2YgdHdvIG1hY3Jvcywgd2hpY2ggY2FuIGJlIHRyaXZpYWxseSBvcGVuLWNvZGVkCj4gaW4g
dGhlIGhlYWRlci4KPiAKPiBDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVy
a2llQHNhbXN1bmcuY29tPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
U2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCkFja2VkLWJ5OiBC
YXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CgpCZXN0
IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0
dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNzCgo+IC0tLQo+ICBhcmNoL2FybS9tYWNoLXB4
YS9pZHAuYyAgICAgICAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9tYWNoLXB4YS9pbmNs
dWRlL21hY2gvcmVncy1sY2QuaCB8IDUgKysrLS0KPiAgYXJjaC9hcm0vbWFjaC1weGEvcmVncy11
MmQuaCAgICAgICAgICAgICAgfCAyIC0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvcHhhZmIuYyAg
ICAgICAgICAgICAgIHwgMSAtCj4gIDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXB4YS9pZHAuYyBi
L2FyY2gvYXJtL21hY2gtcHhhL2lkcC5jCj4gaW5kZXggNTdjMDUxMTQ3MmJjLi41MjVkMDFkZGZi
YmIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1weGEvaWRwLmMKPiArKysgYi9hcmNoL2Fy
bS9tYWNoLXB4YS9pZHAuYwo+IEBAIC0zMCw3ICszMCw2IEBACj4gICNpbmNsdWRlICJweGEyNXgu
aCIKPiAgI2luY2x1ZGUgImlkcC5oIgo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGF0YS92
aWRlby1weGFmYi5oPgo+IC0jaW5jbHVkZSA8bWFjaC9iaXRmaWVsZC5oPgo+ICAjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGF0YS9tbWMtcHhhbWNpLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zbWM5
MXguaD4KPiAgCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtcHhhL2luY2x1ZGUvbWFjaC9y
ZWdzLWxjZC5oIGIvYXJjaC9hcm0vbWFjaC1weGEvaW5jbHVkZS9tYWNoL3JlZ3MtbGNkLmgKPiBp
bmRleCBlMmI2ZTNkMWY2MjUuLjZhNDM0Njc1Zjg0YSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9t
YWNoLXB4YS9pbmNsdWRlL21hY2gvcmVncy1sY2QuaAo+ICsrKyBiL2FyY2gvYXJtL21hY2gtcHhh
L2luY2x1ZGUvbWFjaC9yZWdzLWxjZC5oCj4gQEAgLTIsOCArMiw2IEBACj4gICNpZm5kZWYgX19B
U01fQVJDSF9SRUdTX0xDRF9ICj4gICNkZWZpbmUgX19BU01fQVJDSF9SRUdTX0xDRF9ICj4gIAo+
IC0jaW5jbHVkZSA8bWFjaC9iaXRmaWVsZC5oPgo+IC0KPiAgLyoKPiAgICogTENEIENvbnRyb2xs
ZXIgUmVnaXN0ZXJzIGFuZCBCaXRzIERlZmluaXRpb25zCj4gICAqLwo+IEBAIC04Niw2ICs4NCw5
IEBACj4gICNkZWZpbmUgTENDUjBfT1VDCSgxIDw8IDI1KQkvKiBPdmVybGF5IFVuZGVybGF5IGNv
bnRyb2wgYml0ICovCj4gICNkZWZpbmUgTENDUjBfTEREQUxUCSgxIDw8IDI2KQkvKiBMREQgYWx0
ZXJuYXRlIG1hcHBpbmcgY29udHJvbCAqLwo+ICAKPiArI2RlZmluZSBGbGQoU2l6ZSwgU2hmdCkJ
KCgoU2l6ZSkgPDwgMTYpICsgKFNoZnQpKQo+ICsjZGVmaW5lIEZTaGZ0KEZpZWxkKQkoKEZpZWxk
KSAmIDB4MDAwMEZGRkYpCj4gKwo+ICAjZGVmaW5lIExDQ1IxX1BQTAlGbGQgKDEwLCAwKQkvKiBQ
aXhlbHMgUGVyIExpbmUgLSAxICovCj4gICNkZWZpbmUgTENDUjFfRGlzV2R0aChQaXhlbCkJKCgo
UGl4ZWwpIC0gMSkgPDwgRlNoZnQgKExDQ1IxX1BQTCkpCj4gIAo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9tYWNoLXB4YS9yZWdzLXUyZC5oIGIvYXJjaC9hcm0vbWFjaC1weGEvcmVncy11MmQuaAo+
IGluZGV4IGZlNGM4MGFkODdlYy4uYWI1MTdiYTYyYzlhIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJt
L21hY2gtcHhhL3JlZ3MtdTJkLmgKPiArKysgYi9hcmNoL2FybS9tYWNoLXB4YS9yZWdzLXUyZC5o
Cj4gQEAgLTIsOCArMiw2IEBACj4gICNpZm5kZWYgX19BU01fQVJDSF9QWEEzeHhfVTJEX0gKPiAg
I2RlZmluZSBfX0FTTV9BUkNIX1BYQTN4eF9VMkRfSAo+ICAKPiAtI2luY2x1ZGUgPG1hY2gvYml0
ZmllbGQuaD4KPiAtCj4gIC8qCj4gICAqIFVTQjIgZGV2aWNlIGNvbnRyb2xsZXIgcmVnaXN0ZXJz
IGFuZCBiaXRzIGRlZmluaXRpb25zCj4gICAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L3B4YWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YWZiLmMKPiBpbmRleCBlY2U2
OTFhMGYxOGEuLmU2OGI4YTY5ZGI5MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L3B4YWZiLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YWZiLmMKPiBAQCAtNjQsNyAr
NjQsNiBAQAo+ICAjaW5jbHVkZSA8YXNtL2lvLmg+Cj4gICNpbmNsdWRlIDxhc20vaXJxLmg+Cj4g
ICNpbmNsdWRlIDxhc20vZGl2NjQuaD4KPiAtI2luY2x1ZGUgPG1hY2gvYml0ZmllbGQuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RhdGEvdmlkZW8tcHhhZmIuaD4KPiAgCj4gIC8qCj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
