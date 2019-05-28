Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB91E2C102
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A50289B61;
	Tue, 28 May 2019 08:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6A789C14
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:16:33 +0000 (UTC)
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE45B20717;
 Tue, 28 May 2019 08:16:29 +0000 (UTC)
Date: Tue, 28 May 2019 16:15:21 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Subject: Re: [EXT] Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller
 support
Message-ID: <20190528081520.GC6885@dragon>
References: <cover.1551954425.git.agx@sigxcpu.org>
 <20190508171827.GA21725@bogon.m.sigxcpu.org>
 <1558964213.4039.2.camel@pengutronix.de>
 <20190528013800.GB6885@dragon>
 <20190528070353.GA14871@fsr-ub1664-121>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528070353.GA14871@fsr-ub1664-121>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559031392;
 bh=nXvr/xdQFT0h2/HqbcuBVMqW3qHqmPECahPRAYARihs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NA/9DPCxgcBVZxkfJvzz1nppvvytQn3xSnk+81cF526H68R+eVdUfICaE99x5jz87
 i7t7QP2W99EFktV3yYuyPqB5rWIE6dHvESBwh+gJE2nDXyQjqW2m5V3CTeDdQt/rkq
 farN4S/ayZjW/6XOP8bmvQCR7bteyBEhpHdCui/4=
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
Cc: David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudGl1LAoKT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDc6MDM6NTRBTSArMDAwMCwg
TGF1cmVudGl1IFBhbGN1IHdyb3RlOgo+IEhpIFNoYXduLCBMdWNhcywKPiAKPiBPbiBUdWUsIE1h
eSAyOCwgMjAxOSBhdCAwOTozODowMkFNICswODAwLCBTaGF3biBHdW8gd3JvdGU6Cj4gPiBDYXV0
aW9uOiBFWFQgRW1haWwKPiA+IAo+ID4gSGkgTHVjYXMsCj4gPiAKPiA+IE9uIE1vbiwgTWF5IDI3
LCAyMDE5IGF0IDAzOjM2OjUzUE0gKzAyMDAsIEx1Y2FzIFN0YWNoIHdyb3RlOgo+ID4gPiBXZSBo
YXZlIGJlZW4gbG9va2luZyBhdCBob3cgdG8gc3VwcG9ydCBEQ1NTIGluIG1haW5saW5lIGZvciBh
IHdoaWxlLAo+ID4gPiBidXQgbW9zdCBvZiB0aGUgYWN0dWFsIHdvcmsgZ290IHB1c2hlZCBiZWhp
bmQgaW4gc2NoZWR1bGUgZHVlIHRvIG90aGVyCj4gPiA+IHByaW9yaXRpZXMuCj4gPiAKPiA+IEkg
aGF2ZSBzb21lIHRpbWUgdG8gY29udHJpYnV0ZS4gIFdvdWxkIHlvdSBzdWdnZXN0IGhvdyBJIHNo
b3VsZCBoZWxwCj4gPiBoZXJlPwo+ID4gCj4gPiAxLiBZb3UgZ3V5cyBhbHJlYWR5IGhhdmUgc29t
ZXRoaW5nIGNsb3NlIHRvIGNvbXBsZXRpb24gYW5kIGRvIG5vdCBuZWVkCj4gPiAgICBtb3JlIGhh
bmRzLgo+ID4gMi4gWW91IGd1eXMgYWxyZWFkeSBoYXZlIHNvbWUgcHJlbGltaW5hcnkgY29kZSBh
bmQgY2FuIHVzZSBoZWxwIGZyb20KPiA+ICAgIG90aGVycy4KPiA+IDMuIFlvdSBndXlzIGhhdmVu
J3QgZ290IGFueXRoaW5nIHRvIHN0YXJ0IHdpdGgsIGJ1dCBqdXN0IHNvbWUgZGVzaWduCj4gPiAg
ICBwcmluY2lwbGVzIHRoYXQgYW55b25lIHdobyB3YW50cyB0byB3b3JrIG9uIGl0IHNob3VsZCBj
b25zaWRlci4KPiA+IAo+ID4gV2hpY2ggaXMgdGhlIG9uZSB0aGF0IHlvdSB3YW50IG1lIHRvIHJl
YWQ/Cj4gCj4gV2UncmUgYWxyZWFkeSB3b3JraW5nIG9uIGNsZWFyaW5nIHVwIHRoZSBEQ1NTIGNv
ZGUgYW5kIHByZXBhcmluZyBpdCBmb3IKPiB1cHN0cmVhbWluZy4gSXQgc2hvdWxkIGJlIGRvbmUg
aW4gdGhlIGZvbGxvd2luZyB3ZWVrcy4KCkdyZWF0ISAgSSB3aWxsIHN0YXkgYXdheSBmcm9tIHRo
aXMgdGhlbiA6KQoKPiBUaGUgcmVhc29uIHdlJ3ZlCj4gYmVlbiBkZWxheWluZyB0aGlzIGlzIGJl
Y2F1c2UgbmVpdGhlciBIRE1JIG5vciBNSVBJIHN1cHBvcnQgd2FzIHByZXNlbnQKPiBhbmQsIHVu
dGlsIHRoZXNlIGFyZSB1cHN0cmVhbSwgdGVzdGluZyBEQ1NTIHdvdWxkIGJlIHF1aXRlIGltcG9z
c2libGUuCgpXZWxsLCB0aGV5IGhhdmUgdG8gYmUgZG9uZSBvbmUgYnkgb25lLCBhbmQgSSBndWVz
cyBEQ1NTIHNob3VsZCBiZSB0aGUKZmlyc3Qgb25lLiAgSSB0aGluayBpdCdzIGZpbmUgdG8gdGVz
dCBEQ1NTIHdpdGggb3V0LW9mLXRyZWUgSERNSSBvcgpNSVBJIGRyaXZlciB3aGljaCBpcyBub3Qg
cmVhZHkgZm9yIHN1Ym1pc3Npb24geWV0LgoKU2hhd24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
