Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C255B4D1D2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 17:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BB36E5BC;
	Thu, 20 Jun 2019 15:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B809A6E5BC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 15:16:03 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DF932089C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 15:16:03 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id r6so2179607qkc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 08:16:03 -0700 (PDT)
X-Gm-Message-State: APjAAAUJfwTSZHfFqEVWBgLTpr1npSccDNtNK9497y7QqF+eymLsgLza
 RzIexuojdH+q1rXtycc8janojsepklAZKLQj5A==
X-Google-Smtp-Source: APXvYqxCJPiM0PLJvXlPJ9GRTuKL8loc5/Q8qfIUqUa+TpkqcmApxW77au/op7OTbYOnqwwYfkxw+Hy2CzPIzvLxnFA=
X-Received: by 2002:a05:620a:1447:: with SMTP id
 i7mr11428589qkl.254.1561043762664; 
 Thu, 20 Jun 2019 08:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190619215156.27795-1-robh@kernel.org>
 <20190620065508.GA24739@ravnborg.org>
In-Reply-To: <20190620065508.GA24739@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 20 Jun 2019 09:15:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJYWW3TPhWy0=tGc_x99w3jZPsSxcKzQJWuE+FrS19t2g@mail.gmail.com>
Message-ID: <CAL_JsqJYWW3TPhWy0=tGc_x99w3jZPsSxcKzQJWuE+FrS19t2g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: display: Convert common panel
 bindings to DT schema
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561043763;
 bh=kqza+dMOoVNjShbz0wsIGK4HV5GBcZakWICkYSesXsE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KNzeo49v0vOTjS2EQy022uLMpxcHWlEZ8M/of+GzhByi2foYnofiszsQLaOAWX1E+
 92sv4Q3VOAyaO3X54baPuk2WiQgvWv4I8dE8Bq4BhdNlpDgRiPeh0uXFH2OKBr6Pd6
 MnyCxa39GPOFV9GQx/Rx/2+c4Qxl4v4vTwujINvc=
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
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMTI6NTUgQU0gU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPiB3cm90ZToKPgo+IEhpIFJvYi4KPgo+IFRoYW5rcyBmb3Igc3RhcnRpbmcgdGhlIGNv
bnZlcnNpb24gb2YgcGFuZWwgYmluZGluZ3MgdG8geWFtbC4KPgo+IE9uIFdlZCwgSnVuIDE5LCAy
MDE5IGF0IDAzOjUxOjUzUE0gLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gQ29udmVydCB0
aGUgY29tbW9uIHBhbmVsIGJpbmRpbmdzIHRvIERUIHNjaGVtYSBjb25zb2xpZGF0aW5nIHNjYXR0
ZXJlZAo+ID4gZGVmaW5pdGlvbnMgdG8gYSBzaW5nbGUgc2NoZW1hIGZpbGUuCj4gPgo+ID4gVGhl
ICdzaW1wbGUtcGFuZWwnIGJpbmRpbmcganVzdCBhIGNvbGxlY3Rpb24gb2YgcHJvcGVydGllcyBh
bmQgbm90IGEKPiA+IGNvbXBsZXRlIGJpbmRpbmcgaXRzZWxmLiBBbGwgb2YgdGhlICdzaW1wbGUt
cGFuZWwnIHByb3BlcnRpZXMgYXJlCj4gPiBjb3ZlcmVkIGJ5IHRoZSBwYW5lbC1jb21tb24udHh0
IGJpbmRpbmcgd2l0aCB0aGUgZXhjZXB0aW9uIG9mIHRoZQo+ID4gJ25vLWhwZCcgcHJvcGVydHks
IHNvIGFkZCB0aGF0IHRvIHRoZSBzY2hlbWEuCj4gPgo+ID4gQXMgdGhlcmUgYXJlIGxvdHMgb2Yg
cmVmZXJlbmNlcyB0byBzaW1wbGUtcGFuZWwudHh0LCBqdXN0IGtlZXAgdGhlIGZpbGUKPiA+IHdp
dGggYSByZWZlcmVuY2UgdG8gcGFuZWwtY29tbW9uLnlhbWwgZm9yIG5vdyB1bnRpbCBhbGwgdGhl
IGJpbmRpbmdzIGFyZQo+ID4gY29udmVydGVkLgo+IEdvb2QgaWRlYS4KPgo+ID4KPiA+IENjOiBU
aGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+ID4gQ2M6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPgo+ID4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4g
LS0tCj4gPiBOb3RlIHRoZXJlJ3Mgc3RpbGwgc29tZSByZWZlcmVuY2VzIHRvIHBhbmVsLWNvbW1v
bi50eHQgdGhhdCBJIG5lZWQgdG8KPiA+IHVwZGF0ZSBvciBqdXN0IGdvIGFoZWFkIGFuZCBjb252
ZXJ0IHRvIHNjaGVtYS4KPiBCZXR0ZXIgbGV0IGl0IHBvaW50IHRvIHRoZSAueWFtbCB2YXJpYW50
LCBzbyB0aGlzIHBhdGNoc2V0IGRvZXMgbm90Cj4gZGVwZW5kIG9uIHRvbyBtdWNoIG90aGVyIGJp
bmRpbmdzIHRvIGJlIGNvbnZlcnRlZC4KClRoZXJlJ3Mgb25seSA4IGZpbGVzIHJlZmVyZW5jaW5n
IHBhbmVsLWNvbW1vbi50eHQgd2hpY2ggd2FzIHdoeSBJIHdhcwpkZWJhdGluZyBqdXN0IGNvbnZl
cnRpbmcgYWxsIG9mIHRoZW0uCgo+IFRoZW4gd2UgY2FuIHN0YXJ0IHRoZSBjb252ZXJzaW9uIG9m
IHRoZSByZW1haW5pbmcgcGFuZWwgYmluZGluZ3MuCj4gQW55IHRvb2xpbmcgdGhhdCBoZWxwcyB0
aGUgY29udmVyc2lvbnM/CgpJIGhhdmUgYSBkb2MyeWFtbCBzY3JpcHQgdGhhdCBoZWxwcyB3aXRo
IHNvbWUgb2YgdGhlIGJvaWxlcnBsYXRlLiBJdCdzCmluIG15IHlhbWwtYmluZGluZ3MtdjIgYnJh
bmNoWzFdLgoKPiBXaGVuIHRoaXMgaGl0cyB1cHN0cmVhbSBJIGFzc3VtZSBhbGwgZnV0dXJlIHBh
bmVsIGJpbmRpbmdzIHNoYWxsIGJlIHlhbWwKPiBiYXNlZCAtIHNvIHdlIGhhdmUgYSBmZXcgcGVu
ZGluZyBjb250cmlidXRpb25zIHRoYXQgbmVlZCB0byBkbyBzb21ldGhpbmcuCgpUaGF0IHdvdWxk
IGJlIGlkZWFsLCBidXQgbm90IHN0cmljdGx5IHJlcXVpcmVkLiBGb3IgcGVuZGluZyB0aGluZ3Ms
IG5vCnJlYXNvbiB0byBtYWtlIGZvbGtzIHJlZG8gdGhpbmdzLiBSZXF1aXJpbmcgc2NoZW1hIHJl
YWxseSBkZXBlbmRzIG9uCndob21ldmVyIGlzIGFwcGx5aW5nIHRoaW5ncyB0byBydW4gYXQgbGVh
c3QgJ21ha2UgZHRfYmluZGluZ19jaGVjaycKYmVmb3JlIGFjY2VwdGluZy4KCj4KPiBGb3IgdGhl
IGFjdHVhbCBjb252ZXJzaW9uIGJlbG93Ogo+IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+CgpUaGFua3MuCgpSb2IKClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9yb2JoL2xpbnV4LmdpdC9sb2cvP2g9eWFtbC1iaW5kaW5n
cy12MgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
