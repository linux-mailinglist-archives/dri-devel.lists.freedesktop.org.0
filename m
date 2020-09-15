Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC10226AD96
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 21:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88586E134;
	Tue, 15 Sep 2020 19:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B706E134;
 Tue, 15 Sep 2020 19:29:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m6so4557336wrn.0;
 Tue, 15 Sep 2020 12:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WNOfew7cieK0fIPLf+MgiYy15Qujw2hwL5Iyu+qX2xE=;
 b=ohIxN49DAtGodQKEvkH4w5EPA9qaRJCt40swRQWxkKBIH88SL2NiKg9Rkf+SzBnXum
 lbwoLOchshoLLVuj/uAxwWx5oPPjMuLlA9109ML1HwWD2mX1Tp1ri6h1INF0fFX9VlOJ
 d/GsTLZC97ULuqqanrTeAHEjN0FGguNndIdLqiP54DHqJPsWAuXyLuc5/cbPUF8Hm9Wy
 2rpCh6l9A4560fyFoRSa0Tvl0aMlPq3brU6PrQpl2cZqF99ydsKO+QHuABkBXxJ6xbdl
 EsUNJv7OaFIrRFGSEjhlRbCMp5w6JnmVQ5RxcY0SWg/pjOLDSgksRQQ2/64+eWdnlb+p
 nW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WNOfew7cieK0fIPLf+MgiYy15Qujw2hwL5Iyu+qX2xE=;
 b=k23H+eJQ9WZRPI7S5kHBUA9jxvneWlEtDoDbkl1Q/Vp+JfnxsdZTnTQSqKOBfun6tA
 JFV3BRzr2N/J0HgyhawgEUAcDVHOhVD/pq4BY81Tsw2AQR0R/oPOxh0xsk89c10t39pV
 s/J/jgqH5n6+b/moQdh0xjLqF0Xh8VqUdFo+PNMryURuEhR9b/cHjSdR4HhPYJ0DlzBX
 kCO5tl2WEs5Sd2sLUCmU+L6Mq+Q2rrHPJywBebiht4LN0+5OpuT/f71iNeN/47ew/qce
 nefimXDqeYOOAuso2A37LVM0WLfxVqLBlocoJL9mwHxl44qDtmxT+u1noZYwxxOVKK0z
 T90A==
X-Gm-Message-State: AOAM5330jDfEHdQ8uREF59qj1BDR4H3MtvzgJuxuu04m3sfqzj0pD02e
 cQvh7X+qAqbZPOwO+9HmkMuzMqCoTiCQj3zNXYI=
X-Google-Smtp-Source: ABdhPJwuQ0az1NkHLajypW7vFoAnyGiloF+XVUfUJYGPW+n9xw4FDqRbB7+px/Or23gTyNjs6vYN7wMcMcZ6+jqqP9A=
X-Received: by 2002:a5d:6886:: with SMTP id h6mr23815361wru.374.1600198149147; 
 Tue, 15 Sep 2020 12:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200910023345.20428-1-yuehaibing@huawei.com>
 <1226ea65-a957-baa2-e9c7-fe88b1aae620@amd.com>
In-Reply-To: <1226ea65-a957-baa2-e9c7-fe88b1aae620@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Sep 2020 15:28:58 -0400
Message-ID: <CADnq5_NFKaOmx5s2DA1fkaTpYXPnFwkeUP=rtgF9yij64KJ6yA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/ttm/agp: Fix Wunused-variable warning
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Dave Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmdW5jdGlvbiBubyBsb25nZXIgZXhpc3RzLgoKQWxleAoKT24gVGh1LCBTZXAgMTAsIDIw
MjAgYXQgNDo1NiBBTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
IHdyb3RlOgo+Cj4gQW0gMTAuMDkuMjAgdW0gMDQ6MzMgc2NocmllYiBZdWVIYWliaW5nOgo+ID4g
SWYgQ09ORklHX0FHUCBpcyBub3Qgc2V0LCBnY2Mgd2FybnM6Cj4gPgo+ID4gZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fdHRtLmM6IEluIGZ1bmN0aW9uIOKAmHJhZGVvbl90dG1fdHRfYmlu
ZOKAmToKPiA+IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jOjY5MjoyNDogd2Fy
bmluZzogdW51c2VkIHZhcmlhYmxlIOKAmHJkZXbigJkgWy1XdW51c2VkLXZhcmlhYmxlXQo+ID4g
ICAgc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYgPSByYWRlb25fZ2V0X3JkZXYoYmRldik7Cj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fgo+ID4KPiA+IE1vdmUgaXQgdG8gaWZkZWYg
YmxvY2sgdG8gZml4IHRoaXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVl
aGFpYmluZ0BodWF3ZWkuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX3R0bS5jIHwgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0u
Ywo+ID4gaW5kZXggMzFjNjNkMzM5NjI5Li40NDllNzdlYjc1ZjkgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiA+IEBAIC02ODksOSArNjg5LDkgQEAgc3RhdGljIGlu
dCByYWRlb25fdHRtX3R0X2JpbmQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHR0bV90dCAqdHRtLAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKmJvX21lbSkKPiA+ICAgewo+
ID4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19BR1ApCj4gPiAgICAgICBzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldiA9IHJhZGVvbl9nZXRfcmRldihiZGV2KTsKPiA+Cj4gPiAtI2lmIElTX0VOQUJM
RUQoQ09ORklHX0FHUCkKPiA+ICAgICAgIGlmIChyZGV2LT5mbGFncyAmIFJBREVPTl9JU19BR1Ap
Cj4gPiAgICAgICAgICAgICAgIHJldHVybiB0dG1fYWdwX2JpbmQodHRtLCBib19tZW0pOwo+ID4g
ICAjZW5kaWYKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
