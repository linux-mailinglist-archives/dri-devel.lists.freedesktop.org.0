Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC27EE63
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE5D6ECEA;
	Fri,  2 Aug 2019 08:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71B76ECEA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:08:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 712A4CC;
 Fri,  2 Aug 2019 10:08:23 +0200 (CEST)
Date: Fri, 2 Aug 2019 11:08:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFC 06/12] drm: rcar-du: lvds: Do not look at ports for
 identifying bridges
Message-ID: <20190802080821.GG5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-7-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564731249-22671-7-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564733303;
 bh=2UaQPpKkx8OlEPlBRJ06lDq41qS+2VJC+5P6gozouMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KloZozCyzqkc0hzxknVEstKXIczl6U9AFfOAUh+7svdYW0s4VQjexe5c3rWasGri2
 AVoPS5T3qZdRMMr1CqQbEkS22Tnn+ojZG2A3v5vFwaWU1b9XTn3Q+JnsEWqHx4Q16o
 7MgdigP04BI6ubzm8UeExDmFx09kW/J8MYiTPnvE=
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIEZyaSwgQXVnIDAyLCAy
MDE5IGF0IDA4OjM0OjAzQU0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBXZSBtYXkg
YmUgY29ubmVjdGVkIHRvIGEgZHVhbCBMVkRTIGRpc3BsYXksIHRoZXJlZm9yZSBjaGVja2luZwo+
IGlmIG5vZGUgIT0gcmVtb3RlX2lucHV0IGZvciBpZGVudGlmeWluZyBicmlkZ2VzIGlzIG5vdCBn
b2luZyB0bwo+IHdvcmsgYW55bW9yZS4KPiBXZSBjb3VsZCB0cnkgdG8gbWF0Y2ggdGhlIHBvcnRz
IG9uIHRoZSByZW1vdGUgZW5kIHRvIHRoZSBMVkRTCj4gZW5jb2RlcnMsIGhvd2V2ZXIgdGhlIGNv
bXBhbmlvbiBMVkRTIGVuY29kZXIgaW5zdGFuY2UgZG9lc24ndAo+IGhvbGQgYSByZWZlcmVuY2Ug
dG8gdGhlIHByaW1hcnkgTFZEUyBlbmNvZGVyIGluc3RhbmNlLgo+IFdlIGtub3cgd2UgY291bGQg
YmUgY29ubmVjdGVkIHRvIGVpdGhlciBhIGJyaWRnZSwgb3IgYSBwYW5lbCwKPiB0aGVyZWZvcmUg
bG9vayB0aHJvdWdoIHRoZSByZWdpc3RlcmVkIGJyaWRnZXMgYW5kIHBhbmVscywgdW50aWwKPiB3
ZSBoYXZlIGEgbWF0Y2guCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJy
aXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfbHZkcy5jIHwgMjkgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiBpbmRleCBjMzA2ZmFiLi4yZDU0YWU1IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiBAQCAtNzExLDEwICs3MTEsNyBAQCBzdGF0
aWMgaW50IHJjYXJfbHZkc19wYXJzZV9kdF9jb21wYW5pb24oc3RydWN0IHJjYXJfbHZkcyAqbHZk
cykKPiAgc3RhdGljIGludCByY2FyX2x2ZHNfcGFyc2VfZHQoc3RydWN0IHJjYXJfbHZkcyAqbHZk
cykKPiAgewo+ICAJc3RydWN0IGRldmljZV9ub2RlICpsb2NhbF9vdXRwdXQgPSBOVUxMOwo+IC0J
c3RydWN0IGRldmljZV9ub2RlICpyZW1vdGVfaW5wdXQgPSBOVUxMOwo+ICAJc3RydWN0IGRldmlj
ZV9ub2RlICpyZW1vdGUgPSBOVUxMOwo+IC0Jc3RydWN0IGRldmljZV9ub2RlICpub2RlOwo+IC0J
Ym9vbCBpc19icmlkZ2UgPSBmYWxzZTsKPiAgCWludCByZXQgPSAwOwo+ICAKPiAgCWxvY2FsX291
dHB1dCA9IG9mX2dyYXBoX2dldF9lbmRwb2ludF9ieV9yZWdzKGx2ZHMtPmRldi0+b2Zfbm9kZSwg
MSwgMCk7Cj4gQEAgLTc0MiwyNyArNzM5LDggQEAgc3RhdGljIGludCByY2FyX2x2ZHNfcGFyc2Vf
ZHQoc3RydWN0IHJjYXJfbHZkcyAqbHZkcykKPiAgCQlnb3RvIGRvbmU7Cj4gIAl9Cj4gIAo+IC0J
cmVtb3RlX2lucHV0ID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9lbmRwb2ludChsb2NhbF9vdXRwdXQp
Owo+IC0KPiAtCWZvcl9lYWNoX2VuZHBvaW50X29mX25vZGUocmVtb3RlLCBub2RlKSB7Cj4gLQkJ
aWYgKG5vZGUgIT0gcmVtb3RlX2lucHV0KSB7Cj4gLQkJCS8qCj4gLQkJCSAqIFdlJ3ZlIGZvdW5k
IG9uZSBlbmRwb2ludCBvdGhlciB0aGFuIHRoZSBpbnB1dCwgdGhpcwo+IC0JCQkgKiBtdXN0IGJl
IGEgYnJpZGdlLgo+IC0JCQkgKi8KPiAtCQkJaXNfYnJpZGdlID0gdHJ1ZTsKPiAtCQkJb2Zfbm9k
ZV9wdXQobm9kZSk7Cj4gLQkJCWJyZWFrOwo+IC0JCX0KPiAtCX0KPiAtCj4gLQlpZiAoaXNfYnJp
ZGdlKSB7Cj4gLQkJbHZkcy0+bmV4dF9icmlkZ2UgPSBvZl9kcm1fZmluZF9icmlkZ2UocmVtb3Rl
KTsKPiAtCQlpZiAoIWx2ZHMtPm5leHRfYnJpZGdlKSB7Cj4gLQkJCXJldCA9IC1FUFJPQkVfREVG
RVI7Cj4gLQkJCWdvdG8gZG9uZTsKPiAtCQl9Cj4gLQo+ICsJbHZkcy0+bmV4dF9icmlkZ2UgPSBv
Zl9kcm1fZmluZF9icmlkZ2UocmVtb3RlKTsKCkhvdyBhYm91dCB1c2luZyBkcm1fb2ZfZmluZF9w
YW5lbF9vcl9icmlkZ2UoKSA/Cgo+ICsJaWYgKGx2ZHMtPm5leHRfYnJpZGdlKSB7Cj4gIAkJaWYg
KGx2ZHMtPmluZm8tPnF1aXJrcyAmIFJDQVJfTFZEU19RVUlSS19EVUFMX0xJTkspCj4gIAkJCWx2
ZHMtPmR1YWxfbGluayA9IGx2ZHMtPm5leHRfYnJpZGdlLT50aW1pbmdzCj4gIAkJCQkJPyBsdmRz
LT5uZXh0X2JyaWRnZS0+dGltaW5ncy0+ZHVhbF9saW5rCj4gQEAgLTc3MCw3ICs3NDgsNyBAQCBz
dGF0aWMgaW50IHJjYXJfbHZkc19wYXJzZV9kdChzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQo+ICAJ
fSBlbHNlIHsKPiAgCQlsdmRzLT5wYW5lbCA9IG9mX2RybV9maW5kX3BhbmVsKHJlbW90ZSk7Cj4g
IAkJaWYgKElTX0VSUihsdmRzLT5wYW5lbCkpIHsKPiAtCQkJcmV0ID0gUFRSX0VSUihsdmRzLT5w
YW5lbCk7Cj4gKwkJCXJldCA9IC1FUFJPQkVfREVGRVI7Cj4gIAkJCWdvdG8gZG9uZTsKPiAgCQl9
Cj4gIAl9Cj4gQEAgLTc4NCw3ICs3NjIsNiBAQCBzdGF0aWMgaW50IHJjYXJfbHZkc19wYXJzZV9k
dChzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQo+ICAKPiAgZG9uZToKPiAgCW9mX25vZGVfcHV0KGxv
Y2FsX291dHB1dCk7Cj4gLQlvZl9ub2RlX3B1dChyZW1vdGVfaW5wdXQpOwo+ICAJb2Zfbm9kZV9w
dXQocmVtb3RlKTsKPiAgCj4gIAlzd2l0Y2ggKHJldCkgewoKLS0gClJlZ2FyZHMsCgpMYXVyZW50
IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
