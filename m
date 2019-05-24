Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32333297D7
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 14:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93449899C4;
	Fri, 24 May 2019 12:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44626899C4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:12:33 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 05:12:32 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 24 May 2019 05:12:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 24 May 2019 15:12:26 +0300
Date: Fri, 24 May 2019 15:12:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH] drm/komeda: Added AFBC support for komeda driver
Message-ID: <20190524121226.GD5942@intel.com>
References: <20190404110552.15778-1-james.qian.wang@arm.com>
 <20190516135748.GC1372@arm.com>
 <20190521084552.GA20625@james-ThinkStation-P300>
 <20190524111009.beddu67vvx66wvmk@DESKTOP-E1NTVVP.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524111009.beddu67vvx66wvmk@DESKTOP-E1NTVVP.localdomain>
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
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMTE6MTA6MDlBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBIaSwKPiAKPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAwOTo0NTo1OEFNICswMTAw
LCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+IE9uIFRo
dSwgTWF5IDE2LCAyMDE5IGF0IDA5OjU3OjQ5UE0gKzA4MDAsIEF5YW4gSGFsZGVyIHdyb3RlOgo+
ID4gPiBPbiBUaHUsIEFwciAwNCwgMjAxOSBhdCAxMjowNjoxNFBNICswMTAwLCBqYW1lcyBxaWFu
IHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+ID4gPiAgCj4gPiA+ID4gK3N0
YXRpYyBpbnQKPiA+ID4gPiAra29tZWRhX2ZiX2FmYmNfc2l6ZV9jaGVjayhzdHJ1Y3Qga29tZWRh
X2ZiICprZmIsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiA+ID4gPiArCQkJICBjb25zdCBzdHJ1
Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQpCj4gPiA+ID4gK3sKPiA+ID4gPiArCXN0cnVj
dCBkcm1fZnJhbWVidWZmZXIgKmZiID0gJmtmYi0+YmFzZTsKPiA+ID4gPiArCWNvbnN0IHN0cnVj
dCBkcm1fZm9ybWF0X2luZm8gKmluZm8gPSBmYi0+Zm9ybWF0Owo+ID4gPiA+ICsJc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmo7Cj4gPiA+ID4gKwl1MzIgYWxpZ25tZW50X3cgPSAwLCBhbGlnbm1l
bnRfaCA9IDAsIGFsaWdubWVudF9oZWFkZXI7Cj4gPiA+ID4gKwl1MzIgbl9ibG9ja3MgPSAwLCBt
aW5fc2l6ZSA9IDA7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJb2JqID0gZHJtX2dlbV9vYmplY3RfbG9v
a3VwKGZpbGUsIG1vZGVfY21kLT5oYW5kbGVzWzBdKTsKPiA+ID4gPiArCWlmICghb2JqKSB7Cj4g
PiA+ID4gKwkJRFJNX0RFQlVHX0tNUygiRmFpbGVkIHRvIGxvb2t1cCBHRU0gb2JqZWN0XG4iKTsK
PiA+ID4gPiArCQlyZXR1cm4gLUVOT0VOVDsKPiA+ID4gPiArCX0KPiA+ID4gPiArCj4gPiA+ID4g
Kwlzd2l0Y2ggKGZiLT5tb2RpZmllciAmIEFGQkNfRk9STUFUX01PRF9CTE9DS19TSVpFX01BU0sp
IHsKPiA+ID4gPiArCWNhc2UgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfMzJ4ODoKPiA+ID4g
PiArCQlhbGlnbm1lbnRfdyA9IDMyOwo+ID4gPiA+ICsJCWFsaWdubWVudF9oID0gODsKPiA+ID4g
PiArCQlicmVhazsKPiA+ID4gPiArCWNhc2UgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfMTZ4
MTY6Cj4gPiA+ID4gKwkJYWxpZ25tZW50X3cgPSAxNjsKPiA+ID4gPiArCQlhbGlnbm1lbnRfaCA9
IDE2Owo+ID4gPiA+ICsJCWJyZWFrOwo+ID4gPiA+ICsJZGVmYXVsdDoKPiA+ID4gQ2FuIHdlIGhh
dmUgc29tZXRoaW5nIGxpa2UgYSB3YXJuIGhlcmUgPwo+ID4gCj4gPiB3aWxsIGFkZCBhIFdBUk4g
aGVyZS4KPiA+IAo+IAo+IEkgdGhpbmsgaXQncyBiZXR0ZXIgbm90IHRvLiBmYi0+bW9kaWZpZXIg
Y29tZXMgZnJvbQo+IHVzZXJzcGFjZSwgc28gYSBtYWxpY2lvdXMgYXBwIGNvdWxkIHNwYW0gdXMg
d2l0aCBXQVJOcywgZWZmZWN0aXZlbHkKPiBkb3MtaW5nIHRoZSBzeXN0ZW0uIC1FSU5WQUwgc2hv
dWxkIGJlIHN1ZmZpY2llbnQuCgpTaG91bGQgcHJvYmFibHkgY2hlY2sgdGhhdCB0aGUgZW50aXJl
IG1vZGlmaWVyK2Zvcm1hdCBpcwphY3R1YWxseSB2YWxpZC4gT3RoZXJ3aXNlIHlvdSByaXNrIHBh
c3Npbmcgb24gYSBib2d1cwptb2RpZmllciBkZWVwZXIgaW50byB0aGUgZHJpdmVyIHdoaWNoIG1h
eSB0cmlnZ2VyCmludGVyZXN0aW5nIGJ1Z3MuCgpBbHNvIHRoZW9yZXRpY2FsbHkgKGhvd2V2ZXIg
dW5saWtlbHkpIHNvbWUgYnJva2VuIHVzZXJzcGFjZQptaWdodCBzdGFydCB0byBkZXBlbmQgb24g
dGhlIGFiaWxpdHkgdG8gY3JlYXRlIGZyYW1lYnVmZmVycwp3aXRoIGNyYXAgbW9kaWZpZXJzLCB3
aGljaCBjb3VsZCBsYXRlciBicmVhayBpZiB5b3UgY2hhbmdlCnRoZSB3YXkgeW91IGhhbmRsZSB0
aGUgbW9kaWZpZXJzLiBUaGVuIHlvdSdyZSBzdHVjayBiZXR3ZWVuCnRoZSByb2NrIGFuZCBoYXJk
IHBsYWNlIGJlY2F1c2UgeW91IGNhbid0IGJyZWFrIGV4aXN0aW5nCnVzZXJzcGFjZSBidXQgeW91
IHN0aWxsIHdhbnQgdG8gY2hhbmdlIHRoZSB3YXkgbW9kaWZpZXJzCmFyZSBoYW5kbGVkIGluIHRo
ZSBrZXJuZWwuCgpCZXN0IG5vdCBnaXZlIHVzZXJzcGFjZSB0b28gbXVjaCByb3BlIElNTy4gVHdv
IHdheXMgdG8gZ28gYWJvdXQKdGhhdDoKMSkgZHJtX2FueV9wbGFuZV9oYXNfZm9ybWF0KCkgKGFz
c3VtZXMgeW91ciAuZm9ybWF0X21vZF9zdXBwb3J0ZWQoKQogICBkb2VzIGl0cyBqb2IgcHJvcGVy
bHkpCjIpIHJvbGwgeW91ciBvd24gCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
