Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 942EF25AE09
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 16:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6A56E402;
	Wed,  2 Sep 2020 14:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A636E402
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 14:58:26 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A41362137B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599058705;
 bh=gBVOTaKneMMxgCAgGNfhmmESJjJgjZ9QwPp7zryvhx8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Vvv9VrQO6bAgn8luFm9R9vLPl4jT3Er12xrknUnKuH7s0mLDQU2npW7WpfS3lp9fT
 d4sqZlLyfPThi4M21T8Mknx+giVMK0V51cautJcqGVba+1gB1kezmgapcdeaLP+crj
 1IKtYbNzd2j7sKL0PTIIGPxoHh9JGIq6q3e3rk2g=
Received: by mail-ed1-f49.google.com with SMTP id a12so5217167eds.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 07:58:25 -0700 (PDT)
X-Gm-Message-State: AOAM530BugsHf/0nN6gYdw8en/q/Kb3Q2vYy/PDYPpDpoRcIDb3O+yTu
 6BUBAEyy1olT1/lfk/4zD9bV4eyLjN8Id0xX8w==
X-Google-Smtp-Source: ABdhPJxiUKeT463CKXMbKNOTTXvuh8ChtIWwveqT19sIFc5GWW6eJtVKFAP6EJWl77VhTt3QaOUa/DVGqW+rN6PfNI0=
X-Received: by 2002:a50:ef15:: with SMTP id m21mr474435eds.300.1599058704159; 
 Wed, 02 Sep 2020 07:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200823014830.15962-1-chunkuang.hu@kernel.org>
In-Reply-To: <20200823014830.15962-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 2 Sep 2020 22:58:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9ELMBK7zPeeBQ39QjJ9g4PsOhpHXsTBHgcq=kNk8bRxA@mail.gmail.com>
Message-ID: <CAAOTY_9ELMBK7zPeeBQ39QjJ9g4PsOhpHXsTBHgcq=kNk8bRxA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Move Mediatek HDMI PHY driver from DRM folder to
 PHY folder
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
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0OOaciDIz
5pelIOmAseaXpSDkuIrljYg5OjQ45a+r6YGT77yaCj4KPiBtdGtfaGRtaV9waHkgaXMgY3VycmVu
dGx5IHBsYWNlZCBpbnNpZGUgbWVkaWF0ZWsgZHJtIGRyaXZlciwgYnV0IGl0J3MKPiBtb3JlIHN1
aXRhYmxlIHRvIHBsYWNlIGEgcGh5IGRyaXZlciBpbnRvIHBoeSBkcml2ZXIgZm9sZGVyLCBzbyBt
b3ZlCj4gbXRrX2hkbWlfcGh5IGRyaXZlciBpbnRvIHBoeSBkcml2ZXIgZm9sZGVyLgoKRm9yIHRo
aXMgc2VyaWVzLCBhcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXS4KClsxXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGlu
dXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4K
PiBDaGFuZ2VzIGluIHY1Ogo+IC0gRml4dXAgaW5kZW50IGluIEtjb25maWcuCj4gLSBSZWZpbmUg
Y29uZmlnIGhlbHAgbWVzc2FnZS4KPiAtIFJlZmluZSBNYWtlZmlsZS4KPgo+IENoYW5nZXMgaW4g
djQ6Cj4gLSBSZWJhc2Ugb250byA1LjktcmMxCj4gLSBSZW1vdmUgbXRrX2hkbWlfY29uZl9tdDgx
NzMuCj4KPiBDaGFuZ2VzIGluIHYzOgo+IC0gTW9kaWZ5IFtQQVRDSCB2MiAzLzRdIHByZWZpeC4K
Pgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBpbmNsdWRlIG1vZHVsZS5oIGluIG10a19oZG1pLmMKPgo+
IENLIEh1ICgzKToKPiAgIGRybS9tZWRpYXRlazogTW92ZSB0el9kaXNhYmxlZCBmcm9tIG10a19o
ZG1pX3BoeSB0byBtdGtfaGRtaSBkcml2ZXIKPiAgIGRybS9tZWRpYXRlazogU2VwYXJhdGUgbXRr
X2hkbWlfcGh5IHRvIGFuIGluZGVwZW5kZW50IG1vZHVsZQo+ICAgcGh5OiBtZWRpYXRlazogTW92
ZSBtdGtfaGRtaV9waHkgZHJpdmVyIGludG8gZHJpdmVycy9waHkvbWVkaWF0ZWsKPiAgICAgZm9s
ZGVyCj4KPiBDaHVuLUt1YW5nIEh1ICgxKToKPiAgIE1BSU5UQUlORVJTOiBhZGQgZmlsZXMgZm9y
IE1lZGlhdGVrIERSTSBkcml2ZXJzCj4KPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZp
ZyAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZp
bGUgICAgICAgICAgICAgfCAgNSArLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2hkbWkuYyAgICAgICAgICAgfCAyMSArKysrKysrKysrKysrKystLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfaGRtaS5oICAgICAgICAgICB8ICAxIC0KPiAgZHJpdmVycy9waHkv
bWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysrKwo+ICBkcml2ZXJz
L3BoeS9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgNSArKysrKwo+ICAuLi4v
bWVkaWF0ZWsvcGh5LW10ay1oZG1pLW10MjcwMS5jfSAgICAgICAgICAgfCAgMyArLS0KPiAgLi4u
L21lZGlhdGVrL3BoeS1tdGstaGRtaS1tdDgxNzMuY30gICAgICAgICAgIHwgIDIgKy0KPiAgLi4u
L21lZGlhdGVrL3BoeS1tdGstaGRtaS5jfSAgICAgICAgICAgICAgICAgIHwgIDMgKystCj4gIC4u
Li9tZWRpYXRlay9waHktbXRrLWhkbWkuaH0gICAgICAgICAgICAgICAgICB8ICAyIC0tCj4gIDEx
IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+ICByZW5h
bWUgZHJpdmVycy97Z3B1L2RybS9tZWRpYXRlay9tdGtfbXQyNzAxX2hkbWlfcGh5LmMgPT4gcGh5
L21lZGlhdGVrL3BoeS1tdGstaGRtaS1tdDI3MDEuY30gKDk5JSkKPiAgcmVuYW1lIGRyaXZlcnMv
e2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19oZG1pX3BoeS5jID0+IHBoeS9tZWRpYXRlay9w
aHktbXRrLWhkbWktbXQ4MTczLmN9ICg5OSUpCj4gIHJlbmFtZSBkcml2ZXJzL3tncHUvZHJtL21l
ZGlhdGVrL210a19oZG1pX3BoeS5jID0+IHBoeS9tZWRpYXRlay9waHktbXRrLWhkbWkuY30gKDk4
JSkKPiAgcmVuYW1lIGRyaXZlcnMve2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmggPT4g
cGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS5ofSAoOTUlKQo+Cj4gLS0KPiAyLjE3LjEKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
