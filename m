Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B432D605F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDD36E3BB;
	Thu, 10 Dec 2020 15:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF336E3BB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:50:29 +0000 (UTC)
X-Gm-Message-State: AOAM531W2UVQuxosvVaS4LnXfQ3me5MFmxuPcMki+Jc6da+y81PdXH2Y
 WkDFud/DHDFLXRAK2S9roI1bqdOZbH3iEeikhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607615429;
 bh=JswAsdHWyxMnvC+dTai6TVtWwh9Dj+cpwNchJF8bnPo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=u4vlNxk5gZO0CNj3V9ovmXkU8Ld269fUM1zfcIXmVogxFNzaTn9yG8x2ztsLM4Ur/
 nX/gR+bkNweRpLwlcut21M19lVWWwrfkh1vGwtO2bKy/3JiUpCjly809+gbZObR/i6
 bdvDXyP0hgjzNMFuoM00bgq01lVMolh2pfLtrFRer6SHq7pe+7GGnXwp5n+UgjfHT7
 RNgu4aVuPlOt+dY4LDm9YpFmOO00MANM3AtkfXeX8FuQXiTBsWsjjBp0JylYmQ5Xz/
 iZ79sr3Lm6Cjo2aNOk9vPt9jtNfUgpFyqotyViLCrK+WWr2x+sLy4vwOdWido36iUy
 sQPjnfa0mc9jQ==
X-Google-Smtp-Source: ABdhPJwtcxVDc6Q2bu5uvq6r1O0IW7GMG0SyjPcCWYbsaNRsfJcxcmQwSG/LXBiPJ0zdfQUzcOkO6cQLrj6rQ7eo7AI=
X-Received: by 2002:a05:6402:845:: with SMTP id
 b5mr7518636edz.38.1607615427120; 
 Thu, 10 Dec 2020 07:50:27 -0800 (PST)
MIME-Version: 1.0
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 10 Dec 2020 23:50:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-aYFz1Xg6r2ur+BF_k_35F3qNLLb16_2c0MaMsYre-+w@mail.gmail.com>
Message-ID: <CAAOTY_-aYFz1Xg6r2ur+BF_k_35F3qNLLb16_2c0MaMsYre-+w@mail.gmail.com>
Subject: Re: [PATCH v8, 5/6] drm/mediatek: add RDMA fifo size error handle
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
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTDml6Ug6YCx5ZubIOS4i+WNiDU6MDjlr6vpgZPvvJoKPgo+IFRo
aXMgcGF0Y2ggYWRkIFJETUEgZmlmbyBzaXplIGVycm9yIGhhbmRsZQo+IHJkbWEgZmlmbyBzaXpl
IHdpbGwgbm90IGFsd2F5cyBiaWdnZXIgdGhhbiB0aGUgY2FsY3VsYXRlZCB0aHJlc2hvbGQKPiBp
ZiB0aGF0IGNhc2UgaGFwcGVuZWQsIHdlIG5lZWQgc2V0IGZpZm8gc2l6ZSBhcyB0aGUgdGhyZXNo
b2xkCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlh
dGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEu
YyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMKPiBpbmRleCA3OTRhY2M1Li4wNTA4Mzky
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jCj4gQEAgLTE1
MSw2ICsxNTEsMTAgQEAgc3RhdGljIHZvaWQgbXRrX3JkbWFfY29uZmlnKHN0cnVjdCBtdGtfZGRw
X2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludCB3aWR0aCwKPiAgICAgICAgICAqIGFjY291bnQgZm9y
IGJsYW5raW5nLCBhbmQgd2l0aCBhIHBpeGVsIGRlcHRoIG9mIDQgYnl0ZXM6Cj4gICAgICAgICAg
Ki8KPiAgICAgICAgIHRocmVzaG9sZCA9IHdpZHRoICogaGVpZ2h0ICogdnJlZnJlc2ggKiA0ICog
NyAvIDEwMDAwMDA7Cj4gKwo+ICsgICAgICAgaWYgKHRocmVzaG9sZCA+IHJkbWFfZmlmb19zaXpl
KQo+ICsgICAgICAgICAgICAgICB0aHJlc2hvbGQgPSByZG1hX2ZpZm9fc2l6ZTsKCklmIHRoZSBm
b3JtdWxhIGlzIG5vdCBjb3JyZWN0LCB5b3Ugc2hvdWxkIGZpeCB0aGUgZm9ybXVsYSBub3Qgd29y
ayBhcm91bmQuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiArCj4gICAgICAgICByZWcgPSBSRE1B
X0ZJRk9fVU5ERVJGTE9XX0VOIHwKPiAgICAgICAgICAgICAgIFJETUFfRklGT19QU0VVRE9fU0la
RShyZG1hX2ZpZm9fc2l6ZSkgfAo+ICAgICAgICAgICAgICAgUkRNQV9PVVRQVVRfVkFMSURfRklG
T19USFJFU0hPTEQodGhyZXNob2xkKTsKPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
