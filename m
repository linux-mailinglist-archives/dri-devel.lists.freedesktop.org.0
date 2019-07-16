Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2606A274
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 08:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471046E0A5;
	Tue, 16 Jul 2019 06:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47A66E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 06:53:37 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C41EF80348;
 Tue, 16 Jul 2019 08:53:34 +0200 (CEST)
Date: Tue, 16 Jul 2019 08:53:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/i2c/tda998x: drop use of drmP.h
Message-ID: <20190716065333.GA18722@ravnborg.org>
References: <20190630052113.5966-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190630052113.5966-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=PHq6YzTAAAAA:8 a=e5mUnYsNAAAA:8 a=UySjDqCWeqWLvj6-srQA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=ZKzU8r6zoKMcqsNulkmm:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMDc6MjE6MTNBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IERyb3AgdXNlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIgZmlsZS4KPiBG
aXggZmFsbG91dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+Cj4gQ2M6IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPgo+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KPiAtLS0KPiBUaGUgcGF0Y2ggaXMgYnVpbGQgdGVzdGVkIHVzaW5nIHNldmVy
YWwgY29uZmlncyBhbmQKPiBzZXZlcmFsIGFyY2hpdGVjdHVyZXMgKGluY2x1ZGluZyBhcm0sIGFy
bTY0LCB4ODYpLgo+IAo+IFRoZSBwYXRjaCBpcyBiYXNlZCBvbiBkcm0tbWlzYy4KPiAKPiBJZiBw
YXRjaCBpcyBPSywgcGxlYXNlIGFwcGx5IHRvIHlvdXIgdHJlZQo+IGFzIHRoaXMgZHJpdmVyIGlz
IG1haW50YWluZWQgb3V0c2lkZSBkcm0tbWlzYy4KPiAKPiBJIGFtIGhhcHB5IHRvIHJlYmFzZSBv
biBhbm90aGVyIHRyZWUsIGp1c3QgbGV0IG1lIGtub3cuCgpPayB0byBsYW5kIHRoaXMgaW4gZHJt
LW1pc2MtbmV4dD8KCglTYW0KCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYu
YyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYwo+IGluZGV4IDdmMzQ2MDFiYjUxNS4uNWVk
NjUwYmE2MGViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYwo+IEBAIC0yNCwxMCAr
MjQsMTAgQEAKPiAgI2luY2x1ZGUgPHNvdW5kL2Fzb3VuZGVmLmg+Cj4gICNpbmNsdWRlIDxzb3Vu
ZC9oZG1pLWNvZGVjLmg+Cj4gIAo+IC0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KPiAgI2luY2x1ZGUg
PGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9lZGlkLmg+Cj4g
ICNpbmNsdWRlIDxkcm0vZHJtX29mLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4g
ICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2kyYy90
ZGE5OTh4Lmg+Cj4gIAo+IC0tIAo+IDIuMjAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
