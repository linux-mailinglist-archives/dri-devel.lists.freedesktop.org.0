Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC5E2F6E31
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 23:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178186E045;
	Thu, 14 Jan 2021 22:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155D56E045
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 22:29:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3F7223A7C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 22:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610663378;
 bh=hfhWqcDtTP7IYqbullRyMrTJ4FwI6nFHntuaG+R5yWM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FHpNKtw/tUvzI7bPgkJsDyeuR3eL0aD6jZN+X7Gjn7lvnN22N6TP35oKv9rZYX6iX
 4lx2e8hXwnhSEtgOmi+LRj0omTE8Te5twsNjEMvTS+WTPqxxbM/GMl+1A1c4JhUxJK
 xnb4ZYVndERrSFaAPmTatWz2MYKRnafcelc72dCox0YCvqMb45Df2AUfK09lJbOAzz
 yv04Fx9LAabwNWij47SZ2t6vQHlLEBhaNLc15m8sJFjl87hJ36vetsj6QA0SUYpFCw
 WopBKEAasQ2L15xLlVGrlQIegFFQBNNvG2fu9cZdrY1zgYL9fackb8bOmob4AmPfcd
 g0EAXAnuPIBUg==
Received: by mail-ej1-f50.google.com with SMTP id hs11so8227409ejc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 14:29:38 -0800 (PST)
X-Gm-Message-State: AOAM532HoSAgKMANrbxm9P/SWLjisH1BbLpirpKC6D6ip9ziw9rhSCYi
 u9dqglmFvX4LKjoIkoYM0pK2YcaLBve9WxrxLg==
X-Google-Smtp-Source: ABdhPJxHUpNkN+T/hx5/nLUs2NhEXsLPGFPYkhav/uwL0W2GV8AyJyfJEsMZKL7rtqY1deaxIhopqVVyoecIA3WaRgE=
X-Received: by 2002:a17:906:3753:: with SMTP id
 e19mr6800550ejc.267.1610663377179; 
 Thu, 14 Jan 2021 14:29:37 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-2-git-send-email-yongqiang.niu@mediatek.com>
 <20210114191122.GA3394181@robh.at.kernel.org>
In-Reply-To: <20210114191122.GA3394181@robh.at.kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 15 Jan 2021 06:29:26 +0800
X-Gmail-Original-Message-ID: <CAAOTY_96hj0SGzSJCzGU7Z0DOFoituLpVOP_UW05E21Pt9QjfA@mail.gmail.com>
Message-ID: <CAAOTY_96hj0SGzSJCzGU7Z0DOFoituLpVOP_UW05E21Pt9QjfA@mail.gmail.com>
Subject: Re: [PATCH v3,
 01/15] dt-bindings: mediatek: add description for postmask
To: Rob Herring <robh@kernel.org>
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
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQx5pyIMTXml6Ug6YCx5LqU
IOS4iuWNiDM6MTHlr6vpgZPvvJoKPgo+IE9uIE1vbiwgMTEgSmFuIDIwMjEgMTU6NDM6MzcgKzA4
MDAsIFlvbmdxaWFuZyBOaXUgd3JvdGU6Cj4gPiBhZGQgZGVzY3JpcHRpb24gZm9yIHBvc3RtYXNr
Cj4gPiBwb3N0bWFzayBpcyB1c2VkIGNvbnRyb2wgcm91bmQgY29ybmVyIGZvciBkaXNwbGF5IGZy
YW1lCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCB8IDEgKwo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPgo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4K
ClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVu
a3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
