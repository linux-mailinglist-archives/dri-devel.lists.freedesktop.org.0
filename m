Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB44E9C6BF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7611089970;
	Mon, 26 Aug 2019 00:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDEF6E07B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 14:04:19 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 62so7198280lfa.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 07:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nf2hiLJ2dx1VDSupA+UDnj6Ucg+uq8lRJBWo2HQPq1o=;
 b=ORqjIDMWrAEKOwo44SQ888F8t+Ll6u2UJgq3PECHDA9VaPx0GR4NX87s6y2BcrZdds
 IYLUslU+4vY8nLN99TtNZr3E9NA5KQ3k1wzxr1QvT3u2BBzDE3SJxft0thFGQPM+Zmvz
 LsWhsv6a8K+c1xlw4Q5oYnBt5DLAkvRSZixkc5Bwal2GC8oZY5zMvCDzWBd+MYlORcbR
 9xERAoQfhTBhILX/7EIX66B3oNpySdRPnXx5kSDT0pEUc7glDTp66oNinpSZuHNv2p5l
 rAmneLvAeROB+8DqnzyPocBIDK/lq3lYrk/JKq5VR3rXHyM+sRoSlaZuifwJMNMzIwSI
 v3Pw==
X-Gm-Message-State: APjAAAUKg+Hp/cKHU5fOLnvLTkMvRWlPMi+Jgs/8wQ34w0zeUpos+CCM
 Fhd7zau9evU28QZkVzEeXi7SWlbm1xAN/m7qWxM=
X-Google-Smtp-Source: APXvYqyKV5vxgLBuL+Q2v2+rceTx5Fyh0mj6XEk1p1fBa8nN+JHcbbWWgC6VPYjKSMBrP0Sz4Iz9RhSd+3czDak7Ics=
X-Received: by 2002:a19:40d5:: with SMTP id n204mr3099303lfa.70.1566569057549; 
 Fri, 23 Aug 2019 07:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <5978761.uBj7R84RrF@jernej-laptop>
 <CAOUEw13CCVhk9kt_z2VkguX0=TCeARkH-8+qSh_nF-J+r0Rscg@mail.gmail.com>
 <20190820150018.uhiquahda6wuxvjd@flea>
In-Reply-To: <20190820150018.uhiquahda6wuxvjd@flea>
From: Thomas Graichen <thomas.graichen@googlemail.com>
Date: Fri, 23 Aug 2019 16:04:07 +0200
Message-ID: <CAOUEw13wCoYP-AbhLghR7NP_1quvQdfsQ2wQ-O38VCXqMmJNpg@mail.gmail.com>
Subject: Re: [v5,05/12] drm/modes: Rewrite the command line parser
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nf2hiLJ2dx1VDSupA+UDnj6Ucg+uq8lRJBWo2HQPq1o=;
 b=PiyMYPa1TO5BCQpI75BgugZmPegCF/qCE4rxE/6ppj5gTKH6M43Wp+C3ObtmVpTX4W
 vUreGMDvw78VLLWVRrG8YldeJqbYRZaOxM2em8R8Y04Lg1BCyCjZKsF+wKI4hdep3oQN
 IED+1mvr+vH557Gq7dV9SzSot8S+ngfNZFGvwWA0+JF4vNeSlXMIDtSIN948weXjCtl+
 BaPLl6iM/+pkoh7t+5JBQxL5slxAB6PwOrM6zE9vxfzxU89MqAxcKicRRznyFo20XhaK
 UbPCSpOQo7CWrYm7vQwtfrh9+rPb6FzphCJg0xsRd12EZgN7A52TA8Xp2O4pg6ROd2Dc
 U51Q==
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
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aGkgbWF4aW0sCgpPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCA1OjAwIFBNIE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBNb24sIEF1
ZyAxOSwgMjAxOSBhdCAwOToyMDowMFBNICswMjAwLCBUaG9tYXMgR3JhaWNoZW4gd3JvdGU6Cj4g
PiBPbiBNb24sIEF1ZyAxOSwgMjAxOSBhdCA4OjU0IFBNIEplcm5laiDFoGtyYWJlYyA8amVybmVq
LnNrcmFiZWNAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gK0NDOiBUaG9tYXMgR3JhaWNo
ZW4KPiA+ID4KPiA+ID4gRG5lIHBvbmVkZWxqZWssIDE3LiBqdW5paiAyMDE5IG9iIDE2OjUxOjMy
IENFU1QgamUgTWF4aW1lIFJpcGFyZCBuYXBpc2FsKGEpOgo+ID4gPiA+IEZyb206IE1heGltZSBS
aXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgo+ID4gPiA+Cj4gPiA+ID4g
UmV3cml0ZSB0aGUgY29tbWFuZCBsaW5lIHBhcnNlciBpbiBvcmRlciB0byBnZXQgYXdheSBmcm9t
IHRoZSBzdGF0ZSBtYWNoaW5lCj4gPiA+ID4gcGFyc2luZyB0aGUgdmlkZW8gbW9kZSBsaW5lcy4K
PiA+ID4gPgo+ID4gPiA+IEhvcGVmdWxseSwgdGhpcyB3aWxsIGFsbG93IHRvIGV4dGVuZCBpdCBt
b3JlIGVhc2lseSB0byBzdXBwb3J0IG5hbWVkIG1vZGVzCj4gPiA+ID4gYW5kIC8gb3IgcHJvcGVy
dGllcyBzZXQgZGlyZWN0bHkgb24gdGhlIGNvbW1hbmQgbGluZS4KPiA+ID4gPgo+ID4gPiA+IFJl
dmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGZyZWUtZWxlY3Ryb25z
LmNvbT4KPiA+ID4KPiA+ID4gVGhvbWFzIHJlcG9ydGVkIHRvIG1lIHRoYXQgdGhpcyBwYXRjaCBi
cmVha3MgInZpZGVvPUNPTk5FQ1RPUjplIiBrZXJuZWwKPiA+ID4gcGFyYW1ldGVyIHdoaWNoIGhl
IGN1cnJlbnRseSB1c2VzIGFzIGEgd29ya2Fyb3VuZCBmb3IgSDYgSERNSSBtb25pdG9yCj4gPiA+
IGRldGVjdGlvbiBpc3N1ZSBvbiBvbmUgU1RCLgo+ID4gPgo+ID4gPiBJIHN1cHBvc2UgdGhpcyBp
cyB0aGUgc2FtZSBpc3N1ZSB0aGF0IERtaXRyeSBub3RpY2VkLgo+ID4gPgo+ID4gPiBUaG9tYXMg
R3JhaWNoZW4gKGluIENDKSBjYW4gcHJvdmlkZSBtb3JlIGluZm9ybWF0aW9uIGlmIG5lZWRlZC4K
PiA+Cj4gPiBhcyBqZXJuZWogYWxyZWFkeSBtZW50aW9uZWQgaSBhbSBjdXJyZW50bHkgaGF2aW5n
IHRvIHVzZSB0aGUga2VybmVsCj4gPiBjbWRsaW5lIG9wdGlvbiB2aWRlbz1IRE1JLUEtMTplIHRv
IGdldCBhIHdvcmtpbmcgaGRtaSBvdXRwdXQgb24gYW4KPiA+IGVhY2hsaW5rIGg2IG1pbmkgdHYg
Ym94IGFuZCB3YXMgd29uZGVyaW5nIHRoYXQgaSBkaWQgbm90IGdldCBhbnkgaGRtaQo+ID4gb3V0
cHV0IGV2ZW4gd2l0aCB0aGlzIG9wdGlvbiB3aGVuIHN3aXRjaGluZyBmcm9tIHRoZQo+ID4gaHR0
cHM6Ly9naXRodWIuY29tL21lZ291cy9saW51eCBvcHJhbmdlLXBpLTUuMiB0byB0aGUgb3Jhbmdl
LXBpLTUuMwo+ID4gYnJhbmNoIHdoaWNoIHNlZW1zIHRvIGNvbnRhaW4gdGhpcyBwYXRjaC4KPgo+
IFdoaWNoIGtlcm5lbCB2ZXJzaW9uIGlzIHRoYXQgYmFzZWQgb24/Cgo1LjMtcmMzCgo+ID4gYXMg
aSBoYWQgbm8gaWRlYSB3aGF0IG1pZ2h0IGhhdmUgY2F1c2VkIHRoZSBicmVha2FnZSBvZiB0aGUg
aGRtaQo+ID4gb3V0cHV0IGFuZCBkaWQgYSBmdWxsIGJpc2VjdCBvZiB0aGUga2VybmVsIGJldHdl
ZW4gdGhvc2UgdHdvCj4gPiB2ZXJzaW9ucywgd2hpY2ggZW5kZWQgcmVsaWFibHkgYXQgZXhhY3Rs
eSB0aGlzIHBhdGNoIC0gc28gaSBndWVzcwo+ID4gdGhlcmUgaXMgYSByZWdyZXNzaW9uIGF0IGxl
YXN0IHdpdGggdGhlIHZpZGVvPUNPTk5FQ1RPUjplIG9wdGlvbgo+ID4gKG1heWJlIG90aGVycyB0
b28/KSB3aXRoIHRoaXMgcGF0Y2hlcyBjb2RlIHdoaWNoIG1ha2VzIGl0IG5vdAo+ID4gd29ya2lu
ZyBhbnltb3JlLgo+Cj4gSSdtIG5vdCBzdXJlIEknbGwgaGF2ZSB0aGUgdGltZSB0byBsb29rIGlu
dG8gaXQgdGhpcyB3ZWVrIChvciB0aGUKPiBuZXh0LCB1bmZvcnR1bmF0ZWx5KS4gSG93ZXZlciwg
dGhlIGUgcGFyYW1ldGVyIGlzIHN1cHBvc2VkIHRvIGJlCj4gcGFyc2VkIGJ5IGRybV9tb2RlX3Bh
cnNlX2NtZGxpbmVfZXh0cmEsIHdoaWNoIGluIHR1cm4gaXMgc3VwcG9zZWQgdG8KPiBiZSBjYWxs
ZWQgdGhlcmU6Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMy1yYzUvc291
cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyNMMTgxMAo+Cj4gSWYgeW91IGNhbiB0ZXN0
IHRoYXQsIGhhdmluZyBhbiBpZGVhIG9mIGlmIHRoYXQgZnVuY3Rpb24gaXMgY2FsbGVkLAo+IHdo
aWNoIHJldHVybiBjb2RlIGl0IHJldHVybnMsIGFuZCBpZiBpdCBpc24ndCBpZiB3aHkgd291bGQg
YmUgc3VwZXIKPiBoZWxwZnVsLgoKaSBqdXN0IGFkZGVkIGEgcHJpbnRrIGFuZCBpdCBsb29rcyBs
aWtlIGl0IGlzIG5vdCBnZXR0aW5nIGNhbGxlZDoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKaW5kZXggYjAzNjll
NjkwZjM2Li40YzU4ZmRiMWQ3YmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9k
ZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKQEAgLTE4MTMsNiArMTgxMyw3
IEBAIGJvb2wKZHJtX21vZGVfcGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IoY29uc3Qg
Y2hhciAqbW9kZV9vcHRpb24sCgogICAgICAgICAgICAgICAgcmV0ID0gZHJtX21vZGVfcGFyc2Vf
Y21kbGluZV9leHRyYShleHRyYV9wdHIsIGxlbiwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29ubmVjdG9yLCBtb2RlKTsKKyAgICAgICAgICAgICAg
IHByaW50ayhLRVJOX1dBUk5JTkcgIkRFQlVHIC0KZHJtX21vZGVfcGFyc2VfY21kbGluZV9leHRy
YSAlZCIsIHJldCk7CiAgICAgICAgICAgICAgICBpZiAocmV0KQogICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7CiAgICAgICAgfQoKbm8gb3V0cHV0IGZyb20gaXQgaW4gZG1lc2cg
KG15IGxvZ2xldmVsPTggYW5kIG9uIHRoZSBrZXJuZWwgY21kbGluZQphbmQgaW4gL3Byb2MvY21k
bGluZSBpIGhhdmUgInZpZGVvPUhETUktQS0xOmUiKSAtIHNvIGxvb2tzIGxpa2UgaXQKcmVhbGx5
IGdldHMgbG9zdCBzb21ld2hlcmUgYWxvbmcgdGhlIHdheSAuLi4KCmJlc3Qgd2lzaGVzIC0gdGhv
bWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
