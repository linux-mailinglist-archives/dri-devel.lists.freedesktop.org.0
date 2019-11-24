Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE541089B2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1872A8926F;
	Mon, 25 Nov 2019 08:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B4F89D1D
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 17:59:25 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSfXA4NgJM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vAOHx8wih
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Sun, 24 Nov 2019 18:59:08 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v3 8/8] MIPS: DTS: jz4780: add sgx gpu node
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191124174837.GX35479@atomide.com>
Date: Sun, 24 Nov 2019 18:59:07 +0100
Message-Id: <FA810F13-BF2A-4849-9BAA-01FA2F768976@goldelico.com>
References: <cover.1574595627.git.hns@goldelico.com>
 <c73e2cee4f818654f264b0b7b5458bfaa0ac6a7a.1574595627.git.hns@goldelico.com>
 <1574600246.3.0@crapouillou.net> <20191124174837.GX35479@atomide.com>
To: Tony Lindgren <tony@atomide.com>,
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574618363; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=4Mtvhb9VEGOidBuJ+//uKm9nDMQCGArvHFXBCr1aqTg=;
 b=i9dz9maatGrZBjO1GZ21Ra8XXV3oxXpd31o8MioWwi+a2ENvMEYbK2QbcWk9usmnGT
 J2jNljNsejY2+kqK3Wp8aErR7K+OLMDSdAHza4JF07zJaAwWCzSOXeQvGGrkq1cMIGwD
 B/iptD2YJ2bk7vzeRB8too4pCyNqmqxbhu++4suzpVWnHG+RsKkrow5Zb6s7fAmN1Lq5
 VuFUI2w0nvIYQ7C1DGgrdTWLU+WvwTSGxCeHwCS/pKMbYEEKxDcrru0dv60GaIrAixgM
 v7D95dRq6y3AGsdg0f3yaCg454rXe8ci5HZM2jTs+SSq/gVyaIRr540iYwigeC99ECQe
 Co5Q==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Burton <paulburton@kernel.org>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Paul Boddie <paul@boddie.org.uk>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bCwgVG9ueSwKCj4gQW0gMjQuMTEuMjAxOSB1bSAxODo0OCBzY2hyaWViIFRvbnkgTGlu
ZGdyZW4gPHRvbnlAYXRvbWlkZS5jb20+Ogo+IAo+ICogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFw
b3VpbGxvdS5uZXQ+IFsxOTExMjQgMTI6NThdOgo+PiBMZSBkaW0uLCBub3YuIDI0LCAyMDE5IGF0
IDEyOjQwLCBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+IGEKPj4gw6lj
cml0IDoKPj4+IGFuZCBhZGQgaW50ZXJydXB0IGFuZCBjbG9ja3MuCj4gLi4uCj4+PiAtLS0gYS9h
cmNoL21pcHMvYm9vdC9kdHMvaW5nZW5pYy9qejQ3ODAuZHRzaQo+Pj4gKysrIGIvYXJjaC9taXBz
L2Jvb3QvZHRzL2luZ2VuaWMvano0NzgwLmR0c2kKPj4+IEBAIC00Niw2ICs0NiwxNyBAQAo+Pj4g
CQkjY2xvY2stY2VsbHMgPSA8MT47Cj4+PiAJfTsKPj4+IAo+Pj4gKwlncHU6IGdwdUAxMzA0MDAw
MCB7Cj4+IAo+PiBXZSB0cnkgdG8ga2VlcCB0aGUgbm9kZXMgb3JkZXJlZCBieSBhZGRyZXNzLCBj
b3VsZCB5b3UgbW92ZSB0aGlzIG5vZGUgd2hlcmUKPj4gaXQgYmVsb25ncz8KPiAuLi4KClllcywg
SSBoYXZlIG5vdGVkLgoKPiAKPj4+ICsJCWNvbXBhdGlibGUgPSAiaW5nZW5pYyxqejQ3ODAtc2d4
NTQwLTEyMCIsICJpbWcsc2d4NTQwLTEyMCIsCj4+PiAiaW1nLHNneDU0MCIsICJpbWcsc2d4NSI7
Cj4+PiArCQlyZWcgPSA8MHgxMzA0MDAwMCAweDQwMDA+Owo+Pj4gKwo+Pj4gKwkJY2xvY2tzID0g
PCZjZ3UgSlo0NzgwX0NMS19HUFU+Owo+Pj4gKwkJY2xvY2stbmFtZXMgPSAiZ3B1IjsKPiAKPiBK
dXN0IGNoZWNraW5nLi4gSXMgdGhlcmUgc29tZXRoaW5nIGVsc2UgdG8gY29uZmlndXJlIGhlcmUK
PiBwb3RlbnRpYWxseSBpbiBhZGRpdGlvbiB0byB0aGUgY2xvY2tzPwoKSXQgZG9lc24ndCBsb29r
IHNvLiBVbmZvcnR1YW50ZWx5IHRoZXJlIGlzbid0IG11Y2ggaW5mb3JtYXRpb24KZXhjZXB0IGEg
djMuMTgga2VybmVsIHN1cHBvcnRlZCBieSB0aGUgdmVuZG9yIGFuZCB0aGF0IG9uZSBhbHNvCmp1
c3QgaGFzIGEgZ3B1IG5vZGUgd2l0aCBjbG9jayBjb250cm9sLgoKPiBUaGF0IGlzLCBkbyB3ZSBu
ZWVkIHRvIGRvIHNvbWUgaW50ZXJjb25uZWN0IHNwZWNpZmljCj4gY29uZmlndXJhdGlvbiBldGMg
aW4gYWRkaXRpb24gdG8gdGhlIGNsb2NrcyB0byBoYXZlCj4gcnVudGltZSBQTSB3b3JrIGZvciBl
bmFibGluZyBhbmQgZGlzYWJsaW5nIHNneCBvbgo+IGp6NDc4MD8KCkkgdGhpbmsgd2UgaGF2ZSB0
byBsZWF2ZSB0aGF0IG9wZW4gZm9yIGZ1cnRoZXIgc3R1ZHkuCgpCUiwKTmlrb2xhdXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
