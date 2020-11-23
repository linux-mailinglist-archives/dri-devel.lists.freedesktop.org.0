Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0579E2C0D9C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 15:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB8B6E037;
	Mon, 23 Nov 2020 14:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C2B6E029
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:37:08 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE6F12080A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606142228;
 bh=OUEWYsBkqLktfnlUWZU93Abg+Nz/7mAOEsw44o/z+AY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LWeEmYqRvIgVibJPvSUA2bNMZQKSwK4bFEbNihh1IZICbn9g73foiQyD2lJ+Kj9cW
 aHXTvbMmNhyKgCdAiOyMUqq9ko2uFsk4zH5WkqDSAiwX//khUaYb3iSdJ3ZinOQsLL
 KFYTslYgHiC7hm8tX+CcEdkzT3d+WvIAEY97IJxc=
Received: by mail-ej1-f50.google.com with SMTP id i19so23585225ejx.9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 06:37:07 -0800 (PST)
X-Gm-Message-State: AOAM532sfhDW2oSceTtZxYzk9gk4kQVVwloZziGnP5rq6XgVbRe4Snol
 HNuZC1HdK0bh24jIHl5mq0zQ9UwcajoVGCEE/g==
X-Google-Smtp-Source: ABdhPJwGasd9fgVLE5ED8mhWD3NZ+E+/6bwxsrrXYebqvxGYFpzg+IT9Mho0RkDbiY0q9WB2uZjp5mQd28XNDsFa8GI=
X-Received: by 2002:a17:906:d0cc:: with SMTP id
 bq12mr42714267ejb.127.1606142226345; 
 Mon, 23 Nov 2020 06:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-19-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-19-lee.jones@linaro.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2020 22:36:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9qciG6Cc4b8WqzCugdve99qjTO5ftsyK0PHJiOF+C19w@mail.gmail.com>
Message-ID: <CAAOTY_9qciG6Cc4b8WqzCugdve99qjTO5ftsyK0PHJiOF+C19w@mail.gmail.com>
Subject: Re: [PATCH 18/40] drm/mediatek/mtk_dpi: Remove unused struct
 definition 'mtk_dpi_encoder_funcs'
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jie Qiu <jie.qiu@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIExlZToKCkxlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IOaWvCAyMDIw5bm0MTHm
nIgxM+aXpSDpgLHkupQg5LiL5Y2IOTo1MOWvq+mBk++8mgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2lu
ZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYzo1MzA6Mzk6IHdhcm5pbmc6IOKAmG10a19kcGlfZW5jb2Rlcl9mdW5jc+KA
mSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+CgpUaGFu
a3MgZm9yIHRoaXMgcGF0Y2gsIGJ1dCBJJ3ZlIGFwcGxpZWQgYW5vdGhlciBpZGVudGljYWwgcGF0
Y2gKImRybS9tZWRpYXRlazogbXRrX2RwaTogRml4IHVudXNlZCB2YXJpYWJsZSAnbXRrX2RwaV9l
bmNvZGVyX2Z1bmNzJyIKWzFdLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvY29tbWl0Lz9oPW1lZGlhdGVr
LWRybS1maXhlcyZpZD00NmI5N2FlZDU0ODRhM2Y0NDU4NGExMGY5ZTA2OTFiZjg5ZDI5MDY0CgpS
ZWdhcmRzLApDaHVuLUt1YW5nLgoKPiBDYzogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtl
cm5lbC5vcmc+Cj4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21h
aWwuY29tPgo+IENjOiBKaWUgUWl1IDxqaWUucWl1QG1lZGlhdGVrLmNvbT4KPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCA5IC0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+
IGluZGV4IGNmMTFjNDg1MGI0MDUuLjUyZjExYTYzYTMzMDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBpLmMKPiBAQCAtNTIyLDE1ICs1MjIsNiBAQCBzdGF0aWMgaW50IG10a19kcGlf
c2V0X2Rpc3BsYXlfbW9kZShzdHJ1Y3QgbXRrX2RwaSAqZHBpLAo+ICAgICAgICAgcmV0dXJuIDA7
Cj4gIH0KPgo+IC1zdGF0aWMgdm9pZCBtdGtfZHBpX2VuY29kZXJfZGVzdHJveShzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXIpCj4gLXsKPiAtICAgICAgIGRybV9lbmNvZGVyX2NsZWFudXAoZW5j
b2Rlcik7Cj4gLX0KPiAtCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfZnVuY3Mg
bXRrX2RwaV9lbmNvZGVyX2Z1bmNzID0gewo+IC0gICAgICAgLmRlc3Ryb3kgPSBtdGtfZHBpX2Vu
Y29kZXJfZGVzdHJveSwKPiAtfTsKPiAtCj4gIHN0YXRpYyBpbnQgbXRrX2RwaV9icmlkZ2VfYXR0
YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZW51bSBkcm1fYnJpZGdlX2F0dGFjaF9mbGFncyBmbGFncykKPiAgewo+IC0tCj4g
Mi4yNS4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
