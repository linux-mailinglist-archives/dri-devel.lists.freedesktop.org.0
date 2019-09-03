Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCA9A6122
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 08:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B4889711;
	Tue,  3 Sep 2019 06:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4663789711
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 06:15:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AD2173082E4E;
 Tue,  3 Sep 2019 06:15:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-67.ams2.redhat.com
 [10.36.117.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03A7E19D70;
 Tue,  3 Sep 2019 06:15:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A2AD346D3; Tue,  3 Sep 2019 08:15:24 +0200 (CEST)
Date: Tue, 3 Sep 2019 08:15:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/5] drm/ttm: add drm_gem_ttm_print_info()
Message-ID: <20190903061524.v75akt6rmx5vow2n@sirius.home.kraxel.org>
References: <20190902124126.7700-1-kraxel@redhat.com>
 <20190902124126.7700-2-kraxel@redhat.com>
 <199bbf8d-68bc-ea99-723e-3b88045970c4@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <199bbf8d-68bc-ea99-723e-3b88045970c4@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 03 Sep 2019 06:15:27 +0000 (UTC)
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiArCQlbIFRUTV9QTF9TWVNURU0gXSA9ICJzeXN0ZW0iLAo+ID4gKwkJWyBUVE1f
UExfVFQgICAgIF0gPSAidHQiLAo+ID4gKwkJWyBUVE1fUExfVlJBTSAgIF0gPSAidnJhbSIsCj4g
PiArCQlbIFRUTV9QTF9QUklWICAgXSA9ICJwcml2IiwKPiA+ICsKPiAKPiBUaGlzICdnYXAnIGlu
IHRoZSBhcnJheSBzZWVtcyB0byBiZSBhIHByb2JsZW0gZm9yIGRyaXZlcnMgdGhhdCB1c2UgdGhl
c2UKPiBiaXRzLiBDb3VsZCB0aGUgcHJpbnQgbG9naWMgYmUgbW92ZWQgaW50byBzIHNlcGFyYXRl
IGZ1bmN0aW9uIHRoYXQgYWxzbwo+IHRha2VzIHRoZSBhcnJheSBhcyBhbiBhcmd1bWVudD8KCkFy
ZSB0aGVyZSBhbnkgZHJpdmVycyB3aGljaCBhY3R1YWxseSB1c2UgdGhlc2UgYml0cyBhbmQgd2hp
Y2ggdGhlcmVmb3JlCm1pZ2h0IHdhbnQgdG8gdXNlIGEgZGlmZmVyZW50IGFycmF5PwoKQWxzbyBu
b3RlIHRoZXkgc2hvdWxkIG5vdCBjYXVzZSBhbnkgcHJvYmxlbXMgKG90aGVyIHRoYW4gbm90IGJl
aW5nCnByaW50ZWQpLiAgVGhlcmUgaXMgYW4gZXhwbGljaXQgY2hlY2sgaGVyZSAuLi4KCj4gPiAr
CQlpZiAoIXBsbmFtZVtpXSkKPiA+ICsJCQljb250aW51ZTsKCi4uIHRvIHNraXAgdW5rbm93biBi
aXRzLgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
