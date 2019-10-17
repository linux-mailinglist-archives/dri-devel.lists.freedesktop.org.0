Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77618DA8E6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 11:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8C46EA30;
	Thu, 17 Oct 2019 09:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A9B6EA30
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 09:44:26 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:43844)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iL2KR-000869-J1; Thu, 17 Oct 2019 10:44:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iL2KL-00086j-8Y; Thu, 17 Oct 2019 10:44:13 +0100
Date: Thu, 17 Oct 2019 10:44:13 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Dariusz Marcinkiewicz <darekm@google.com>
Subject: Re: [PATCHv8 2/2] drm: tda998x: set the connector info
Message-ID: <20191017094413.GB25745@shell.armlinux.org.uk>
References: <20191016133916.21475-1-hverkuil-cisco@xs4all.nl>
 <20191016133916.21475-3-hverkuil-cisco@xs4all.nl>
 <20191016162232.GY25745@shell.armlinux.org.uk>
 <CALFZZQEL_YFEJWw557p-uV14APthSoTn61tY59yXZEPioxPSfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALFZZQEL_YFEJWw557p-uV14APthSoTn61tY59yXZEPioxPSfw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=brf7/wYGSzINPAgq1erOz4Su2wE5nM8MRw1gSveQ+qY=; b=ZpcvYUYQht++wPhWfQl5lRy+3
 QuLT+D1AH9sBsRl/UIWVKw1d4smvriWZ/XeH6KXyrGdMG+Zgnz6/sVgvEbqeWSaN0mA1ZWep32S6c
 /buaY1zS43KcIB6gHZAzh34ghPxuMFZTM3ITIDMxISxOrd/7/dJCZhqhcCfSHKoZRKBTJqepwcsbB
 CvN361qQuvG5LOozHWDQKogZzZuPzWM/ImLvoNmTgN8xZkSRqgxk39Y07v4SyOmKISy/aUZDhz01X
 lAlv6Bmj+HL9FNwGiNtzMdNL7L6CWr5B2mdzk+6EfTU5Jc2LcHlCFRiMNHFBEX7QncFbKBLlYS8pu
 UsA+rjd1A==;
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTE6MjY6MzhBTSArMDIwMCwgRGFyaXVzeiBNYXJjaW5r
aWV3aWN6IHdyb3RlOgo+IEhpIFJ1c3NlbC4KPiAKPiBPbiBXZWQsIE9jdCAxNiwgMjAxOSBhdCA2
OjIyIFBNIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCBhZG1pbgo+IDxsaW51eEBhcm1saW51eC5v
cmcudWs+IHdyb3RlOgo+ID4KPiAuLi4KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2kyYy90
ZGE5OTh4X2Rydi5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYu
Ywo+ID4gPiBAQCAtMTMzNyw2ICsxMzM3LDggQEAgc3RhdGljIGludCB0ZGE5OTh4X2Nvbm5lY3Rv
cl9pbml0KHN0cnVjdCB0ZGE5OTh4X3ByaXYgKnByaXYsCj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiA+ID4gIHsKPiA+ID4gICAg
ICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9ICZwcml2LT5jb25uZWN0b3I7Cj4g
PiA+ICsgICAgIHN0cnVjdCBjZWNfY29ubmVjdG9yX2luZm8gY29ubl9pbmZvOwo+ID4gPiArICAg
ICBzdHJ1Y3QgY2VjX25vdGlmaWVyICpub3RpZmllcjsKPiA+ID4gICAgICAgaW50IHJldDsKPiA+
ID4KPiA+ID4gICAgICAgY29ubmVjdG9yLT5pbnRlcmxhY2VfYWxsb3dlZCA9IDE7Cj4gPiA+IEBA
IC0xMzUzLDYgKzEzNTUsMTcgQEAgc3RhdGljIGludCB0ZGE5OTh4X2Nvbm5lY3Rvcl9pbml0KHN0
cnVjdCB0ZGE5OTh4X3ByaXYgKnByaXYsCj4gPiA+ICAgICAgIGlmIChyZXQpCj4gPiA+ICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4KPiA+ID4gKyAgICAgY2VjX2ZpbGxfY29ubl9pbmZv
X2Zyb21fZHJtKCZjb25uX2luZm8sIGNvbm5lY3Rvcik7Cj4gPiA+ICsKPiA+ID4gKyAgICAgbm90
aWZpZXIgPSBjZWNfbm90aWZpZXJfY29ubl9yZWdpc3Rlcihwcml2LT5jZWNfZ2x1ZS5wYXJlbnQs
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwg
JmNvbm5faW5mbyk7Cj4gPiA+ICsgICAgIGlmICghbm90aWZpZXIpCj4gPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9NRU07Cj4gPiA+ICsKPiA+ID4gKyAgICAgbXV0ZXhfbG9jaygmcHJpdi0+
Y2VjX25vdGlmeV9tdXRleCk7Cj4gPiA+ICsgICAgIHByaXYtPmNlY19ub3RpZnkgPSBub3RpZmll
cjsKPiA+ID4gKyAgICAgbXV0ZXhfdW5sb2NrKCZwcml2LT5jZWNfbm90aWZ5X211dGV4KTsKPiA+
Cj4gPiBBcyBwZXIgbXkgcHJldmlvdXMgY29tbWVudHMsIHRoaXMgaXMgYSBzaW5nbGUtY29weSBh
dG9taWMgb3BlcmF0aW9uLgo+ID4gRWl0aGVyIHByaXYtPmNlY19ub3RpZnkgaXMgc2V0IG9yIGl0
IGlzbid0OyB0aGVyZSBpcyBubyBpbnRlcm1lZGlhdGUKPiA+IHZhbHVlLiAgSXQgY2FuJ3QgYmUg
c2V0IHRvIGEgdmFsdWUgdW50aWwgY2VjX25vdGlmaWVyX2Nvbm5fcmVnaXN0ZXIoKQo+ID4gaGFz
IGNvbXBsZXRlZC4gIFNvIHRoZSBsb2NrIGRvZXNuJ3QgaGVscC4KPiA+Cj4gLi4uLgo+ID4gPiAr
Cj4gPiA+ICAgICAgIGRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoJnByaXYtPmNvbm5lY3Rv
ciwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcml2LT5icmlkZ2Uu
ZW5jb2Rlcik7Cj4gPiA+Cj4gPiA+IEBAIC0xMzcyLDYgKzEzODUsMTEgQEAgc3RhdGljIHZvaWQg
dGRhOTk4eF9icmlkZ2VfZGV0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gLi4uCj4g
PiA+ICsgICAgIG11dGV4X2xvY2soJnByaXYtPmNlY19ub3RpZnlfbXV0ZXgpOwo+ID4gPiArICAg
ICBjZWNfbm90aWZpZXJfY29ubl91bnJlZ2lzdGVyKHByaXYtPmNlY19ub3RpZnkpOwo+ID4gPiAr
ICAgICBwcml2LT5jZWNfbm90aWZ5ID0gTlVMTDsKPiA+ID4gKyAgICAgbXV0ZXhfdW5sb2NrKCZw
cml2LT5jZWNfbm90aWZ5X211dGV4KTsKPiA+Cj4gPiBUaGlzIGlzIHRoZSBvbmx5IGNhc2Ugd2hl
cmUgdGhlIGxvY2sgbWFrZXMgc2Vuc2UgLSB0byBlbnN1cmUgdGhhdCBhbnkKPiA+IG9mIHRoZSBj
ZWNfbm90aWZpZXJfc2V0X3BoeXNfYWRkciooKSBmdW5jdGlvbnMgYXJlbid0IGNhbGxlZAo+ID4g
Y29uY3VycmVudGx5IHdpdGggaXQuICBIb3dldmVyLCB0aGVyZSdzIG5vIGxvY2tpbmcgYXJvdW5k
IHRoZSBpbnN0YW5jZQo+ID4gaW4gdGRhOTk4eF9jb25uZWN0b3JfZ2V0X21vZGVzKCksIHNvIGhh
dmUgeW91IGVuc3VyZWQgdGhhdCB0aGF0Cj4gPiBmdW5jdGlvbiBjYW4ndCBiZSBjYWxsZWQgY29u
Y3VycmVudGx5Pwo+ID4KPiBJIGFzc3VtZWQgdGhhdCB0ZGE5OTh4X2Nvbm5lY3Rvcl9nZXRfbW9k
ZXMgZG9lcyBub3QgbmVlZCB0byBiZQo+IHN5bmNocm9uaXplZCBhcyBpdCBiZWxvbmdzIHRvIHRo
ZSBjb25uZWN0b3IgdGhhdCBnZXRzIGNsZWFuZWQgdXAgaGVyZS4KPiBCdXQsIG9uIGEgY2xvc2Vy
IGxvb2ssIEkgZG9uJ3QgdGhpbmsgdGhhdCB0aGlzIGFzc3VtcHRpb24gbmVjZXNzYXJpbHkKPiBo
b2xkcy4KPiAKPiBJZiB0aGlzIHBhdGNoIGlzIHRvIGJlIG1lcmdlZCwgSSBjYW4gc2VuZCBhbiB1
cGRhdGUgdGhhdDoKPiAtIHN0cmlwcyBsb2NraW5nIGZyb20gdGRhOTk4eF9jb25uZWN0b3JfaW5p
dCwKPiAtIGluIHRkYTk5OHhfY29ubmVjdG9yX2dldF9tb2RlcyBjYWxscyBjZWNfbm90aWZpZXIq
IHdpdGggdGhlIGxvY2sgaGVsZC4KCk9rYXksIEknZCBzdWdnZXN0IGEgY29tbWVudCBpbiB0aGUg
Y29kZSBkZXNjcmliaW5nIHByZWNpc2VseSB3aGF0IHRoZQpsb2NrIGlzIGRvaW5nIHdvdWxkIGJl
IGEgZ29vZCBpZGVhLCBhcyBpdCBtYXkgbm90IGJlIG9idmlvdXMgaW4gdGhlCmZ1dHVyZS4KClRo
YW5rcy4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51
ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBz
dWJ1cmJpYTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYyMmticHMgdXAKQWNjb3JkaW5nIHRvIHNw
ZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1cApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
