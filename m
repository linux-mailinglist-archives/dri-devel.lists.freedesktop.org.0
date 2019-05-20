Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD5C265E9
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD5E89AEA;
	Wed, 22 May 2019 14:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1007 seconds by postgrey-1.36 at gabe;
 Mon, 20 May 2019 15:49:11 UTC
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CE889178
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 15:49:11 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSkGy-0000J5-UT; Mon, 20 May 2019 15:32:21 +0000
Subject: Re: linux-next: Tree for May 20 (amdgpu)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20190520115530.46cf100d@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9e9c29f2-bb6e-572e-5486-7ddde2982ba0@infradead.org>
Date: Mon, 20 May 2019 08:32:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520115530.46cf100d@canb.auug.org.au>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jKdrdCTZgDXkXxUUja9CogRGjradAVpD3DVJ1Pki/4I=; b=aCs7wcUoxJB8THDFLmuZN/+csc
 5NGo+6Hhw0XMmUbANSxQ7NJU2gfKmJHnzo44SwBSayzJeCPWccr8FscvvREcDy1WjOGho6C2htYE+
 mIxTx79sMlV//glSG7G9LDo/4SFf6NpH9ECirOYqMWXAAgULqtthi9lseEemVvXaWNXSeTU63aDYR
 2iRbTBZQVAplgi2JJdiEiDIdxlwgGj2kC+PZckcbpRI6eWrCKo6P30LxYKl2vuiqOhkmn06iObX01
 AWPdB8eTatr1a4x0fGuHHLzgjlEt7r4TiCZqnpq9jbXFBZJOoOCCjHe9MnLEGfnuPPRrseTfLA+DU
 veo0VVig==;
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8xOS8xOSA2OjU1IFBNLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOgo+IEhpIGFsbCwKPiAK
PiBDaGFuZ2VzIHNpbmNlIDIwMTkwNTE3Ogo+IAo+IE5vbi1tZXJnZSBjb21taXRzIChyZWxhdGl2
ZSB0byBMaW51cycgdHJlZSk6IDU1Mwo+ICA1MTkgZmlsZXMgY2hhbmdlZCwgMTE3MjMgaW5zZXJ0
aW9ucygrKSwgMzM5NiBkZWxldGlvbnMoLSkKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4g
SSBoYXZlIGNyZWF0ZWQgdG9kYXkncyBsaW51eC1uZXh0IHRyZWUgYXQKPiBnaXQ6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdAo+IChw
YXRjaGVzIGF0IGh0dHA6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL25leHQvICku
ICBJZiB5b3UKPiBhcmUgdHJhY2tpbmcgdGhlIGxpbnV4LW5leHQgdHJlZSB1c2luZyBnaXQsIHlv
dSBzaG91bGQgbm90IHVzZSAiZ2l0IHB1bGwiCj4gdG8gZG8gc28gYXMgdGhhdCB3aWxsIHRyeSB0
byBtZXJnZSB0aGUgbmV3IGxpbnV4LW5leHQgcmVsZWFzZSB3aXRoIHRoZQo+IG9sZCBvbmUuICBZ
b3Ugc2hvdWxkIHVzZSAiZ2l0IGZldGNoIiBhbmQgY2hlY2tvdXQgb3IgcmVzZXQgdG8gdGhlIG5l
dwo+IG1hc3Rlci4KPiAKPiBZb3UgY2FuIHNlZSB3aGljaCB0cmVlcyBoYXZlIGJlZW4gaW5jbHVk
ZWQgYnkgbG9va2luZyBpbiB0aGUgTmV4dC9UcmVlcwo+IGZpbGUgaW4gdGhlIHNvdXJjZS4gIFRo
ZXJlIGFyZSBhbHNvIHF1aWx0LWltcG9ydC5sb2cgYW5kIG1lcmdlLmxvZwo+IGZpbGVzIGluIHRo
ZSBOZXh0IGRpcmVjdG9yeS4gIEJldHdlZW4gZWFjaCBtZXJnZSwgdGhlIHRyZWUgd2FzIGJ1aWx0
Cj4gd2l0aCBhIHBwYzY0X2RlZmNvbmZpZyBmb3IgcG93ZXJwYywgYW4gYWxsbW9kY29uZmlnIGZv
ciB4ODZfNjQsIGEKPiBtdWx0aV92N19kZWZjb25maWcgZm9yIGFybSBhbmQgYSBuYXRpdmUgYnVp
bGQgb2YgdG9vbHMvcGVyZi4gQWZ0ZXIKPiB0aGUgZmluYWwgZml4dXBzIChpZiBhbnkpLCBJIGRv
IGFuIHg4Nl82NCBtb2R1bGVzX2luc3RhbGwgZm9sbG93ZWQgYnkKPiBidWlsZHMgZm9yIHg4Nl82
NCBhbGxub2NvbmZpZywgcG93ZXJwYyBhbGxub2NvbmZpZyAoMzIgYW5kIDY0IGJpdCksCj4gcHBj
NDR4X2RlZmNvbmZpZywgYWxseWVzY29uZmlnIGFuZCBwc2VyaWVzX2xlX2RlZmNvbmZpZyBhbmQg
aTM4Niwgc3BhcmMKPiBhbmQgc3BhcmM2NCBkZWZjb25maWcuIEFuZCBmaW5hbGx5LCBhIHNpbXBs
ZSBib290IHRlc3Qgb2YgdGhlIHBvd2VycGMKPiBwc2VyaWVzX2xlX2RlZmNvbmZpZyBrZXJuZWwg
aW4gcWVtdSAod2l0aCBhbmQgd2l0aG91dCBrdm0gZW5hYmxlZCkuCj4gCj4gQmVsb3cgaXMgYSBz
dW1tYXJ5IG9mIHRoZSBzdGF0ZSBvZiB0aGUgbWVyZ2UuCj4gCj4gSSBhbSBjdXJyZW50bHkgbWVy
Z2luZyAyOTggdHJlZXMgKGNvdW50aW5nIExpbnVzJyBhbmQgNjkgdHJlZXMgb2YgYnVnCj4gZml4
IHBhdGNoZXMgcGVuZGluZyBmb3IgdGhlIGN1cnJlbnQgbWVyZ2UgcmVsZWFzZSkuCj4gCj4gU3Rh
dHMgYWJvdXQgdGhlIHNpemUgb2YgdGhlIHRyZWUgb3ZlciB0aW1lIGNhbiBiZSBzZWVuIGF0Cj4g
aHR0cDovL25ldWxpbmcub3JnL2xpbnV4LW5leHQtc2l6ZS5odG1sIC4KPiAKPiBTdGF0dXMgb2Yg
bXkgbG9jYWwgYnVpbGQgdGVzdHMgd2lsbCBiZSBhdAo+IGh0dHA6Ly9raXNza2IuZWxsZXJtYW4u
aWQuYXUvbGludXgtbmV4dCAuICBJZiBtYWludGFpbmVycyB3YW50IHRvIGdpdmUKPiBhZHZpY2Ug
YWJvdXQgY3Jvc3MgY29tcGlsZXJzL2NvbmZpZ3MgdGhhdCB3b3JrLCB3ZSBhcmUgYWx3YXlzIG9w
ZW4gdG8gYWRkCj4gbW9yZSBidWlsZHMuCj4gCj4gVGhhbmtzIHRvIFJhbmR5IER1bmxhcCBmb3Ig
ZG9pbmcgbWFueSByYW5kY29uZmlnIGJ1aWxkcy4gIEFuZCB0byBQYXVsCj4gR29ydG1ha2VyIGZv
ciB0cmlhZ2UgYW5kIGJ1ZyBmaXhlcy4KPiAKCm9uIGkzODYsIHdoZW4gYnVpbHQgYXMgbG9hZGFi
bGUgbW9kdWxlOgoKaW4gYW1kZ3B1X3Jhc19zeXNmc19iYWRwYWdlc19yZWFkKCk6CkVSUk9SOiAi
X19kaXZkaTMiIFtkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua29dIHVuZGVmaW5l
ZCEKCm9yIHdoZW4gYnVpbHRpbjoKbGQ6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMubzogaW4gZnVuY3Rpb24gYGFtZGdwdV9yYXNfc3lzZnNfYmFkcGFnZXNfcmVhZCc6CmFt
ZGdwdV9yYXMuYzooLnRleHQrMHg5ZWMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2RpdmRp
MycKbGQ6IGFtZGdwdV9yYXMuYzooLnRleHQrMHhhMGEpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBfX2RpdmRpMycKCgoKLS0gCn5SYW5keQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
