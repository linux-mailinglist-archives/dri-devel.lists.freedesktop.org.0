Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA91A6DEE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C3B890FE;
	Tue,  3 Sep 2019 16:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C01B890FE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 16:19:27 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o184so142026wme.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 09:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sgA6tCvJaTRg35lxvETEOk42SQwlvhDmgf9L2xbY5u4=;
 b=kYZ+g58KdUq4j982PRaevYIXOS5YsVD/mt363k8vhseNmtLXX+UPOO9peGHysRN7SA
 9IvovXmGHmc5Jo8OEFepf53i51tzPi6OoQ8JwW801C4H7anZ8oKvBpNQXzwhIIuLSokz
 64mQbkOPFIzC+rgR4ZI9VbcxPPve0Flj4segIE3hU73vFdspUxEVJwAMzrA9c5tll22C
 kI1bQgnLpzbpfltzI9oTVIs7BtF22walgJfRsSSyaPWNguZwXWouXEg+BsJhjgiTpFO/
 tmyMb2P33UICipPQRxEcPfQBdVIe4eH5gnEhrZa+zwL5zkTc0tExd0R8Rs1tSxHGf1Nm
 Bjeg==
X-Gm-Message-State: APjAAAUUix6eLlM6zAafsVvbttYQXfzV6SnjXvq6qiOvZD+9q3HBs6nx
 ekJdjacbwU0AIYvsqU+TSHQkhfUe/xnSQQ==
X-Google-Smtp-Source: APXvYqyAzHLUCAmUnjAuDzEzve0pETSkr021EixF0mi07mhQ0Ag3dJ64DWhOZaitzgpCSVqus+IyyA==
X-Received: by 2002:a1c:ef13:: with SMTP id n19mr144292wmh.48.1567527566178;
 Tue, 03 Sep 2019 09:19:26 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u8sm46851wmj.3.2019.09.03.09.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 09:19:25 -0700 (PDT)
Date: Tue, 3 Sep 2019 17:19:23 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: Re: [PATCH] backlight: ipaq_micro: Make structure micro_bl_props
 constant
Message-ID: <20190903161923.5d2fvrwpvgims4va@holly.lan>
References: <20190813085855.8302-1-nishkadg.linux@gmail.com>
 <20190813091251.2nyxtivsvp47aahp@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813091251.2nyxtivsvp47aahp@holly.lan>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sgA6tCvJaTRg35lxvETEOk42SQwlvhDmgf9L2xbY5u4=;
 b=tLxBO+vZGBMg+VdcasGIrVZS+MBaiDkZCgH8CYS8Vn4yPSdv2G2ASG9PHOinlSjtrC
 9MP7SC4nS9fdtZCAeQoO1gr1HlOyTs87kEObp4+KybmWIQEUwbuJj+wnpdUCjCwrAMNC
 KbkU/ETPNgFX4R+JlPZqBxzwSEQ7C9LB2S+P/JmalJ0UXXiiRYqJks/VegJqesuidOBw
 cqsGOuV4jjv90cPC4g9pCVSyCIps4vDw5RgKPt1eUOJXl4BH7oKPGNL6z5QESlQfWih2
 8INIRFBx8gEvKhFRWOf+grRSCZtLFVusbJmr9tB8JScL01hAHMEICQLAVCirJ/OJuMG4
 vXgA==
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
Cc: jingoohan1@gmail.com, linux-fbdev@vger.kernel.org, lee.jones@linaro.org,
 dri-devel@lists.freedesktop.org, b.zolnierkie@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTA6MTI6NTFBTSArMDEwMCwgRGFuaWVsIFRob21wc29u
IHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDAyOjI4OjU1UE0gKzA1MzAsIE5pc2hr
YSBEYXNndXB0YSB3cm90ZToKPiA+IFN0YXRpYyBzdHJ1Y3R1cmUgbWljcm9fYmxfcHJvcHMsIGhh
dmluZyB0eXBlIGJhY2tsaWdodF9wcm9wZXJ0aWVzLCBpcwo+ID4gdXNlZCBvbmx5IG9uY2UsIHdo
ZW4gaXQgaXMgcGFzc2VkIGFzIHRoZSBsYXN0IGFyZ3VtZW50IHRvIGZ1bmN0aW9uCj4gPiBkZXZt
X2JhY2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIoKS4gZGV2bV9iYWNrbGlnaHRfZGV2aWNlX3JlZ2lz
dGVyKCkgaXMKPiA+IGRlZmluZWQgd2l0aCBpdHMgbGFzdCBwYXJhbWV0ZXIgYmVpbmcgZGVjbGFy
ZWQgY29uc3RhbnQuIEhlbmNlIG1ha2UKPiA+IG1pY3JvX2JsX3Byb3BzIGl0c2VsZiBjb25zdGFu
dCBhcyB3ZWxsLgo+ID4gSXNzdWUgZm91bmQgd2l0aCBDb2NjaW5lbGxlLgo+IAo+IERpZCB5b3Ug
ZG8gYW55IHJldmlldyB0byBzZWUgaWYgdGhpcyBwYXR0ZXJuIG9jY3VycyBpbiBvdGhlciBiYWNr
bGlnaHQKPiBkcml2ZXJzIChpdCBsb29rcyB0byBtZSBsaWtlIHRoZSBzYW1lIHBhdHRlcm4gYXBw
ZWFycyBpbgo+IHJhdmUtc3AtYmFja2xpZ2h0LmMuLi4gZG8gdGhlIHRvb2xzIGJyaW5nIHRoYXQg
b25lIG91dCBhcyB3ZWxsKS4KClBpbmc/CgoKRGFuaWVsLgoKCj4gPiBTaWduZWQtb2ZmLWJ5OiBO
aXNoa2EgRGFzZ3VwdGEgPG5pc2hrYWRnLmxpbnV4QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRy
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L2lwYXFfbWljcm9fYmwuYyB8IDIgKy0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2lwYXFfbWljcm9fYmwuYyBiL2RyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2lwYXFfbWljcm9fYmwuYwo+ID4gaW5kZXggMTEyM2Y2N2MxMmIzLi44NWIx
NmNjODI4NzggMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9pcGFxX21p
Y3JvX2JsLmMKPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2lwYXFfbWljcm9fYmwu
Ywo+ID4gQEAgLTQ0LDcgKzQ0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBiYWNrbGlnaHRfb3Bz
IG1pY3JvX2JsX29wcyA9IHsKPiA+ICAJLnVwZGF0ZV9zdGF0dXMgID0gbWljcm9fYmxfdXBkYXRl
X3N0YXR1cywKPiA+ICB9Owo+ID4gIAo+ID4gLXN0YXRpYyBzdHJ1Y3QgYmFja2xpZ2h0X3Byb3Bl
cnRpZXMgbWljcm9fYmxfcHJvcHMgPSB7Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBiYWNrbGln
aHRfcHJvcGVydGllcyBtaWNyb19ibF9wcm9wcyA9IHsKPiA+ICAJLnR5cGUgPSBCQUNLTElHSFRf
UkFXLAo+ID4gIAkubWF4X2JyaWdodG5lc3MgPSAyNTUsCj4gPiAgCS5wb3dlciA9IEZCX0JMQU5L
X1VOQkxBTkssCj4gPiAtLSAKPiA+IDIuMTkuMQo+ID4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
