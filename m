Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCE41F8383
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 15:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BFA6E04B;
	Sat, 13 Jun 2020 13:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3019E6E04B
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=alUWCuWnEc8Wz6AzBP1vJ1Rc9LzbWZybI/nGQwJlRI8=; b=KtTPlQBbNv4I9aO/Ez1Q9xiQyj
 Jd0chBq5bpouh7YOKP10zo6yNRA4HQV7UB1pGgFyA+Jk1jQWl3cJB4hE/60bd6ypbQSHCJBvmYGOU
 TwRlKCVJ0MVj2XYVRMw6kdkB+ZcsVEiIB3vzkApvvvnMhZCItWDnx4Tk+dorWl3Doy+k+zVpeXwOd
 g2Kcqm3WamVQdSaku9IwRmDOPNTyv3drrkkS+frpBJvLKKBykaCmWipM+P1L6OY6V6WBAKapXc071
 fxxI+BFD0eajrEilhbLU8kfgfm/clL/++y6DKxoSvjmTDt2Hq5EixslN676vDdoGmoNRC04EKIqFq
 xVcmEAgQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52684
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jk6Qa-0004RS-NN; Sat, 13 Jun 2020 15:42:32 +0200
Subject: Re: [PATCH 7/8] drm/mipi-dbi: Remove ->enabled
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-7-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <b95e1fa9-36b0-f240-424b-69bb48d5ccb7@tronnes.org>
Date: Sat, 13 Jun 2020 15:42:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612160056.2082681-7-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 David Lechner <david@lechnology.com>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTIuMDYuMjAyMCAxOC4wMCwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBUaGUgYXRvbWlj
IGhlbHBlcnMgdHJ5IHJlYWxseSBoYXJkIHRvIG5vdCBsb3NlIHRyYWNrIG9mIHRoaW5ncywKPiBk
dXBsaWNhdGluZyBlbmFibGVkIHRyYWNraW5nIGluIHRoZSBkcml2ZXIgaXMgYXQgYmVzdCBjb25m
dXNpbmcuCj4gRG91YmxlLWVuYWJsaW5nIG9yIGRpc2FibGluZyBpcyBhIGJ1ZyBpbiBhdG9taWMg
aGVscGVycy4KPiAKPiBJbiB0aGUgZmJfZGlydHkgZnVuY3Rpb24gd2UgY2FuIGp1c3QgYXNzdW1l
IHRoYXQgdGhlIGZiIGFsd2F5cyBleGlzdHMsCj4gc2ltcGxlIGRpc3BsYXkgcGlwZSBoZWxwZXJz
IGd1YXJhbnRlZSB0aGF0IHRoZSBjcnRjIGlzIG9ubHkgZW5hYmxlZAo+IHRvZ2V0aGVyIHdpdGgg
dGhlIG91dHB1dCwgc28gd2UgYWx3YXlzIGhhdmUgYSBwcmltYXJ5IHBsYW5lIGFyb3VuZC4KPiAK
PiBOb3cgaW4gdGhlIHVwZGF0ZSBmdW5jdGlvbiB3ZSBuZWVkIHRvIGJlIGEgbm90Y2ggbW9yZSBj
YXJlZnVsLCBzaW5jZQo+IHRoYXQgY2FuIGFsc28gZ2V0IGNhbGxlZCB3aGVuIHRoZSBjcnRjIGlz
IG9mZi4gQW5kIHdlIGRvbid0IHdhbnQgdG8KPiB1cGxvYWQgZnJhbWVzIHdoZW4gdGhhdCdzIHRo
ZSBjYXNlLCBzbyBmaWx0ZXIgdGhhdCBvdXQgdG9vLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJk
IDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogRGF2aWQgTGVjaG5lciA8ZGF2aWRA
bGVjaG5vbG9neS5jb20+Cj4gLS0tCgpUaGFua3MgZm9yIGZpeGluZyB0aGlzLgoKUmV2aWV3ZWQt
Ynk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
