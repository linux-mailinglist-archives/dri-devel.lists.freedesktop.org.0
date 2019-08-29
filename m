Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BB1A1C4A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 16:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54656E0CA;
	Thu, 29 Aug 2019 14:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7895C6E0CA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:03:23 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 332E52189D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:03:23 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id p13so2958054qkg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 07:03:23 -0700 (PDT)
X-Gm-Message-State: APjAAAWNkaX3aKUjwibrYpuwIQbbQRE7Wh7wXG39shO/XXzX9IKQYpTZ
 0hGQ6tt4Ile8aO6xrvEQTfdbHFsxPBH5BJE+CA==
X-Google-Smtp-Source: APXvYqx5xw+mAnj9zcHLgq+uwCGaxqVFuAJs1Ey8vhaU2lN8XSiANKs27dzKuXkSmJeBs3wRFxU1yYSUwbwPSVITU9E=
X-Received: by 2002:ae9:e212:: with SMTP id c18mr3499796qkc.254.1567087402375; 
 Thu, 29 Aug 2019 07:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 29 Aug 2019 09:03:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKWWCpEeBd4UFaqBVffS-OxUNAHfvtJKcGsLDR+f=Uytg@mail.gmail.com>
Message-ID: <CAL_JsqKWWCpEeBd4UFaqBVffS-OxUNAHfvtJKcGsLDR+f=Uytg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS
 bus-timings
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567087403;
 bh=R+LyN7YD9OZpXktE/UY/Qz8u2pZtDP3m3LN1pHcseyI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m6ug5skv5gxH6F4G4GkDURiWoP18bgo1JHj7WztwX/K2MQgE2CF5mnlhAst2NkOrb
 TiCFHwQm7TGWYa97q6MUWMxuypUkfPCvavKaFKr4mwPIkztU/Znb1n/pC4TLIUjOPw
 xauQiGLn1GsOaEpJBfyGCuzap8oRfeIp6kb/vitQ=
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
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTozNiBQTSBGYWJyaXppbyBDYXN0cm8KPGZhYnJpemlv
LmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6Cj4KPiBEdWFsLUxWRFMgY29ubmVjdGlvbnMg
bmVlZCBtYXJrZXJzIGluIHRoZSBEVCwgdGhpcyBwYXRjaCBhZGRzCj4gc29tZSBjb21tb24gZG9j
dW1lbnRhdGlvbiB0byBiZSByZWZlcmVuY2VkIGJ5IGJvdGggcGFuZWxzIGFuZAo+IGJyaWRnZXMu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5y
ZW5lc2FzLmNvbT4KPgo+IC0tLQo+IHYyLT52MzoKPiAqIG5ldyBwYXRjaAo+IC0tLQo+ICAuLi4v
YmluZGluZ3MvZGlzcGxheS9idXMtdGltaW5ncy9sdmRzLnlhbWwgICAgICAgICB8IDM4ICsrKysr
KysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2J1cy10aW1pbmdzL2x2ZHMueWFtbAo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2J1cy10aW1pbmdzL2x2ZHMueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2J1cy10aW1pbmdzL2x2ZHMueWFt
bAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uZjM1YjU1YQo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9idXMtdGltaW5ncy9sdmRzLnlhbWwKPiBAQCAtMCwwICsxLDM4IEBACj4gKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKCihHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSBp
cyBwcmVmZXJyZWQgZm9yIG5ldyBiaW5kaW5ncy4KCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlk
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2J1cy10aW1pbmdzL2x2ZHMu
eWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjCj4gKwo+ICt0aXRsZTogQ29tbW9uIFByb3BlcnRpZXMgZm9yIGJ1cyB0aW1pbmdzIG9m
IExWRFMgaW50ZXJmYWNlcwo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBUaGllcnJ5IFJlZGlu
ZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+ICsgIC0gRmFicml6aW8gQ2FzdHJvIDxmYWJy
aXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+Cj4gKwo+ICtkZXNjcmlwdGlvbjogfAo+ICsgIFRo
aXMgZG9jdW1lbnQgZGVmaW5lcyBkZXZpY2UgdHJlZSBwcm9wZXJ0aWVzIGNvbW1vbiB0byBMVkRT
IGFuZCBkdWFsLUxWRFMKPiArICBpbnRlcmZhY2VzLCB3aGVyZSBhIGR1YWwtTFZEUyBpbnRlcmZh
Y2UgaXMgYSBkdWFsLWxpbmsgY29ubmVjdGlvbiB3aXRoIGV2ZW4KPiArICBwaXhlbHMgdHJhdmVs
aW5nIG9uIG9uZSBjb25uZWN0aW9uLCBhbmQgd2l0aCBvZGQgcGl4ZWxzIHRyYXZlbGluZyBvbiB0
aGUgb3RoZXIKPiArICBjb25uZWN0aW9uLgo+ICsgIFRoaXMgZG9jdW1lbnQgZG9lc24ndCBjb25z
dGl0dWUgYSBkZXZpY2UgdHJlZSBiaW5kaW5nIHNwZWNpZmljYXRpb24gYnkgaXRzZWxmCgp0eXBv
OiBjb25zdGl0dXRlCgo+ICsgIGJ1dCBpcyBtZWFudCB0byBiZSByZWZlcmVuY2VkIGJ5IGRldmlj
ZSB0cmVlIGJpbmRpbmdzLgo+ICsgIFdoZW4gcmVmZXJlbmNlZCBmcm9tIHBhbmVsIG9yIGJyaWRn
ZSBkZXZpY2UgdHJlZSBiaW5kaW5ncywgdGhlIHByb3BlcnRpZXMKPiArICBkZWZpbmVkIGluIHRo
aXMgZG9jdW1lbnQgYXJlIGRlZmluZWQgYXMgZm9sbG93cy4gVGhlIHBhbmVsIGFuZCBicmlkZ2Ug
ZGV2aWNlCj4gKyAgdHJlZSBiaW5kaW5ncyBhcmUgcmVzcG9uc2libGUgZm9yIGRlZmluaW5nIHdo
ZXRoZXIgZWFjaCBwcm9wZXJ0eSBpcyByZXF1aXJlZAo+ICsgIG9yIG9wdGlvbmFsLgo+ICsKPiAr
cHJvcGVydGllczoKPiArICBkdWFsLWx2ZHMtZXZlbi1waXhlbHM6Cj4gKyAgICB0eXBlOiBib29s
ZWFuCj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgVGhpcyBwcm9wZXJ0eSBpcyBzcGVjaWZp
YyB0byBhbiBpbnB1dCBwb3J0IG9mIGEgc2luayBkZXZpY2UuIFdoZW4KClRoZSBzY2hlbWEgc2hv
dWxkIGRlZmluZSB3aGF0IG5vZGVzIHRoZXNlIGdvIGluLiBUaGUgZGVzY3JpcHRpb24gc2VlbXMK
dG8gaW5kaWNhdGUgaW4gJ3BvcnQnIG5vZGVzIChvciBlbmRwb2ludD8pLCBidXQgeW91ciB1c2Ug
aW4gdGhlIHBhbmVsCmJpbmRpbmcgcHV0cyB0aGVtIGluIHRoZSBwYXJlbnQuCgo+ICsgICAgICBz
cGVjaWZpZWQsIGl0IG1hcmtzIHRoZSBwb3J0IGFzIHJlY2lwaWVudCBvZiBldmVuLXBpeGVscy4K
PiArCj4gKyAgZHVhbC1sdmRzLW9kZC1waXhlbHM6Cj4gKyAgICB0eXBlOiBib29sZWFuCj4gKyAg
ICBkZXNjcmlwdGlvbjoKPiArICAgICAgVGhpcyBwcm9wZXJ0eSBpcyBzcGVjaWZpYyB0byBhbiBp
bnB1dCBwb3J0IG9mIGEgc2luayBkZXZpY2UuIFdoZW4KPiArICAgICAgc3BlY2lmaWVkLCBpdCBt
YXJrcyB0aGUgcG9ydCBhcyByZWNpcGllbnQgb2Ygb2RkLXBpeGVscy4KCkhvd2V2ZXIsIEkgZG9u
J3QgdGhpbmsgeW91IGV2ZW4gbmVlZCB0aGVzZS4gQSBwYW5lbCdzIHBvcnQgbnVtYmVycyBhcmUK
Zml4ZWQgY2FuIGltcGx5IGV2ZW4gb3Igb2RkLiBGb3IgZXhhbXBsZSBwb3J0QDAgY2FuIGJlIGV2
ZW4gYW5kIHBvcnRAMQpjYW4gYmUgb2RkLiBUaGUgcG9ydCBudW1iZXJpbmcgaXMgdHlwaWNhbGx5
IHBhbmVsIHNwZWNpZmljLCBidXQgd2UgbWF5CmJlIGFibGUgdG8gZGVmaW5lIHRoZSBudW1iZXJp
bmcgZ2VuZXJpY2FsbHkgaWYgd2UgZG9uJ3QgYWxyZWFkeSBoYXZlCnBhbmVscyB3aXRoIG11bHRp
cGxlIHBvcnRzLgoKQWxzbywgYXJlbid0IHRoZXJlIGR1YWwgbGluayBEU0kgcGFuZWxzPwoKUm9i
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
