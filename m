Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D800135E9C2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 01:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15466E40D;
	Tue, 13 Apr 2021 23:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42496E40D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 23:38:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE8DB613A9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 23:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618357106;
 bh=i/SPq4DqaHJFgtAIJjeY4ErFuPgoVxrSMsgumddGdOI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Sd2VJPUiLekJVilp57UiDBL6O4v7RlzURmQiCz61C6TJFAUcEiNMB8W+Za0OjJOhr
 +k2AaiTWCIcgiwA/9RhlPiUJ73M1nEeMM5lSO/kowTe8jzk9+JAs7nVYZFjC0iSknc
 oU1OZQXgIE9hFXJRoSclXeIZVo7dqGtO7GbZgzIqvUhpMC/tTQ8Zm0oj9SgnZAAJLG
 HtV5EZtahqk5v8AxWQAs2EMToBlp2h76pIfYjUSIMVNLLzFrtdjFAJ0qDv3LLDr1Zm
 UXIcdQuIMfPtIl/iHqLLwLlsIdXYTjBuQh36r48koOaDbv6It0V4dAH6H9r712KO5x
 UWo6MQJ5HZOxg==
Received: by mail-ej1-f43.google.com with SMTP id n2so28539112ejy.7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 16:38:25 -0700 (PDT)
X-Gm-Message-State: AOAM531HnKFBR6roIJy3tzMAmWYLS1zcyw5t+GKok5Cb3PLtcPEP/vRA
 Dt87u9wysu/2KlzZDJFJW77EBylOmXJPrjxFUQ==
X-Google-Smtp-Source: ABdhPJzpH5eOS77fuaMMC1TeLT9DWDR87PI5sxoQLhq7SEPIPoVBozS6J7PZv1i/qiEEVXTWa8fAM544xi4x8RQkXWM=
X-Received: by 2002:a17:906:b01:: with SMTP id
 u1mr8479963ejg.310.1618357104520; 
 Tue, 13 Apr 2021 16:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618226325-31927-4-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1618226325-31927-4-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 14 Apr 2021 07:38:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY__zcdjA-tu4kNtWjy=37_HZV1U2fS6=k4OBAbjfNwC9Ow@mail.gmail.com>
Message-ID: <CAAOTY__zcdjA-tu4kNtWjy=37_HZV1U2fS6=k4OBAbjfNwC9Ow@mail.gmail.com>
Subject: Re: [PATCH v2, 3/5] Revert "dt-bindings: mailbox: mtk-gce: fix
 incorrect mbox-cells value"
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDTmnIgxMuaXpSDpgLHkuIAg5LiL5Y2INzoxOeWvq+mBk++8mgo+Cj4gVGhp
cyByZXZlcnRzIGNvbW1pdCBmODNiMDNmYzcyN2FiNTZhNzdlNjg3MTNkNmU0MDI5OTY5OGYzYzlm
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRl
ay5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94
L210ay1nY2UudHh0IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWFpbGJveC9tdGstZ2NlLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tYWlsYm94L210ay1nY2UudHh0Cj4gaW5kZXggNzc3MWVjYS4uY2Y0OGNkOCAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9tdGstZ2Nl
LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L210
ay1nY2UudHh0Cj4gQEAgLTQ3LDcgKzQ3LDcgQEAgRXhhbXBsZToKPiAgICAgICAgICAgICAgICAg
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDEzNSBJUlFfVFlQRV9MRVZFTF9MT1c+Owo+ICAgICAgICAg
ICAgICAgICBjbG9ja3MgPSA8JmluZnJhY2ZnIENMS19JTkZSQV9HQ0U+Owo+ICAgICAgICAgICAg
ICAgICBjbG9jay1uYW1lcyA9ICJnY2UiOwo+IC0gICAgICAgICAgICAgICAjbWJveC1jZWxscyA9
IDwyPjsKPiArICAgICAgICAgICAgICAgI21ib3gtY2VsbHMgPSA8Mz47CgpJIHRoaW5rIHdlIHNo
b3VsZCBub3QgY2hhbmdlIHRoZSBiaW5kaW5nIGp1c3QgdG8gZml4IHNvZnR3YXJlIGJ1Zy4KSSB0
aGluayB0aGVyZSBhcmUgbWFueSB0ZW1wb3Jhcnkgc29sdXRpb24gdG8gZml4IGRybSBidWcuIElm
IGRybSBidWcKaXMgY2F1c2VkIGJ5IGN1cnNvciBwbGFuZSwgeW91IGNvdWxkIHRlbXBvcmFyaWx5
IGxldCBkcm0gbm90IHN1cHBvcnQKY3Vyc29yIHBsYW5lIHRvIGZpeCBpdCAoaW4gWzFdLCBkbyBu
b3QgcmV0dXJuIERSTV9QTEFORV9UWVBFX0NVUlNPUikuCkJ1dCBJIHdvdWxkIGxpa2UgeW91IHRv
IGZpbmQgb3V0IHRoZSBjb3JyZWN0IHNvbHV0aW9uIHJhdGhlciB0aGFuIGEKdGVtcG9yYXJ5IHNv
bHV0aW9uIGJlY2F1c2UgdGhpcyBidWcgaXMgbm90IHNvIHVyZ2VudC4gKEZvciBtZSwgYnVnIG9m
CmJ1aWxkIGZhaWwsIGJvb3QgZmFpbCwgYmxhY2sgc2NyZWVuIGlzIHVyZ2VudCkuCgpbMV0gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGlu
dXguZ2l0L3RyZWUvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jP2g9djUu
MTItcmM3I242OTkKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICAgICAgICAgfTsKPgo+ICBFeGFt
cGxlIGZvciBhIGNsaWVudCBkZXZpY2U6Cj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
