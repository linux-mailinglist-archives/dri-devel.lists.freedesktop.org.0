Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747B710EC3F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 16:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3986F6E202;
	Mon,  2 Dec 2019 15:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE1A89E9B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 15:24:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CEC0309;
 Mon,  2 Dec 2019 16:24:27 +0100 (CET)
Date: Mon, 2 Dec 2019 17:24:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 13/50] drm/bridge: panel: Implement bridge connector
 operations
Message-ID: <20191202152420.GA12435@pendragon.ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-14-laurent.pinchart@ideasonboard.com>
 <20190820103706.GB9745@ravnborg.org>
 <e9e47b5f-4da5-7131-d09c-92a7ec8ba46a@ti.com>
 <20191009192447.GB2693@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009192447.GB2693@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575300267;
 bh=Qxl4lzCkQBBn3NghC5yWLTkXRcGiK9t+LzwCO0VpuKo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=btj/422r4NB6HzX4d6//t/TSohzibrTVjgRc5LX/TYYed57DbhP9LOrafK7qPVsoP
 jknxqAYiNez+OtbVqO+NyyYJvLyxUFfE1n2Afa1SBj7ZnCNmPhuWI5veecpAfnJF46
 92bYa7kdoTlVPJ59nh3Q5PirycohGFYDj2YqJD1s=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMDk6MjQ6NDdQTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDA4OjU2OjE1QU0gKzAzMDAs
IFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+ID4gT24gMjAvMDgvMjAxOSAxMzozNywgU2FtIFJhdm5i
b3JnIHdyb3RlOgo+ID4gCj4gPiA+ID4gQEAgLTEyMyw2ICsxMjMsMTggQEAgc3RhdGljIHZvaWQg
cGFuZWxfYnJpZGdlX3Bvc3RfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ID4g
PiA+ICAgCWRybV9wYW5lbF91bnByZXBhcmUocGFuZWxfYnJpZGdlLT5wYW5lbCk7Cj4gPiA+ID4g
ICB9Cj4gPiA+ID4gK3N0YXRpYyBpbnQgcGFuZWxfYnJpZGdlX2dldF9tb2RlcyhzdHJ1Y3QgZHJt
X2JyaWRnZSAqYnJpZGdlLAo+ID4gPiA+ICsJCQkJICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKwlzdHJ1Y3QgcGFuZWxfYnJpZGdlICpwYW5lbF9i
cmlkZ2UgPSBkcm1fYnJpZGdlX3RvX3BhbmVsX2JyaWRnZShicmlkZ2UpOwo+ID4gPiA+ICsKPiA+
ID4gPiArCS8qCj4gPiA+ID4gKwkgKiBGSVhNRTogZHJtX3BhbmVsX2dldF9tb2RlcygpIHNob3Vs
ZCB0YWtlIHRoZSBjb25uZWN0b3IgYXMgYW4KPiA+ID4gPiArCSAqIGFyZ3VtZW50Lgo+ID4gPiA+
ICsJICovCj4gPiA+IE5vdGVkLCBJIGhhdmUgcGF0Y2hlcyB0byBmaXggdGhpcy4gTmVlZHMgYSBs
aXR0bGUgdGVzdGluZy9wb2xpc2hpbmcKPiA+ID4gYmVmb3JlIEkgcG9zdCB0aGVtLgo+ID4gCj4g
PiBEbyB5b3UgaGF2ZSBhbnkgdGVzdGFibGUgcGF0Y2hlcyBmb3IgdGhpcz8KPiA+IAo+ID4gSSB3
YXMgdGVzdGluZyB0aGlzIHNlcmllcyB3aXRoIGEgVG9zaGliYSBEUEktMi1EU0kgYnJpZGdlIGFu
ZCBhIERTSSBwYW5lbCwKPiA+IGFuZCB3YXMgaGl0dGluZyBhIGNyYXNoIGFzIHNpbXBsZS1wYW5l
bCBjb3VsZG4ndCBnZXQgdGhlIGNvbm5lY3Rvci4KPiAKPiBJZiB0aW1lIHBlcm1pdHMgSSB3aWxs
IHJlZnJlc2ggdGhlIHBhdGNoZXMgdGhpcyB3ZWVrZW5kIGFuZCBzZW5kIHRoZW0KPiBvdXQuCj4g
QnV0IHJpZ2h0IG5vdyBjYW5ub3QgcHJvbWlzZSBtdWNoIGFzIEkgYW0gYXdmdWwgYmVoaW5kLgoK
Tm8gd29ycmllcyBhdCBhbGwuIElzIHRoZXJlIGFueSB3YXkgSSBjYW4gaGVscCB5b3UsIG1heWJl
IGNvbnRpbnVpbmcKaW4tcHJvZ3Jlc3Mgd29yayA/CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGlu
Y2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
