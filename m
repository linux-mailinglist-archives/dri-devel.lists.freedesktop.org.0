Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BDA1B90F
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 16:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B397389F1B;
	Mon, 13 May 2019 14:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A8D89F35
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:49:27 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y42so286558qtk.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 07:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f57f9CrkLHcFePwjN3FU4Rm5r4Irtea70kxXmHOLUco=;
 b=eE/pttHQyxewey5loNWU5zQZftAfJXgIKc08hLj6lezdvFaP/OUxQrpy8I4Xcu5uP3
 Mp9+b4NfJixuH8AyuI8jiQNn4ZiaoNuJcdmQYlsx1J63s9T3eaaVOQ/HaRCJHBmnv1Jc
 k904AD3Va/PJBt8Wfsv9U7ZWJzrm1SIzStZk0zRqG8m65dG9zTa93UZeviQpvx2SJVja
 IhPQ8CfPhgIUPbSQs7AHuocEYCfMPS7XMFBG239B6rdOyBxymQMi06rv9AsGsb45oh+J
 GpNF5QK50qPQAYLmyWkdmX8c1roopfrnDDRRSAGMtt53vdMy0CpJ91mSjHiFv5EBSqrY
 Wtnw==
X-Gm-Message-State: APjAAAU9yT87Nks/USiIvxbotRT79a3f8GvqR0IVcb5nHpIwMpdWIsDT
 mbKTo5g+nEj0P46onZOjf4xaTQ==
X-Google-Smtp-Source: APXvYqzkJCxySOotyEccUkLJnh8/L72NsFkDS7twtnhdQDc/s7sFH4Ei7ug85zyIi2vDurk31ZYd4Q==
X-Received: by 2002:ac8:33bc:: with SMTP id c57mr23963559qtb.252.1557758967170; 
 Mon, 13 May 2019 07:49:27 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g206sm6871504qkb.75.2019.05.13.07.49.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 07:49:26 -0700 (PDT)
Date: Mon, 13 May 2019 10:49:26 -0400
From: Sean Paul <sean@poorly.run>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/mdp5: Use the interconnect API
Message-ID: <20190513144926.GQ17077@art_vandelay>
References: <20190508204219.31687-1-robdclark@gmail.com>
 <20190508204219.31687-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508204219.31687-6-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f57f9CrkLHcFePwjN3FU4Rm5r4Irtea70kxXmHOLUco=;
 b=eNRYCOI4Cpe7VbMGN3Mij1vUAro3bwftdHrWDAXGJjKa4FxsC20E1IR4yp7rfJaHgU
 NFr4NGb/l8gYtiWC5t8U/QmKwQkIJoFMioynbUv5GiZA2XPvw4SPpiFgyXeCpt8+F+lc
 HQb53Xpc7qcpSry382HT166WeDmlRPNZLhytbJcbIs6NClgbtS3OZrV7lu3f76a30aVC
 OuSheK4Wo5RMbkTM3Xcpizy9fWOQzk34+h9Olt6u+E1S1PgFoAsAyFjTn7laW+wDx3YT
 H+KU9HdNYmUU6r0NjsuV4y2SFvsKbLPSKNIV1VFTFzILwwtNfqsaKnQTy4Qm80iidvhk
 7Igw==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDE6NDI6MTVQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IEdlb3JnaSBEamFrb3YgPGdlb3JnaS5kamFrb3ZAbGluYXJvLm9yZz4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBHZW9yZ2kgRGpha292IDxnZW9yZ2kuZGpha292QGxpbmFyby5vcmc+Cj4g
U2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jIHwgMTQgKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKPiBpbmRleCA5NzE3OWJlYzg5MDIuLjU0ZDJi
NGMyYjA5ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1
X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwo+
IEBAIC0xNiw2ICsxNiw3IEBACj4gICAqIHRoaXMgcHJvZ3JhbS4gIElmIG5vdCwgc2VlIDxodHRw
Oi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KPiAgICovCj4gIAo+ICsjaW5jbHVkZSA8bGludXgv
aW50ZXJjb25uZWN0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4KPiAgCj4gICNpbmNs
dWRlICJtc21fZHJ2LmgiCj4gQEAgLTEwNTAsNiArMTA1MSwxOSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGNvbXBvbmVudF9vcHMgbWRwNV9vcHMgPSB7Cj4gIAo+ICBzdGF0aWMgaW50IG1kcDVfZGV2
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiArCXN0cnVjdCBpY2Nf
cGF0aCAqcGF0aDAgPSBvZl9pY2NfZ2V0KCZwZGV2LT5kZXYsICJwb3J0MCIpOwo+ICsJc3RydWN0
IGljY19wYXRoICpwYXRoMSA9IG9mX2ljY19nZXQoJnBkZXYtPmRldiwgInBvcnQxIik7Cj4gKwlz
dHJ1Y3QgaWNjX3BhdGggKnBhdGhfcm90ID0gb2ZfaWNjX2dldCgmcGRldi0+ZGV2LCAicm90YXRv
ciIpOwo+ICsKPiArCWlmIChJU19FUlIocGF0aDApKQoKU2FtZSBjb21tZW50cyBoZXJlIHJlOiBO
VUxMIHZhbHVlCgo+ICsJCXJldHVybiBQVFJfRVJSKHBhdGgwKTsKPiArCWljY19zZXRfYncocGF0
aDAsIDAsIE1CcHNfdG9faWNjKDY0MDApKTsKPiArCj4gKwlpZiAoIUlTX0VSUihwYXRoMSkpCj4g
KwkJaWNjX3NldF9idyhwYXRoMSwgMCwgTUJwc190b19pY2MoNjQwMCkpOwo+ICsJaWYgKCFJU19F
UlIocGF0aF9yb3QpKQo+ICsJCWljY19zZXRfYncocGF0aF9yb3QsIDAsIE1CcHNfdG9faWNjKDY0
MDApKTsKPiArCj4gIAlEQkcoIiIpOwo+ICAJcmV0dXJuIGNvbXBvbmVudF9hZGQoJnBkZXYtPmRl
diwgJm1kcDVfb3BzKTsKPiAgfQo+IC0tIAo+IDIuMjAuMQo+IAoKLS0gClNlYW4gUGF1bCwgU29m
dHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
