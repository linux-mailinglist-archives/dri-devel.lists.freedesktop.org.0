Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285DF5B5A6F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 14:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759B689131;
	Mon, 12 Sep 2022 12:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9517589131;
 Mon, 12 Sep 2022 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662986938; x=1694522938;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YsHl0vjsiSRD/7K09GTdNcGkzSFe8dULMnqQ3ss2o5A=;
 b=VWzVQYKwMClIg0ngZFr0ouBVLjiFB+4Qpy+dW6ZM6UCY92Of0Bqg9N/h
 FrmTsQxHzL5jwaQEbEXZPc67tUZYc1BwWYFsK0bKsEIowK45ObG/wsm6Q
 wETPLyOHnagI651R54tpFMBZaFp4Bgsx9jDj6A0TW05R+hB+NHUfpncr3
 c7M/EQc2Wj20IKrrwiPlOBXI64QllSuVKcqtAWv7Y6FZgNl4qTeeB5W0p
 MN074GUl+ZwojQZdBzx7ErfqqNVSl1MXrsupVWkJLa73G3b1rUf1Mr+Pr
 YlQphDfTBADiC456ZMqpgj7h1EqzNVd4eoM1/YedeRt/fH/Mq533vpby7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="277588961"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="277588961"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:48:58 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="758383421"
Received: from sfhansen-mobl1.ger.corp.intel.com (HELO [10.249.254.135])
 ([10.249.254.135])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:48:56 -0700
Message-ID: <24a864240e0f689b30d66aeb1f978bf3aae6843f.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix display problems after resume
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Mon, 12 Sep 2022 14:48:54 +0200
In-Reply-To: <Yx8pa+cZ6BIdCZA5@intel.com>
References: <20220912121957.31310-1-thomas.hellstrom@linux.intel.com>
 <Yx8pa+cZ6BIdCZA5@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTA5LTEyIGF0IDE1OjQzICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gTW9uLCBTZXAgMTIsIDIwMjIgYXQgMDI6MTk6NTdQTSArMDIwMCwgVGhvbWFzIEhlbGxz
dHLDtm0gd3JvdGU6Cj4gPiBDb21taXQgMzlhMmJkMzRjOTMzICgiZHJtL2k5MTU6IFVzZSB0aGUg
dm1hIHJlc291cmNlIGFzIGFyZ3VtZW50Cj4gPiBmb3IgZ3R0Cj4gPiBiaW5kaW5nIC8gdW5iaW5k
aW5nIikgaW50cm9kdWNlZCBhIHJlZ3Jlc3Npb24gdGhhdCBkdWUgdG8gdGhlIHZtYQo+ID4gcmVz
b3VyY2UKPiA+IHRyYWNraW5nIG9mIHRoZSBiaW5kaW5nIHN0YXRlLCBkcHQgcHRlcyB3ZXJlIG5v
dCBjb3JyZWN0bHkKPiA+IHJlcG9wdWxhdGVkLgo+IAo+IERvZXNuJ3QgdGhpcyBtZWFuIGFsbCBn
Z3R0IHB0ZXMgd2VyZW4ndCByZXBvcHVsYXRlZD8gU28gSSdtCj4gd29uZGVyaW5nIGhvdyBhbnl0
aGluZyBhdCBhbGwgaGFzIGJlZW4gd29ya2luZz8KCmdndHQgcHRlcyBoYWQgYSBkaWZmZXJlbnQg
Y2hlY2sgdGhhdCB3YXMgY29weS1wYXN0ZWQgZnJvbSB0aGUgcHJlLXZtYS0KcmVzb3VyY2UgY29k
ZSBhbmQgdGhhdCB3YXNuJ3QgdGhhdCBzdHJpY3QuIEhlbmNlIHdoeSBpdCB3b3JrZWQuCgovVGhv
bWFzCgo+IAo+ID4gRml4IHRoaXMgYnkgY2xlYXJpbmcgdGhlIHZtYSByZXNvdXJjZSBzdGF0ZSBi
ZWZvcmUgcmVwb3B1bGF0aW5nLgo+ID4gVGhlIHN0YXRlIHdpbGwgc3Vic2VxdWVudGx5IGJlIHJl
c3RvcmVkIGJ5IHRoZSBiaW5kX3ZtYSBvcGVyYXRpb24uCj4gPiAKPiA+IEZpeGVzOiAzOWEyYmQz
NGM5MzMgKCJkcm0vaTkxNTogVXNlIHRoZSB2bWEgcmVzb3VyY2UgYXMgYXJndW1lbnQKPiA+IGZv
ciBndHQgYmluZGluZyAvIHVuYmluZGluZyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVs
bHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Cj4gPiAtLS0KPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dC5jIHwgOCArKysrKysrLQo+ID4gwqAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9nZ3R0LmMKPiA+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dC5jCj4gPiBpbmRleCAzMGNmNWMzMzY5ZDku
LjIwNDlhMDA0MTdhZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2lu
dGVsX2dndHQuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dC5j
Cj4gPiBAQCAtMTI3NSwxMCArMTI3NSwxNiBAQCBib29sIGk5MTVfZ2d0dF9yZXN1bWVfdm0oc3Ry
dWN0Cj4gPiBpOTE1X2FkZHJlc3Nfc3BhY2UgKnZtKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYXRvbWljX3JlYWQoJnZtYS0+ZmxhZ3MpICYKPiA+
IEk5MTVfVk1BX0JJTkRfTUFTSzsKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoEdFTV9CVUdfT04oIXdhc19ib3VuZCk7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWYgKCFyZXRhaW5lZF9wdGVzKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGlmICghcmV0YWluZWRfcHRlcykgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBDbGVhciB0aGUgYm91bmQgZmxhZ3Mgb2YgdGhlIHZtYQo+
ID4gcmVzb3VyY2UgdG8gYWxsb3cKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICogcHRlcyB0byBiZSByZXBvcHVsYXRlZC4KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZtYS0+cmVzb3VyY2UtPmJvdW5kX2Zs
YWdzID0gMDsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHZtYS0+b3BzLT5iaW5kX3ZtYSh2bSwgTlVMTCwgdm1hLT5yZXNvdXJjZSwKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvYmogPyBvYmotPmNhY2hlX2xldmVsIDoKPiA+IDAsCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2FzX2JvdW5kKTsKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGlmIChvYmopIHsgLyogb25seSB1c2VkIGR1cmluZyByZXN1bWUgPT4gZXhjbHVzaXZlCj4gPiBh
Y2Nlc3MgKi8KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHdyaXRlX2RvbWFpbl9vYmpzIHw9IGZldGNoX2FuZF96ZXJvKCZvYmotCj4gPiA+d3JpdGVf
ZG9tYWluKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoG9iai0+cmVhZF9kb21haW5zIHw9IEk5MTVfR0VNX0RPTUFJTl9HVFQ7Cj4gPiAtLSAKPiA+
IDIuMzQuMQo+IAoK

