Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C94100E62
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 22:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD536E83A;
	Mon, 18 Nov 2019 21:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567806E83A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 21:51:15 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id l202so16871342oig.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 13:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hEC0vXainlrwNnEp9G18IEiJOKLOfTAQobDWOxSae4w=;
 b=R9qcz7K/y5tvfZJJkvmcPwRnURukWq7zKL5nS+5/xpBaBaKBxt+huDE9K21dNcHaZl
 7/4RaI3y3nlFnObv+EEJCHSW14Mp+NgsM5eCQRC5xPWCeYVuedppZjhqRe18ja9u4OXd
 9kxtU5dCXjRR8g3A3IjBiSw3rNnasvMExvxpd2flh8nkqS5KydgZadpVurk65r0TVgfF
 gJNDW42JMxLanNCQDw5L6Idi9+9gbp+pG9OYX9PO4stu1eUhpMJgHrIKaeWvF2joJpPt
 5541k9USdjmuWR8YCl2u5GYNY0DqddeQIQw4uVgYKz69OATFkoNlvzh82RD/iuCVmgHg
 zpFg==
X-Gm-Message-State: APjAAAV1BI4yPCFh6qvNzBMFmLLYns2idM/AjbYxDWivfwFmMtoIRUV9
 ZHlu7EFaNOJHAKJ+zz8swQ==
X-Google-Smtp-Source: APXvYqzRkJzwRQuhVaue+B3wBvYpyxpcTCUMZXwn87IM1tgwW7C2JjpdCBgkt6sqnEAIZDoTSgSAUA==
X-Received: by 2002:aca:d508:: with SMTP id m8mr995352oig.31.1574113874526;
 Mon, 18 Nov 2019 13:51:14 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 63sm6650617oty.58.2019.11.18.13.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 13:51:13 -0800 (PST)
Date: Mon, 18 Nov 2019 15:51:13 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 13/13] [HACK] dt-bindings: display: bridge:
 lvds-codec: Absorb thine,thc63lvdm83d.txt
Message-ID: <20191118215113.GA10406@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-14-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-14-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDM6NTE6MzJQTSArMDAwMCwgRmFicml6aW8gQ2FzdHJv
IHdyb3RlOgo+IEF0IHRoaXMgcG9pbnQgaW4gdGltZSwgY29tcGF0aWJsZSBzdHJpbmcgInRoaW5l
LHRoYzYzbHZkbTgzZCIgaXMKPiBiYWNrZWQgYnkgdGhlIGx2ZHMtY29kZWMgZHJpdmVyLCBhbmQg
dGhlIGRvY3VtZW50YXRpb24gY29udGFpbmVkCj4gaW4gdGhpbmUsdGhjNjNsdmRtODNkLnR4dCBp
cyBiYXNpY2FsbHkgdGhlIHNhbWUgYXMgdGhlIG9uZQo+IGNvbnRhaW5lZCBpbiBsdmRzLWNvZGVj
LnlhbWwgKGdlbmVyaWMgZmFsbGJhY2sgY29tcGF0aWJsZSBzdHJpbmcKPiBhc2lkZSksIHRoZXJl
Zm9yZSBhYnNvcmIgdGhpbmUsdGhjNjNsdmRtODNkLnR4dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBG
YWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KPiAKPiAtLS0K
PiBIaSBMYXVyZW50LAo+IAo+IHdoYXQgZG8geW91IHRoaW5rIGFib3V0IHRoaXMgcGF0Y2g/Cj4g
Cj4gVGhhbmtzLAo+IEZhYgo+IAo+IHYzLT52NDoKPiAqIE5ldyBwYXRjaAo+IC0tLQo+ICAuLi4v
YmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy1jb2RlYy55YW1sICAgICAgICB8ICA1ICstLQo+
ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGhpbmUsdGhjNjNsdmRtODNkLnR4dCB8IDUw
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDUzIGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RoaW5lLHRoYzYzbHZkbTgzZC50eHQK
PiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLWNvZGVjLnlhbWwKPiBpbmRleCAyMWY4YzZlLi40MjBi
ZmNlIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9sdmRzLWNvZGVjLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy1jb2RlYy55YW1sCj4gQEAgLTMwLDkgKzMw
LDYgQEAgZGVzY3JpcHRpb246IHwKPiAgCj4gIHByb3BlcnRpZXM6Cj4gICAgY29tcGF0aWJsZToK
PiAtICAgIGRlc2NyaXB0aW9uOiB8Cj4gLSAgICAgIE11c3QgbGlzdCB0aGUgZGV2aWNlIHNwZWNp
ZmljIGNvbXBhdGlibGUgc3RyaW5nIGZpcnN0LCBmb2xsb3dlZCBieSB0aGUKPiAtICAgICAgZ2Vu
ZXJpYyBjb21wYXRpYmxlIHN0cmluZy4KClByb2JhYmx5IGJldHRlciB0byBqdXN0IG9taXQgdGhp
cyBmcm9tIHRoZSBzdGFydC4gCgpJbiBhbnkgY2FzZToKClJldmlld2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
