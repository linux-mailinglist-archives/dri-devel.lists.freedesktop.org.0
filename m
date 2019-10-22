Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E78E13CF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3418F6E9BE;
	Wed, 23 Oct 2019 08:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD7E6E870
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 16:14:54 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zswDWtng=="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
 by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
 with ESMTPSA id R0b2a8v9MGEcRpL
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Tue, 22 Oct 2019 18:14:38 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191022153650.GL5610@atomide.com>
Date: Tue, 22 Oct 2019 18:14:38 +0200
Message-Id: <8FCDC0F6-7734-4629-9646-7BEED89FEF25@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
 <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
 <CAL_Jsq+obsTSU3iP1wm_3-FsAJ4Mxiz0NbMY1_h5NeFn67Sj+A@mail.gmail.com>
 <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com>
 <20191021172557.GB5610@atomide.com>
 <C6CD5A50-7F0A-4F56-ABB9-CAEDF7E47A5D@goldelico.com>
 <20191022150202.GJ5610@atomide.com>
 <CC62CE92-28DF-406E-B61C-22F8F341AAFB@goldelico.com>
 <20191022153650.GL5610@atomide.com>
To: Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1571760893; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=C/uw8S92wjbyOWAQk7FQIkAayZ1BGrYlPAf9Oil9cRE=;
 b=qnZ1frZpL+ak76sZFFc7PXI4gDeztHMf/7nxoF2HmumTdLVBRc+DudJaxHCZ8NRAsT
 x9QJB3Uw99WF6wIllJFV6agCd4+K6fvqBIhMf6UTgbz8wRCKbiOTHw/0HkPE7NrG9yz6
 RJt2pRpSI/AUyO4GLLqP57VAyW5PPjoOEwsBc/mR2p5rqaWiaHAet4dS+uncDY+iNKdd
 7Xify7xqtHfqT4iZT638W9ecOd/n9oHdRqSrswV5WkS0/V7ZGEGHknEeq0zyKWUugfsP
 kN8gfUOsdrJ9jnAczlHLOH3XKZj81jOAAP6zti7KaqxX9Q7G74I0Se022U+XC3U2AIGT
 jrJA==
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
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gQW0gMjIuMTAuMjAxOSB1bSAxNzozNiBzY2hyaWViIFRvbnkgTGluZGdyZW4gPHRvbnlAYXRv
bWlkZS5jb20+Ogo+IAo+ICogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29t
PiBbMTkxMDIyIDE1OjEyXToKPj4gSG0uIEhvdyBzaG91bGQgdGhhdCB3b3JrPyBTb21lIFNvQyBo
YXZlIHRoZSBzZ3g1NDQgYXMgc2luZ2xlCj4+IGNvcmUgYW5kIG90aGVycyBhcyBkdWFsIGNvcmUu
IFRoaXMgaW1obyBkb2VzIG5vdCBmaXQgaW50bwo+PiB0aGUgImltZyxzZ3g1NDQtJHJldmlzaW9u
IiBzY2hlbWUgd2hpY2ggY291bGQgYmUgbWF0Y2hlZCB0by4KPiAKPiBXZWxsIGRvbid0IHlvdSBo
YXZlIHRoZW4ganVzdCB0d28gc2VwYXJhdGUgY2hpbGQgbm9kZXMsCj4gb25lIGZvciBlYWNoIGNv
cmUgd2l0aCB0aGVpciBvd24gcmVnaXN0ZXIgcmFuZ2U/CgpEb2Vzbid0IGxvb2sgc28uIEFGQUlL
IHRoZSBhcmNoaXRlY3R1cmUgb2YgU0dYIGlzIHRoYXQgdGhlcmUKaXMgYSBzaW5nbGUgc2NoZWR1
bGVyIHdoaWNoIGlzIGFjY2Vzc2VkIGJ5IHRoZSByZWdpc3RlciByYW5nZQphbmQgaXQgaW50ZXJu
YWxseSBoYXMgY29udHJvbCBvdmVyIG11bHRpcGxlIGNvcmVzLgoKPiAKPiBUaGF0IGlzIGFzc3Vt
aW5nIHRoZXkncmUgcmVhbGx5IHNlcGFyYXRlIGluc3RhbmNlcy4uCgpOby4gVGhlcmUgaXMgc29t
ZSBpbnRlcm5hbCBtYWdpYyBpbiB0aGUgZHJpdmVyLiBJdCBqdXN0Cm5lZWRzIHRvIGtub3cgdGhh
dCB0aGVyZSBpcyBvbmUgb3IgdHdvIG5vZGVzLiBDdXJyZW50bHkKdGhpcyBpcyBoYW5kbGVkIGJ5
IHNvbWUgI2RlZmluZSBvcHRpb24gd2hlbiBjYWxsaW5nIHRoZQppbm5lciBNYWtlZmlsZS4KCk15
IGlkZWEgd2FzIHRvIHJlcGxhY2UgdGhlICNpZmRlZiBieSBjaGVja2luZyBmb3IgdGhlCmltZyxj
b3JlcyBwcm9wZXJ0eS4KCj4gCj4+IEJ1dCBtYXliZSB3ZSBkbyBpdCB0aGUgc2FtZSBhcyB3aXRo
IHRoZSB0aW1lciBmb3IgdGhlIG1vbWVudCwKPj4gaS5lLiBrZWVwIGl0IGluIHNvbWUgdW5wdWJs
aXNoZWQgcGF0Y2ggc2V0Lgo+IAo+IFllYWggbWFrZXMgc2Vuc2UgdG8gbWUgdW50aWwgdGhpbmdz
IGdldCBzb3J0ZWQgb3V0Lgo+IAo+PiBBdCB0aGUgbW9tZW50IEkgaGF2ZSBtb3JlIHByb2JsZW1z
IHVuZGVyc3RhbmRpbmcgaG93IHRoZSB5YW1sCj4+IHRoaW5nIHdvcmtzLiBJIHVuZGVyc3RhbmQg
YW5kIGZ1bGx5IHN1cHBvcnQgdGhlIG92ZXJhbGwgZ29hbCwKPj4gYnV0IGl0IGlzIHF1aXRlIGRp
ZmZpY3VsdCB0byBnZXQgYSBzdGFydCBoZXJlLiBBbmQgdGhlcmUgZG8gbm90Cj4+IHNlZW0gdG8g
YmUgdG9vbHMgb3Igc2NyaXB0cyB0byBoZWxwIGNvbnZlcnRpbmcgZnJvbSBvbGQgc3R5bGUKPj4g
dGV4dCBmb3JtYXQgKGV2ZW4gaWYgbm90IHBlcmZlY3QsIHRoaXMgd291bGQgYmUgaGVscGZ1bCkg
YW5kCj4+IEkgaGF2ZSBubyB5YW1sIGVkaXRvciB0aGF0IGhlbHBzIGtlZXBpbmcgdGhlIGluZGVu
dGF0aW9uCj4+IGNvcnJlY3QuIFNvIHRoaXMgc2xvd3MgZG93biBhIHYyIGEgbGl0dGxlIGJpdC4K
PiAKPiBTb3VuZHMgaGFuZHkgdG8gbWUgOikKPiAKPiBSZWdhcmRzLAo+IAo+IFRvbnkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
