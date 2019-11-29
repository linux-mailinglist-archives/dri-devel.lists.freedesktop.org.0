Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB27610D708
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 15:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081D86E91C;
	Fri, 29 Nov 2019 14:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240106E91C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:32:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B1F3A2929F0;
 Fri, 29 Nov 2019 14:31:58 +0000 (GMT)
Date: Fri, 29 Nov 2019 15:31:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 1/8] drm/panfrost: Make panfrost_job_run() return an
 ERR_PTR() instead of NULL
Message-ID: <20191129153155.78003c4e@collabora.com>
In-Reply-To: <7444054c-52b4-32d1-70c2-52bf9c5f2871@arm.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-2-boris.brezillon@collabora.com>
 <7444054c-52b4-32d1-70c2-52bf9c5f2871@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOSBOb3YgMjAxOSAxNDoxOTo1MCArMDAwMApTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPiB3cm90ZToKCj4gT24gMjkvMTEvMjAxOSAxMzo1OSwgQm9yaXMgQnJlemls
bG9uIHdyb3RlOgo+ID4gSWYgd2UgZG9uJ3QgZG8gdGhhdCwgZG1hX2ZlbmNlX3NldF9lcnJvcigp
IGNvbXBsYWlucyAoY2FsbGVkIGZyb20KPiA+IGRybV9zY2hlZF9tYWluKCkpLgo+ID4gCj4gPiBG
aXhlczogZjNiYTkxMjI4ZThlICgiZHJtL3BhbmZyb3N0OiBBZGQgaW5pdGlhbCBwYW5mcm9zdCBk
cml2ZXIiKQo+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+ID4gU2lnbmVkLW9mZi1i
eTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gIAo+IAo+
IFRoaXMgbWlnaHQgYmUgd29ydGggZG9pbmcsIGJ1dCBhY3R1YWxseSBpdCdzIG5vdCBQYW5mcm9z
dCB0aGF0IGlzIGJyb2tlbgo+IGl0J3MgdGhlIGNhbGxlcnMsIHNlZSBbMV0gYW5kIFsyXS4gU28g
SSBkb24ndCB0aGluayB3ZSB3YW50IHRoZQo+IEZpeGVzL3N0YWJsZSB0YWcuCgpPa2F5LgoKPiAK
PiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTIxODM5OS8KPiBbMl0g
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTI2NzA3My8KPiAKPiA+IC0tLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyB8IDQgKystLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKPiA+IGluZGV4IDIxZjM0ZDQ0
YWFjMi4uY2RkOTQ0OGZiYmRkIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2pvYi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3Rfam9iLmMKPiA+IEBAIC0zMjgsMTMgKzMyOCwxMyBAQCBzdGF0aWMgc3RydWN0IGRtYV9m
ZW5jZSAqcGFuZnJvc3Rfam9iX3J1bihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQo+
ID4gIAlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSA9IE5VTEw7Cj4gPiAgCj4gPiAgCWlmICh1bmxp
a2VseShqb2ItPmJhc2Uuc19mZW5jZS0+ZmluaXNoZWQuZXJyb3IpKQo+ID4gLQkJcmV0dXJuIE5V
TEw7Cj4gPiArCQlyZXR1cm4gRVJSX1BUUihqb2ItPmJhc2Uuc19mZW5jZS0+ZmluaXNoZWQuZXJy
b3IpOwoKSG0sIHNvIHdlIGNhbiBrZWVwIHRoZSByZXR1cm4gTlVMTCBoZXJlIGlmIFsxXSBpcyBh
cHBsaWVkICh0aGUgZXJyb3IKaXMgcHJlc2VydmVkKSwgYnV0IEknbSBub3Qgc3VyZSBpdCdzIGNs
ZWFyZXIgdGhhdCB3YXkuCgo+ID4gIAo+ID4gIAlwZmRldi0+am9ic1tzbG90XSA9IGpvYjsKPiA+
ICAKPiA+ICAJZmVuY2UgPSBwYW5mcm9zdF9mZW5jZV9jcmVhdGUocGZkZXYsIHNsb3QpOwo+ID4g
IAlpZiAoSVNfRVJSKGZlbmNlKSkKPiA+IC0JCXJldHVybiBOVUxMOwo+ID4gKwkJcmV0dXJuIEVS
Ul9QVFIoLUVOT01FTSk7ICAKClRoaXMgb25lIHNob3VsZCBiZSBmaXhlZCB0aG91Z2gsIG90aGVy
d2lzZSB0aGUgZXJyb3IgaXMgbmV2ZXIgdXBkYXRlZCwKc28gSSdtIHdvbmRlcmluZyBpZiBpdCBk
b2Vzbid0IGRlc2VydmUgYSBGaXhlcyB0YWcgaW4gdGhlIGVuZC4uLgoKPiAKPiBXaHkgb3ZlcnJp
ZGUgdGhlIGVycm9yIGZyb20gcGFuZnJvc3RfZmVuY2VfY3JlYXRlPyBJbiB0aGlzIGNhc2Ugd2Ug
Y2FuIGp1c3Q6Cj4gCj4gCXJldHVybiBmZW5jZTsKCkluZGVlZC4KCj4gCj4gU3RldmUKPiAKPiA+
ICAKPiA+ICAJaWYgKGpvYi0+ZG9uZV9mZW5jZSkKPiA+ICAJCWRtYV9mZW5jZV9wdXQoam9iLT5k
b25lX2ZlbmNlKTsKPiA+ICAgCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
