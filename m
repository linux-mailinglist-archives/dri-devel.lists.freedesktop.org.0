Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFC9AF0BF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 19:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F146E102;
	Tue, 10 Sep 2019 17:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBF16E102
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 17:56:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 10:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,490,1559545200"; d="scan'208";a="191885982"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com) ([10.54.75.49])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Sep 2019 10:56:40 -0700
Date: Tue, 10 Sep 2019 10:58:07 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Harry Wentland <hwentlan@amd.com>
Subject: Re: [PATCH] drm: include: fix W=1 warnings in struct drm_dsc_config
Message-ID: <20190910175806.GA31258@intel.com>
References: <20190909135205.10277-1-benjamin.gaignard@st.com>
 <f17b306d-2810-985c-42ec-59c6a6dd7093@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f17b306d-2810-985c-42ec-59c6a6dd7093@amd.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gaurav K Singh <gaurav.k.singh@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMTI6NTg6MjRQTSArMDAwMCwgSGFycnkgV2VudGxhbmQg
d3JvdGU6Cj4gK01hbmFzaSwgR2F1cmF2Cj4gCj4gT24gMjAxOS0wOS0wOSA5OjUyIGEubS4sIEJl
bmphbWluIEdhaWduYXJkIHdyb3RlOgo+ID4gQ2hhbmdlIHNjYWxlX2luY3JlbWVudF9pbnRlcnZh
bCBhbmQgbmZsX2JwZ19vZmZzZXQgZmllbGRzIHRvCj4gPiB1MzIgdG8gYXZvaWQgVz0xIHdhcm5p
bmdzIGJlY2F1c2Ugd2UgYXJlIHRlc3RpbmcgdGhlbSBhZ2FpbnN0Cj4gPiA2NTUzNS4KPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0
LmNvbT4KPiA+IC0tLQo+ID4gICBpbmNsdWRlL2RybS9kcm1fZHNjLmggfCA2ICsrKystLQo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RzYy5oIGIvaW5jbHVkZS9kcm0vZHJtX2Rz
Yy5oCj4gPiBpbmRleCA4ODc5NTRjYmZjNjAuLmU0OTUwMjRlOTAxYyAxMDA2NDQKPiA+IC0tLSBh
L2luY2x1ZGUvZHJtL2RybV9kc2MuaAo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RzYy5oCj4g
PiBAQCAtMjA3LDExICsyMDcsMTMgQEAgc3RydWN0IGRybV9kc2NfY29uZmlnIHsKPiA+ICAgCSAq
IE51bWJlciBvZiBncm91cCB0aW1lcyBiZXR3ZWVuIGluY3JlbWVudGluZyB0aGUgc2NhbGUgZmFj
dG9yIHZhbHVlCj4gPiAgIAkgKiB1c2VkIGF0IHRoZSBiZWdpbm5pbmcgb2YgYSBzbGljZS4KPiA+
ICAgCSAqLwo+ID4gLQl1MTYgc2NhbGVfaW5jcmVtZW50X2ludGVydmFsOwo+ID4gKwl1MzIgc2Nh
bGVfaW5jcmVtZW50X2ludGVydmFsOwo+IAo+IFRoZSBEU0Mgc3BlYyBkZWZpbmVzIGJvdGggYXMg
dTE2LiBJIHRoaW5rIHRoZSBjaGVjayBpbiBkcm1fZHNjLmMgaXMgCj4gdXNlbGVzcyBhbmQgc2hv
dWxkIGJlIGRyb3BwZWQuCj4KCkkgYWdyZWUgd2l0aCBIYXJyeSBoZXJlLCBhbGwgdGhlc2UgdmFy
aWFibGVzIHNob3VsZCBtYXRjaCB0aGUgbnVtYmVyIG9mIGJpdHMKaW4gdGhlIHNwZWMsIGluY3Jl
YXNpbmcgdGhlbSB0byB1MzIgYWxsb3dzIG1vcmUgdmFsdWVzIHdoaWNoIHZpb2xhdGVzIHRoZQpE
U0Mgc3BlYy4KCkl0IHNob3VsZCBzdGF5IHUxNgoKTWFuYXNpCiAKPiBIYXJyeQo+IAo+ID4gKwo+
ID4gICAJLyoqCj4gPiAgIAkgKiBAbmZsX2JwZ19vZmZzZXQ6IE5vbiBmaXJzdCBsaW5lIEJQRyBv
ZmZzZXQgdG8gYmUgdXNlZAo+ID4gICAJICovCj4gPiAtCXUxNiBuZmxfYnBnX29mZnNldDsKPiA+
ICsKPiA+ICsJdTMyIG5mbF9icGdfb2Zmc2V0Owo+ID4gICAJLyoqCj4gPiAgIAkgKiBAc2xpY2Vf
YnBnX29mZnNldDogQlBHIG9mZnNldCB1c2VkIHRvIGVuZm9yY2Ugc2xpY2UgYml0Cj4gPiAgIAkg
Ki8KPiA+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
