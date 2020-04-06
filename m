Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7F619FAD9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 18:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5546B6E398;
	Mon,  6 Apr 2020 16:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BD16E398
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 16:57:04 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B4969249AF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 16:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586192224;
 bh=d5WwVLVFEz/qBX2k9G3pvY8aj9ZG4dDXgjdXesFl72Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2b11M1QLOY7iK7uifO5nBAZ8bvKGbtsHtmiUXVepu4nMWJ0lllOwDjh4fNH5CYNy4
 vTkOZImNQDJ1CeOeKd3mhstdA7JBPeI9Urm+N6WZdTlN5YpCWrl59BsDqKRB5mTpmF
 QPESExpSgygqg6+fcOb//HQ/dAxJr5jzbnaJ5orw=
Received: by mail-ed1-f45.google.com with SMTP id i7so384489edq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 09:57:03 -0700 (PDT)
X-Gm-Message-State: AGi0PuYSgQ5OFsoEuvw5KQKu6S4GPYcLu057XhT/mLnxm83MyA9fN3BX
 EiI0wv+d35JToJatrA5266B/diTT+PhlxYsmKA==
X-Google-Smtp-Source: APiQypJ/iPGF+cvIgkUgfRfcgINI0hY5iZiKWnX6gcKA9lAMAGbU4+kz269vsFd53VBSCqsVJta4Qo1yoqmPd7O1bkg=
X-Received: by 2002:a05:6402:b70:: with SMTP id
 cb16mr19702151edb.48.1586192222144; 
 Mon, 06 Apr 2020 09:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200406051131.225748-1-hsinyi@chromium.org>
In-Reply-To: <20200406051131.225748-1-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 7 Apr 2020 00:56:49 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9zKbSsYmq7BrQdu3h1zTNYcX3WiFjGaiB1=x8eUA4ogg@mail.gmail.com>
Message-ID: <CAAOTY_9zKbSsYmq7BrQdu3h1zTNYcX3WiFjGaiB1=x8eUA4ogg@mail.gmail.com>
Subject: Re: [PATCH] drm: mediatek: fix device passed to cmdq
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
Cc: linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIw
5bm0NOaciDbml6Ug6YCx5LiAIOS4i+WNiDE6MTLlr6vpgZPvvJoKPgo+IGRybSBkZXZpY2UgaXMg
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
aUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2NydGMuYyB8IDYgKysrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ry
di5jICB8IDMgKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IGluZGV4
IDYxNWE1NGU2MGZlMi4uODYyMWYwMjg5Mzk5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2NydGMuYwo+IEBAIC04MjIsMTQgKzgyMiwxNiBAQCBpbnQgbXRrX2RybV9jcnRj
X2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiwKPgo+ICAjaWYgSVNfUkVBQ0hBQkxF
KENPTkZJR19NVEtfQ01EUSkKPiAgICAgICAgIG10a19jcnRjLT5jbWRxX2NsaWVudCA9Cj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgY21kcV9tYm94X2NyZWF0ZShkZXYsIGRybV9jcnRjX2luZGV4
KCZtdGtfY3J0Yy0+YmFzZSksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY21kcV9tYm94X2Ny
ZWF0ZShtdGtfY3J0Yy0+bW1zeXNfZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZHJtX2NydGNfaW5kZXgoJm10a19jcnRjLT5iYXNlKSwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDIwMDApOwo+ICAgICAgICAgaWYgKElTX0VS
UihtdGtfY3J0Yy0+Y21kcV9jbGllbnQpKSB7Cj4gICAgICAgICAgICAgICAgIGRldl9kYmcoZGV2
LCAibXRrX2NydGMgJWQgZmFpbGVkIHRvIGNyZWF0ZSBtYWlsYm94IGNsaWVudCwgd3JpdGluZyBy
ZWdpc3RlciBieSBDUFUgbm93XG4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9jcnRj
X2luZGV4KCZtdGtfY3J0Yy0+YmFzZSkpOwo+ICAgICAgICAgICAgICAgICBtdGtfY3J0Yy0+Y21k
cV9jbGllbnQgPSBOVUxMOwo+ICAgICAgICAgfQo+IC0gICAgICAgcmV0ID0gb2ZfcHJvcGVydHlf
cmVhZF91MzJfaW5kZXgoZGV2LT5vZl9ub2RlLCAibWVkaWF0ZWssZ2NlLWV2ZW50cyIsCj4gKyAg
ICAgICByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChtdGtfY3J0Yy0+bW1zeXNfZGV2
LT5vZl9ub2RlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIm1l
ZGlhdGVrLGdjZS1ldmVudHMiLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZHJtX2NydGNfaW5kZXgoJm10a19jcnRjLT5iYXNlKSwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZtdGtfY3J0Yy0+Y21kcV9ldmVudCk7Cj4gICAgICAg
ICBpZiAocmV0KQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gaW5kZXgg
ZTJiYjBkMTllZjk5Li5kYzc4ZTg2YmNjYzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kcnYuYwo+IEBAIC01MTcsNyArNTE3LDggQEAgc3RhdGljIGludCBtdGtfZHJtX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIGVycl9ub2RlOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPgo+
IC0gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IG10a19kZHBfY29tcF9pbml0KGRldiwgbm9k
ZSwgY29tcCwgY29tcF9pZCwgTlVMTCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0g
bXRrX2RkcF9jb21wX2luaXQoZGV2LT5wYXJlbnQsIG5vZGUsIGNvbXAsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcF9pZCwgTlVMTCk7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgb2Zfbm9kZV9wdXQobm9kZSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIGVycl9ub2RlOwo+IC0tCj4gMi4yNi4wLjI5Mi5nMzNlZjZiMmYzOC1nb29nCj4K
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
