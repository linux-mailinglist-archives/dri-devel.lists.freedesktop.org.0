Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BFD710CB6
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 14:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA4B10E15D;
	Thu, 25 May 2023 12:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6335610E12B;
 Thu, 25 May 2023 12:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685019562; x=1716555562;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5YHM54qoOf3WbS6hz8MQD89F9AJ3qIglnBiH9yOXPuo=;
 b=LqFco4hfe5fwNQ0lLMJQ8jUnD8wy8Hvbw61qCXQWyEsK+2k7RcAznj50
 lk+Aq11MP8ZCtu0Og1im0EmrUsBCab4I9WRPWRPAPq+CotXww/7DSrPx2
 JTgHTJxIg9lzX0IvVVLXzq6NtGXPumDhhdNPcW/AJgS9OEz9s9haUEQz8
 niVyhOY9ot7GEoKgMJFkk1WcZt6Zs0Qcu0VXcUJN3cfdYDUZuaiQ6nG8W
 qtriEGVOpnHRccFB15L4Uev1yRje11tginMJfWog/OBB/EyKssPeNLOjj
 VhExmdQeoFXfFyuaeVL8TDRLkXrWezuAAdB0x1O4XyJ8Z7cjDBBksSZyE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="382123426"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="382123426"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 05:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="708002668"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="708002668"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO [10.249.254.226])
 ([10.249.254.226])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 05:59:20 -0700
Message-ID: <f5ac5b8ceacda35f435e7e6945429c2168314aae.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/ttm: Allow the driver to resolve a WW
 transaction rollback
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org, Christian Koenig
 <christian.koenig@amd.com>
Date: Thu, 25 May 2023 14:59:19 +0200
In-Reply-To: <20230505141719.332109-1-thomas.hellstrom@linux.intel.com>
References: <20230505141719.332109-1-thomas.hellstrom@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA1LTA1IGF0IDE2OjE3ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToKPiBBbGxvdyBkcml2ZXJzIHRvIHJlc29sdmUgYSBXVyB0cmFuc2FjdGlvbiByb2xsYmFjay4g
VGhpcyBhbGxvd3MgZm9yCj4gMSkgUHV0dGluZyBhIGxvd2VyLXByaW9yaXR5IHRyYW5zYWN0aW9u
IHRvIHNsZWVwIGFsbG93aW5nIGFub3RoZXIgdG8KPiBzdWNjZWVkIGluc3RlYWQgYm90aCBmaWdo
dGluZyB1c2luZyB0cnlsb2Nrcy4KPiAyKSBMZXR0aW5nIHRoZSBkcml2ZXIga25vdyB3aGV0aGVy
IGEgcmVjZWl2ZWQgLUVOT01FTSBpcyB0aGUgcmVzdWx0Cj4gb2YKPiBjb21wZXRpdGlvbiB3aXRo
IGFub3RoZXIgV1cgdHJhbnNhY3Rpb24sIHdoaWNoIGNhbiBiZSByZXNvbHZlZCB1c2luZwo+IHJv
bGxiYWNrIGFuZCByZXRyeSBvciBhIHJlYWwgLUVOT01FTSB3aGljaCBzaG91bGQgYmUgcHJvcGFn
YXRlZCBiYWNrCj4gdG8gdXNlci1zcGFjZSBhcyBhIGZhaWx1cmUuCj4gCj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgoK
Q2hyaXN0aWFuLCBBbnkgb2JqZWN0aW9ucz8KCi9UaG9tYXMKCgo+IC0tLQo+IMKgZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYyB8IDE3ICsrKysrKysrKysrKysrKy0tCj4gwqBpbmNsdWRlL2Ry
bS90dG0vdHRtX2JvLmjCoMKgwqDCoCB8wqAgMiArKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5k
ZXggYmQ1ZGFlNGQxNjI0Li5jM2NjYmVhMmJlM2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBA
QCAtNTYxLDYgKzU2MSwxMCBAQCBzdGF0aWMgaW50IHR0bV9tZW1fZXZpY3Rfd2FpdF9idXN5KHN0
cnVjdAo+IHR0bV9idWZmZXJfb2JqZWN0ICpidXN5X2JvLAo+IMKgwqDCoMKgwqDCoMKgwqBpZiAo
IWJ1c3lfYm8gfHwgIXRpY2tldCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiAtRUJVU1k7Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqAvKiBXZSB3YW50IHRvIHJlc29sdmUg
Y29udGVudGlvbiBiZWZvcmUgdHJ5aW5nIHRvIGxvY2sgYWdhaW4uCj4gKi8KPiArwqDCoMKgwqDC
oMKgwqBpZiAoY3R4LT5wcm9wYWdhdGVfZWRlYWRsayAmJiBjdHgtPmNvbnRlbmRlZF9ibykKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuwqAgLUVERUFETEs7Cj4gKwo+IMKg
wqDCoMKgwqDCoMKgwqBpZiAoY3R4LT5pbnRlcnJ1cHRpYmxlKQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgciA9IGRtYV9yZXN2X2xvY2tfaW50ZXJydXB0aWJsZShidXN5X2JvLT5i
YXNlLnJlc3YsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHRpY2tldCk7Cj4gQEAgLTU3NSw3ICs1NzksMTUgQEAgc3RhdGljIGludCB0
dG1fbWVtX2V2aWN0X3dhaXRfYnVzeShzdHJ1Y3QKPiB0dG1fYnVmZmVyX29iamVjdCAqYnVzeV9i
bywKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFyKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZG1hX3Jlc3ZfdW5sb2NrKGJ1c3lfYm8tPmJhc2UucmVzdik7Cj4gwqAKPiAtwqDCoMKg
wqDCoMKgwqByZXR1cm4gciA9PSAtRURFQURMSyA/IC1FQlVTWSA6IHI7Cj4gK8KgwqDCoMKgwqDC
oMKgaWYgKHIgPT0gLUVERUFETEspIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aWYgKGN0eC0+cHJvcGFnYXRlX2VkZWFkbGspIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHR0bV9ib19nZXQoYnVzeV9ibyk7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjdHgtPmNvbnRlbmRlZF9ibyA9IGJ1
c3lfYm87Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgciA9IC1FQlVTWTsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvC
oMKgwqDCoMKgwqDCoHJldHVybiByOwo+IMKgfQo+IMKgCj4gwqBpbnQgdHRtX21lbV9ldmljdF9m
aXJzdChzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKPiBAQCAtODE2LDcgKzgyOCw3IEBAIGludCB0
dG1fYm9fbWVtX3NwYWNlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdAo+ICpibywKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycm9yOwo+IMKg
wqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqByZXQgPSAtRU5PTUVNOwo+ICvC
oMKgwqDCoMKgwqDCoHJldCA9IChjdHgtPnByb3BhZ2F0ZV9lZGVhZGxrICYmIGN0eC0+Y29udGVu
ZGVkX2JvKSA/IC0KPiBFREVBRExLIDogLUVOT01FTTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCF0
eXBlX2ZvdW5kKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwcl9lcnIoVFRN
X1BGWCAiTm8gY29tcGF0aWJsZSBtZW1vcnkgdHlwZSBmb3VuZFxuIik7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSAtRUlOVkFMOwo+IEBAIC05MTMsNiArOTI1LDcgQEAg
aW50IHR0bV9ib192YWxpZGF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+IMKgwqDCoMKgwqDCoMKg
wqB9Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiDCoH0KPiDCoEVYUE9SVF9TWU1C
T0wodHRtX2JvX3ZhbGlkYXRlKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9i
by5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9iby5oCj4gaW5kZXggOGIxMTNjMzg0MjM2Li5kOGUz
NWE3OTRjZTUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9iby5oCj4gKysrIGIv
aW5jbHVkZS9kcm0vdHRtL3R0bV9iby5oCj4gQEAgLTE4MSw4ICsxODEsMTAgQEAgc3RydWN0IHR0
bV9vcGVyYXRpb25fY3R4IHsKPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBnZnBfcmV0cnlfbWF5ZmFp
bDsKPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBhbGxvd19yZXNfZXZpY3Q7Cj4gwqDCoMKgwqDCoMKg
wqDCoGJvb2wgZm9yY2VfYWxsb2M7Cj4gK8KgwqDCoMKgwqDCoMKgYm9vbCBwcm9wYWdhdGVfZWRl
YWRsazsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRtYV9yZXN2ICpyZXN2Owo+IMKgwqDCoMKg
wqDCoMKgwqB1aW50NjRfdCBieXRlc19tb3ZlZDsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmNvbnRlbmRlZF9ibzsKPiDCoH07Cj4gwqAKPiDCoC8qKgoK

