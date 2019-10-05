Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5017FCDC04
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3626E45E;
	Mon,  7 Oct 2019 07:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA5F6E3DF
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 18:19:25 +0000 (UTC)
Received: from p5dc589a1.dip0.t-ipconnect.de ([93.197.137.161] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1iGoeG-0002PT-Lg; Sat, 05 Oct 2019 20:19:20 +0200
Date: Sat, 5 Oct 2019 20:19:19 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: lm3630a: fix module aliases
Message-ID: <20191005201919.013524da@aktux>
In-Reply-To: <20190911105148.4prmcr2f2r36sgrf@holly.lan>
References: <20190910152359.7448-1-andreas@kemnade.info>
 <20190911105148.4prmcr2f2r36sgrf@holly.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AyGFVjqrVQ7j5HVpExPglip8iVXDUbXdQbJqiWaitIQ=; b=hRYFS/MhMvVuxKp8UiIP/EdQ8k
 d0YuXD/CiUvHMrO0SZjGn00Zzuen4z7A2YKQ8IVbYS+QQpV0wKQI07sV3MTrbijfmsCI/OPQH2Raq
 SWy77I3EyDMxM4QDRIFeX4i/PwS6KUCF76k4gGcydNjcwdXRSj98r6Glu5YW6G960fC4=;
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hns@goldelico.com, lee.jones@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpobW0sIHRoaXMgYnVnZml4IGhhcyBub3QgYXJyaXZlZCBpbiAtbmV4dCBvciBhbnkgLWZp
eGVzIGJyYW5jaCBJIGFtCmF3YXJlIG9mIHlldC4gSSBob3BlIGl0IGlzIG5vdCBmb3Jnb3R0ZW4u
Li4Kc28gYSBmcmllbmRseSBwaW5nLgoKUmVnYXJkcywKQW5kcmVhcwoKT24gV2VkLCAxMSBTZXAg
MjAxOSAxMTo1MTo0OCArMDEwMApEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5h
cm8ub3JnPiB3cm90ZToKCj4gT24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDU6MjM6NTlQTSArMDIw
MCwgQW5kcmVhcyBLZW1uYWRlIHdyb3RlOgo+ID4gRGV2aWNldHJlZSBhbGlhc2VzIGFyZSBtaXNz
aW5nLCBzbyB0aGF0IG1vZHVsZSBhdXRvbG9hZGluZwo+ID4gZG9lcyBub3Qgd29yayBwcm9wZXJs
eS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBLZW1uYWRlIDxhbmRyZWFzQGtlbW5h
ZGUuaW5mbz4gIAo+IAo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9t
cHNvbkBsaW5hcm8ub3JnPgo+IAo+IAo+ID4gLS0tCj4gPiAgZHJpdmVycy92aWRlby9iYWNrbGln
aHQvbG0zNjMwYV9ibC5jIHwgNCArKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvbG0zNjMwYV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9i
bC5jCj4gPiBpbmRleCAzYjQ1YTE3MzMxOTguLjlkNjdjMDdkYjJmMiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYwo+ID4gKysrIGIvZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCj4gPiBAQCAtNjE3LDEyICs2MTcsMTQgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIGxtMzYzMGFfaWRbXSA9IHsKPiA+ICAJe30K
PiA+ICB9Owo+ID4gIAo+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCBsbTM2MzBhX2lkKTsK
PiA+ICsKPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBsbTM2MzBhX21hdGNo
X3RhYmxlW10gPSB7Cj4gPiAgCXsgLmNvbXBhdGlibGUgPSAidGksbG0zNjMwYSIsIH0sCj4gPiAg
CXsgfSwKPiA+ICB9Owo+ID4gIAo+ID4gLU1PRFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCBsbTM2MzBh
X2lkKTsKPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBsbTM2MzBhX21hdGNoX3RhYmxlKTsK
PiA+ICAKPiA+ICBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgbG0zNjMwYV9pMmNfZHJpdmVyID0g
ewo+ID4gIAkuZHJpdmVyID0gewo+ID4gLS0gCj4gPiAyLjExLjAKPiA+ICAgCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
