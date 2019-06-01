Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B166A323AA
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2019 17:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEEF89711;
	Sun,  2 Jun 2019 15:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 383 seconds by postgrey-1.36 at gabe;
 Sun, 02 Jun 2019 00:00:05 UTC
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4FC4C89A62
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2019 00:00:05 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id D444327652;
 Sat,  1 Jun 2019 19:53:37 -0400 (EDT)
Date: Sun, 2 Jun 2019 09:53:47 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: Kangjie Lu <kjlu@umn.edu>
Subject: Re: [PATCH AUTOSEL 4.4 44/56] video: imsttfb: fix potential NULL
 pointer dereferences
In-Reply-To: <20190601161929.GA5028@kroah.com>
Message-ID: <alpine.LNX.2.21.1906020944570.8@nippy.intranet>
References: <20190601132600.27427-1-sashal@kernel.org>
 <20190601132600.27427-44-sashal@kernel.org> <20190601161929.GA5028@kroah.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 02 Jun 2019 15:00:55 +0000
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aditya Pakki <pakki001@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAxIEp1biAyMDE5LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cgo+IE9uIFNhdCwg
SnVuIDAxLCAyMDE5IGF0IDA5OjI1OjQ4QU0gLTA0MDAsIFNhc2hhIExldmluIHdyb3RlOgoKPiA+
IEZyb206IEthbmdqaWUgTHUgPGtqbHVAdW1uLmVkdT4KPiA+IAo+ID4gWyBVcHN0cmVhbSBjb21t
aXQgMWQ4NDM1M2QyMDVhOTUzZTIzODEwNDQ5NTNiN2ZhMzFjOGM5NzAyZCBdCj4gPiAuLi4KPiAK
PiBXaHkgb25seSA0LjQueT8gIFNob3VsZG4ndCB0aGlzIGJlIHF1ZXVlZCB1cCBmb3IgZXZlcnl0
aGluZyBvciBub25lPwo+IAo+IHRoYW5rcywKPiAKPiBncmVnIGstaAo+IAoKQWxzbywgd2h5IG5v
dCBjaGVjayB0aGUgcmVzdWx0IG9mIHRoZSBvdGhlciBpb3JlbWFwIGNhbGxzPyAoSSBzaG91bGQg
aGF2ZSAKY2hlY2tlZCB0aGF0IHdoZW4gdGhpcyBmaXJzdCBjcm9zc2VkIG15IGluYm94Li4uKQoK
RnJvbSAxZDg0MzUzZDIwNWE5NTNlMjM4MTA0NDk1M2I3ZmEzMWM4Yzk3MDJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYW5namllIEx1IDxramx1QHVtbi5lZHU+CkRhdGU6IE1vbiwg
MSBBcHIgMjAxOSAxNzo0Njo1OCArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIHZpZGVvOiBpbXN0dGZi
OiBmaXggcG90ZW50aWFsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZXMKCkluIGNhc2UgaW9yZW1h
cCBmYWlscywgdGhlIGZpeCByZWxlYXNlcyByZXNvdXJjZXMgYW5kIHJldHVybnMKLUVOT01FTSB0
byBhdm9pZCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2VzLgoKU2lnbmVkLW9mZi1ieTogS2FuZ2pp
ZSBMdSA8a2psdUB1bW4uZWR1PgpDYzogQWRpdHlhIFBha2tpIDxwYWtraTAwMUB1bW4uZWR1PgpD
YzogRmlubiBUaGFpbiA8ZnRoYWluQHRlbGVncmFwaGljcy5jb20uYXU+CkNjOiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4KW2Iuem9sbmllcmtpZTogbWlub3IgcGF0Y2ggc3VtbWFyeSBmaXh1cF0K
U2lnbmVkLW9mZi1ieTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNh
bXN1bmcuY29tPgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvaW1zdHRmYi5jIGIv
ZHJpdmVycy92aWRlby9mYmRldi9pbXN0dGZiLmMKaW5kZXggNGI5NjE1ZTRjZTc0Li4zNWJiYTNj
MjAzNmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvaW1zdHRmYi5jCisrKyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvaW1zdHRmYi5jCkBAIC0xNTE1LDYgKzE1MTUsMTEgQEAgc3RhdGlj
IGludCBpbXN0dGZiX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNp
X2RldmljZV9pZCAqZW50KQogCWluZm8tPmZpeC5zbWVtX3N0YXJ0ID0gYWRkcjsKIAlpbmZvLT5z
Y3JlZW5fYmFzZSA9IChfX3U4ICopaW9yZW1hcChhZGRyLCBwYXItPnJhbWRhYyA9PSBJQk0gPwog
CQkJCQkgICAgMHg0MDAwMDAgOiAweDgwMDAwMCk7CisJaWYgKCFpbmZvLT5zY3JlZW5fYmFzZSkg
eworCQlyZWxlYXNlX21lbV9yZWdpb24oYWRkciwgc2l6ZSk7CisJCWZyYW1lYnVmZmVyX3JlbGVh
c2UoaW5mbyk7CisJCXJldHVybiAtRU5PTUVNOworCX0KIAlpbmZvLT5maXgubW1pb19zdGFydCA9
IGFkZHIgKyAweDgwMDAwMDsKIAlwYXItPmRjX3JlZ3MgPSBpb3JlbWFwKGFkZHIgKyAweDgwMDAw
MCwgMHgxMDAwKTsKIAlwYXItPmNtYXBfcmVnc19waHlzID0gYWRkciArIDB4ODQwMDAwOwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
