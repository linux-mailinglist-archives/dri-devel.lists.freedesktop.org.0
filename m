Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4971BA84A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 17:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18F88930C;
	Mon, 27 Apr 2020 15:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C31892EF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 15:46:22 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id gr25so14477245ejb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vN8ZtTEMOm40Zgoqr2j2go1H/JlhYwioxL2VoPsyXMo=;
 b=ttj6lh9DKFqI6FCAfkt78mAg+UHT9NdzDneoNhGeUX98lZIbzCMB3AwAnA/VWc2pGW
 Oxwa0CgFYqKy5nMhWi4/FmI2OFKhOkIHllLS4KA9nWHjN08q3FbXOO2CWpU5PK2hS7EO
 ZWwTkvEfaiBsLfV/w3qAgvdvTip312fz7nYSo2i7iVjnikOV5gRV+I4cRTpScXPRTC9+
 VcXW57x/+Wshi1zR6nAf1RJ4CsyDN0zyyXbq52nPCtPfsmBze3oFa5L0wLecUzXaLPAC
 uxdJ64J+efBc2367ojznxevEq0XjGMoX8L1EemUUTgca39Vp+gNcD8v3mtOpd4Jfc3xd
 z7yw==
X-Gm-Message-State: AGi0PubZ0pae94oLOOUljN1nGmUqKM0O40WWXAlXWBtlzU1kA3tvfbfm
 V3N3IDBUc5WjXr64KFt9LpY=
X-Google-Smtp-Source: APiQypJaGHIqdott9ULGc1vIvIC2hB4wMVjvSOJwybdeeq2XFdtUhgVC8YxEO2xmFZWEXRWg3+ZkRg==
X-Received: by 2002:a17:906:3713:: with SMTP id
 d19mr19332049ejc.111.1588002380871; 
 Mon, 27 Apr 2020 08:46:20 -0700 (PDT)
Received: from pi3 ([194.230.155.237])
 by smtp.googlemail.com with ESMTPSA id v14sm1947180edx.67.2020.04.27.08.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 08:46:20 -0700 (PDT)
Date: Mon, 27 Apr 2020 17:46:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Bakker <xc-racer2@live.ca>
Subject: Re: [PATCH v7 08/12] arm: dts: s5pv210: Add node for SGX 540
Message-ID: <20200427154617.GA1798@pi3>
References: <cover.1587760454.git.hns@goldelico.com>
 <3fd18c747426e15fd1f3500b9c4adce2db9ddd0c.1587760454.git.hns@goldelico.com>
 <NYBE9Q.YH08US7A7DC3@crapouillou.net>
 <BN6PR04MB0660A180D2069848E5C03D7EA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN6PR04MB0660A180D2069848E5C03D7EA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 James Hogan <jhogan@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 kernel@pyra-handheld.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBcHIgMjYsIDIwMjAgYXQgMDc6NTc6MTJBTSAtMDcwMCwgSm9uYXRoYW4gQmFra2Vy
IHdyb3RlOgo+IEhpIFBhdWwsCj4gCj4gT24gMjAyMC0wNC0yNiA1OjU2IGEubS4sIFBhdWwgQ2Vy
Y3VlaWwgd3JvdGU6Cj4gPiAKPiA+IAo+ID4gTGUgdmVuLiAyNCBhdnJpbCAyMDIwIMOgIDIyOjM0
LCBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+IGEgw6ljcml0IDoKPiA+
PiBGcm9tOiBKb25hdGhhbiBCYWtrZXIgPHhjLXJhY2VyMkBsaXZlLmNhPgo+ID4+Cj4gPj4gQWxs
IHM1cHYyMTAgZGV2aWNlcyBoYXZlIGEgUG93ZXJWUiBTR1ggNTQwIChyZXZpc2lvbiAxMjApIGF0
dGFjaGVkLgo+ID4+Cj4gPj4gVGhlcmUgaXMgbm8gZXh0ZXJuYWwgcmVndWxhdG9yIGZvciBpdCBz
byBpdCBjYW4gYmUgZW5hYmxlZCBieSBkZWZhdWx0Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTog
Sm9uYXRoYW4gQmFra2VyIDx4Yy1yYWNlcjJAbGl2ZS5jYT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBI
LiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+Cj4gPj4gLS0tCj4gPj4gwqBh
cmNoL2FybS9ib290L2R0cy9zNXB2MjEwLmR0c2kgfCAxMyArKysrKysrKysrKysrCj4gPj4gwqAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3M1cHYyMTAuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3M1cHYyMTAu
ZHRzaQo+ID4+IGluZGV4IDJhZDY0MmY1MWZkOS4uYWJiZGRhMjA1YzFiIDEwMDY0NAo+ID4+IC0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3M1cHYyMTAuZHRzaQo+ID4+ICsrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3M1cHYyMTAuZHRzaQo+ID4+IEBAIC01MTIsNiArNTEyLDE5IEBAIHZpYzM6IGludGVy
cnVwdC1jb250cm9sbGVyQGYyMzAwMDAwIHsKPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
I2ludGVycnVwdC1jZWxscyA9IDwxPjsKPiA+PiDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gPj4KPiA+
PiArwqDCoMKgwqDCoMKgwqAgZ3B1OiBncHVAZjMwMDAwMDAgewo+ID4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic2Ftc3VuZyxzNXB2MjEwLXNneDU0MC0xMjAiOwoKVGhp
cyBzaG91bGQgbm90IHBhc3MgdGhlIGJpbmRpbmdzIGNoZWNrIGJlY2F1c2UgeW91IG1pc3NlZCBs
YXN0CmNvbXBhdGlibGVzLgoKPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHhm
MzAwMDAwMCAweDEwMDAwPjsKPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHQt
cGFyZW50ID0gPCZ2aWMyPjsKPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHRz
ID0gPDEwPjsKPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9ICJjb3Jl
IjsKPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8JmNsb2NrcyBDTEtfRzNE
PjsKPiA+PiArCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXNzaWduZWQtY2xvY2tzID0g
PCZjbG9ja3MgTU9VVF9HM0Q+LCA8JmNsb2NrcyBET1VUX0czRD47Cj4gPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MD4sIDw2NjcwMDAwMD47Cj4gPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmY2xvY2tz
IE1PVVRfTVBMTD47Cj4gPiAKPiA+IFdoYXQgYXJlIHRoZXNlIGNsb2NrcyBmb3IsIGFuZCB3aHkg
YXJlIHRoZXkgcmVwYXJlbnRlZCAvIHJlY2xvY2tlZD8KPiA+IAo+ID4gU2hvdWxkbid0IHRoZXkg
YmUgcGFzc2VkIHRvICdjbG9ja3MnIGFzIHdlbGw/Cj4gPiAKPiA+IC1QYXVsCj4gPiAKPiAKPiBU
aGUgRzNEIGNsb2NrIHN5c3RlbSBjYW4gaGF2ZSBtdWx0aXBsZSBwYXJlbnRzLCBhbmQgZm9yIHN0
YWJsZSBvcGVyYXRpb24KPiBpdCdzIHJlY29tbWVuZGVkIHRvIHVzZSB0aGUgTVBMTCBjbG9jayBh
cyB0aGUgcGFyZW50ICh3aGljaCBpbiB0dXJuCj4gaXMgYWN0dWFsbHkgYSBtdXggYXMgd2VsbCku
ICBNT1VUX0czRCBpcyBzaW1wbHkgdGhlIG11eCBmb3IgQ0xLX0czRAo+IChTR1ggY29yZSBjbG9j
ayksIERPVVRfRzNEIGlzIHRoZSBkaXZpZGVyLiAgRE9VVF9HM0QgY291bGQgZXF1YWxseSBiZSBD
TEtfRzNECj4gKGFuZCBwcm9iYWJseSBzaG91bGQgYmUsIGZvciByZWFkYWJpbGl0eSkgYXMgQ0xL
X0czRCBpcyBzaW1wbHkgdGhlIGdhdGUgYW5kCj4gRE9VVF9HM0QgaXMgdGhlIGRpdmlkZXIgZm9y
IGl0LgoKR29vZCBwb2ludCwgaXQgc2hvdWxkIGJlIENMS19HM0QgaW5zdGVhZCBvZiBET1VULiAg
Q2FuIHlvdSBmaXggdGhpcyBhcwp3ZWxsPwoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
