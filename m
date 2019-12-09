Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA81C116FAE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C826E48C;
	Mon,  9 Dec 2019 14:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9C66E48C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:53:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D07A5DAD;
 Mon,  9 Dec 2019 15:53:32 +0100 (CET)
Date: Mon, 9 Dec 2019 16:53:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH RESEND 1/4] dt-bindings: drm/bridge: analogix-anx7688:
 Add ANX7688 transmitter binding
Message-ID: <20191209145326.GC12841@pendragon.ideasonboard.com>
References: <20191209145016.227784-1-hsinyi@chromium.org>
 <20191209145016.227784-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209145016.227784-2-hsinyi@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575903213;
 bh=Q0OVJhjw7SZuhsekU9fG/W4V8dGuID7ElTtvVg2tjfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fv4lpIeREWadJYjO759G72RPdXeU5ytjXx/ob10hZoTe/IswAGeDQLCHxUI4DX4Tt
 tPlgWX51TCYGLR+dbgXIc4ZEPe+ngZdGMNcP0i/g8iawWiI0m71Fv7ci5WtugvivTl
 8Tu1OQw3xhB28KH+8FSBX9B1XQUjhWiBXUruY6rc=
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
MTkgYXQgMTA6NTA6MTNQTSArMDgwMCwgSHNpbi1ZaSBXYW5nIHdyb3RlOgo+IEZyb206IE5pY29s
YXMgQm9pY2hhdCA8ZHJpbmtjYXRAY2hyb21pdW0ub3JnPgo+IAo+IEFkZCBzdXBwb3J0IGZvciBh
bmFsb2dpeCxhbng3Njg4Cj4gCj4gU2lnbmVkLW9mZi1ieTogTmljb2xhcyBCb2ljaGF0IDxkcmlu
a2NhdEBjaHJvbWl1bS5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlA
Y2hyb21pdW0ub3JnPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzY4
OC50eHQgICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrCgpIb3cgYWJvdXQgY29udmVydGlu
ZyB0aGlzIHRvIHlhbWwgYmluZGluZ3MgYWxyZWFkeSA/IEl0J3MgZmFpcmx5IHNpbXBsZQphbmQg
Z2l2ZXMgeW91IERUIHZhbGlkYXRpb24uCgo+ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2ODgudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3Njg4LnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3Njg4LnR4
dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi43OGI1NWJkYjE4
ZjcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2ODgudHh0Cj4gQEAgLTAsMCArMSwzMiBAQAo+ICtBbmFs
b2dpeCBBTlg3Njg4IFNsaW1Qb3J0IChTaW5nbGUtQ2hpcCBUcmFuc21pdHRlciBmb3IgRFAgb3Zl
ciBVU0ItQykKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKwo+ICtUaGUgQU5YNzY4OCBpcyBhIHNpbmdsZS1j
aGlwIG1vYmlsZSB0cmFuc21pdHRlciB0byBzdXBwb3J0IDRLIDYwIGZyYW1lcyBwZXIKPiArc2Vj
b25kICg0MDk2eDIxNjBwNjApIG9yIEZIRCAxMjAgZnJhbWVzIHBlciBzZWNvbmQgKDE5MjB4MTA4
MHAxMjApIHZpZGVvCj4gK3Jlc29sdXRpb24gZnJvbSBhIHNtYXJ0cGhvbmUgb3IgdGFibGV0IHdp
dGggZnVsbCBmdW5jdGlvbiBVU0ItQy4KPiArCj4gK1RoaXMgYmluZGluZyBvbmx5IGRlc2NyaWJl
cyB0aGUgSERNSSB0byBEUCBkaXNwbGF5IGJyaWRnZS4KPiArCj4gK1JlcXVpcmVkIHByb3BlcnRp
ZXM6Cj4gKwo+ICsgLSBjb21wYXRpYmxlICAgICAgICAgIDogImFuYWxvZ2l4LGFueDc2ODgiCj4g
KyAtIHJlZyAgICAgICAgICAgICAgICAgOiBJMkMgYWRkcmVzcyBvZiB0aGUgZGV2aWNlIChmaXhl
ZCBhdCAweDJjKQo+ICsKPiArT3B0aW9uYWwgcHJvcGVydGllczoKPiArCj4gKyAtIFZpZGVvIHBv
cnQgZm9yIEhETUkgaW5wdXQsIHVzaW5nIHRoZSBEVCBiaW5kaW5ncyBkZWZpbmVkIGluIFsxXS4K
PiArCj4gK1sxXTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVv
LWludGVyZmFjZXMudHh0Cj4gKwo+ICtFeGFtcGxlOgo+ICsKPiArCWFueDc2ODg6IGFueDc2ODhA
MmMgewo+ICsJCWNvbXBhdGlibGUgPSAiYW5hbG9naXgsYW54NzY4OCI7Cj4gKwkJcmVnID0gPDB4
MmM+Owo+ICsKPiArCQlwb3J0IHsKPiArCQkJYW54NzY4OF9pbjogZW5kcG9pbnQgewo+ICsJCQkJ
cmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pMF9vdXQ+Owo+ICsJCQl9Owo+ICsJCX07Cj4gKwl9Owo+
IC0tIAo+IDIuMjQuMC4zOTMuZzM0ZGMzNDhlYWYtZ29vZwo+IAoKLS0gClJlZ2FyZHMsCgpMYXVy
ZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
