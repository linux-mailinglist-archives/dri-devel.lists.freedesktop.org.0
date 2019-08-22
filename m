Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4262A99279
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 13:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640CA6EB01;
	Thu, 22 Aug 2019 11:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0026EB01;
 Thu, 22 Aug 2019 11:47:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 04:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="196229016"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2019 04:47:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
In-Reply-To: <20190822111445.29350-1-ramalingam.c@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190822111445.29350-1-ramalingam.c@intel.com>
Date: Thu, 22 Aug 2019 14:47:31 +0300
Message-ID: <87a7c1ctgs.fsf@intel.com>
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
Cc: tomas.winkler@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMiBBdWcgMjAxOSwgUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29t
PiB3cm90ZToKPiBFbmFibGluZyB0aGUgSERDUDEuNCBhbmQgMi4yIG9uIFRHTCBieSBzdXBwb3J0
aW5nIHRoZSBIVyBibG9jayBtb3ZlbWVudAo+IGZyb20gRERJIGludG8gdHJhbnNjb2Rlci4KPgo+
IHY3Ogo+ICAgcG9ydCwgdHJhbnNjb2RlciBkZWZpbml0aW9ucyBhcmUga2VwdCB3aXRoaW4gSTkx
NS4KPiAgIGNvcnJlc3BvbmRpbmcgY2hhbmdlcyBpbiBpOTE1LW1laSBpbnRlcmZhY2UuCgpJIGhh
ZCBzb21lIHN1cGVyZmljaWFsIGNvbW1lbnRzIGhlcmUgYW5kIHRoZXJlLCB3b24ndCBkbyBkZXRh
aWxlZCByZXZpZXcKb2YgdGhlIHNlcmllcywgYnV0IEkgbGlrZSB0aGlzIG92ZXJhbGwgYXBwcm9h
Y2ggYmV0dGVyIHRoYW4gZXhwb3NpbmcgdGhlCmRlZmluaXRpb25zIGZyb20gaTkxNS4KCkFja2Vk
LWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgoKCj4KPiBSYW1hbGluZ2Ft
IEMgKDYpOgo+ICAgZHJtL2k5MTU6IG1laV9oZGNwOiBJOTE1IHNlbmRzIGRkaSBpbmRleCBhcyBw
ZXIgTUUgRlcKPiAgIGRybTogcG9ydCBkZWZpbml0aW9uIGlzIG1vdmVkIGJhY2sgaW50byBpOTE1
IGhlYWRlcgo+ICAgZHJtOiBJOTE1IG1laSBpbnRlcmZhY2UgaXMgZXh0ZW5kZWQgZm9yIHRyYW5z
Y29kZXIgaW5mbwo+ICAgbWlzYy9tZWkvaGRjcDogdHJhbnNjb2RlciBpbmRleCBpbiBwb3J0IGlu
Zm8KPiAgIGRybS9pOTE1L2hkY3A6IHVwZGF0aW5nIHRoZSB0cmFuc2NvZGVyIG9mIHRoZSBoZGNw
IHBvcnQKPiAgIGRybS9pOTE1L2hkY3A6IEVuYWJsZSBIRENQIDEuNCBhbmQgMi4yIG9uIEdlbjEy
Kwo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5oICAgICB8ICAg
MiArCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oICB8ICAx
OCArKwo+ICAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmggICAgfCAg
IDcgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICAgfCAg
IDMgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmggICAgICAgfCAg
IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkY3AuYyAgICAgfCAx
OTEgKysrKysrKysrKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfaGRjcC5oICAgICB8ICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfaGRtaS5jICAgICB8ICAxMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5o
ICAgICAgICAgICAgICAgfCAxMjQgKysrKysrKysrKystCj4gIGRyaXZlcnMvbWlzYy9tZWkvaGRj
cC9tZWlfaGRjcC5jICAgICAgICAgICAgICB8ICA0NSArKy0tLQo+ICBkcml2ZXJzL21pc2MvbWVp
L2hkY3AvbWVpX2hkY3AuaCAgICAgICAgICAgICAgfCAgMTYgKy0KPiAgaW5jbHVkZS9kcm0vaTkx
NV9kcm0uaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE4IC0tCj4gIGluY2x1ZGUvZHJtL2k5
MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmggICAgICAgICB8ICAyOSArKy0KPiAgMTMgZmlsZXMgY2hh
bmdlZCwgMzQ4IGluc2VydGlvbnMoKyksIDEyMCBkZWxldGlvbnMoLSkKCi0tIApKYW5pIE5pa3Vs
YSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
