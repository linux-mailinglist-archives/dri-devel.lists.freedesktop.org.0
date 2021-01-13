Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B672E2F5543
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 00:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D036ECAE;
	Wed, 13 Jan 2021 23:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44F66ECAE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 23:49:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5394F23370
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 23:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610581746;
 bh=Smp7CBcsbwTpztK0DhWsbG+PGWv9mq20lRCePwZJocM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UO7fzeItexglalq9gLqMO12U3TTA56lXYBM+GJRkxiBvhlnj8MscCgPfbc87JGjWr
 92I7ndM5YUB+GzlXAljk4nFnQSb+qOJTNMjABim8T/FlvqaPa02DqyHXd+wiYOtwtQ
 PT5YPPpuPJ7JX7gbFnisXUMfP5xs40qhYE5puctsvYGw+URACccJhk0+ACxVtZdg2W
 gMLS9cXtl7hYYZ8t60LYWeOyfxITEVSPhOjH9+lpRkAKQAXJ9paupmxTa/33aKC2Gy
 ZSaHQhJH4oSDVfgNbBZ7FbSD/2D/bV2o5tp4GSPnS3DeB/JWWqVPIZaP61vSYHzPYE
 qiEuwzcFOSGQg==
Received: by mail-wm1-f54.google.com with SMTP id e25so3166678wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 15:49:06 -0800 (PST)
X-Gm-Message-State: AOAM533FFCl2eCtdszQ2s6WmkjBb6Dnqp9j5RaVquTZN34h+3Ne2GoCv
 k9ilgOLKrLQU6EYWV7p6weXY9yyg0FjtI6RaLQ==
X-Google-Smtp-Source: ABdhPJy8+DTEWUczkI17EVLxIUAVLLky1a8Ef6nLYa3ITeegi5pMpgXdPknlUvq+XI50gV49SMzrocSmwF4NuNm4Irw=
X-Received: by 2002:a05:600c:25c2:: with SMTP id
 2mr1376818wml.170.1610581744920; 
 Wed, 13 Jan 2021 15:49:04 -0800 (PST)
MIME-Version: 1.0
References: <20201203082445.1342763-1-hsinyi@chromium.org>
 <CAAOTY__+FHHd6Coa9HDvS_e7Q7dD3gZm7FBbhymOR2w2-i8i4w@mail.gmail.com>
In-Reply-To: <CAAOTY__+FHHd6Coa9HDvS_e7Q7dD3gZm7FBbhymOR2w2-i8i4w@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 14 Jan 2021 07:48:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8eEgems8T-KJim--t5wCiPV8mEsqW3=HJa7tgEFuoezA@mail.gmail.com>
Message-ID: <CAAOTY_8eEgems8T-KJim--t5wCiPV8mEsqW3=HJa7tgEFuoezA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Create connector for bridges
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8
IDIwMjDlubQxMuaciDEx5pelIOmAseS6lCDkuIvljYgxMDowNOWvq+mBk++8mgo+Cj4gSGksIEhz
aW4tWWk6Cj4KPiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIw5bm0
MTLmnIgz5pelIOmAseWbmyDkuIvljYg0OjI05a+r6YGT77yaCj4gPgo+ID4gU2ltaWxhciB0byBh
OWQ5ZmVhNzRiZTIgKCJkcm0vbWVkaWF0ZWs6IG10a19kc2k6IENyZWF0ZSBjb25uZWN0b3IgZm9y
IGJyaWRnZXMiKToKPiA+Cj4gPiBVc2UgdGhlIGRybV9icmlkZ2VfY29ubmVjdG9yIGhlbHBlciB0
byBjcmVhdGUgYSBjb25uZWN0b3IgZm9yIHBpcGVsaW5lcwo+ID4gdGhhdCB1c2UgZHJtX2JyaWRn
ZS4gVGhpcyBhbGxvd3Mgc3BsaXR0aW5nIGNvbm5lY3RvciBvcGVyYXRpb25zIGFjcm9zcwo+ID4g
bXVsdGlwbGUgYnJpZGdlcyB3aGVuIG5lY2Vzc2FyeSwgaW5zdGVhZCBvZiBoYXZpbmcgdGhlIGxh
c3QgYnJpZGdlIGluCj4gPiB0aGUgY2hhaW4gY3JlYXRpbmcgdGhlIGNvbm5lY3RvciBhbmQgaGFu
ZGxpbmcgYWxsIGNvbm5lY3RvciBvcGVyYXRpb25zCj4gPiBpbnRlcm5hbGx5Lgo+Cj4gUmV2aWV3
ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKQXBwbGllZCB0
byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/
aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwgMTMgKysrKysrKysrKysrLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gPiBpbmRleCA1MmYxMWE2M2EzMzAuLjE4
OTM3N2UzNDJmYSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiA+IEBA
IC0yMCw2ICsyMCw3IEBACj4gPgo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIu
aD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9icmlkZ2UuaD4KPiA+ICsjaW5jbHVkZSA8ZHJtL2Ry
bV9icmlkZ2VfY29ubmVjdG9yLmg+Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgo+ID4g
ICNpbmNsdWRlIDxkcm0vZHJtX29mLmg+Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2tt
c19oZWxwZXIuaD4KPiA+IEBAIC02Niw2ICs2Nyw3IEBAIHN0cnVjdCBtdGtfZHBpIHsKPiA+ICAg
ICAgICAgc3RydWN0IGRybV9lbmNvZGVyIGVuY29kZXI7Cj4gPiAgICAgICAgIHN0cnVjdCBkcm1f
YnJpZGdlIGJyaWRnZTsKPiA+ICAgICAgICAgc3RydWN0IGRybV9icmlkZ2UgKm5leHRfYnJpZGdl
Owo+ID4gKyAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwo+ID4gICAgICAg
ICB2b2lkIF9faW9tZW0gKnJlZ3M7Cj4gPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKPiA+
ICAgICAgICAgc3RydWN0IGNsayAqZW5naW5lX2NsazsKPiA+IEBAIC02MDMsMTIgKzYwNSwyMSBA
QCBzdGF0aWMgaW50IG10a19kcGlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZp
Y2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiA+Cj4gPiAgICAgICAgIGRwaS0+ZW5jb2Rlci5wb3Nz
aWJsZV9jcnRjcyA9IG10a19kcm1fZmluZF9wb3NzaWJsZV9jcnRjX2J5X2NvbXAoZHJtX2Rldiwg
ZHBpLT5kZHBfY29tcCk7Cj4gPgo+ID4gLSAgICAgICByZXQgPSBkcm1fYnJpZGdlX2F0dGFjaCgm
ZHBpLT5lbmNvZGVyLCAmZHBpLT5icmlkZ2UsIE5VTEwsIDApOwo+ID4gKyAgICAgICByZXQgPSBk
cm1fYnJpZGdlX2F0dGFjaCgmZHBpLT5lbmNvZGVyLCAmZHBpLT5icmlkZ2UsIE5VTEwsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9CUklER0VfQVRUQUNIX05PX0NPTk5F
Q1RPUik7Cj4gPiAgICAgICAgIGlmIChyZXQpIHsKPiA+ICAgICAgICAgICAgICAgICBkZXZfZXJy
KGRldiwgIkZhaWxlZCB0byBhdHRhY2ggYnJpZGdlOiAlZFxuIiwgcmV0KTsKPiA+ICAgICAgICAg
ICAgICAgICBnb3RvIGVycl9jbGVhbnVwOwo+ID4gICAgICAgICB9Cj4gPgo+ID4gKyAgICAgICBk
cGktPmNvbm5lY3RvciA9IGRybV9icmlkZ2VfY29ubmVjdG9yX2luaXQoZHJtX2RldiwgJmRwaS0+
ZW5jb2Rlcik7Cj4gPiArICAgICAgIGlmIChJU19FUlIoZHBpLT5jb25uZWN0b3IpKSB7Cj4gPiAr
ICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJVbmFibGUgdG8gY3JlYXRlIGJyaWRnZSBjb25u
ZWN0b3JcbiIpOwo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoZHBpLT5jb25uZWN0
b3IpOwo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX2NsZWFudXA7Cj4gPiArICAgICAgIH0K
PiA+ICsgICAgICAgZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2RlcihkcGktPmNvbm5lY3Rvciwg
JmRwaS0+ZW5jb2Rlcik7Cj4gPiArCj4gPiAgICAgICAgIGRwaS0+Yml0X251bSA9IE1US19EUElf
T1VUX0JJVF9OVU1fOEJJVFM7Cj4gPiAgICAgICAgIGRwaS0+Y2hhbm5lbF9zd2FwID0gTVRLX0RQ
SV9PVVRfQ0hBTk5FTF9TV0FQX1JHQjsKPiA+ICAgICAgICAgZHBpLT55Y19tYXAgPSBNVEtfRFBJ
X09VVF9ZQ19NQVBfUkdCOwo+ID4gLS0KPiA+IDIuMjkuMi41NzYuZ2EzZmM0NDZkODQtZ29vZwo+
ID4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
