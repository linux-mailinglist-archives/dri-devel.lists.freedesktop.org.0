Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79C055117
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 16:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302E16E113;
	Tue, 25 Jun 2019 14:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44FB6E114
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:07:59 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w20so19752171edd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 07:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=CAtg3PLJ+XKSV8dAF2QLAFWrkpUis1quRM8X3SddO/c=;
 b=qbd+pofnIZ7sHC5WF+9vn8TLW5wailj/w4cEGtjeFtuJlQOWby4XTetZxBL7ybvbun
 T51K30QOS5QTlkl59JNve3yXWzz1qqRsAHao52yGStIZHLy5VwY7CFhIrBLTox4Re8Ku
 UYnmmdYVJCBr84wncrGIKm8OV+2ZTTEULJbmowRyYFy9ZyZtQGRKpHbXQTbeVt+QowwF
 nh5O7w4/VdGvyMbulYzu78DL/wL8QRO9YUC349ai4TKduTddLG/1v9IBFQrnct1WOnHO
 uxbaXDM+BCgA76hBHJl+k1hlVYoJTLnS+VnEIbiOiwHAJywhEjxe/EXe8Ez51pgDPpM1
 8OUw==
X-Gm-Message-State: APjAAAXPQJ1JbLGpc4DhjagE2miyH2M3xm1dADDObL1TL78ymzRBgdiY
 4T9Q1pKCjLOEAgw+15OQ0GTODQ==
X-Google-Smtp-Source: APXvYqwnUNvO8RCgD+CoeE0AtlUeuwzv5wVl2MiDkEcmAY2cVmivLFNLtUKUMk2lZa5wxlyqXHk8gw==
X-Received: by 2002:a50:92e1:: with SMTP id l30mr77999218eda.141.1561471678547; 
 Tue, 25 Jun 2019 07:07:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w17sm4594091edi.15.2019.06.25.07.07.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 07:07:57 -0700 (PDT)
Date: Tue, 25 Jun 2019 16:07:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.velikov@collabora.com>
Subject: Re: [PATCH 0/2] Associate ddc adapters with connectors
Message-ID: <20190625140755.GT12905@phenom.ffwll.local>
Mail-Followup-To: Emil Velikov <emil.velikov@collabora.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
References: <cover.1561452052.git.andrzej.p@collabora.com>
 <20190625100351.52ddptvb2gizaepi@shell.armlinux.org.uk>
 <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
 <20190625133639.GA16031@arch-x1c3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625133639.GA16031@arch-x1c3>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=CAtg3PLJ+XKSV8dAF2QLAFWrkpUis1quRM8X3SddO/c=;
 b=DlsNVgfRWTP8NpGGrX9t3Nbz1zo7ltZhwtKOk/Es+ZdbHwht+lr3TCIe70hcYOlrBR
 ABPEEparLAqoeRRvZ5Pzq1cEVMTiKJ3tiqSO4M7ZzKp6aqKBOmxw686MYovwaEFXhy8l
 NK+f1Jf6pSuG3cXFg7wdY+FYcdimxOYB8sVXQ=
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
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDI6MzY6MzlQTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IE9uIDIwMTkvMDYvMjUsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiA+IEhp
IFJ1c3NlbGwsCj4gPiAKPiA+IFcgZG5pdSAyNS4wNi4yMDE5IG/CoDEyOjAzLCBSdXNzZWxsIEtp
bmcgLSBBUk0gTGludXggYWRtaW4gcGlzemU6Cj4gPiA+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0
IDExOjQ2OjM0QU0gKzAyMDAsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiA+ID4gPiBJ
dCBpcyBkaWZmaWN1bHQgZm9yIGEgdXNlciB0byBrbm93IHdoaWNoIG9mIHRoZSBpMmMgYWRhcHRl
cnMgaXMgZm9yIHdoaWNoCj4gPiA+ID4gZHJtIGNvbm5lY3Rvci4gVGhpcyBzZXJpZXMgYWRkcmVz
c2VzIHRoaXMgcHJvYmxlbS4KPiA+ID4gPiAKPiA+ID4gPiBUaGUgaWRlYSBpcyB0byBoYXZlIGEg
c3ltYm9saWMgbGluayBpbiBjb25uZWN0b3IncyBzeXNmcyBkaXJlY3RvcnksIGUuZy46Cj4gPiA+
ID4gCj4gPiA+ID4gbHMgLWwgL3N5cy9jbGFzcy9kcm0vY2FyZDAtSERNSS1BLTEvaTJjLTIKPiA+
ID4gPiBscnd4cnd4cnd4IDEgcm9vdCByb290IDAgSnVuIDI0IDEwOjQyIC9zeXMvY2xhc3MvZHJt
L2NhcmQwLUhETUktQS0xL2kyYy0yIFwKPiA+ID4gPiAJLT4gLi4vLi4vLi4vLi4vc29jLzEzODgw
MDAwLmkyYy9pMmMtMgo+ID4gPiAKPiA+ID4gRG9uJ3QgeW91IHdhbnQgdGhlIHN5bWxpbmsgbmFt
ZSB0byBiZSAiaTJjIiBvciBzb21ldGhpbmcgZml4ZWQsIHJhdGhlcgo+ID4gPiB0aGFuIHRoZSBu
YW1lIG9mIHRoZSBpMmMgYWRhcHRlcj8gIE90aGVyd2lzZSwgeW91IHNlZW0gdG8gYmUgZW5jdW1i
ZXJpbmcKPiA+ID4gdXNlcnNwYWNlIHdpdGggc2VhcmNoaW5nIHRoZSBkaXJlY3RvcnkgdG8gdHJ5
IGFuZCBmaW5kIHRoZSBzeW1saW5rLgo+ID4gPiAKPiA+IAo+ID4gVGhhbmsgeW91IGZvciB5b3Vy
IGNvbW1lbnQuIFNvIHlvdSBpbWFnaW5lIHNvbWV0aGluZyBvbiB0aGUgbGluZXMgb2Y6Cj4gPiAK
PiA+IGxyd3hyd3hyd3ggMSByb290IHJvb3QgMCBKdW4gMjQgMTA6NDIgL3N5cy9jbGFzcy9kcm0v
Y2FyZDAtSERNSS1BLTEvZGRjIFwKPiA+ICAJLT4gLi4vLi4vLi4vLi4vc29jLzEzODgwMDAwLmky
Yy9pMmMtMgo+ID4gCj4gPiA/Cj4gPiAKPiBGd2l3IG15IEludGVsIG1hY2hpbmUgbGlzdHMgYSBu
dW1iZXIgb2YgaTJjIGRldmljZXM6Cj4gL3N5cy9jbGFzcy9kcm0vY2FyZDAtRFAtMS9pMmMtNgo+
IC9zeXMvY2xhc3MvZHJtL2NhcmQwLURQLTIvaTJjLTcKPiAvc3lzL2NsYXNzL2RybS9jYXJkMC1l
RFAtMS9pMmMtNQo+IAo+IE5vdGU6IEkgaGF2ZW4ndCBsb29rZWQgX2lmXyB0aGV5IHJlbGF0ZSB0
byBvbmVzIHlvdSdyZSBwcm9wb3NpbmcgaGVyZS4KPiAKPiBPbmUgdGhpbmcgd29ydGggbWVudGlv
bmluZyBpcywgdGhlIG9uZXMgSSd2ZSBzZWVuIGFyZSBub3Qgc3ltbGlua3MgdG8KPiBhbm90aGVy
IHN5c2ZzIGVudHJpZXMuIEFuZCB0aGVyZSBhcmVuJ3QgYW55IGkyYyBub2RlcyBpbiAvZGV2IC4u
Lgo+IAo+IEp1c3QgYSByYW5kb20gZm9vZCBmb3IgdGhvdWdodCA6LSkKClRob3NlIGFyZSB0aGUg
aTJjLW92ZXItZHAtYXV4IGNvbnRyb2xsZXJzLiBJIHRoaW5rIHdlIHdhbnQgdG8gbGlzdCB0aGVz
ZQp0b28uCgpCdHcgdG8gbWFrZSB0aGlzIG1vcmUgdXNlZnVsIG1heWJlIHNvbWUgZGVmYXVsdCBp
bXBsZW1lbnRhdGlvbnMgZm9yCmdldF9tb2RlcyB3aGljaCBhdXRvbWF0aWNhbGx5IGR0cnQsIGFz
IGEgaGVscGVyPyBQcm9iYWJseSBjb3VsZCB1c2UgdGhhdAp0byBzcXVhc2ggcXVpdGUgYSBiaXQg
b2YgYm9pbGVycGxhdGUuCgpPdGhlcndpc2UgSSBsaWtlIHRoaXMuIEJpZ2dlc3QgcHJvYmxlbSBJ
J20gc2VlaW5nIGhlcmUgaXMgcm9sbGluZyB0aGlzIG91dApldmVyeXdoZXJlLCB0aGlzIGlzIGEg
bG90IG9mIHdvcmsuIEFuZCB3aXRob3V0IHdpZGVzcHJlYWQgYWRvcHRpb25zIGl0J3MKbm90IHRl
cnJpYmx5IHVzZWZ1bCBmb3IgdXNlcnNwYWNlLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
