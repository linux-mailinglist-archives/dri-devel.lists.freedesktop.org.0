Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E76BF8D2B4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 14:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AABE6E29E;
	Wed, 14 Aug 2019 12:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB6C6E29B;
 Wed, 14 Aug 2019 12:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id C5149FB03;
 Wed, 14 Aug 2019 14:05:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6bTahRH3-Jl; Wed, 14 Aug 2019 14:05:43 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 8B37C428E0; Wed, 14 Aug 2019 14:05:42 +0200 (CEST)
Date: Wed, 14 Aug 2019 14:05:42 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 1/3] drm/etnaviv: skip command stream validation on
 PPAS capable GPUs
Message-ID: <20190814120542.GA19145@bogon.m.sigxcpu.org>
References: <20190809120514.5157-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809120514.5157-1-l.stach@pengutronix.de>
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

SGksCk9uIEZyaSwgQXVnIDA5LCAyMDE5IGF0IDAyOjA1OjEyUE0gKzAyMDAsIEx1Y2FzIFN0YWNo
IHdyb3RlOgo+IFdpdGggcGVyLXByb2Nlc3MgYWRkcmVzcyBzcGFjZXMgaW4gcGxhY2UsIGEgcm9n
dWUgcHJvY2VzcyBzdWJtaXR0aW5nCj4gYm9ndXMgY29tbWFuZCBzdHJlYW1zIGNhbiBvbmx5IGh1
cnQgaXRzZWxmLiBUaGVyZSBpcyBubyBuZWVkIHRvCj4gdmFsaWRhdGUgdGhlIGNvbW1hbmQgc3Ry
ZWFtIGJlZm9yZSBleGVjdXRpb24gYW55bW9yZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBT
dGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPiBSZXZpZXdlZC1ieTogUGhpbGlwcCBaYWJl
bCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KClJldmlld2VkLWJ5OiBHdWlkbyBHw7xudGhlciA8
YWd4QHNpZ3hjcHUub3JnPiAKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2
aXZfZ2VtX3N1Ym1pdC5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9ldG5hdml2X2dlbV9zdWJtaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
Z2VtX3N1Ym1pdC5jCj4gaW5kZXggMTZlN2QzNzFhN2VmLi42M2ExMjA2NDkyZDIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fc3VibWl0LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYwo+IEBAIC01MTcs
NyArNTE3LDggQEAgaW50IGV0bmF2aXZfaW9jdGxfZ2VtX3N1Ym1pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGVycl9zdWJtaXRfb2Jq
ZWN0czsKPiAgCj4gLQlpZiAoIWV0bmF2aXZfY21kX3ZhbGlkYXRlX29uZShncHUsIHN0cmVhbSwg
YXJncy0+c3RyZWFtX3NpemUgLyA0LAo+ICsJaWYgKChwcml2LT5tbXVfZ2xvYmFsLT52ZXJzaW9u
ICE9IEVUTkFWSVZfSU9NTVVfVjIpICYmCj4gKwkgICAgIWV0bmF2aXZfY21kX3ZhbGlkYXRlX29u
ZShncHUsIHN0cmVhbSwgYXJncy0+c3RyZWFtX3NpemUgLyA0LAo+ICAJCQkJICAgICAgcmVsb2Nz
LCBhcmdzLT5ucl9yZWxvY3MpKSB7Cj4gIAkJcmV0ID0gLUVJTlZBTDsKPiAgCQlnb3RvIGVycl9z
dWJtaXRfb2JqZWN0czsKPiAtLSAKPiAyLjIwLjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGV0bmF2aXYgbWFpbGluZyBsaXN0Cj4gZXRuYXZp
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2V0bmF2aXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
