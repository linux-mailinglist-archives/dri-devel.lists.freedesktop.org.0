Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7EF891DB
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 15:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0DC6E33D;
	Sun, 11 Aug 2019 13:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7535E6E33D
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 13:35:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72E12327;
 Sun, 11 Aug 2019 15:35:09 +0200 (CEST)
Date: Sun, 11 Aug 2019 16:35:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 4/9] drm/panel: Add driver for the LG Philips LB035Q02
 panel
Message-ID: <20190811133506.GB5011@pendragon.ideasonboard.com>
References: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
 <20190810231048.1921-5-laurent.pinchart@ideasonboard.com>
 <6a2a22b2-3db5-2d7b-d19b-4f3857351134@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a2a22b2-3db5-2d7b-d19b-4f3857351134@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565530509;
 bh=vbyEIoYSmn/vB01huJR1f3xl/u9d8XUm4zyHqBj0ZKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fwvcNU++UVGzx2PJ0WQ6B6dPm23lGJjf3N5im1OcZN9wM+NddOeBMyDfoyUvqib72
 Z3bugf+a19v1aEpKwixjNHgyewTQC9fijhRFm8KIHQz4GXMMfpuyE+zvVj7biprs3G
 GsbTaQYiH51ixr27faYGqMixlToDqamuqw0ZA/tI=
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLAoKT24gU3VuLCBBdWcgMTEsIDIwMTkgYXQgMDM6MTk6MTNQTSArMDIwMCwgTm9y
YWxmIFRyw7hubmVzIHdyb3RlOgo+IFNhbSwKPiAKPiBEZW4gMTEuMDguMjAxOSAwMS4xMCwgc2ty
ZXYgTGF1cmVudCBQaW5jaGFydDoKPiA+IFRoaXMgcGFuZWwgaXMgdXNlZCBvbiB0aGUgR3Vtc3Rp
eCBPdmVybyBQYWxvMzUuCj4gPiAKPiA+IFRoZSBjb2RlIGlzIGJhc2VkIG9uIHRoZSBvbWFwZHJt
LXNwZWNpZmljIHBhbmVsLWxncGhpbGlwcy1sYjAzNXEwMgo+ID4gZHJpdmVyLgo+ID4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
Pgo+ID4gLS0tCj4gCj4gPHNuaXA+Cj4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLWxnLWxiMDM1cTAyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
bGctbGIwMzVxMDIuYwo+IAo+IDxzbmlwPgo+IAo+ID4gK3N0YXRpYyBpbnQgbGIwMzVxMDJfd3Jp
dGUoc3RydWN0IGxiMDM1cTAyX2RldmljZSAqbGNkLCB1MTYgcmVnLCB1MTYgdmFsKQo+ID4gK3sK
PiA+ICsJc3RydWN0IHNwaV9tZXNzYWdlIG1zZzsKPiA+ICsJc3RydWN0IHNwaV90cmFuc2ZlciBp
bmRleF94ZmVyID0gewo+ID4gKwkJLmxlbgkJPSAzLAo+ID4gKwkJLmNzX2NoYW5nZQk9IDEsCj4g
PiArCX07Cj4gPiArCXN0cnVjdCBzcGlfdHJhbnNmZXIgdmFsdWVfeGZlciA9IHsKPiA+ICsJCS5s
ZW4JCT0gMywKPiA+ICsJfTsKPiA+ICsJdTgJYnVmZmVyWzE2XTsKPiA+ICsKPiA+ICsJc3BpX21l
c3NhZ2VfaW5pdCgmbXNnKTsKPiA+ICsKPiA+ICsJLyogcmVnaXN0ZXIgaW5kZXggKi8KPiA+ICsJ
YnVmZmVyWzBdID0gMHg3MDsKPiA+ICsJYnVmZmVyWzFdID0gMHgwMDsKPiA+ICsJYnVmZmVyWzJd
ID0gcmVnICYgMHg3ZjsKPiA+ICsJaW5kZXhfeGZlci50eF9idWYgPSBidWZmZXI7Cj4gPiArCXNw
aV9tZXNzYWdlX2FkZF90YWlsKCZpbmRleF94ZmVyLCAmbXNnKTsKPiA+ICsKPiA+ICsJLyogcmVn
aXN0ZXIgdmFsdWUgKi8KPiA+ICsJYnVmZmVyWzRdID0gMHg3MjsKPiA+ICsJYnVmZmVyWzVdID0g
dmFsID4+IDg7Cj4gPiArCWJ1ZmZlcls2XSA9IHZhbDsKPiA+ICsJdmFsdWVfeGZlci50eF9idWYg
PSBidWZmZXIgKyA0Owo+ID4gKwlzcGlfbWVzc2FnZV9hZGRfdGFpbCgmdmFsdWVfeGZlciwgJm1z
Zyk7Cj4gPiArCj4gPiArCXJldHVybiBzcGlfc3luYyhsY2QtPnNwaSwgJm1zZyk7Cj4gPiArfQo+
IAo+IEp1c3QgYSBub3RlIHRvIFNhbToKPiBUaGlzIGlzIHRoZSBzYW1lIHNwaSBwcm90b2NvbCB0
aGF0IHRoZSBpbGk5MzI1IGNvbnRyb2xsZXIgb24gdGhlIGh5MjhiCj4gcGFuZWwgdXNlcy4KPiAK
PiBJIHJlbWVtYmVyZWQgdGhhdCBJIGhhdmUgZXhwZXJpbWVudGVkIHdpdGggYSByZWdtYXAgaW1w
bGVtZW50YXRpb246Cj4gaHR0cHM6Ly9naXRodWIuY29tL25vdHJvL3Rpbnlkcm0vYmxvYi9tYXN0
ZXIvdGlueWRybS1pbGk5MzI1LmMjTDE5MQoKVGhhdCdzIHVzZWZ1bCBpbmZvcm1hdGlvbiwgdGhh
bmtzLiBUaGUgY29udHJvbGxlciBzZWVtcyBkaWZmZXJlbnQKdGhvdWdoLCB0aGUgbGltaXRlZCBp
bmZvcm1hdGlvbiBhdmFpbGFibGUgaW4KaHR0cHM6Ly93d3cuYmV5b25kaW5maW5pdGUuY29tL2xj
ZC9MaWJyYXJ5L0xHLVBoaWxpcHMvTEIwMzVRMDIucGRmCmRvZXNuJ3QgbWF0Y2ggdGhlIHJlZ2lz
dGVycyBmcm9tCmh0dHBzOi8vZ2l0aHViLmNvbS9ub3Ryby90aW55ZHJtL2Jsb2IvbWFzdGVyL2Zi
X2lsaTkzMjUuYy4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
