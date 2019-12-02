Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D7810F2DC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 23:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353466E222;
	Mon,  2 Dec 2019 22:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DE96E365
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 22:28:19 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EE1920863
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 22:28:18 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id q28so1335837qkn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 14:28:18 -0800 (PST)
X-Gm-Message-State: APjAAAX/5xhDZoQ/LXEYqR6It4ylJKK0F9FTlsRVQ0+TwFFZpH+6AU+H
 9JBEyWSSEG/SMeg124ASxh/8MkEFK+fLr1iBGA==
X-Google-Smtp-Source: APXvYqwalRjZ37h1dEK3CqI89rRu9nNpBLiaC1kZVv+jq2pIZ7D2g8faIIJOpR+XFOSAiuprP7WyGvAVM0hjiKKL/qQ=
X-Received: by 2002:a37:4904:: with SMTP id w4mr1472009qka.119.1575325697704; 
 Mon, 02 Dec 2019 14:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20191128090726.51107-1-linus.walleij@linaro.org>
In-Reply-To: <20191128090726.51107-1-linus.walleij@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 2 Dec 2019 16:28:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL5RpR9QVsdJGZoBfGfeAmpSoVKW=60zHLWZ3BkPuwbJQ@mail.gmail.com>
Message-ID: <CAL_JsqL5RpR9QVsdJGZoBfGfeAmpSoVKW=60zHLWZ3BkPuwbJQ@mail.gmail.com>
Subject: Re: [PATCH v6] drm/panel: Add generic DSI display controller YAML
 bindings
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575325698;
 bh=vtI7mRkc90kox/lp/QnBdenTVtng043mxOskJbzb9LY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=raTio8Ys9WlfQ98qiG2STnIIyPWVEnVIJb/FJkcQEoyHYxDITPZpNIkt5Y2yp16Ts
 cSsS+PL/X2nuQTOuK7wBZo8pC7jiTNQfD/fR/7rgytt+/QGcfnzlE76pmReo+TDIUk
 J9lMFH+gNRZ8S4//f6ye6YEbjkvZgO5VRaZPSJg8=
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
Cc: devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMzowNyBBTSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBhZGRzIGEgc3RhcnRpbmcgcG9pbnQgZm9y
IHByb2Nlc3NpbmcgYW5kIGRlZmluaW5nIGdlbmVyaWMKPiBiaW5kaW5ncyB1c2VkIGJ5IERTSSBk
aXNwbGF5IGNvbnRyb2xsZXJzIGFuZCBwYW5lbHMgYXR0YWNoZWQgdG8KPiB0aGUgdmlydHVhbCBE
U0kgcG9ydHMuCj4KPiBDYzogU3RlcGhhbiBHZXJob2xkIDxzdGVwaGFuQGdlcmhvbGQubmV0Pgo+
IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+IFN1Z2dlc3RlZC1ieTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gLS0tCj4gQ2hhbmdlTG9nIHY1LT52NjoKPiAtIFJlbmFt
ZSBzdWJqZWN0IHRvIHBlcnRhaW4gdG8gRFNJIGRpc3BsYXkgY29udHJvbGxlcnMgaW4gZ2VuZXJh
bC4KPiAtIENoYW5nZSBzb21lIG9mIHRoZSB3b3JkaW5nIGluIHRoZSBEU0kgY29udHJvbGxlciBk
ZXNjcmlwdGlvbiB0ZXh0LAo+ICAgbWFraW5nIGl0IGNsZWFyIHRoYXQgdGhlIGJpbmRpbmcgcGVy
dGFpbnMgdG8gdGhlIGNvbWJpbmF0aW9uIG9mIGEKPiAgIERTSSBjb250cm9sbGVyIHdpdGggYXQg
bGVhc3Qgb25lIHBhbmVsIGF0dGFjaGVkLgo+IC0gQWRkIGEgcHJvcGVyIGNvbXBpbGluZyBleGFt
cGxlLgo+IENoYW5nZUxvZyB2NC0+djU6Cj4gLSBEcm9wIHRoZSBleGFtcGxlLgo+IC0gSSBzdGls
bCBoYXZlIGEgdmVydCBhbm5veWluZyBlcnJvciBtZXNzYWdlIGluIHRoZSBTb255Cj4gICBwYW5l
bCBiaW5kaW5ncyB0aGF0IHVzZXMgdGhpcyBzY2hlbWE6Cj4gICBzb255LGFjeDQyNGFrcC5leGFt
cGxlLmR0LnlhbWw6IHBhbmVsQDA6ICRub2RlbmFtZTowOiAncGFuZWxAMCcgZG9lcyBub3QgbWF0
Y2ggJ15kc2ktY29udHJvbGxlcihALiopPyQnCj4gICBBcyB0aGlzIGlzIG1vZGVsZWQgdmVyeSBj
bG9zZWx5IHRvCj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L21kaW8u
eWFtbAo+ICAgYW5kIHRoYXQgb25lIGRvZXNuJ3QgZW1pdCB0aGlzIHR5cGUgb2Ygd2FybmluZyBm
b3IgaXRzIGV0aGVybmV0LXBoeUAwCj4gICBldGMgSSBhbSBwcmV0dHkgbXVjaCBjbHVlbGVzcyBh
bmQganVzdCBjYW4ndCBzZWUgd2hhdCB0aGUgcHJvYmxlbQo+ICAgaXMuCj4gLSBJZiBJIGNhbid0
IGZpZ3VyZSB0aGlzIG91dCB0aGUgb25seSB2aWFibGUgbmV4dCBzdGVwIGlzIHRvIGRyb3AgdGhl
Cj4gICBhbWJpdGlvbiB0byBjcmVhdGUgeWFtbCBiaW5kaW5ncyBzaW1wbHkgYmVjYXVzZSBJJ20g
dW5hYmxlIHRvIGRvCj4gICBpdCwgYW5kIGdvIGJhY2sgdG8gdHJhZGl0aW9uYWwgdGV4dCBiaW5k
aW5ncyA6KAo+IENoYW5nZUxvZyB2My0+djQ6Cj4gLSBSZW5hbWUgaW50byBkaXNwbGF5L2RzaS1j
b250cm9sbGVyLnlhbWwKPiAtIFJlcXVpcmUgYSB2aXJ0dWFsIGNoYW5uZWwgbnVtYmVyIGZvciB0
aGUgRFNJIHBhbmVsLCBhcwo+ICAgRFNJIGhhdmUgdGhpcyAyLWJpdCB2aXJ0dWFsIGFkZHJlc3Mg
ZmllbGQuCj4gLSBCcmluZyBpbiBzb21lIGJ1dCBub3QgYWxsIHByb3BlcnRpZXMgZnJvbSB0aGUg
ZXhpc3RpbmcgTUlQSQo+ICAgRFNJIGJpbmRpbmdzLiBUaGlzIHNjaGVtYSBjYW4gYmUgdXNlZCB3
aXRoIHNpbXBsZXIgcGFuZWxzIGJ1dAo+ICAgbm90IGNvbXBsZXggcGFuZWxzIHdpdGggbXVsdGlw
bGUgdmlydHVhbCBjaGFubmVscyBmb3IgdGhlCj4gICBtb21lbnQuIExldCdzIGhhbmRsZSBpdCB3
aGVuIHdlIGdldCB0aGVyZS4KPiAtIEFkZCBhbiBleGFtcGxlLgo+IENoYW5nZUxvZyB2Mi0+djM6
Cj4gLSBNYWtlIGEgbW9yZSBjb21wbGV0ZSBEU0kgcGFuZWwgYmluZGluZyBpbmNsdWRpbmcgdGhl
IGNvbnRyb2xsZXIKPiAgIGFuZCBpdHMgYWRkcmVzcy1jZWxscyBhbmQgc2l6ZS1jZWxscyBhbmQg
YSBwYXR0ZXJuIGZvciB0aGUgcGFuZWwKPiAgIG5vZGVzLiBUaGUgcGFuZWwgaXMgb25lIHBlciBE
U0kgbWFzdGVyLCB0aGUgcmVnIHByb3BlcnR5IGlzCj4gICBjb21wdWxzb3J5IGJ1dCBzaG91bGQg
YWx3YXlzIGJlIDAgKGFzIGZhciBhcyBJIGNhbiB0ZWxsKSBhcwo+ICAgb25seSBvbmUgcGFuZWwg
Y2FuIGJlIGNvbm5lY3RlZC4gVGhlIGJ1cyBkb2Vzbid0IHJlYWxseSBoYXZlCj4gICBhbnkgYWRk
cmVzc2VzIGZvciB0aGUgcGFuZWwsIHRoZSBhZGRyZXNzL3JlZyBub3RhdGlvbiBzZWVtcwo+ICAg
dG8gYmUgY2FyZ28tY3VsdGVkIGZyb20gdGhlIHBvcnQgZ3JhcGhzIGFuZCBpcyBub3QgbmVjZXNz
YXJ5Cj4gICB0byBwYXJzZSBzb21lIGRldmljZSB0cmVlcywgaXQgaXMgdXNlZCB0byB0ZWxsIHdo
ZXRoZXIgdGhlCj4gICBub2RlIGlzIGEgcGFuZWwgb3Igbm90IHJhdGhlciB0aGFuIGFueSBhZGRy
ZXNzaW5nLgo+IC0gSSBoYXZlIG5vIGlkZWEgaG93IG1hbnkgZGlzcGxheXMgeW91IGNhbiBkYWlz
eWNoYWluIG9uIGEgc2luZ2xlCj4gICBEU0kgbWFzdGVyLCBJIGp1c3QgZ3Vlc3MgMTUgd2lsbCBi
ZSBlbm91Z2guIFRoZSBNSVBJLXNwZWNzCj4gICBhcmUgbWVtYmVyd2FsbGVkLiBTb21lb25lIHdo
byBrbm93cyBjYW4gdGVsbCBwZXJoYXBzPwo+IENoYW5nZUxvZyB2MS0+djI6Cj4gLSBOZXcgcGF0
Y2ggYWZ0ZXIgZmVlZGJhY2suCj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2RzaS1jb250
cm9sbGVyLnlhbWwgICAgICB8IDkxICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDkxIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2RzaS1jb250cm9sbGVyLnlhbWwKCkknbGwgbGV0
IHlvdSBhcHBseSB0byBkcm0tbWlzYy4KClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
