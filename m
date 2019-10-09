Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD21D095B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 10:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009D26E91D;
	Wed,  9 Oct 2019 08:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D776E91D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 08:15:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3477A4FF;
 Wed,  9 Oct 2019 10:14:59 +0200 (CEST)
Date: Wed, 9 Oct 2019 11:14:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH RESEND] gpu: drm: bridge: analogix-anx78xx: convert to
 i2c_new_dummy_device
Message-ID: <20191009081458.GB22998@pendragon.ideasonboard.com>
References: <20191008203145.3159-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008203145.3159-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570608899;
 bh=++ntxKRvSWOvvroIqsnx23Cq7lZXrSkD/go2481uxUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aogUTJealSc4dmR3mdqA/NgRAH0cmHX7YrCr5WNicv5tBBTJVfy0h3/+Vv0VuUjFG
 ImD7nUNITRrYejOX5O9JqjmgnBhtX7la+MpjaE/IkFs766ggiTViN+QUJJKVF38T0W
 diK0f/vp5PShKgv6QYcD7gDx5nSZvLlQLlCE5lSI=
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
MTkgYXQgMTA6MzE6NDVQTSArMDIwMCwgV29sZnJhbSBTYW5nIHdyb3RlOgo+IE1vdmUgZnJvbSB0
aGUgZGVwcmVjYXRlZCBpMmNfbmV3X2R1bW15KCkgdG8gaTJjX25ld19kdW1teV9kZXZpY2UoKS4g
V2UKPiBub3cgZ2V0IGFuIEVSUlBUUiB3aGljaCB3ZSB1c2UgaW4gZXJyb3IgaGFuZGxpbmcuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVy
aW5nLmNvbT4KClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+Cgo+IC0tLQo+IAo+IFJlYmFzZWQgdG8gdjUuNC1yYzIgc2luY2Ug
bGFzdCB0aW1lLiBPbmUgb2YgdGhlIGxhc3QgdHdvIHVzZXJzIG9mIHRoZQo+IG9sZCBBUEksIHNv
IHBsZWFzZSBhcHBseSBzb29uLCBzbyBJIGNhbiByZW1vdmUgdGhlIG9sZCBpbnRlcmZhY2UuIE9u
bHkKPiBidWlsZCB0ZXN0ZWQuCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgt
YW54Nzh4eC5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeC1hbng3OHh4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4
eHguYwo+IGluZGV4IDNjN2NjNWFmNzM1Yy4uYmU3NzU2MjgwZTQxIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMKPiBAQCAtMTM1MCwxMCArMTM1MCwxMCBA
QCBzdGF0aWMgaW50IGFueDc4eHhfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQs
Cj4gIAo+ICAJLyogTWFwIHNsYXZlIGFkZHJlc3NlcyBvZiBBTlg3ODE0ICovCj4gIAlmb3IgKGkg
PSAwOyBpIDwgSTJDX05VTV9BRERSRVNTRVM7IGkrKykgewo+IC0JCWFueDc4eHgtPmkyY19kdW1t
eVtpXSA9IGkyY19uZXdfZHVtbXkoY2xpZW50LT5hZGFwdGVyLAo+ICsJCWFueDc4eHgtPmkyY19k
dW1teVtpXSA9IGkyY19uZXdfZHVtbXlfZGV2aWNlKGNsaWVudC0+YWRhcHRlciwKPiAgCQkJCQkJ
YW54Nzh4eF9pMmNfYWRkcmVzc2VzW2ldID4+IDEpOwo+IC0JCWlmICghYW54Nzh4eC0+aTJjX2R1
bW15W2ldKSB7Cj4gLQkJCWVyciA9IC1FTk9NRU07Cj4gKwkJaWYgKElTX0VSUihhbng3OHh4LT5p
MmNfZHVtbXlbaV0pKSB7Cj4gKwkJCWVyciA9IFBUUl9FUlIoYW54Nzh4eC0+aTJjX2R1bW15W2ld
KTsKPiAgCQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gcmVzZXJ2ZSBJMkMgYnVzICUwMnhcbiIsCj4g
IAkJCQkgIGFueDc4eHhfaTJjX2FkZHJlc3Nlc1tpXSk7Cj4gIAkJCWdvdG8gZXJyX3VucmVnaXN0
ZXJfaTJjOwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
