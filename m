Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2B41E0C20
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 12:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAE789B69;
	Mon, 25 May 2020 10:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8284789B69
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 10:49:03 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 145F320787
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 10:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590403743;
 bh=JaNm1pxHcdFTHEfcWnLgCfYCRUWqjIyOO1ppdiFyTcA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lPYWdXoLsZG8rS3hIOZGmFgN40dC3sskIRuwGuzRZthWRpNI6st0UPWSlK9kMkicN
 v9ZNg7b0bafIScMH6Vf6ViHNKByDfS96dxewxy+ITnMODvLvUTRYf1ja+gV8wsMPDs
 YR9m4QMnLJy5Xvjj4wl1TqwuqvKYVccljxeL4Ygo=
Received: by mail-ej1-f52.google.com with SMTP id x20so19989694ejb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 03:49:03 -0700 (PDT)
X-Gm-Message-State: AOAM530DhmaFmsWDKeKBrItGNVYpzJd3WIrcWuZAVWXbRJrFmaME/QF7
 PGNpPePhGiiZrsgyR8BHGjyYbUFqtHuVkFoYLw==
X-Google-Smtp-Source: ABdhPJxruJfSdjdvgfbq0nfw9fuqGwWMLe3x9BYxE4feLX7uZnfvhAYbXa68e6qGZv8T6tfI5vi5EEB4k5vA7CV2VBE=
X-Received: by 2002:a17:906:bcf8:: with SMTP id
 op24mr17996305ejb.260.1590403741530; 
 Mon, 25 May 2020 03:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-11-git-send-email-dennis-yc.hsieh@mediatek.com>
 <5d6b61b2-23c9-647f-fa22-73e779010bd8@gmail.com>
 <CAAOTY___HNcRPr8Jq-wNPO_G9pLVjf2D7ezbpPcGbXVNYy1_nA@mail.gmail.com>
 <e487573a-2252-cd52-3a3d-c271f67fcb9a@gmail.com>
In-Reply-To: <e487573a-2252-cd52-3a3d-c271f67fcb9a@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 25 May 2020 18:48:49 +0800
X-Gmail-Original-Message-ID: <CAAOTY__LHZZc2kuifGQzdjPJLguj2C1F179poupHTr6HR-ub5w@mail.gmail.com>
Message-ID: <CAAOTY__LHZZc2kuifGQzdjPJLguj2C1F179poupHTr6HR-ub5w@mail.gmail.com>
Subject: Re: [PATCH v5 10/13] soc: mediatek: cmdq: export finalize function
To: Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, wsd_upstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 HS Liao <hs.liao@mediatek.com>, Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hdHRoaWFzOgoKTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g
5pa8IDIwMjDlubQ15pyIMjXml6Ug6YCx5LiAIOS4i+WNiDQ6Mzjlr6vpgZPvvJoKPgo+Cj4KPiBP
biAyNS8wNS8yMDIwIDAyOjIzLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gSGksIE1hdHRoaWFz
Ogo+ID4KPiA+IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+IOaWvCAy
MDIw5bm0NeaciDE35pelIOmAseaXpSDkuIrljYgyOjIy5a+r6YGT77yaCj4gPj4KPiA+Pgo+ID4+
Cj4gPj4gT24gMDgvMDMvMjAyMCAxMTo1MiwgRGVubmlzIFlDIEhzaWVoIHdyb3RlOgo+ID4+PiBF
eHBvcnQgZmluYWxpemUgZnVuY3Rpb24gdG8gY2xpZW50IHdoaWNoIGhlbHBzIGFwcGVuZCBlb2Mg
YW5kIGp1bXAKPiA+Pj4gY29tbWFuZCB0byBwa3QuIExldCBjbGllbnQgZGVjaWRlIGNhbGwgZmlu
YWxpemUgb3Igbm90Lgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBEZW5uaXMgWUMgSHNpZWgg
PGRlbm5pcy15Yy5oc2llaEBtZWRpYXRlay5jb20+Cj4gPj4+IFJldmlld2VkLWJ5OiBDSyBIdSA8
Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4+PiAtLS0KPiA+Pj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2NydGMuYyB8IDEgKwo+ID4+PiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRr
LWNtZHEtaGVscGVyLmMgIHwgNyArKy0tLS0tCj4gPj4+ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRp
YXRlay9tdGstY21kcS5oICAgfCA4ICsrKysrKysrCj4gPj4+ICAzIGZpbGVzIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiA+Pj4gaW5kZXggMGRmY2QxNzg3ZTY1Li43ZGFhYWJj
MjZlYjEgMTAwNjQ0Cj4gPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2NydGMuYwo+ID4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRj
LmMKPiA+Pj4gQEAgLTQ5MCw2ICs0OTAsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2NydGNfaHdf
Y29uZmlnKHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQo+ID4+PiAgICAgICAgICAgICAg
IGNtZHFfcGt0X2NsZWFyX2V2ZW50KGNtZHFfaGFuZGxlLCBtdGtfY3J0Yy0+Y21kcV9ldmVudCk7
Cj4gPj4+ICAgICAgICAgICAgICAgY21kcV9wa3Rfd2ZlKGNtZHFfaGFuZGxlLCBtdGtfY3J0Yy0+
Y21kcV9ldmVudCk7Cj4gPj4+ICAgICAgICAgICAgICAgbXRrX2NydGNfZGRwX2NvbmZpZyhjcnRj
LCBjbWRxX2hhbmRsZSk7Cj4gPj4+ICsgICAgICAgICAgICAgY21kcV9wa3RfZmluYWxpemUoY21k
cV9oYW5kbGUpOwo+ID4+PiAgICAgICAgICAgICAgIGNtZHFfcGt0X2ZsdXNoX2FzeW5jKGNtZHFf
aGFuZGxlLCBkZHBfY21kcV9jYiwgY21kcV9oYW5kbGUpOwo+ID4+PiAgICAgICB9Cj4gPj4+ICAj
ZW5kaWYKPiA+Pgo+ID4+IFRoaXMgc2hvdWxkIGJlIGEgaW5kZXBlbmRlbnQgcGF0Y2guCj4gPj4g
T3RoZXIgdGhlbiB0aGF0IHBhdGNoIGxvb2tzIGdvb2QuCj4gPgo+ID4gQXBwbHkgb25seSBkcm0g
cGFydCBvciBvbmx5IGNtZHEgaGVscHIgcGFydCwgaXQgd291bGQgYmUgYWJub3JtYWwuCj4KPiBS
aWdodCBpdCB3b3VsZCBicmVhayBEUk0gZHJpdmVyIChpZiBvbmx5IGFwcGxpZWQgdG8gY21kcSkg
b3IgY29tcGlsYXRpb24gaWYgb25seQo+IGFwcGxpZWQgdG8gRFJNLgo+Cj4gPiBTaGFsbCB3ZSBz
ZXBlcmF0ZSB0aGlzIHBhdGNoPwo+Cj4gQWZ0ZXIgdGhpbmtpbmcgdHdpY2UsIEkgdGhpbmsgd2Ug
Y2FuIGxlYXZlIGl0IGFzIGl0IGlzLiBJZiB5b3UgcHJvdmlkZSB5b3VyCj4gQWNrZWQtYnkgSSBj
YW4gdGFrZSBpdCB0aG9ydWdoIG15IHRyZWUsIGlmIHRoYXQncyBPSyBmb3IgeW91LgoKVGhpcyBp
cyBPSyBmb3IgbWUsIHNvCgpBY2tlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtl
cm5lbC5vcmc+Cgo+Cj4gUmVnYXJkcywKPiBNYXR0aGlhcwo+Cj4gPiBPciBzZXBlcmF0ZSBpdCBi
dXQgbWFrZSBzdXJlIHRoZXNlIHR3byBwYXRjaGVzIGJlIGluIHRoZSBzYW1lIHRyZWU/Cj4gPgo+
ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+ID4+Cj4gPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYyBiL2RyaXZlcnMvc29jL21lZGlh
dGVrL210ay1jbWRxLWhlbHBlci5jCj4gPj4+IGluZGV4IGE5ZWJiYWJiNzQzOS4uNTliYzExNjRi
NDExIDEwMDY0NAo+ID4+PiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxw
ZXIuYwo+ID4+PiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYwo+
ID4+PiBAQCAtMzcyLDcgKzM3Miw3IEBAIGludCBjbWRxX3BrdF9hc3NpZ24oc3RydWN0IGNtZHFf
cGt0ICpwa3QsIHUxNiByZWdfaWR4LCB1MzIgdmFsdWUpCj4gPj4+ICB9Cj4gPj4+ICBFWFBPUlRf
U1lNQk9MKGNtZHFfcGt0X2Fzc2lnbik7Cj4gPj4+Cj4gPj4+IC1zdGF0aWMgaW50IGNtZHFfcGt0
X2ZpbmFsaXplKHN0cnVjdCBjbWRxX3BrdCAqcGt0KQo+ID4+PiAraW50IGNtZHFfcGt0X2ZpbmFs
aXplKHN0cnVjdCBjbWRxX3BrdCAqcGt0KQo+ID4+PiAgewo+ID4+PiAgICAgICBzdHJ1Y3QgY21k
cV9pbnN0cnVjdGlvbiBpbnN0ID0geyB7MH0gfTsKPiA+Pj4gICAgICAgaW50IGVycjsKPiA+Pj4g
QEAgLTM5Miw2ICszOTIsNyBAQCBzdGF0aWMgaW50IGNtZHFfcGt0X2ZpbmFsaXplKHN0cnVjdCBj
bWRxX3BrdCAqcGt0KQo+ID4+Pgo+ID4+PiAgICAgICByZXR1cm4gZXJyOwo+ID4+PiAgfQo+ID4+
PiArRVhQT1JUX1NZTUJPTChjbWRxX3BrdF9maW5hbGl6ZSk7Cj4gPj4+Cj4gPj4+ICBzdGF0aWMg
dm9pZCBjbWRxX3BrdF9mbHVzaF9hc3luY19jYihzdHJ1Y3QgY21kcV9jYl9kYXRhIGRhdGEpCj4g
Pj4+ICB7Cj4gPj4+IEBAIC00MjYsMTAgKzQyNyw2IEBAIGludCBjbWRxX3BrdF9mbHVzaF9hc3lu
YyhzdHJ1Y3QgY21kcV9wa3QgKnBrdCwgY21kcV9hc3luY19mbHVzaF9jYiBjYiwKPiA+Pj4gICAg
ICAgdW5zaWduZWQgbG9uZyBmbGFncyA9IDA7Cj4gPj4+ICAgICAgIHN0cnVjdCBjbWRxX2NsaWVu
dCAqY2xpZW50ID0gKHN0cnVjdCBjbWRxX2NsaWVudCAqKXBrdC0+Y2w7Cj4gPj4+Cj4gPj4+IC0g
ICAgIGVyciA9IGNtZHFfcGt0X2ZpbmFsaXplKHBrdCk7Cj4gPj4+IC0gICAgIGlmIChlcnIgPCAw
KQo+ID4+PiAtICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gPj4+IC0KPiA+Pj4gICAgICAgcGt0
LT5jYi5jYiA9IGNiOwo+ID4+PiAgICAgICBwa3QtPmNiLmRhdGEgPSBkYXRhOwo+ID4+PiAgICAg
ICBwa3QtPmFzeW5jX2NiLmNiID0gY21kcV9wa3RfZmx1c2hfYXN5bmNfY2I7Cj4gPj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oIGIvaW5jbHVkZS9s
aW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaAo+ID4+PiBpbmRleCBmZWMyOTJhYWM4M2MuLjk5
ZTc3MTU1Zjk2NyAxMDA2NDQKPiA+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsv
bXRrLWNtZHEuaAo+ID4+PiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21k
cS5oCj4gPj4+IEBAIC0yMTMsNiArMjEzLDE0IEBAIGludCBjbWRxX3BrdF9wb2xsX21hc2soc3Ry
dWN0IGNtZHFfcGt0ICpwa3QsIHU4IHN1YnN5cywKPiA+Pj4gICAqLwo+ID4+PiAgaW50IGNtZHFf
cGt0X2Fzc2lnbihzdHJ1Y3QgY21kcV9wa3QgKnBrdCwgdTE2IHJlZ19pZHgsIHUzMiB2YWx1ZSk7
Cj4gPj4+Cj4gPj4+ICsvKioKPiA+Pj4gKyAqIGNtZHFfcGt0X2ZpbmFsaXplKCkgLSBBcHBlbmQg
RU9DIGFuZCBqdW1wIGNvbW1hbmQgdG8gcGt0Lgo+ID4+PiArICogQHBrdDogICAgIHRoZSBDTURR
IHBhY2tldAo+ID4+PiArICoKPiA+Pj4gKyAqIFJldHVybjogMCBmb3Igc3VjY2VzczsgZWxzZSB0
aGUgZXJyb3IgY29kZSBpcyByZXR1cm5lZAo+ID4+PiArICovCj4gPj4+ICtpbnQgY21kcV9wa3Rf
ZmluYWxpemUoc3RydWN0IGNtZHFfcGt0ICpwa3QpOwo+ID4+PiArCj4gPj4+ICAvKioKPiA+Pj4g
ICAqIGNtZHFfcGt0X2ZsdXNoX2FzeW5jKCkgLSB0cmlnZ2VyIENNRFEgdG8gYXN5bmNocm9ub3Vz
bHkgZXhlY3V0ZSB0aGUgQ01EUQo+ID4+PiAgICogICAgICAgICAgICAgICAgICAgICAgICAgIHBh
Y2tldCBhbmQgY2FsbCBiYWNrIGF0IHRoZSBlbmQgb2YgZG9uZSBwYWNrZXQKPiA+Pj4KPiA+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiA+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
