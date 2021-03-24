Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8D3346F8E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 03:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4885C6E28B;
	Wed, 24 Mar 2021 02:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC57C6E28B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 02:32:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 507D8580;
 Wed, 24 Mar 2021 03:32:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616553171;
 bh=SPT6PlC2qxMevfzY2I/dHdE0/CO5UmBJp6xZzw8hxQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OYOlaFZOtr5vJuMlYTG/Ji3sqhclbrRzX8VDYSZuW4NB8bsNPWn3nq2G+Crd1aZd/
 bcznrGviJr0/F3309SLpJK9LfpqrpHo/z60Sn7RjHEyLq53XZbwQujdV9ZalUXcTgd
 VKBIXk07KAXxn2aYQ3Ka/3hEE33Uhj0aqnp44zs4=
Date: Wed, 24 Mar 2021 04:32:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 0/4] Fixes to bridge/panel and ingenic-drm
Message-ID: <YFqkqQnTNvb0/Ng3@pendragon.ideasonboard.com>
References: <20210124085552.29146-1-paul@crapouillou.net>
 <DUC1PQ.KO33KJE3BP5L@crapouillou.net>
 <09JFQQ.5A8HP2TTVT5Z1@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09JFQQ.5A8HP2TTVT5Z1@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgMjMsIDIwMjEgYXQgMDQ6MDM6MDBQTSArMDAwMCwgUGF1bCBDZXJjdWVpbCB3
cm90ZToKPiBMZSBtZXIuIDI0IGbDqXZyLiAyMDIxIMOgIDEzOjQ0LCBQYXVsIENlcmN1ZWlsIGEg
w6ljcml0IDoKPiA+IEhpLAo+ID4gCj4gPiBTb21lIGZlZWRiYWNrIGZvciBwYXRjaGVzIDEtMz8g
TGF1cmVudD8KPiAKPiAxLW1vbnRoIGFubml2ZXJzYXJ5IHBpbmcgOikKCkhhYWFwcHkgYmlydGgt
ZGF5IHRvb29vIHlvdXV1dXV1dSA6LSkKClBhdGNoZXMgcmV2aWV3ZWQuCgo+ID4gTGUgZGltLiAy
NCBqYW52LiAyMDIxIMOgIDg6NTUsIFBhdWwgQ2VyY3VlaWwgYSAgw6ljcml0IDoKPiA+PiBIaSwK
PiA+PiAKPiA+PiBIZXJlIGFyZSB0aHJlZSBpbmRlcGVuZGVudCBmaXhlcy4gVGhlIGZpcnN0IG9u
ZSBhZGRyZXNzZXMgYQo+ID4+IHVzZS1hZnRlci1mcmVlIGluIGJyaWRnZS9wYW5lbC5jOyB0aGUg
c2Vjb25kIG9uZSBhZGRyZXNzZXMgYQo+ID4+IHVzZS1hZnRlci1mcmVlIGluIHRoZSBpbmdlbmlj
LWRybSBkcml2ZXI7IGZpbmFsbHksIHRoZSB0aGlyZCBvbmUgbWFrZXMKPiA+PiB0aGUgaW5nZW5p
Yy1kcm0gZHJpdmVyIHdvcmsgYWdhaW4gb24gb2xkZXIgSW5nZW5pYyBTb0NzLgo+ID4+IAo+ID4+
IENoYW5nZXMgZnJvbSB2MjoKPiA+PiAtIHBhdGNoIFsxLzRdIGFkZGVkIGEgRklYTUUuCj4gPj4g
LSBwYXRjaCBbMi80XSBpcyBuZXcuIEl0IGludHJvZHVjZXMgYSBkcm1tX3BsYWluX3NpbXBsZV9l
bmNvZGVyX2FsbG9jKCkKPiA+PiAgIG1hY3JvIHRoYXQgd2lsbCBiZSB1c2VkIGluIHBhdGNoIFsz
LzRdLgo+ID4+IC0gcGF0Y2ggWzMvNF0gdXNlcyB0aGUgbWFjcm8gaW50cm9kdWNlZCBpbiBwYXRj
aCBbMi80XS4KPiA+PiAtIHBhdGNoIFs0LzRdIGlzIHVubW9kaWZpZWQuCj4gPj4gCj4gPj4gTm90
ZSB0byBsaW51eC1zdGFibGUgZ3V5czogcGF0Y2ggW3YyIDIvM10gd2lsbCBvbmx5IGFwcGx5IG9u
IHRoZSBjdXJyZW50Cj4gPj4gZHJtLW1pc2MtbmV4dCBicmFuY2gsIHRvIGZpeCBpdCBmb3IgdjUu
MTEgYW5kIG9sZGVyIGtlcm5lbHMsIHVzZSB0aGUgVjEKPiA+PiBvZiB0aGF0IHBhdGNoLgo+ID4+
IAo+ID4+IENoZWVycywKPiA+PiAtUGF1bAo+ID4+IAo+ID4+IFBhdWwgQ2VyY3VlaWwgKDQpOgo+
ID4+ICAgZHJtOiBicmlkZ2UvcGFuZWw6IENsZWFudXAgY29ubmVjdG9yIG9uIGJyaWRnZSBkZXRh
Y2gKPiA+PiAgIGRybS9zaW1wbGVfa21zX2hlbHBlcjogQWRkIG1hY3JvIGRybW1fcGxhaW5fc2lt
cGxlX2VuY29kZXJfYWxsb2MoKQo+ID4+ICAgZHJtL2luZ2VuaWM6IFJlZ2lzdGVyIGRldm0gYWN0
aW9uIHRvIGNsZWFudXAgZW5jb2RlcnMKPiA+PiAgIGRybS9pbmdlbmljOiBGaXggbm9uLU9TRCBt
b2RlCj4gPj4gCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyAgICAgICAgICAg
IHwgMTIgKysrKysrKysrKysKPiA+PiAgZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1k
cm0tZHJ2LmMgfCAyNiArKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ID4+ICBpbmNsdWRlL2RybS9k
cm1fc2ltcGxlX2ttc19oZWxwZXIuaCAgICAgICB8IDE3ICsrKysrKysrKysrKysrKwo+ID4+ICAz
IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+ID4+IAoK
LS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
