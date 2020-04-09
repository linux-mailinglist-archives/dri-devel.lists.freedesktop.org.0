Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0741A37CF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 18:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86066EC06;
	Thu,  9 Apr 2020 16:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20D56EC05
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 16:10:35 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CB4321BE5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 16:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586448635;
 bh=fVvP6SUlDpMc2d96/92LswakbtL1VsS55y5+h6rpY3A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jPmvECc5MbxkT11rQVdweMo1GgfsCfCfDNCAb+WP6gNKjHVsXFd+wiq5nPbJM9rWR
 oi1Y8TrzMQpsHiTJWSKQNwJn8sKA2SuCvEjBpTUxBVMMbVi3lgg7w7wPBJkyGWuq1j
 1gKHuIJqTuvJ+4FER8B1iIS7N5fmmYGhXzW7f7oU=
Received: by mail-ed1-f46.google.com with SMTP id de14so435578edb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 09:10:35 -0700 (PDT)
X-Gm-Message-State: AGi0Puass/Xy7FEYhR7U29iSPo7S+zZci/dYbW2tHM2epq1Om+lGAiiT
 ISJWwFdQb29EHrkG24b9IozCepKCK/UHxBr8DA==
X-Google-Smtp-Source: APiQypL+qKD7yHrEW+JUzCaJa3ePCbbv5DvvhgZrZM52zY343hHolUioqNBoHQwpr2Z/SpKf/sp3enrttnW+5MQ39NE=
X-Received: by 2002:a05:6402:335:: with SMTP id
 q21mr720860edw.47.1586448633893; 
 Thu, 09 Apr 2020 09:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200409060209.202677-1-hsinyi@chromium.org>
In-Reply-To: <20200409060209.202677-1-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 10 Apr 2020 00:10:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9hOoW754+sFmr_cCf+kU7H2qv261Me777dcccKv5LFwg@mail.gmail.com>
Message-ID: <CAAOTY_9hOoW754+sFmr_cCf+kU7H2qv261Me777dcccKv5LFwg@mail.gmail.com>
Subject: Re: [PATCH v2] drm: mediatek: fix device passed to cmdq
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIw
5bm0NOaciDnml6Ug6YCx5ZubIOS4i+WNiDI6MDLlr6vpgZPvvJoKPgo+IGRybSBkZXZpY2UgaXMg
bm93IHByb2JlZCBmcm9tIG1tc3lzLiBXZSBuZWVkIHRvIHVzZSBtbXN5cyBkZXZpY2UgdG8gZ2V0
IGdjZQo+IG5vZGVzLiBGaXggZm9sbG93aW5nIGVycm9yczoKPgo+IFsgICAgMC43NDAwNjhdIG1l
ZGlhdGVrLWRybSBtZWRpYXRlay1kcm0uMS5hdXRvOiBlcnJvciAtMiBjYW4ndCBwYXJzZSBnY2Ut
Y2xpZW50LXJlZyBwcm9wZXJ0eSAoMCkKPiBbICAgIDAuNzQ4NzIxXSBtZWRpYXRlay1kcm0gbWVk
aWF0ZWstZHJtLjEuYXV0bzogZXJyb3IgLTIgY2FuJ3QgcGFyc2UgZ2NlLWNsaWVudC1yZWcgcHJv
cGVydHkgKDApCj4gLi4uCj4gWyAgICAyLjY1OTY0NV0gbWVkaWF0ZWstZHJtIG1lZGlhdGVrLWRy
bS4xLmF1dG86IGZhaWxlZCB0byByZXF1ZXN0IGNoYW5uZWwKPiBbICAgIDIuNjY2MjcwXSBtZWRp
YXRlay1kcm0gbWVkaWF0ZWstZHJtLjEuYXV0bzogZmFpbGVkIHRvIHJlcXVlc3QgY2hhbm5lbAoK
UmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+
IEZpeGVzOiAxZDM2NzU0MWFkZWQgKCJzb2MgLyBkcm06IG1lZGlhdGVrOiBGaXggbWVkaWF0ZWst
ZHJtIGRldmljZSBwcm9iaW5nIikKPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55
aUBjaHJvbWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVu
cmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gVGVzdGVkLWJ5OiBFbnJpYyBCYWxsZXRibyBp
IFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+IC0tLQo+IFRoZSBwYXRjaCBp
cyBiYXNlZCBvbgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L21hdHRoaWFzLmJnZy9saW51eC5naXQKPiBicmFuY2ggdjUuNi1uZXh0L3NvYwo+Cj4gQ2hh
bmdlIGxvZzoKPiB2MS0+djI6Cj4gYWxpZ24gd2l0aCA2MGZhOGMxM2FiMWEgKCJkcm0vbWVkaWF0
ZWs6IE1vdmUgZ2NlIGV2ZW50IHByb3BlcnR5IHRvIG11dGV4IGRldmljZSBub2RlIikKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIHwgMyArKy0KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgIHwgMiArLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRleCA2MTVhNTRlNjBmZTIuLjcyNDdjNmY4N2Y0
YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBAQCAtODIy
LDcgKzgyMiw4IEBAIGludCBtdGtfZHJtX2NydGNfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpk
cm1fZGV2LAo+Cj4gICNpZiBJU19SRUFDSEFCTEUoQ09ORklHX01US19DTURRKQo+ICAgICAgICAg
bXRrX2NydGMtPmNtZHFfY2xpZW50ID0KPiAtICAgICAgICAgICAgICAgICAgICAgICBjbWRxX21i
b3hfY3JlYXRlKGRldiwgZHJtX2NydGNfaW5kZXgoJm10a19jcnRjLT5iYXNlKSwKPiArICAgICAg
ICAgICAgICAgICAgICAgICBjbWRxX21ib3hfY3JlYXRlKG10a19jcnRjLT5tbXN5c19kZXYsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fY3J0Y19pbmRleCgm
bXRrX2NydGMtPmJhc2UpLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMjAwMCk7Cj4gICAgICAgICBpZiAoSVNfRVJSKG10a19jcnRjLT5jbWRxX2NsaWVudCkpIHsK
PiAgICAgICAgICAgICAgICAgZGV2X2RiZyhkZXYsICJtdGtfY3J0YyAlZCBmYWlsZWQgdG8gY3Jl
YXRlIG1haWxib3ggY2xpZW50LCB3cml0aW5nIHJlZ2lzdGVyIGJ5IENQVSBub3dcbiIsCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiBpbmRleCBlMmJiMGQxOWVmOTkuLjI4
NDE4ZTViODNlZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4g
QEAgLTUxNyw3ICs1MTcsNyBAQCBzdGF0aWMgaW50IG10a19kcm1fcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
ZXJyX25vZGU7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+Cj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgcmV0ID0gbXRrX2RkcF9jb21wX2luaXQoZGV2LCBub2RlLCBjb21wLCBjb21wX2lk
LCBOVUxMKTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBtdGtfZGRwX2NvbXBfaW5p
dChkZXYtPnBhcmVudCwgbm9kZSwgY29tcCwgY29tcF9pZCwgTlVMTCk7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
b2Zfbm9kZV9wdXQobm9kZSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IGVycl9ub2RlOwo+IC0tCj4gMi4yNi4wLjI5Mi5nMzNlZjZiMmYzOC1nb29nCj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
