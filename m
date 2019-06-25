Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C9355142
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 16:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C9F6E118;
	Tue, 25 Jun 2019 14:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9FF6E115
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:12:22 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hfmBE-0004Im-Hb; Tue, 25 Jun 2019 16:12:16 +0200
Message-ID: <1561471935.2587.11.camel@pengutronix.de>
Subject: Re: [PATCH] drm/amd/display: Use msleep instead of udelay for 8ms wait
From: Lucas Stach <l.stach@pengutronix.de>
To: Harry Wentland <harry.wentland@amd.com>, airlied@gmail.com, 
 natechancellor@gmail.com
Date: Tue, 25 Jun 2019 16:12:15 +0200
In-Reply-To: <20190625140046.31682-1-harry.wentland@amd.com>
References: <CAPM=9txaQ43GwOzXSE3prTRLbMt+ip=s_ssmFzWsfsTYdLssaw@mail.gmail.com>
 <20190625140046.31682-1-harry.wentland@amd.com>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: sunpeng.li@amd.com, Bhawanpreet.Lakha@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, Jun.Lei@amd.com, Anthony.Koo@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGFycnksCgpBbSBEaWVuc3RhZywgZGVuIDI1LjA2LjIwMTksIDEwOjAwIC0wNDAwIHNjaHJp
ZWIgSGFycnkgV2VudGxhbmQ6Cj4gYXJtMzIncyB1ZGVsYXkgb25seSBhbGxvd3MgdmFsdWVzIHVw
IHRvIDIwMDAgbWljcm9zZWNvbmRzLiBtc2xlZXAKPiBkb2VzIHRoZSB0cmljayBmb3IgdXMgaGVy
ZSBhcyB0aGVyZSBpcyBubyBwcm9ibGVtIGlmIHRoaXMgaXNuJ3QKPiBtaWNyb3NlY29uZCBhY2N1
cmF0ZSBhbmQgdGFrZXMgYSB0YWQgbG9uZ2VyLgoKQSAidGFkIiBsb25nZXIgaW4gdGhpcyBjYXNl
IG1lYW5zIGxpa2VseSBkb3VibGUgdGhlIGludGVuZGVkIHdhaXQuClBsZWFzZSBzZWUgIlNMRUVQ
SU5HIEZPUiB+VVNFQ1MgT1IgU01BTEwgTVNFQ1MgKCAxMHVzIC0gMjBtcykiIGluCkRvY3VtZW50
YXRpb24vdGltZXJzL3RpbWVycy1ob3d0by50eHQuCgpUaGUgc2xlZXAgaGVyZSBzaG91bGQgdXNl
IHVzbGVlcF9yYW5nZS4gSW4gZ2VuZXJhbCB0aGUgREMgY29kZSBzZWVtcyB0bwp1c2UgcXVpdGUg
YSBsb3Qgb2YgdGhlIHVkZWxheSBidXN5IHdhaXRzLiBJIGRvdWJ0IHRoYXQgbWFueSBvZiB0aG9z
ZQpvY2N1cnJlbmNlcyBhcmUgaW4gYXRvbWljIGNvbnRleHQsIHNvIGNvdWxkIGVhc2lseSB1c2Ug
YSBzbGVlcGluZyB3YWl0LgoKRGlnZ2luZyBmdXJ0aGVyIHRoaXMgc2VlbXMgdG8gYXBwbHkgYWNy
b3NzIGFtZGdwdSwgbm90IG9ubHkgREMuCgpSZWdhcmRzLApMdWNhcwoKPiBTaWduZWQtb2ZmLWJ5
OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiAtLS0KPiDCoGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyB8IDIgKy0KPiDCoDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKPiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwo+IGluZGV4IDRjMzE5MzBm
MWNkZi4uZjVkMDJmODliM2Y5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjX2xpbmsuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjX2xpbmsuYwo+IEBAIC01NDgsNyArNTQ4LDcgQEAgc3RhdGljIHZvaWQKPiBy
ZWFkX2VkcF9jdXJyZW50X2xpbmtfc2V0dGluZ3Nfb25fZGV0ZWN0KHN0cnVjdCBkY19saW5rICps
aW5rKQo+IMKgCQkJYnJlYWs7Cj4gwqAJCX0KPiDCoAo+IC0JCXVkZWxheSg4MDAwKTsKPiArCQlt
c2xlZXAoOCk7Cj4gwqAJfQo+IMKgCj4gwqAJQVNTRVJUKHN0YXR1cyA9PSBEQ19PSyk7Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
