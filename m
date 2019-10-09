Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C65D13D1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 18:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80276EA0A;
	Wed,  9 Oct 2019 16:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D796EA0A;
 Wed,  9 Oct 2019 16:17:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w12so3748748wro.5;
 Wed, 09 Oct 2019 09:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/XG8wGMoyUv6lYKMyZk/b63prTSeiN7OqjwfzhXPeBU=;
 b=ClzPqsm4OGmBvRNxBLbxLeL4kTBZ16bgsenL446IVa1qZKePolejCmATZkGCWc8UVw
 xGoREJY8k+Lx20kz9PCXm3V+46rfNHM16U5mCjmHUO+8qX6rkYj9jOT8cJkvw3dd5vFV
 3x0n+ZqVqt69O+I9/1R3xRLZH/8JcFjNwFH65TZtrYpydJRIi39DUpx/9xq4q9mcK1H7
 /2s0YognEH5TZbPv3mzymR77oNxeqG4NbKuLolcxvqfJq+7eWYkE9qbiS1ktl2bR8DPL
 2J4sOferiO6I7HjBAWa+B92ZuX022AAB0fYYRFpF1aRlCBr5wBQNcEiDUstNJPyue7bJ
 xOUg==
X-Gm-Message-State: APjAAAXlXi47eXawp8fIOSyQsE9YBcwI5absFTti+36EO8DCCKYfvDK4
 XwNRSzNWJyaDZWTwHoj4m/BGRnLXPEWgjasqpyI=
X-Google-Smtp-Source: APXvYqwuFxizJIc608t7uMIyzZUpg60M7UXO170bbTV8WWpxvxozUM5YuBaV9KuuipR2H0z6C97a1BSFfNMask+sQyg=
X-Received: by 2002:adf:db43:: with SMTP id f3mr2544310wrj.11.1570637872054;
 Wed, 09 Oct 2019 09:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191009113557.41ced49e@canb.auug.org.au>
In-Reply-To: <20191009113557.41ced49e@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Oct 2019 12:17:36 -0400
Message-ID: <CADnq5_M0+PqajRUxgho2WVLq4ykdHJh=4-mWKrR25_93HMj68Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/XG8wGMoyUv6lYKMyZk/b63prTSeiN7OqjwfzhXPeBU=;
 b=mZTMp25p5tZ0QS0QQn2WdAs83YNBwqRMFSxTq86nFaKIOCf6chuWTaKlENsao9OeDa
 CgKnDADSE7Dx8ODu0JgVhrgWjnRKMJ8mLWF8hwOvWD1fTLSGiLKWDozvjerIiL8V3Ggr
 5OTCrQ+ZGZUaMshEx0AyLZjb3p5dwvfgKoTZMynJGZHvgMuW74cqgCYYF4gZuClipIAM
 Pf7+SfYjBr3ipQG9Znp04j3nKycyUWT6604f5EZRVDocOU441jop29clCIKCU6wIbhLK
 Mt1OomC3eSIhfyaEWnQcS2UPXs4KhsBEJnGw1+YGgowp/9LnB1Pu+IEu0ednFtBwIGyD
 goEA==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFR1ZSwgT2N0IDgsIDIwMTkgYXQgODozNiBQTSBT
dGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4gd3JvdGU6Cj4KPiBIaSBhbGws
Cj4KPiBBZnRlciBtZXJnaW5nIHRoZSBkcm0tbWlzYyB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQg
YnVpbGQgKHg4Nl82NAo+IGFsbG1vZGNvbmZpZykgZmFpbGVkIGxpa2UgdGhpczoKPgo+IEluIGZp
bGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9hbWRrZmQva2Zk
X21vZHVsZS5jOjI1Ogo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2FtZGtmZC9rZmRf
cHJpdi5oOjQwOjEwOiBmYXRhbCBlcnJvcjogZHJtL2RybVAuaDogTm8gc3VjaCBmaWxlIG9yIGRp
cmVjdG9yeQo+ICAgIDQwIHwgI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gICAgICAgfCAgICAgICAg
ICBefn5+fn5+fn5+fn4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vYW1ka2ZkL2tmZF9jaGFyZGV2LmM6Mzg6Cj4gZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vYW1ka2ZkL2tmZF9wcml2Lmg6NDA6MTA6IGZhdGFsIGVycm9yOiBkcm0vZHJt
UC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gICAgNDAgfCAjaW5jbHVkZSA8ZHJtL2Ry
bVAuaD4KPiAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fgo+IEluIGZpbGUgaW5jbHVkZWQg
ZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9hbWRrZmQva2ZkX2RldmljZS5jOjI2
Ogo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2FtZGtmZC9rZmRfcHJpdi5oOjQwOjEw
OiBmYXRhbCBlcnJvcjogZHJtL2RybVAuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ICAg
IDQwIHwgI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+
fn4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
YW1ka2ZkL2tmZF90b3BvbG9neS5jOjM0Ogo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2FtZGtmZC9rZmRfcHJpdi5oOjQwOjEwOiBmYXRhbCBlcnJvcjogZHJtL2RybVAuaDogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQo+ICAgIDQwIHwgI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gICAg
ICAgfCAgICAgICAgICBefn5+fn5+fn5+fn4KPgo+Cj4gQ2F1c2VkIGJ5IGNvbW1pdAo+Cj4gICA0
ZTk4Zjg3MWJjZmYgKCJkcm06IGRlbGV0ZSBkcm1QLmggKyBkcm1fb3NfbGludXguaCIpCj4KPiBp
bnRlcmFjdGluZyB3aXRoIGNvbW1pdAo+Cj4gICA2Yjg1NWY3YjgzZDIgKCJkcm0vYW1ka2ZkOiBD
aGVjayBhZ2FpbnN0IGRldmljZSBjZ3JvdXAiKQo+Cj4gZnJvbSB0aGUgYW1kZ3B1IHRyZWUuCj4K
PiBJIGFkZGVkIHRoZSBmb2xsb3dpbmcgbWVyZ2UgZml4IHBhdGNoIGZvciB0b2RheToKPgo+IEZy
b206IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IERhdGU6IFdlZCwg
OSBPY3QgMjAxOSAxMToyNDozOCArMTEwMAo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGtmZDog
dXBkYXRlIGZvciBkcm1QLmggcmVtb3ZhbAo+Cj4gU2lnbmVkLW9mZi1ieTogU3RlcGhlbiBSb3Ro
d2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9wcml2LmggfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9wcml2LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJp
di5oCj4gaW5kZXggYjhiNDQ4NWM4Zjc0Li40MWJjMDQyOGJmYzAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgKPiBAQCAtMzcsNyArMzcsOSBAQAo+ICAjaW5jbHVkZSA8
bGludXgva3JlZi5oPgo+ICAjaW5jbHVkZSA8bGludXgvc3lzZnMuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L2RldmljZV9jZ3JvdXAuaD4KPiAtI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gKyNpbmNsdWRl
IDxkcm0vZHJtX2ZpbGUuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+Cj4gKyNpbmNsdWRl
IDxkcm0vZHJtX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8a2dkX2tmZF9pbnRlcmZhY2UuaD4KPgo+
ICAjaW5jbHVkZSAiYW1kX3NoYXJlZC5oIgo+IEBAIC00OSw4ICs1MSw2IEBACj4gIC8qIEdQVSBJ
RCBoYXNoIHdpZHRoIGluIGJpdHMgKi8KPiAgI2RlZmluZSBLRkRfR1BVX0lEX0hBU0hfV0lEVEgg
MTYKPgo+IC1zdHJ1Y3QgZHJtX2RldmljZTsKPiAtCj4gIC8qIFVzZSB1cHBlciBiaXRzIG9mIG1t
YXAgb2Zmc2V0IHRvIHN0b3JlIEtGRCBkcml2ZXIgc3BlY2lmaWMgaW5mb3JtYXRpb24uCj4gICAq
IEJJVFNbNjM6NjJdIC0gRW5jb2RlIE1NQVAgdHlwZQo+ICAgKiBCSVRTWzYxOjQ2XSAtIEVuY29k
ZSBncHVfaWQuIFRvIGlkZW50aWZ5IHRvIHdoaWNoIEdQVSB0aGUgb2Zmc2V0IGJlbG9uZ3MgdG8K
PiAtLQo+IDIuMjMuMAo+Cj4gLS0KPiBDaGVlcnMsCj4gU3RlcGhlbiBSb3Rod2VsbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
