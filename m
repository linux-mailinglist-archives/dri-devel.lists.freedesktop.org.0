Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B822038EF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 16:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A874F6E0F4;
	Mon, 22 Jun 2020 14:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5C86E0F4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 14:19:20 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EBD12071A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592835560;
 bh=GuJeKKRg4ljASSKmnxTHSEq9Lrl4bygvq5sIO4QgElE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RrT8e2hurv/CltZNbH9ceFcN4qAv9y1dqYBxOw/Q0A1nteRR8KkFwoLLVny3IOgql
 h7SpbuiNAUYDAfEzIUqV3LoJ1/7Gs89T7ybQj+oTOq6dsjBVC2Ni5Lg0lJQOjRLlHX
 jeZTdCk+YtbAcRnqD2eH+ijlY6g2a3DNp9Kl07WU=
Received: by mail-ej1-f49.google.com with SMTP id q19so18191637eja.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 07:19:19 -0700 (PDT)
X-Gm-Message-State: AOAM530jMTwF9DwzS4Ya1aPETU4vuf8DIodSVdn2RZYmgyjxf4aBkqhZ
 X4CITAFBNzgGURImKdFvLW3QAWg7sBk8gqv68w==
X-Google-Smtp-Source: ABdhPJw+6j+Dz0ZG80oIz70/+V1sj/iA5Yn7Z4RQs/Z0zQuiq2w/YgsHfc4h1zA1uemuLKohvBbgeRWKz4d1gEyTnO4=
X-Received: by 2002:a17:906:5fc4:: with SMTP id
 k4mr6319741ejv.94.1592835558674; 
 Mon, 22 Jun 2020 07:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200622053234.122120-1-hsinyi@chromium.org>
In-Reply-To: <20200622053234.122120-1-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 22 Jun 2020 22:19:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-t2-uiuLCAUONkTdLt_h3gERRdadY+nS9ZXWF28t+VTQ@mail.gmail.com>
Message-ID: <CAAOTY_-t2-uiuLCAUONkTdLt_h3gERRdadY+nS9ZXWF28t+VTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: check plane visibility in atomic_update
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
5bm0NuaciDIy5pelIOmAseS4gCDkuIvljYgxOjMy5a+r6YGT77yaCj4KPiBEaXNhYmxlIHRoZSBw
bGFuZSBpZiBpdCdzIG5vdCB2aXNpYmxlLiBPdGhlcndpc2UgbXRrX292bF9sYXllcl9jb25maWco
KQo+IHdvdWxkIHByb2NlZWQgd2l0aCBpbnZhbGlkIHBsYW5lIGFuZCB3ZSBtYXkgc2VlIHZibGFu
ayB0aW1lb3V0LgoKRXhjZXB0IHRoZSBGaXhlcyB0YWcsCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogSHNpbi1Z
aSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9wbGFuZS5jIHwgMjMgKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jCj4gaW5kZXggYzJiZDY4M2E4N2M4Li43
NGRjNzFjN2YzYjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fcGxhbmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5l
LmMKPiBAQCAtMTY0LDYgKzE2NCwxNiBAQCBzdGF0aWMgaW50IG10a19wbGFuZV9hdG9taWNfY2hl
Y2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZSwgdHJ1ZSk7Cj4gIH0KPgo+ICtzdGF0aWMgdm9p
ZCBtdGtfcGxhbmVfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUg
Km9sZF9zdGF0ZSkKPiArewo+ICsgICAgICAgc3RydWN0IG10a19wbGFuZV9zdGF0ZSAqc3RhdGUg
PSB0b19tdGtfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRlKTsKPiArCj4gKyAgICAgICBzdGF0ZS0+
cGVuZGluZy5lbmFibGUgPSBmYWxzZTsKPiArICAgICAgIHdtYigpOyAvKiBNYWtlIHN1cmUgdGhl
IGFib3ZlIHBhcmFtZXRlciBpcyBzZXQgYmVmb3JlIHVwZGF0ZSAqLwo+ICsgICAgICAgc3RhdGUt
PnBlbmRpbmcuZGlydHkgPSB0cnVlOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBtdGtfcGxhbmVf
YXRvbWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfc3RhdGUpCj4g
IHsKPiBAQCAtMTc4LDYgKzE4OCw5IEBAIHN0YXRpYyB2b2lkIG10a19wbGFuZV9hdG9taWNfdXBk
YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ICAgICAgICAgaWYgKCFjcnRjIHx8IFdBUk5f
T04oIWZiKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gKyAgICAgICBpZiAoIXBsYW5l
LT5zdGF0ZS0+dmlzaWJsZSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIG10a19wbGFuZV9hdG9t
aWNfZGlzYWJsZShwbGFuZSwgb2xkX3N0YXRlKTsKPiArCj4gICAgICAgICBnZW0gPSBmYi0+b2Jq
WzBdOwo+ICAgICAgICAgbXRrX2dlbSA9IHRvX210a19nZW1fb2JqKGdlbSk7Cj4gICAgICAgICBh
ZGRyID0gbXRrX2dlbS0+ZG1hX2FkZHI7Cj4gQEAgLTIwMCwxNiArMjEzLDYgQEAgc3RhdGljIHZv
aWQgbXRrX3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gICAg
ICAgICBzdGF0ZS0+cGVuZGluZy5kaXJ0eSA9IHRydWU7Cj4gIH0KPgo+IC1zdGF0aWMgdm9pZCBt
dGtfcGxhbmVfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9s
ZF9zdGF0ZSkKPiAtewo+IC0gICAgICAgc3RydWN0IG10a19wbGFuZV9zdGF0ZSAqc3RhdGUgPSB0
b19tdGtfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRlKTsKPiAtCj4gLSAgICAgICBzdGF0ZS0+cGVu
ZGluZy5lbmFibGUgPSBmYWxzZTsKPiAtICAgICAgIHdtYigpOyAvKiBNYWtlIHN1cmUgdGhlIGFi
b3ZlIHBhcmFtZXRlciBpcyBzZXQgYmVmb3JlIHVwZGF0ZSAqLwo+IC0gICAgICAgc3RhdGUtPnBl
bmRpbmcuZGlydHkgPSB0cnVlOwo+IC19Cj4gLQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9w
bGFuZV9oZWxwZXJfZnVuY3MgbXRrX3BsYW5lX2hlbHBlcl9mdW5jcyA9IHsKPiAgICAgICAgIC5w
cmVwYXJlX2ZiID0gZHJtX2dlbV9mYl9wcmVwYXJlX2ZiLAo+ICAgICAgICAgLmF0b21pY19jaGVj
ayA9IG10a19wbGFuZV9hdG9taWNfY2hlY2ssCj4gLS0KPiAyLjI3LjAuMTExLmdjNzJjN2RhNjY3
LWdvb2cKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
