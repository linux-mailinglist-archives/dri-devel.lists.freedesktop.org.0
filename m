Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A873244D0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 20:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4176E0C9;
	Wed, 24 Feb 2021 19:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA5A6E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 19:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=mK+T5LZEHxUksn3PjQrSRU0QW6w+r5cczZPe9bp7WQc=; b=ymChzcmZ4zZ45BLC9ht82keWKW
 TZOE9uyAotQdztvvzgsaOlE2jfJTL2HGpfDUcmKuHjVX1zvziS4fn6+tbdOOgWZYe0Fb0U7XNiJpd
 HHqGejZ/CSqYwqVjHJ+eeZcdO0Rf18cJlYPkMHr/KfYjIZRKA29QjN/wfkbBgNRjHLI0JBsWQOfxn
 WkxCs+0YtPRv64pO/h+s+xLF+vaZ/JMvBu+T+QgwuECIQD7/FwayU5kR5DtONXT4P/NjCx7eqp36K
 /x+x7e7PhAJdd8E7S6pONo+QFVq6HoCw6aW4sww42C9joDOmpJ6sOjBLmpgG9m5iGn28OFtLTAPrG
 Jj8d6J9A==;
Received: from [2601:1c0:6280:3f0::d05b]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF0K6-0002CE-7b; Wed, 24 Feb 2021 19:59:50 +0000
Subject: Re: [PATCH] fbdev: atyfb: add stubs for aty_{ld,st}_lcd()
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210222032853.21483-1-rdunlap@infradead.org>
 <YDPtYx1uU5Y4HNZ7@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7d416971-ae9b-52a8-bfba-79c2c920ec6c@infradead.org>
Date: Wed, 24 Feb 2021 11:59:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDPtYx1uU5Y4HNZ7@intel.com>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMi8yMi8yMSA5OjQ0IEFNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gU3VuLCBGZWIg
MjEsIDIwMjEgYXQgMDc6Mjg6NTNQTSAtMDgwMCwgUmFuZHkgRHVubGFwIHdyb3RlOgo+PiBGaXgg
YnVpbGQgZXJyb3JzIHdoZW4gdGhlc2UgZnVuY3Rpb25zIGFyZSBub3QgZGVmaW5lZC4KPj4KPj4g
Li4vZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jOiBJbiBmdW5jdGlvbiAnYXR5
X3Bvd2VyX21nbXQnOgo+PiAuLi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlmYl9iYXNlLmM6
MjAwMjo3OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ2F0eV9sZF9s
Y2QnOyBkaWQgeW91IG1lYW4gJ2F0eV9sZF84Jz8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24t
ZGVjbGFyYXRpb25dCj4+ICAyMDAyIHwgIHBtID0gYXR5X2xkX2xjZChQT1dFUl9NQU5BR0VNRU5U
LCBwYXIpOwo+PiAuLi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlmYl9iYXNlLmM6MjAwNDoy
OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ2F0eV9zdF9sY2QnOyBk
aWQgeW91IG1lYW4gJ2F0eV9zdF84Jz8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFy
YXRpb25dCj4+ICAyMDA0IHwgIGF0eV9zdF9sY2QoUE9XRVJfTUFOQUdFTUVOVCwgcG0sIHBhcik7
Cj4+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+
PiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4+IENjOiBs
aW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPj4gQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBz
YW1zdW5nLmNvbT4KPj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPj4gQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPj4gQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KPj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRl
bC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jIHwg
ICAgOSArKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPj4KPj4g
LS0tIGxpbnV4LW5leHQtMjAyMTAyMTkub3JpZy9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlm
Yl9iYXNlLmMKPj4gKysrIGxpbnV4LW5leHQtMjAyMTAyMTkvZHJpdmVycy92aWRlby9mYmRldi9h
dHkvYXR5ZmJfYmFzZS5jCj4+IEBAIC0xNzUsNiArMTc1LDE1IEBAIHUzMiBhdHlfbGRfbGNkKGlu
dCBpbmRleCwgY29uc3Qgc3RydWN0IGEKPj4gIAkJcmV0dXJuIGF0eV9sZF9sZTMyKExDRF9EQVRB
LCBwYXIpOwo+PiAgCX0KPj4gIH0KPj4gKyNlbHNlIC8qIGRlZmluZWQoQ09ORklHX1BNQUNfQkFD
S0xJR0hUKSB8fCBkZWZpbmVkKENPTkZJR19GQl9BVFlfQkFDS0xJR0hUKSBcCj4+ICsJIGRlZmlu
ZWQoQ09ORklHX0ZCX0FUWV9HRU5FUklDX0xDRCkgKi8KPiAKPiBBIGJldHRlciBmaXggd291bGQg
c2VlbSB0byBiZSB0byBpbmNsdWRlIHRoZXNlIGZ1bmN0aW9ucyBpZgo+IENPTkZJR19QUENfUE1B
QyBpcyBlbmFibGVkLiBPdGhlcndpc2UgdGhlIFBNIGNvZGUgd2lsbCBzdXJlbHkKPiBub3Qgd29y
ayBjb3JyZWN0bHkuIFRob3VnaCBJJ20gbm90IHN1cmUgaWYgdGhhdCBQUEMgUE0KPiBjb2RlIG1h
a2VzIGFueSBzZW5zZSB3L28gTENEL2JhY2tsaWdodCBzdXBwb3J0IGFueXdheS4KCkhpIFZpbGxl
LAoKSSB0cmllZCB0aGlzOgoKLSNpZiBkZWZpbmVkKENPTkZJR19QTUFDX0JBQ0tMSUdIVCkgfHwg
ZGVmaW5lZChDT05GSUdfRkJfQVRZX0dFTkVSSUNfTENEKSB8fCBcCi1kZWZpbmVkKENPTkZJR19G
Ql9BVFlfQkFDS0xJR0hUKQorI2lmIGRlZmluZWQoQ09ORklHX1BQQ19QTUFDKQoKaW4gYm90aCBh
dHlmYl9iYXNlLmMgYW5kIGF0eWZiLmgsIGJ1dCB0aGVuIHRoZXJlIGlzIGEgYnVpbGQgZXJyb3Ig
aW4KbWFjaDY0X2N0LmMgd2hlbiBQUENfUE1BQyBpcyBub3QgZW5hYmxlZCBidXQgRkJfQVRZX0dF
TkVSSUNfTENEIGlzIGVuYWJsZWQuClttYWNoNjRfY3QuYyBpcyB0aGUgb25seSBvdGhlciB1c2Vy
IG9mIGF0eV97bGQsc3R9X2xjZCgpXQoKb3IgZGlkIHlvdSBtZWFuIGFkZGluZyBDT05GSUdfUFBD
X1BNQUMgdG8gdGhhdCBsb25naXNoICNpZiBsaXN0PwoodGhhdCdzIG5vdCBob3cgSSB1bmRlcnN0
b29kIHlvdXIgY29tbWVudC4pCgoKSSdsbCBnbGFkbHkgc3RlcCBhd2F5IGFuZCBsZXQgeW91IHN1
Ym1pdCBwYXRjaGVzIGZvciB0aGlzLiA6KQoKPj4gK3ZvaWQgYXR5X3N0X2xjZChpbnQgaW5kZXgs
IHUzMiB2YWwsIGNvbnN0IHN0cnVjdCBhdHlmYl9wYXIgKnBhcikKPj4gK3sgfQo+PiArCj4+ICt1
MzIgYXR5X2xkX2xjZChpbnQgaW5kZXgsIGNvbnN0IHN0cnVjdCBhdHlmYl9wYXIgKnBhcikKPj4g
K3sKPj4gKwlyZXR1cm4gMDsKPj4gK30KPj4gICNlbmRpZiAvKiBkZWZpbmVkKENPTkZJR19QTUFD
X0JBQ0tMSUdIVCkgfHwgZGVmaW5lZCAoQ09ORklHX0ZCX0FUWV9HRU5FUklDX0xDRCkgKi8KPj4g
IAo+PiAgI2lmZGVmIENPTkZJR19GQl9BVFlfR0VORVJJQ19MQ0QKPj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgp0aGFua3MuCi0tIAp+UmFuZHkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
