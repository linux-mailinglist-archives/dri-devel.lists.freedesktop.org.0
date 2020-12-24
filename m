Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6032E27AE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Dec 2020 15:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1A989A67;
	Thu, 24 Dec 2020 14:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906A889A67
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 14:28:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FF2E224DF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 14:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608820129;
 bh=avuCDzNbHj2dpF1wMtlr+eCWDnDVKL9dKK9/kgnxfs4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ENCPJqaoTtx/w/gjRxswEHbm+8HVvkn/o6ithsijzpCIyPfZxK6j1NMT5Bqr0GEGI
 nJVwGA+Av6dt/xpjmGqyZ0IerOW/S1adE0iqYlvt0jFYaEoV/sc4DI1VKJR/6/4Uu+
 lNaBlogIq22j485Mm06pp3JZi3HVh0MxQ3EkbAUlgpSVgK7mBmF0L/hsLNbRCJnGRJ
 +J437zPckoQBf8YfDHgLzoGb+sQdGWxdfEDRl4E9vbSvHVONERHw+PCh/jPLTvwvNJ
 c4QetSUTVX0uPyqGtPdArOXyrscuH+NmJzl8L4QcKU299UfhUOUzMDaZU0rZGoTxYm
 XdnBTAc/QCFJQ==
Received: by mail-ej1-f52.google.com with SMTP id ce23so3523311ejb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 06:28:49 -0800 (PST)
X-Gm-Message-State: AOAM533sQP1O9elTVcJm6NamRAr7P29KZF/uIzEIxZAMB4WFDZnN1efn
 2pE9nE54T4byMSmeoZrB8Esah6d1omteGh19bw==
X-Google-Smtp-Source: ABdhPJz4FZaQVqFZ83WxFt3Fe2+BmFRA28vGU8ERYHuq8sPphR3iLihx8v6LeP10GlrFZUcP3U+83p989lbPDy9D1OQ=
X-Received: by 2002:a17:907:9627:: with SMTP id
 gb39mr28660682ejc.267.1608820128218; 
 Thu, 24 Dec 2020 06:28:48 -0800 (PST)
MIME-Version: 1.0
References: <1608770889-9403-1-git-send-email-yongqiang.niu@mediatek.com>
 <1608770889-9403-4-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1608770889-9403-4-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 24 Dec 2020 22:28:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9e9qadeO9k7zQnvSLZAAJFxjWwYSBz-XXEUUh16jsptA@mail.gmail.com>
Message-ID: <CAAOTY_9e9qadeO9k7zQnvSLZAAJFxjWwYSBz-XXEUUh16jsptA@mail.gmail.com>
Subject: Re: [PATCH v2, 3/3] mailbox: cmdq: add mt8192 support
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
PiDmlrwgMjAyMOW5tDEy5pyIMjTml6Ug6YCx5ZubIOS4iuWNiDg6NTXlr6vpgZPvvJoKPgo+IGFk
ZCBtdDgxOTIgc3VwcG9ydAo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWFpbGJveC9tdGstY21kcS1t
YWlsYm94LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyBiL2RyaXZlcnMvbWFp
bGJveC9tdGstY21kcS1tYWlsYm94LmMKPiBpbmRleCA3NTM3OGUzLi43ZjI0M2UxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMKPiArKysgYi9kcml2ZXJz
L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jCj4gQEAgLTYwNyw2ICs2MDcsNyBAQCBzdGF0aWMg
aW50IGNtZHFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIHsu
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZ2NlIiwgLmRhdGEgPSAodm9pZCAqKSZnY2Vf
cGxhdF92Mn0sCj4gICAgICAgICB7LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWdjZSIs
IC5kYXRhID0gKHZvaWQgKikmZ2NlX3BsYXRfdjN9LAo+ICAgICAgICAgey5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10Njc3OS1nY2UiLCAuZGF0YSA9ICh2b2lkICopJmdjZV9wbGF0X3Y0fSwKPiAr
ICAgICAgIHsuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItZ2NlIiwgLmRhdGEgPSAodm9p
ZCAqKSZnY2VfcGxhdF92NH0sCgpJbiB0aGUgdmlldyBvZiBoYXJkd2FyZSBmdW5jdGlvbiwgaXMg
bXQ4MTkyLWdjZSBpZGVudGljYWwgdG8KbXQ2Nzc5LWdjZT8gSWYgdGhlc2UgdHdvIGFyZSBpZGVu
dGljYWwsIHlvdSBuZWVkIG5vdCB0byBtb2RpZnkgZHJpdmVyLAphbmQgdGhlIGNvbXBhdGlibGUg
c2hvdWxkIGJlCgpjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1nY2UiLCAibWVkaWF0ZWss
bXQ2Nzc5LWdjZSI7CgpJZiB0aGV5IGFyZSBub3QgaWRlbnRpY2FsLCB3aGF0J3MgdGhlIGRpZmZl
cmVudD8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICAgICAgICAge30KPiAgfTsKPgo+IC0tCj4g
MS44LjEuMS5kaXJ0eQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
