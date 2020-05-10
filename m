Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD151CC5F6
	for <lists+dri-devel@lfdr.de>; Sun, 10 May 2020 03:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269936E3DB;
	Sun, 10 May 2020 01:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13B56E3DB
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 01:24:39 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B26920A8B
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 01:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589073879;
 bh=VDbINtk/hHh41cZphTvVQ8Ky+q+Za8dszq3rcDCuDgg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2s5RwkcCgY+7iBY9+BSxiC+PdZ3wCBfzORu1ikUu7+4VooqNCZ3Tp2S4MfpDzYqxD
 /Aiv27Fw5wwj6oC2C5Q0YbYIiWsI04Mf0rUOHlM+gZOIGafmPPxIGvmo/ldBlY9SzS
 bmWdTDX7rnr0Tn4kc9+cT7MdRhvcIb9g4jkIxy7M=
Received: by mail-ej1-f50.google.com with SMTP id q8so4799912eja.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 May 2020 18:24:39 -0700 (PDT)
X-Gm-Message-State: AGi0PuY6VzAo9IXn8fYoIAUrq4vuQ8dT1L1Jw31Ey1nU4DEWIe7opfQ2
 KUCtBNwF/tGBIkIJrYS4y2I8NBjqYatyoX68Sw==
X-Google-Smtp-Source: APiQypJQq9WhDnA9jUZbUiITcFvF3ELgL4vCwkLG+ADbvWTfS2qBr5SHAnlXV3hHEHN/KVbA4TLWtj15E1RhlIcsNFA=
X-Received: by 2002:a17:906:7717:: with SMTP id
 q23mr7983742ejm.38.1589073877528; 
 Sat, 09 May 2020 18:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200504141408.60877-1-enric.balletbo@collabora.com>
In-Reply-To: <20200504141408.60877-1-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 10 May 2020 09:24:26 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8vMG1k86V+qBhs0YH5QHELmgtJ0PNOAzWTHoTy2j=R2Q@mail.gmail.com>
Message-ID: <CAAOTY_8vMG1k86V+qBhs0YH5QHELmgtJ0PNOAzWTHoTy2j=R2Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] Convert mtk-dpi to drm_bridge API
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
 Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ15pyINOaXpSDpgLHkuIAg5LiL5Y2IMTA6MTTlr6vpgZPvvJoK
Pgo+IFRoZSBtdGstZHBpIGRyaXZlciBzdGlsbCB1c2VzIHRoZSBkcm1fZW5jb2RlciBBUEkgd2hp
Y2ggaXMgbm93IHNvbWVob3cKPiBkZXByZWNhdGVkLiBXZSBzdGFydGVkIHRvIG1vdmUgYWxsIHRo
ZSBNZWRpYXRlayBkcml2ZXJzIHRvIHRoZSBkcm1fYnJpZGdlIEFQSSwKPiBsaWtlIHdlIGRpZCBm
b3IgdGhlIG10ay1kc2kgZHJpdmVyIFsxXSwgdGhpcyBpcyBhbm90aGVyIHNtYWxsIHN0ZXAgdG8g
YmUgYWJsZSB0bwo+IGZ1bGx5IGNvbnZlcnQgdGhlIERSTSBNZWRpYXRlayBkcml2ZXJzIHRvIHRo
ZSBkcm1fYnJpZGdlIEFQSS4gQSBkdW1teQo+IGRybV9lbmNvZGVyIGlzIG1haW50YWluZWQgaW4g
dGhlIG10ay1kcGkgZHJpdmVyIGJ1dCB0aGUgZW5kIGdvYWwgaXMgbW92ZSBhbGwgdGhlCj4gZHVt
bXkgZHJtX2VuY29kZXIgKG10ay1kc2ksIG10ay1kcGksIGV0YykgdG8gdGhlIG1haW4gbXRrX2Ry
bV9kcnYgZHJpdmVyLgoKRm9yIHRoaXMgc2VyaWVzLCBhcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1u
ZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1u
ZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IEJlc3QgcmVnYXJkcywKPiAgRW5yaWMKPgo+
IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcHJvamVjdC9sa21sL2xpc3Qv
P3Nlcmllcz00NDE1NTkKPgo+IEVucmljIEJhbGxldGJvIGkgU2VycmEgKDMpOgo+ICAgZHJtL21l
ZGlhdGVrOiBtdGtfZHBpOiBSZW5hbWUgYnJpZGdlIHRvIG5leHRfYnJpZGdlCj4gICBkcm0vbWVk
aWF0ZWs6IG10a19kcGk6IENvbnZlcnQgdG8gYnJpZGdlIGRyaXZlcgo+ICAgZHJtL21lZGlhdGVr
OiBtdGtfZHBpOiBVc2Ugc2ltcGxlIGVuY29kZXIKPgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RwaS5jIHwgODQgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi4y
Ni4yCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
