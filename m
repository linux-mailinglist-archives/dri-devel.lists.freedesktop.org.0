Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D968726C2E9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 14:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8F06EA01;
	Wed, 16 Sep 2020 12:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9C16EA01;
 Wed, 16 Sep 2020 12:46:44 +0000 (UTC)
IronPort-SDR: HDvR1QdepTtqAi1uRp9I2JB5JG/qoFEwD26XGEi/+Vg4FX8Cg+gU7MsDqau7IKWsCA3paOFg2d
 LLE+QebNGLIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="158735061"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; d="scan'208";a="158735061"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 05:46:43 -0700
IronPort-SDR: NrEw7gupuSrNntISelBuMpXp4tghwXo69FRIaYrJaxb9+SrcVFubLoQZGAO06/6xYj8PDIAHWu
 MYpsn4vRiTJA==
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; d="scan'208";a="483299439"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.213.73.60])
 ([10.213.73.60])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 05:46:40 -0700
Subject: Re: [PATCH v8 4/8] drm/i915: Do not call drm_crtc_arm_vblank_event in
 async flips
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200914055633.21109-1-karthik.b.s@intel.com>
 <20200914055633.21109-5-karthik.b.s@intel.com>
 <20200915140719.GK6112@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <20103181-26da-e442-cfc8-5b291e528209@intel.com>
Date: Wed, 16 Sep 2020 18:16:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915140719.GK6112@intel.com>
Content-Language: en-US
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA5LzE1LzIwMjAgNzozNyBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIE1vbiwg
U2VwIDE0LCAyMDIwIGF0IDExOjI2OjI5QU0gKzA1MzAsIEthcnRoaWsgQiBTIHdyb3RlOgo+PiBT
aW5jZSB0aGUgZmxpcCBkb25lIGV2ZW50IHdpbGwgYmUgc2VudCBpbiB0aGUgZmxpcF9kb25lX2hh
bmRsZXIsCj4+IG5vIG5lZWQgdG8gYWRkIHRoZSBldmVudCB0byB0aGUgbGlzdCBhbmQgZGVsYXkg
aXQgZm9yIGxhdGVyLgo+Pgo+PiB2MjogLU1vdmVkIHRoZSBhc3luYyBjaGVjayBhYm92ZSB2Ymxh
bmtfZ2V0IGFzIGl0Cj4+ICAgICAgIHdhcyBjYXVzaW5nIGlzc3VlcyBmb3IgUFNSLgo+Pgo+PiB2
MzogLU5vIG5lZWQgdG8gd2FpdCBmb3IgdmJsYW5rIHRvIHBhc3MsIGFzIHRoaXMgd2FpdCB3YXMg
Y2F1c2luZyBhCj4+ICAgICAgIDE2bXMgZGVsYXkgb25jZSBldmVyeSBmZXcgZmxpcHMuCj4+Cj4+
IHY0OiAtUmViYXNlZC4KPj4KPj4gdjU6IC1SZWJhc2VkLgo+Pgo+PiB2NjogLVJlYmFzZWQuCj4+
Cj4+IHY3OiAtTm8gbmVlZCBvZiBpcnEgZGlzYWJsZSBpZiB3ZSBhcmUgbm90IGRvaW5nIHZibGFu
ayBldmFkZS4gKFZpbGxlKQo+Pgo+PiB2ODogLVJlYmFzZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEthcnRoaWsgQiBTIDxrYXJ0aGlrLmIuc0BpbnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFZh
bmRpdGEgS3Vsa2FybmkgPHZhbmRpdGEua3Vsa2FybmlAaW50ZWwuY29tPgo+PiAtLS0KPj4gICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5jIHwgNiArKysrKysKPj4g
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYwo+PiBpbmRleCA1YWMwZGJmMGUwM2QuLmYwYzg5
NDE4ZDJlMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9zcHJpdGUuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nw
cml0ZS5jCj4+IEBAIC05Myw2ICs5Myw5IEBAIHZvaWQgaW50ZWxfcGlwZV91cGRhdGVfc3RhcnQo
Y29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlKQo+PiAgIAlERUZJ
TkVfV0FJVCh3YWl0KTsKPj4gICAJdTMyIHBzcl9zdGF0dXM7Cj4+ICAgCj4+ICsJaWYgKG5ld19j
cnRjX3N0YXRlLT51YXBpLmFzeW5jX2ZsaXApCj4+ICsJCXJldHVybjsKPj4gKwo+PiAgIAl2Ymxh
bmtfc3RhcnQgPSBhZGp1c3RlZF9tb2RlLT5jcnRjX3ZibGFua19zdGFydDsKPj4gICAJaWYgKGFk
anVzdGVkX21vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR19JTlRFUkxBQ0UpCj4+ICAgCQl2Ymxh
bmtfc3RhcnQgPSBESVZfUk9VTkRfVVAodmJsYW5rX3N0YXJ0LCAyKTsKPj4gQEAgLTIwMiw2ICsy
MDUsOSBAQCB2b2lkIGludGVsX3BpcGVfdXBkYXRlX2VuZChzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0
ZSAqbmV3X2NydGNfc3RhdGUpCj4+ICAgCj4+ICAgCXRyYWNlX2ludGVsX3BpcGVfdXBkYXRlX2Vu
ZChjcnRjLCBlbmRfdmJsX2NvdW50LCBzY2FubGluZV9lbmQpOwo+PiAgIAo+PiArCWlmIChuZXdf
Y3J0Y19zdGF0ZS0+dWFwaS5hc3luY19mbGlwKQo+PiArCQlyZXR1cm47Cj4gCj4gVGhlIHBpcGUg
dXBkYXRlIHRyYWNlcG9pbnRzIHdpbGwgYmUgaW5jb25zaXN0ZW50IGlmIHlvdSBwdXQgdGhpcyBo
ZXJlLgo+IEkgZ3Vlc3Mgd2UgZG9uJ3QgcmVhbGx5IG5lZWQgdGhlIHBpcGUgdXBkYXRlIHRyYWNl
cG9pbnRzIGZvciBhc3luYwo+IGZsaXBzLiBXZSBtaWdodCB3YW50IHRvIGFkZCBhIHNlcGFyYXRl
IHRyYWNlcG9pbnQgZm9yIGFzeW5jIGZsaXAgaXRzZWxmLAo+IG9yIHBlcmhhcHMgY29udmV5IHRo
ZSBzeW5jIHZzLiBhc3luYyBpbmZvcm1hdGlvbiB2aWEgdGhlIGN1cnJlbnQKPiBwbGFuZSB1cGRh
dGUgdHJhY2Vwb2ludC4KPiAKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KU3VyZSwgSSdsbCBtb3Zl
IHRoaXMgYmVmb3JlIHRoZSB0cmFjZXBvaW50LgoKPiBXaXRoIHRoaXMgbW92ZWQgdG8gYmVmb3Jl
IHRoZSB0cmFjZXBvaW50Cj4gUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCgpUaGFua3MgZm9yIHRoZSBSQi4KClRoYW5rcywKS2Fy
dGhpay5CLlMKPj4gKwo+PiAgIAkvKiBXZSdyZSBzdGlsbCBpbiB0aGUgdmJsYW5rLWV2YWRlIGNy
aXRpY2FsIHNlY3Rpb24sIHRoaXMgY2FuJ3QgcmFjZS4KPj4gICAJICogV291bGQgYmUgc2xpZ2h0
bHkgbmljZSB0byBqdXN0IGdyYWIgdGhlIHZibGFuayBjb3VudCBhbmQgYXJtIHRoZQo+PiAgIAkg
KiBldmVudCBvdXRzaWRlIG9mIHRoZSBjcml0aWNhbCBzZWN0aW9uIC0gdGhlIHNwaW5sb2NrIG1p
Z2h0IHNwaW4gZm9yIGEKPj4gLS0gCj4+IDIuMjIuMAo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
