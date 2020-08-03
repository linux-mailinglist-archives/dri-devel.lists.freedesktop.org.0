Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCF123A0E2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204086E214;
	Mon,  3 Aug 2020 08:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5250B6E20D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 06:52:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id E53E63ACB7A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 06:47:11 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AB251FF804;
 Mon,  3 Aug 2020 06:46:46 +0000 (UTC)
Date: Mon, 3 Aug 2020 08:46:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/rockchip: lvds: ensure ret is assigned before
 checking for an error
Message-ID: <20200803084645.442b5178@xps13>
In-Reply-To: <20200714190003.744069-1-colin.king@canonical.com>
References: <20200714190003.744069-1-colin.king@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlIG9uIFR1
ZSwgMTQgSnVsIDIwMjAKMjA6MDA6MDMgKzAxMDA6Cgo+IEZyb206IENvbGluIElhbiBLaW5nIDxj
b2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gQ3VycmVudGx5IHRoZXJlIGFyZSB0d28gcGxh
Y2VzIHdoZXJlIHRoZSByZXR1cm4gc3RhdHVzIGluIHJldCBpcyBiZWluZwo+IGNoZWNrZWQgZm9y
IGFuIGVycm9yIGhvd2V2ZXIgdGhlIGFzc2lnbm1lbnQgb2YgcmV0IGhhcyBiZWVuIG9taXR0ZWQK
PiBtYWtpbmcgdGhlIGNoZWNrcyByZWR1bmRhbnQuICBGaXggdGhpcyBieSBhZGRpbmcgaW4gdGhl
IG1pc3NpbmcgYXNzaWdubWVudHMKPiBvZiByZXQuCj4gCj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAo
IkxvZ2ljYWxseSBkZWFkIGNvZGUiKQo+IEZpeGVzOiBjY2ExNzA1YzNkODkgKCJkcm0vcm9ja2No
aXA6IGx2ZHM6IEFkZCBQWDMwIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBL
aW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9yb2NrY2hpcF9sdmRzLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9sdmRzLmMKPiBpbmRleCA2M2Y5Njc5MDJjMmQuLmI0NWM2MThiOTc5MyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfbHZkcy5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2x2ZHMuYwo+IEBAIC00OTksMTEgKzQ5
OSwxMSBAQCBzdGF0aWMgaW50IHB4MzBfbHZkc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2LAo+ICAJaWYgKElTX0VSUihsdmRzLT5kcGh5KSkKPiAgCQlyZXR1cm4gUFRSX0VSUihs
dmRzLT5kcGh5KTsKPiAgCj4gLQlwaHlfaW5pdChsdmRzLT5kcGh5KTsKPiArCXJldCA9IHBoeV9p
bml0KGx2ZHMtPmRwaHkpOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAtCXBo
eV9zZXRfbW9kZShsdmRzLT5kcGh5LCBQSFlfTU9ERV9MVkRTKTsKPiArCXJldCA9IHBoeV9zZXRf
bW9kZShsdmRzLT5kcGh5LCBQSFlfTU9ERV9MVkRTKTsKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJu
IHJldDsKPiAgCgpJIHRob3VnaHQgSSAob3IgSGVpa28pIGFscmVhZHkgc2VudCBhIHBhdGNoIGZv
ciB0aGF0IGJ1dCBhcHBhcmVudGx5Cm5vdC4uLgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
