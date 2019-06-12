Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3B143367
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326D589327;
	Thu, 13 Jun 2019 07:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097C9888D9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:50:00 +0000 (UTC)
Date: Wed, 12 Jun 2019 10:49:52 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 1/2] dt-bindings: Add doc for the Ingenic JZ47xx LCD
 controller driver
To: Rob Herring <robh@kernel.org>
Message-Id: <1560329392.1823.1@crapouillou.net>
In-Reply-To: <20190611215554.GA23791@bogus>
References: <20190603152331.23160-1-paul@crapouillou.net>
 <20190611215554.GA23791@bogus>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1560329398; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qI8IlvgG3xtgR+kPR9NmFwLa8z15R4AFwa5PzuA3tsw=;
 b=nkRUMm+MmQ3Z4Poafx518YANlIeZoQ1q6oucK0Gym45Q4O0ovk2TX8p7NxBFAKT7mFrvVc
 Eiu3/JU9eofLGdOPC7QIqaGuglgk9LXEtddQxc4wmi2AmGeGVh4k/tKMLb+pLu7XJn9Uzl
 FYkCR6nTFUepT40VYhfFNfKM1TIhYRY=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Artur Rojek <contact@artur-rojek.eu>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpMZSBtYXIuIDExIGp1aW4gMjAxOSDDoCAyMzo1NSwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gYSDDqWNyaXQgOgo+IE9uIE1vbiwgIDMgSnVuIDIwMTkgMTc6MjM6MzAgKzAyMDAsIFBh
dWwgQ2VyY3VlaWwgd3JvdGU6Cj4+ICBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIGRldmljZXRy
ZWUgYmluZGluZ3Mgb2YgdGhlIExDRCBjb250cm9sbGVyIAo+PiBwcmVzZW50IGluCj4+ICB0aGUg
Slo0N3h4IGZhbWlseSBvZiBTb0NzIGZyb20gSW5nZW5pYy4KPj4gCj4+ICBTaWduZWQtb2ZmLWJ5
OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KPj4gIFRlc3RlZC1ieTogQXJ0
dXIgUm9qZWsgPGNvbnRhY3RAYXJ0dXItcm9qZWsuZXU+Cj4+ICAtLS0KPj4gCj4+ICBOb3RlczoK
Pj4gICAgICB2MjogUmVtb3ZlIGluZ2VuaWMscGFuZWwgcHJvcGVydHkuCj4+IAo+PiAgICAgIHYz
OiAtIFJlbmFtZSBjb21wYXRpYmxlIHN0cmluZ3MgZnJvbSBpbmdlbmljLGp6NDdYWC1kcm0gdG8g
Cj4+IGluZ2VuaWMsano0N1hYLWxjZAo+PiAgICAgICAgICAtIFRoZSBpbmdlbmljLGxjZC1tb2Rl
IHByb3BlcnR5IGlzIG5vdyByZWFkIGZyb20gdGhlIHBhbmVsIAo+PiBub2RlIGluc3RlYWQKPj4g
ICAgICAJICBvZiBmcm9tIHRoZSBkcml2ZXIgbm9kZQo+PiAKPj4gICAgICB2NDogUmVtb3ZlIGlu
Z2VuaWMsbGNkLW1vZGUgcHJvcGVydHkgY29tcGxldGVseS4KPj4gCj4+ICAgICAgdjU6IE5vIGNo
YW5nZQo+PiAKPj4gICAuLi4vYmluZGluZ3MvZGlzcGxheS9pbmdlbmljLGxjZC50eHQgICAgICAg
ICAgfCA0NCAKPj4gKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0NCBp
bnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+PiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbmdlbmljLGxjZC50eHQKPj4gCj4gCj4gUGxlYXNl
IGFkZCBBY2tlZC1ieS9SZXZpZXdlZC1ieSB0YWdzIHdoZW4gcG9zdGluZyBuZXcgdmVyc2lvbnMu
IAo+IEhvd2V2ZXIsCj4gdGhlcmUncyBubyBuZWVkIHRvIHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0
byBhZGQgdGhlIHRhZ3MuIFRoZSB1cHN0cmVhbQo+IG1haW50YWluZXIgd2lsbCBkbyB0aGF0IGZv
ciBhY2tzIHJlY2VpdmVkIG9uIHRoZSB2ZXJzaW9uIHRoZXkgYXBwbHkuCj4gCj4gSWYgYSB0YWcg
d2FzIG5vdCBhZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5IGFuZCB3aGF0IGNoYW5n
ZWQuCgpTb3JyeSBSb2IsIG15IG1pc3Rha2UuIEkgc2ltcGx5IGZvcmdvdCB0aGF0IHlvdSBldmVy
IHJldmlld2VkIHRoYXQgCnBhdGNoLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
