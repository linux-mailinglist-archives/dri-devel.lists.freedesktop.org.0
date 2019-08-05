Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E258982019
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 17:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F379B6E4B6;
	Mon,  5 Aug 2019 15:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AD86E495
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 15:28:20 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E946C21734
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 15:28:19 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id z4so81371276qtc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 08:28:19 -0700 (PDT)
X-Gm-Message-State: APjAAAWCAcZMooS6vdtlguDMudZhXtUija12c4AIECquEFhLeDxxUnQt
 X67EjSP52K0QISitWHxEkAjLl4k37Rv916W9RQ==
X-Google-Smtp-Source: APXvYqxXjw8XmBwL0enSNum1gkTWI7+BHw8p9CU0a90E4HCQu+3gGOHuO4zbgNYgnUYEtPMCmobpQW6y2Rv+IULc0q0=
X-Received: by 2002:aed:3fb0:: with SMTP id
 s45mr109113018qth.136.1565018899101; 
 Mon, 05 Aug 2019 08:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190805085847.25554-1-linus.walleij@linaro.org>
 <20190805085847.25554-3-linus.walleij@linaro.org>
In-Reply-To: <20190805085847.25554-3-linus.walleij@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 Aug 2019 09:28:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL=9fN=8ANmKP6-rSuK=r=yQCf92VQP16b=xwzne6Ea_A@mail.gmail.com>
Message-ID: <CAL_JsqL=9fN=8ANmKP6-rSuK=r=yQCf92VQP16b=xwzne6Ea_A@mail.gmail.com>
Subject: Re: [PATCH 2/4 v2] drm/panel: simple: Add TI nspire panel bindings
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565018900;
 bh=JyLT5/gBpzIk1rH7isrqNLBn5A/UpJtzoI2uZTecU7A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RFtcy4/Zr2lmLLd0LFtqbFK5BY8jwem5PK2/BDHaRth85BpGkm/3v0W2yZG3mAi8D
 t4gw/sfgHmEyb2bj29vlc4KC3uzEnmUrykIXkxCXiljCQSj3xgpypqZi8GdO8JshLq
 r7PwQE+TWDISIvHn74XfGvIMMhIEZ60ONvYmFNlI=
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
Cc: Fabian Vogt <fabian@ritter-vogt.de>, Daniel Tang <dt.tangr@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgNSwgMjAxOSBhdCAyOjU5IEFNIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBBZGQgYmluZGluZ3MgZm9yIHRoZSBUSSBOU1BJUkUg
c2ltcGxlIGRpc3BsYXkgcGFuZWxzLgo+Cj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
Cj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3Jn
Pgo+IC0tLQo+IENoYW5nZUxvZyB2MS0+djI6Cj4gLSBOZXcgcGF0Y2ggYXMgYmluZGluZ3MgYXJl
IHJlcXVpcmVkCj4gLSBMZXQncyB1c2UgWUFNTAo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC90aSxuc3BpcmUueWFtbCAgICAgfCAzNiArKysrKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC90aSxuc3BpcmUueWFt
bAo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3RpLG5zcGlyZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvdGksbnNwaXJlLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAwMC4uZmE4MTYwMmE5MjJhCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3RpLG5zcGly
ZS55YW1sCj4gQEAgLTAsMCArMSwzNiBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAo
R1BMLTIuMCsgT1IgWDExKQoKSSB0aGluayB5b3Ugd2FudCBNSVQgcmF0aGVyIHRoYW4gWDExLiBI
b3dldmVyLCB0aGUgcHJlZmVyZW5jZSBvbiBuZXcKYmluZGluZ3MgaXMgKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpLgoKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvdGksbnNwaXJlLnlhbWwjCj4gKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiAr
dGl0bGU6IFRleGFzIEluc3RydW1lbnRzIE5TUElSRSBEaXNwbGF5IFBhbmVscwo+ICsKPiArbWFp
bnRhaW5lcnM6Cj4gKyAgLSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
Cj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBvbmVPZjoKPiArICAg
ICAgLSBpdGVtczoKCllvdSBjYW4gZHJvcCB0aGlzLiBKdXN0ICdlbnVtJyBpcyBzdWZmaWNpZW50
LgoKPiArICAgICAgICAgIC0gZW51bToKPiArICAgICAgICAgICAgICAtIHRpLG5zcGlyZS1jeC1s
Y2QtcGFuZWwKPiArICAgICAgICAgICAgICAtIHRpLG5zcGlyZS1jbGFzc2ljLWxjZC1wYW5lbAo+
ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRpYmxlCj4gKwo+ICthZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgcGFuZWwgewo+ICsg
ICAgICAgIGNvbXBhdGlibGUgPSAidGksbnNwaXJlLWN4LWxjZC1wYW5lbCI7Cj4gKyAgICAgICAg
cG9ydHMgewo+ICsgICAgICAgICAgIHBvcnQgewoKWW91IG5lZWQgdG8gY2FwdHVyZSB0aGF0IHRo
ZXJlJ3MgYSBzaW5nbGUgcG9ydCBpbiB0aGUgc2NoZW1hLiBUaGVyZSdzCm5vdCByZWFsbHkgYSBs
b3Qgb2YgZXhhbXBsZXMgZm9yIHRoaXMgeWV0LCBidXQgeW91IHNob3VsZCBhZGQ6CgphbGxPZjoK
ICAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1sIwoKV2l0aCBhIHNpbmdsZSBwb3J0LCB5b3UgY2Fu
IGRyb3AgJ3BvcnRzJyBvciB5b3UgY2FuIGtlZXAgaXQuIElmIHlvdSBkbwp0aGUgbGF0dGVyLCB0
aGVuIHlvdSBuZWVkIHRvIGRlZmluZSAncG9ydHMnIGFuZCB0aGVuICdwb3J0JyBpbiB5b3VyCnNj
aGVtYS4gVGhlIGNvbW1vbiBzY2hlbWEgaXMgb25seSBzdWZmaWNpZW50IGlmIHlvdSBoYXZlIGEg
c2luZ2xlCidwb3J0JyBub2RlIG90aGVyd2lzZSB5b3UgbmVlZCB0byBkZWZpbmUgd2hhdCdzIHVu
ZGVyICdwb3J0cycuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
