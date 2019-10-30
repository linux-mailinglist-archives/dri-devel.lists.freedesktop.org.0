Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E25EAC3C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB706EDF0;
	Thu, 31 Oct 2019 09:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968216EADB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 16:39:27 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCymhdRVSmPRBIbFC67m67z0KUz0RNG8vGE966zI"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:2638:1d00:3142:f353:47a0:b4bd]
 by smtp.strato.de (RZmta 44.29.0 AUTH)
 with ESMTPSA id L09db3v9UGdC5Tu
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Wed, 30 Oct 2019 17:39:12 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191030161604.GA5610@atomide.com>
Date: Wed, 30 Oct 2019 17:39:11 +0100
Message-Id: <61AAD023-6B22-4F81-A3B3-7C9571F967B2@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
 <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
 <20191030161604.GA5610@atomide.com>
To: Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1572453564; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Dn40tVbbGhA5NczjSxQCCaGadlXd23pRkpE7OM8NH5A=;
 b=er9as+rXVS5rS5M0kWzytMtmAH1qM3Gbg8JBTy8RoLe0CvfcN/bWHvvqxLbrpx945+
 Cn6oM02/uNiY7SnXFNjrrt4BcqHiRTRDNlH4ahi3nlu6Zy0VfUz+LcVY9nnb3amSEX6h
 iUiVX8hTMM/GNZXWIKoaoYv2DggN34XBAS1MufAlHB0D0+KsU2UrkRnJRClf4EnTXGRz
 GbgnvBvWWhU7kxLYaPmY9OOom5GozEsCMbB97Y2se+cTWo14wP2uPeO4tNVSefnBbHOR
 5jzuAUgUvNipMOUKSTC2WIR4ORyK//DnSphYDqABYRCkL//QyZqU+WCZlkEsbYsdsL+L
 kSXw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 letux-kernel@openphoenux.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgo+IEFtIDMwLjEwLjIwMTkgdW0gMTc6MTYgc2NocmllYiBUb255IExpbmRncmVuIDx0b255
QGF0b21pZGUuY29tPjoKPiAKPiAqIEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNv
LmNvbT4gWzE5MTAxOCAxODo0N106Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9pbWcscHZyc2d4LnR4dAo+PiBAQCAtMCwwICsx
LDc2IEBACj4+ICtJbWFnaW5hdGlvbiBQVlIvU0dYIEdQVQo+PiArCj4+ICtPbmx5IHRoZSBJbWFn
aW5hdGlvbiBTR1g1MzAsIFNHWDU0MCBhbmQgU0dYNTQ0IEdQVXMgYXJlIGN1cnJlbnRseSBjb3Zl
cmVkIGJ5IHRoaXMgYmluZGluZy4KPj4gKwo+PiArUmVxdWlyZWQgcHJvcGVydGllczoKPj4gKy0g
Y29tcGF0aWJsZToJU2hvdWxkIGJlIG9uZSBvZgo+PiArCQkiaW1nLHNneDUzMC0xMjEiLCAiaW1n
LHNneDUzMCIsICJ0aSxvbWFwLW9tYXAzLXNneDUzMC0xMjEiOwo+PiArCQkgIC0gQmVhZ2xlQm9h
cmQgQUJDLCBPcGVuUGFuZG9yYSA2MDBNSHoKPj4gKwkJImltZyxzZ3g1MzAtMTI1IiwgImltZyxz
Z3g1MzAiLCAidGksb21hcC1vbWFwMy1zZ3g1MzAtMTI1IjsKPj4gKwkJICAtIEJlYWdsZUJvYXJk
IFhNLCBHVEEwNCwgT3BlblBhbmRvcmEgMUdIego+PiArCQkiaW1nLHNneDUzMC0xMjUiLCAiaW1n
LHNneDUzMCIsICJ0aSxvbWFwLWFtMzUxNy1zZ3g1MzAtMTI1IjsKPj4gKwkJImltZyxzZ3g1MzAt
MTI1IiwgImltZyxzZ3g1MzAiLCAidGksb21hcC1hbTMzNXgtc2d4NTMwLTEyNSI7Cj4+ICsJCSAg
LSBCZWFnbGVCb25lIEJsYWNrCj4+ICsJCSJpbWcsc2d4NTQwLTEyMCIsICJpbWcsc2d4NTQwIiwg
InRpLG9tYXAtb21hcDQtc2d4NTQwLTEyMCI7Cj4+ICsJCSAgLSBQYW5kYWJvYXJkIChFUykKPj4g
KwkJImltZyxzZ3g1NDQtMTEyIiwgImltZyxzZ3g1NDQiLCAidGksb21hcC1vbWFwNC1zZ3g1NDQt
MTEyIjsKPj4gKwkJImltZyxzZ3g1NDQtMTE2IiwgImltZyxzZ3g1NDQiLCAidGksb21hcC1vbWFw
NS1zZ3g1NDQtMTE2IjsKPj4gKwkJICAtIE9NQVA1IFVFVk0sIFB5cmEgSGFuZGhlbGQKPj4gKwkJ
ImltZyxzZ3g1NDQtMTE2IiwgImltZyxzZ3g1NDQiLCAidGksb21hcC1kcmE3LXNneDU0NC0xMTYi
Owo+IAo+IEZZSSwgdGhlIGNvbXBhdGlibGUgbmFtZXMgYWJvdmUgaGF2ZSB1bm5lY2Vzc2FyeSBv
bWFwIGluIHRoZW06Cj4gCj4gInRpLG9tYXAtb21hcDMtc2d4NTMwLTEyMSIgc2hvdWxkIGJlICJ0
aSxvbWFwMy1zZ3g1MzAtMTIxIgo+ICJ0aSxvbWFwLWFtMzM1eC1zZ3g1MzAtMTI1IiBzaG91bGQg
YmUgInRpLGFtMzM1eC1zZ3g1MzAtMTI1IjsKPiAidGksb21hcC1kcmE3LXNneDU0NC0xMTYiIHNo
b3VsZCBiZSAidGksZHJhNy1zZ3g1NDQtMTE2Igo+IAo+IEFuZCBzbyBvbi4KClllcywKUm9iIGFs
cmVhZHkgbm90ZWQgYSB3aGlsZSBhZ28gYW5kIG91ciBsYXRlc3QgcHJpdmF0ZSBjb2RlIGhhcyBp
dCBmaXhlZC4KClRoZXJlIGlzIG5vIHByb2dyZXNzIHRvd2FyZHMgYSB2MiBzaW5jZSBJIGFtIHN0
aWxsIGZpZ2h0aW5nIHdpdGggdGhlIG5ldwp5YW1sIGZvcm1hdCBoZSBhbHNvIHJlcXVlc3RlZC4u
LgoKQlIgYW5kIHRoYW5rcywKTmlrb2xhdXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
