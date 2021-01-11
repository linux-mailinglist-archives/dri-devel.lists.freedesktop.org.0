Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAB22F232E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 00:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CB1898E1;
	Mon, 11 Jan 2021 23:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92D189829
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 23:50:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CD4222D00
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 23:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610409021;
 bh=7YRMvE845hC7SAVXz/U/NF9WxBp7q4L/HB0jlWcqqVU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Lrzp2zbK7APcbmjCCCv0vJu/ty5To01Fq6cbVVmMwxYiiv2J2JwFrIfphZetDHv3/
 pxoAVneTZnJX7oghB1xRLmSFyup0O/+Jy020Ov3u7psjAxu7mzIl73WpRvmR053r+u
 7csdeeuUyBxtANKtSjtf7hd7TnOL4sXEebmM1Ktk97XAxIoKYZ+0Nf+mHzsTAbiuoR
 GHfHFoP2Y8cj3RMDVwbanwcg1gMxn3AP1SjCVvMFmbyiRjlJOKUB8RScGwfkz9vzWu
 JYQknH1DyE1VTzeYkxdil6aTTgV2dbBra9atRqx+TmSMb5IWImmkMQLLz0UiGbGbKa
 Ovx5cxzbSllpQ==
Received: by mail-ej1-f51.google.com with SMTP id 6so897624ejz.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 15:50:21 -0800 (PST)
X-Gm-Message-State: AOAM531tcgqgTOo2HZkTmz89iYRvtAYxvqky1Yz2M714XfqdezX2Mrvq
 JlKUGRdVJG5Nokwn8AnBsjafRk9XlQ8yhFrdSg==
X-Google-Smtp-Source: ABdhPJxVy9VDMMYfYRVMs9afxI0l5RRiNtKc2yMSb9lG3FiW9P61v7cZ+yR5sHJHLZMW2E0QIlo4LzB1ZzkCSbrrWtg=
X-Received: by 2002:a17:907:2108:: with SMTP id
 qn8mr1236249ejb.127.1610409019978; 
 Mon, 11 Jan 2021 15:50:19 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-7-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-7-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Jan 2021 07:50:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8CaUr-zZXoBsQTXvxeO88WhHm0neg5RuDR1KG6NsaWwA@mail.gmail.com>
Message-ID: <CAAOTY_8CaUr-zZXoBsQTXvxeO88WhHm0neg5RuDR1KG6NsaWwA@mail.gmail.com>
Subject: Re: [PATCH v3, 06/15] drm/mediatek: add component RDMA4
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
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0NOWvq+mBk++8mgo+Cj4gVGhp
cyBwYXRjaCBhZGQgY29tcG9uZW50IFJETUE0CgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5p
dSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwX2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmMKPiBpbmRleCBiYzZiMTBhLi5mYzAxZmVhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gQEAgLTM5Miw2ICszOTIsNyBAQCBzdHJ1Y3QgbXRr
X2RkcF9jb21wX21hdGNoIHsKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX1JETUEwXSAgID0geyBN
VEtfRElTUF9SRE1BLCAgICAgIDAsIE5VTEwgfSwKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX1JE
TUExXSAgID0geyBNVEtfRElTUF9SRE1BLCAgICAgIDEsIE5VTEwgfSwKPiAgICAgICAgIFtERFBf
Q09NUE9ORU5UX1JETUEyXSAgID0geyBNVEtfRElTUF9SRE1BLCAgICAgIDIsIE5VTEwgfSwKPiAr
ICAgICAgIFtERFBfQ09NUE9ORU5UX1JETUE0XSAgID0geyBNVEtfRElTUF9SRE1BLCAgICAgIDQs
IE5VTEwgfSwKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX1VGT0VdICAgID0geyBNVEtfRElTUF9V
Rk9FLCAgICAgIDAsICZkZHBfdWZvZSB9LAo+ICAgICAgICAgW0REUF9DT01QT05FTlRfV0RNQTBd
ICAgPSB7IE1US19ESVNQX1dETUEsICAgICAgMCwgTlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01Q
T05FTlRfV0RNQTFdICAgPSB7IE1US19ESVNQX1dETUEsICAgICAgMSwgTlVMTCB9LAo+IC0tCj4g
MS44LjEuMS5kaXJ0eQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
