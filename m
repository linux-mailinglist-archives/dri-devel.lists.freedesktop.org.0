Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FD38B6F0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 13:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AB189F47;
	Tue, 13 Aug 2019 11:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188B189F47
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:32:18 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:51944)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hxV2D-0008RU-Hh; Tue, 13 Aug 2019 12:32:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hxV29-0007Sy-BL; Tue, 13 Aug 2019 12:32:09 +0100
Date: Tue, 13 Aug 2019 12:32:09 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Dariusz Marcinkiewicz <darekm@google.com>
Subject: Re: [PATCH v6 3/8] tda9950: use cec_notifier_cec_adap_(un)register
Message-ID: <20190813113209.GF13294@shell.armlinux.org.uk>
References: <20190813110300.83025-1-darekm@google.com>
 <20190813110300.83025-4-darekm@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813110300.83025-4-darekm@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Cz0dhG8JlSQ8zGF79vjEHYxjSQnz3txKDT7QLmjLxw=; b=xiBNoaBz67Ngmks68l8gE5aH5
 zIsOBxAGr5sqkC5CdQ/z8Vbf11g0UU9hxKAeoBC2XdOqEHVza2pPKPC2gRpHrzSmVa5P0zsE63NYq
 uj74WAySYdSqhaW4PJyoDlO+cO/H/2Tt7y1+5yYLkDO1+PdWHQ/iBYmG6VI8nb9Y9swI2R+DBrTSZ
 yLoL91CwrTeOXy6Om9ZrLhDxUzrFTo3JF3mTUnHjj6diabS0izAT44mUggMhBcPnb4V4h54o5C1bP
 J+ozu2+DthD3z8XjCqcqEv1nQOfCorWHYk/0eWjzlz41yMWHMQDMtZeKMh5Jx3CvcdrUhL3dxH7xB
 OBABDGFWA==;
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, hverkuil-cisco@xs4all.nl,
 Colin Ian King <colin.king@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDE6MDI6MzVQTSArMDIwMCwgRGFyaXVzeiBNYXJjaW5r
aWV3aWN6IHdyb3RlOgo+IFVzZSB0aGUgbmV3IGNlY19ub3RpZmllcl9jZWNfYWRhcF8odW4pcmVn
aXN0ZXIoKSBmdW5jdGlvbnMgdG8KPiAodW4pcmVnaXN0ZXIgdGhlIG5vdGlmaWVyIGZvciB0aGUg
Q0VDIGFkYXB0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFyaXVzeiBNYXJjaW5raWV3aWN6IDxk
YXJla21AZ29vZ2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWls
LWNpc2NvQHhzNGFsbC5ubD4KPiBUZXN0ZWQtYnk6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lz
Y29AeHM0YWxsLm5sPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5NTAuYyB8IDEy
ICsrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5NTAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk1MC5jCj4gaW5kZXggODAzOWZjMGQ4M2RiNC4uYTVh
NzViZGViN2E1ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5NTAuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk1MC5jCj4gQEAgLTQyMCw3ICs0MjAsOCBA
QCBzdGF0aWMgaW50IHRkYTk5NTBfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPiAg
CQlwcml2LT5oZG1pID0gZ2x1ZS0+cGFyZW50Owo+ICAKPiAgCXByaXYtPmFkYXAgPSBjZWNfYWxs
b2NhdGVfYWRhcHRlcigmdGRhOTk1MF9jZWNfb3BzLCBwcml2LCAidGRhOTk1MCIsCj4gLQkJCQkJ
ICBDRUNfQ0FQX0RFRkFVTFRTLAo+ICsJCQkJCSAgQ0VDX0NBUF9ERUZBVUxUUyB8Cj4gKwkJCQkJ
ICBDRUNfQ0FQX0NPTk5FQ1RPUl9JTkZPLAo+ICAJCQkJCSAgQ0VDX01BWF9MT0dfQUREUlMpOwo+
ICAJaWYgKElTX0VSUihwcml2LT5hZGFwKSkKPiAgCQlyZXR1cm4gUFRSX0VSUihwcml2LT5hZGFw
KTsKPiBAQCAtNDU3LDEzICs0NTgsMTQgQEAgc3RhdGljIGludCB0ZGE5OTUwX3Byb2JlKHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQsCj4gIAlpZiAocmV0IDwgMCkKPiAgCQlyZXR1cm4gcmV0Owo+
ICAKPiAtCXByaXYtPm5vdGlmeSA9IGNlY19ub3RpZmllcl9nZXQocHJpdi0+aGRtaSk7Cj4gKwlw
cml2LT5ub3RpZnkgPSBjZWNfbm90aWZpZXJfY2VjX2FkYXBfcmVnaXN0ZXIocHJpdi0+aGRtaSwg
TlVMTCwKPiArCQkJCQkJICAgICAgcHJpdi0+YWRhcCk7Cj4gIAlpZiAoIXByaXYtPm5vdGlmeSkK
PiAgCQlyZXR1cm4gLUVOT01FTTsKPiAgCj4gIAlyZXQgPSBjZWNfcmVnaXN0ZXJfYWRhcHRlcihw
cml2LT5hZGFwLCBwcml2LT5oZG1pKTsKPiAgCWlmIChyZXQgPCAwKSB7Cj4gLQkJY2VjX25vdGlm
aWVyX3B1dChwcml2LT5ub3RpZnkpOwo+ICsJCWNlY19ub3RpZmllcl9jZWNfYWRhcF91bnJlZ2lz
dGVyKHByaXYtPm5vdGlmeSk7Cj4gIAkJcmV0dXJuIHJldDsKPiAgCX0KPiAgCj4gQEAgLTQ3Myw4
ICs0NzUsNiBAQCBzdGF0aWMgaW50IHRkYTk5NTBfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCwKPiAgCSAqLwo+ICAJZGV2bV9yZW1vdmVfYWN0aW9uKGRldiwgdGRhOTk1MF9jZWNfZGVs
LCBwcml2KTsKPiAgCj4gLQljZWNfcmVnaXN0ZXJfY2VjX25vdGlmaWVyKHByaXYtPmFkYXAsIHBy
aXYtPm5vdGlmeSk7Cj4gLQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gQEAgLTQ4Miw4ICs0ODIs
OCBAQCBzdGF0aWMgaW50IHRkYTk5NTBfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQp
Cj4gIHsKPiAgCXN0cnVjdCB0ZGE5OTUwX3ByaXYgKnByaXYgPSBpMmNfZ2V0X2NsaWVudGRhdGEo
Y2xpZW50KTsKPiAgCj4gKwljZWNfbm90aWZpZXJfY2VjX2FkYXBfdW5yZWdpc3Rlcihwcml2LT5u
b3RpZnkpOwo+ICAJY2VjX3VucmVnaXN0ZXJfYWRhcHRlcihwcml2LT5hZGFwKTsKPiAtCWNlY19u
b3RpZmllcl9wdXQocHJpdi0+bm90aWZ5KTsKCkl0IGxvb2tzIHdlaXJkIHRvIGhhdmUgYW4gdW5l
eHBlY3RlZGx5IGRpZmZlcmVudCBvcmRlcmluZyBvZgp1bnJlZ2lzdHJhdGlvbiBmcm9tIHRoZSBy
ZWdpc3RyYXRpb24gcGF0aCAtIG5vcm1hbGx5LCB1bnJlZ2lzdHJhdGlvbgppcyB0aGUgcmV2ZXJz
ZSBvcmRlciBvZiBpbml0aWFsaXNhdGlvbi4KCkluIHRoZSBpbml0aWFsaXNhdGlvbiBwYXRoLCBp
dCBzZWVtcyB0aGF0IHdlIHJlZ2lzdGVyIHRoZSBub3RpZmllcgphbmQgX3RoZW5fIHRoZSBhZGFw
dGVyLiAgSGVyZSwgd2UgdW5yZWdpc3RlciB0aGUgbm90aWZpZXIgYW5kIHRoZW4KdGhlIGFkYXB0
ZXIgcmF0aGVyIHRoYW4gd2hhdCB3b3VsZCBub3JtYWxseSBiZSBleHBlY3RlZC4gIFdoeSBpcwp0
aGlzPyAgSSBzdXNwZWN0IHRoZXJlIHdpbGwgYmUgZHJpdmVycyBjcmVhdGVkIHRoYXQgZG8gdGhp
cyB0aGUKIm5vcm1hbCIgd2F5IHJvdW5kLCBzbyBpZiB0aGlzIGlzIGEgcmVxdWlyZW1lbnQsIGl0
IG5lZWRzIHRvIGJlIG1hZGUKcGxhaW5seSBvYnZpb3VzLgoKPiAgCj4gIAlyZXR1cm4gMDsKPiAg
fQo+IC0tIAo+IDIuMjMuMC5yYzEuMTUzLmdkZWVkODAzMzBmLWdvb2cKPiAKPiAKCi0tIApSTUsn
cyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0
Y2hlcy8KRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBh
dCAxMi4xTWJwcyBkb3duIDYyMmticHMgdXAKQWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDEx
LjlNYnBzIGRvd24gNTAwa2JwcyB1cApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
