Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ACD14E0B
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 16:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187A68991C;
	Mon,  6 May 2019 14:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F6E8991C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 14:58:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46DF62E7;
 Mon,  6 May 2019 16:58:08 +0200 (CEST)
Date: Mon, 6 May 2019 17:57:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/doc: Improve docs for conn_state->best_encoder
Message-ID: <20190506145753.GA5021@pendragon.ideasonboard.com>
References: <20190506144629.5976-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506144629.5976-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1557154688;
 bh=a97vkb65LBhVG3OFZ2BIkVOopEF/NCO94lYYrlBblQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=chT1LYLs5rEGQHypsyp+dX4BRGIJm4OOmqRSDiKnth2/be0Sne6R6EYLUXKC6Hrrp
 Ni9xYSVnENleDJA+l81Ig9X48Xt6JmIXOZ35n0Q8RLB8L3OLo+SMF3uF2mrwn4oop7
 7Rrj/7zeqFtvzkW+UiTI+oA9VlALi1EC4oUNNNxw=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBNb24sIE1heSAwNiwgMjAx
OSBhdCAwNDo0NjoyOVBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IEl0J3MgbWFuZGF0
b3J5IGFuZCBjb25zaWRlcmVkIGNvcmUgc3RhdGUgc2luY2UgaW9jdGxzIHJlbHkgb24gdGhpcwo+
IHdvcmtpbmcuCj4gCj4gVGhhbmtzIHRvIExhdXJlbnQgZm9yIHBvaW50aW5nIG91dCB0aGlzIGdh
cC4KPiAKPiB2MjogQ2xhcmlmeSB0byAiYXRvbWljIGRyaXZlcnMiIG9ubHkuCj4gCj4gQ2M6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzog
U2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9jb25u
ZWN0b3IuaCB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2Ry
bV9jb25uZWN0b3IuaAo+IGluZGV4IDAyYTEzMTIwMmFkZC4uZjQzZjQwZDU4ODhhIDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2Ry
bV9jb25uZWN0b3IuaAo+IEBAIC01MTcsNiArNTE3LDEwIEBAIHN0cnVjdCBkcm1fY29ubmVjdG9y
X3N0YXRlIHsKPiAgCSAqIFVzZWQgYnkgdGhlIGF0b21pYyBoZWxwZXJzIHRvIHNlbGVjdCB0aGUg
ZW5jb2RlciwgdGhyb3VnaCB0aGUKPiAgCSAqICZkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcy5h
dG9taWNfYmVzdF9lbmNvZGVyIG9yCj4gIAkgKiAmZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3Mu
YmVzdF9lbmNvZGVyIGNhbGxiYWNrcy4KCkhvdyBhYm91dCB1cGRhdGluZyB0aGlzIHBhcnQgYXMg
d2VsbCA/CgoiVXNlZCBieSBib3RoIHRoZSBEUk0gY29yZSBhbmQgdGhlIGF0b21pYyBoZWxwZXJz
IHRvIHNlbGVjdCB0aGUgZW5jb2RlcgoodGhyb3VnaCB0aGUgJmRybV9jb25uZWN0b3JfaGVscGVy
X2Z1bmNzLmF0b21pY19iZXN0X2VuY29kZXIpLCBhY2Nlc3MgaXQKYW5kIHJlcG9ydCBpdCB0byB1
c2Vyc3BhY2UgKHRocm91Z2ggdGhlIEdFVENPTk5FQ1RPUiBhbmQgR0VURU5DT0RFUgppb2N0bHMp
LiBUaGlzIGZpZWxkIHNoYWxsIGJlIHNldCBieSBhbGwgYXRvbWljIGRyaXZlcnMsIGVpdGhlciBk
aXJlY3RseQpvciB0aHJvdWdoIGF0b21pYyBoZWxwZXJzLiIKCj4gKwkgKgo+ICsJICogTk9URTog
QXRvbWljIGRyaXZlcnMgbXVzdCBmaWxsIHRoaXMgb3V0IChlaXRoZXIgdGhlbXNlbHZlcyBvciB0
aHJvdWdoCj4gKwkgKiBoZWxwZXJzKSwgZm9yIG90aGVyd2lzZSB0aGUgR0VUQ09OTkVDVE9SIGFu
ZCBHRVRFTkNPREVSIElPQ1RMcyB3aWxsCj4gKwkgKiBub3QgcmV0dXJuIGNvcnJlY3QgZGF0YSB0
byB1c2Vyc3BhY2UuCj4gIAkgKi8KPiAgCXN0cnVjdCBkcm1fZW5jb2RlciAqYmVzdF9lbmNvZGVy
Owo+ICAKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
