Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F30CB4C8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8AE6EAAB;
	Fri,  4 Oct 2019 07:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA9F6EAAB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 07:03:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15D9C2E5;
 Fri,  4 Oct 2019 09:03:18 +0200 (CEST)
Date: Fri, 4 Oct 2019 10:03:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
Message-ID: <20191004070305.GC9380@pendragon.ideasonboard.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-8-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930103840.18970-8-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570172599;
 bh=ADG0Cc4JzoD/Qoc6AOK54BmBcAln0zeRvB4rfDFl8rY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yq4iXIMs1u7TrJ+Z08OXUETjocE+qV3P1VpH3nquc3Cg0egUBtejZnBM+my3Vv2Lo
 /aOAfA7XDbgKdGOmibaSv5iA5KJ6549oaOnAKcNKKo3olv7wTjnhVr7UxHzMVAtGkc
 rz4lTh6ROeNzBucTC+y+A+NsXWfiiyosg+//ecsA=
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
Cc: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gTW9uLCBTZXAgMzAsIDIwMTkg
YXQgMDE6Mzg6NDBQTSArMDMwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gSWYgdXNlX21jbGsg
aXMgZmFsc2UsIG1jbGtfbW9kZSBpcyB3cml0dGVuIHRvIGEgcmVnaXN0ZXIgd2l0aG91dAo+IGlu
aXRpYWxpemF0aW9uLiBUaGlzIGRvZXNuJ3QgY2F1c2UgYW55IGlsbCBlZmZlY3RzIGFzIHRoZSB3
cml0dGVuIHZhbHVlCj4gaXMgbm90IHVzZWQgd2hlbiB1c2VfbWNsayBpcyBmYWxzZS4KPiAKPiBU
byBmaXggdGhpcywgd3JpdGUgdXNlX21jbGsgb25seSB3aGVuIHVzZV9tY2xrIGlzIHRydWUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4K
ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRfY29y
ZS5jIHwgNSArKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRt
aTRfY29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0X2NvcmUuYwo+IGlu
ZGV4IDVkNWQ1NTg4ZWJjMS4uYzRmZmU5NmUyOGJjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL2Rzcy9oZG1pNF9jb3JlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvaGRtaTRfY29yZS5jCj4gQEAgLTU0Miw4ICs1NDIsOSBAQCBzdGF0aWMgdm9pZCBo
ZG1pX2NvcmVfYXVkaW9fY29uZmlnKHN0cnVjdCBoZG1pX2NvcmVfZGF0YSAqY29yZSwKPiAgCX0K
PiAgCj4gIAkvKiBTZXQgQUNSIGNsb2NrIGRpdmlzb3IgKi8KPiAtCVJFR19GTERfTU9EKGF2X2Jh
c2UsCj4gLQkJCUhETUlfQ09SRV9BVl9GUkVRX1NWQUwsIGNmZy0+bWNsa19tb2RlLCAyLCAwKTsK
PiArCWlmIChjZmctPnVzZV9tY2xrKQo+ICsJCVJFR19GTERfTU9EKGF2X2Jhc2UsIEhETUlfQ09S
RV9BVl9GUkVRX1NWQUwsCj4gKwkJCSAgICBjZmctPm1jbGtfbW9kZSwgMiwgMCk7Cj4gIAo+ICAJ
ciA9IGhkbWlfcmVhZF9yZWcoYXZfYmFzZSwgSERNSV9DT1JFX0FWX0FDUl9DVFJMKTsKPiAgCS8q
CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
