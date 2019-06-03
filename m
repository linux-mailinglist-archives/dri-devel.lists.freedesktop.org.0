Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6EC329D5
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92760894EB;
	Mon,  3 Jun 2019 07:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1289089938
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 06:12:57 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id w187so10270827qkb.11
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2019 23:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rQKMvlElkXzkTnW65282CmCjdowsYOxbvU0co6H2Omc=;
 b=lxOL/mpZbBXgaFjSO38SnyxrqouoRHUskNDgWE0K80hSfKDIzZg6crvxnMNQjDccL+
 MzJKZ3c0ZhL+FRnjP2TNGXEGV26GaWa+MdBmNETN3Veg0sQLkpXnyygM/kK4xms14Qw6
 UTM+BfMCLGii4l9dsXCYh/UcPYwQ6l27zvD35eqeek9OKw0xvyIEruLiLmFIdxnyUNkk
 EYua77aq2psAQ6Vp9rvRvHC7ocKmA2zkH7SBInfWbo1vZRLo6qnaFOOPTDP6NB+/qWTW
 R4SjeL4tt9sUx2b8GZIQDIPhZfSw0XzGQ7os6wrPX73tDrVU1Mx5GKPAyAh7vIteKuDS
 +8lA==
X-Gm-Message-State: APjAAAUBcnd+D7SQyOsKTd3SowSES9ca378gqvXXVfa6OcKoADQp6F8B
 svSMe0cfIVVyHGGr0yzo8amVfyP0SLMbJ1vasZLtbw==
X-Google-Smtp-Source: APXvYqyYa6aK4qpb4pHRxq5EdOva3L9eBw4p4afxZAlRUL377+FbepH6pzSX2TDOULWOglfbvTtKnNCF8b4lPScN6ns=
X-Received: by 2002:a05:620a:1425:: with SMTP id
 k5mr20130384qkj.146.1559542376042; 
 Sun, 02 Jun 2019 23:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190601092615.67917-1-jitao.shi@mediatek.com>
 <20190601092615.67917-2-jitao.shi@mediatek.com>
In-Reply-To: <20190601092615.67917-2-jitao.shi@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 3 Jun 2019 14:12:30 +0800
Message-ID: <CAJMQK-iW2SfHL0Dgc6p8AmrwjL=XHP4SeyxaZz=R-5x0qLZtFw@mail.gmail.com>
Subject: Re: [v4 1/7] drm/mediatek: move mipi_dsi_host_register to probe
To: Jitao Shi <jitao.shi@mediatek.com>
X-Mailman-Approved-At: Mon, 03 Jun 2019 07:40:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rQKMvlElkXzkTnW65282CmCjdowsYOxbvU0co6H2Omc=;
 b=fuxr8hy1ndYkPliVijP3ig5I+ip9VWE0P2yh80Jq/MvQG6c9DoiS6lr2FunG35GbPp
 Ndqy5vBKyLtaR3WnnumoaQ/hATDNwRh4VhWFKf29gGr4JSmvjErcNiFS62LTDxLrAwP/
 4gouhbfiCjvi/19vu9jcISzQHvv3SlbTnrJ4o=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 yingjoe.chen@mediatek.com, Thierry Reding <treding@nvidia.com>,
 Sean Paul <seanpaul@chromium.org>, linux-pwm@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMSwgMjAxOSBhdCA5OjI2IEFNIEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlh
dGVrLmNvbT4gd3JvdGU6Cgo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTEwNDUs
MTIgKzEwNDUsNiBAQCBzdGF0aWMgaW50IG10a19kc2lfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgcmV0ID0gbWlwaV9kc2lfaG9zdF9yZWdp
c3RlcigmZHNpLT5ob3N0KTsKPiAtICAgICAgIGlmIChyZXQgPCAwKSB7Cj4gLSAgICAgICAgICAg
ICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIERTSSBob3N0OiAlZFxuIiwgcmV0
KTsKPiAtICAgICAgICAgICAgICAgZ290byBlcnJfZGRwX2NvbXBfdW5yZWdpc3RlcjsKPiAtICAg
ICAgIH0KPiAtCgo+IEBAIC0xMDk3LDMxICsxMDg5LDM3IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Cj4gICAgICAgICBkc2ktPmhvc3Qu
b3BzID0gJm10a19kc2lfb3BzOwo+ICAgICAgICAgZHNpLT5ob3N0LmRldiA9IGRldjsKPiArICAg
ICAgIGRzaS0+ZGV2ID0gZGV2Owo+ICsgICAgICAgcmV0ID0gbWlwaV9kc2lfaG9zdF9yZWdpc3Rl
cigmZHNpLT5ob3N0KTsKPiArICAgICAgIGlmIChyZXQgPCAwKSB7Cj4gKyAgICAgICAgICAgICAg
IGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIERTSSBob3N0OiAlZFxuIiwgcmV0KTsK
PiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgIH0KCihJdCdzIGNvbW1lbnRl
ZCBvbiB2MywgaW4gY2FzZSBpdCdzIG1pc3NlZCwgc2VudCB0aGlzIGFnYWluLikKU2luY2UgbWlw
aV9kc2lfaG9zdF9yZWdpc3RlcigpIGlzIG1vdmVkIGZyb20gLmJpbmQgdG8gLnByb2JlLAptaXBp
X2RzaV9ob3N0X3VucmVnaXN0ZXIoKSBzaG91bGQgYWxzbyBiZSBtb3ZlZCBmcm9tIC51bmJpbmQg
dG8KLnJlbW92ZT8KClRoYW5rcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
