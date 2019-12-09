Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8510C116F79
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B18989E65;
	Mon,  9 Dec 2019 14:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D14789E65
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:49:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FE3AB2C;
 Mon,  9 Dec 2019 15:49:04 +0100 (CET)
Date: Mon, 9 Dec 2019 16:48:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v2 3/3] drm/tilcdc: panel: Add WARN() with a comment to
 tilcdc-panel probe
Message-ID: <20191209144857.GA12841@pendragon.ideasonboard.com>
References: <cover.1575901747.git.jsarha@ti.com>
 <54966ffd61ca46528bc55961c532001aa7463c30.1575901747.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54966ffd61ca46528bc55961c532001aa7463c30.1575901747.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575902944;
 bh=moup88+1AXSzEBbkY0ogHDXr3kUQoRsbnyHWmDnec8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MwGX9WKtAX0NlVKPSv8B6uqYCPjfM4orkrQE9h1nZ+HmGVnku0I1OHEgtpnAqnHCA
 15aXPVvHmcZmo+/hxpMpaplTXiqilc0wAcOOG/jSJ1+cSiGK23lle39cEZ2rsn8B2J
 5Zxa43KbOSTCzccEk9I8R7kKo1hq/qRAZaGE6n1A=
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
Cc: devicetree@vger.kernel.org, tony@atomide.com, tomi.valkeinen@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, robh+dt@kernel.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSnlyaSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gTW9uLCBEZWMgMDksIDIwMTkg
YXQgMDQ6NDI6MTZQTSArMDIwMCwgSnlyaSBTYXJoYSB3cm90ZToKPiBBZGQgV0FSTigpIHRvIHRo
ZSBiZWdpbm5pZyBvZiB0aWxjZGMtcGFuZWwgcHJvYmUuIFRoZSBvYnNvbGV0ZQoKcy9iZWdpbm5p
Zy9iZWdpbm5pbmcvCgo+IHRpbGNkYy1wYW5lbCBkcml2ZXIgc2hvdWxkIG5vdCBiZSB1c2VkIGFu
eW1vcmUsIHNpbmNlIHRpbGNkYyBpcyBmdWxseQo+IGNhcGFibGUgb2YgdXNpbmcgZ2VuZXJpYyBk
cm0gcGFuZWxzIGxpa2UgcGFuZWwtc2ltcGxlIGFuZCBwYW5lbC1jb21tb24KPiBiaW5kaW5nLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3BhbmVsLmMgfCAxMCArKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90aWxjZGMvdGlsY2RjX3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3Rp
bGNkY19wYW5lbC5jCj4gaW5kZXggNTU4NGU2NTZiODU3Li5jZjhlMjQ2MmE1MjQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfcGFuZWwuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3BhbmVsLmMKPiBAQCAtMzA5LDYgKzMwOSwxNiBAQCBz
dGF0aWMgaW50IHBhbmVsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlz
dHJ1Y3QgcGluY3RybCAqcGluY3RybDsKPiAgCWludCByZXQ7Cj4gIAo+ICsJLyoKPiArCSAqIFRo
ZSBvYnNvbGV0ZSB0aWxjZGMtcGFuZWwgZHJpdmVyIHNob3VsZCBub3QgYmUgdXNlZAo+ICsgICAg
ICAgICAqIGFueW1vcmUsIHNpbmNlIHRpbGNkYyBpcyBmdWxseSBjYXBhYmxlIG9mIHVzaW5nIGdl
bmVyaWMgZHJtCj4gKyAgICAgICAgICogcGFuZWxzIGxpa2UgcGFuZWwtc2ltcGxlIGFuZCBwYW5l
bC1jb21tb24gYmluZGluZy4KCkluZGVudGF0aW9uIHNob3VsZCB1c2UgdGFicy4KCj4gKwkgKi8K
PiArCj4gKwlXQVJOKHRydWUsCj4gKwkgICAgICJ0aWxjZGMtcGFuZWwgaXMgb2Jzb2x0ZSBhbmQg
c2hvdWxkIG5vdCBiZSB1c2VkLiBQbGVhc2UgdXBkYXRlIHlvdXIgY29uZmlndXJhdGlvbiFcbiIs
CgpzL29ic29sdGUvb2Jzb2xldGUvIG9yIGRlcHJlY2F0ZWQgPwoKWW91IG1heSB3YW50IHRvIGV4
cGxpY2l0bHkgc3RhdGUgd2hhdCBpdCBzaG91bGQgYmUgdXBkYXRlZCB0byA6LSkKClJldmlld2Vk
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
Cgo+ICsJICAgICBkZXZfbmFtZSgmcGRldi0+ZGV2KSk7Cj4gKwo+ICAJLyogYmFpbCBvdXQgZWFy
bHkgaWYgbm8gRFQgZGF0YTogKi8KPiAgCWlmICghbm9kZSkgewo+ICAJCWRldl9lcnIoJnBkZXYt
PmRldiwgImRldmljZS10cmVlIGRhdGEgaXMgbWlzc2luZ1xuIik7CgotLSAKUmVnYXJkcywKCkxh
dXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
