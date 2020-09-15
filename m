Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEEB269F2C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90756E848;
	Tue, 15 Sep 2020 07:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9396E836
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 03:21:18 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7CC643E1173B17922E7C;
 Tue, 15 Sep 2020 11:21:15 +0800 (CST)
Received: from [10.174.179.92] (10.174.179.92) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 15 Sep 2020 11:21:06 +0800
Subject: Re: [PATCH] drm/panel: samsung: make vint_table static
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200912033817.142849-1-yanaijie@huawei.com>
 <20200915020400.GB15543@pendragon.ideasonboard.com>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <4b578b14-e109-3e65-72b2-080391919497@huawei.com>
Date: Tue, 15 Sep 2020 11:21:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200915020400.GB15543@pendragon.ideasonboard.com>
X-Originating-IP: [10.174.179.92]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 15 Sep 2020 07:07:18 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Hulk Robot <hulkci@huawei.com>, thierry.reding@gmail.com, sam@ravnborg.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CuWcqCAyMDIwLzkvMTUgMTA6MDQsIExhdXJlbnQgUGluY2hhcnQg5YaZ6YGTOgo+IEhpIEphc29u
LAo+IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIFNhdCwgU2VwIDEyLCAyMDIw
IGF0IDExOjM4OjE3QU0gKzA4MDAsIEphc29uIFlhbiB3cm90ZToKPj4gVGhpcyBlbGltaW5hdGVz
IHRoZSBmb2xsb3dpbmcgc3BhcnNlIHdhcm5pbmc6Cj4+Cj4+IGRyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1zYW1zdW5nLXM2ZTNoYTIuYzoyMTc6MTU6IHdhcm5pbmc6IHN5bWJvbAo+PiAndmlu
dF90YWJsZScgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPj4KPj4gUmVw
b3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTNoYTIuYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTNoYTIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTNoYTIuYwo+PiBpbmRleCAxZDFjNzlhMTg2MTMu
LmIzZjU3OTdjMjNlMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXNhbXN1bmctczZlM2hhMi5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1z
YW1zdW5nLXM2ZTNoYTIuYwo+PiBAQCAtMjE0LDcgKzIxNCw3IEBAIHN0YXRpYyBjb25zdCB1OCBn
YW1tYV90YmxbUzZFM0hBMl9OVU1fR0FNTUFfU1RFUFNdW1M2RTNIQTJfR0FNTUFfQ01EX0NOVF0g
PSB7Cj4+ICAgCSAgMHgwMCwgMHgwMCB9Cj4+ICAgfTsKPj4gICAKPj4gLXVuc2lnbmVkIGNoYXIg
dmludF90YWJsZVtTNkUzSEEyX1ZJTlRfU1RBVFVTX01BWF0gPSB7Cj4+ICtzdGF0aWMgdW5zaWdu
ZWQgY2hhciB2aW50X3RhYmxlW1M2RTNIQTJfVklOVF9TVEFUVVNfTUFYXSA9IHsKPiAKPiBTaG91
bGRuJ3QgaXQgYmUgY29uc3QsIHdoaWxlIGF0IGl0ID8KClllcywgSSB3aWxsIHNlbmQgdjIuCgo+
IAo+PiAgIAkweDE4LCAweDE5LCAweDFhLCAweDFiLCAweDFjLAo+PiAgIAkweDFkLCAweDFlLCAw
eDFmLCAweDIwLCAweDIxCj4+ICAgfTsKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
