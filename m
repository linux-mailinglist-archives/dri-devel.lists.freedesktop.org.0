Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4DF2F234A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 01:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A9F89A94;
	Tue, 12 Jan 2021 00:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50D889A94
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:20:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3947022D49
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610410815;
 bh=xT8MvbQsR9UkUaNVPWZFZYrUWOAO1atkSNUZ7hy/oTU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k1mKag3BxKHQJoteEtTEmVGkvD8AhrOyiTgPgLjTrz57CUyTRdPGTFR2jGUHQX0K6
 WsTW+D7pYGJtqOr2P4n/A8inTPTMAWhCqJ7+ZLw4W0YZB+UOy5FaQ9pjVmCjR04qnh
 xC6y77yqF6rJSkmtlwDVsXDm4vtyfrtn7VsM+imLOR+DuxY79Uvuf0Ao+CeOtHdOBn
 gHhxB9//foZE6SGE3358Ful55ukzurLpQUHJE/I50bwp390OxuJY8b9UEYcjNdp3mk
 IadFFRXn89NR+zn0UrT8+kBhbYsXKzmPj4KrI1dmDTsZEtZ9Tmd7lgI72N5kT1KbQZ
 cgJ7wQYzBDw/g==
Received: by mail-ed1-f48.google.com with SMTP id h16so373778edt.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:20:15 -0800 (PST)
X-Gm-Message-State: AOAM532uEQ/8Zr8IawrlDa5m6/ID2dvAqhlTSyTUS9YQg+tW9jVesb8U
 2GXHUfASINGNXiD4HeJNyavZpyZ0/awnjCN6Jw==
X-Google-Smtp-Source: ABdhPJw95ZpXKnHgH0CIhq3w3Khy4bp6U8XIOVwTypB2JtA2ezUS774iekd3YAxIwUn1uaUwcoFQCOFiB0igSVjur0Y=
X-Received: by 2002:a50:c3c5:: with SMTP id i5mr1348359edf.166.1610410813706; 
 Mon, 11 Jan 2021 16:20:13 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-9-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-9-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Jan 2021 08:20:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY__+DzbaAi=YUsx0_Sbq9rYzddCgiBvDMQyHgKSOiRvpjA@mail.gmail.com>
Message-ID: <CAAOTY__+DzbaAi=YUsx0_Sbq9rYzddCgiBvDMQyHgKSOiRvpjA@mail.gmail.com>
Subject: Re: [PATCH v3, 08/15] drm/mediatek: check if fb is null
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
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0OOWvq+mBk++8mgo+Cj4gSXQn
cyBwb3NzaWJsZSB0aGF0IHN0YXRlLT5iYXNlLmZiIGlzIG51bGwuIEFkZCBhIGNoZWNrIGJlZm9y
ZSBhY2Nlc3MgaXRzCj4gZm9ybWF0LgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0s
IHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBGaXhlczogYjZiMWJiOTgwZWM0ICggZHJtL21lZGlhdGVr
OiBUdXJuIG9mZiBBbHBoYSBiaXQgd2hlbiBwbGFuZSBmb3JtYXQgaGFzIG5vIGFscGhhKQo+IFNp
Z25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYwo+IGluZGV4IDQ5MzRiZWUuLjhlN2Y0OTQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gQEAgLTI3OSw3
ICsyNzksNyBAQCBzdGF0aWMgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QgbXRrX2Rk
cF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgaWR4LAo+ICAgICAgICAgfQo+Cj4gICAgICAgICBj
b24gPSBvdmxfZm10X2NvbnZlcnQob3ZsLCBmbXQpOwo+IC0gICAgICAgaWYgKHN0YXRlLT5iYXNl
LmZiLT5mb3JtYXQtPmhhc19hbHBoYSkKPiArICAgICAgIGlmIChzdGF0ZS0+YmFzZS5mYiAmJiBz
dGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpCj4gICAgICAgICAgICAgICAgIGNvbiB8
PSBPVkxfQ09OX0FFTiB8IE9WTF9DT05fQUxQSEE7Cj4KPiAgICAgICAgIGlmIChwZW5kaW5nLT5y
b3RhdGlvbiAmIERSTV9NT0RFX1JFRkxFQ1RfWSkgewo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
