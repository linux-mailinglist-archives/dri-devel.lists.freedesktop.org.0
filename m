Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 135B5BDC47
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 12:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D496E82B;
	Wed, 25 Sep 2019 10:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECBC6E82B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 10:39:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 03:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; d="scan'208";a="218945701"
Received: from jlynch-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.4.92])
 by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2019 03:39:09 -0700
Date: Wed, 25 Sep 2019 11:39:09 +0100
From: Eric Engestrom <eric.engestrom@intel.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] libdrm: Convert to Android.mk to Android.bp
Message-ID: <20190925103909.6yjozclnukkladbo@intel.com>
References: <20190924212920.76103-1-john.stultz@linaro.org>
 <CAL_JsqLR212Et5Z82Gr=DJfB5WY-4o8bN_s5peu07EnaEVEOYQ@mail.gmail.com>
 <CALAqxLUR5ML3gmBs3SM2GvfXB+JxiO7gTUrtpVJqVzuh+hugxg@mail.gmail.com>
 <CALAqxLWHrCKogRqe2ZQZT3dK57+8AmxKfZjKXxztvw6CFobdkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALAqxLWHrCKogRqe2ZQZT3dK57+8AmxKfZjKXxztvw6CFobdkg@mail.gmail.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
User-Agent: NeoMutt/20180716
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
Cc: Rob Clark <robdclark@chromium.org>, Jiyong Park <jiyong@google.com>,
 Robert Foss <robert.foss@collabora.com>, Mauro Rossi <issor.oruam@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Eric Anholt <anholt@google.com>,
 Sean Paul <seanpaul@chromium.org>, Dan Willemsen <dwillemsen@google.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMjAxOS0wOS0yNCAyMzowOTowOCAtMDcwMCwgSm9obiBTdHVsdHogd3JvdGU6
Cj4gT24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgNDozMCBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVs
dHpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiBPbiBUdWUsIFNlcCAyNCwgMjAxOSBhdCAzOjI0IFBN
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBUcnlpbmcgdG8gbWFp
bnRhaW4gc29tZXRoaW5nIHRoYXQgd29ya3MgYWNyb3NzIG1vcmUgdGhhbiAzIHJlbGVhc2VzIG9y
Cj4gPiA+IHNvIGlzIHBhaW5mdWwuIEkgZG9uJ3QgdGhpbmsgYW5kcm9pZC14ODYgZm9sa3MgaGF2
ZSB0aGUgYmFuZHdpZHRoIHRvCj4gPiA+IG1haW50YWluIHRoaW5ncyBvbGRlciB0aGFuIHRoYXQg
KmFuZCogdXBkYXRlIHRvIG5ld2VyIHZlcnNpb25zLiBTbyBJCj4gPiA+IHRoaW5rIG9ubHkgc3Vw
cG9ydGluZyB0aGUgbiBsYXRlc3QgcmVsZWFzZXMgaXMgZ29vZC4KPiA+ID4KPiA+ID4gQXJlIC5i
cCBmaWxlcyBmb3IgbWFzdGVyL1EgY29tcGF0aWJsZSBiYWNrIHRvIE4gKG9yIE8pPyBJSVJDLCBh
dCBsZWFzdAo+ID4gPiBmb3IgdGhlIGZpcnN0IGNvdXBsZSBvZiByZWxlYXNlcyB3aXRoIC5icCBm
aWxlcywgdGhleSBzZWVtZWQgdG8gaGF2ZQo+ID4gPiBpbmNvbXBhdGlibGUgY2hhbmdlcy4KPiA+
Cj4gPiBJIHRoaW5rIHRoZXJlIGhhdmUgcG9zc2libHkgYmVlbiBzb21lIGluY29tcGF0aWJsZSBj
aGFuZ2VzLCBhcyBJIGtub3cKPiA+IGVhcmx5IHcvIGJwIGZpbGVzIHRoaW5ncyB3ZXJlIG1vcmUg
aW4gZmx1eC4gVGhhdCBzYWlkLCB0aGVyZSBoYXZlbid0Cj4gPiBiZWVuIG1hbnkgY2hhbmdlcyB0
byB0aGUgbGliZHJtIGJwIGZpbGVzIHNpbmNlIHRoZSBjb252ZXJzaW9uIHdhcwo+ID4gZmlyc3Qg
ZG9uZSBpbiAyMDE3IChzbyBBbmRyb2lkIE8pLiBJJ2xsIGNoZWNrb3V0IE4gYW5kIHZhbGlkYXRl
IHNvIEkKPiA+IGNhbiBwcm92aWRlIGEgbW9yZSBjb25jcmV0ZSBhc3N1cmFuY2UuCj4gCj4gQWgu
IENydWQuIFlvdSdyZSByaWdodC4gVGhlIGJwIHN5bnRheCBoYXMgc2hpZnRlZCBlbm91Z2ggb3Zl
ciB0aW1lIHRvCj4gY2F1c2UgcHJvYmxlbXMgdy8gdGhlIGN1cnJlbnQgZmlsZSB3aGVuIGJ1aWxk
aW5nIGFnYWluc3Qgb2xkZXIgQW5kcm9pZAo+IHJlbGVhc2VzLiAgIE4gZmFsbHMgb3ZlciBwcmV0
dHkgaGFyZCwgYW5kIE8gYW5kIGV2ZW4gUCBoYXZlIGlzc3VlcyB3Lwo+ICJyZWNvdmVyeV9hdmFp
bGFibGU6ICIsIGFuZCAicHJlYnVpbHRfZXRjIiBzeW50YXguICBTbyBteSBwcm9wb3NlZAo+IGNv
bW1pdCBtZXNzYWdlIG1pc2NoYXJhY3Rlcml6ZXMgdGhlIHN0YXRlIG9mIG9sZGVyIGJ1aWxkcy4g
QXBvbG9naWVzIQo+IAo+IEknbGwgdHJ5IHRvIHJlYWNoIG91dCB0byB0aGUgYW5kcm9pZCBkZXZz
IHRvIHNlZSBpZiB0aGVyZSdzIGFueSBzb3J0Cj4gb2YgY29tcGF0IG1hZ2ljIHRoYXQgY2FuIGJl
IGRvbmUgdG8ga2VlcCB0aGluZ3Mgd29ya2luZyBvbiBvbGRlcgo+IHZlcnNpb25zLiBUaGF0IHNh
aWQsIEknbSBzdGlsbCB0b3JuLCBhcyB3aXRob3V0IHRoaXMgdGhlIGN1cnJlbnQKPiBsaWJkcm0v
bWFzdGVyIGNvZGUgaXMgYnJva2VuIHdpdGggQU9TUC9tYXN0ZXIgYW5kIFEuICBJdHMgZnJ1c3Ry
YXRpbmcKPiB3ZSBoYXZlIHRvIGhhdmUgdGhpcyBzZWVtaW5nbHkgZXhjbHVzaXZlIHRyYWRlIG9m
Zi4KPiAKPiBJJ20gY3VyaW91cyBpZiBmb2xrcyBtaWdodCBiZSB3aWxsaW5nIHRvIGNvbnNpZGVy
IHNvbWV0aGluZyBsaWtlIGFuCj4gdXBzdHJlYW0gYnJhbmNoIHRvIHByZXNlcnZlIHRoZSBidWls
ZCBiaXRzIHRoYXQgd29yayB3aXRoIHByaW9yCj4gQW5kcm9pZCByZWxlYXNlcz8gT3IgYW55IG90
aGVyIGlkZWFzPwoKSXMgX25vdF8gZGVsZXRpbmcgQW5kcm9pZC5tayBhbiBvcHRpb24/CgpUaGF0
IHdvdWxkIGhhdmUgdGhlIG9idmlvdXMgY29zdCBvZiBkdXBsaWNhdGluZyB0aGUgYnVpbGQgc3lz
dGVtCm1haW50ZW5hbmNlIGVmZm9ydCwgYnV0IGlmIHRoYXQncyB0aGUgb25seSB3YXkgdG8gbm90
IGRyb3Agc3VwcG9ydCBmb3IKZXZlcnl0aGluZyBiZWZvcmUgUS4uLgoKKGZ3aXcsIG15IGFjayBv
bmx5IGFwcGxpZXMgd2l0aCAicmVhc29uYWJsZSIgc3VwcG9ydCBvZiBwcmV2aW91cwp2ZXJzaW9u
cyA6XSApCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
