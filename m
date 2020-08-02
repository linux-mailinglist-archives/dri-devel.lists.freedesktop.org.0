Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B632B2354EE
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 05:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3386E056;
	Sun,  2 Aug 2020 03:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839C16E056
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 03:07:55 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C3C62078A
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 03:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596337675;
 bh=BDe3yrs2v8VZq1a11x+flngPwziIhT6reSqN/ADz+Do=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K+ksXFY7u11n48uVBOuFNHQQ9C51A4Cx58+FxIOWeKiJEnIL5aj1+hUZK1aggDn1z
 myxPzZKhwAtNJMXb4+HnJmr6aMIR00n7EUNU0o1eHBY3QdqzCwEtTAvlh4i3oNpMo0
 jhBDyaCR35CyK0BXxAATuMXx20uru00c1cnKX3RE=
Received: by mail-ed1-f47.google.com with SMTP id a14so7952158edx.7
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Aug 2020 20:07:55 -0700 (PDT)
X-Gm-Message-State: AOAM5319UpxjmXbKpUcEWfCb2ck3usrFZHhyk48uC7Jb3n4utvnmrYmt
 kVFn9rCQu3Fk0YRASJ4UFgKkKELVX4rEQBA5Rw==
X-Google-Smtp-Source: ABdhPJyuI+jxJ9FjQ8z4X4OB88xraUiJO81XEDCBTWmaeVREdXxTr4LuiheHcUQRI8EXwQMSWtSMj+P+/FhYw6yGYmE=
X-Received: by 2002:a05:6402:2037:: with SMTP id
 ay23mr10069970edb.48.1596337673694; 
 Sat, 01 Aug 2020 20:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-5-frank-w@public-files.de>
In-Reply-To: <20200728111800.77641-5-frank-w@public-files.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Aug 2020 11:07:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_99VEs2aNAoWBJhcCMsem5ewmV18B=GMLc_n-Wico_+Hg@mail.gmail.com>
Message-ID: <CAAOTY_99VEs2aNAoWBJhcCMsem5ewmV18B=GMLc_n-Wico_+Hg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/mediatek: dpi/dsi: change the getting
 possible_crtc way
To: Frank Wunderlich <frank-w@public-files.de>
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
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIw5bm0N+aciDI45pelIOmAseS6jCDkuIvljYg3OjE45a+r6YGT77yaCgo+Cj4gRnJvbTog
Sml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+Cj4gW0RldGFpbF0KPiBkcGkvZHNp
IGdldCB0aGUgcG9zc2libGVfY3J0YyBieQo+IG10a19kcm1fZmluZF9wb3NzaWJsZV9jcnRjX2J5
X2NvbXAoKmRybV9kZXYsIGRkcF9jb21wKQo+CgpJIHdvdWxkIGxpa2UgbW9yZSBpbmZvcm1hdGlv
biBvZiB3aHkgZG8gdGhpcyBwYXRjaC4gRm9yIGV4YW1wbGU6CgpGb3IgY3VycmVudCBtZWRpYXRl
ayBkc2kgZW5jb2RlciwgaXRzIHBvc3NpYmxlIGNydGMgaXMgZml4ZWQgaW4gY3J0YwowLCBhbmQg
bWVkaWF0ZWsgZHBpIGVuY29kZXIncyBwb3NzaWJsZSBjcnRjIGlzIGZpeGVkIGluIGNydGMgMS4g
SW4Kc29tZSBTb0MgdGhlIHBvc3NpYmxlIGNydGMgaXMgbm90IGZpeGVkIGluIHRoaXMgY2FzZSwg
c28gY2FsbAptdGtfZHJtX2ZpbmRfcG9zc2libGVfY3J0Y19ieV9jb21wKCkgdG8gZmluZCBvdXQg
dGhlIGNvcnJlY3QgcG9zc2libGUKY3J0Yy4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IFRlc3Q6
IGJ1aWxkIHBhc3MgYW5kIGJvb3QgdG8gbG9nbwo+Cj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hp
IDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RwaS5jIHwgMyArKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
YyB8IDMgKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gaW5kZXggZDRmMGZiN2FkMzEy
Li5lNDM5NzcwMTU4NDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiBAQCAt
NjA4LDcgKzYwOCw4IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRl
diwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+ICAgICAgICAgZHJtX2VuY29k
ZXJfaGVscGVyX2FkZCgmZHBpLT5lbmNvZGVyLCAmbXRrX2RwaV9lbmNvZGVyX2hlbHBlcl9mdW5j
cyk7Cj4KPiAgICAgICAgIC8qIEN1cnJlbnRseSBEUEkwIGlzIGZpeGVkIHRvIGJlIGRyaXZlbiBi
eSBPVkwxICovCj4gLSAgICAgICBkcGktPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPSBCSVQoMSk7
Cj4gKyAgICAgICBkcGktPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPQo+ICsgICAgICAgICAgICAg
ICBtdGtfZHJtX2ZpbmRfcG9zc2libGVfY3J0Y19ieV9jb21wKGRybV9kZXYsIGRwaS0+ZGRwX2Nv
bXApOwo+Cj4gICAgICAgICByZXQgPSBkcm1fYnJpZGdlX2F0dGFjaCgmZHBpLT5lbmNvZGVyLCBk
cGktPmJyaWRnZSwgTlVMTCwgMCk7Cj4gICAgICAgICBpZiAocmV0KSB7Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RzaS5jCj4gaW5kZXggMjcwYmYyMmM5OGZlLi5jMzFkOWMxMmQ0YTkgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBAQCAtODkyLDcgKzg5Miw4IEBAIHN0YXRp
YyBpbnQgbXRrX2RzaV9jcmVhdGVfY29ubl9lbmMoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3Ry
dWN0IG10a19kc2kgKmRzaSkKPiAgICAgICAgICAqIEN1cnJlbnRseSBkaXNwbGF5IGRhdGEgcGF0
aHMgYXJlIHN0YXRpY2FsbHkgYXNzaWduZWQgdG8gYSBjcnRjIGVhY2guCj4gICAgICAgICAgKiBj
cnRjIDAgaXMgT1ZMMCAtPiBDT0xPUjAgLT4gQUFMIC0+IE9EIC0+IFJETUEwIC0+IFVGT0UgLT4g
RFNJMAo+ICAgICAgICAgICovCj4gLSAgICAgICBkc2ktPmVuY29kZXIucG9zc2libGVfY3J0Y3Mg
PSAxOwo+ICsgICAgICAgZHNpLT5lbmNvZGVyLnBvc3NpYmxlX2NydGNzID0KPiArICAgICAgICAg
ICAgICAgbXRrX2RybV9maW5kX3Bvc3NpYmxlX2NydGNfYnlfY29tcChkcm0sIGRzaS0+ZGRwX2Nv
bXApOwo+Cj4gICAgICAgICAvKiBJZiB0aGVyZSdzIGEgYnJpZGdlLCBhdHRhY2ggdG8gaXQgYW5k
IGxldCBpdCBjcmVhdGUgdGhlIGNvbm5lY3RvciAqLwo+ICAgICAgICAgaWYgKGRzaS0+YnJpZGdl
KSB7Cj4gLS0KPiAyLjI1LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
