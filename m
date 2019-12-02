Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF4C10E69B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 09:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2117689E1D;
	Mon,  2 Dec 2019 08:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 524 seconds by postgrey-1.36 at gabe;
 Mon, 02 Dec 2019 07:45:48 UTC
Received: from protonic.nl (protonic.xs4all.nl [83.163.252.89])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD17F89F8E;
 Mon,  2 Dec 2019 07:45:48 +0000 (UTC)
Received: from webmail.promanet.nl (edge2.prtnl [192.168.1.170])
 by sparta (Postfix) with ESMTP id 523FF44A0022;
 Mon,  2 Dec 2019 08:37:02 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 02 Dec 2019 08:37:02 +0100
From: robin <robin@protonic.nl>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 14/14] auxdisplay: constify fb ops
In-Reply-To: <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
 <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
Message-ID: <7644533f18ad010366bd27baaf915082@protonic.nl>
X-Sender: robin@protonic.nl
User-Agent: Roundcube Webmail/1.3.6
X-Mailman-Approved-At: Mon, 02 Dec 2019 08:00:49 +0000
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0yOSAxMToyOSwgSmFuaSBOaWt1bGEgd3JvdGU6Cj4gTm93IHRoYXQgdGhlIGZi
b3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBjb25zdCwgd2UgY2FuIHN0YXJ0Cj4gbWFr
aW5nIHRoZSBvcHMgY29uc3QgYXMgd2VsbC4KPiAKPiBDYzogTWlndWVsIE9qZWRhIFNhbmRvbmlz
IDxtaWd1ZWwub2plZGEuc2FuZG9uaXNAZ21haWwuY29tPgo+IENjOiBSb2JpbiB2YW4gZGVyIEdy
YWNodCA8cm9iaW5AcHJvdG9uaWMubmw+Cj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9hdXhkaXNwbGF5L2NmYWcxMjg2
NGJmYi5jIHwgMiArLQo+ICBkcml2ZXJzL2F1eGRpc3BsYXkvaHQxNmszMy5jICAgICAgfCAyICst
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2F1eGRpc3BsYXkvY2ZhZzEyODY0YmZiLmMKPiBiL2RyaXZl
cnMvYXV4ZGlzcGxheS9jZmFnMTI4NjRiZmIuYwo+IGluZGV4IDQwNzQ4ODZiN2JjOC4uMjAwMjI5
MWFiMzM4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYXV4ZGlzcGxheS9jZmFnMTI4NjRiZmIuYwo+
ICsrKyBiL2RyaXZlcnMvYXV4ZGlzcGxheS9jZmFnMTI4NjRiZmIuYwo+IEBAIC01Nyw3ICs1Nyw3
IEBAIHN0YXRpYyBpbnQgY2ZhZzEyODY0YmZiX21tYXAoc3RydWN0IGZiX2luZm8gKmluZm8sCj4g
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gIAlyZXR1cm4gdm1fbWFwX3BhZ2VzX3plcm8o
dm1hLCAmcGFnZXMsIDEpOwo+ICB9Cj4gCj4gLXN0YXRpYyBzdHJ1Y3QgZmJfb3BzIGNmYWcxMjg2
NGJmYl9vcHMgPSB7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmJfb3BzIGNmYWcxMjg2NGJmYl9v
cHMgPSB7Cj4gIAkub3duZXIgPSBUSElTX01PRFVMRSwKPiAgCS5mYl9yZWFkID0gZmJfc3lzX3Jl
YWQsCj4gIAkuZmJfd3JpdGUgPSBmYl9zeXNfd3JpdGUsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
YXV4ZGlzcGxheS9odDE2azMzLmMgCj4gYi9kcml2ZXJzL2F1eGRpc3BsYXkvaHQxNmszMy5jCj4g
aW5kZXggYTJmY2RlNTgyZTJhLi5kOTUxZDU0YjI2ZjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9h
dXhkaXNwbGF5L2h0MTZrMzMuYwo+ICsrKyBiL2RyaXZlcnMvYXV4ZGlzcGxheS9odDE2azMzLmMK
PiBAQCAtMjI4LDcgKzIyOCw3IEBAIHN0YXRpYyBpbnQgaHQxNmszM19tbWFwKHN0cnVjdCBmYl9p
bmZvICppbmZvLAo+IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICAJcmV0dXJuIHZtX21h
cF9wYWdlc196ZXJvKHZtYSwgJnBhZ2VzLCAxKTsKPiAgfQo+IAo+IC1zdGF0aWMgc3RydWN0IGZi
X29wcyBodDE2azMzX2ZiX29wcyA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBmYl9vcHMgaHQx
NmszM19mYl9vcHMgPSB7Cj4gIAkub3duZXIgPSBUSElTX01PRFVMRSwKPiAgCS5mYl9yZWFkID0g
ZmJfc3lzX3JlYWQsCj4gIAkuZmJfd3JpdGUgPSBmYl9zeXNfd3JpdGUsCgpBY2tlZC1ieTogUm9i
aW4gdmFuIGRlciBHcmFjaHQgPHJvYmluQHByb3RvbmljLm5sPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
