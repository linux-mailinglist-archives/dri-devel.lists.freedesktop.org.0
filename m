Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EA820BDBC
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 04:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647CE6E0EA;
	Sat, 27 Jun 2020 02:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674C86E0EA
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 02:36:00 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1E6720787
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 02:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593225359;
 bh=tU0ZbN22a3NbtsWXdd7dOzD8damchBjamFVFeRZ8J54=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RcLz9fwjyZCTlbXGEg1uhlK21xVGWDpa/NFDEddfO2GoH8eN4YTKhO0OL/OGsDE7r
 92BeYFjijvqps/03BmOHDsIstqTjRXMkROajoX9my2pIgpr6SBkSx6NBbYfMSoKdGD
 wJk8Od2vw/6Uu0HKTLRIboThNj2Cby7c7PveIb40=
Received: by mail-ed1-f52.google.com with SMTP id d15so8328848edm.10
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 19:35:58 -0700 (PDT)
X-Gm-Message-State: AOAM530fonMAgjhbv0YEKO1ORcCVGFzvClPOuTmB/aG9IDcWscXhG8V/
 1ms/tA+9zmkayudrr/a59/XrS4oeDMJ89o5eAw==
X-Google-Smtp-Source: ABdhPJzP4QmbPNwQeLEiF97aUp8PQdQXE1zF6ViwygvifOO7aMKo9MpdiKf0B44WJbGzWjJ4qPlypq0xfkZktqcz1+4=
X-Received: by 2002:aa7:c3d6:: with SMTP id l22mr6451343edr.148.1593225357299; 
 Fri, 26 Jun 2020 19:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200622155753.130181-1-hsinyi@chromium.org>
In-Reply-To: <20200622155753.130181-1-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 27 Jun 2020 10:35:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-mB5EC7_fHzpn+NFPRxAHEzY-f5dRv3g1TKfR5Hui58A@mail.gmail.com>
Message-ID: <CAAOTY_-mB5EC7_fHzpn+NFPRxAHEzY-f5dRv3g1TKfR5Hui58A@mail.gmail.com>
Subject: Re: [PATCH v4] drm/mediatek: check plane visibility in atomic_update
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIw
5bm0NuaciDIy5pelIOmAseS4gCDkuIvljYgxMTo1N+Wvq+mBk++8mgo+Cj4gRGlzYWJsZSB0aGUg
cGxhbmUgaWYgaXQncyBub3QgdmlzaWJsZS4gT3RoZXJ3aXNlIG10a19vdmxfbGF5ZXJfY29uZmln
KCkKPiB3b3VsZCBwcm9jZWVkIHdpdGggaW52YWxpZCBwbGFuZSBhbmQgd2UgbWF5IHNlZSB2Ymxh
bmsgdGltZW91dC4KPgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4K
ClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVu
a3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gRml4ZXM6IDExOWY1MTczNjI4YSAoImRybS9tZWRpYXRlazogQWRkIERSTSBE
cml2ZXIgZm9yIE1lZGlhdGVrIFNvQyBNVDgxNzMuIikKPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlp
IFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUg
PGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IFJldmlld2VkLWJ5OiBUb21hc3ogRmlnYSA8dGZp
Z2FAY2hyb21pdW0ub3JnPgo+IC0tLQo+IHY0OiBmaXggY29tbWl0IG1lc3NhZ2UKPiB2MzogQWRk
cmVzcyBjb21tZW50Cj4gdjI6IEFkZCBmaXhlcyB0YWcKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fcGxhbmUuYyB8IDI1ICsrKysrKysrKysrKysrLS0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMKPiBpbmRleCBjMmJkNjgzYTg3
YzguLjkyMTQxYTE5NjgxYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9wbGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
cGxhbmUuYwo+IEBAIC0xNjQsNiArMTY0LDE2IEBAIHN0YXRpYyBpbnQgbXRrX3BsYW5lX2F0b21p
Y19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cnVlLCB0cnVlKTsKPiAgfQo+Cj4gK3N0YXRp
YyB2b2lkIG10a19wbGFuZV9hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9wbGFuZV9z
dGF0ZSAqb2xkX3N0YXRlKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpz
dGF0ZSA9IHRvX210a19wbGFuZV9zdGF0ZShwbGFuZS0+c3RhdGUpOwo+ICsKPiArICAgICAgIHN0
YXRlLT5wZW5kaW5nLmVuYWJsZSA9IGZhbHNlOwo+ICsgICAgICAgd21iKCk7IC8qIE1ha2Ugc3Vy
ZSB0aGUgYWJvdmUgcGFyYW1ldGVyIGlzIHNldCBiZWZvcmUgdXBkYXRlICovCj4gKyAgICAgICBz
dGF0ZS0+cGVuZGluZy5kaXJ0eSA9IHRydWU7Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIG10a19w
bGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9zdGF0
ZSkKPiAgewo+IEBAIC0xNzgsNiArMTg4LDExIEBAIHN0YXRpYyB2b2lkIG10a19wbGFuZV9hdG9t
aWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ICAgICAgICAgaWYgKCFjcnRjIHx8
IFdBUk5fT04oIWZiKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gKyAgICAgICBpZiAo
IXBsYW5lLT5zdGF0ZS0+dmlzaWJsZSkgewo+ICsgICAgICAgICAgICAgICBtdGtfcGxhbmVfYXRv
bWljX2Rpc2FibGUocGxhbmUsIG9sZF9zdGF0ZSk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybjsK
PiArICAgICAgIH0KPiArCj4gICAgICAgICBnZW0gPSBmYi0+b2JqWzBdOwo+ICAgICAgICAgbXRr
X2dlbSA9IHRvX210a19nZW1fb2JqKGdlbSk7Cj4gICAgICAgICBhZGRyID0gbXRrX2dlbS0+ZG1h
X2FkZHI7Cj4gQEAgLTIwMCwxNiArMjE1LDYgQEAgc3RhdGljIHZvaWQgbXRrX3BsYW5lX2F0b21p
Y191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gICAgICAgICBzdGF0ZS0+cGVuZGlu
Zy5kaXJ0eSA9IHRydWU7Cj4gIH0KPgo+IC1zdGF0aWMgdm9pZCBtdGtfcGxhbmVfYXRvbWljX2Rp
c2FibGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9zdGF0ZSkKPiAtewo+IC0g
ICAgICAgc3RydWN0IG10a19wbGFuZV9zdGF0ZSAqc3RhdGUgPSB0b19tdGtfcGxhbmVfc3RhdGUo
cGxhbmUtPnN0YXRlKTsKPiAtCj4gLSAgICAgICBzdGF0ZS0+cGVuZGluZy5lbmFibGUgPSBmYWxz
ZTsKPiAtICAgICAgIHdtYigpOyAvKiBNYWtlIHN1cmUgdGhlIGFib3ZlIHBhcmFtZXRlciBpcyBz
ZXQgYmVmb3JlIHVwZGF0ZSAqLwo+IC0gICAgICAgc3RhdGUtPnBlbmRpbmcuZGlydHkgPSB0cnVl
Owo+IC19Cj4gLQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9oZWxwZXJfZnVuY3Mg
bXRrX3BsYW5lX2hlbHBlcl9mdW5jcyA9IHsKPiAgICAgICAgIC5wcmVwYXJlX2ZiID0gZHJtX2dl
bV9mYl9wcmVwYXJlX2ZiLAo+ICAgICAgICAgLmF0b21pY19jaGVjayA9IG10a19wbGFuZV9hdG9t
aWNfY2hlY2ssCj4gLS0KPiAyLjI3LjAuMTExLmdjNzJjN2RhNjY3LWdvb2cKPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
