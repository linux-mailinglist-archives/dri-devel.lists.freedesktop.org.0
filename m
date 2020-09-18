Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A2C27025E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 18:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2486ED0D;
	Fri, 18 Sep 2020 16:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE856ED10
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 16:39:47 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kJJQH-0001Nb-JT; Fri, 18 Sep 2020 16:39:45 +0000
Subject: Re: [PATCH][next] drm/panel: fix null pointer dereference on pointer
 mode
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <guido.gunther@puri.sm>
References: <20200918155136.28958-1-colin.king@canonical.com>
 <20200918162249.GA292461@bogon.m.sigxcpu.org>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <32528660-a9b0-75b2-264d-26d6dc90180c@canonical.com>
Date: Fri, 18 Sep 2020 17:39:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200918162249.GA292461@bogon.m.sigxcpu.org>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMDkvMjAyMCAxNzoyMiwgR3VpZG8gR8O8bnRoZXIgd3JvdGU6Cj4gSGksCj4gT24gRnJp
LCBTZXAgMTgsIDIwMjAgYXQgMDQ6NTE6MzZQTSArMDEwMCwgQ29saW4gS2luZyB3cm90ZToKPj4g
RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPj4KPj4gQ3Vy
cmVudGx5IGEgbnVsbCBwb2ludGVyIGNoZWNrIG9uIHBvaW50ZXIgbW9kZSBpcyBwYXNzaW5nIG1v
ZGUgdG8KPj4gZnVuY3Rpb24gZHJtX21vZGVfdnJlZnJlc2ggYW5kIHRoaXMgY2F1c2VzIGEgbnVs
bCBwb2ludGVyIGRlcmVmZXJlbmNlCj4+IG9uIG1vZGUuICBGaXggdGhpcyBieSBub3QgY2FsbGlu
ZyBkcm1fbW9kZV92cmVmcmVzaCBzaW5jZSB0aGUgY2FsbAo+PiBpcyBvbmx5IHJlcXVpcmVkIGZv
ciBlcnJvciByZXBvcnRpbmcuCj4+Cj4+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJEZXJlZmVyZW5j
ZSBhZnRlciBudWxsIGNoZWNrIikKPj4gRml4ZXM6IDcyOTY3ZDU2MTZkMyAoImRybS9wYW5lbDog
QWRkIHBhbmVsIGRyaXZlciBmb3IgdGhlIE1hbnRpeCBNTEFGMDU3V0U1MS1YIERTSSBwYW5lbCIp
Cj4+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5j
b20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3
d2U1MS5jIHwgNSArKy0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1tYW50aXgtbWxhZjA1N3dlNTEuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1tYW50
aXgtbWxhZjA1N3dlNTEuYwo+PiBpbmRleCAzNDgyZTI4ZTMwZmMuLmJlNDc2MWE2NDNmOSAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1
MS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1tYW50aXgtbWxhZjA1N3dl
NTEuYwo+PiBAQCAtMjAyLDkgKzIwMiw4IEBAIHN0YXRpYyBpbnQgbWFudGl4X2dldF9tb2Rlcyhz
dHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwKPj4gIAo+PiAgCW1vZGUgPSBkcm1fbW9kZV9kdXBsaWNh
dGUoY29ubmVjdG9yLT5kZXYsICZkZWZhdWx0X21vZGUpOwo+PiAgCWlmICghbW9kZSkgewo+PiAt
CQlkZXZfZXJyKGN0eC0+ZGV2LCAiRmFpbGVkIHRvIGFkZCBtb2RlICV1eCV1QCV1XG4iLAo+PiAt
CQkJZGVmYXVsdF9tb2RlLmhkaXNwbGF5LCBkZWZhdWx0X21vZGUudmRpc3BsYXksCj4+IC0JCQlk
cm1fbW9kZV92cmVmcmVzaChtb2RlKSk7Cj4+ICsJCWRldl9lcnIoY3R4LT5kZXYsICJGYWlsZWQg
dG8gYWRkIG1vZGUgJXV4JXVcbiIsCj4+ICsJCQlkZWZhdWx0X21vZGUuaGRpc3BsYXksIGRlZmF1
bHRfbW9kZS52ZGlzcGxheSk7Cj4+ICAJCXJldHVybiAtRU5PTUVNOwo+PiAgCX0KPiAKPiBkcm1f
bW9kZV92cmVmcmVzaCgmZGVmYXVsdF9tb2RlKSBnaXZlcyBzb21lIG1vcmUgY2x1ZSB3aGF0J3Mg
Z29pbmcgb24gLQo+IEkgaGF2ZSBoYWQgYSBmaXggcXVldWVkIHVwIGluIG15IHRyZWUgYWxyZWFk
eSBidXQgaWYgeW91IHNlbmQgYSB2Mgo+IHRoYXQncyBmaW5lLgoKSSdsbCBkZWZlciB0byB5b3Vy
IHF1ZXVlZCB1cCBmaXguCj4gCj4gVGhhbmtzIQo+ICAtLSBHdWlkbwo+IAo+PiAgCj4+IC0tIAo+
PiAyLjI3LjAKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
