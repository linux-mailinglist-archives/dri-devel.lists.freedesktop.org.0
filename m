Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B865C1931
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 21:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385A06E31C;
	Sun, 29 Sep 2019 19:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E876EF1C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 15:37:44 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RFbeYx051670;
 Fri, 27 Sep 2019 10:37:40 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RFbeNn015785;
 Fri, 27 Sep 2019 10:37:40 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 10:37:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 10:37:40 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RFba8k044922;
 Fri, 27 Sep 2019 10:37:37 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Adam Ford <aford173@gmail.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
Date: Fri, 27 Sep 2019 18:37:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Sun, 29 Sep 2019 19:47:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569598661;
 bh=Lqo9bBRFGck3umPvJYDrWptfCEGsJ4lcKhD97BGvgh4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=tw1025iq5dUXluSa0qqR4U6Bp2835f/huQP/igQAdoBf7BB9A6bmoqA6aXnTtrg0O
 Ci6gi14TCsYVDllFYOrN+WaIZG6gl6l46r44G4j7qzkkMdu8wcV2nGcTS4qr+7kJNV
 EK90yh8PU6/aLkGC+Q3CDLZh1e5gb7RHko52UUCk=
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
Cc: devicetree <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMDkvMjAxOSAxNjo0NywgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gT24gMjcvMDkvMjAx
OSAxNTozMywgQWRhbSBGb3JkIHdyb3RlOgo+IAo+Pj4gSXQgbG9va3MgbGlrZSBhIGJ1ZyBpbiBv
bWFwIGNsb2NrIGhhbmRsaW5nLgo+Pj4KPj4+IERTUyB1c2VzIGRzczFfYWx3b25fZmNrXzM0MzBl
czIgYXMgZmNsay4gZHNzMV9hbHdvbl9mY2tfMzQzMGVzMiBjb21lcwo+Pj4gZnJvbSBkcGxsNF9j
aywgYW5kIHRoZXJlJ3MgYSBkaXZpZGVyIGFmdGVyIHRoZSBQTEwsIGRwbGw0X200X2NrLgo+Pj4K
Pj4+IFdoZW4gdGhlIERTUyBkcml2ZXIgc2V0cyBkc3MxX2Fsd29uX2Zja18zNDMwZXMyIHJhdGUg
dG8gMjcwMDAwMDAgb3IKPj4+IDI3ODcwOTY3LCB3aGljaCBjYW4gYmUgY3JlYXRlZCB3aXRoIG00
IGRpdmlkZXJzIDMyIGFuZCAzMSwgaXQgbG9va3MgbGlrZQo+Pj4gdGhlIGRpdmlkZXIgZ29lcyB0
byBieXBhc3MsIG9yIHRvIGEgdmVyeSBzbWFsbCB2YWx1ZS4gRFNTIGdldHMgYSB2ZXJ5Cj4+PiBo
aWdoIGNsb2NrIHJhdGUgYW5kIGJyZWFrcyBkb3duLgo+Pgo+PiBJcyB0aGVyZSBhbnl0aGluZyBJ
IGNhbiBkbyB0byBoZWxwIHRyb3VibGVzaG9vdCB0aGlzP8KgIEkgY291bGQgaW5zZXJ0Cj4+IGEg
aGFjayB0aGF0IGNoZWNrcyBpZiB3ZSdyZSBvbWFwMyBhbmQgaWYgc28gbWFrZSB0aGUgZGl2aWRl
ciBlcXVhbCB0bwo+PiA0LCBidXQgdGhhdCBzZWVtcyBsaWtlIGp1c3QgYSBoYWNrLgo+PiBJIGNh
biBydW4gbW9yZSB0ZXN0cyBvciBpbnNlcnQgY29kZSBzb21ld2hlcmUgaWYgeW91IHdhbnQuCj4g
Cj4gSSB0aGluayBpdCdzIHVwIHRvIHNvbWVvbmUgd2hvJ3Mga25vd2xlZGdlYWJsZSBpbiBvbWFw
IGNsb2NrIGZyYW1ld29yay4gCj4gSSdtIGtpbmQgb2YgaG9waW5nIHRoYXQgVGVybyBvciBUb255
IHdvdWxkIGJlIHdpbGxpbmcgdG8gZGVidWcgPSkuIEkgY2FuIAo+IHRyeSB0byBmaW5kIHRpbWUg
dG8gZGVidWcgdGhlIG9tYXAgY2xrIGZyYW1ld29yaywgYnV0IEknbGwgYmUgZ29pbmcgb24gCj4g
YmxpbmRseSB0aGVyZS4KCklmIHlvdSBjYW4gcHJvdmlkZSBkZXRhaWxzIGFib3V0IHdoYXQgY2xv
Y2sgZnJhbWV3b3JrIC8gZHJpdmVyIGRvZXMgCndyb25nIChzYW1wbGUgY2xrX3NldF94eXogY2Fs
bCBzZXF1ZW5jZSwgZXhwZWN0ZWQgcmVzdWx0cyB2aWEgCmNsa19nZXRfeHl6LCBhbmQgd2hhdCBm
YWlscyksIEkgY2FuIHRha2UgYSBsb29rIGF0IGl0LiBKdXN0IHJlcG9ydGluZyAKYXJiaXRyYXJ5
IGRpc3BsYXkgZHJpdmVyIGlzc3VlcyBJIHdvbid0IGJlIGFibGUgdG8gZGVidWcgYXQgYWxsIChJ
IGRvbid0IApoYXZlIGFjY2VzcyB0byBhbnkgb2YgdGhlIGRpc3BsYXlzLCBub3IgZG8gSSB3YW50
IHRvIHdhc3RlIHRpbWUgCmRlYnVnZ2luZyB0aGVtIHdpdGhvdXQgYWJzb2x1dGVseSBubyBrbm93
bGVkZ2Ugd2hhdHNvZXZlci4pCgotVGVybwotLQpUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95
LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4gWS10dW5udXMvQnVzaW5lc3MgSUQ6
IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
