Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 956E92ECD71
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 11:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CAD6E40B;
	Thu,  7 Jan 2021 10:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE436E40B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 10:05:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2240D2333F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610013926;
 bh=XWCiwpuOus+rdx5NyKPd3hsIfab/jop8IOEOi6Fl1DA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZQlxjdoPZBXInGVwW3bTDZ4hvXBCLB1JkW5GjZ7QKa8miUN/QoTEvHKaXGjhCWP2k
 OWMmcVm8Rg3sSrDhqtbGEpVn0q3L5vlm4t4JeTMxmErtvysj6IfrxbAxKpUhVXrYw1
 4fmh8vS3lE6eaDGvD0fsUQ6uJnqlaki1338DY8/effyd3TcAx2KLycvuc3imj5+mLA
 NhtjcHxr8yATbbnFhHOwRI/uYoKSgb63DEawnvZArG6jb+uk7q9k8oRAqpl4MiFCCt
 9zOrqcpFKUppfsDVIXTTsjdi6+oBbYz7ONtFPM0OAXimIfeDJ/gzizKve1KoHORJcK
 uNzbWlYafWYmg==
Received: by mail-ed1-f46.google.com with SMTP id r5so7129663eda.12
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 02:05:26 -0800 (PST)
X-Gm-Message-State: AOAM53268qqfCZXo2zqv6uCOOOFM3Ar+pPsx6QJNQZ8Va6bc/mN8E2mr
 toXmeGP+VDIxMQUbgyT4JfyMAdefOnmQNr+yog==
X-Google-Smtp-Source: ABdhPJy6aKdf+ALvz/JPUW+3K8X25ja4+q1SbtTR9U4Ty1Mcr7xuSbOEslRjkoLF1UiANP8PhaulwzMLGh/Te/js2dU=
X-Received: by 2002:a50:c3c5:: with SMTP id i5mr1123540edf.166.1610013924641; 
 Thu, 07 Jan 2021 02:05:24 -0800 (PST)
MIME-Version: 1.0
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-6-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609989081-29353-6-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 7 Jan 2021 18:05:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Ox7jxLxQvm_mvAqEedj48=grH0Mao7xZ5bLuABZNeMQ@mail.gmail.com>
Message-ID: <CAAOTY__Ox7jxLxQvm_mvAqEedj48=grH0Mao7xZ5bLuABZNeMQ@mail.gmail.com>
Subject: Re: [PATCH v9,
 05/11] drm/mediatek: add fifo_size into rdma private data
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIg35pelIOmAseWbmyDkuIrljYgxMToxMuWvq+mBk++8mgo+Cj4gR2V0
IHRoZSBmaWZvIHNpemUgZnJvbSBkZXZpY2UgdHJlZQo+IGJlY2F1c2UgZWFjaCByZG1hIGluIHRo
ZSBzYW1lIFNvQyBtYXkgaGF2ZSBkaWZmZXJlbnQgZmlmbyBzaXplCgpSZXZpZXdlZC1ieTogQ2h1
bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTog
WW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgfCAxOSArKysrKysrKysrKysrKysr
KystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMKPiBpbmRleCBkNDZiOGFl
Li44YzY0ZDVjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9yZG1hLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5j
Cj4gQEAgLTY0LDYgKzY0LDcgQEAgc3RydWN0IG10a19kaXNwX3JkbWEgewo+ICAgICAgICAgc3Ry
dWN0IG10a19kZHBfY29tcCAgICAgICAgICAgICBkZHBfY29tcDsKPiAgICAgICAgIHN0cnVjdCBk
cm1fY3J0YyAgICAgICAgICAgICAgICAgKmNydGM7Cj4gICAgICAgICBjb25zdCBzdHJ1Y3QgbXRr
X2Rpc3BfcmRtYV9kYXRhICpkYXRhOwo+ICsgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmaWZvX3NpemU7Cj4gIH07Cj4KPiAgc3RhdGljIGlubGluZSBzdHJ1Y3QgbXRrX2Rp
c3BfcmRtYSAqY29tcF90b19yZG1hKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCj4gQEAgLTEz
MiwxMiArMTMzLDE4IEBAIHN0YXRpYyB2b2lkIG10a19yZG1hX2NvbmZpZyhzdHJ1Y3QgbXRrX2Rk
cF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgd2lkdGgsCj4gICAgICAgICB1bnNpZ25lZCBpbnQg
dGhyZXNob2xkOwo+ICAgICAgICAgdW5zaWduZWQgaW50IHJlZzsKPiAgICAgICAgIHN0cnVjdCBt
dGtfZGlzcF9yZG1hICpyZG1hID0gY29tcF90b19yZG1hKGNvbXApOwo+ICsgICAgICAgdTMyIHJk
bWFfZmlmb19zaXplOwo+Cj4gICAgICAgICBtdGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3QsIHdp
ZHRoLCBjb21wLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIERJU1BfUkVHX1JETUFfU0la
RV9DT05fMCwgMHhmZmYpOwo+ICAgICAgICAgbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCBo
ZWlnaHQsIGNvbXAsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgRElTUF9SRUdfUkRNQV9T
SVpFX0NPTl8xLCAweGZmZmZmKTsKPgo+ICsgICAgICAgaWYgKHJkbWEtPmZpZm9fc2l6ZSkKPiAr
ICAgICAgICAgICAgICAgcmRtYV9maWZvX3NpemUgPSByZG1hLT5maWZvX3NpemU7Cj4gKyAgICAg
ICBlbHNlCj4gKyAgICAgICAgICAgICAgIHJkbWFfZmlmb19zaXplID0gUkRNQV9GSUZPX1NJWkUo
cmRtYSk7Cj4gKwo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIEVuYWJsZSBGSUZPIHVuZGVyZmxv
dyBzaW5jZSBEU0kgYW5kIERQSSBjYW4ndCBiZSBibG9ja2VkLgo+ICAgICAgICAgICogS2VlcCB0
aGUgRklGTyBwc2V1ZG8gc2l6ZSByZXNldCBkZWZhdWx0IG9mIDggS2lCLiBTZXQgdGhlCj4gQEAg
LTE0Niw3ICsxNTMsNyBAQCBzdGF0aWMgdm9pZCBtdGtfcmRtYV9jb25maWcoc3RydWN0IG10a19k
ZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50IHdpZHRoLAo+ICAgICAgICAgICovCj4gICAgICAg
ICB0aHJlc2hvbGQgPSB3aWR0aCAqIGhlaWdodCAqIHZyZWZyZXNoICogNCAqIDcgLyAxMDAwMDAw
Owo+ICAgICAgICAgcmVnID0gUkRNQV9GSUZPX1VOREVSRkxPV19FTiB8Cj4gLSAgICAgICAgICAg
ICBSRE1BX0ZJRk9fUFNFVURPX1NJWkUoUkRNQV9GSUZPX1NJWkUocmRtYSkpIHwKPiArICAgICAg
ICAgICAgIFJETUFfRklGT19QU0VVRE9fU0laRShyZG1hX2ZpZm9fc2l6ZSkgfAo+ICAgICAgICAg
ICAgICAgUkRNQV9PVVRQVVRfVkFMSURfRklGT19USFJFU0hPTEQodGhyZXNob2xkKTsKPiAgICAg
ICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIHJlZywgY29tcCwgRElTUF9SRUdfUkRNQV9GSUZP
X0NPTik7Cj4gIH0KPiBAQCAtMjkyLDYgKzI5OSwxNiBAQCBzdGF0aWMgaW50IG10a19kaXNwX3Jk
bWFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIGNvbXBfaWQ7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIGlmIChvZl9maW5kX3Byb3Bl
cnR5KGRldi0+b2Zfbm9kZSwgIm1lZGlhdGVrLHJkbWEtZmlmby1zaXplIiwgJnJldCkpIHsKPiAr
ICAgICAgICAgICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIoZGV2LT5vZl9ub2RlLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAibWVkaWF0ZWsscmRt
YS1maWZvLXNpemUiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmcHJpdi0+Zmlmb19zaXplKTsKPiArICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCByZG1hIGZpZm8g
c2l6ZVxuIik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAg
ICAgICAgICAgfQo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIHJldCA9IG10a19kZHBfY29tcF9p
bml0KGRldiwgZGV2LT5vZl9ub2RlLCAmcHJpdi0+ZGRwX2NvbXAsIGNvbXBfaWQsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmbXRrX2Rpc3BfcmRtYV9mdW5jcyk7Cj4gICAgICAg
ICBpZiAocmV0KSB7Cj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
PiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
