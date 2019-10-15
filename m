Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16BD75AE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 13:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01086E0F7;
	Tue, 15 Oct 2019 11:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8499B6E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:59:33 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0681F2067B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:59:33 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id x4so14934845qkx.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 04:59:32 -0700 (PDT)
X-Gm-Message-State: APjAAAWdrB6bvgbzBsNANTk2QB1L3Dakuq4FuxT9N0vsX6QShQGzplvT
 S9XVfAxl6OnRB8ORYFECgT9L/EpcIlze6jIddw==
X-Google-Smtp-Source: APXvYqzNmdpQLv1ZY4dfXYstvDGi8i0lhQoVAv4EDAOUiKb/kipWtgsZg9Ajty5FutZsbgWLBR0tMAU7hcKcVUfh5qs=
X-Received: by 2002:a37:9847:: with SMTP id a68mr35615608qke.223.1571140772087; 
 Tue, 15 Oct 2019 04:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191015082811.29497-1-linus.walleij@linaro.org>
In-Reply-To: <20191015082811.29497-1-linus.walleij@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Oct 2019 06:59:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJXES8CHGHtyhHo5CWrRjx9QgUVEpHCPc5miN7wEPv8sQ@mail.gmail.com>
Message-ID: <CAL_JsqJXES8CHGHtyhHo5CWrRjx9QgUVEpHCPc5miN7wEPv8sQ@mail.gmail.com>
Subject: Re: [PATCH 1/3 v2] drm/panel: Add generic DSI panel YAML bindings
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571140773;
 bh=P9hmIOQRJU1ioDVTNeU3qPnzy7l3RxwS6/vcyFV4idQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nmKKD8BHMqJhAVIN/DHtIXuW0tr2sujhlgUMFm1zbDNuB3/IRFxnJxqC2Z/je2f4l
 /4QlUNvvHVdS3bNLMV8YxEZBcKhuKRAvKPZAUjcGgckyxn7UwZtgXbWB6q1oDQryiz
 uCRQwVrlpZYmmjK5y4LfrDBXHtu9nlrNJ6be3HOE=
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMzoyOCBBTSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBhZGRzIGEgc3RhcnRpbmcgcG9pbnQgZm9y
IHByb2Nlc3NpbmcgYW5kIGRlZmluaW5nIGdlbmVyaWMKPiBiaW5kaW5ncyB1c2VkIGJ5IERTSSBw
YW5lbHMuIFdlIGp1c3QgZGVmaW5lIG9uZSBzaW5nbGUgYm9vbAo+IHByb3BlcnR5IHRvIGZvcmNl
IHRoZSBwYW5lbCBpbnRvIHZpZGVvIG1vZGUgZm9yIG5vdy4KPgo+IENjOiBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZwo+IFN1Z2dlc3RlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+Cj4gLS0tCj4gQ2hhbmdlTG9nIHYxLT52MjoKPiAtIE5ldyBwYXRjaCBhZnRlciBmZWVkYmFj
ay4KPiAtLS0KPiAgLi4uL2Rpc3BsYXkvcGFuZWwvcGFuZWwtZHNpLWNvbW1vbi55YW1sICAgICAg
IHwgMzEgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtZHNpLWNvbW1vbi55YW1sCj4KPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtZHNp
LWNvbW1vbi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvcGFuZWwtZHNpLWNvbW1vbi55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjQyNDJkYzI1YzkxNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1kc2ktY29t
bW9uLnlhbWwKPiBAQCAtMCwwICsxLDMxIEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAKCihHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSBmb3IgbmV3IGJpbmRpbmdz
LgoKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtZHNpLWNvbW1vbi55YW1sIwo+ICskc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBD
b21tb24gUHJvcGVydGllcyBmb3IgRFNJIERpc3BsYXkgUGFuZWxzCj4gKwo+ICttYWludGFpbmVy
czoKPiArICAtIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiArCj4g
K2Rlc2NyaXB0aW9uOiB8Cj4gKyAgVGhpcyBkb2N1bWVudCBkZWZpbmVzIGRldmljZSB0cmVlIHBy
b3BlcnRpZXMgY29tbW9uIHRvIERTSSwgRGlzcGxheQo+ICsgIFNlcmlhbCBJbnRlcmZhY2UgcGFu
ZWxzLiBJdCBkb2Vzbid0IGNvbnN0aXR1ZSBhIGRldmljZSB0cmVlIGJpbmRpbmcKCmNvbnN0aXR1
dGUKCj4gKyAgc3BlY2lmaWNhdGlvbiBieSBpdHNlbGYgYnV0IGlzIG1lYW50IHRvIGJlIHJlZmVy
ZW5jZWQgYnkgZGV2aWNlIHRyZWUKPiArICBiaW5kaW5ncy4KPiArCj4gKyAgV2hlbiByZWZlcmVu
Y2VkIGZyb20gcGFuZWwgZGV2aWNlIHRyZWUgYmluZGluZ3MgdGhlIHByb3BlcnRpZXMgZGVmaW5l
ZCBpbgo+ICsgIHRoaXMgZG9jdW1lbnQgYXJlIGRlZmluZWQgYXMgZm9sbG93cy4gVGhlIHBhbmVs
IGRldmljZSB0cmVlIGJpbmRpbmdzIGFyZQo+ICsgIHJlc3BvbnNpYmxlIGZvciBkZWZpbmluZyB3
aGV0aGVyIGVhY2ggcHJvcGVydHkgaXMgcmVxdWlyZWQgb3Igb3B0aW9uYWwuCj4gKwo+ICtwcm9w
ZXJ0aWVzOgo+ICsKPiArICBlbmZvcmNlLXZpZGVvLW1vZGU6CgpBcyBhbGwgRFNJIHBhbmVscyBh
cmUgYSBjaGlsZCBvZiBEU0kgY29udHJvbGxlcnMgKHVubGVzcyBwZXJoYXBzIGlmCnRoZXkgYXJl
IHZpZGVvIG1vZGUgb25seSksIEkgdGhpbmsgdGhpcyBzY2hlbWEgbmVlZHMgdG8gZGVmaW5lIHRo
ZSBEU0kKY29udHJvbGxlciBhbmQgcGFuZWwgKGkuZS4gdGhlIGJ1cykgc3RydWN0dXJlLiBUaGVu
IHRoaXMgcHJvcGVydHkgY2FuCmJlIHVuZGVyIHRoZSBjaGlsZCBub2RlIHNjaGVtYS4KClNvIHNv
bWV0aGluZyBsaWtlIHRoaXM6Cgpwcm9wZXJ0aWVzOgogICRub2RlbmFtZToKICAgIHBhdHRlcm46
ICJeZHNpLWNvbnRyb2xsZXJAIgogICIjYWRkcmVzcy1jZWxscyI6CiAgICBjb25zdDogMQogICIj
c2l6ZS1jZWxscyI6CiAgICBjb25zdDogMQpwYXR0ZXJuUHJvcGVydGllczoKICAiXnBhbmVsQFsw
LTldJCI6ICMgbm90IHN1cmUgd2hhdCdzIHRoZSByYW5nZSBvZiBhZGRyZXNzZXMuLi4KICAgIHR5
cGU6IG9iamVjdAogICAgcHJvcGVydGllczoKICAgICAgcmVnOgogICAgICAgIG1heEl0ZW1zOiAx
CiAgICAgICAgaXRlbXM6CiAgICAgICAgICAtIG1heGltdW06ID8/CiAgICAgIGVuZm9yY2Utdmlk
ZW8tbW9kZToKICAgICAgICAuLi4KCgo+ICsgICAgdHlwZTogYm9vbGVhbgo+ICsgICAgZGVzY3Jp
cHRpb246Cj4gKyAgICAgIFRoZSBiZXN0IG9wdGlvbiBpcyB1c3VhbGx5IHRvIHJ1biBhIHBhbmVs
IGluIGNvbW1hbmQgbW9kZSwgYXMgdGhpcwo+ICsgICAgICBnaXZlcyBiZXR0ZXIgY29udHJvbCBv
dmVyIHRoZSBwYW5lbCBoYXJkd2FyZS4gSG93ZXZlciBmb3IgZGlmZmVyZW50Cj4gKyAgICAgIHJl
YXNvbnMgbGlrZSBicm9rZW4gaGFyZHdhcmUsIG1pc3NpbmcgZmVhdHVyZXMgb3IgdGVzdGluZywg
aXQgbWF5IGJlCj4gKyAgICAgIHVzZWZ1bCB0byBiZSBhYmxlIHRvIGZvcmNlIGEgY29tbWFuZCBt
b2RlLWNhcGFibGUgcGFuZWwgaW50byB2aWRlbwo+ICsgICAgICBtb2RlLgo+IC0tCj4gMi4yMS4w
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
