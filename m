Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEA2D0964
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 10:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E482A6E925;
	Wed,  9 Oct 2019 08:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F186E925
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 08:16:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C16264FF;
 Wed,  9 Oct 2019 10:16:50 +0200 (CEST)
Date: Wed, 9 Oct 2019 11:16:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH RESEND] gpu: drm: bridge: sii9234: convert to
 devm_i2c_new_dummy_device
Message-ID: <20191009081648.GC22998@pendragon.ideasonboard.com>
References: <20191008203322.3238-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008203322.3238-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570609011;
 bh=dfCYYmVUWtdv4zBsKgd4ZyXxFLnPVhNwwZgG6/vSvNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eVlJScwCub0+GmlR5SL43r9WCQGHvo9eM6c3APruewM0PbYssfq970wql++ufnvrm
 IEgxyFr9psKDOwHspLVplOYzuPu0y7Z2YECA8WMOwNtwWgwBfXoF2kgdWWUaVSsdKz
 C1trqy9ctIwsYWPhlB9Hmh24hDRxkzWbPMSNiF9w=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgV29sZnJhbSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVHVlLCBPY3QgMDgsIDIw
MTkgYXQgMTA6MzM6MjJQTSArMDIwMCwgV29sZnJhbSBTYW5nIHdyb3RlOgo+IE1vdmUgZnJvbSB0
aGUgZGVwcmVjYXRlZCBpMmNfbmV3X2R1bW15KCkgdG8gZGV2bV9pMmNfbmV3X2R1bW15X2Rldmlj
ZSgpLgo+IFdlIG5vdyBnZXQgYW4gRVJSUFRSIHdoaWNoIHdlIHVzZSBpbiBlcnJvciBoYW5kbGlu
ZyBhbmQgd2UgY2FuIHNraXAKPiByZW1vdmFsIG9mIHRoZSBjcmVhdGVkIGRldmljZXMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5n
LmNvbT4KClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+Cgo+IC0tLQo+IAo+IFJlYmFzZWQgdG8gdjUuNC1yYzIgc2luY2UgbGFz
dCB0aW1lLiBPbmUgb2YgdGhlIGxhc3QgdHdvIHVzZXJzIG9mIHRoZQo+IG9sZCBBUEksIHNvIHBs
ZWFzZSBhcHBseSBzb29uLCBzbyBJIGNhbiByZW1vdmUgdGhlIG9sZCBpbnRlcmZhY2UuIE9ubHkK
PiBidWlsZCB0ZXN0ZWQuCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jIHwg
MzYgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3NpaTkyMzQuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIz
NC5jCj4gaW5kZXggMjVkNGFkOGM3YWQ2Li44YTZjODU2OTNhODggMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MjM0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3NpaTkyMzQuYwo+IEBAIC04NDEsMzkgKzg0MSwyOCBAQCBzdGF0aWMgaW50IHNpaTkyMzRf
aW5pdF9yZXNvdXJjZXMoc3RydWN0IHNpaTkyMzQgKmN0eCwKPiAgCj4gIAljdHgtPmNsaWVudFtJ
MkNfTUhMXSA9IGNsaWVudDsKPiAgCj4gLQljdHgtPmNsaWVudFtJMkNfVFBJXSA9IGkyY19uZXdf
ZHVtbXkoYWRhcHRlciwgSTJDX1RQSV9BRERSKTsKPiAtCWlmICghY3R4LT5jbGllbnRbSTJDX1RQ
SV0pIHsKPiArCWN0eC0+Y2xpZW50W0kyQ19UUEldID0gZGV2bV9pMmNfbmV3X2R1bW15X2Rldmlj
ZSgmY2xpZW50LT5kZXYsIGFkYXB0ZXIsCj4gKwkJCQkJCQkgSTJDX1RQSV9BRERSKTsKPiArCWlm
IChJU19FUlIoY3R4LT5jbGllbnRbSTJDX1RQSV0pKSB7Cj4gIAkJZGV2X2VycihjdHgtPmRldiwg
ImZhaWxlZCB0byBjcmVhdGUgVFBJIGNsaWVudFxuIik7Cj4gLQkJcmV0dXJuIC1FTk9ERVY7Cj4g
KwkJcmV0dXJuIFBUUl9FUlIoY3R4LT5jbGllbnRbSTJDX1RQSV0pOwo+ICAJfQo+ICAKPiAtCWN0
eC0+Y2xpZW50W0kyQ19IRE1JXSA9IGkyY19uZXdfZHVtbXkoYWRhcHRlciwgSTJDX0hETUlfQURE
Uik7Cj4gLQlpZiAoIWN0eC0+Y2xpZW50W0kyQ19IRE1JXSkgewo+ICsJY3R4LT5jbGllbnRbSTJD
X0hETUldID0gZGV2bV9pMmNfbmV3X2R1bW15X2RldmljZSgmY2xpZW50LT5kZXYsIGFkYXB0ZXIs
Cj4gKwkJCQkJCQkgIEkyQ19IRE1JX0FERFIpOwo+ICsJaWYgKElTX0VSUihjdHgtPmNsaWVudFtJ
MkNfSERNSV0pKSB7Cj4gIAkJZGV2X2VycihjdHgtPmRldiwgImZhaWxlZCB0byBjcmVhdGUgSERN
SSBSWCBjbGllbnRcbiIpOwo+IC0JCWdvdG8gZmFpbF90cGk7Cj4gKwkJcmV0dXJuIFBUUl9FUlIo
Y3R4LT5jbGllbnRbSTJDX0hETUldKTsKPiAgCX0KPiAgCj4gLQljdHgtPmNsaWVudFtJMkNfQ0JV
U10gPSBpMmNfbmV3X2R1bW15KGFkYXB0ZXIsIEkyQ19DQlVTX0FERFIpOwo+IC0JaWYgKCFjdHgt
PmNsaWVudFtJMkNfQ0JVU10pIHsKPiArCWN0eC0+Y2xpZW50W0kyQ19DQlVTXSA9IGRldm1faTJj
X25ld19kdW1teV9kZXZpY2UoJmNsaWVudC0+ZGV2LCBhZGFwdGVyLAo+ICsJCQkJCQkJICBJMkNf
Q0JVU19BRERSKTsKPiArCWlmIChJU19FUlIoY3R4LT5jbGllbnRbSTJDX0NCVVNdKSkgewo+ICAJ
CWRldl9lcnIoY3R4LT5kZXYsICJmYWlsZWQgdG8gY3JlYXRlIENCVVMgY2xpZW50XG4iKTsKPiAt
CQlnb3RvIGZhaWxfaGRtaTsKPiArCQlyZXR1cm4gUFRSX0VSUihjdHgtPmNsaWVudFtJMkNfQ0JV
U10pOwo+ICAJfQo+ICAKPiAgCXJldHVybiAwOwo+IC0KPiAtZmFpbF9oZG1pOgo+IC0JaTJjX3Vu
cmVnaXN0ZXJfZGV2aWNlKGN0eC0+Y2xpZW50W0kyQ19IRE1JXSk7Cj4gLWZhaWxfdHBpOgo+IC0J
aTJjX3VucmVnaXN0ZXJfZGV2aWNlKGN0eC0+Y2xpZW50W0kyQ19UUEldKTsKPiAtCj4gLQlyZXR1
cm4gLUVOT0RFVjsKPiAtfQo+IC0KPiAtc3RhdGljIHZvaWQgc2lpOTIzNF9kZWluaXRfcmVzb3Vy
Y2VzKHN0cnVjdCBzaWk5MjM0ICpjdHgpCj4gLXsKPiAtCWkyY191bnJlZ2lzdGVyX2RldmljZShj
dHgtPmNsaWVudFtJMkNfQ0JVU10pOwo+IC0JaTJjX3VucmVnaXN0ZXJfZGV2aWNlKGN0eC0+Y2xp
ZW50W0kyQ19IRE1JXSk7Cj4gLQlpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoY3R4LT5jbGllbnRbSTJD
X1RQSV0pOwo+ICB9Cj4gIAo+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBzaWk5MjM0ICpicmlkZ2Vf
dG9fc2lpOTIzNChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+IEBAIC05NTAsNyArOTM5LDYg
QEAgc3RhdGljIGludCBzaWk5MjM0X3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+
ICAKPiAgCXNpaTkyMzRfY2FibGVfb3V0KGN0eCk7Cj4gIAlkcm1fYnJpZGdlX3JlbW92ZSgmY3R4
LT5icmlkZ2UpOwo+IC0Jc2lpOTIzNF9kZWluaXRfcmVzb3VyY2VzKGN0eCk7Cj4gIAo+ICAJcmV0
dXJuIDA7Cj4gIH0KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
