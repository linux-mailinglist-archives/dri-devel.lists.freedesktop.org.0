Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7EE100FA6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 01:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7346E103;
	Tue, 19 Nov 2019 00:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E7789EEB
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 00:04:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1ED4563;
 Tue, 19 Nov 2019 01:04:02 +0100 (CET)
Date: Tue, 19 Nov 2019 02:03:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 07/13] drm/bridge: lvds-codec: Simplify panel DT node
 localisation
Message-ID: <20191119000350.GG5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-8-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-8-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1574121844;
 bh=VtMemPJqqEbKjR+6JRu+opzP9DDp6kItFRs+SttWtZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=StpMtxbJT4xx1fQwoKTjSuSBDBVeWdnlzYC2Es/WTrgJclcpTWKVjcS3f0wqwQa70
 k4oWfHatOEj/NzGh0pi4jj2AERl5Cngf6JLNq828prYm0XfDAC4Rx2kCybOm+Bq3Ti
 PvRNCdPxbw0BAjzowly8G9ljOiMEgmEGdauqPrPM=
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
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZCwgTm92IDEzLCAy
MDE5IGF0IDAzOjUxOjI2UE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBUaGUgcHJv
YmUgZnVuY3Rpb24gbmVlZHMgdG8gZ2V0IGFob2xkIG9mIHRoZSBwYW5lbCBkZXZpY2UgdHJlZQo+
IG5vZGUsIGFuZCBpdCBhY2hpZXZlcyB0aGF0IGJ5IHVzaW5nIGEgY29tYmluYXRpb24gb2YKPiBv
Zl9ncmFwaF9nZXRfcG9ydF9ieV9pZCwgb2ZfZ2V0X2NoaWxkX2J5X25hbWUsIGFuZAo+IG9mX2dy
YXBoX2dldF9yZW1vdGVfcG9ydF9wYXJlbnQuIFdlIGNhbiBhY2hpZXZlIHRoZSBzYW1lIGdvYWwK
PiBieSByZXBsYWNpbmcgdGhvc2UgY2FsbHMgd2l0aCBhIGNhbGwgdG8gb2ZfZ3JhcGhfZ2V0X3Jl
bW90ZV9ub2RlCj4gdGhlc2UgZGF5cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0
cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KClJldmlld2VkLWJ5OiBMYXVyZW50
IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cgo+IC0tLQo+IHYz
LT52NDoKPiAqIE5ldyBwYXRjaAo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMt
Y29kZWMuYyB8IDIwICsrLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1j
b2RlYy5jCj4gaW5kZXggYzMyZTEyNS4uNzg0YmJkMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
bHZkcy1jb2RlYy5jCj4gQEAgLTU3LDggKzU3LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fYnJpZGdl
X2Z1bmNzIGZ1bmNzID0gewo+ICBzdGF0aWMgaW50IGx2ZHNfY29kZWNfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiAgewo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYt
PmRldjsKPiAtCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcG9ydDsKPiAtCXN0cnVjdCBkZXZpY2Vfbm9k
ZSAqZW5kcG9pbnQ7Cj4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhbmVsX25vZGU7Cj4gIAlzdHJ1
Y3QgZHJtX3BhbmVsICpwYW5lbDsKPiAgCXN0cnVjdCBsdmRzX2NvZGVjICpsdmRzX2NvZGVjOwo+
IEBAIC03OSwyMyArNzcsOSBAQCBzdGF0aWMgaW50IGx2ZHNfY29kZWNfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiAgCX0KPiAgCj4gIAkvKiBMb2NhdGUgdGhlIHBhbmVsIERU
IG5vZGUuICovCj4gLQlwb3J0ID0gb2ZfZ3JhcGhfZ2V0X3BvcnRfYnlfaWQoZGV2LT5vZl9ub2Rl
LCAxKTsKPiAtCWlmICghcG9ydCkgewo+IC0JCWRldl9kYmcoZGV2LCAicG9ydCAxIG5vdCBmb3Vu
ZFxuIik7Cj4gLQkJcmV0dXJuIC1FTlhJTzsKPiAtCX0KPiAtCj4gLQllbmRwb2ludCA9IG9mX2dl
dF9jaGlsZF9ieV9uYW1lKHBvcnQsICJlbmRwb2ludCIpOwo+IC0Jb2Zfbm9kZV9wdXQocG9ydCk7
Cj4gLQlpZiAoIWVuZHBvaW50KSB7Cj4gLQkJZGV2X2RiZyhkZXYsICJubyBlbmRwb2ludCBmb3Ig
cG9ydCAxXG4iKTsKPiAtCQlyZXR1cm4gLUVOWElPOwo+IC0JfQo+IC0KPiAtCXBhbmVsX25vZGUg
PSBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50KGVuZHBvaW50KTsKPiAtCW9mX25vZGVf
cHV0KGVuZHBvaW50KTsKPiArCXBhbmVsX25vZGUgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX25vZGUo
ZGV2LT5vZl9ub2RlLCAxLCAwKTsKPiAgCWlmICghcGFuZWxfbm9kZSkgewo+IC0JCWRldl9kYmco
ZGV2LCAibm8gcmVtb3RlIGVuZHBvaW50IGZvciBwb3J0IDFcbiIpOwo+ICsJCWRldl9kYmcoZGV2
LCAicGFuZWwgRFQgbm9kZSBub3QgZm91bmRcbiIpOwo+ICAJCXJldHVybiAtRU5YSU87Cj4gIAl9
Cj4gIAoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
