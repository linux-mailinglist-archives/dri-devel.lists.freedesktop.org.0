Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BBC7EEF0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF826ED28;
	Fri,  2 Aug 2019 08:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EA388F1E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id CFA91FB04;
 Fri,  2 Aug 2019 10:19:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLVhowaenJlZ; Fri,  2 Aug 2019 10:19:23 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 825F647246; Fri,  2 Aug 2019 10:19:23 +0200 (CEST)
Date: Fri, 2 Aug 2019 10:19:23 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/etnaviv: fix etnaviv_cmdbuf_suballoc_new return
 value
Message-ID: <20190802081923.GB6331@bogon.m.sigxcpu.org>
References: <20190705171536.26727-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705171536.26727-1-l.stach@pengutronix.de>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDA3OjE1OjM1UE0gKzAyMDAsIEx1Y2FzIFN0YWNo
IHdyb3RlOgo+IFRoZSBjYWxsIHNpdGUgZXhwZWN0cyB0byBnZXQgZWl0aGVyIGEgdmFsaWQgc3Vi
YWxsb2Mgb3IgYW4gZXJyb3IKPiBwb2ludGVyLCBzbyBhIE5VTEwgcmV0dXJuIHdpbGwgbm90IGJl
IHRyZWF0ZWQgYXMgYW4gZXJyb3IuIE1ha2UKPiBzdXJlIHRvIGFsd2F5cyByZXR1cm4gYSBwcm9w
ZXIgZXJyb3IgcG9pbnRlciBpbiBjYXNlIHNvbWV0aGluZyBnb2VzCj4gd3JvbmcuCj4gCj4gU2ln
bmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfY21kYnVmLmMgfCA2ICsrKystLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2NtZGJ1Zi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9jbWRidWYuYwo+IGluZGV4IGJiNDkwMGJjMWM0Yy4u
N2I3Nzk5MmYzMWM0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2
aXZfY21kYnVmLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2NtZGJ1
Zi5jCj4gQEAgLTQ4LDggKzQ4LDEwIEBAIGV0bmF2aXZfY21kYnVmX3N1YmFsbG9jX25ldyhzdHJ1
Y3QgZXRuYXZpdl9ncHUgKiBncHUpCj4gIAo+ICAJc3ViYWxsb2MtPnZhZGRyID0gZG1hX2FsbG9j
X3djKGdwdS0+ZGV2LCBTVUJBTExPQ19TSVpFLAo+ICAJCQkJICAgICAgICZzdWJhbGxvYy0+cGFk
ZHIsIEdGUF9LRVJORUwpOwo+IC0JaWYgKCFzdWJhbGxvYy0+dmFkZHIpCj4gKwlpZiAoIXN1YmFs
bG9jLT52YWRkcikgewo+ICsJCXJldCA9IC1FTk9NRU07Cj4gIAkJZ290byBmcmVlX3N1YmFsbG9j
Owo+ICsJfQo+ICAKPiAgCXJldCA9IGV0bmF2aXZfaW9tbXVfZ2V0X3N1YmFsbG9jX3ZhKGdwdSwg
c3ViYWxsb2MtPnBhZGRyLAo+ICAJCQkJCSAgICAmc3ViYWxsb2MtPnZyYW1fbm9kZSwgU1VCQUxM
T0NfU0laRSwKPiBAQCAtNjQsNyArNjYsNyBAQCBldG5hdml2X2NtZGJ1Zl9zdWJhbGxvY19uZXco
c3RydWN0IGV0bmF2aXZfZ3B1ICogZ3B1KQo+ICBmcmVlX3N1YmFsbG9jOgo+ICAJa2ZyZWUoc3Vi
YWxsb2MpOwo+ICAKPiAtCXJldHVybiBOVUxMOwo+ICsJcmV0dXJuIEVSUl9QVFIocmV0KTsKPiAg
fQo+ICAKPiAgdm9pZCBldG5hdml2X2NtZGJ1Zl9zdWJhbGxvY19kZXN0cm95KHN0cnVjdCBldG5h
dml2X2NtZGJ1Zl9zdWJhbGxvYwo+ICAqc3ViYWxsb2MpCgpSZXZpZXdlZC1ieTogR3VpZG8gR8O8
bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KCkNoZWVycywKIC0tIEd1aWRvCgo+IC0tIAo+IDIuMjAu
MQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
ZXRuYXZpdiBtYWlsaW5nIGxpc3QKPiBldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
