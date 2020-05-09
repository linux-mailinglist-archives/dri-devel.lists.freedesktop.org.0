Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CA81CC1DC
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 15:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AD16E065;
	Sat,  9 May 2020 13:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606106E065
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 13:46:10 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0166C2184D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589031970;
 bh=1ihYsf1+lXCkaFnSaO++0t2TtnFCHX9Hk1C6Hp+UDIQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mshE+59w+QHUu6Dwlm5achuCo37BY10YfO/zEZbWAFb7Z5vY5wWweKaoHyXIhRWrO
 Kcav5qPZm0JsDCzmVG1Y5WhFhogoQLDKL/nxzGbwl8tnMo8Rn7LgX7b2qGtKl6P4fy
 2kIui5nvKyEwnV/Rv3hPEdExvCL0yLwmdKhEY+eI=
Received: by mail-ed1-f52.google.com with SMTP id y24so3767002edo.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 May 2020 06:46:09 -0700 (PDT)
X-Gm-Message-State: AGi0PuZiNFdm4NVmQNkXNUrxlCadfgG6AdynjRYecZs/haFld7YF4/Vq
 LPeml3V6jSJWU+xVbkk/DibXlwlFYFQDYxZnyg==
X-Google-Smtp-Source: APiQypI0nckB6aAzGaag9YUcpz7BgskXRPVWx9mlUiptnww+gAulyZ1V7L1MtmvOO/kyzbErLF4fYzrUSrQKN8e9snM=
X-Received: by 2002:a05:6402:1f6:: with SMTP id
 i22mr6474258edy.271.1589031968414; 
 Sat, 09 May 2020 06:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-21-emil.l.velikov@gmail.com>
In-Reply-To: <20200507150822.114464-21-emil.l.velikov@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 9 May 2020 21:45:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8orbATyjZkcdYKX+9544vt4LdR+0z4TXrjcr5U_5t1aA@mail.gmail.com>
Message-ID: <CAAOTY_8orbATyjZkcdYKX+9544vt4LdR+0z4TXrjcr5U_5t1aA@mail.gmail.com>
Subject: Re: [PATCH 20/36] drm/mediatek: remove _unlocked suffix in
 drm_object_put_unlocked
To: Emil Velikov <emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVtaWw6CgpFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4g5pa8IDIw
MjDlubQ15pyIN+aXpSDpgLHlm5sg5LiL5Y2IMTE6MTHlr6vpgZPvvJoKPgo+IEZyb206IEVtaWwg
VmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4KPiBTcGVsbGluZyBvdXQgX3Vu
bG9ja2VkIGZvciBlYWNoIGFuZCBldmVyeSBkcml2ZXIgaXMgYSBhbm5veWluZy4KPiBFc3BlY2lh
bGx5IGlmIHdlIGNvbnNpZGVyIGhvdyBtYW55IGRyaXZlcnMsIGRvIG5vdCBrbm93IChvciBuZWVk
IHRvKQo+IGFib3V0IHRoZSBob3Jyb3Igc3RvcmllcyBpbnZvbHZpbmcgc3RydWN0X211dGV4Lgo+
Cj4gSnVzdCBkcm9wIHRoZSBzdWZmaXguIEl0IG1ha2VzIHRoZSBBUEkgY2xlYW5lci4KPgo+IERv
bmUgdmlhIHRoZSBmb2xsb3dpbmcgc2NyaXB0Ogo+Cj4gX19mcm9tPWRybV9nZW1fb2JqZWN0X3B1
dF91bmxvY2tlZAo+IF9fdG89ZHJtX2dlbV9vYmplY3RfcHV0Cj4gZm9yIF9fZmlsZSBpbiAkKGdp
dCBncmVwIC0tbmFtZS1vbmx5ICRfX2Zyb20pOyBkbwo+ICAgc2VkIC1pICAicy8kX19mcm9tLyRf
X3RvL2ciICRfX2ZpbGU7Cj4gZG9uZQoKQWNrZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFu
Zy5odUBrZXJuZWwub3JnPgoKPgo+IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2Vy
bmVsLm9yZz4KPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IFNpZ25lZC1vZmYtYnk6IEVtaWwg
VmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2dlbS5jCj4gaW5kZXggYjA0YTNjMmIxMTFlLi5mY2I4MWYzNTQyMjQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+IEBAIC0xMTcsNyArMTE3LDcgQEAgaW50
IG10a19kcm1fZ2VtX2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LCBzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAgICAgICAgICAgICAgICBnb3RvIGVycl9oYW5kbGVfY3Jl
YXRlOwo+Cj4gICAgICAgICAvKiBkcm9wIHJlZmVyZW5jZSBmcm9tIGFsbG9jYXRlIC0gaGFuZGxl
IGhvbGRzIGl0IG5vdy4gKi8KPiAtICAgICAgIGRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZCgm
bXRrX2dlbS0+YmFzZSk7Cj4gKyAgICAgICBkcm1fZ2VtX29iamVjdF9wdXQoJm10a19nZW0tPmJh
c2UpOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPgo+IC0tCj4gMi4yNS4xCj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
