Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9ED76B7B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 16:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257626ED87;
	Fri, 26 Jul 2019 14:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9516F6ED86
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 14:23:14 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id EDCF55C0CE3;
 Fri, 26 Jul 2019 16:23:12 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 26 Jul 2019 16:23:12 +0200
From: Stefan Agner <stefan@agner.ch>
To: thierry.reding@gmail.com, airlied@linux.ie
Subject: Re: [PATCH] drm/tegra: return with probe defer if GPIO subsystem is
 not ready
In-Reply-To: <de84d04c902d1f7f22b6f024b853a1c7@agner.ch>
References: <20180726133606.14587-1-stefan@agner.ch>
 <de84d04c902d1f7f22b6f024b853a1c7@agner.ch>
Message-ID: <cd14bca0a1f1e097265602a1d5f0c0f5@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1564150992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5FMo6ELzebhiWgFCcrTDqmf5tKgwdevClIfhESEF3U=;
 b=dBEi8+80uL2lmGFpZLhKcS/qTHioGXH64pG245YbHH/YbMEnmAV73uL3DEIAadPCBHMWuO
 /ZwAOsLPL8o5h0X9GBieEvdd1/37Fcs2DRufDOTpkszqw+v/GpzzOkpJvYvMcl7BRiZuQP
 AhTCzMn0TNTO2I8rN5auX6bflp6YhFc=
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhpZXJyeSwgSGkgRGF2ZSwKCk9uIDIwMTgtMDktMDcgMDE6MzEsIFN0ZWZhbiBBZ25lciB3
cm90ZToKPiBPbiAyNi4wNy4yMDE4IDA2OjM2LCBTdGVmYW4gQWduZXIgd3JvdGU6Cj4+IElmIHRo
ZSBHUElPIHN1YnN5c3RlbSBpcyBub3QgcmVhZHkgbWFrZSBzdXJlIHRvIHJldHVybiAtRVBST0JF
X0RFRkVSCj4+IGluc3RlYWQgb2Ygc2lsZW50bHkgY29udGludWluZyB3aXRob3V0IEhQRC4KPj4K
Pj4gUmVwb3J0ZWQtYnk6IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXgu
Y29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KPiAK
PiBJIHRoaW5rIHRoaXMgZGlkIG5vdCBnZXQgbWVyZ2VkIHlldCwgYW55IGNoYW5jZSB0byBnZXQg
aXQgaW4/CgpBbnkgY2hhbmNlIHRvIGdldCB0aGlzIGluIGluIHRoZSBuZXh0IG1lcmdlIHdpbmRv
dz8KCi0tClN0ZWZhbgoKPiAKPiAtLQo+IFN0ZWZhbgo+IAo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9vdXRwdXQuYyB8IDQgKysrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL291dHB1dC5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jCj4+IGluZGV4
IGZmZTM0YmQwYmI5ZC4uNGJjZWZlNDU1YWZkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvb3V0cHV0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5j
Cj4+IEBAIC0xMzMsNyArMTMzLDkgQEAgaW50IHRlZ3JhX291dHB1dF9wcm9iZShzdHJ1Y3QgdGVn
cmFfb3V0cHV0ICpvdXRwdXQpCj4+ICAJb3V0cHV0LT5ocGRfZ3BpbyA9IG9mX2dldF9uYW1lZF9n
cGlvX2ZsYWdzKG91dHB1dC0+b2Zfbm9kZSwKPj4gIAkJCQkJCSAgICJudmlkaWEsaHBkLWdwaW8i
LCAwLAo+PiAgCQkJCQkJICAgJm91dHB1dC0+aHBkX2dwaW9fZmxhZ3MpOwo+PiAtCWlmIChncGlv
X2lzX3ZhbGlkKG91dHB1dC0+aHBkX2dwaW8pKSB7Cj4+ICsJaWYgKG91dHB1dC0+aHBkX2dwaW8g
PT0gLUVQUk9CRV9ERUZFUikgewo+PiArCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKPj4gKwl9IGVs
c2UgaWYgKGdwaW9faXNfdmFsaWQob3V0cHV0LT5ocGRfZ3BpbykpIHsKPj4gIAkJdW5zaWduZWQg
bG9uZyBmbGFnczsKPj4KPj4gIAkJZXJyID0gZ3Bpb19yZXF1ZXN0X29uZShvdXRwdXQtPmhwZF9n
cGlvLCBHUElPRl9ESVJfSU4sCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
