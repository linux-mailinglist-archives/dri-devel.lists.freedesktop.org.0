Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4449AAEAEA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 14:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFF36E049;
	Tue, 10 Sep 2019 12:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDF06E049
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 12:55:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 05:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="175301639"
Received: from ikarachu-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.6.108])
 by orsmga007.jf.intel.com with ESMTP; 10 Sep 2019 05:55:21 -0700
Date: Tue, 10 Sep 2019 13:55:20 +0100
From: Eric Engestrom <eric.engestrom@intel.com>
To: Alan Coopersmith <alan.coopersmith@oracle.com>
Subject: Re: [PATCH libdrm] meson: Fix sys/mkdev.h detection on Solaris
Message-ID: <20190910125520.skda23msaby6otdp@intel.com>
References: <20190909235116.19290-1-alan.coopersmith@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190909235116.19290-1-alan.coopersmith@oracle.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCAyMDE5LTA5LTA5IDE2OjUxOjE2IC0wNzAwLCBBbGFuIENvb3BlcnNtaXRoIHdy
b3RlOgo+IE9uIFNvbGFyaXMsIHN5cy9zeXNtYWNyb3MuaCBoYXMgbG9uZy1kZXByZWNhdGVkIGNv
cGllcyBvZiBtYWpvcigpICYgbWlub3IoKQo+IGJ1dCBub3QgbWFrZWRldigpLiAgc3lzL21rZGV2
LmggaGFzIGFsbCB0aHJlZSBhbmQgaXMgdGhlIHByZWZlcnJlZCBjaG9pY2UuCj4gCj4gU28gd2Ug
Y2hlY2sgZm9yIHN5cy9ta2Rldi5oIGZpcnN0LCBhcyBhdXRvY29uZidzIEFDX0hFQURFUl9NQUpP
UiBkb2VzLgoKUmV2aWV3ZWQtYnk6IEVyaWMgRW5nZXN0cm9tIDxlcmljLmVuZ2VzdHJvbUBpbnRl
bC5jb20+CgpBbHRlcm5hdGl2ZWx5LCBob3cgYWJvdXQgdGhpcz8KLS0tODwtLS0KZGlmZiAtLWdp
dCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKaW5kZXggYmM1Y2ZjNTg4ZDBjNjIxYTk3MjUu
LjI2M2Y2OTFhYjJiOTEwN2Y1YmUxIDEwMDY0NAotLS0gYS9tZXNvbi5idWlsZAorKysgYi9tZXNv
bi5idWlsZApAQCAtMTgzLDkgKzE4MywxNCBAQCBmb3JlYWNoIGhlYWRlciA6IFsnc3lzL3N5c2N0
bC5oJywgJ3N5cy9zZWxlY3QuaCcsICdhbGxvY2EuaCddCiAgIGNvbmZpZy5zZXQoJ0hBVkVfJyAr
IGhlYWRlci51bmRlcnNjb3JpZnkoKS50b191cHBlcigpLAogICAgIGNjLmNvbXBpbGVzKCcjaW5j
bHVkZSA8QDBAPicuZm9ybWF0KGhlYWRlciksIG5hbWUgOiAnQDBAIHdvcmtzJy5mb3JtYXQoaGVh
ZGVyKSkpCiBlbmRmb3JlYWNoCi1pZiBjYy5oYXNfaGVhZGVyX3N5bWJvbCgnc3lzL3N5c21hY3Jv
cy5oJywgJ21ham9yJykKK2lmIChjYy5oYXNfaGVhZGVyX3N5bWJvbCgnc3lzL3N5c21hY3Jvcy5o
JywgJ21ham9yJykgYW5kCisgIGNjLmhhc19oZWFkZXJfc3ltYm9sKCdzeXMvc3lzbWFjcm9zLmgn
LCAnbWlub3InKSBhbmQKKyAgY2MuaGFzX2hlYWRlcl9zeW1ib2woJ3N5cy9zeXNtYWNyb3MuaCcs
ICdtYWtlZGV2JykpCiAgIGNvbmZpZy5zZXQxMCgnTUFKT1JfSU5fU1lTTUFDUk9TJywgdHJ1ZSkK
LWVsaWYgY2MuaGFzX2hlYWRlcl9zeW1ib2woJ3N5cy9ta2Rldi5oJywgJ21ham9yJykKK2VuZGlm
CitpZiAoY2MuaGFzX2hlYWRlcl9zeW1ib2woJ3N5cy9ta2Rldi5oJywgJ21ham9yJykgYW5kCisg
IGNjLmhhc19oZWFkZXJfc3ltYm9sKCdzeXMvbWtkZXYuaCcsICdtaW5vcicpIGFuZAorICBjYy5o
YXNfaGVhZGVyX3N5bWJvbCgnc3lzL21rZGV2LmgnLCAnbWFrZWRldicpKQogICBjb25maWcuc2V0
MTAoJ01BSk9SX0lOX01LREVWJywgdHJ1ZSkKIGVuZGlmCiBjb25maWcuc2V0MTAoJ0hBVkVfT1BF
Tl9NRU1TVFJFQU0nLCBjYy5oYXNfZnVuY3Rpb24oJ29wZW5fbWVtc3RyZWFtJykpCi0tLT44LS0t
CgpNYWtlcyBib3RoIGNoZWNrcyBpbmRlcGVuZGVudCBhbmQgcmVwcmVzZW50IHRoZSByZWFsaXR5
IG9mIHdoYXQncyB3YW50ZWQKbW9yZSBhY2N1cmF0ZWx5IChkZXNwaXRlIHRoZSBoaXN0b3JpY2Fs
IG5hbWUgb2YgdGhlIG1hY3JvKS4KCj4gCj4gRml4ZXMgYnVpbGQgZmFpbHVyZSB3aXRoIGVycm9y
Ogo+IC4uL3hmODZkcm0uYzogSW4gZnVuY3Rpb24g4oCYZHJtT3Blbk1pbm9y4oCZOgo+IC4uL3hm
ODZkcm0uYzo0NTQ6MzA6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDi
gJhtYWtlZGV24oCZIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAg
NDU0IHwgICAgICAgICByZXR1cm4gZHJtT3BlbkRldmljZShtYWtlZGV2KERSTV9NQUpPUiwgbWlu
b3IpLCBtaW5vciwgdHlwZSk7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGFuIENvb3BlcnNtaXRoIDxhbGFuLmNvb3Bl
cnNtaXRoQG9yYWNsZS5jb20+Cj4gLS0tCj4gIG1lc29uLmJ1aWxkIHwgNiArKystLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAo+IGluZGV4IGJjNWNmYzU4Li5hMzM2M2Mz
MiAxMDA2NDQKPiAtLS0gYS9tZXNvbi5idWlsZAo+ICsrKyBiL21lc29uLmJ1aWxkCj4gQEAgLTE4
MywxMCArMTgzLDEwIEBAIGZvcmVhY2ggaGVhZGVyIDogWydzeXMvc3lzY3RsLmgnLCAnc3lzL3Nl
bGVjdC5oJywgJ2FsbG9jYS5oJ10KPiAgICBjb25maWcuc2V0KCdIQVZFXycgKyBoZWFkZXIudW5k
ZXJzY29yaWZ5KCkudG9fdXBwZXIoKSwKPiAgICAgIGNjLmNvbXBpbGVzKCcjaW5jbHVkZSA8QDBA
PicuZm9ybWF0KGhlYWRlciksIG5hbWUgOiAnQDBAIHdvcmtzJy5mb3JtYXQoaGVhZGVyKSkpCj4g
IGVuZGZvcmVhY2gKPiAtaWYgY2MuaGFzX2hlYWRlcl9zeW1ib2woJ3N5cy9zeXNtYWNyb3MuaCcs
ICdtYWpvcicpCj4gLSAgY29uZmlnLnNldDEwKCdNQUpPUl9JTl9TWVNNQUNST1MnLCB0cnVlKQo+
IC1lbGlmIGNjLmhhc19oZWFkZXJfc3ltYm9sKCdzeXMvbWtkZXYuaCcsICdtYWpvcicpCj4gK2lm
IGNjLmhhc19oZWFkZXJfc3ltYm9sKCdzeXMvbWtkZXYuaCcsICdtYWpvcicpCj4gICAgY29uZmln
LnNldDEwKCdNQUpPUl9JTl9NS0RFVicsIHRydWUpCj4gK2VsaWYgY2MuaGFzX2hlYWRlcl9zeW1i
b2woJ3N5cy9zeXNtYWNyb3MuaCcsICdtYWpvcicpCj4gKyAgY29uZmlnLnNldDEwKCdNQUpPUl9J
Tl9TWVNNQUNST1MnLCB0cnVlKQo+ICBlbmRpZgo+ICBjb25maWcuc2V0MTAoJ0hBVkVfT1BFTl9N
RU1TVFJFQU0nLCBjYy5oYXNfZnVuY3Rpb24oJ29wZW5fbWVtc3RyZWFtJykpCj4gIAo+IC0tIAo+
IDIuMTUuMgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
