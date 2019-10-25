Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC0E4EEF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 16:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33E56E9F4;
	Fri, 25 Oct 2019 14:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4CB6E9F4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 14:25:52 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD04621655
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 14:25:52 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id t20so3448560qtr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 07:25:52 -0700 (PDT)
X-Gm-Message-State: APjAAAUpUP/Jt27iyYw8cdQyslgVndYwHibhQDgwGwUgwS75jU7t6dtS
 BoHq9VcvPXuYkL8SaXKyboQRHhHwOvE0nfPrjg==
X-Google-Smtp-Source: APXvYqyHGFuHzLeeCiWmC38AWf47YzHtjUGWCvnVQnR7njmNGQzh6atSkOGaDQVT1lTzgwxR3JWh+i3JbBURQZyByQQ=
X-Received: by 2002:a05:6214:1552:: with SMTP id
 t18mr3275282qvw.136.1572013551842; 
 Fri, 25 Oct 2019 07:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190705164221.4462-1-robh@kernel.org>
 <20190705164221.4462-2-robh@kernel.org>
 <CAMuHMdW86UOVp5vjdFBzjbqsG_wemjZ77LyVnc+oZ6ZDccv_cA@mail.gmail.com>
In-Reply-To: <CAMuHMdW86UOVp5vjdFBzjbqsG_wemjZ77LyVnc+oZ6ZDccv_cA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 25 Oct 2019 09:25:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJA_ZZ5CjoGrB4NofAcwMPXhnC0ddWZqZ9SXSTNAWB3cQ@mail.gmail.com>
Message-ID: <CAL_JsqJA_ZZ5CjoGrB4NofAcwMPXhnC0ddWZqZ9SXSTNAWB3cQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] dt-bindings: display: Convert common panel
 bindings to DT schema
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572013552;
 bh=DU7fSFJ7Tbm2ALQlO0YChij89rQy5SaOWUBg7BPLtqY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lls4C6GhAMZkjiMHxUNM8e3MpVtTjHRcp7rtbeWxNU6wPCOgmjE3zkRA3BaLtvaMu
 Ik1lbhOO5WwIWedKrjVgJYkBqK0RyKpoQxLvxyz5dqKrbrzgU/En4i9HWrJoKn8Xec
 mU9sGQ/QhVMGbMoSZaRbAqSBj0FGKs5gqZfGPCOg=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgODowNyBBTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IE9uIEZyaSwgSnVsIDUsIDIw
MTkgYXQgNjo0NiBQTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+IENv
bnZlcnQgdGhlIGNvbW1vbiBwYW5lbCBiaW5kaW5ncyB0byBEVCBzY2hlbWEgY29uc29saWRhdGlu
ZyBzY2F0dGVyZWQKPiA+IGRlZmluaXRpb25zIHRvIGEgc2luZ2xlIHNjaGVtYSBmaWxlLgo+ID4K
PiA+IFRoZSAnc2ltcGxlLXBhbmVsJyBiaW5kaW5nIGp1c3QgYSBjb2xsZWN0aW9uIG9mIHByb3Bl
cnRpZXMgYW5kIG5vdCBhCj4gPiBjb21wbGV0ZSBiaW5kaW5nIGl0c2VsZi4gQWxsIG9mIHRoZSAn
c2ltcGxlLXBhbmVsJyBwcm9wZXJ0aWVzIGFyZQo+ID4gY292ZXJlZCBieSB0aGUgcGFuZWwtY29t
bW9uLnR4dCBiaW5kaW5nIHdpdGggdGhlIGV4Y2VwdGlvbiBvZiB0aGUKPiA+ICduby1ocGQnIHBy
b3BlcnR5LCBzbyBhZGQgdGhhdCB0byB0aGUgc2NoZW1hLgo+ID4KPiA+IEFzIHRoZXJlIGFyZSBs
b3RzIG9mIHJlZmVyZW5jZXMgdG8gc2ltcGxlLXBhbmVsLnR4dCwganVzdCBrZWVwIHRoZSBmaWxl
Cj4gPiB3aXRoIGEgcmVmZXJlbmNlIHRvIGNvbW1vbi55YW1sIGZvciBub3cgdW50aWwgYWxsIHRo
ZSBiaW5kaW5ncyBhcmUKPiA+IGNvbnZlcnRlZC4KPiA+Cj4gPiBDYzogVGhpZXJyeSBSZWRpbmcg
PHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiA+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+ID4gQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KPiA+IFJldmlld2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4u
Y29tPgo+ID4gUmV2aWV3ZWQtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+Cj4gVGhp
cyBpcyBub3cgY29tbWl0IDgyMWExZjcxNzFhZWVhNWUgKCJkdC1iaW5kaW5nczogZGlzcGxheTog
Q29udmVydAo+IGNvbW1vbiBwYW5lbCBiaW5kaW5ncyB0byBEVCBzY2hlbWEiKS4KPgo+ID4gLS0t
IC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvcGFuZWwtY29tbW9uLnlhbWwKPgo+ID4gKyAgYmFja2xpZ2h0Ogo+ID4gKyAg
ICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlCj4gPiArICAg
IGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIEZvciBwYW5lbHMgd2hvc2UgYmFja2xpZ2h0IGlzIGNv
bnRyb2xsZWQgYnkgYW4gZXh0ZXJuYWwgYmFja2xpZ2h0Cj4gPiArICAgICAgY29udHJvbGxlciwg
dGhpcyBwcm9wZXJ0eSBjb250YWlucyBhIHBoYW5kbGUgdGhhdCByZWZlcmVuY2VzIHRoZQo+ID4g
KyAgICAgIGNvbnRyb2xsZXIuCj4KPiBUaGlzIHBhcmFncmFwaCBzZWVtcyB0byBhcHBseSB0byBh
bGwgbm9kZXMgbmFtZWQgImJhY2tsaWdodCIsIGNhdXNpbmcKPiBlLmcuIChmb3IgQVJDSD1hcm0g
bWFjaF9zaG1vYmlsZV9kZWZjb25maWcpICJtYWtlIGR0YnNfY2hlY2sKPiBEVF9TQ0hFTUFfRklM
RVM9RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwt
Y29tbW9uLnlhbWwiCj4gdG8gc3RhcnQgY29tcGxhaW5pbmc6Cj4KPiAgICAgYXJjaC9hcm0vYm9v
dC9kdHMvcjhhNzc0MC1hcm1hZGlsbG84MDBldmEuZHQueWFtbDogYmFja2xpZ2h0Ogo+IHsnY29t
cGF0aWJsZSc6IFsncHdtLWJhY2tsaWdodCddLCAncHdtcyc6IFtbNDAsIDIsIDMzMzMzLCAxXV0s
Cj4gJ2JyaWdodG5lc3MtbGV2ZWxzJzogW1swLCAxLCAyLCA0LCA4LCAxNiwgMzIsIDY0LCAxMjgs
IDI1NV1dLAo+ICdkZWZhdWx0LWJyaWdodG5lc3MtbGV2ZWwnOiBbWzldXSwgJ3BpbmN0cmwtMCc6
IFtbNDFdXSwKPiAncGluY3RybC1uYW1lcyc6IFsnZGVmYXVsdCddLCAncG93ZXItc3VwcGx5Jzog
W1s0Ml1dLCAnZW5hYmxlLWdwaW9zJzoKPiBbWzE1LCA2MSwgMF1dfSBpcyBub3Qgb2YgdHlwZSAn
YXJyYXknCj4gICAgIGFyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDAtYXJtYWRpbGxvODAwZXZhLmR0
LnlhbWw6IGJhY2tsaWdodDoKPiB7J2dyb3Vwcyc6IFsndHB1MF90bzJfMSddLCAnZnVuY3Rpb24n
OiBbJ3RwdTAnXSwgJ3BoYW5kbGUnOiBbWzQxXV19IGlzCj4gbm90IG9mIHR5cGUgJ2FycmF5Jwo+
Cj4gRG8geW91IGtub3cgd2hhdCdzIHdyb25nPwoKSSdtIG5vdCBzZWVpbmcgdGhhdC4gV2hhdCBk
b2VzIC4uLi9iaW5kaW5ncy9wcm9jZXNzZWQtc2NoZW1hLnlhbWwgbG9vayBsaWtlPwoKUm9iCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
