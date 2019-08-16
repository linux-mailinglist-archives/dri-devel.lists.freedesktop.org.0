Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B417D9014F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 14:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F596E339;
	Fri, 16 Aug 2019 12:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA696E339;
 Fri, 16 Aug 2019 12:24:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AE142AF;
 Fri, 16 Aug 2019 14:24:15 +0200 (CEST)
Date: Fri, 16 Aug 2019 15:24:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20190816122411.GE5020@pendragon.ideasonboard.com>
References: <20190816133132.6b37d7fa@canb.auug.org.au>
 <20190816044846.GA27781@ravnborg.org>
 <CAKMK7uFy2vtOpSNrJyPDp0mvPTEvTD3zw7_gTuWe6gRqj18FFg@mail.gmail.com>
 <20190816094715.GB5020@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816094715.GB5020@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565958255;
 bh=Xvsx+Qa2ZOQg4OjurY0P2Q8XnZceB+vL/gqEMZuluQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NkbxcG36hw0krUs5uFpSKH+UI86xtGWx65rlhdgnABM+nCetNG9shKvQ/aL5H1Nwd
 BNd0gNUFcLwQQpiyPh2gxFhTsgU72SsW1sXqGj2nf6OeQryHfllS2GMWrqcSZk+DeF
 R/TqDRz1zxwY0FxfVdgKS67Ogv92j+mF0Fnh+Q7A=
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

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTI6NDc6MTVQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCAwODoyMzo1NEFNICswMjAwLCBEYW5p
ZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgNjo0OCBBTSBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3RlOgo+ID4gPiA+IEhpIGFsbCwKPiA+ID4g
Pgo+ID4gPiA+IEFmdGVyIG1lcmdpbmcgdGhlIGRybS1taXNjIHRyZWUsIHRvZGF5J3MgbGludXgt
bmV4dCBidWlsZCAoeDg2XzY0Cj4gPiA+ID4gYWxsbW9kY29uZmlnKSBwcm9kdWNlZCB0aGlzIHdh
cm5pbmc6Cj4gPiA+ID4KPiA+ID4gPiB3YXJuaW5nOiBzYW1lIG1vZHVsZSBuYW1lcyBmb3VuZDoK
PiA+ID4gPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzL3BhbmVs
LW5lYy1ubDgwNDhobDExLmtvCj4gPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
bmVjLW5sODA0OGhsMTEua28KPiA+ID4gPiB3YXJuaW5nOiBzYW1lIG1vZHVsZSBuYW1lcyBmb3Vu
ZDoKPiA+ID4gPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzL3Bh
bmVsLXNoYXJwLWxzMDM3djdkdzAxLmtvCj4gPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2hhcnAtbHMwMzd2N2R3MDEua28KPiA+ID4gPiB3YXJuaW5nOiBzYW1lIG1vZHVsZSBu
YW1lcyBmb3VuZDoKPiA+ID4gPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rp
c3BsYXlzL3BhbmVsLXNvbnktYWN4NTY1YWttLmtvCj4gPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtc29ueS1hY3g1NjVha20ua28KPiA+ID4gPiB3YXJuaW5nOiBzYW1lIG1vZHVs
ZSBuYW1lcyBmb3VuZDoKPiA+ID4gPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZi
L2Rpc3BsYXlzL3BhbmVsLXRwby10ZDAyOHR0ZWMxLmtvCj4gPiA+ID4gICBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtdHBvLXRkMDI4dHRlYzEua28KPiA+ID4gPiB3YXJuaW5nOiBzYW1lIG1v
ZHVsZSBuYW1lcyBmb3VuZDoKPiA+ID4gPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21h
cGZiL2Rpc3BsYXlzL3BhbmVsLXRwby10ZDA0M210ZWExLmtvCj4gPiA+ID4gICBkcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDQzbXRlYTEua28KPiA+ID4gPgo+ID4gPiA+IEludHJv
ZHVjZWQgYnkgY29tbWl0cwo+ID4gPiA+Cj4gPiA+ID4gICBkZjQzOWFiZTY1MDEgKCJkcm0vcGFu
ZWw6IEFkZCBkcml2ZXIgZm9yIHRoZSBORUMgTkw4MDQ4SEwxMSBwYW5lbCIpCj4gPiA+ID4gICBj
OWNmNGMyYTNiZDMgKCJkcm0vcGFuZWw6IEFkZCBkcml2ZXIgZm9yIHRoZSBTaGFycCBMUzAzN1Y3
RFcwMSBwYW5lbCIpCj4gPiA+ID4gICAxYzhmYzNmMGM1ZDIgKCJkcm0vcGFuZWw6IEFkZCBkcml2
ZXIgZm9yIHRoZSBTb255IEFDWDU2NUFLTSBwYW5lbCIpCj4gPiA+ID4gICA0MTViOGRkMDg3MTEg
KCJkcm0vcGFuZWw6IEFkZCBkcml2ZXIgZm9yIHRoZSBUb3Bwb2x5IFREMDI4VFRFQzEgcGFuZWwi
KQo+ID4gPiA+ICAgZGMyZTFlNWIyNzk5ICgiZHJtL3BhbmVsOiBBZGQgZHJpdmVyIGZvciB0aGUg
VG9wcG9seSBURDA0M01URUExIHBhbmVsIikKPiA+ID4KPiA+ID4gVXBzLCBoYWQgbm90IHNlZW4g
dGhpcyBvbmUgY29taW5nLgo+ID4gPiBXZSBhcmUgaW4gdGhlIHByb2Nlc3Mgb2YgcmVtb3Zpbmcg
dGhlIGRyaXZlcnMgaW4gZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvCj4gPiA+IGFu
ZCBkZWNpZGVkIHRvIGludHJvZHVjZSB0aGUgbmV3IGRyaXZlcnMgZWFybHkgdG8gZ2V0IHRoZW0g
b3V0IG9mIGEKPiA+ID4gbG9uZ2VyIHBhdGNoIHNlcmllcy4KPiAKPiBPb3BzIDotKAo+IAo+IFRo
ZSBuZXcgZHJpdmVycyB3ZXJlIGluaXRpYWxseSBwYXJ0IG9mIGEgcGF0Y2ggc2VyaWVzIHRoYXQg
cmVtb3ZlZCB0aGUKPiBkdXBsaWNhdGVkIGRyaXZlcnMuIFRoZSBuZXcgZHJpdmVycyB0aGVuIGdv
dCBmYXN0LXRyYWNrZWQsIGFuZCBJIGRpZG4ndAo+IG5vdGljZSB0aGlzIGlzc3VlLgo+IAo+ID4g
U2hvdWxkIHdlIGhhdmUgYSBjb25maWcgZGVwZW5kZW5jeSB0byBub3QgYWxsb3cgdGhlIG9sZCBm
YmRldiBvbWFwCj4gPiB3aGVuIHRoZSBkcm0gb21hcCBkcml2ZXIgaXMgZW5hYmxlZD8gSSB0aGlu
ayB0aGF0IHdvdWxkIHRha2UgY2FyZSBvZgo+ID4gYWxsIHRoaXMuCj4gPiAKPiA+IE9yIHRvbyBh
bm5veWluZyBmb3IgZGV2ZWxvcG1lbnQ/Cj4gPiAKPiA+IEFsc28gbm90ZSB0aGF0IGZiZGV2IGlz
IGluIGRybS1taXNjIG5vdywgc28gd2Ugc2hvdWxkIGJlIGFibGUgdG8gZml4Cj4gPiB0aGlzIGFs
bCB3aXRob3V0IGNyb3NzLXRyZWUgY29uZmxpY3RzLgo+IAo+IE5vdGUgdGhhdCBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L29tYXAyL29tYXBmYi8gd2lsbCBzdGF5LCBpdCdzCj4gZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vZGlzcGxheXMvIHRoYXQgaXMgYmVpbmcgcmVtb3ZlZC4gRkJfT01BUDIKPiBhbHJl
YWR5IGRlcGVuZHMgb24gRFJNX09NQVAgPSBuLCBJIHByb3Bvc2UgZG9pbmcgc29tZXRoaW5nIHNp
bWlsYXIgYXQKPiB0aGUgbGV2ZWwgb2YgdGhlIGluZGl2aWR1YWwgZGlzcGxheSBkcml2ZXJzLgoK
SSd2ZSBqdXN0IHBvc3RlZCAiW1BBVENIIDAvMl0gRml4IG1vZHVsZSBuYW1lIGNsYXNoIHdpdGgg
b21hcGRybSBhbmQgRFJNCnBhbmVsIG1vZHVsZXMiIHRoYXQgc2hvdWxkIHNvbHZlIHRoaXMgaXNz
dWUuCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
