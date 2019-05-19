Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 718622290D
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 23:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09AD890EE;
	Sun, 19 May 2019 21:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B16890EE
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 21:15:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAFDC443;
 Sun, 19 May 2019 23:15:54 +0200 (CEST)
Date: Mon, 20 May 2019 00:15:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 1/2] drm/bridge: make dw_mipi_dsi.h self-contained
Message-ID: <20190519211538.GE5213@pendragon.ideasonboard.com>
References: <20190519183636.19588-1-sam@ravnborg.org>
 <20190519183636.19588-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190519183636.19588-2-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1558300555;
 bh=le1e79RwTvcNi/t1QXTd31mLTy8npxlc9y+7vrxjP38=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DEJQ8xrhSgd5l4x6vFEB3jkk/vFb758MIQ1GDtdN3GtlleOzD8bpokUu49TCUNXxe
 enPM+xdkWtG3HPimjBF3lpPPJDpRhqGmIaljoBOwgBoEhilnj4ePlNgGFUVsJQZYET
 DBUp8Tj/OIeu9XbCQcpn4rse5RmCZTW2emDppt28=
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
Cc: Martyn Welch <martyn.welch@collabora.co.uk>,
 David Airlie <airlied@linux.ie>, Peter Senna Tschudin <peter.senna@gmail.com>,
 dri-devel@lists.freedesktop.org, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTdW4sIE1heSAxOSwgMjAxOSBh
dCAwODozNjozNVBNICswMjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gVG8gYWxsb3cgdXNlcnMg
dG8gaW5jbHVkZSBkd19taXBpX2RzaS5oIHdpdGhvdXQgcHVsbGluZyBpbiBkZXBlbmRlbmNpZXMK
PiBtYWtlIGR3X21pcGlfZHNpLmggc2VsZi1jb250YWluZWQuCj4gVXNlIGZvcndhcmQgZGVjbGFy
YXRpb25zIHdoZW4gcG9zc2libGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgo+IENjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29t
Pgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5j
b20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBQZXRlciBTZW5uYSBUc2NodWRpbiA8cGV0ZXIu
c2VubmFAZ21haWwuY29tPgo+IENjOiBNYXJ0aW4gRG9ubmVsbHkgPG1hcnRpbi5kb25uZWxseUBn
ZS5jb20+Cj4gQ2M6IE1hcnR5biBXZWxjaCA8bWFydHluLndlbGNoQGNvbGxhYm9yYS5jby51az4K
PiAtLS0KPiAgaW5jbHVkZS9kcm0vYnJpZGdlL2R3X21pcGlfZHNpLmggfCA4ICsrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vYnJpZGdlL2R3X21pcGlfZHNpLmggYi9pbmNsdWRlL2RybS9icmlkZ2UvZHdfbWlwaV9k
c2kuaAo+IGluZGV4IDdkM2RkNjlhNWNhYS4uODI1YzIyMmFmYmZjIDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvZHJtL2JyaWRnZS9kd19taXBpX2RzaS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vYnJpZGdl
L2R3X21pcGlfZHNpLmgKPiBAQCAtOSw4ICs5LDE2IEBACj4gIAo+ICAjaWZuZGVmIF9fRFdfTUlQ
SV9EU0lfXwo+ICAjZGVmaW5lIF9fRFdfTUlQSV9EU0lfXwo+ICsjaW5jbHVkZSA8bGludXgvdHlw
ZXMuaD4KPiAgCj4gK3N0cnVjdCBkcm1fZGlzcGxheV9tb2RlOwo+ICtzdHJ1Y3QgZHJtX2VuY29k
ZXI7Cj4gIHN0cnVjdCBkd19taXBpX2RzaTsKPiArc3RydWN0IGR3X21pcGlfZHNpX2hvc3Rfb3Bz
Owo+ICtzdHJ1Y3QgZHdfbWlwaV9kc2lfcGh5X29wczsKPiArc3RydWN0IGR3X21pcGlfZHNpX3Bs
YXRfZGF0YTsKCk5vIG5lZWQgdG8gZm9yd2FyZC1kZWNsYXJlIHRoZXNlIHRocmVlIHN0cnVjdHVy
ZXMsIHRoZXkncmUgZGVmaW5lZCBpbgp0aGlzIHZlcnkgLmggZmlsZS4KCj4gK3N0cnVjdCBtaXBp
X2RzaV9kZXZpY2U7Cj4gK3N0cnVjdCBwbGF0Zm9ybV9kZXZpY2U7CgpZb3UgbmVlZCB0byBwdWxs
IGluIGRybS9tb2Rlcy5oIGZvciBkcm1fbW9kZV9zdGF0dXMuCgpBcGFydCBmcm9tIHRoYXQsCgpS
ZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgoKPiAgCj4gIHN0cnVjdCBkd19taXBpX2RzaV9waHlfb3BzIHsKPiAgCWludCAoKmlu
aXQpKHZvaWQgKnByaXZfZGF0YSk7CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
