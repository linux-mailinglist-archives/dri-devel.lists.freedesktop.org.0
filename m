Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD042056B3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 18:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386D76E9E8;
	Tue, 23 Jun 2020 16:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF07C6E9E8;
 Tue, 23 Jun 2020 16:02:10 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C5F320781;
 Tue, 23 Jun 2020 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592928130;
 bh=lgwtT19xKweBZEzgfBI2ZvdEk0sjRs5leWn5RlZvKaA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d1IKjLsEya0MJkIt+nk5fRxEmnGTb/EJDOBs5H+vqMjWkDwKLfesfZYGiCxf2kgpz
 b07f3BGARP6qlArza6MEGzQxbceDfhirf6Gxx9i7MJaOtg3fMJKTNqa+maZtXq8hgy
 16DoDeCeDN3cGYnxvVluzEZnHrVHD8qaimi679Ko=
Received: by mail-ed1-f52.google.com with SMTP id t21so16748075edr.12;
 Tue, 23 Jun 2020 09:02:10 -0700 (PDT)
X-Gm-Message-State: AOAM533tfarrEEExh9KLgfGBGOl8LBczE4kWhP+lxbZoZSWwEXHQuKWU
 sJ3RsLOtRHlXxmf2YIUhlISsDIsXJzR7HY5SrA==
X-Google-Smtp-Source: ABdhPJzh79zfALzI26cvItAmyebzTyzXB9kb7DS7PCOiS06ZO4zZJ1rMJnd9vUT0V3TK0pqS41FF02ejyfhgY4fzBEE=
X-Received: by 2002:a50:cd53:: with SMTP id d19mr3588430edj.300.1592928128985; 
 Tue, 23 Jun 2020 09:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20200612160056.2082681-4-daniel.vetter@ffwll.ch>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 24 Jun 2020 00:01:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Vvu8C97j3-zfUFeY4OgWZvUzqOm+=A2AQyJcRUWWidQ@mail.gmail.com>
Message-ID: <CAAOTY__Vvu8C97j3-zfUFeY4OgWZvUzqOm+=A2AQyJcRUWWidQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/mtk: Use __drm_atomic_helper_crtc_reset
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERhbmllbDoKCkRhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IOaWvCAy
MDIw5bm0NuaciDEz5pelIOmAseWFrSDkuIrljYgxMjowMeWvq+mBk++8mgo+Cj4gTm93IGFsc28g
Y29tZXMgd2l0aCB0aGUgYWRkZWQgYmVuZWZpdCBvZiBkb2luZyBhIGRybV9jcnRjX3ZibGFua19v
ZmYoKSwKPiB3aGljaCBtZWFucyB2Ymxhbmsgc3RhdGUgaXNuJ3QgaWxsLWRlZmluZWQgYW5kIGZh
aWwteSBhdCBkcml2ZXIgbG9hZAo+IGJlZm9yZSB0aGUgZmlyc3QgbW9kZXNldCBvbiBlYWNoIGNy
dGMuCj4KCkFja2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4K
Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
Cj4gQ2M6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IENjOiBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IENjOiBNYXR0aGlhcyBCcnVnZ2Vy
IDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAxNiArKysrKyst
LS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ny
dGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IGluZGV4IGE3
ZGJhNGNlZDkwMi4uZDY1NGM3ZDUxNGJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2NydGMuYwo+IEBAIC0xMTIsMTkgKzExMiwxNSBAQCBzdGF0aWMgdm9pZCBtdGtfZHJt
X2NydGNfcmVzZXQoc3RydWN0IGRybV9jcnRjICpjcnRjKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qg
bXRrX2NydGNfc3RhdGUgKnN0YXRlOwo+Cj4gLSAgICAgICBpZiAoY3J0Yy0+c3RhdGUpIHsKPiAr
ICAgICAgIGlmIChjcnRjLT5zdGF0ZSkKPiAgICAgICAgICAgICAgICAgX19kcm1fYXRvbWljX2hl
bHBlcl9jcnRjX2Rlc3Ryb3lfc3RhdGUoY3J0Yy0+c3RhdGUpOwo+Cj4gLSAgICAgICAgICAgICAg
IHN0YXRlID0gdG9fbXRrX2NydGNfc3RhdGUoY3J0Yy0+c3RhdGUpOwo+IC0gICAgICAgICAgICAg
ICBtZW1zZXQoc3RhdGUsIDAsIHNpemVvZigqc3RhdGUpKTsKPiAtICAgICAgIH0gZWxzZSB7Cj4g
LSAgICAgICAgICAgICAgIHN0YXRlID0ga3phbGxvYyhzaXplb2YoKnN0YXRlKSwgR0ZQX0tFUk5F
TCk7Cj4gLSAgICAgICAgICAgICAgIGlmICghc3RhdGUpCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuOwo+IC0gICAgICAgICAgICAgICBjcnRjLT5zdGF0ZSA9ICZzdGF0ZS0+YmFzZTsK
PiAtICAgICAgIH0KPiArICAgICAgIGtmcmVlKHRvX210a19jcnRjX3N0YXRlKGNydGMtPnN0YXRl
KSk7Cj4gKyAgICAgICBjcnRjLT5zdGF0ZSA9IE5VTEw7Cj4KPiAtICAgICAgIHN0YXRlLT5iYXNl
LmNydGMgPSBjcnRjOwo+ICsgICAgICAgc3RhdGUgPSBremFsbG9jKHNpemVvZigqc3RhdGUpLCBH
RlBfS0VSTkVMKTsKPiArICAgICAgIGlmIChzdGF0ZSkKPiArICAgICAgICAgICAgICAgX19kcm1f
YXRvbWljX2hlbHBlcl9jcnRjX3Jlc2V0KGNydGMsICZzdGF0ZS0+YmFzZSk7Cj4gIH0KPgo+ICBz
dGF0aWMgc3RydWN0IGRybV9jcnRjX3N0YXRlICptdGtfZHJtX2NydGNfZHVwbGljYXRlX3N0YXRl
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPiAtLQo+IDIuMjYuMgo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
