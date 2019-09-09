Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B6DAD7AD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 13:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFC789B98;
	Mon,  9 Sep 2019 11:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7C189B8F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 11:12:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d17so608400wrq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2019 04:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r0cqelu1CHocdn9tAl3rxNNP2PFx49WcLGnntUDmH00=;
 b=guYussfcnT9RnkzYyPybzeEcOumIEdWMHaC3AvG2AGeSxldpVwnX0W28LoULqh3KXP
 lxQ14GzX3a+3NraJgi3HF2yx0hoaKhnu+lvVpMHrKrUef28G/CoOSOT6bZyGQRQ0OzJI
 AYlrY7p6DNiltStkrH212tMwuNQ5x+9gfrNzxGrjE6Y1H7jhoLN6JJBi6vWMszq9n0Pw
 kT7W3oGBiFmhboBHtsEO3XtJm6+A43Y23OfUhtJG8l7qOQfZ4ju/35/KE9Ib8GhSN03D
 HX3UPP6uhM60vOd78QM7M7vM0JPpO0GfDFj99m1mq31A21/qPw3rpBQ6lcrcyJokGJcr
 Fe0Q==
X-Gm-Message-State: APjAAAVKDFAiiPVnAVK3camqMWoKGbgUY5Dwsd3zGwZ3mH1dm1HzSs0S
 h19jpwpWz4xs70DS2qLXT/Vx/A==
X-Google-Smtp-Source: APXvYqzaBI0NkJdKnfne3ZbLfenHCgShMsft+MxAjXo4pydOyPT+jtolAEOiXuPQUOi3pKczahHhYA==
X-Received: by 2002:adf:d1a4:: with SMTP id w4mr19670272wrc.331.1568027535792; 
 Mon, 09 Sep 2019 04:12:15 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id k6sm29499911wrg.0.2019.09.09.04.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2019 04:12:15 -0700 (PDT)
Date: Mon, 9 Sep 2019 12:12:13 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 0/4] Add a generic driver for LED-based backlight
Message-ID: <20190909111213.objkrztpikruhgzi@holly.lan>
References: <20190717141514.21171-1-jjhiblot@ti.com>
 <283d9044-df2d-b176-bea9-7e1520d9cf56@gmail.com>
 <20190722070620.GD8402@dell>
 <9cbd9cf6-3422-85df-885f-904f52e9cabd@gmail.com>
 <e8b4bf9a-2ee2-a496-c4de-1ed643211ec7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8b4bf9a-2ee2-a496-c4de-1ed643211ec7@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=r0cqelu1CHocdn9tAl3rxNNP2PFx49WcLGnntUDmH00=;
 b=BkQbGtCLTXPp+0ahNqGnKkBg9mw1KDONv/V/dovinCIjnlFHwTGsyK8iWoB9FnIpMw
 8TKZ2mMZ622pGuvFHAW5ZIMPEzo5HHE/eJMai7lsyTdSu6i8fx/Qog4gpYYQaZire8J4
 acRrOqaYGh3x1Ou+o7UsSmuOR5yevYuqFSgDv9JydXEOD7RQvEB4Cql8uUEon6IR1MHb
 8gGKs4cDvaodT+IW0I03i+zZCZhYEYVzKD1KJGIOu1I/FE8Fe1XPRj9g+z2RkKcaYe6R
 Uhrop5P4MrMzUgcEhuLGfr3DKNWxVhulxq1ndBupq6OJEuJpWq60u8AVxWzYwdBKfIMp
 L7rQ==
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
Cc: mark.rutland@arm.com, jingoohan1@gmail.com, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, dmurphy@ti.com, pavel@ucw.cz,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMDgsIDIwMTkgYXQgMDY6MTc6NTBQTSArMDIwMCwgSmFjZWsgQW5hc3pld3Nr
aSB3cm90ZToKPiBPbiA3LzIyLzE5IDExOjIzIFBNLCBKYWNlayBBbmFzemV3c2tpIHdyb3RlOgo+
ID4gT24gNy8yMi8xOSA5OjA2IEFNLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPj4gT24gVGh1LCAxOCBK
dWwgMjAxOSwgSmFjZWsgQW5hc3pld3NraSB3cm90ZToKPiA+Pgo+ID4+PiBPbiA3LzE3LzE5IDQ6
MTUgUE0sIEplYW4tSmFjcXVlcyBIaWJsb3Qgd3JvdGU6Cj4gPj4+PiBUaGlzIHNlcmllcyBhaW1z
IHRvIGFkZCBhIGxlZC1iYWNrbGlnaHQgZHJpdmVyLCBzaW1pbGFyIHRvIHB3bS1iYWNrbGlnaHQs
Cj4gPj4+PiBidXQgdXNpbmcgYSBMRUQgY2xhc3MgZGV2aWNlIHVuZGVybmVhdGguCj4gPj4+Pgo+
ID4+Pj4gQSBmZXcgeWVhcnMgYWdvICgyMDE1KSwgVG9taSBWYWxrZWluZW4gcG9zdGVkIGEgc2Vy
aWVzIGltcGxlbWVudGluZyBhCj4gPj4+PiBiYWNrbGlnaHQgZHJpdmVyIG9uIHRvcCBvZiBhIExF
RCBkZXZpY2U6Cj4gPj4+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzcyOTM5
OTEvCj4gPj4+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzcyOTQwMDEvCj4g
Pj4+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzcyOTM5ODEvCj4gPj4+Pgo+
ID4+Pj4gVGhlIGRpc2N1c3Npb24gc3RvcHBlZCBiZWNhdXNlIFRvbWkgbGFja2VkIHRoZSB0aW1l
IHRvIHdvcmsgb24gaXQuCj4gPj4+Pgo+ID4+Pj4gY2hhbmdlcyBpbiB2NDoKPiA+Pj4+IC0gZml4
IGRldl9lcnIoKSBtZXNzYWdlcyBhbmQgY29tbWl0IGxvZ3MgZm9sbG93aW5nIHRoZSBhZHZpY2Vz
IG9mIFBhdmVsCj4gPj4+PiAtIGNvc21ldGljIGNoYW5nZXMgKGluZGVudHMsIGdldHRpbmcgcmlk
IG9mICAiPyAxIDogMCIgaW4KPiA+Pj4+ICAgbGVkX21hdGNoX2xlZF9ub2RlKCkpCj4gPj4+Pgo+
ID4+Pj4gY2hhbmdlcyBpbiB2MzoKPiA+Pj4+IC0gZHQgYmluZGluZzogZG9uJ3QgbGltaXQgdGhl
IGJyaWdodG5lc3MgcmFuZ2UgdG8gMC0yNTUuIFVzZSB0aGUgcmFuZ2Ugb2YKPiA+Pj4+ICAgdGhl
IHVuZGVybHlpbmcgTEVEcy4gYXMgYSBzaWRlLWVmZmVjdCwgYWxsIExFRHMgbXVzdCBub3cgaGF2
ZSB0aGUgc2FtZQo+ID4+Pj4gICByYW5nZQo+ID4+Pj4gLSBkcml2ZXI6IEFkYXB0IHRvIGR0IGJp
bmRpbmcgdXBkYXRlLgo+ID4+Pj4gLSBkcml2ZXI6IHJld29yayBwcm9iZSgpIGZvciBjbGFyaXR5
IGFuZCByZW1vdmUgdGhlIHJlbWFpbmluZyBnb3RvLgo+ID4+Pj4KPiA+Pj4+IGNoYW5nZXMgaW4g
djI6Cj4gPj4+PiAtIGhhbmRsZSBtb3JlIHRoYW4gb25lIExFRC4KPiA+Pj4+IC0gZG9uJ3QgbWFr
ZSB0aGUgYmFja2xpZ2h0IGRldmljZSBhIGNoaWxkIG9mIHRoZSBMRUQgY29udHJvbGxlci4KPiA+
Pj4+IC0gbWFrZSBicmlnaHRuZXNzLWxldmVscyBhbmQgZGVmYXVsdC1icmlnaHRuZXNzLWxldmVs
IG9wdGlvbmFsCj4gPj4+PiAtIHJlbW92ZWQgdGhlIG9wdGlvbiB0byB1c2UgYSBHUElPIGVuYWJs
ZS4KPiA+Pj4+IC0gcmVtb3ZlZCB0aGUgb3B0aW9uIHRvIHVzZSBhIHJlZ3VsYXRvci4gSXQgc2hv
dWxkIGJlIGhhbmRsZWQgYnkgdGhlIExFRAo+ID4+Pj4gICBjb3JlCj4gPj4+PiAtIGRvbid0IG1h
a2UgYW55IGNoYW5nZSB0byB0aGUgTEVEIGNvcmUgKG5vdCBuZWVkZWQgYW55bW9yZSkKPiA+Pj4+
Cj4gPj4+PiBKZWFuLUphY3F1ZXMgSGlibG90ICgyKToKPiA+Pj4+ICAgbGVkczogQWRkIG1hbmFn
ZWQgQVBJIHRvIGdldCBhIExFRCBmcm9tIGEgZGV2aWNlIGRyaXZlcgo+ID4+Pj4gICBkdC1iaW5k
aW5nczogYmFja2xpZ2h0OiBBZGQgbGVkLWJhY2tsaWdodCBiaW5kaW5nCj4gPj4+Pgo+ID4+Pj4g
VG9taSBWYWxrZWluZW4gKDIpOgo+ID4+Pj4gICBsZWRzOiBBZGQgb2ZfbGVkX2dldCgpIGFuZCBs
ZWRfcHV0KCkKPiA+Pj4+ICAgYmFja2xpZ2h0OiBhZGQgbGVkLWJhY2tsaWdodCBkcml2ZXIKPiA+
Pj4+Cj4gPj4+PiAgLi4uL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0
IHwgIDI4ICsrCj4gPj4+PiAgZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jICAgICAgICAgICAgICAg
ICAgICAgIHwgIDkyICsrKysrKwo+ID4+Pj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25m
aWcgICAgICAgICAgICAgICB8ICAgNyArCj4gPj4+PiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
TWFrZWZpbGUgICAgICAgICAgICAgIHwgICAxICsKPiA+Pj4+ICBkcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9sZWRfYmwuYyAgICAgICAgICAgICAgfCAyNjggKysrKysrKysrKysrKysrKysrCj4gPj4+
PiAgaW5jbHVkZS9saW51eC9sZWRzLmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsK
PiA+Pj4+ICA2IGZpbGVzIGNoYW5nZWQsIDQwMiBpbnNlcnRpb25zKCspCj4gPj4+PiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2ts
aWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+ID4+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9sZWRfYmwuYwo+ID4+Pj4KPiA+Pj4KPiA+Pj4gRm9yIHRoZSB3aG9s
ZSBzZXQ6Cj4gPj4+Cj4gPj4+IEFja2VkLWJ5OiBKYWNlayBBbmFzemV3c2tpIDxqYWNlay5hbmFz
emV3c2tpQGdtYWlsLmNvbT4KPiA+Pj4KPiA+Pj4gTGVlIC0gd2UgbmVlZCB0byBjcmVhdGUgaW1t
dXRhYmxlIGJyYW5jaCBmb3IgdGhpcyBzZXQgc2luY2UgdGhlcmUgd2lsbAo+ID4+PiBiZSBzb21l
IGludGVyZmVyaW5nIGNoYW5nZXMgaW4gdGhlIExFRCBjb3JlIGluIHRoaXMgY3ljbGUuCj4gPj4+
Cj4gPj4+IEkgY2FuIGNyZWF0ZSB0aGUgYnJhbmNoIGFuZCBzZW5kIHRoZSBwdWxsIHJlcXVlc3Qg
b25jZSB3ZSB3aWxsCj4gPj4+IG9idGFpbiB0aGUgYWNrIGZyb20gUm9iIGZvciBEVCBiaW5kaW5n
cywgdW5sZXNzIHlvdSBoYXZlIG90aGVyCj4gPj4+IHByZWZlcmVuY2UuCj4gPj4KPiA+PiBXZSBh
bHNvIHJlcXVpcmUgYSByZXZpZXcgdG8gYmUgY29uZHVjdGVkIGJ5IERhbmllbCBUaG9tcHNvbi4K
PiA+Pgo+ID4+IEFmdGVyIHdoaWNoLCBhbiBpbW11dGFibGUgYnJhbmNoIHNvdW5kcyBsaWtlIGEg
Z29vZCBpZGVhLiAgSSdkIGxpa2UgdG8KPiA+PiBjcmVhdGUgdGhpcyBteXNlbGYgaWYgeW91IGRv
bid0IG1pbmQuCj4gPiAKPiA+IFN1cmUsIHRoYW5rcy4KPiAKPiBVbmZvcnR1bmF0ZWx5IHRoYXQg
aGFzbid0IGhhcHBlbmVkIGFuZCBpdCB3aWxsIG1pc3MgNS40IG1lcmdlIHdpbmRvdy4KPiAKPiBE
YW5pZWwsIHdlIG5lZWQgeW91ciBhY2sgZm9yIHRoaXMgcGF0Y2ggc2V0LgoKU29ycnkgZm9yIGRy
b3BwaW5nIHRoZSBiYWxsIGhlcmUuCgpJJ20gYWZyYWlkIEkgY291bGRuJ3QgYWNrIHNpbmNlIEkg
c3BvdHRlZCBhIGJ1ZyBidXQgSSBoYXZlIHNoYXJlZApyZXZpZXcgZmVlZGJhY2sgbm93IQoKCkRh
bmllbC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
