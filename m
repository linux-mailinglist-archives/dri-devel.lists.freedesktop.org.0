Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A468157D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 11:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D74E89A76;
	Mon,  5 Aug 2019 09:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9BE89A76
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:31:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31C952F9;
 Mon,  5 Aug 2019 11:31:09 +0200 (CEST)
Date: Mon, 5 Aug 2019 12:31:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/bridge/megachips: Drop GPIO header
Message-ID: <20190805093107.GA29747@pendragon.ideasonboard.com>
References: <20190708112803.12432-1-linus.walleij@linaro.org>
 <CACRpkdYYmVjBV+gjiPfjzGUeP-8w+E8AV392ed2Y8cF6AeNPBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYYmVjBV+gjiPfjzGUeP-8w+E8AV392ed2Y8cF6AeNPBg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564997469;
 bh=3L4P8bwTICFDVJUYHxZKRYFxvZI7y+nyg/DYTg/Zqt0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vJC4GUSVV3OcvZ1IDdjWPw85VF60SZm1IMmNq/y+yaim6kyNUnDaBvMJ1uYEfbZ8p
 Ef0uB3PkJFWI55iUQmoKV4CRjJITDK2eIy549NQuOgtmWcM+g6fALbk6yRbo8a7Cf+
 4jrsB0uin7RoRor1dtu1xo7iZ1L68N+JHgc4fIRc=
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMsCgpPbiBNb24sIEF1ZyAwNSwgMjAxOSBhdCAxMTowNTo1NUFNICswMjAwLCBMaW51
cyBXYWxsZWlqIHdyb3RlOgo+IE9uIE1vbiwgSnVsIDgsIDIwMTkgYXQgMToyOCBQTSBMaW51cyBX
YWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+IAo+ID4gVGhpcyBmaWxl
IGlzbid0IHVzaW5nIGFueSBpbnRlcmZhY2VzIGZyb20gPGxpbnV4L2dwaW8uaD4gc28KPiA+IGp1
c3QgZHJvcCB0aGUgaW5jbHVkZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gCj4gU28gd2hhdCBkbyBJIGRvIHdpdGggdGhl
c2Ugc2ltcGxlIHBhdGNoZXMgYXMgbm9vbmUgc2VlbXMgdG8KPiBBQ0sgb3IgcmV2aWV3IHRoZW0g
Zm9yIGEgbW9udGg/Cj4gCj4gSSBndWVzcyBhcyBsYXN0IHJlc29ydCBzaW1wbHkgYXBwbHkgdGhl
bSB0byB0aGUgR1BJTyB0cmVlLCBidXQKPiBoZXkuCgpUaGV5IGhhdmUgYSB0ZW5kZW5jeSB0byBz
bGlwIHRocm91Z2ggdGhlIGNyYWNrcyA6LVMgT25lIHBpbmcgaXMKc29tZXRpbWVzIGFsbCBpdCB0
YWtlcyB0aG91Z2g6CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPgoKQnV0IGlmIGEgcGluZyBkb2Vzbid0IGhlbHAgSSB0aGlu
ayB5b3UgY2FuIGp1c3QgYXBwbHkgdGhlbSAoYWx0aG91Z2gKcHJvYmFibHkgdG8gdGhlIGRybS1t
aXNjIHRyZWUgaW4gdGhpcyBjYXNlLCB0byBtaW5pbWlzZSB0aGUgcmlzayBvZgpjb25mbGljdHMs
IGV2ZW50IGlmIHRoZXkncmUgcXVpdGUgdW5saWtlbHkpLgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50
IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
