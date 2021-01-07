Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF52ECDCA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 11:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8F96E28B;
	Thu,  7 Jan 2021 10:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695496E28B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 10:29:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAC3A23358
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 10:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610015370;
 bh=13M5zIZH8BYdSgLHcSiUssuxy7aGnL0zsfUTM4vT+Pc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PhzyKeH/omMWDkne6YDBSmYzC952k4TKrqQ+OcU3RWV226x+kfHocirL+sOZ1Ec1I
 L6FYpSbXcq2asi3sfqgBi0QnTs03QoC98IdxSzGWTO41n/JYWqaq0o4k86z7HrC8Ie
 ilPmplMJtIaIQ3XygqQIoEY2Hyr24EGZ914HsqxKeELf1D8HedliDW2sGcd4JtwV2f
 vhoiv7NnQ9Sr4DIB5ghdCSrOkw132MTxao0h77BnA1+creB8OzggJAtOWa+zzsJxlD
 YyErySULnK2ZXXY8Pl9n4joMIK9fxLbho21bcscMsaf3/9mZzdDdy0IOYt5tLzvHwp
 9lKjVFeYW7w2w==
Received: by mail-ej1-f49.google.com with SMTP id jx16so8923655ejb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 02:29:29 -0800 (PST)
X-Gm-Message-State: AOAM5320+8XboXzlOvzs9PUHMXYc11qYJzSAw6pNg6xbpgea6CGTGjK9
 Wo/QieTHYNln3yQlhfSCPZllAeox3LaFwWVnnw==
X-Google-Smtp-Source: ABdhPJz05+dsxcv5R7wZF5woSln0ppvl0ASJjVM3ts6esC2GEruDIYNAngku7nUd4kbjmo3tFkzNSYPUlVOCGP5KdM4=
X-Received: by 2002:a17:907:9627:: with SMTP id
 gb39mr5843470ejc.267.1610015368212; 
 Thu, 07 Jan 2021 02:29:28 -0800 (PST)
MIME-Version: 1.0
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-9-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609989081-29353-9-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 7 Jan 2021 18:29:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8Gvk_tR-omr0ObbdB68kvjXR9rcri_ADSHvhGeFdOiHA@mail.gmail.com>
Message-ID: <CAAOTY_8Gvk_tR-omr0ObbdB68kvjXR9rcri_ADSHvhGeFdOiHA@mail.gmail.com>
Subject: Re: [PATCH v9,
 08/11] drm/mediatek: add has_dither private data for gamma
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
PiDmlrwgMjAyMeW5tDHmnIg35pelIOmAseWbmyDkuIrljYgxMToxMuWvq+mBk++8mgo+Cj4gbm90
IGFsbCBTb0MgaGFzIGRpdGhlciBmdW5jdGlvbiBpbiBnYW1tYSBtb2R1bGUKPiBkZCBwcml2YXRl
IGRhdGEgdG8gY29udHJvbCB0aGlzIGZ1bmN0aW9uIHNldHRpbmcKCidhZGQnID8KCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMgfCAxMiArKysr
KysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2Ft
bWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jCj4gaW5kZXgg
ODUwMTgyMS4uNGVhYjgyYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3BfZ2FtbWEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9nYW1tYS5jCj4gQEAgLTI0LDcgKzI0LDcgQEAKPiAgI2RlZmluZSBMVVRfMTBCSVRfTUFTSyAg
ICAgICAgICAgICAgICAgICAgICAgICAweDAzZmYKPgo+ICBzdHJ1Y3QgbXRrX2Rpc3BfZ2FtbWFf
ZGF0YSB7Cj4gLSAgICAgICB1MzIgcmVzZXJ2ZWQ7Cj4gKyAgICAgICBib29sIGhhc19kaXRoZXI7
Cj4gIH07Cj4KPiAgLyoqCj4gQEAgLTcyLDcgKzcyLDggQEAgc3RhdGljIHZvaWQgbXRrX2dhbW1h
X2NvbmZpZyhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgdywKPgo+ICAg
ICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAxNiB8IHcsIGNvbXAsIERJU1BfR0FN
TUFfU0laRSk7Cj4KPiAtICAgICAgIG10a19kaXRoZXJfc2V0KGNvbXAsIGJwYywgRElTUF9HQU1N
QV9DRkcsIGNtZHFfcGt0KTsKPiArICAgICAgIGlmIChnYW1tYS0+ZGF0YSAmJiBnYW1tYS0+ZGF0
YS0+aGFzX2RpdGhlcikKPiArICAgICAgICAgICAgICAgbXRrX2RpdGhlcl9zZXQoY29tcCwgYnBj
LCBESVNQX0dBTU1BX0NGRywgY21kcV9wa3QpOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgbXRrX2dh
bW1hX3N0YXJ0KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCj4gQEAgLTE2OCw4ICsxNjksMTMg
QEAgc3RhdGljIGludCBtdGtfZGlzcF9nYW1tYV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBtdGtfZGlzcF9nYW1tYV9kYXRhIG10ODE3M19nYW1tYV9kcml2ZXJfZGF0YSA9IHsKPiArICAg
ICAgIC5oYXNfZGl0aGVyID0gdHJ1ZSwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIG10a19kaXNwX2dhbW1hX2RyaXZlcl9kdF9tYXRjaFtdID0gewo+IC0gICAg
ICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1nYW1tYSJ9LAo+ICsgICAg
ICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1nYW1tYSIsCj4gKyAgICAg
ICAgIC5kYXRhID0gJm10ODE3M19nYW1tYV9kcml2ZXJfZGF0YX0sCj4gICAgICAgICB7fSwKPiAg
fTsKPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXRrX2Rpc3BfZ2FtbWFfZHJpdmVyX2R0X21h
dGNoKTsKPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
