Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B3DA9DFD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 11:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA92089FAC;
	Thu,  5 Sep 2019 09:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDD789FAC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 09:15:34 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76A532173B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 09:15:34 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id v11so1879229qto.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 02:15:34 -0700 (PDT)
X-Gm-Message-State: APjAAAXbEv9PtxxsN7RKms/Ba0Q8reHaY3wKEs8kuGZqf3qg+8XEgp0Q
 yD9xHEHS/Wg0QTj9u0tr1BDzcHmf1ynZLkws3A==
X-Google-Smtp-Source: APXvYqyNwGylNaWmJdbp0hwtvhbRvYKWfKT2epWyENciBWUw2i2+7fCPtHnQEiLZeksoFBqLyL9cCiJhvQ6vopV1LgA=
X-Received: by 2002:ac8:44c4:: with SMTP id b4mr2438638qto.224.1567674933700; 
 Thu, 05 Sep 2019 02:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-147-sashal@kernel.org>
 <CAL_JsqJrwwsp1wjCBnNmx45ZiLTXVY_nCfN6OrJ5o9dLbc+_2w@mail.gmail.com>
 <20190905090336.GA29020@kroah.com>
In-Reply-To: <20190905090336.GA29020@kroah.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 5 Sep 2019 10:15:22 +0100
X-Gmail-Original-Message-ID: <CAL_JsqL_MeD_pqZ1Ye2202tKhnqa-tfRhfoprUinh0MGrDr4hA@mail.gmail.com>
Message-ID: <CAL_JsqL_MeD_pqZ1Ye2202tKhnqa-tfRhfoprUinh0MGrDr4hA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 4.19 147/167] drm/panel: Add support for Armadeus
 ST0700 Adapt
To: Greg KH <greg@kroah.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567674934;
 bh=Lf4GVa307w1VgMvnePJnb120Zs7h4v86EeKJR07t8iQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iZiB+uvyG4Pk5Kak4VmB5+DuYxHY3wOZtQBqm3PpLJyXmbm+J7C8rEgS8aygWWfZT
 R2Vvacg+VzEfwczaOdVYsN2YWcPRAyHx7KWzkfjqOssvZg7urX1x7umzKZ5jQzpuQ9
 GvFxJ6eoNLKzM5swv4SfZ7elFLzeo9CBHTQHAvSg=
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgNSwgMjAxOSBhdCAxMDowMyBBTSBHcmVnIEtIIDxncmVnQGtyb2FoLmNvbT4g
d3JvdGU6Cj4KPiBPbiBUaHUsIFNlcCAwNSwgMjAxOSBhdCAwOTo1NTo1OEFNICswMTAwLCBSb2Ig
SGVycmluZyB3cm90ZToKPiA+IE9uIFR1ZSwgU2VwIDMsIDIwMTkgYXQgNTozMSBQTSBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBGcm9tOiBTw6liYXN0
aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Cj4gPiA+Cj4g
PiA+IFsgVXBzdHJlYW0gY29tbWl0IGM0Nzk0NTBmNjFjN2YxZjI0OGM5YTU0YWVkYWNkMmE2Y2E1
MjFmZjggXQo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgdGhlIEFybWFk
ZXVzIFNUMDcwMCBBZGFwdC4gSXQgY29tZXMgd2l0aCBhCj4gPiA+IFNhbnRlayBTVDA3MDBJNVkt
UkJTTFcgNy4wIiBXVkdBICg4MDB4NDgwKSBURlQgYW5kIGFuIGFkYXB0ZXIgYm9hcmQgc28KPiA+
ID4gdGhhdCBpdCBjYW4gYmUgY29ubmVjdGVkIG9uIHRoZSBURlQgaGVhZGVyIG9mIEFybWFkZXVz
IERldiBib2FyZHMuCj4gPiA+Cj4gPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgdjQu
MTkKPiA+ID4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiA+
IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tp
QGFybWFkZXVzLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPgo+ID4gPiBMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
cGF0Y2gvbXNnaWQvMjAxOTA1MDcxNTI3MTMuMjc0OTQtMS1zZWJhc3RpZW4uc3p5bWFuc2tpQGFy
bWFkZXVzLmNvbQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5l
bC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgLi4uL2Rpc3BsYXkvcGFuZWwvYXJtYWRldXMsc3QwNzAw
LWFkYXB0LnR4dCAgIHwgIDkgKysrKysrCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtc2ltcGxlLmMgICAgICAgICAgfCAyOSArKysrKysrKysrKysrKysrKysrCj4gPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hcm1hZGV1cyxz
dDA3MDAtYWRhcHQudHh0Cj4gPgo+ID4gTG9va3MgbGlrZSBhIG5ldyBmZWF0dXJlLCBub3Qgc3Rh
YmxlIG1hdGVyaWFsLiBOb3Qgc3VyZSB3aHkgaXQgZ290Cj4gPiB0YWdnZWQgZm9yIHN0YWJsZS4K
Pgo+IE5ldyBkZXZpY2UgaWRzL3RhYmxlcyBhcmUgYWJsZSB0byBiZSBhZGRlZCB0byBzdGFibGUg
a2VybmVscywgc2luY2UsCj4gd2VsbCwgZm9yZXZlciA6KQoKWWVzIEkga25vdywgYnV0IEkgd291
bGRuJ3QgcHV0IG5ldyBwYW5lbHMgaW4gdGhhdCBjYXRlZ29yeSB0aG91Z2ggSQpndWVzcyBpdCdz
IGp1c3QgZGF0YS4gSWYgd2UgYXJlLCB0aGVuIHlvdSBzaG91bGQgYmUgcGlja2luZyB1cCBqdXN0
CmFib3V0IGV2ZXJ5IHNpbmdsZSBjb21taXQgdG8gcGFuZWwtc2ltcGxlLmMgZm9yIHN0YWJsZS4K
ClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
