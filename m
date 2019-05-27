Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBC92B62A
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 15:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E136E1B7;
	Mon, 27 May 2019 13:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD3B6E1B7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 13:20:05 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 06:20:04 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 27 May 2019 06:20:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 27 May 2019 16:19:59 +0300
Date: Mon, 27 May 2019 16:19:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH] drm/komeda: Added AFBC support for komeda driver
Message-ID: <20190527131959.GH5942@intel.com>
References: <20190404110552.15778-1-james.qian.wang@arm.com>
 <20190516135748.GC1372@arm.com>
 <20190521084552.GA20625@james-ThinkStation-P300>
 <20190524111009.beddu67vvx66wvmk@DESKTOP-E1NTVVP.localdomain>
 <20190524121226.GD5942@intel.com>
 <20190527065110.GA29041@james-ThinkStation-P300>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527065110.GA29041@james-ThinkStation-P300>
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
Cc: nd <nd@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDY6NTE6MThBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gRnJpLCBNYXkgMjQsIDIwMTkgYXQg
MDM6MTI6MjZQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+ID4gT24gRnJpLCBNYXkg
MjQsIDIwMTkgYXQgMTE6MTA6MDlBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiA+ID4g
SGksCj4gPiA+IAo+ID4gPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAwOTo0NTo1OEFNICswMTAw
LCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+ID4gPiBP
biBUaHUsIE1heSAxNiwgMjAxOSBhdCAwOTo1Nzo0OVBNICswODAwLCBBeWFuIEhhbGRlciB3cm90
ZToKPiA+ID4gPiA+IE9uIFRodSwgQXByIDA0LCAyMDE5IGF0IDEyOjA2OjE0UE0gKzAxMDAsIGph
bWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiA+ID4gPiAg
Cj4gPiA+ID4gPiA+ICtzdGF0aWMgaW50Cj4gPiA+ID4gPiA+ICtrb21lZGFfZmJfYWZiY19zaXpl
X2NoZWNrKHN0cnVjdCBrb21lZGFfZmIgKmtmYiwgc3RydWN0IGRybV9maWxlICpmaWxlLAo+ID4g
PiA+ID4gPiArCQkJICBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQpCj4g
PiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiA+ICsJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSAm
a2ZiLT5iYXNlOwo+ID4gPiA+ID4gPiArCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmlu
Zm8gPSBmYi0+Zm9ybWF0Owo+ID4gPiA+ID4gPiArCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
Owo+ID4gPiA+ID4gPiArCXUzMiBhbGlnbm1lbnRfdyA9IDAsIGFsaWdubWVudF9oID0gMCwgYWxp
Z25tZW50X2hlYWRlcjsKPiA+ID4gPiA+ID4gKwl1MzIgbl9ibG9ja3MgPSAwLCBtaW5fc2l6ZSA9
IDA7Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gKwlvYmogPSBkcm1fZ2VtX29iamVjdF9sb29r
dXAoZmlsZSwgbW9kZV9jbWQtPmhhbmRsZXNbMF0pOwo+ID4gPiA+ID4gPiArCWlmICghb2JqKSB7
Cj4gPiA+ID4gPiA+ICsJCURSTV9ERUJVR19LTVMoIkZhaWxlZCB0byBsb29rdXAgR0VNIG9iamVj
dFxuIik7Cj4gPiA+ID4gPiA+ICsJCXJldHVybiAtRU5PRU5UOwo+ID4gPiA+ID4gPiArCX0KPiA+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArCXN3aXRjaCAoZmItPm1vZGlmaWVyICYgQUZCQ19GT1JN
QVRfTU9EX0JMT0NLX1NJWkVfTUFTSykgewo+ID4gPiA+ID4gPiArCWNhc2UgQUZCQ19GT1JNQVRf
TU9EX0JMT0NLX1NJWkVfMzJ4ODoKPiA+ID4gPiA+ID4gKwkJYWxpZ25tZW50X3cgPSAzMjsKPiA+
ID4gPiA+ID4gKwkJYWxpZ25tZW50X2ggPSA4Owo+ID4gPiA+ID4gPiArCQlicmVhazsKPiA+ID4g
PiA+ID4gKwljYXNlIEFGQkNfRk9STUFUX01PRF9CTE9DS19TSVpFXzE2eDE2Ogo+ID4gPiA+ID4g
PiArCQlhbGlnbm1lbnRfdyA9IDE2Owo+ID4gPiA+ID4gPiArCQlhbGlnbm1lbnRfaCA9IDE2Owo+
ID4gPiA+ID4gPiArCQlicmVhazsKPiA+ID4gPiA+ID4gKwlkZWZhdWx0Ogo+ID4gPiA+ID4gQ2Fu
IHdlIGhhdmUgc29tZXRoaW5nIGxpa2UgYSB3YXJuIGhlcmUgPwo+ID4gPiA+IAo+ID4gPiA+IHdp
bGwgYWRkIGEgV0FSTiBoZXJlLgo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gSSB0aGluayBpdCdzIGJl
dHRlciBub3QgdG8uIGZiLT5tb2RpZmllciBjb21lcyBmcm9tCj4gPiA+IHVzZXJzcGFjZSwgc28g
YSBtYWxpY2lvdXMgYXBwIGNvdWxkIHNwYW0gdXMgd2l0aCBXQVJOcywgZWZmZWN0aXZlbHkKPiA+
ID4gZG9zLWluZyB0aGUgc3lzdGVtLiAtRUlOVkFMIHNob3VsZCBiZSBzdWZmaWNpZW50Lgo+ID4g
Cj4gPiBTaG91bGQgcHJvYmFibHkgY2hlY2sgdGhhdCB0aGUgZW50aXJlIG1vZGlmaWVyK2Zvcm1h
dCBpcwo+ID4gYWN0dWFsbHkgdmFsaWQuIE90aGVyd2lzZSB5b3UgcmlzayBwYXNzaW5nIG9uIGEg
Ym9ndXMKPiA+IG1vZGlmaWVyIGRlZXBlciBpbnRvIHRoZSBkcml2ZXIgd2hpY2ggbWF5IHRyaWdn
ZXIKPiA+IGludGVyZXN0aW5nIGJ1Z3MuCj4gPiAKPiA+IEFsc28gdGhlb3JldGljYWxseSAoaG93
ZXZlciB1bmxpa2VseSkgc29tZSBicm9rZW4gdXNlcnNwYWNlCj4gPiBtaWdodCBzdGFydCB0byBk
ZXBlbmQgb24gdGhlIGFiaWxpdHkgdG8gY3JlYXRlIGZyYW1lYnVmZmVycwo+ID4gd2l0aCBjcmFw
IG1vZGlmaWVycywgd2hpY2ggY291bGQgbGF0ZXIgYnJlYWsgaWYgeW91IGNoYW5nZQo+ID4gdGhl
IHdheSB5b3UgaGFuZGxlIHRoZSBtb2RpZmllcnMuIFRoZW4geW91J3JlIHN0dWNrIGJldHdlZW4K
PiA+IHRoZSByb2NrIGFuZCBoYXJkIHBsYWNlIGJlY2F1c2UgeW91IGNhbid0IGJyZWFrIGV4aXN0
aW5nCj4gPiB1c2Vyc3BhY2UgYnV0IHlvdSBzdGlsbCB3YW50IHRvIGNoYW5nZSB0aGUgd2F5IG1v
ZGlmaWVycwo+ID4gYXJlIGhhbmRsZWQgaW4gdGhlIGtlcm5lbC4KPiA+IAo+ID4gQmVzdCBub3Qg
Z2l2ZSB1c2Vyc3BhY2UgdG9vIG11Y2ggcm9wZSBJTU8uIFR3byB3YXlzIHRvIGdvIGFib3V0Cj4g
PiB0aGF0Ogo+ID4gMSkgZHJtX2FueV9wbGFuZV9oYXNfZm9ybWF0KCkgKGFzc3VtZXMgeW91ciAu
Zm9ybWF0X21vZF9zdXBwb3J0ZWQoKQo+ID4gICAgZG9lcyBpdHMgam9iIHByb3Blcmx5KQo+ID4g
Mikgcm9sbCB5b3VyIG93biAKPiA+IAo+ID4gLS0gCj4gPiBWaWxsZSBTeXJqw6Rsw6QKPiA+IElu
dGVsCj4gCj4gSGkgQnJpYW4gJiBWaWxsZToKPiAKPiBrb21lZCBoYXMgYSBmb3JtYXQrbW9kaWZp
ZXIgY2hlY2sgYmVmb3JlIHRoZSBmYiBzaXplIGNoZWNrLgo+IGFuZCBmb3Iga29tZWRhX2ZiX2Ny
ZWF0ZSwgdGhlIGZpcnN0IHN0ZXAgaXMgZG8gdGhlIGZvcm1hdCttb2RpZmllcgo+IGNoZWNrLCB0
aGUgc2l6ZSBjaGVjayBpcyB0aGUgZnVydGh1ciBjaGVjayBhZnRlciB0aGUgc3VjaCBmb3JtYXQK
PiB2YWxpZCBjaGVjay4gYW5kIHRoZSBkZXRhaWxlZCBmYl9jcmVhdGUgaXMgbGlrZToKPiAKPiBz
dHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICoKPiBrb21lZGFfZmJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiAJCSBjb25zdCBzdHJ1Y3QgZHJtX21v
ZGVfZmJfY21kMiAqbW9kZV9jbWQpCj4gewo+ICAgICAgICAgLi4uCj4gICAgICAgICAvKiBTdGVw
IDE6IGZvcm1hdCttb2RpZmllciB2YWxpZCBjaGVjaywgaWYgaXQgY2FuIG5vdCBiZSBzdXBwb3J0
LAo+ICAgICAgICAgICogZ2V0X2Zvcm1hdF9jYXBzIHdpbGwgcmV0dXJuIGEgTlVMTCBwdHIuCj4g
ICAgICAgICAgKi8KPiAJa2ZiLT5mb3JtYXRfY2FwcyA9IGtvbWVkYV9nZXRfZm9ybWF0X2NhcHMo
Jm1kZXYtPmZtdF90YmwsCj4gCQkJCQkJICBtb2RlX2NtZC0+cGl4ZWxfZm9ybWF0LAo+IAkJCQkJ
CSAgbW9kZV9jbWQtPm1vZGlmaWVyWzBdKTsKPiAJaWYgKCFrZmItPmZvcm1hdF9jYXBzKSB7Cj4g
CQlEUk1fREVCVUdfS01TKCJGTVQgJXggaXMgbm90IHN1cHBvcnRlZC5cbiIsCj4gCQkJICAgICAg
bW9kZV9jbWQtPnBpeGVsX2Zvcm1hdCk7Cj4gCQlrZnJlZShrZmIpOwo+IAkJcmV0dXJuIEVSUl9Q
VFIoLUVJTlZBTCk7Cj4gCX0KPiAKPiAJZHJtX2hlbHBlcl9tb2RlX2ZpbGxfZmJfc3RydWN0KGRl
diwgJmtmYi0+YmFzZSwgbW9kZV9jbWQpOwo+IAo+ICAgICAgICAgLyogc3RlcCAyLCBkbyB0aGUg
c2l6ZSBjaGVjayAqLwo+IAlpZiAoa2ZiLT5iYXNlLm1vZGlmaWVyKQo+IAkJcmV0ID0ga29tZWRh
X2ZiX2FmYmNfc2l6ZV9jaGVjayhrZmIsIGZpbGUsIG1vZGVfY21kKTsKPiAJZWxzZQo+IAkJcmV0
ID0ga29tZWRhX2ZiX25vbmVfYWZiY19zaXplX2NoZWNrKG1kZXYsIGtmYiwgZmlsZSwgbW9kZV9j
bWQpOwo+IAlpZiAocmV0IDwgMCkKPiAJCWdvdG8gZXJyX2NsZWFudXA7Cj4gCj4gICAgICAgICAu
Li4KPiB9Cj4gCj4gU28gdGhlb3JldGljYWxseSwgdGhlIFdBUk4gaW4gc3RlcDIgaXMgcmVkdW5k
YW50IGlmIGdldF9mb3JtYXRfY2Fwcwo+IGZ1bmN0aW9uIGhhcyBubyBwcm9ibGVtLiA6KS4gdGhl
IFdBUk4gaGVyZSBpcyBvbmx5IGZvciByZXBvcnRpbmcKPiB0aGUga2VybmVsIEJVRyBvciBjb2Rl
IGluY29uc2l0ZW50IHdpdGggZm9ybWF0IGNhcHMgY2hlY2sgYW5kIHRoZQo+IGZiIHNpemUgY2hl
Y2suIEFuZCBJIGFncmVlLCBiYXNpY2FsbHkgaXQgd2lsbCBub3QgaGFwcGVuZS4KPiBAQnJpYW4s
IEknbSBPayB0byByZW1vdmUgaXQuIDopCj4gCj4gQFZpbGxlOgo+IEJhc2ljYWxseSBrb21lZGEg
Zm9sbG93IHRoZSB3YXktMSwgYnV0IGEgbGl0dGxlIGltcHJvdmVtZW50IGZvcgo+IG1hdGNoaW5n
IGtvbWVkYSdzIHJlcXVpcmVtZW50LiBmb3Iga29tZWRhIHdoaWNoIHdpbGwgZG8gdHdvIGxldmVs
J3MKPiBmb3JtYXQrbW9kaWZpZXIgY2hlY2suCj4gMSkuIEluIGZiX2NyZWF0ZSwgQSByb3VnaGx5
IGNoZWNrIHRvIHNlZSBpZiB0aGUgZm9ybWF0K21vZGlmaWVyIGNhbiBiZQo+ICAgICBzdXBwb3J0
ZWQgYnkgY3VycmVudCBIVy4KClllYWgsIGxvb2tzIGxpa2UgaXQgc2hvdWxkbid0IGFsbG93IGFu
eSB1bnNwZWNmaWVkIG1vZGlmaWVycyB0bwpzbmVhayB0aHJvdWdoLiBTbyBzaG91bGQgYmUgZ29v
ZC4KCj4gMikuIEluIHBsYW5lX2F0b21pY19jaGVjazogdG8gc2VlIGlmIHRoZSBmb3JtYXQrbW9k
aWZpZXIgY2FuIGJlCj4gICAgIHN1cHBvcnRlZCBmb3IgYSBzcGVjaWZpYyBsYXllciBhbmQgd2l0
aCBhIHNwZWNpZmljIGNvbmZpZ3VyYXRpb24gKFJPVCkKPiAKPiBUaGlzIGlzIGEgZm9ybWF0IHZh
bGlkIGNoZWNrIGV4YW1wbGUgZm9yIHBsYW5lX2NoZWNrLgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9wYXRjaC8zMDExNDAvP3Nlcmllcz01OTc0NyZyZXY9Mgo+IAo+IEphbWVz
CgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
