Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 240C1CC2CD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 20:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2AA6EC13;
	Fri,  4 Oct 2019 18:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C1D6EC13;
 Fri,  4 Oct 2019 18:39:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 11:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,257,1566889200"; d="scan'208";a="205913319"
Received: from meiermar-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.40.202])
 by fmsmga001.fm.intel.com with ESMTP; 04 Oct 2019 11:39:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Adam Jackson <ajax@redhat.com>, Lee Shawn C <shawn.c.lee@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: customize DPCD brightness control for specific
 panel
In-Reply-To: <33dcaf669eae3acfc3b716e68b69c0fe76dd2dbc.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191004215851.31446-1-shawn.c.lee@intel.com>
 <33dcaf669eae3acfc3b716e68b69c0fe76dd2dbc.camel@redhat.com>
Date: Fri, 04 Oct 2019 21:40:22 +0300
Message-ID: <87d0fce4mh.fsf@intel.com>
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
Cc: Cooper Chiou <cooper.chiou@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwNCBPY3QgMjAxOSwgQWRhbSBKYWNrc29uIDxhamF4QHJlZGhhdC5jb20+IHdyb3Rl
Ogo+IE9uIFNhdCwgMjAxOS0xMC0wNSBhdCAwNTo1OCArMDgwMCwgTGVlIFNoYXduIEMgd3JvdGU6
Cj4+IFRoaXMgcGFuZWwgKG1hbnVmYWN0dXJlciBpcyBTREMsIHByb2R1Y3QgSUQgaXMgMHg0MTQx
KQo+PiB1c2VkIG1hbnVmYWN0dXJlciBkZWZpbmVkIERQQ0QgcmVnaXN0ZXIgdG8gY29udHJvbCBi
cmlnaHRuZXNzCj4+IHRoYXQgbm90IGRlZmluZWQgaW4gZURQIHNwZWMgc28gZmFyLiBUaGlzIGNo
YW5nZSBmb2xsb3cgcGFuZWwKPj4gdmVuZG9yJ3MgaW5zdHJ1Y3Rpb24gdG8gc3VwcG9ydCBicmln
aHRuZXNzIGFkanVzdG1lbnQuCj4KPiBJJ20gc3VyZSB0aGlzIHdvcmtzLCBidXQgdGhpcyBzbWVs
bHMgYSBsaXR0bGUgZnVubnkgdG8gbWUuCgpUaGF0IHdhcyBraW5kbHkgcHV0LiA7KQoKPj4gKwkv
KiBTYW1zdW5nIGVEUCBwYW5lbCAqLwo+PiArCXsgIlNEQyIsIDB4NDE0MSwgRURJRF9RVUlSS19O
T05fU1REX0JSSUdIVE5FU1NfQ09OVFJPTCB9LAo+Cj4gSXQgZmVlbHMgYSBiaXQgbGlrZSBhIGxh
eWVyaW5nIHZpb2xhdGlvbiB0byBpZGVudGlmeSBlRFAgYmVoYXZpb3IKPiBjaGFuZ2VzIGJhc2Vk
IG9uIEVESUQuIEJ1dCBJJ20gbm90IHN1cmUgdGhlcmUncyBhbnkgb2J2aW91cyB3YXkgdG8KPiBp
ZGVudGlmeSB0aGlzIGRldmljZSBieSBpdHMgRFBDRC4gVGhlIFNpbmsgT1VJIChmcm9tIHRoZSBs
aW5rZWQKPiBidWd6aWxsYSkgc2VlbXMgdG8gYmUgMDAxMUY4LCB3aGljaCBkb2Vzbid0IG1hdGNo
IHVwIHRvIGFueXRoaW5nIGluIG15Cj4gb3VpLnR4dC4uLgoKV2UgaGF2ZSB0aGUgRFBDRCBxdWly
ayBzdHVmZiBpbiBkcm1fZHBfaGVscGVyLmMsIGJ1dCBJSVVDIGluIHRoaXMgY2FzZQp0aGVyZSdz
IG9ubHkgdGhlIE9VSSwgYW5kIHRoZSBkZXZpY2UgaWQgZXRjLiBhcmUgYWxsIHplcm9zLiBPdGhl
cndpc2UgSQp0aGluayB0aGF0IHdvdWxkIGJlIHRoZSBuYXR1cmFsIHRoaW5nIHRvIGRvLCBhbmQg
YWxsIHRoaXMgY291bGQgYmUKYmV0dGVyIGhpZGRlbiBhd2F5IGluIGk5MTUuCgo+Cj4+IEBAIC0x
OTUzLDYgKzE5NTYsNyBAQCBzdGF0aWMgdTMyIGVkaWRfZ2V0X3F1aXJrcyhjb25zdCBzdHJ1Y3Qg
ZWRpZCAqZWRpZCkKPj4gIAo+PiAgCXJldHVybiAwOwo+PiAgfQo+PiArRVhQT1JUX1NZTUJPTChl
ZGlkX2dldF9xdWlya3MpOwo+Cj4gSWYgd2UncmUgZ29pbmcgdG8gZXhwb3J0IHRoaXMgaXQgc2hv
dWxkIHByb2JhYmx5IGdldCBhIGRybV8gcHJlZml4Lgo+Cj4+ICsjZGVmaW5lIERQQ0RfRURQX0dF
VFNFVF9DVFJMX1BBUkFNUwkJMHgzNDQKPj4gKyNkZWZpbmUgRFBDRF9FRFBfQ09OVEVOVF9MVU1J
TkFOQ0UJCTB4MzQ2Cj4+ICsjZGVmaW5lIERQQ0RfRURQX1BBTkVMX0xVTUlOQU5DRV9PVkVSUklE
RQkweDM0YQo+PiArI2RlZmluZSBEUENEX0VEUF9CUklHSFRORVNTX05JVFMJCTB4MzU0Cj4+ICsj
ZGVmaW5lIERQQ0RfRURQX0JSSUdIVE5FU1NfT1BUSU1JWkFUSU9OCTB4MzU4Cj4+ICsKPj4gKyNk
ZWZpbmUgRURQX0NVU1RPTUlaRV9NQVhfQlJJR0hUTkVTU19MRVZFTAkoNTEyKQo+Cj4gVGhpcyBh
bHNvIHNlZW1zIGEgYml0IHdlaXJkLCB0aGUgMHgzMDAtMHgzRkYgcmVnaXN0ZXJzIGJlbG9uZyB0
byB0aGUKPiBfc291cmNlXyBEUCBkZXZpY2UuIEJ1dCB0aGVuIGxhdGVyLi4uCj4KPj4gKwkvKiB3
cml0ZSBzb3VyY2UgT1VJICovCj4+ICsJd3JpdGVfdmFsWzBdID0gMHgwMDsKPj4gKwl3cml0ZV92
YWxbMV0gPSAweGFhOwo+PiArCXdyaXRlX3ZhbFsyXSA9IDB4MDE7Cj4KPiBPaCBoZXksIHlvdSdy
ZSB3cml0aW5nIChhbikgSW50ZWwgT1VJIHRvIHRoZSBTb3VyY2UgT1VJLCBzbyBub3cgaXQKPiBt
YWtlcyBzZW5zZSB0aGF0IHlvdSdyZSB3cml0aW5nIHRvIHJlZ2lzdGVycyB3aG9zZSBiZWhhdmlv
ciB0aGUgc291cmNlCj4gZGVmaW5lcy4gQnV0IHRoaXMgZG9lcyByYWlzZSB0aGUgcXVlc3Rpb246
IGlzIHRoaXMganVzdCBhIGNvbnZlbnRpb24KPiBiZXR3ZWVuIEludGVsIGFuZCB0aGlzIHBhcnRp
Y3VsYXIgcGFuZWw/IFdvdWxkIHdlIGV4cGVjdCB0aGlzIHRvIHdvcmsKPiB3aXRoIG90aGVyIHNp
bWlsYXIgcGFuZWxzPyBJcyB0aGVyZSBhbnkgd2F5IHRvIGtub3cgdG8gZXhwZWN0IHRoaXMKPiBj
b252ZW50aW9uIGZyb20gRFBDRCBpbnN0ZWFkPwoKRm9yIG9uZSB0aGluZywgaXQncyBub3Qgc3Rh
bmRhcmQuIEkgaG9uZXN0bHkgZG9uJ3Qga25vdywgYnV0IEknZCBhc3N1bWUKeW91IHdvdWxkbid0
IGZpbmQgYmVoYXZpb3VyIHdpdGggSW50ZWwgT1VJIGluIG5vbi1JbnRlbCBkZXNpZ25zLi4uIGFu
ZCBhCnF1aXJrIG9mIHNvbWUgc29ydCBzZWVtcyBsaWtlIHRoZSBvbmx5IHdheSB0byBtYWtlIHRo
aXMgd29yay4KCkkgc3VwcG9zZSB3ZSBjb3VsZCBzdGFydCBvZmYgd2l0aCBhIERQQ0QgcXVpcmsg
dGhhdCBvbmx5IGxvb2tzIGF0IHRoZQpzaW5rIE9VSSwgYW5kIHRoZW4sIGlmIG5lZWRlZCwgbGlt
aXQgYnkgRE1JIG1hdGNoaW5nIG9yIGJ5IGNoZWNraW5nIGZvcgpzb21lIERQQ0QgcmVnaXN0ZXJz
ICh3aGF0LCBJIGFtIG5vdCBzdXJlLCBwZXJoYXBzIHdyaXRlIHRoZSBzb3VyY2UgT1VJCmFuZCBz
ZWUgaG93IGl0IGJlaGF2ZXMpLgoKVGhhdCB3b3VsZCBhdm9pZCB0aGUgbWlsZGx5IGFubm95aW5n
IGNoYW5nZSBpbiB0aGUgRURJRCBxdWlyayBpbnRlcmZhY2UKYW5kIGhvdyBpdCdzIGJlaW5nIHVz
ZWQuCgpUaG91Z2h0cz8KCgpCUiwKSmFuaS4KCgoKCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9w
ZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
