Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92D4A211
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26DC6E167;
	Tue, 18 Jun 2019 13:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B366E167
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:27:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02AE4D5;
 Tue, 18 Jun 2019 15:27:07 +0200 (CEST)
Date: Tue, 18 Jun 2019 16:26:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object
 functions
Message-ID: <20190618132651.GC21105@pendragon.ideasonboard.com>
References: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAKMK7uEDmTfyEft4v0vpZsmYTC-jA2pCMMTt=T9r5Dis7gKEmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEDmTfyEft4v0vpZsmYTC-jA2pCMMTt=T9r5Dis7gKEmQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560864428;
 bh=g1gc1LLd8Mp15d1D66G8ERdo0dSJYekaFm/CxW4JmzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AWEBtcWA0uOyfZ0eCXvRMDEX3LtbCxmwVwwSmrvXHjfs5H8poiEI6g2f1hI75mRbk
 6VI1s4cMl+jBdYaExjzsOCVqfEA5pB3QUHpLpy94h1t+Kv54lemgxE9Af7o/NxQCli
 n1K0YZCEQxgmpPJL6DU/wu6fwr75WOsR7VruSNok=
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
Cc: "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDM6MjE6NTVQTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBUdWUsIEp1biAxOCwgMjAxOSBhdCAzOjEzIFBNIExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPiB3
cm90ZToKPiA+Cj4gPiBUaGUgcmVjb21tZW5kZWQgd2F5IHRvIHNwZWNpZnkgR0VNIG9iamVjdCBm
dW5jdGlvbnMgaXMgdG8gcHJvdmlkZSBhCj4gPiBkcm1fZ2VtX29iamVjdF9mdW5jcyBzdHJ1Y3R1
cmUgaW5zdGFuY2UgYW5kIHNldCB0aGUgR0VNIG9iamVjdCB0byBwb2ludAo+ID4gdG8gaXQuIFRo
ZSBkcm1fY21hX2dlbV9jcmVhdGVfb2JqZWN0X2RlZmF1bHRfZnVuY3MoKSBmdW5jdGlvbiBwcm92
aWRlZAo+ID4gYnkgdGhlIEdFTSBDTUEgaGVscGVyIGRvZXMgc28gd2hlbiBjcmVhdGluZyB0aGUg
R0VNIG9iamVjdCwgc2ltcGxpZnlpbmcKPiA+IHRoZSBkcml2ZXIgaW1wbGVtZW50YXRpb24uIFN3
aXRjaCB0byBpdCwgYW5kIHJlbW92ZSB0aGUgdGhlbiB1bm5lZWRlZAo+ID4gR0VNLXJlbGF0ZWQg
b3BlcnRpb25zIGZyb20gcmNhcl9kdV9kcml2ZXIuCj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gU2lnbmVkLW9mZi1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+
Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jIHwgOCAr
LS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMo
LSkKPiA+Cj4gPiBEYW5pZWwsIGlzIHRoaXMgd2hhdCB5b3UgaGFkIGluIG1pbmQgPwo+IAo+IFl1
cCwgSSB0aGluayB0aGF0J3MgaXQuIE5vcmFsZiBjb21tZW50ZWQgdGhhdCB3ZSBtaWdodCB3YW50
IHRvIGhhdmUKPiBEUk1fR0VNX0NNQV9EUklWRVJfT1BTIG1hY3JvIGZvciB0aGUgcmVtYWluaW5n
IGZldyBkcm1fZHJpdmVyIGhvb2tzLCBsaWtlCj4gRFJNX0dFTV9DTUFfVk1BUF9EUklWRVJfT1BT
IGJ1dCB3aXRob3V0IHRoZSBmb3JjZWQgdm1hcCBvbiBpbXBvcnQuIEJ1dAo+IHRoYXQncyBvayB0
byBkbyBpbiBzb21lIGZvbGxvdy11cCBjbGVhbnVwIHRvby4gT24gdGhpczoKCk5vdGUgdGhhdCB0
aGUgcmNhci1kdSBkcml2ZXIgcmVxdWlyZXMgYSBjdXN0b20gLmR1bWJfY3JlYXRlKCkgb3BlcmF0
aW9uLAp3aGljaCBpcyBhbm90aGVyIHJlYXNvbiB3aHkgSSBjYW4ndCB1c2UgRFJNX0dFTV9DTUFf
Vk1BUF9EUklWRVJfT1BTLgoKPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2R1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYwo+
ID4gaW5kZXggM2U1ZTgzNWVhMmI2Li40Y2JiODIwMDk5MzEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jCj4gPiBAQCAtNDQ1LDE2ICs0NDUsMTAgQEAgREVGSU5F
X0RSTV9HRU1fQ01BX0ZPUFMocmNhcl9kdV9mb3BzKTsKPiA+ICBzdGF0aWMgc3RydWN0IGRybV9k
cml2ZXIgcmNhcl9kdV9kcml2ZXIgPSB7Cj4gPiAgICAgICAgIC5kcml2ZXJfZmVhdHVyZXMgICAg
ICAgID0gRFJJVkVSX0dFTSB8IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX1BSSU1FCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgRFJJVkVSX0FUT01JQywKPiA+IC0gICAgICAg
LmdlbV9mcmVlX29iamVjdF91bmxvY2tlZCA9IGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0LAo+ID4g
LSAgICAgICAuZ2VtX3ZtX29wcyAgICAgICAgICAgICA9ICZkcm1fZ2VtX2NtYV92bV9vcHMsCj4g
PiArICAgICAgIC5nZW1fY3JlYXRlX29iamVjdCAgICAgID0gZHJtX2NtYV9nZW1fY3JlYXRlX29i
amVjdF9kZWZhdWx0X2Z1bmNzLAo+ID4gICAgICAgICAucHJpbWVfaGFuZGxlX3RvX2ZkICAgICA9
IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAo+ID4gICAgICAgICAucHJpbWVfZmRfdG9faGFu
ZGxlICAgICA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAo+ID4gLSAgICAgICAuZ2VtX3By
aW1lX2ltcG9ydCAgICAgICA9IGRybV9nZW1fcHJpbWVfaW1wb3J0LAo+ID4gLSAgICAgICAuZ2Vt
X3ByaW1lX2V4cG9ydCAgICAgICA9IGRybV9nZW1fcHJpbWVfZXhwb3J0LAo+ID4gLSAgICAgICAu
Z2VtX3ByaW1lX2dldF9zZ190YWJsZSA9IGRybV9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZSwK
PiA+ICAgICAgICAgLmdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgPSBkcm1fZ2VtX2NtYV9wcmlt
ZV9pbXBvcnRfc2dfdGFibGUsCj4gPiAtICAgICAgIC5nZW1fcHJpbWVfdm1hcCAgICAgICAgID0g
ZHJtX2dlbV9jbWFfcHJpbWVfdm1hcCwKPiA+IC0gICAgICAgLmdlbV9wcmltZV92dW5tYXAgICAg
ICAgPSBkcm1fZ2VtX2NtYV9wcmltZV92dW5tYXAsCj4gPiAgICAgICAgIC5nZW1fcHJpbWVfbW1h
cCAgICAgICAgID0gZHJtX2dlbV9jbWFfcHJpbWVfbW1hcCwKPiA+ICAgICAgICAgLmR1bWJfY3Jl
YXRlICAgICAgICAgICAgPSByY2FyX2R1X2R1bWJfY3JlYXRlLAo+ID4gICAgICAgICAuZm9wcyAg
ICAgICAgICAgICAgICAgICA9ICZyY2FyX2R1X2ZvcHMsCgotLSAKUmVnYXJkcywKCkxhdXJlbnQg
UGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
