Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36B2E71C8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 16:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AFB89131;
	Tue, 29 Dec 2020 15:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470FB89131
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 15:24:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5B6A22227
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 15:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609255490;
 bh=eilapBpeoN7sFfsn0ggyc6cG1SRv9g+vbu+jGX2ZpLA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZuE4S5P8hITqz1X0escxosAV3o1TcBsgoMQeesxCNTHHQe/plvD7FZCCTDiLIcLPE
 M7e05HXO+CUT6e9Zff8a3+X20r4zbjxf9KiwqenvAwvk33wV6ALdsIms9sLlVdGmXk
 wKIm59mqBicAYE6HeMrLt25t6akFJyCSSC/9/5braxafr3QejL9ZRxfkyeAbczYOEm
 qKKy5AYZLr0MtZmYvZwxrDuOBZTHMj7lnCAcxD9+/QrnlhHgcwBxC4DKfk/WnxUnBy
 L4k732YoW7feYNMHf8FXVjHhUD05rVVwtC5tpm68hyzs1KiJc4wX/zoZe+E40WpW/k
 syBd7vI0wl4Pg==
Received: by mail-wr1-f53.google.com with SMTP id y17so14928650wrr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 07:24:49 -0800 (PST)
X-Gm-Message-State: AOAM531LuAtvCHPsh4svEsKUeJRs8ulxp1Bjpo3/kKQY4V1gglsNL9S8
 RED4GIvkXFPgHI+wm22ShXhZkm86vNm5raMFjA==
X-Google-Smtp-Source: ABdhPJwfw4rYEsYu8nEniPGc6G6JHID1nl4QlJyDYtZF/WHawvurk6lDHUtip9QnXX+NOG2EV9QTm0HD335QYsb/xq8=
X-Received: by 2002:adf:e60f:: with SMTP id p15mr55674939wrm.60.1609255488542; 
 Tue, 29 Dec 2020 07:24:48 -0800 (PST)
MIME-Version: 1.0
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-7-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609144630-14721-7-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Dec 2020 23:24:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9ZL9FEMKT_3xARh51hxK6_AbYJHci9ENXDwzCwNGo8Fg@mail.gmail.com>
Message-ID: <CAAOTY_9ZL9FEMKT_3xARh51hxK6_AbYJHci9ENXDwzCwNGo8Fg@mail.gmail.com>
Subject: Re: [PATCH v3, 6/8] soc: mediatek: mmsys: add component RDMA4
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMjjml6Ug6YCx5LiAIOS4i+WNiDQ6Mzflr6vpgZPvvJoKPgo+IFRo
aXMgcGF0Y2ggYWRkIGNvbXBvbmVudCBSRE1BNAoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUg
PGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBO
aXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L3Nv
Yy9tZWRpYXRlay9tdGstbW1zeXMuaCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1z
eXMuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4gaW5kZXggMDll
ZTQyNC4uYWE0ZjYwZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9t
dGstbW1zeXMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5o
Cj4gQEAgLTM4LDYgKzM4LDcgQEAgZW51bSBtdGtfZGRwX2NvbXBfaWQgewo+ICAgICAgICAgRERQ
X0NPTVBPTkVOVF9SRE1BMCwKPiAgICAgICAgIEREUF9DT01QT05FTlRfUkRNQTEsCj4gICAgICAg
ICBERFBfQ09NUE9ORU5UX1JETUEyLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9SRE1BNCwKPiAg
ICAgICAgIEREUF9DT01QT05FTlRfVUZPRSwKPiAgICAgICAgIEREUF9DT01QT05FTlRfV0RNQTAs
Cj4gICAgICAgICBERFBfQ09NUE9ORU5UX1dETUExLAo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
