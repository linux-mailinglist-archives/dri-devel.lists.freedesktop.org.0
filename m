Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4F3A9578
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 23:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A718914E;
	Wed,  4 Sep 2019 21:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD0A8914E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 21:48:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A148440;
 Wed,  4 Sep 2019 23:48:55 +0200 (CEST)
Date: Thu, 5 Sep 2019 00:48:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] drm: panel-lvds: Potential Oops in probe error handling
Message-ID: <20190904214849.GM5433@pendragon.ideasonboard.com>
References: <20190904115057.GC4811@pendragon.ideasonboard.com>
 <20190904185507.GA3634@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904185507.GA3634@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1567633735;
 bh=FF47Dv2MuaZGR4dKhfX7YrzdQJYDYjE+xebiIodI5es=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kMEKkIQbDyY+/u3uxevrlz90++LR+HHIrtTbs+xgc1TaHEGYlOz2F0UyeQi0wQuZn
 KTH0ZsYl+M59Vj36rWw++bYKtWyN8fxzI6RWlA20MC8GLy8LZG1Uv7oME+lE6y3j5f
 xzLMW+I3/vzWmS4fqzAkF140JPjvas276o8eyXeo=
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBXZWQsIFNlcCAwNCwgMjAxOSBh
dCAwOTo1NTowN1BNICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+IFRoZSAibHZkcy0+YmFj
a2xpZ2h0IiBwb2ludGVyIGNvdWxkIGJlIE5VTEwgaW4gc2l0dWF0aW9ucyB3ZXJlCj4gb2ZfcGFy
c2VfcGhhbmRsZSgpIHJldHVybnMgTlVMTC4gIEFsc28gaXQncyBzbGlnaHRseSBjbGVhbmVyIHRv
IHVzZQo+IGJhY2tsaWdodF9wdXQoKSB3aGljaCBhbHJlYWR5IGhhcyBhIGNoZWNrIGZvciBOVUxM
IGJ1aWx0IGluLgo+IAo+IEZpeGVzOiA3YzlkZmY1YmQ2NDMgKCJkcm06IHBhbmVsczogQWRkIExW
RFMgcGFuZWwgZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2Fy
cGVudGVyQG9yYWNsZS5jb20+CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKU2FtLCB3b3VsZCB5b3UgYmUgYWJsZSB0byBw
aWNrIHRoaXMgcGF0Y2ggPwoKPiAtLS0KPiB2MjogVXNlIGJhY2tsaWdodF9wdXQoKS4gIFRoYW5r
cywgTGF1cmVudCEKPiAKPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYyB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jCj4gaW5kZXggYWQ0N2NjOTU0NTllLi4wNWU4ODg1
ZGI3ZWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMKPiBAQCAtMjcyLDcgKzI3
Miw3IEBAIHN0YXRpYyBpbnQgcGFuZWxfbHZkc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+ICAJcmV0dXJuIDA7Cj4gIAo+ICBlcnJvcjoKPiAtCXB1dF9kZXZpY2UoJmx2ZHMt
PmJhY2tsaWdodC0+ZGV2KTsKPiArCWJhY2tsaWdodF9wdXQobHZkcy0+YmFja2xpZ2h0KTsKPiAg
CXJldHVybiByZXQ7Cj4gIH0KPiAgCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
