Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 871CA3CD10
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 15:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C1B891C3;
	Tue, 11 Jun 2019 13:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3974F891BE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 13:35:09 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52404
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hagvY-0004cE-7l; Tue, 11 Jun 2019 15:35:04 +0200
Subject: Re: [PATCH] drm/fb: document dirty helper better
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190611112859.16375-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <c472cb9b-9f23-3cd4-8836-d6aa11d5ec33@tronnes.org>
Date: Tue, 11 Jun 2019 15:34:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611112859.16375-1-daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=Ju8ZdKMhgpR/AaFc3GRkQk4Evpg37jW+CZ0UhpBafmg=; 
 b=uEb/nvD5MA+pq++9lynCmhUYSnDPyeZPD0/jTVlCj6EZ+QOhQgDY3jewiULAG4yGdLUEFWeTpQWOpkH0iEVW7vkY1OrJ9kQuh5ZhnVVXrVx9xHdJ48UynjvhNp/E6ZCzfm3ERq8h3qu8JiVX3v/EFgeluQ5AOPqDg4NvrqoEAQtyBoYad32PnnYEmZsv4u2w3xXU5+g1rh9nHyqNQ68JiY5nz6OZ9RFpiI0BK8QDDmMeLCOaKkPkzq799UQyIJCThk0Q4YGP8VTDhB2HYKMTvJNSTFEjGaObIKJ9eSCJpcOWld7BtN5EvlRoZsoP4KRXTH+AST8upr9so+m0y+RKfA==;
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
Cc: David Lechner <david@lechnology.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTEuMDYuMjAxOSAxMy4yOCwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBBcHBhcmVudGx5
IGxpdHRsZSBub25lIGZhY3QgdGhhdCB0aGVyZSdzIG5vIG5lZWQgdG8gaGFuZC1yb2xsIHlvdXIg
b3duCj4gYW55bW9yZS4gQ2MnaW5nIGEgYnVuY2ggb2YgZHJpdmVyIHBlb3BsZSB3aG8gbWlnaHQg
d2FudCB0byBrbm93IHRoaXMKPiB0b28uCj4gCj4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdt
YWlsLmNvbT4KPiBDYzogU2ViYXN0aWFuIFJlaWNoZWwgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxh
Ym9yYS5jb20+Cj4gQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4g
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gQ2M6IFNl
YW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4KPiBDYzogRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+Cj4gQ2M6
IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+IENjOiBIYW5zIGRlIEdvZWRl
IDxoZGVnb2VkZUByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQoKV2l0aCBDaHJpcydzIGNvbW1lbnQgYWRyZXNz
ZWQ6CgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+CgoK
PiAgaW5jbHVkZS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmggfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9mcmFt
ZWJ1ZmZlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmgKPiBpbmRleCBjMjMwMTY3
NDhlM2YuLmMwZTAyNTZlM2U5OCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZnJhbWVi
dWZmZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9mcmFtZWJ1ZmZlci5oCj4gQEAgLTg3LDYg
Kzg3LDkgQEAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyB7Cj4gIAkgKiBmb3IgbW9yZSBp
bmZvcm1hdGlvbiBhcyBhbGwgdGhlIHNlbWFudGljcyBhbmQgYXJndW1lbnRzIGhhdmUgYSBvbmUg
dG8KPiAgCSAqIG9uZSBtYXBwaW5nIG9uIHRoaXMgZnVuY3Rpb24uCj4gIAkgKgo+ICsJICogQXRv
bWljIGRyaXZlcnMgc2hvdWxkIHVzZSBkcm1fYXRvbWljX2hlbHBlcl9kaXJ0eWZiKCkgdG8gaW1w
bGVtZW50Cj4gKwkgKiB0aGlzIGhvb2suCj4gKwkgKgo+ICAJICogUkVUVVJOUzoKPiAgCSAqCj4g
IAkgKiAwIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCj4g
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
