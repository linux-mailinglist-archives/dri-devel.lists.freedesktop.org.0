Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD441B332B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 01:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DFC6E042;
	Tue, 21 Apr 2020 23:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16066E042
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 23:31:34 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92F4320735
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 23:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587511894;
 bh=RPY9/TAPtMpNAGRQZw/dlkxmaqPwTqvSl3q13yOk+XI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2s72HPDDsl1QTP+FODWwiPUTuk0v4TPC/n61PVeE9RDv3L6UJIXLNfatjGwILnpao
 g7LNzo9wa6PB/uzg/ll2Epz+WWwNIrR1NrbZxUbfD+1YT6mbuMvcavfEhXqFHSS+Fk
 66OH7EL2qAF1SeLI0P8nudCKobke3dP858Nw2I+w=
Received: by mail-ed1-f42.google.com with SMTP id k22so139007eds.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 16:31:34 -0700 (PDT)
X-Gm-Message-State: AGi0PuaqXA+xBeb4ZiRbfAzrR5cpYI5x9u2UbEiL3mB4FXgG/yl7ZXFV
 0zSTGOY3+pXaCX23CcAgeFf5tjAf2PGnPKpGGQ==
X-Google-Smtp-Source: APiQypJo9yp2SonxjWMw73VqqdawuFNXOhrZk2P9FYz3xedbgGtLGvC53P/2on6r1rrbXobjcKm43t2LLpC5Lt5jrNE=
X-Received: by 2002:a05:6402:1587:: with SMTP id
 c7mr20059512edv.61.1587511893020; 
 Tue, 21 Apr 2020 16:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200411074408.38090-1-jitao.shi@mediatek.com>
In-Reply-To: <20200411074408.38090-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 22 Apr 2020 07:31:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-78CsRocevQK-h-CsBZTTDpYCtpuswcL0MkNyhVvAADg@mail.gmail.com>
Message-ID: <CAAOTY_-78CsRocevQK-h-CsBZTTDpYCtpuswcL0MkNyhVvAADg@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Config mipi tx current and impedance
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
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

SGksIEppdGFvOgoKRm9yIHRoaXMgc2VyaWVzLCBhcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0
IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0
CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDTmnIgxMeaXpSDpgLHlha0g5LiL5Y2IMzo0NOWvq+mBk++8mgo+Cj4gQ2hh
bmdlcyBzaW5jZSB2NToKPiAgLSByZW1vdmUgbWVtc2V0KCkKPiAgLSBhZGQgcmV0dXJuIHRvIHJl
bW92ZSAiZWxzZSIKPgo+IENoYW5nZXMgc2luY2UgdjQ6Cj4gIC0gYWRkIFJldmlld2VkLWJ5Ogo+
ICAtIG1vdmUgdGhlIGdldCB0aGUgY2FsaWJyYXRpb24gZGF0YSBjb2RlIHRvIHByb2JlLgo+Cj4g
Q2hhbmdlcyBzaW5jZSB2MzoKPiAgLSByZWZpbmUgZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgYXMg
ZnJvbSAzMDAwIHRvIDYwMDAuCj4KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ICAtIGZpeCB0aGUgdGl0
bGUgb2YgY29tbWl0IG1lc3NhZ2UuCj4gIC0gcmVuYW1lIG1pcGl0eC1jdXJyZW50LWRyaXZlIHRv
IGRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wCj4KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICAtIGZpeCBj
b2Rpbmcgc3R5bGUuCj4gIC0gY2hhbmdlIG10a19taXBpX3R4X2NvbmZpZ19jYWxpYnJhdGlvbl9k
YXRhKCkgdG8gdm9pZAo+Cj4gSml0YW8gU2hpICg0KToKPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5
OiBtZWRpYXRlazogYWRkIHByb3BlcnR5IHRvIGNvbnRyb2wgbWlwaSB0eCBkcml2ZQo+ICAgICBj
dXJyZW50Cj4gICBkdC1iaW5kaW5nczogZGlzcGxheTogbWVkaWF0ZWs6IGdldCBtaXBpdHggY2Fs
aWJyYXRpb24gZGF0YSBmcm9tIG52bWVtCj4gICBkcm0vbWVkaWF0ZWs6IGFkZCB0aGUgbWlwaXR4
IGRyaXZpbmcgY29udHJvbAo+ICAgZHJtL21lZGlhdGVrOiBjb25maWcgbWlwaXR4IGltcGVkYW5j
ZSB3aXRoIGNhbGlicmF0aW9uIGRhdGEKPgo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkc2kudHh0ICAgICAgICAgfCAxMCArKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfbWlwaV90eC5jICAgICAgICB8IDU0ICsrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmggICAgICAgIHwgIDQgKysKPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5jIHwgMjggKysrKysrKysrKwo+ICA0
IGZpbGVzIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKykKPgo+IC0tCj4gMi4yMS4wCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
