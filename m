Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C10F23FBF4
	for <lists+dri-devel@lfdr.de>; Sun,  9 Aug 2020 02:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241746E162;
	Sun,  9 Aug 2020 00:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966BC6E162
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 00:35:34 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 082642073E
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 00:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596933333;
 bh=coQD0wBPaBdDQivRZlkVTAL9bKjxlMoqwYidiCYobu8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZhdXHSbGknQR+b+3YLI9YqMjsJmJW+yYdR4b9uOVrGZRu+SOjPpI4W6MI+qb4zD1G
 gQCWZk7GJOgQQakgyUQUaM48Ej8u9z1HE0O4IHBQDQqlhWYb/hADg8auRSzisTMMQe
 pg7hsgKz1+jnLfV6QaWpVMMtJuJb+6xgSPjrKjkg=
Received: by mail-ed1-f53.google.com with SMTP id a14so3894966edx.7
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Aug 2020 17:35:32 -0700 (PDT)
X-Gm-Message-State: AOAM532IpKuTs91rwCczPxXu3b7pAg8yQccK3aBeyFC66Rzv61/g3zLq
 /sqrIYrsdSgekgIcTUmwIy0aEw7+NlJWAS9lLA==
X-Google-Smtp-Source: ABdhPJxZvcW8PgfFlsq/+msJNbIn+ca0CblF0488HSrYloUzKvPr/KfxkqW6W3mw1LCCbvI377JkyUuaVPVehXXvAnA=
X-Received: by 2002:a05:6402:2037:: with SMTP id
 ay23mr14822310edb.48.1596933331512; 
 Sat, 08 Aug 2020 17:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
 <1596855231-5782-7-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1596855231-5782-7-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 9 Aug 2020 08:35:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8B0xC5QspmLS0NNTD5fG1V+OY6hNU9F4+qcqHFdQtCWw@mail.gmail.com>
Message-ID: <CAAOTY_8B0xC5QspmLS0NNTD5fG1V+OY6hNU9F4+qcqHFdQtCWw@mail.gmail.com>
Subject: Re: [RESEND v7,
 PATCH 6/7] drm/mediatek: add support for mediatek SOC MT8183
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
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
PiDmlrwgMjAyMOW5tDjmnIg45pelIOmAseWFrSDkuIrljYgxMTowNeWvq+mBk++8mgo+Cj4gVGhp
cyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgbWVkaWF0ZWsgU09DIE1UODE4Mwo+IDEuIGFkZCBvdmwg
cHJpdmF0ZSBkYXRhCj4gMi4gYWRkIHJkbWEgcHJpdmF0ZSBkYXRhCj4gMy4gYWRkIG11dGVzIHBy
aXZhdGUgZGF0YQo+IDQuIGFkZCBtYWluIGFuZCBleHRlcm5hbCBwYXRoIG1vZHVsZSBmb3IgY3J0
YyBjcmVhdGUKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVA
bWVkaWF0ZWsuY29tPgoKW3NuaXBdCgo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgbXRrX2Rpc3Bfb3ZsX2RyaXZlcl9kdF9tYXRjaFtdID0gewo+ICAgICAgICAgeyAuY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZGlzcC1vdmwiLAo+ICAgICAgICAgICAuZGF0YSA9
ICZtdDI3MDFfb3ZsX2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTczLWRpc3Atb3ZsIiwKPiAgICAgICAgICAgLmRhdGEgPSAmbXQ4MTczX292bF9k
cml2ZXJfZGF0YX0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1k
aXNwLW92bCIsCgoibWVkaWF0ZWssbXQ4MTgzLWRpc3Atb3ZsIiBpcyBub3QgZGVmaW5lZCBpbiBi
aW5kaW5nIGRvY3VtZW50IFsxXQoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0P2g9djUu
OAoKPiArICAgICAgICAgLmRhdGEgPSAmbXQ4MTgzX292bF9kcml2ZXJfZGF0YX0sCj4gKyAgICAg
ICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1kaXNwLW92bC0ybCIsCgpEaXR0by4K
Cj4gKyAgICAgICAgIC5kYXRhID0gJm10ODE4M19vdmxfMmxfZHJpdmVyX2RhdGF9LAo+ICAgICAg
ICAge30sCj4gIH07Cgpbc25pcF0KCj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBtdGtfZGlzcF9yZG1hX2RyaXZlcl9kdF9tYXRjaFtdID0gewo+ICAgICAgICAgeyAuY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZGlzcC1yZG1hIiwKPiAgICAgICAgICAgLmRhdGEg
PSAmbXQyNzAxX3JkbWFfZHJpdmVyX2RhdGF9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxNzMtZGlzcC1yZG1hIiwKPiAgICAgICAgICAgLmRhdGEgPSAmbXQ4MTczX3Jk
bWFfZHJpdmVyX2RhdGF9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
ODMtZGlzcC1yZG1hIiwKCkRpdHRvLgoKPiArICAgICAgICAgLmRhdGEgPSAmbXQ4MTgzX3JkbWFf
ZHJpdmVyX2RhdGF9LAo+ICAgICAgICAge30sCj4gIH07Cj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIG10a19kaXNwX3JkbWFfZHJpdmVyX2R0X21hdGNoKTsKCltzbmlwXQoKPiArCj4gIHN0cnVj
dCBtdGtfZGlzcF9tdXRleCAqbXRrX2Rpc3BfbXV0ZXhfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwg
dW5zaWduZWQgaW50IGlkKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2RkcCAqZGRwID0gZGV2
X2dldF9kcnZkYXRhKGRldik7Cj4gQEAgLTQwMiw2ICs0NDcsOCBAQCBzdGF0aWMgaW50IG10a19k
ZHBfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICAgIC5kYXRh
ID0gJm10MjcxMl9kZHBfZHJpdmVyX2RhdGF9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxNzMtZGlzcC1tdXRleCIsCj4gICAgICAgICAgIC5kYXRhID0gJm10ODE3M19k
ZHBfZHJpdmVyX2RhdGF9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
ODMtZGlzcC1tdXRleCIsCgpEaXR0by4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsgICAgICAg
ICAuZGF0YSA9ICZtdDgxODNfZGRwX2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHt9LAo+ICB9Owo+
ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkZHBfZHJpdmVyX2R0X21hdGNoKTsKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
