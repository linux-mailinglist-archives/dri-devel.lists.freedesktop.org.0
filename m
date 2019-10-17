Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40E9DB722
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 21:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8B56E487;
	Thu, 17 Oct 2019 19:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2796E487
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 19:14:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99907500;
 Thu, 17 Oct 2019 21:14:03 +0200 (CEST)
Date: Thu, 17 Oct 2019 22:14:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v6 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20191017191400.GH4901@pendragon.ideasonboard.com>
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1571339643;
 bh=T8QQ+jvwcbYP+lrdGA0O9pZdbwxhTK5RoFxJAWwUBPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TY3TajZBX4fjw741T+diLe6XUhE1h7+4ch7BZjIZ2DXjuGVRj+zMFmPY4s6E0oWOV
 P5q7A9OQolmzTi/nz9dEP5SYKlDjViHDDIY+H6+JeI/tMfV3haJ5cofbDjOFpbjC1S
 NWSjbcUdkV8F0JzwCmAX8vFEbmw/7QI4+2a5ccks=
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
Cc: horms@verge.net.au, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 uli+renesas@fpond.eu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB5b3VyIHdvcmsuCgpPbiBXZWQsIE9jdCAxNiwgMjAx
OSBhdCAxMDo1NTo0MEFNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gTWluaW1hbCBpbmNy
ZW1lbnQgdG8gdGhlIENNTSBzZXJpZXMsIHRoaXMgdGltZSBzaG91bGQgcmVhbGx5IGJlIHRoZSBs
YXN0IG9uZS4KPiAKPiBKdXN0IG1pc3NpbmcgUm9iJ3MgYWNrIG9uIFsxLzhdIGFuZCBMYXVyZW50
J3Mgb25lIG9uIFs1LzhdLgo+IAo+IENoYW5nZWxvZyBpcyBtaW5pbWFsOgo+IENNTQo+IC0gUmVt
b3ZlIHRoZSBjbW1fY29uZmlnLmVuYWJsZSBmbGFnLiBUaGUgY21tX2NvbmZpZy50YWJsZSBmaWVs
ZCB2YWxpZGl0eSBpcwo+ICAgdXNlZCB0byBlbmFibGUvZGlzYWJsZSB0aGUgTFVUIG9wZXJhdGlv
bnMKPiAtIEV4cGFuZCBjb21tZW50cyBhcyBzdWdnZXN0ZWQgYnkgTGF1cmVudAo+IAo+IENSVEMK
PiAtIHVzZSBkcm1fY29sb3JfbHV0X3NpemUoKSB0byBjaGVjayB0aGUgTFVUIHRhYmxlIHNpemUK
PiAtIElubGluZSBjYWxscyB0byByY2FyX2NtbV9lbmFibGUoKS9kaXNhYmxlKCkKPiAtIEFkZCBU
T0RPIGVudHJpZXMgYXMgc3VnZ2VzdGVkIGJ5IExhdXJlbnQKPiAKPiBGb3IgdGhlIHJlY29yZCwg
dGhlIGZ1bGwgc2VyaWVzIGNoYW5nZWxvZyBpcyBhdmFpbGFibGUgYXQ6Cj4gaHR0cHM6Ly9wYXN0
ZS5kZWJpYW4ubmV0LzExMDc0MjcvCj4gCj4gdjUgZnJvbSB5ZXN0ZXJkYXkgd2l0aCBpbmZvcm1h
dGlvbnMgb24gdGVzdGluZyBpcyBhdmFpbGFibGUgYXQ6Cj4gaHR0cHM6Ly9sa21sLm9yZy9sa21s
LzIwMTkvMTAvMTUvMzM3Cj4gCj4gR2VlcnQgd2lsbCB5b3UgY29sbGVjdCBmb3IgRFRTIHBhdGNo
ZXMgZm9yIHRoZSBuZXh0IHJlbGVhc2U/Cj4gSSBhc3N1bWUgdGhlIERVIGNoYW5nZXMgZ28gdGhy
b3VnaCBMYXVyZW50IGluc3RlYWQgPwoKSSd2ZSB0YWtlbiBwYXRjaCAxLzggdG8gNi84IGFuZCA4
LzggaW4gbXkgdHJlZS4gSSBleHBlY3RlZCBHZWVydCB0byB0YWtlCjcvOC4KCj4gSmFjb3BvIE1v
bmRpICg4KToKPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByZW5lc2FzLGNtbTogQWRkIFItQ2Fy
IENNTSBkb2N1bWVudGF0aW9uCj4gICBkdC1iaW5kaW5nczogZGlzcGxheSwgcmVuZXNhcyxkdTog
RG9jdW1lbnQgY21tcyBwcm9wZXJ0eQo+ICAgZHJtOiByY2FyLWR1OiBBZGQgc3VwcG9ydCBmb3Ig
Q01NCj4gICBkcm06IHJjYXItZHU6IGttczogSW5pdGlhbGl6ZSBDTU0gaW5zdGFuY2VzCj4gICBk
cm06IHJjYXItZHU6IGNydGM6IENvbnRyb2wgQ01NIG9wZXJhdGlvbnMKPiAgIGRybTogcmNhci1k
dTogY3J0YzogUmVnaXN0ZXIgR0FNTUFfTFVUIHByb3BlcnRpZXMKPiAgIGFybTY0OiBkdHM6IHJl
bmVzYXM6IEFkZCBDTU0gdW5pdHMgdG8gR2VuMyBTb0NzCj4gICBkcm06IHJjYXItZHU6IGttczog
RXhwYW5kIGNvbW1lbnQgaW4gdnNwcyBwYXJzaW5nIHJvdXRpbmUKPiAKPiAgLi4uL2JpbmRpbmdz
L2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbCAgICAgICAgIHwgIDY3ICsrKysrKwo+ICAuLi4vYmlu
ZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dCAgICAgICAgICAgfCAgIDUgKwo+ICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NS5kdHNpICAgICAgfCAgMzkgKysrKwo+ICBhcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5Ni5kdHNpICAgICAgfCAgMzEgKystCj4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2NS5kdHNpICAgICB8ICAzMSArKy0KPiAg
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkwLmR0c2kgICAgIHwgIDIxICsrCj4g
IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5NS5kdHNpICAgICB8ICAyMSArKwo+
ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9LY29uZmlnICAgICAgICAgICAgICAgfCAgIDcgKwo+
ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgIDEgKwo+
ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2NtbS5jICAgICAgICAgICAgfCAyMTIgKysr
KysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfY21tLmggICAg
ICAgICAgICB8ICA1OCArKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Ny
dGMuYyAgICAgICAgfCAgNjUgKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfY3J0Yy5oICAgICAgICB8ICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfZHJ2LmggICAgICAgICB8ICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfZ3JvdXAuYyAgICAgICB8ICAxMCArCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfZ3JvdXAuaCAgICAgICB8ICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfa21zLmMgICAgICAgICB8ICA4MiArKysrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfcmVncy5oICAgICAgICB8ICAgNSArCj4gIDE4IGZpbGVzIGNoYW5nZWQsIDY1OCBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbAo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9jbW0uYwo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9jbW0uaAo+IAoK
LS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
