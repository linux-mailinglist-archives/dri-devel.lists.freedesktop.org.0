Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2038B39D71
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 13:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C76890EA;
	Sat,  8 Jun 2019 11:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DD0890EA
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 11:40:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F32632DF;
 Sat,  8 Jun 2019 13:40:50 +0200 (CEST)
Date: Sat, 8 Jun 2019 14:40:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 02/34] gpu: drm: bridge: sii9234: simplify getting the
 adapter of a client
Message-ID: <20190608114036.GA4786@pendragon.ideasonboard.com>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190608105619.593-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559994051;
 bh=2pD/DWAV/LFT+GMwf8BuOm6cuztabrBNEg4O9KboG8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZQCx1eiCDJiWj9weXrSR2mt+eVr3vMSmKr2JRXMhLvVr438Kc+9jHmqwr3hqpPEzh
 jyFH/ONeVdRwsAoxiudegAlKmQqfgG4kZCPympvF3msG9Cs4AnrhrJ5GR1XmJDOs7B
 2F+v2IOoHqOBsFh4io/wy3pBapDdqhdLu33dh1RE=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgV29sZnJhbSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gU2F0LCBKdW4gMDgsIDIw
MTkgYXQgMTI6NTU6NDFQTSArMDIwMCwgV29sZnJhbSBTYW5nIHdyb3RlOgo+IFdlIGhhdmUgYSBk
ZWRpY2F0ZWQgcG9pbnRlciBmb3IgdGhhdCwgc28gdXNlIGl0LiBNdWNoIGVhc2llciB0byByZWFk
IGFuZAo+IGxlc3MgY29tcHV0YXRpb24gaW52b2x2ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogV29s
ZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4KClJldmlld2VkLWJ5
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cgo+
IC0tLQo+IAo+IFBsZWFzZSBhcHBseSB0byB5b3VyIHN1YnN5c3RlbSB0cmVlLgo+IAo+ICBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkyMzQuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3NpaTkyMzQuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIz
NC5jCj4gaW5kZXggYjM2YmJhZmIwZTQzLi4yNWQ0YWQ4YzdhZDYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MjM0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3NpaTkyMzQuYwo+IEBAIC04MTUsNyArODE1LDcgQEAgc3RhdGljIGlycXJldHVybl90IHNp
aTkyMzRfaXJxX3RocmVhZChpbnQgaXJxLCB2b2lkICpkYXRhKQo+ICBzdGF0aWMgaW50IHNpaTky
MzRfaW5pdF9yZXNvdXJjZXMoc3RydWN0IHNpaTkyMzQgKmN0eCwKPiAgCQkJCSAgc3RydWN0IGky
Y19jbGllbnQgKmNsaWVudCkKPiAgewo+IC0Jc3RydWN0IGkyY19hZGFwdGVyICphZGFwdGVyID0g
dG9faTJjX2FkYXB0ZXIoY2xpZW50LT5kZXYucGFyZW50KTsKPiArCXN0cnVjdCBpMmNfYWRhcHRl
ciAqYWRhcHRlciA9IGNsaWVudC0+YWRhcHRlcjsKPiAgCWludCByZXQ7Cj4gIAo+ICAJaWYgKCFj
dHgtPmRldi0+b2Zfbm9kZSkgewo+IEBAIC04OTcsNyArODk3LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIHNpaTkyMzRfYnJpZGdlX2Z1bmNzID0gewo+ICBzdGF0aWMg
aW50IHNpaTkyMzRfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPiAgCQkJIGNvbnN0
IHN0cnVjdCBpMmNfZGV2aWNlX2lkICppZCkKPiAgewo+IC0Jc3RydWN0IGkyY19hZGFwdGVyICph
ZGFwdGVyID0gdG9faTJjX2FkYXB0ZXIoY2xpZW50LT5kZXYucGFyZW50KTsKPiArCXN0cnVjdCBp
MmNfYWRhcHRlciAqYWRhcHRlciA9IGNsaWVudC0+YWRhcHRlcjsKPiAgCXN0cnVjdCBzaWk5MjM0
ICpjdHg7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50LT5kZXY7Cj4gIAlpbnQgcmV0
OwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
