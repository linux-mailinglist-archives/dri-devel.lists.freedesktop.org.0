Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D438E3144AE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 01:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6428E6EA39;
	Tue,  9 Feb 2021 00:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0037E6EA39
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 00:13:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F12664E9D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 00:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612829597;
 bh=YGQmG5Aw41UXZ3vI14ndhT9iSdpoqlYcFpzEnNjxbjE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WbIo1RFAUb3UxRl4kThhbzRV6iE2oes6501a2dews7L6RpBw1Tp+RWtbCFOId5QLv
 +ogETCL1EKjjPK8T5pXEVCnYLqhzsbWHzM0TVsC+cEyFOy0fsP0gPg/vtyyyeIbnmk
 y8JqSEYI7gqgh5fwAmG1FX0iH2cHpY6FNb9PtLINeRCsDfvkO96IIrZDqEyYOrY+PD
 AbngIjlr6E17MKSxtNUX9+oWYwDQUTxRrG19/1QypjWGsw4/ylB6XvoWN65+zAOUvz
 +461sHNjjZFHFZZYVBe8lfQtSaQ5DnRGbkAkXWlf4Ro5Mk0y0STLO6XUcxtFUAVM/l
 EYXYuP6EsjVVA==
Received: by mail-ed1-f47.google.com with SMTP id y8so21377044ede.6
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 16:13:17 -0800 (PST)
X-Gm-Message-State: AOAM530D9rOq8sZK8qV7xWjqbJ4Eaj1Bk4kGydHjHoPyyVomoYOHNxcz
 fB3Xx49W5avsgyNOP8FPJmF1MPAUTbDxJdhHFQ==
X-Google-Smtp-Source: ABdhPJxAI/h9uXjLJYnN0Sa3CKD70oKvcOCCJCsQsOiLlPPOuDvuzg3BdEn1AI05WVTfO15A/MjEAGAWq5okef9eZWg=
X-Received: by 2002:a50:d90a:: with SMTP id t10mr20535060edj.162.1612829596148; 
 Mon, 08 Feb 2021 16:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20210208014221.196584-1-jitao.shi@mediatek.com>
 <20210208014221.196584-2-jitao.shi@mediatek.com>
In-Reply-To: <20210208014221.196584-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 9 Feb 2021 08:13:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-tEJA7suX_9PH9XRcjdd67o6aVw+Nd4A-PBjEFxOUKcQ@mail.gmail.com>
Message-ID: <CAAOTY_-tEJA7suX_9PH9XRcjdd67o6aVw+Nd4A-PBjEFxOUKcQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/mediatek: mtk_dpi: Add check for max clock
 rate in mode_valid
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 shuijing.li@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDLmnIg45pelIOmAseS4gCDkuIrljYg5OjQy5a+r6YGT77yaCj4KPiBBZGQgcGVyLXBsYXRmb3Jt
IG1heCBjbG9jayByYXRlIGNoZWNrIGluIG10a19kcGlfYnJpZGdlX21vZGVfdmFsaWQuCgpSZXZp
ZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2ln
bmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwgMTcgKysrKysrKysrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcGkuYwo+IGluZGV4IDUyZjExYTYzYTMzMC4uZmZhNGEwZjE5ODlmIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gQEAgLTExOCw2ICsxMTgsNyBAQCBzdHJ1Y3QgbXRr
X2RwaV95Y19saW1pdCB7Cj4gIHN0cnVjdCBtdGtfZHBpX2NvbmYgewo+ICAgICAgICAgdW5zaWdu
ZWQgaW50ICgqY2FsX2ZhY3RvcikoaW50IGNsb2NrKTsKPiAgICAgICAgIHUzMiByZWdfaF9mcmVf
Y29uOwo+ICsgICAgICAgdTMyIG1heF9jbG9ja19raHo7Cj4gICAgICAgICBib29sIGVkZ2Vfc2Vs
X2VuOwo+ICB9Owo+Cj4gQEAgLTU1NSw5ICs1NTYsMjIgQEAgc3RhdGljIHZvaWQgbXRrX2RwaV9i
cmlkZ2VfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gICAgICAgICBtdGtfZHBp
X3NldF9kaXNwbGF5X21vZGUoZHBpLCAmZHBpLT5tb2RlKTsKPiAgfQo+Cj4gK3N0YXRpYyBlbnVt
IGRybV9tb2RlX3N0YXR1cwo+ICttdGtfZHBpX2JyaWRnZV9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1f
YnJpZGdlICpicmlkZ2UsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
ZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiArewo+ICsgICAgICAgc3RydWN0IG10a19kcGkgKmRw
aSA9IGJyaWRnZV90b19kcGkoYnJpZGdlKTsKPiArCj4gKyAgICAgICBpZiAoZHBpLT5jb25mLT5t
YXhfY2xvY2tfa2h6ICYmIG1vZGUtPmNsb2NrID4gZHBpLT5jb25mLT5tYXhfY2xvY2tfa2h6KQo+
ICsgICAgICAgICAgICAgICByZXR1cm4gTU9ERV9DTE9DS19ISUdIOwo+ICsKPiArICAgICAgIHJl
dHVybiBNT0RFX09LOwo+ICt9Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlkZ2Vf
ZnVuY3MgbXRrX2RwaV9icmlkZ2VfZnVuY3MgPSB7Cj4gICAgICAgICAuYXR0YWNoID0gbXRrX2Rw
aV9icmlkZ2VfYXR0YWNoLAo+ICAgICAgICAgLm1vZGVfc2V0ID0gbXRrX2RwaV9icmlkZ2VfbW9k
ZV9zZXQsCj4gKyAgICAgICAubW9kZV92YWxpZCA9IG10a19kcGlfYnJpZGdlX21vZGVfdmFsaWQs
Cj4gICAgICAgICAuZGlzYWJsZSA9IG10a19kcGlfYnJpZGdlX2Rpc2FibGUsCj4gICAgICAgICAu
ZW5hYmxlID0gbXRrX2RwaV9icmlkZ2VfZW5hYmxlLAo+ICB9Owo+IEBAIC02NzMsMTcgKzY4Nywy
MCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IG10ODE4M19jYWxjdWxhdGVfZmFjdG9yKGludCBjbG9j
aykKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTczX2NvbmYgPSB7Cj4g
ICAgICAgICAuY2FsX2ZhY3RvciA9IG10ODE3M19jYWxjdWxhdGVfZmFjdG9yLAo+ICAgICAgICAg
LnJlZ19oX2ZyZV9jb24gPSAweGUwLAo+ICsgICAgICAgLm1heF9jbG9ja19raHogPSAzMDAwMDAs
Cj4gIH07Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQyNzAxX2NvbmYg
PSB7Cj4gICAgICAgICAuY2FsX2ZhY3RvciA9IG10MjcwMV9jYWxjdWxhdGVfZmFjdG9yLAo+ICAg
ICAgICAgLnJlZ19oX2ZyZV9jb24gPSAweGIwLAo+ICAgICAgICAgLmVkZ2Vfc2VsX2VuID0gdHJ1
ZSwKPiArICAgICAgIC5tYXhfY2xvY2tfa2h6ID0gMTUwMDAwLAo+ICB9Owo+Cj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE4M19jb25mID0gewo+ICAgICAgICAgLmNhbF9m
YWN0b3IgPSBtdDgxODNfY2FsY3VsYXRlX2ZhY3RvciwKPiAgICAgICAgIC5yZWdfaF9mcmVfY29u
ID0gMHhlMCwKPiArICAgICAgIC5tYXhfY2xvY2tfa2h6ID0gMTAwMDAwLAo+ICB9Owo+Cj4gIHN0
YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+IC0t
Cj4gMi4yNS4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
