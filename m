Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82A52C86D2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 15:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25A46E4C5;
	Mon, 30 Nov 2020 14:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB8E6E4C5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:32:51 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F2D72085B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606746770;
 bh=SuE4P++qmGoLIF8j33uj/kt53nUU2XUBIpidjDdUDcQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XAxwCCneycEo0STLrtMaQhdKZ0vIy3KX2+qKn8bxFx6V2pJKlDfCwdebLr9GFYJyL
 16lHebPujB7w6CV7vLOdcAwlEwmV3Ey2hf6UPW2xxW2DgOhsFtgMgpm43mDRnQaJt8
 mMzqeX9x7yi9OmkfOAPTltp96mvfQNpFA7OdHBYc=
Received: by mail-ed1-f50.google.com with SMTP id q16so16373789edv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:32:50 -0800 (PST)
X-Gm-Message-State: AOAM5331AXuI2bKAIHDFO1+/tlQcey6pNMMx048G/BNVT2LbmcnpIh0P
 b4koUkh8sJzuyOkn7XWfEDnz+VC6FmKoO+B58Q==
X-Google-Smtp-Source: ABdhPJyTqjub2riyWhCOMyYIHeNVbIUSCia+ywmWQkoDk3lUZp34191pq9pG8Twi1LTvGpKxnvfe+omAGM3pVlOvnig=
X-Received: by 2002:a50:c091:: with SMTP id k17mr1349767edf.137.1606746768862; 
 Mon, 30 Nov 2020 06:32:48 -0800 (PST)
MIME-Version: 1.0
References: <20201101093150.8071-1-paul@crapouillou.net>
 <20201101093150.8071-3-paul@crapouillou.net>
 <20201101122900.GB1269759@ravnborg.org> <9CZ5JQ.CWYPSJ8EDOW4@crapouillou.net>
In-Reply-To: <9CZ5JQ.CWYPSJ8EDOW4@crapouillou.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Nov 2020 07:32:37 -0700
X-Gmail-Original-Message-ID: <CAL_JsqLSGMFibm8tVKqNe1SFBzXTU2=M2jZmpfrHeGUqS3foRg@mail.gmail.com>
Message-ID: <CAL_JsqLSGMFibm8tVKqNe1SFBzXTU2=M2jZmpfrHeGUqS3foRg@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: display: Add ABT Y030XX067A panel
 bindings
To: Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, od@zcrc.me,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Christophe Branchereau <cbranchereau@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMiwgMjAyMCBhdCAzOjE5IEFNIFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91
aWxsb3UubmV0PiB3cm90ZToKPgo+Cj4KPiBMZSBkaW0uIDEgbm92LiAyMDIwIMOgIDEzOjI5LCBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IGEgw6ljcml0IDoKPiA+IE9uIFN1biwgTm92
IDAxLCAyMDIwIGF0IDA5OjMxOjQ4QU0gKzAwMDAsIFBhdWwgQ2VyY3VlaWwgd3JvdGU6Cj4gPj4g
IFRoZSBBc2lhIEJldHRlciBUZWNobm9sb2d5IChBQlQpIFkwMzBYWDA2N0EgcGFuZWwgaXMgYSAz
LjAiIDMyMHg0ODAKPiA+PiAgMjQtYml0IElQUyBMQ0QgcGFuZWwuIEl0cyBwYXJ0aWN1bGFyaXR5
IGlzIHRoYXQgaXQgaGFzIG5vbi1zcXVhcmUKPiA+PiBwaXhlbHMKPiA+PiAgKGFzIGl0IGlzIDQ6
MyBmb3IgYSByZXNvbHV0aW9uIG9mIDMyMHg0ODApLCBhbmQgdGhhdCBpdCByZXF1aXJlcyBvZGQK
PiA+PiAgbGluZXMgdG8gYmUgc2VudCBhcyBSR0IgYW5kIGV2ZW4gbGluZXMgdG8gYmUgc2VudCBh
cyBHUkIgb24gaXRzCj4gPj4gOC1iaXQKPiA+PiAgYnVzLgo+ID4+Cj4gPj4gIFNpZ25lZC1vZmYt
Ynk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+ID4+ICAtLS0KPiA+PiAg
IC4uLi9kaXNwbGF5L3BhbmVsL2FidCx5MDMweHgwNjdhLnlhbWwgICAgICAgICB8IDU0Cj4gPj4g
KysrKysrKysrKysrKysrKysrKwo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDU0IGluc2VydGlvbnMo
KykKPiA+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FidCx5MDMweHgwNjdhLnlhbWwKPiA+Pgo+ID4+ICBk
aWZmIC0tZ2l0Cj4gPj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9hYnQseTAzMHh4MDY3YS55YW1sCj4gPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hYnQseTAzMHh4MDY3YS55YW1sCj4gPj4gIG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPj4gIGluZGV4IDAwMDAwMDAwMDAwMC4uNjQwN2U4YmY0NWZhCj4g
Pj4gIC0tLSAvZGV2L251bGwKPiA+PiAgKysrCj4gPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hYnQseTAzMHh4MDY3YS55YW1sCj4gPj4gIEBAIC0w
LDAgKzEsNTQgQEAKPiA+PiAgKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9S
IEJTRC0yLUNsYXVzZSkKPiA+PiAgKyVZQU1MIDEuMgo+ID4+ICArLS0tCj4gPj4gICskaWQ6Cj4g
Pj4gaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9hYnQseTAzMHh4
MDY3YS55YW1sIwo+ID4+ICArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjCj4gPj4gICsKPiA+PiAgK3RpdGxlOiBBc2lhIEJldHRlciBUZWNobm9s
b2d5IDMuMCIgKDMyMHg0ODAgcGl4ZWxzKSAyNC1iaXQgSVBTIExDRAo+ID4+IHBhbmVsCj4gPj4g
ICsKPiA+PiAgK2Rlc2NyaXB0aW9uOiB8Cj4gPj4gICsgIFRoZSBwYW5lbCBtdXN0IG9iZXkgdGhl
IHJ1bGVzIGZvciBhIFNQSSBzbGF2ZSBkZXZpY2UgYXMKPiA+PiBzcGVjaWZpZWQgaW4KPiA+PiAg
KyAgc3BpL3NwaS1jb250cm9sbGVyLnlhbWwKPiA+PiAgKwo+ID4+ICArbWFpbnRhaW5lcnM6Cj4g
Pj4gICsgIC0gUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gPj4gICsKPiA+
PiAgK2FsbE9mOgo+ID4+ICArICAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1sIwo+ID4+ICArCj4g
Pj4gICtwcm9wZXJ0aWVzOgo+ID4+ICArICBjb21wYXRpYmxlOgo+ID4+ICArICAgIGNvbnN0OiBh
YnQseTAzMHh4MDY3YQo+ID4+ICArCj4gPj4gICsgIGJhY2tsaWdodDogdHJ1ZQo+ID4+ICArICBw
b3J0OiB0cnVlCj4gPj4gICsgIHBvd2VyLXN1cHBseTogdHJ1ZQo+ID4+ICArICByZWc6IHRydWUK
PiA+PiAgKyAgcmVzZXQtZ3Bpb3M6IHRydWUKPiA+Cj4gPiBUaGUgYmluZGluZyBpcyBtaXNzaW5n
Ogo+ID4gcmVxdWlyZWQ6Cj4gPiAgIC0gY29tcGF0aWJsZQo+ID4gICAtIHJlZwo+ID4gICAtIHBv
d2VyLXN1cHBseQo+ID4gICAtIHJlc2V0LWdwaW9zCj4gPiAgIC0gLi4uCj4gPgo+ID4gYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPgo+ID4gU28gci1iIG9ubHkgd2l0aCB0aGVzZSBhZGRl
ZC4KPgo+IFN0dXBpZCBtaXN0YWtlLCBzb3JyeSBhYm91dCB0aGF0Lgo+Cj4gSSdsbCBWMi4KCkkg
ZG9uJ3QgaGF2ZSBhbnkgVjIgaW4gbXkgaW5ib3gsIGJ1dCBsb29rcyBsaWtlIGl0IGlzIGluIGxp
bnV4LW5leHQgbm93OgoKL2J1aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0LWJpbmRpbmdzL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FidCx5MDMweHgwNjdh
LmV4YW1wbGUuZHQueWFtbDoKcGFuZWxAMDogJ3NwaS1tYXgtZnJlcXVlbmN5JyBkb2VzIG5vdCBt
YXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6CidwaW5jdHJsLVswLTldKycKIEZyb20gc2NoZW1hOiAv
YnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtYmluZGluZ3MvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYWJ0LHkwMzB4eDA2N2EueWFtbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
