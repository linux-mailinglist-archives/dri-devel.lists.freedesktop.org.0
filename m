Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3368B79D1A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 01:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B064B89C6A;
	Mon, 29 Jul 2019 23:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A0189C6A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 23:54:34 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 702CF21773
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 23:54:34 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id 44so30249420qtg.11
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 16:54:34 -0700 (PDT)
X-Gm-Message-State: APjAAAX1GoCty3a8Amiem9NrsEmg9eOGax5MGFfRFQ4JzdiiL4/0JvpU
 2mIRySbC7Ipn9KVUAhVHMfVWSaxETsMtxLuy1g==
X-Google-Smtp-Source: APXvYqyvVVqVtiLHXCcmAnRN5s1dQ0v6PPdL5zspMJDODprjdlHMPqDWq1VLjpfR7WA8o08e4xLxr0pSQlrAw0k6B0M=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr79236510qtf.110.1564444473606; 
 Mon, 29 Jul 2019 16:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150414.9F97668B20@verein.lst.de>
 <20190725151829.DC20968B02@verein.lst.de>
 <20190726163601.o32bxqew5xavjgyi@flea> <20190729142258.GB7946@lst.de>
In-Reply-To: <20190729142258.GB7946@lst.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 29 Jul 2019 17:54:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKAU3WG3L=KP8A8u4vW=q_BQWPN-m_c+ADOwTioJ2-cmg@mail.gmail.com>
Message-ID: <CAL_JsqKAU3WG3L=KP8A8u4vW=q_BQWPN-m_c+ADOwTioJ2-cmg@mail.gmail.com>
Subject: Re: [PATCH v3 6a/7] dt-bindings: Add ANX6345 DP/eDP transmitter
 binding
To: Torsten Duwe <duwe@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564444474;
 bh=7M7iM5NZ1SgdUOG+BMFQMLBU2J1/FLifWH7WWo4vukw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wIDAiVgh8oFtCAHjZALXvXLlF06U5PG+b+RlokjKcUA+9gTiIQfq+hQf4JLn3jQqv
 5FCecCmkCjAKo3SLAn3us51NrlQf/6cZWaRJrH30n0bTmbsUgHMHgFxjBmnZ421Lz1
 XLXZCIiUws+DJYgL8XSsNCIr34nlTVVrVgiufrKM=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgODoyMyBBTSBUb3JzdGVuIER1d2UgPGR1d2VAbHN0LmRl
PiB3cm90ZToKPgo+IE9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDA2OjM2OjAxUE0gKzAyMDAsIE1h
eGltZSBSaXBhcmQgd3JvdGU6Cj4gPiA+ICsKPiA+ID4gKyAgZHZkZDEyLXN1cHBseToKPiA+ID4g
KyAgICBtYXhJdGVtczogMQo+ID4gPiArICAgIGRlc2NyaXB0aW9uOiBSZWd1bGF0b3IgZm9yIDEu
MlYgZGlnaXRhbCBjb3JlIHBvd2VyLgo+ID4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3BoYW5kbGUKPiA+ID4gKwo+ID4gPiArICBkdmRkMjUtc3VwcGx5Ogo+
ID4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiA+ICsgICAgZGVzY3JpcHRpb246IFJlZ3VsYXRvciBm
b3IgMi41ViBkaWdpdGFsIGNvcmUgcG93ZXIuCj4gPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+ID4KPiA+IFRoZXJlJ3Mgbm8gbmVlZCB0byBz
cGVjaWZ5IHRoZSB0eXBlIGhlcmUsIGFsbCB0aGUgcHJvcGVydGllcyBlbmRpbmcgaW4KPiA+IC1z
dXBwbHkgYXJlIGFscmVhZHkgY2hlY2tlZCBmb3IgdGhhdCB0eXBlCj4KPiBPaywgdGhhbmtzIGZv
ciB0aGUgaGludC4KPgo+ID4gPiArICBwb3J0czoKPiA+ID4gKyAgICB0eXBlOiBvYmplY3QKPiA+
ID4gKyAgICBtaW5JdGVtczogMQo+ID4gPiArICAgIG1heEl0ZW1zOiAyCj4gPiA+ICsgICAgZGVz
Y3JpcHRpb246IHwKPiA+ID4gKyAgICAgIFZpZGVvIHBvcnQgMCBmb3IgTFZUVEwgaW5wdXQsCj4g
PiA+ICsgICAgICBWaWRlbyBwb3J0IDEgZm9yIGVEUCBvdXRwdXQgKHBhbmVsIG9yIGNvbm5lY3Rv
cikKPiA+ID4gKyAgICAgIHVzaW5nIHRoZSBEVCBiaW5kaW5ncyBkZWZpbmVkIGluCj4gPiA+ICsg
ICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8taW50ZXJm
YWNlcy50eHQKPiA+Cj4gPiBZb3Ugc2hvdWxkIHByb2JhYmx5IGRlc2NyaWJlIHRoZSBwb3J0QDAg
YW5kIHBvcnRAMSBub2RlcyBoZXJlIGFzCj4gPiB3ZWxsLiBJdCB3b3VsZCBhbGxvdyB5b3UgdG8g
ZXhwcmVzcyB0aGF0IHRoZSBwb3J0IDAgaXMgbWFuZGF0b3J5IGFuZAo+ID4gdGhlIHBvcnQgMSBv
cHRpb25hbCwgd2hpY2ggZ290IGRyb3BwZWQgaW4gdGhlIGNvbnZlcnNpb24uCj4KPiBJIHdvdWxk
IGhhdmUgbGlrZWQgdG8sIGJ1dCBoYXZlIG5vdCBkaXNjb3ZlcmVkIHlldCBhIGNvbXByZWhlbnNp
dmUgc291cmNlCj4gb2YgaW5mb3JtYXRpb24gYWJvdXQgcmVjb21tZW5kZWQgc3ludGF4IGFuZCBz
ZW1hbnRpY3Mgb2YgdGhlIFlBTUwgc2NoZW1lcy4KClRoZSBsYW5ndWFnZSBpcyBqc29uLXNjaGVt
YS4KCj4gSXMgdGhlcmUgc29tZSBjZW50cmFsIHJlZmVyZW5jZSBmb3IgdGhlc2UgdHlwZXMgb2Yg
aXNzdWVzPyBJIG1lYW4gbm90IHRoZQo+ICJoZXJlIGlzIGEgZ2l0IHJlcG8gd2l0aCB0aGUgbWV0
YS1zY2hlbWVzIiBidXQgc29ydCBvZiBhIGNvb2tib29rPwoKRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL3dyaXRpbmctc2NoZW1hLm1kIChzb29uIC5yc3QpIGFuZApEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZXhhbXBsZS1zY2hlbWEueWFtbCBhdHRlbXB0IHRvIGRvCnRoaXMuIEFu
eSBmZWVkYmFjayBvbiB0aGVtIHdvdWxkIGJlIGhlbHBmdWwuCgpGb3IgdGhpcyBjYXNlIHNwZWNp
ZmljYWxseSwgd2UgZG8gbmVlZCB0byBkZWZpbmUgYSBjb21tb24gZ3JhcGgKc2NoZW1hLCBidXQg
aGF2ZW4ndCB5ZXQuIFlvdSBjYW4gYXNzdW1lIHdlIGRvIGFuZCBvbmx5IHJlYWxseSBuZWVkIHRv
CmNhcHR1cmUgd2hhdCBNYXhpbWUgc2FpZCBhYm92ZS4KClJvYgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
