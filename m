Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F7B116FBE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD356E48E;
	Mon,  9 Dec 2019 14:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3146E48E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:56:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1DB1B2C;
 Mon,  9 Dec 2019 15:55:58 +0100 (CET)
Date: Mon, 9 Dec 2019 16:55:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH RESEND 3/4] dt-bindings: drm/bridge: analogix-anx78xx:
 support bypass GPIO
Message-ID: <20191209145552.GD12841@pendragon.ideasonboard.com>
References: <20191209145016.227784-1-hsinyi@chromium.org>
 <20191209145016.227784-4-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209145016.227784-4-hsinyi@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575903359;
 bh=vhHx1PjaeLJMGX9Xm/0FmdneX5UOPsaDKk1edME3V0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KLmhXjwxkqST47lNHsRUzGQqrDVHkl3c+KEPg1zP3Ttm5HKzRD51bsx7fPcEoof5N
 JkRhxfzbfdZyjwrPFyime4fUdMN//fdWye6bRsV+F6FR9CxaH6Yjbms1M9L5ujuLuG
 xFBjXkFEh0fGG39k1yujz9Qv7wmaOuWNTRh9wa3Q=
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
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSHNpbi1ZaSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gTW9uLCBEZWMgMDksIDIw
MTkgYXQgMTA6NTA6MTVQTSArMDgwMCwgSHNpbi1ZaSBXYW5nIHdyb3RlOgo+IFN1cHBvcnQgb3B0
aW9uYWwgZmVhdHVyZTogYnlwYXNzIEdQSU8uCj4gCj4gU29tZSBTb0MgKGVnLiBtdDgxNzMpIGhh
dmUgYSBoYXJkd2FyZSBtdXggdGhhdCBjb25uZWN0cyB0byAyIHBvcnRzOgo+IGFueDc2ODggYW5k
IGhkbWkuIFdoZW4gdGhlIEdQSU8gaXMgYWN0aXZlLCB0aGUgYnJpZGdlIGlzIGJ5cGFzc2VkLgoK
VGhpcyBkb2Vzbid0IGxvb2sgbGlrZSB0aGUgcmlnaHQgcGxhY2UgdG8gZml4IHRoaXMsIGFzIHRo
ZSBtdXggaXMKdW5yZWxhdGVkIHRvIHRoZSBicmlkZ2UuIFlvdSB3b3VsZCBoYXZlIHRvIGR1cGxp
Y2F0ZSB0aGlzIGxvZ2ljIGluIGV2ZXJ5CmJyaWRnZSBkcml2ZXIgb3RoZXJ3aXNlLgoKQ291bGQg
eW91IGRlc2NyaWJlIHRoZSBoYXJkd2FyZSB0b3BvbG9neSBpbiBhIGJpdCBtb3JlIGRldGFpbHMg
PyBJIGNhbgp0aGVuIHRyeSB0byBhZHZpc2Ugb24gaG93IHRvIGJlc3Qgc3VwcG9ydCBpdC4KCj4g
U2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgo+IC0tLQo+
ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzY4OC50eHQgICAgICAgfCA0MCArKysr
KysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3Njg4LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3Njg4LnR4dAo+IGluZGV4IDc4YjU1YmRiMThm
Ny4uNDQxODVkY2FjODM5IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3Njg4LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3Njg4LnR4dAo+IEBAIC0xNSwx
MCArMTUsMTMgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKPiAgT3B0aW9uYWwgcHJvcGVydGllczoK
PiAgCj4gICAtIFZpZGVvIHBvcnQgZm9yIEhETUkgaW5wdXQsIHVzaW5nIHRoZSBEVCBiaW5kaW5n
cyBkZWZpbmVkIGluIFsxXS4KPiArIC0gYnlwYXNzLWdwaW9zICAgICAgICA6IEV4dGVybmFsIEdQ
SU8uIElmIHRoaXMgR1BJTyBpcyBhY3RpdmUsIHdlIGFzc3VtZQo+ICsgdGhlIGJyaWRnZSBpcyBi
eXBhc3NlZCAoZS5nLiBieSBhIG11eCkuCj4gKyAtIHBpbmN0cmwtMCwgcGluY3RybC1uYW1lczog
dGhlIHBpbmNvbnRyb2wgc2V0dGluZ3MgdG8gY29uZmlndXJlIGJ5cGFzcyBHUElPLgo+ICAKPiAg
WzFdOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8taW50ZXJm
YWNlcy50eHQKPiAgCj4gLUV4YW1wbGU6Cj4gK0V4YW1wbGUgMToKPiAgCj4gIAlhbng3Njg4OiBh
bng3Njg4QDJjIHsKPiAgCQljb21wYXRpYmxlID0gImFuYWxvZ2l4LGFueDc2ODgiOwo+IEBAIC0z
MCwzICszMywzOCBAQCBFeGFtcGxlOgo+ICAJCQl9Owo+ICAJCX07Cj4gIAl9Owo+ICsKPiArRXhh
bXBsZSAyOgo+ICsKPiArICAgICAgIGFueDc2ODg6IGFueDc2ODhAMmMgewo+ICsgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImFuYWxvZ2l4LGFueDc2ODgiOwo+ICsgICAgICAgICAgICAgICBz
dGF0dXMgPSAib2theSI7Cj4gKyAgICAgICAgICAgICAgIHJlZyA9IDwweDJjPjsKPiArICAgICAg
ICAgICAgICAgZGRjLWkyYy1idXMgPSA8JmhkbWlkZGMwPjsKPiArCj4gKyAgICAgICAgICAgICAg
IGJ5cGFzcy1ncGlvcyA9IDwmcGlvIDM2IEdQSU9fQUNUSVZFX0hJR0g+Owo+ICsgICAgICAgICAg
ICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICsgICAgICAgICAgICAgICBwaW5jdHJs
LTAgPSA8JmhkbWlfbXV4X3BpbnM+Owo+ICsKPiArICAgICAgICAgICAgICAgcG9ydHMgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ICsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBwb3J0QDAgeyAvKiBpbnB1dCAqLwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVnID0gPDA+Owo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFueDc2
ODhfaW46IGVuZHBvaW50IHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pX291dF9hbng+Owo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfTsKPiArICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICsKPiArICAg
ICAgICAgICAgICAgICAgICAgICBwb3J0QDEgeyAvKiBvdXRwdXQgKi8KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBhbng3Njg4X291dDogZW5kcG9pbnQgewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWlfY29ubmVjdG9yX2lu
PjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgfTsKPiArICAgICAgICAgICAgICAgfTsKPiArICAgICAgIH07Cj4gKwoKLS0gClJl
Z2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
