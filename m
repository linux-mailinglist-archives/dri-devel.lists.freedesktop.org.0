Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 159808FF5D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 11:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A8F6E2AC;
	Fri, 16 Aug 2019 09:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCD46E2A0;
 Fri, 16 Aug 2019 09:47:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B87612AF;
 Fri, 16 Aug 2019 11:47:19 +0200 (CEST)
Date: Fri, 16 Aug 2019 12:47:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20190816094715.GB5020@pendragon.ideasonboard.com>
References: <20190816133132.6b37d7fa@canb.auug.org.au>
 <20190816044846.GA27781@ravnborg.org>
 <CAKMK7uFy2vtOpSNrJyPDp0mvPTEvTD3zw7_gTuWe6gRqj18FFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFy2vtOpSNrJyPDp0mvPTEvTD3zw7_gTuWe6gRqj18FFg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565948839;
 bh=bUdICGGdTZmBFibu3xdD2aPAGHUfElKiRrQso0XsRTc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mlqItdkhQU8LiVblfmgAjFuo001m9rrZNL9N/mwDi6KnDfDs5J+AFvViaMnQOEgu6
 fIWoCwBnwpjT/0ZTGKwhpIpR7XgDtC4ImWtCEg+pqjg2EhqXnNi8GkKPEJe5/m7WT0
 AIaGeexf6EL/gMzYLJjCil7Ke3mu4B87oJCuhImw=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCAwODoyMzo1NEFNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+IE9uIEZyaSwgQXVnIDE2LCAyMDE5IGF0IDY6NDggQU0gU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90ZToKPiA+ID4gSGkgYWxsLAo+ID4gPgo+ID4gPiBB
ZnRlciBtZXJnaW5nIHRoZSBkcm0tbWlzYyB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVpbGQg
KHg4Nl82NAo+ID4gPiBhbGxtb2Rjb25maWcpIHByb2R1Y2VkIHRoaXMgd2FybmluZzoKPiA+ID4K
PiA+ID4gd2FybmluZzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4gPiA+ICAgZHJpdmVycy92
aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvcGFuZWwtbmVjLW5sODA0OGhsMTEua28K
PiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbmVjLW5sODA0OGhsMTEua28KPiA+
ID4gd2FybmluZzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4gPiA+ICAgZHJpdmVycy92aWRl
by9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvcGFuZWwtc2hhcnAtbHMwMzd2N2R3MDEua28K
PiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHMwMzd2N2R3MDEua28K
PiA+ID4gd2FybmluZzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4gPiA+ICAgZHJpdmVycy92
aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvcGFuZWwtc29ueS1hY3g1NjVha20ua28K
PiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc29ueS1hY3g1NjVha20ua28KPiA+
ID4gd2FybmluZzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4gPiA+ICAgZHJpdmVycy92aWRl
by9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvcGFuZWwtdHBvLXRkMDI4dHRlYzEua28KPiA+
ID4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDI4dHRlYzEua28KPiA+ID4g
d2FybmluZzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4gPiA+ICAgZHJpdmVycy92aWRlby9m
YmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvcGFuZWwtdHBvLXRkMDQzbXRlYTEua28KPiA+ID4g
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDQzbXRlYTEua28KPiA+ID4KPiA+
ID4gSW50cm9kdWNlZCBieSBjb21taXRzCj4gPiA+Cj4gPiA+ICAgZGY0MzlhYmU2NTAxICgiZHJt
L3BhbmVsOiBBZGQgZHJpdmVyIGZvciB0aGUgTkVDIE5MODA0OEhMMTEgcGFuZWwiKQo+ID4gPiAg
IGM5Y2Y0YzJhM2JkMyAoImRybS9wYW5lbDogQWRkIGRyaXZlciBmb3IgdGhlIFNoYXJwIExTMDM3
VjdEVzAxIHBhbmVsIikKPiA+ID4gICAxYzhmYzNmMGM1ZDIgKCJkcm0vcGFuZWw6IEFkZCBkcml2
ZXIgZm9yIHRoZSBTb255IEFDWDU2NUFLTSBwYW5lbCIpCj4gPiA+ICAgNDE1YjhkZDA4NzExICgi
ZHJtL3BhbmVsOiBBZGQgZHJpdmVyIGZvciB0aGUgVG9wcG9seSBURDAyOFRURUMxIHBhbmVsIikK
PiA+ID4gICBkYzJlMWU1YjI3OTkgKCJkcm0vcGFuZWw6IEFkZCBkcml2ZXIgZm9yIHRoZSBUb3Bw
b2x5IFREMDQzTVRFQTEgcGFuZWwiKQo+ID4KPiA+IFVwcywgaGFkIG5vdCBzZWVuIHRoaXMgb25l
IGNvbWluZy4KPiA+IFdlIGFyZSBpbiB0aGUgcHJvY2VzcyBvZiByZW1vdmluZyB0aGUgZHJpdmVy
cyBpbiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi8KPiA+IGFuZCBkZWNpZGVkIHRv
IGludHJvZHVjZSB0aGUgbmV3IGRyaXZlcnMgZWFybHkgdG8gZ2V0IHRoZW0gb3V0IG9mIGEKPiA+
IGxvbmdlciBwYXRjaCBzZXJpZXMuCgpPb3BzIDotKAoKVGhlIG5ldyBkcml2ZXJzIHdlcmUgaW5p
dGlhbGx5IHBhcnQgb2YgYSBwYXRjaCBzZXJpZXMgdGhhdCByZW1vdmVkIHRoZQpkdXBsaWNhdGVk
IGRyaXZlcnMuIFRoZSBuZXcgZHJpdmVycyB0aGVuIGdvdCBmYXN0LXRyYWNrZWQsIGFuZCBJIGRp
ZG4ndApub3RpY2UgdGhpcyBpc3N1ZS4KCj4gU2hvdWxkIHdlIGhhdmUgYSBjb25maWcgZGVwZW5k
ZW5jeSB0byBub3QgYWxsb3cgdGhlIG9sZCBmYmRldiBvbWFwCj4gd2hlbiB0aGUgZHJtIG9tYXAg
ZHJpdmVyIGlzIGVuYWJsZWQ/IEkgdGhpbmsgdGhhdCB3b3VsZCB0YWtlIGNhcmUgb2YKPiBhbGwg
dGhpcy4KPiAKPiBPciB0b28gYW5ub3lpbmcgZm9yIGRldmVsb3BtZW50Pwo+IAo+IEFsc28gbm90
ZSB0aGF0IGZiZGV2IGlzIGluIGRybS1taXNjIG5vdywgc28gd2Ugc2hvdWxkIGJlIGFibGUgdG8g
Zml4Cj4gdGhpcyBhbGwgd2l0aG91dCBjcm9zcy10cmVlIGNvbmZsaWN0cy4KCk5vdGUgdGhhdCBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi8gd2lsbCBzdGF5LCBpdCdzCmRyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzLyB0aGF0IGlzIGJlaW5nIHJlbW92ZWQuIEZCX09NQVAy
CmFscmVhZHkgZGVwZW5kcyBvbiBEUk1fT01BUCA9IG4sIEkgcHJvcG9zZSBkb2luZyBzb21ldGhp
bmcgc2ltaWxhciBhdAp0aGUgbGV2ZWwgb2YgdGhlIGluZGl2aWR1YWwgZGlzcGxheSBkcml2ZXJz
LgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
