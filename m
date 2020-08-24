Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 187CE2512F9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 09:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118B16E86F;
	Tue, 25 Aug 2020 07:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18626E2EA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 16:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1598285098;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=44G5k4PqReTpcTzOsjfyDkjHT7I4d52JZ0QyxF/Q4qw=;
 b=leKcpIbnIzCcRodjeJEyoD9f5/2okttImnmLn5k5f3yxKSXj4LZobvxvnVZI9vtnqR
 9xSg/ylcXnR2k22AQL1FFnovKwYfaSU6K4oKR3YJKqMwGvcbnBYwgrqIzSPOu4X0UXOB
 92lpXkQzISqkrclFVciWdXM07OR0VXxcc2fNOcgh4xu4btXCoE5aO3bLVlwHI5zvjWY4
 HiNZtSHFqKntopa5Rvl8SaJHKaoZlPUz/cB3Tb/19HGUDLHPaKeuXQolLh+ggfQY0T7I
 Phwe3zPTA5jR16hiEEI50KPIIVzlkcClQfMxr+/KKczbKV7MZy5Rs8emOrWJ4UPMfb6p
 MOFQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PtwDOpsF8="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id n03b0dw7OG4nNnY
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 24 Aug 2020 18:04:49 +0200 (CEST)
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic
 JZ4780)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAAEAJfBQRLKxaR_6HUi-Dvoc+_WC0JPJNGH5C0rz-yxhOwArdw@mail.gmail.com>
Date: Mon, 24 Aug 2020 18:04:48 +0200
Message-Id: <829D6884-D1F1-4197-B25C-F0DBF2F4AEA7@goldelico.com>
References: <1940005.XIBaf5lNV5@jeremy> <1857880.I5TKlsx52r@jason>
 <CAAEAJfDU=rvQ4aEAbBrveLigUjoYFGhLZJ7PsE_WpoOYxaDqdg@mail.gmail.com>
 <6531669.OW97vx6Khr@jason> <B8QFFQ.FVZD8SCWAWD51@crapouillou.net>
 <CAAEAJfBQRLKxaR_6HUi-Dvoc+_WC0JPJNGH5C0rz-yxhOwArdw@mail.gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Paul Boddie <paul@boddie.org.uk>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 25 Aug 2020 07:21:33 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRXplcXVpZWwsCgo+IEFtIDI0LjA4LjIwMjAgdW0gMTU6NDYgc2NocmllYiBFemVxdWllbCBH
YXJjaWEgPGV6ZXF1aWVsQHZhbmd1YXJkaWFzdXIuY29tLmFyPjoKPiAKPiBPbiBGcmksIDIxIEF1
ZyAyMDIwIGF0IDE5OjI0LCBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4gd3Jv
dGU6Cj4+IAo+PiAKPj4gCj4+IExlIHNhbS4gMjIgYW/Du3QgMjAyMCDDoCAwOjExLCBQYXVsIEJv
ZGRpZSA8cGF1bEBib2RkaWUub3JnLnVrPiBhCj4+IMOpY3JpdCA6Cj4+IAo+PiBJZiB5b3Ugc2Vu
ZCBjbGVhbiBwYXRjaGVzLCB0aGVyZSdzIG5vIHJlYXNvbiBmb3IgbWUgbm90IHRvIG1lcmdlIHRo
ZW0uCj4+IAo+IAo+IEknZCByZWFsbHkgbGlrZSB0byBzZWUgSERNSSBzdXBwb3J0IG9uIG15IENJ
MjAgYmVpbmcgbWVyZ2VkLiBUaGFuayB0bwo+IHJlY2VudCBpbmdlbmljLWRybSB3b3JrIGFuZCB0
aGFua3MgZm9yIFBhdWwgQm9kZGllIGFuZCBOaWtvbGF1cyB3b3JrLAo+IHRoZSBwYXRjaGVzIGFy
ZSBJTU8gcXVpdGUgY2xlYW4uCgpJIGhhdmUgZG9uZSBzb21lIHRlc3RpbmcgYW5kIGl0IGFwcGVh
cnMgdGhhdCBpdCBvbmx5IHdvcmtzIGlmIERSTSBpcwpjb21waWxlZCBpbnRvIHRoZSBrZXJuZWwu
IEF0IGxlYXN0IGluIG15IHNldHVwLiBJZiBEUk0gYW5kL29yIEhETUkgYXJlIG1hZGUKbW9kdWxl
cyB0aGVyZSBpcyBubyB2aWRlbyBvciBjb2RlIGRvZXNuJ3QgY29tcGlsZSBjb21wbGV0ZWx5LgoK
V2UgaGF2ZSB0byBhbmFseXNlIHRoYXQgZnVydGhlci4KCkFuZCBpdCBzZWVtcyB0byBkaWZmZXIg
c2lnbmlmaWNhbnRseSBmcm9tIHdoYXQgUGF1bCBoYXMgZGV2ZWxvcGVkIHJlY2VudGx5CnRvIG1h
a2UgaXQgd29yay4gSXQgc2VlbXMgdG8gYmUgcXVpdGUgbHVja3kgdGhhdCB3ZSBoYXZlIGEgd29y
a2luZyBzZXR1cCBub3cgOikKCj4gTmlrb2xhdXMsIFBhdWw6IERvIHlvdSBoYXZlIHBsYW5zIHRv
IHN1Ym1pdCB0aGVzZT8KClllcywgYXMgc29vbiBhcyB3ZSBhcmUgc3VyZSB0aGF0IGl0IHdvcmtz
IChhbmQgd2hlbiBpdCBkb2Vzbid0KS4KCkJ1dCB0aGFua3MgdG8geW91ciB3b3JrIGl0IGlzIG5v
dyBtdWNoIGVhc2llciB0byBpbXByb3ZlIHRoaW5ncywgc2luY2Ugd2UKYXJlIG5vIGxvbmdlciBs
b29raW5nIGZvciBhIGJyZWFrLXRocm91Z2ggYnV0IGp1c3QgaGF2ZSB0byBhdm9pZCByZWdyZXNz
aW9ucy4KCj4gSWYgbm90LCBJJ2xsIGJlIGhhcHB5IHRvIGdldCB0aGVtIG91dCB0aGUgZG9vciBm
b3IgcmV2aWV3LgoKTGV0IGl0IG1hdHVyZSBhIGxpdHRsZSBmaXJzdCBhbmQgaGF2ZSBpdCB0ZXN0
ZWQgb24gbW9yZSBzZXR1cHMgYW5kIHJlYmFzZWQKdG8gbWFpbmxpbmUgdjUuOS1yYzIgOikKCkJS
IGFuZCB0aGFua3MsCk5pa29sYXVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
