Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E543243551
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 12:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECEE89812;
	Thu, 13 Jun 2019 10:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E018289812
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 10:52:46 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:56356)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hbNLQ-0002Rx-VZ; Thu, 13 Jun 2019 11:52:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hbNLO-0001AD-PA; Thu, 13 Jun 2019 11:52:34 +0100
Date: Thu, 13 Jun 2019 11:52:34 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH 00/13] tda998x updates
Message-ID: <20190613105234.j3vopoznfoqbtukc@shell.armlinux.org.uk>
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <CAGngYiXOZH+m6z4FibmjmvCwtALU=vT372k4=7-eJWjryzFAuA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGngYiXOZH+m6z4FibmjmvCwtALU=vT372k4=7-eJWjryzFAuA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WkNl3aEhsCEUvhI4kVLtlO96Br1oJvsuAHx80Oc1FRs=; b=hYppXTfbs/2D7N8otYjBTn4wF
 oZ/cJ4ZhudGyq5Tiq0dZxK6wroUfCIZtpSdEwAArHR4fHoRKjAyqIw6EdNgK20Y1nYgnhOX8lAvAi
 2HcLuSm6YobI2/RwHPJgVU2lShS/awE4JvgoMy/FIAeZcHC7dGbhcdKZmKaoXaVocy3mSNRAUCBVA
 KRdH8AmY4kSrfKmoAtwqrh/udnpTCZkF0fiXJPEMwk1aV4jheLGd22CoYunqL1bsqnVjNess1XoZQ
 5J+DoZBz9cgqnNX/Sc36779s3QO7r8wbVeoRyrfo0IK4e6+JpczVBGScUud2WErcvEqNVYd3KG1qb
 UQVrDzTSw==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6NDA6NDNBTSAtMDQwMCwgU3ZlbiBWYW4gQXNicm9l
Y2sgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzowMSBBTSBSdXNzZWxsIEtpbmcg
LSBBUk0gTGludXggYWRtaW4KPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4g
PiBUaGlzIHNlcmllcyByZXByZXNlbnRzIGRldmVsb3BtZW50IHdvcmsgY29sbGVjdGVkIG92ZXIg
dGhlIGxhc3Qgc2l4Cj4gPiBtb250aHMgdG8gaW1wcm92ZSB0aGUgVERBOTk4eCBkcml2ZXIsIHBh
cnRpY3VsYXJseSBmb3IgdGhlIGF1ZGlvCj4gPiBzaWRlLiAgVGhlc2UgcGF0Y2hlcyBjYW4gYmUg
Zm91bmQgaW4gbXkgImRybS10ZGE5OTh4LWRldmVsIiBicmFuY2gKPiA+IGF0IGdpdDovL2dpdC5h
cm1saW51eC5vcmcudWsvfnJtay9saW51eC1hcm0uZ2l0Cj4gCj4gVGhhbmsgeW91IFJ1c3NlbGwg
ISEKPiAKPiBJIHRlc3RlZCB0aGlzIHBhdGNoIHNldCBvbiBteSBwbGF0Zm9ybTogaW14NnEgc3Np
IGNvZGVjIGRyaXZpbmcgYSB0ZGExOTk4OC4KPiBObyBpc3N1ZXMgYXMgZmFyIGFzIEkgY2FuIHRl
bGwuCj4gCj4gTm90ZSB0aGF0IEkgc3RpbGwgaGF2ZSB0byAnaGFjaycgdGhlIGJjbGtfcmF0aW8g
aW4gdGhlIHRkYSBkcml2ZXIgdG8gY29ycmVzcG9uZAo+IHdpdGggdGhlIHdpcmUgZm9ybWF0IHRo
YXQgdGhlIGlteDZxIHNzaSBpcyBnZW5lcmF0aW5nLiBCdXQgdGhhdCdzIGEga25vd24KPiBpc3N1
ZS4KClllcCwgSSBhdm9pZGVkIHBvc3RpbmcgdGhvc2UgcGF0Y2hlcyBzbyB0aGF0IHRoaXMgc2V0
IGNhbiBnZXQgbWVyZ2VkLAp3aGljaCBtb3ZlcyB1cyB0b3dhcmRzIHN1cHBvcnRpbmcgbW9yZSBJ
MlMgZm9ybWF0cy4gIE9uY2Ugd2UgaGF2ZQphZ3JlZW1lbnQgd2l0aCB0aGVzZSAod2hpY2ggc2hv
dWxkIGJlIGVhc3kpIHdlIGNhbiB0aGVuIHJlc3VtZSB0cnlpbmcKdG8gcmVzb2x2ZSB0aGUgaGRt
aS1jb2RlYyBzaWRlIG9mIHRoZSBwcm9ibGVtLgoKSSdsbCByZXBvc3QgdGhlIHBhdGNoIHNldCBs
YXRlciB0b2RheSwgSSdtIGludGVuZGluZyB0byBkcm9wIHRoZQpicmlkZ2UgdGltaW5nIHBhdGNo
IGZyb20gdGhlIHNldCBmb3Igbm93LCBidXQgYWRkIHRoZSBwYXRjaCBmb3IgdGhlCnZlbmRvci1z
cGVjaWZpYyBpbmZvZnJhbWUgdGhhdCBjYW4gZ28gdXBzdHJlYW0gaW4gaXRzIHBsYWNlLgoKLS0g
ClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Bl
ci9wYXRjaGVzLwpGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1YnVyYmlhOiBz
eW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2JwcyB1cApBY2NvcmRpbmcgdG8gc3BlZWR0ZXN0Lm5l
dDogMTEuOU1icHMgZG93biA1MDBrYnBzIHVwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
