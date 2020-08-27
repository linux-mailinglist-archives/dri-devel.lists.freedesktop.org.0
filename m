Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D85255199
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 01:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190736E0E6;
	Thu, 27 Aug 2020 23:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E406E0E6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 23:34:33 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1D8C2098B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 23:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598571273;
 bh=iGZm6J2WjfhefsqczRG+TkUdP6+d7DesLYj0sZgatNQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q/8JOJEf2xry+J1SsJB5G5gDe//xmBO7o5SCt5TaFXMVNxfBJecYY46P/XQIwiYL6
 l3pFlqQSOdSOJ/oAMOHWmsD7ZoVKu3wvRiunoc6BtvdBYqHqHweyrQ0VuAlJH8/gap
 nEwA7CR9IgahFb5vluTbb8piIERckSv23IU9408g=
Received: by mail-ej1-f45.google.com with SMTP id o18so9934709eje.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 16:34:32 -0700 (PDT)
X-Gm-Message-State: AOAM531nEXWBOUnkrMoLXbCDk+h5Qj00urZ20HoXRqAW0KyLHXFFRdQ5
 vn7PYwo6NEJ87oFiWt9XR+SLG+EodWpEeaf2FQ==
X-Google-Smtp-Source: ABdhPJym6RGZ5YVf6d7TmbAgVP0wINQV7MRPLDDxCToUeFwhon4p3PcCf89uMn44GaG8iKQOaIqwckS4XM39deoVjvY=
X-Received: by 2002:a17:906:2b0d:: with SMTP id
 a13mr22510518ejg.433.1598571271342; 
 Thu, 27 Aug 2020 16:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-6-linux@fw-web.de>
 <4812f750-5f85-61bb-fb68-4eec99285e77@gmail.com>
In-Reply-To: <4812f750-5f85-61bb-fb68-4eec99285e77@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 28 Aug 2020 07:34:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY___2nnjc14WB80VD2Hi607xXh8S8UAom3BJh6ZcwMbvAA@mail.gmail.com>
Message-ID: <CAAOTY___2nnjc14WB80VD2Hi607xXh8S8UAom3BJh6ZcwMbvAA@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] drm/mediatek: dpi/dsi: change the getting
 possible_crtc way
To: Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPiDmlrwgMjAyMOW5
tDjmnIgyMOaXpSDpgLHlm5sg5LiK5Y2IMToxNOWvq+mBk++8mgo+Cj4KPgo+IE9uIDE5LzA4LzIw
MjAgMTA6MTcsIEZyYW5rIFd1bmRlcmxpY2ggd3JvdGU6Cj4gPiBGcm9tOiBKaXRhbyBTaGkgPGpp
dGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gPgo+ID4gRm9yIGN1cnJlbnQgbWVkaWF0ZWsgZHNpIGVu
Y29kZXIsIGl0cyBwb3NzaWJsZSBjcnRjIGlzIGZpeGVkIGluIGNydGMKPiA+IDAsIGFuZCBtZWRp
YXRlayBkcGkgZW5jb2RlcidzIHBvc3NpYmxlIGNydGMgaXMgZml4ZWQgaW4gY3J0YyAxLiBJbgo+
ID4gc29tZSBTb0MgdGhlIHBvc3NpYmxlIGNydGMgaXMgbm90IGZpeGVkIGluIHRoaXMgY2FzZSwg
c28gY2FsbAo+ID4gbXRrX2RybV9maW5kX3Bvc3NpYmxlX2NydGNfYnlfY29tcCgpIHRvIGZpbmQg
b3V0IHRoZSBjb3JyZWN0IHBvc3NpYmxlCj4gPiBjcnRjLgo+ID4KPgo+IEhtLCBzaG91bGRuJ3Qg
d2Ugc3Rhc2ggdGhpcyBpbnQgNC83LCBvdGhlcndpc2Ugd2Ugd2lsbCBoYXZlIG5vdCB1c2VkIGZ1
bmN0aW9ucwo+IGluIDQvNy4KCkFncmVlIHdpdGggTWF0dGhpYXMsIHNvIHNxdWFzaCB0aGlzIHBh
dGNoIGludG8gNC83LCBhbmQgYXBwbGllZCB0bwptZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5r
cy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9j
aHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywK
Q2h1bi1LdWFuZy4KCj4KPiBSZWdhcmRzLAo+IE1hdHRoaWFzCj4KPiA+IFNpZ25lZC1vZmYtYnk6
IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEZy
YW5rIFd1bmRlcmxpY2ggPGZyYW5rLXdAcHVibGljLWZpbGVzLmRlPgo+ID4gUmV2aWV3ZWQtYnk6
IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCAzICsrLQo+ID4gICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMyArKy0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwaS5jCj4gPiBpbmRleCBkNGYwZmI3YWQzMTIuLmU0Mzk3NzAxNTg0MyAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiA+IEBAIC02MDgsNyArNjA4LDggQEAgc3Rh
dGljIGludCBtdGtfZHBpX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICpt
YXN0ZXIsIHZvaWQgKmRhdGEpCj4gPiAgICAgICBkcm1fZW5jb2Rlcl9oZWxwZXJfYWRkKCZkcGkt
PmVuY29kZXIsICZtdGtfZHBpX2VuY29kZXJfaGVscGVyX2Z1bmNzKTsKPiA+Cj4gPiAgICAgICAv
KiBDdXJyZW50bHkgRFBJMCBpcyBmaXhlZCB0byBiZSBkcml2ZW4gYnkgT1ZMMSAqLwo+ID4gLSAg
ICAgZHBpLT5lbmNvZGVyLnBvc3NpYmxlX2NydGNzID0gQklUKDEpOwo+ID4gKyAgICAgZHBpLT5l
bmNvZGVyLnBvc3NpYmxlX2NydGNzID0KPiA+ICsgICAgICAgICAgICAgbXRrX2RybV9maW5kX3Bv
c3NpYmxlX2NydGNfYnlfY29tcChkcm1fZGV2LCBkcGktPmRkcF9jb21wKTsKPiA+Cj4gPiAgICAg
ICByZXQgPSBkcm1fYnJpZGdlX2F0dGFjaCgmZHBpLT5lbmNvZGVyLCBkcGktPmJyaWRnZSwgTlVM
TCwgMCk7Cj4gPiAgICAgICBpZiAocmV0KSB7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMKPiA+IGluZGV4IDE2ZmQ5OWRjZGFjZi4uYzlmNGFkMDI5Y2IxIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gQEAgLTk3NCw3ICs5NzQsOCBAQCBzdGF0aWMgaW50
IG10a19kc2lfZW5jb2Rlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBtdGtf
ZHNpICpkc2kpCj4gPiAgICAgICAgKiBDdXJyZW50bHkgZGlzcGxheSBkYXRhIHBhdGhzIGFyZSBz
dGF0aWNhbGx5IGFzc2lnbmVkIHRvIGEgY3J0YyBlYWNoLgo+ID4gICAgICAgICogY3J0YyAwIGlz
IE9WTDAgLT4gQ09MT1IwIC0+IEFBTCAtPiBPRCAtPiBSRE1BMCAtPiBVRk9FIC0+IERTSTAKPiA+
ICAgICAgICAqLwo+ID4gLSAgICAgZHNpLT5lbmNvZGVyLnBvc3NpYmxlX2NydGNzID0gMTsKPiA+
ICsgICAgIGRzaS0+ZW5jb2Rlci5wb3NzaWJsZV9jcnRjcyA9Cj4gPiArICAgICAgICAgICAgIG10
a19kcm1fZmluZF9wb3NzaWJsZV9jcnRjX2J5X2NvbXAoZHJtLCBkc2ktPmRkcF9jb21wKTsKPiA+
Cj4gPiAgICAgICByZXQgPSBkcm1fYnJpZGdlX2F0dGFjaCgmZHNpLT5lbmNvZGVyLCAmZHNpLT5i
cmlkZ2UsIE5VTEwsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fQlJJREdF
X0FUVEFDSF9OT19DT05ORUNUT1IpOwo+ID4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
