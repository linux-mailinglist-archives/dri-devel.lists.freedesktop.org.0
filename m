Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2AE28BBBA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 17:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DD06E51A;
	Mon, 12 Oct 2020 15:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C908A6E51A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 15:22:35 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 913F0208D5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602516154;
 bh=5C/jmTpz0PKuGny4/s3SbSc4Irgi9NI62ZqH3ELIX7s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aLX8Vr/+ckwRva0GmI4m4s/4wxSqmx0xqfMUrdDEM+fCprnL6NTcrZ+naQvF0e4eY
 zWkWUxdyTPmg/GLZ1qz0vTlhsD42q25Wl9SQ1DQi3GpB3+NEg6BXYn4jkrbiLaDa5g
 wOpkbxvdAoMzjsEH/3QEXKZ8zv++QgW2Lt0sPrOg=
Received: by mail-ed1-f49.google.com with SMTP id g4so17424072edk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 08:22:34 -0700 (PDT)
X-Gm-Message-State: AOAM5314N8XlqadOfLgt3HYAJWHdOdQcnl6xBBezNwm4/gttI89aRZy8
 Y5u2iFOvmUXWDvrnJbwazt8980WArtuoHHcoGw==
X-Google-Smtp-Source: ABdhPJwu3cOwmieaIPSGaFSoyA4Wc/3ksuAi+VNzjSghjBXRfe60ms0JWtONwlY6z7lgezHab9z1uAotOlywDThS1cE=
X-Received: by 2002:a05:6402:1cbb:: with SMTP id
 cz27mr14412016edb.38.1602516153075; 
 Mon, 12 Oct 2020 08:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201010070910.11294-1-jitao.shi@mediatek.com>
In-Reply-To: <20201010070910.11294-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 12 Oct 2020 23:22:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-qZni-o11HJeymH74PAFSJw-0Awdz0wdjiQ0u7Ga1MGA@mail.gmail.com>
Message-ID: <CAAOTY_-qZni-o11HJeymH74PAFSJw-0Awdz0wdjiQ0u7Ga1MGA@mail.gmail.com>
Subject: Re: [v4 PATCH 0/2] fix scrolling of panel with small hfp or hbp
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

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDEw5pyIMTDml6Ug6YCx5YWtIOS4i+WNiDM6MDnlr6vpgZPvvJoKPgo+IENoYW5nZXMgc2luY2Ug
djM6Cj4gIC0gUmV2ZXJ0IHYyLCBmb3IgdjIgd2lsbCBjYXVzZSBzb21lIGJyaWRnZSBpYyBubyBv
dXRwdXQuIHRoZSBjYXVzZQo+ICAgIHRoZSB2aWRlbyBsaW5ldGltZSBkb2Vzbid0IG1hdGNoIGRp
c3BsYXkgbW9kZSBmcm9tIGdldCBtb2RlLgo+ICAtIE1ha2Ugc3VyZSB0aGUgaG9yaXpvbnRhbF9m
cm9udHBvcmNoX2J5dGUgYW5kIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUKPiAgICBhcmUgPiAw
LgoKQmVjYXVzZSB2MiBpcyBtZXJnZWQgaW50byBtYWlubGluZSwgSSB0aGluayB5b3Ugc2hvdWxk
IG1lcmdlIDEvMiBhbmQKMi8yIHRvIG9uZSBwYXRjaCB3aGljaCBmaXggdGhlIHByb2JsZW0gY2F1
c2VkIGJ5IHYyLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBKaXRhbyBTaGkgKDIpOgo+ICAg
UmV2ZXJ0ICJkcm0vbWVkaWF0ZWs6IGRzaTogRml4IHNjcm9sbGluZyBvZiBwYW5lbCB3aXRoIHNt
YWxsIGhmcCBvcgo+ICAgICBoYnAiCj4gICBkcm0vbWVkaWF0ZWs6IGRzaTogZml4IHNjcm9sbGlu
ZyBvZiBwYW5lbCB3aXRoIHNtYWxsIGhmcCBvciBoYnAKPgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RzaS5jIHwgNjUgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQo+
Cj4gLS0KPiAyLjEyLjUKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
