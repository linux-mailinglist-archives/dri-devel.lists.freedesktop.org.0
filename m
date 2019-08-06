Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FA3834B9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 17:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E1F6E3D0;
	Tue,  6 Aug 2019 15:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5B76E3D0
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 15:08:40 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E867216B7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 15:08:40 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id m14so37418551qka.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 08:08:40 -0700 (PDT)
X-Gm-Message-State: APjAAAWL03jXPDRuP4tIXsP4/ETbzbrKxRaBVIDL0HyvrttY7oQXRx8A
 niZ5BP/gDrCYn8+E5WPr+U5UdWW8/gqidmLOZQ==
X-Google-Smtp-Source: APXvYqyQV4wEEmZhSA+j8ENwA9FbtFTNYI7k0yHe988e2uBxbQ2pr9cpCaAhs+c/HhAj3FcSjiAMbKO0gd3bXaJy+Qk=
X-Received: by 2002:a05:620a:1447:: with SMTP id
 i7mr3707706qkl.254.1565104119510; 
 Tue, 06 Aug 2019 08:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190806124416.15561-1-narmstrong@baylibre.com>
 <20190806124416.15561-3-narmstrong@baylibre.com>
In-Reply-To: <20190806124416.15561-3-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 6 Aug 2019 09:08:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKS7KeUBhEn1kxT0HZddOZ6oDaZDStUppSdL2vXfAuccg@mail.gmail.com>
Message-ID: <CAL_JsqKS7KeUBhEn1kxT0HZddOZ6oDaZDStUppSdL2vXfAuccg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: amlogic,meson-vpu: convert
 to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565104120;
 bh=VpWEkU6IuB9MKJEVKTtxrOVk3OpmDNPUntTQRVdPPjI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gBKJg6TxdC+vQExGKn64eE75JBTmBoihbkbw9SdnbrmNUVEnIOjtwjUK1H01EXo6M
 Br04JxfAeakIv0j+fapypAxNhtF6XfDzUUS55gf2LFd0Y+SDq5sfAEzmps22/yacwg
 Wbyy7JOUZwflGgSMqI8oU5Y8AQAKP81GbnpD13z8=
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCA2OjQ0IEFNIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25n
QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBOb3cgdGhhdCB3ZSBoYXZlIHRoZSBEVCB2YWxpZGF0
aW9uIGluIHBsYWNlLCBsZXQncyBjb252ZXJ0IHRoZSBkZXZpY2UgdHJlZQo+IGJpbmRpbmdzIGZv
ciB0aGUgQW1sb2dpYyBEaXNwbGF5IENvbnRyb2xsZXIgb3ZlciB0byBZQU1MIHNjaGVtYXMuCj4K
PiBUaGUgb3JpZ2luYWwgZXhhbXBsZSBoYXMgYSBsZWZ0b3ZlciAiZG1jIiBtZW1vcnkgY2VsbCwg
dGhhdCBoYXMgYmVlbgo+IHJlbW92ZWQgaW4gdGhlIHlhbWwgcmV3cml0ZS4KPgo+IFRoZSBwb3J0
IGNvbm5lY3Rpb24gdGFibGUgaGFzIGJlZW4gZHJvcHBlZCBpbiBmYXZvciBvZiBhIGRlc2NyaXB0
aW9uCj4gb2YgZWFjaCBwb3J0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5h
cm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9hbWxv
Z2ljLG1lc29uLXZwdS50eHQgICAgfCAxMjEgLS0tLS0tLS0tLS0tLS0tCj4gIC4uLi9iaW5kaW5n
cy9kaXNwbGF5L2FtbG9naWMsbWVzb24tdnB1LnlhbWwgICB8IDEzOCArKysrKysrKysrKysrKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMzggaW5zZXJ0aW9ucygrKSwgMTIxIGRlbGV0aW9ucygt
KQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi12cHUudHh0Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLXZwdS55
YW1sCgo+ICsgIHBvd2VyLWRvbWFpbnM6Cj4gKyAgICBkZXNjcmlwdGlvbjogcGhhbmRsZSB0byB0
aGUgYXNzb2NpYXRlZCBwb3dlciBkb21haW4KPiArICAgIGFsbE9mOgo+ICsgICAgICAtICRyZWY6
IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKCllvdSBtaXNzZWQgdGhp
cyBvbmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
