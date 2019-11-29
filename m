Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A364C10D723
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 15:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0D66E923;
	Fri, 29 Nov 2019 14:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A08216E923
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:38:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4764A1FB;
 Fri, 29 Nov 2019 06:38:52 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 943A03F6C4;
 Fri, 29 Nov 2019 06:38:51 -0800 (PST)
Subject: Re: [PATCH 1/8] drm/panfrost: Make panfrost_job_run() return an
 ERR_PTR() instead of NULL
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-2-boris.brezillon@collabora.com>
 <7444054c-52b4-32d1-70c2-52bf9c5f2871@arm.com>
 <20191129153155.78003c4e@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <8bd2367c-00a9-bee0-a1a3-c0b9a5ac716f@arm.com>
Date: Fri, 29 Nov 2019 14:38:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191129153155.78003c4e@collabora.com>
Content-Language: en-US
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMTEvMjAxOSAxNDozMSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IE9uIEZyaSwgMjkg
Tm92IDIwMTkgMTQ6MTk6NTAgKzAwMDAKPiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0u
Y29tPiB3cm90ZToKPiAKPj4gT24gMjkvMTEvMjAxOSAxMzo1OSwgQm9yaXMgQnJlemlsbG9uIHdy
b3RlOgo+Pj4gSWYgd2UgZG9uJ3QgZG8gdGhhdCwgZG1hX2ZlbmNlX3NldF9lcnJvcigpIGNvbXBs
YWlucyAoY2FsbGVkIGZyb20KPj4+IGRybV9zY2hlZF9tYWluKCkpLgo+Pj4KPj4+IEZpeGVzOiBm
M2JhOTEyMjhlOGUgKCJkcm0vcGFuZnJvc3Q6IEFkZCBpbml0aWFsIHBhbmZyb3N0IGRyaXZlciIp
Cj4+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiAgCj4+Cj4+IFRoaXMg
bWlnaHQgYmUgd29ydGggZG9pbmcsIGJ1dCBhY3R1YWxseSBpdCdzIG5vdCBQYW5mcm9zdCB0aGF0
IGlzIGJyb2tlbgo+PiBpdCdzIHRoZSBjYWxsZXJzLCBzZWUgWzFdIGFuZCBbMl0uIFNvIEkgZG9u
J3QgdGhpbmsgd2Ugd2FudCB0aGUKPj4gRml4ZXMvc3RhYmxlIHRhZy4KPiAKPiBPa2F5Lgo+IAo+
Pgo+PiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTIxODM5OS8KPj4g
WzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEyNjcwNzMvCj4+Cj4+PiAt
LS0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgfCA0ICsrLS0K
Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKPj4+IGluZGV4IDIxZjM0
ZDQ0YWFjMi4uY2RkOTQ0OGZiYmRkIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2pvYi5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3Rfam9iLmMKPj4+IEBAIC0zMjgsMTMgKzMyOCwxMyBAQCBzdGF0aWMgc3RydWN0IGRt
YV9mZW5jZSAqcGFuZnJvc3Rfam9iX3J1bihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9i
KQo+Pj4gIAlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSA9IE5VTEw7Cj4+PiAgCj4+PiAgCWlmICh1
bmxpa2VseShqb2ItPmJhc2Uuc19mZW5jZS0+ZmluaXNoZWQuZXJyb3IpKQo+Pj4gLQkJcmV0dXJu
IE5VTEw7Cj4+PiArCQlyZXR1cm4gRVJSX1BUUihqb2ItPmJhc2Uuc19mZW5jZS0+ZmluaXNoZWQu
ZXJyb3IpOwo+IAo+IEhtLCBzbyB3ZSBjYW4ga2VlcCB0aGUgcmV0dXJuIE5VTEwgaGVyZSBpZiBb
MV0gaXMgYXBwbGllZCAodGhlIGVycm9yCj4gaXMgcHJlc2VydmVkKSwgYnV0IEknbSBub3Qgc3Vy
ZSBpdCdzIGNsZWFyZXIgdGhhdCB3YXkuCj4gCj4+PiAgCj4+PiAgCXBmZGV2LT5qb2JzW3Nsb3Rd
ID0gam9iOwo+Pj4gIAo+Pj4gIAlmZW5jZSA9IHBhbmZyb3N0X2ZlbmNlX2NyZWF0ZShwZmRldiwg
c2xvdCk7Cj4+PiAgCWlmIChJU19FUlIoZmVuY2UpKQo+Pj4gLQkJcmV0dXJuIE5VTEw7Cj4+PiAr
CQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsgIAo+IAo+IFRoaXMgb25lIHNob3VsZCBiZSBmaXhl
ZCB0aG91Z2gsIG90aGVyd2lzZSB0aGUgZXJyb3IgaXMgbmV2ZXIgdXBkYXRlZCwKPiBzbyBJJ20g
d29uZGVyaW5nIGlmIGl0IGRvZXNuJ3QgZGVzZXJ2ZSBhIEZpeGVzIHRhZyBpbiB0aGUgZW5kLi4u
CgpHb29kIHBvaW50LCBhbHRob3VnaCB0aGlzIGNhbid0IGJlIGJhY2stcG9ydGVkIGJlZm9yZSBb
M10gKHdlbGwgdW5sZXNzCnRoYXQgY29tbWl0IGlzIGNvbnNpZGVyZWQgc3RhYmxlIG1hdGVyaWFs
IHRvbyksIHNvIHRoaXMgaXMgb25seSByZWFsbHkKcmVsZXZhbnQgZm9yIHY1LjQuIEJ1dCB3b3J0
aCBmaXhpbmcgdGhlcmUuCgpbM10gMTY3YmY5NjAxNGEwICgiZHJtL3NjaGVkOiBTZXQgZXJyb3Ig
dG8gc19mZW5jZSBpZiBIVyBqb2Igc3VibWlzc2lvbgpmYWlsZWQuIikKClN0ZXZlCgo+Pgo+PiBX
aHkgb3ZlcnJpZGUgdGhlIGVycm9yIGZyb20gcGFuZnJvc3RfZmVuY2VfY3JlYXRlPyBJbiB0aGlz
IGNhc2Ugd2UgY2FuIGp1c3Q6Cj4+Cj4+IAlyZXR1cm4gZmVuY2U7Cj4gCj4gSW5kZWVkLgo+IAo+
Pgo+PiBTdGV2ZQo+Pgo+Pj4gIAo+Pj4gIAlpZiAoam9iLT5kb25lX2ZlbmNlKQo+Pj4gIAkJZG1h
X2ZlbmNlX3B1dChqb2ItPmRvbmVfZmVuY2UpOwo+Pj4gICAKPj4KPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
