Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D8D9E929
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 15:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62201898C8;
	Tue, 27 Aug 2019 13:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD559898C8;
 Tue, 27 Aug 2019 13:23:09 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 06:23:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="380037476"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga005.fm.intel.com with ESMTP; 27 Aug 2019 06:23:06 -0700
Date: Tue, 27 Aug 2019 18:52:33 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: Re: [PATCH v10 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Message-ID: <20190827132233.GA5040@intel.com>
References: <20190827105014.14181-1-ramalingam.c@intel.com>
 <5B8DA87D05A7694D9FA63FD143655C1B9DCA4E9E@hasmsx108.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5B8DA87D05A7694D9FA63FD143655C1B9DCA4E9E@hasmsx108.ger.corp.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yNyBhdCAxODozMjoxMyArMDUzMCwgV2lua2xlciwgVG9tYXMgd3JvdGU6Cj4g
Cj4gPiBFbmFibGluZyB0aGUgSERDUDEuNCBhbmQgMi4yIG9uIFRHTCBieSBzdXBwb3J0aW5nIHRo
ZSBIVyBibG9jayBtb3ZlbWVudAo+ID4gZnJvbSBEREkgaW50byB0cmFuc2NvZGVyLgo+IAo+IElu
IHNvbWUgZmlsZXMgbmVlZHMgdG8gYnVtcCB0aGUgY29weXJpZ2h0IHRvIDIwMTkuIApUb21hcywK
CkkgYW0gbm90IGF3YXJlIHdoZW4gYSBjb3B5cmlnaHQgeWVhciBuZWVkcyB0byBiZSAgYnVtcGVk
LCBhcyAKY29weXJpZ2h0IHllYXIgZm9yIG1hbnkgSTkxNSBmaWxlcyBhcmUgbm90IGxhdGVzdC4K
CkFueSBndWlkZWxpbmVzIGhlcmUgd291bGQgaGVscCBtZSB0byB1bmRlcnN0YW5kLgoKVGhhbmtz
LAotUmFtLgo+IAo+ID4gCj4gPiB2MTA6Cj4gPiAgIFJldmlldyBjb21tZW50cyBmcm9tIHNoYXNo
YW5rIGFkZHJlc3NlZAo+ID4gCj4gPiBSYW1hbGluZ2FtIEMgKDYpOgo+ID4gICBkcm0vaTkxNTog
bWVpX2hkY3A6IEk5MTUgc2VuZHMgZGRpIGluZGV4IGFzIHBlciBNRSBGVwo+ID4gICBkcm06IE1v
dmUgcG9ydCBkZWZpbml0aW9uIGJhY2sgdG8gaTkxNSBoZWFkZXIKPiA+ICAgZHJtOiBFeHRlbmQg
STkxNSBtZWkgaW50ZXJmYWNlIGZvciB0cmFuc2NvZGVyIGluZm8KPiA+ICAgbWlzYy9tZWkvaGRj
cDogRmlsbCB0cmFuc2NvZGVyIGluZGV4IGluIHBvcnQgaW5mbwo+ID4gICBkcm0vaTkxNS9oZGNw
OiB1cGRhdGUgY3VycmVudCB0cmFuc2NvZGVyIGludG8gaW50ZWxfaGRjcAo+ID4gICBkcm0vaTkx
NS9oZGNwOiBFbmFibGUgSERDUCAxLjQgYW5kIDIuMiBvbiBHZW4xMisKPiA+IAo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5oICAgICB8ICAgMSArCj4gPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmggIHwgIDE4ICsrCj4gPiAg
Li4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oICAgIHwgICA3ICsKPiA+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICAgfCAgIDMgKwo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuaCAgICAgICB8ICAgMSAr
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmMgICAgIHwgMjEy
ICsrKysrKysrKysrKystLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfaGRjcC5oICAgICB8ICAgNCArCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9oZG1pLmMgICAgIHwgIDEzICstCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9oZG1pLmggICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2hvdHBsdWcuaCAgfCAgIDEgKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfc2R2by5oICAgICB8ICAgMSArCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9yZWcuaCAgICAgICAgICAgICAgIHwgMTI0ICsrKysrKysrKy0KPiA+ICBkcml2ZXJzL21p
c2MvbWVpL2hkY3AvbWVpX2hkY3AuYyAgICAgICAgICAgICAgfCAgNDUgKystLQo+ID4gIGRyaXZl
cnMvbWlzYy9tZWkvaGRjcC9tZWlfaGRjcC5oICAgICAgICAgICAgICB8ICAxNiArLQo+ID4gIGlu
Y2x1ZGUvZHJtL2k5MTVfZHJtLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAxOCAtLQo+ID4g
IGluY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmggICAgICAgICB8ICAyOSArKy0K
PiA+ICAxNiBmaWxlcyBjaGFuZ2VkLCAzNzIgaW5zZXJ0aW9ucygrKSwgMTIyIGRlbGV0aW9ucygt
KQo+ID4gCj4gPiAtLQo+ID4gMi4yMC4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
