Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA49EE06A3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 16:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD03C6E82F;
	Tue, 22 Oct 2019 14:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B936E82F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 14:42:22 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:53540)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iMvMS-0007pF-IO; Tue, 22 Oct 2019 15:42:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iMvMN-0004ev-Ad; Tue, 22 Oct 2019 15:42:07 +0100
Date: Tue, 22 Oct 2019 15:42:07 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Message-ID: <20191022144207.GV25745@shell.armlinux.org.uk>
References: <5390495.Gzyn2rW8Nj@e123338-lin>
 <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
 <20191017030752.GA3109@jamwan02-TSP300>
 <20191017082043.bpiuvfr3r4jngxtu@DESKTOP-E1NTVVP.localdomain>
 <20191017102055.GA8308@jamwan02-TSP300>
 <20191017104812.6qpuzoh5bx5i2y3m@DESKTOP-E1NTVVP.localdomain>
 <20191017114137.GC25745@shell.armlinux.org.uk>
 <20191022084210.GX11828@phenom.ffwll.local>
 <20191022084826.GP25745@shell.armlinux.org.uk>
 <CAKMK7uHZ1Lw03LhZVH=oAa92WxZXucqooH1w6SG8HG20+g0Rbg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHZ1Lw03LhZVH=oAa92WxZXucqooH1w6SG8HG20+g0Rbg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ea447GvPkMEJiK8cNRVkTbBPIJxvbAAmR8a4za/AwAc=; b=JXRGHqiqeDJzmaKxjhTB20Txb
 jWigRJBTqQhDbfBYaZBGdjUhN8efePBdsIzkg6TrcjRfE74PF5veCxNs5E4xeu9UXOZbZAMXCZixn
 AMKsWUJKCq6SUUkXVANwgrWOmNqX/1H8Xb5tECSQ1mI7mNhIbSypyT40zA28RTq5izjO/TIMHSvIu
 A8PjopG7oo/FBnWxGPxKf2FmhVGzDi0Nhvk2sns92wGpZw951JX7M76yvu6OaiAE4uTRoPRcM80aC
 uURP3mKkb9BQftP+xgo1zssNKP2fj3J2Xu4fLBLj9yK3xSg6r5nt+DPGj0RoXOj0j/PA/O/K2VSKK
 UAtRcHYrQ==;
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTA6NTA6NDJBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE9jdCAyMiwgMjAxOSBhdCAxMDo0OCBBTSBSdXNzZWxsIEtpbmcgLSBB
Uk0gTGludXggYWRtaW4KPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+IEkgaGFk
IGEgcGF0Y2hlcywgd2hpY2ggaXMgd2h5IEkgcmFpc2VkIHRoZSBwcm9ibGVtIHdpdGggdGhlIGNv
cmU6Cj4gPgo+ID4gNjk2MWVkZmVlMjZkIGJyaWRnZSBoYWNrcyB1c2luZyBkZXZpY2UgbGlua3MK
PiA+Cj4gPiBidXQgaXQgbmV2ZXIgd2VudCBmdXJ0aGVyIHRoYW4gYW4gZXhwZXJpbWVudCBhdCB0
aGUgdGltZSBiZWNhdXNlIG9mIHRoZQo+ID4gcHJvYmxlbXMgaW4gdGhlIGNvcmUuICBBcyBpdCB3
YXMgYSBoYWNrLCBpdCBuZXZlciBnb3QgcG9zdGVkLiAgU2VlbXMKPiA+IHRoYXQga2VybmVsIHRy
ZWUgKGZvciB0aGUgY3Vib3gpIGlzIHN0aWxsIDUuMiBiYXNlZCwgc28gaGFzIGEgbG90IG9mCj4g
PiBwYXRjaGVzIGFuZCBtaWdodCBuZWVkIHVwZGF0aW5nIHRvIGEgbW9yZSByZWNlbnQgYmFzZSBi
ZWZvcmUgYW55dGhpbmcKPiA+IGNhbiBiZSB0ZXN0ZWQuCj4gCj4gCj4gRm9yIHJlZmVyZW5jZSwg
dGhlIHBhbmVsIHBhdGNoOgo+IAo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gv
MTAzNjQ4NzMvCj4gCj4gQW5kIHRoZSBodWdlIGRpc2N1c3Npb24gYXJvdW5kIGJyaWRnZXMsIHRo
YXQgcmVzdWx0ZWQgaW4gUmFmYWVsCj4gV3l6b2NraSBmaXhpbmcgYWxsIHRoZSBjb3JlIGlzc3Vl
czoKPiAKPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9kcmktZGV2ZWwvbXNnMjAxOTI3
Lmh0bWwKPiAKPiBKYW1lcywgZG8geW91IHdhbnQgdG8gbG9vayBpbnRvIHRoaXMgZm9yIGJyaWRn
ZXM/CgpJIGNhbiBub3cgY29uZmlybSB0aGF0IGl0IGRvZXMgd29yay4KCi0tIApSTUsncyBQYXRj
aCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8K
RlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBhdCAxMi4x
TWJwcyBkb3duIDYyMmticHMgdXAKQWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDExLjlNYnBz
IGRvd24gNTAwa2JwcyB1cApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
