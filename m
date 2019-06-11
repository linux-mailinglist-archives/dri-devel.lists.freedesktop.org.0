Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AC93D5E2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 20:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF09E891B8;
	Tue, 11 Jun 2019 18:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B8B891B8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:53:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 91BB2803E8;
 Tue, 11 Jun 2019 20:53:53 +0200 (CEST)
Date: Tue, 11 Jun 2019 20:53:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 01/11] drm: Add atomic variants of enable/disable to
 encoder helper funcs
Message-ID: <20190611185352.GA16305@ravnborg.org>
References: <20190611160844.257498-1-sean@poorly.run>
 <20190611160844.257498-2-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611160844.257498-2-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=OerWV80n5jN9p7ISswMA:9 a=CjuIK1q_8ugA:10
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2Vhbi4KCk5pdHMgYmVsb3cuCgo+ICAKPiArCS8qKgo+ICsJICogQGF0b21pY19kaXNhYmxl
Ogo+ICsJICoKLi4uCj4gKwkgKgo+ICsJICogVGhpcyBjYWxsYmFjayBpcyBhIHZhcmlhbnQgb2Yg
QGRpc2FibGUgdGhhdCBwcm92aWRlcyB0aGUgYXRvbWljIHN0YXRlCj4gKwkgKiB0byB0aGUgZHJp
dmVyLiBJdCB0YWtlcyBwcmlvcml0eSBvdmVyIEBkaXNhYmxlIGR1cmluZyBhdG9taWMgY29tbWl0
cy4KPiArCSAqCj4gKwkgKiBUaGlzIGhvb2sgaXMgdXNlZCBvbmx5IGJ5IGF0b21pYyBoZWxwZXJz
LiBBdG9taWMgZHJpdmVycyBkb24ndCBuZWVkCj4gKwkgKiB0byBpbXBsZW1lbnQgaXQgaWYgdGhl
cmUncyBubyBuZWVkIHRvIGRpc2FibGUgYW55dGhpbmcgYXQgdGhlIGVuY29kZXIKPiArCSAqIGxl
dmVsLiBUbyBlbnN1cmUgdGhhdCBydW50aW1lIFBNIGhhbmRsaW5nICh1c2luZyBlaXRoZXIgRFBN
UyBvciB0aGUKPiArCSAqIG5ldyAiQUNUSVZFIiBwcm9wZXJ0eSkgd29ya3MgQGF0b21pY19kaXNh
YmxlIG11c3QgYmUgdGhlIGludmVyc2Ugb2YKPiArCSAqIEBhdG9taWNfZW5hYmxlLgo+ICsJICov
Cj4gKwl2b2lkICgqYXRvbWljX2Rpc2FibGUpKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwK
PiArCQkJICAgICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSk7CgoKCj4gKwo+ICsJ
LyoqCj4gKwkgKiBAYXRvbWljX2VuYWJsZToKPiArCSAqCi4uLgo+ICsJICoKPiArCSAqIFRoaXMg
Y2FsbGJhY2sgaXMgYSB2YXJpYW50IG9mIEBlbmFibGUgdGhhdCBwcm92aWRlcyB0aGUgYXRvbWlj
IHN0YXRlCj4gKwkgKiB0byB0aGUgZHJpdmVyLiBJdCBpcyBjYWxsZWQgaW4gcGxhY2Ugb2YgQGVu
YWJsZSBkdXJpbmcgYXRvbWljCj4gKwkgKiBjb21taXRzLgoKVGhlIHdvcmRpbmcgaW4gdGhpcyBw
YXJhZ3JhcCBpcyBub3QgdGhlIHNhbWUgYXMgdGhlIHNpbWlsYXIgcGFyYWdyYXBoCmFib3ZlLgoK
T25lIHNheXMgIml0IHRha2VzIHByaW9yaXR5IG92ZXIiCkFub3RoZXIgc2F5cyAiY2FsbGVkIGlu
IHBsYWNlIG9mIgoKTWF5YmUgYmUgYSBiaXQgbW9yZSBleHBsaWNpdCBhbmQgc2F5IHRoYXQgImlm
IGF0b21pY197ZGlzLGVufWFibGUgaXMKZGVmaW5lIHRoZW4ge2Rpcyxlbn1hYmxlIGlzIG5vdCBj
YWxsZWQ/CgoKPiArCSAqCj4gKwkgKiBUaGlzIGhvb2sgaXMgdXNlZCBvbmx5IGJ5IGF0b21pYyBo
ZWxwZXJzLCBmb3Igc3ltbWV0cnkgd2l0aCBAZGlzYWJsZS4KSSBkbyBub3QgZ2V0IHRoZSAiZm9y
IHN5bW1ldHJ5IHdpdGggQGRpc2FibGUuIj8KCj4gKwkgKiBBdG9taWMgZHJpdmVycyBkb24ndCBu
ZWVkIHRvIGltcGxlbWVudCBpdCBpZiB0aGVyZSdzIG5vIG5lZWQgdG8KPiArCSAqIGVuYWJsZSBh
bnl0aGluZyBhdCB0aGUgZW5jb2RlciBsZXZlbC4gVG8gZW5zdXJlIHRoYXQgcnVudGltZSBQTQo+
ICsJICogaGFuZGxpbmcgKHVzaW5nIGVpdGhlciBEUE1TIG9yIHRoZSBuZXcgIkFDVElWRSIgcHJv
cGVydHkpIHdvcmtzCj4gKwkgKiBAZW5hYmxlIG11c3QgYmUgdGhlIGludmVyc2Ugb2YgQGRpc2Fi
bGUgZm9yIGF0b21pYyBkcml2ZXJzLgpEaWQgeW91IHdhbnQgdG8gc2F5ICJAYXRvbWljX2VuYWJs
ZSBtdXN0IGJlIHRoZSBpbnZlcnNlIG9mIEBhdG9taWNfZGlzYWJsZSBmb3IgYXRvbWljIGRyaXZl
cnMuIj8KCj4gKwkgKi8KPiArCXZvaWQgKCphdG9taWNfZW5hYmxlKShzdHJ1Y3QgZHJtX2VuY29k
ZXIgKmVuY29kZXIsCj4gKwkJCSAgICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSk7
Cj4gKwo+ICAJLyoqCj4gIAkgKiBAZGlzYWJsZToKPiAgCSAqCj4gQEAgLTY5NSw2ICs3NDAsOSBA
QCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzIHsKPiAgCSAqIGhhbmRsaW5nICh1c2lu
ZyBlaXRoZXIgRFBNUyBvciB0aGUgbmV3ICJBQ1RJVkUiIHByb3BlcnR5KSB3b3Jrcwo+ICAJICog
QGRpc2FibGUgbXVzdCBiZSB0aGUgaW52ZXJzZSBvZiBAZW5hYmxlIGZvciBhdG9taWMgZHJpdmVy
cy4KPiAgCSAqCj4gKwkgKiBGb3IgYXRvbWljIGRyaXZlcnMgYWxzbyBjb25zaWRlciBAYXRvbWlj
X2Rpc2FibGUgYW5kIHNhdmUgeW91cnNlbGYKPiArCSAqIGZyb20gaGF2aW5nIHRvIHJlYWQgdGhl
IE5PVEUgYmVsb3chCk1heWJlLCBpZiB0aGlzIGlzIHNvLCBzYXkgdGhhdCBhdG9taWMgZHJpdmVy
cyBzaGFsbCBhbHd5YXMgdXNlIHRoZQphdG9taWNfKiB2YXJpYW50cz8KQW5kIHRoZW4gYWRkIGEg
VE9ETyBlbnRyeSB0byBtYWtlIGl0IHNvIGZvciB0aGUgb3RoZXIgYXRvbWljIGRyaXZlcnM/Cj4g
KwkgKgo+ICAJICogTk9URToKPiAgCSAqCj4gIAkgKiBXaXRoIGxlZ2FjeSBDUlRDIGhlbHBlcnMg
dGhlcmUncyBhIGJpZyBzZW1hbnRpYyBkaWZmZXJlbmNlIGJldHdlZW4KCgoJU2FtCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
