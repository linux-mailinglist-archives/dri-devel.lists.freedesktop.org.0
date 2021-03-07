Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CF832FE36
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 01:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC0A6E0A8;
	Sun,  7 Mar 2021 00:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4746E0A8
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 00:30:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 341DF650D0
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 00:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615077025;
 bh=uJwXubSaOLTt7He4mvFNkPoPWLDyc08NNbEFTffP5l0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j4MbRNNUmEswJ2GkrZPTMQ6/C/vz7TUhGrgd2hQkHC16WNbiHBqF4EieYFrMdwQK6
 R3BK+U2hz0I9Bux1sOMv/s0TdCl6tpozUKhjwwzcRHGZYs/vJ1IHB9a7C4fVvMab2+
 yQNHSvkbhsn91uRi4LStWTdXjnR4E1NSH8RdRXlo5Ey7kFY8eBfJr+CGiVvGuPkiPy
 5eksEqvOcmuBSZGPc1ZkBLqGdAxuNhNG8EX1U+l/aRW0BZ8S27FRYxbLZeqrLU9wIY
 6+sKjBha8ADITStjwB0GyfZ0yOp9vpaGKzJmGvS0IHfIr7k+01DeRK0E/7uk6IHaYv
 JeI5ItiHK8p3A==
Received: by mail-ej1-f43.google.com with SMTP id lr13so12384305ejb.8
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Mar 2021 16:30:25 -0800 (PST)
X-Gm-Message-State: AOAM533sl4JXIpg0A3ohduezBn8zhxuDNTs1LEEnViBfAMKnQR8caC+f
 azusYCuXdjoDa2q5aHp8fvQDxwppBUA/96fWIA==
X-Google-Smtp-Source: ABdhPJzkevcLiDsincX3P/xDWHQn213RalKdvB/BL2ujct31lwjYiYLZ5AyLmSo+zrQMgDe32l0l5PXBMIfb1+LDPRE=
X-Received: by 2002:a17:906:400b:: with SMTP id
 v11mr8684303ejj.194.1615077023864; 
 Sat, 06 Mar 2021 16:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20210201033603.12616-1-jitao.shi@mediatek.com>
 <20210201033603.12616-3-jitao.shi@mediatek.com>
In-Reply-To: <20210201033603.12616-3-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 7 Mar 2021 08:30:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8cvuEx49SseiCDcVTdZbT6JMFKUH7t6tvaGoHy7T4dEg@mail.gmail.com>
Message-ID: <CAAOTY_8cvuEx49SseiCDcVTdZbT6JMFKUH7t6tvaGoHy7T4dEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/mediatek: dsi: fine tune the line time cause
 by EOTp
To: Jitao Shi <jitao.shi@mediatek.com>
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
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDLmnIgx5pelIOmAseS4gCDkuIrljYgxMTozNuWvq+mBk++8mgo+Cj4gRW5hYmxpbmcgRW9UcCB3
aWxsIG1ha2UgdGhlIGxpbmUgdGltZSBsYXJnZXIsIHNvIHRoZSBoZnAgYW5kCj4gaGJwIHNob3Vs
ZCBiZSByZWR1Y2VkIHRvIGtlZXAgbGluZSB0aW1lLgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0t
bmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0t
bmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkg
PGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCAyYmM0NmYyMzUwZjEuLjhjNzBlYzM5
YmZlMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC00ODEsNiArNDgx
LDcgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9jb25maWdfdmRvX3RpbWluZyhzdHJ1Y3QgbXRrX2Rz
aSAqZHNpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgdGltaW5nLT5kYV9oc196ZXJvICsg
dGltaW5nLT5kYV9oc19leGl0ICsgMzsKPgo+ICAgICAgICAgZGVsdGEgPSBkc2ktPm1vZGVfZmxh
Z3MgJiBNSVBJX0RTSV9NT0RFX1ZJREVPX0JVUlNUID8gMTggOiAxMjsKPiArICAgICAgIGRlbHRh
ICs9IGRzaS0+bW9kZV9mbGFncyAmIE1JUElfRFNJX01PREVfRU9UX1BBQ0tFVCA/IDIgOiAwOwo+
Cj4gICAgICAgICBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSA9IHZtLT5oZnJvbnRfcG9yY2gg
KiBkc2lfdG1wX2J1Zl9icHA7Cj4gICAgICAgICBob3Jpem9udGFsX2Zyb250X2JhY2tfYnl0ZSA9
IGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlICsgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZTsK
PiAtLQo+IDIuMTIuNQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
