Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB20F345B8D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 11:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8146E887;
	Tue, 23 Mar 2021 10:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A81B6E887
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:01:24 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id u21so8101641ejo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nj4YcCb7xjYVbxlcwxxDQrqQ71mTXMPHZgfWFiKufYI=;
 b=Vwnf9gIIyfDs4RawhTaywxnMirJTfyjnqOrLX2NEQ3rhT8n/yMvtszcac60vbIREjo
 poQKz2Y604m2WZTdvoRefkvHJ9O9DZ9kE2CFeeBKpVDVEsZePKSyoSWvJr6d04m3wgDJ
 8JIcCxyYxl7mC0dfGVm7jUsibRu0Rgo4Q2JWBLgglZisNRE1IuUoaHSIHrCgaOw5JakA
 K51rnUknIWtg7Ej5zEMMNboAB9llNqHQ15QMokSpR7X2Qyds8+j5GR7dtOnFnYxBI7JI
 8BunhCHS571+8CkvdDjlRl10vsT7TGYENTq0E1m3T6fkW66BMO5W5n9tqQsLr8GSf2fU
 3AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nj4YcCb7xjYVbxlcwxxDQrqQ71mTXMPHZgfWFiKufYI=;
 b=LpQbBiDgZQQeSr0u+MldL5RB/b4FQz7V/guU6nqJ/+Ay1Bemwd0pZIiEeezxDUi9S8
 OH9AjW0Qg0t5kpplBf8GN+LtFE4zawcguLl+CDbifPuNI7R43m1fpBh31DZRtJsNw07Y
 DKcX1SzfYfrWcr9zZcSbBd0oT0BgLB1qgJQXNsBr7DrveZL/OnVM1c3XBYmR+89KFF5L
 wTUad6OQ+jSYA6Rv95n5oavtOzpEv7o26SXKFeyz8mjMSprh5mt4HYRqpYUAV/M+6OyR
 4//zNMcnQkwGHcZ67gnQzKCmV+k5zvK7GJBKpUpxZMSoabRFWJ6uiuc6FRdgrP/ct5iE
 FMbw==
X-Gm-Message-State: AOAM533Yb5JJGLTKN+2lpUQcR5PSrBHbVOEU59rxEttdK34aDeamsqO/
 pEJ8B9hoNzagz/GZmKRcE+4Eaqe/4ocnmObErcA=
X-Google-Smtp-Source: ABdhPJx0yvU4tb0BcWmW3MEpF/P3YjS9itwZH71QHOPG67k7RMfo5h3+ymT/wvQgYmGv6Vmbu15NqNphFtzHRPrl3kU=
X-Received: by 2002:a17:906:a8a:: with SMTP id
 y10mr4250922ejf.288.1616493683238; 
 Tue, 23 Mar 2021 03:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210308120555.252524-1-adrien.grassein@gmail.com>
 <20210308120555.252524-3-adrien.grassein@gmail.com>
 <CAG3jFytoE9hWvq2e2Caqn4qP_RuEOnm4r9VQ85ffbAcguSLf+w@mail.gmail.com>
In-Reply-To: <CAG3jFytoE9hWvq2e2Caqn4qP_RuEOnm4r9VQ85ffbAcguSLf+w@mail.gmail.com>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Tue, 23 Mar 2021 11:01:12 +0100
Message-ID: <CABkfQAGvPy3DzXQnDJqm1q_rOLWR7BQTXb8z05iML3s3Mc8LJw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drm/bridge: Introduce LT8912B DSI to HDMI bridge
To: Robert Foss <robert.foss@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 kernel test robot <lkp@intel.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IFJvYmVydCwKClRoYW5rcyBmb3IgdGhlIHVwZGF0ZS4KCkxlIG1hci4gMjMgbWFycyAyMDIx
IMOgIDEwOjEwLCBSb2JlcnQgRm9zcyA8cm9iZXJ0LmZvc3NAbGluYXJvLm9yZz4gYSDDqWNyaXQg
Ogo+Cj4gSGV5IEFkcmllbiwKPgo+IFNvcnJ5IGFib3V0IHRoZSBzbG93IHJlcGx5LCBidXQgSSBq
dXN0IHJlY2VpdmVkIHRoZSBkb2N1bWVudGF0aW9uIGZyb20KPiB0aGUgdmVuZG9yLiBTbyBsZXQn
cyBkaWcgaW4gdG8gdGhlIEhQRCBpc3N1ZS4KCk5vIHByb2JsZW0gOikKPgo+ID4gK3N0YXRpYyBl
bnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzIGx0ODkxMl9jaGVja19jYWJsZV9zdGF0dXMoc3RydWN0
IGx0ODkxMiAqbHQpCj4gPiArewo+ID4gKyAgICAgICBpbnQgcmV0Owo+ID4gKyAgICAgICB1bnNp
Z25lZCBpbnQgcmVnX3ZhbDsKPiA+ICsKPiA+ICsgICAgICAgcmV0ID0gcmVnbWFwX3JlYWQobHQt
PnJlZ21hcFtJMkNfTUFJTl0sIDB4QzEsICZyZWdfdmFsKTsKPiA+ICsgICAgICAgaWYgKHJldCkK
PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gY29ubmVjdG9yX3N0YXR1c191bmtub3duOwo+ID4g
Kwo+ID4gKyAgICAgICBpZiAocmVnX3ZhbCAmIEJJVCg3KSkKPiA+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7Cj4KPiBSZWdpc3RlciAweGMwICYgQklU
KDcpIC0gSFBEIHNpZ25hbCBhZnRlciBkZWJvdW5jZQo+IFJlZ2lzdGVyIDB4YzAgJiBCSVQoNikg
LSBIUEQgc2lnbmFsIGZvciBUWCBIUEQgcGFkCgpTbywgaWYgSSB1bmRlcnN0YW5kIHdlbGwsIEkg
bmVlZCB0byB3cml0ZSAweGMwICYgQklUKDYpIHdpdGggMSB0bwplbmFibGUgdGhlIEhQRCBwaW4u
Cj4KPiA+ICsKPiA+ICtzdGF0aWMgaW50IGx0ODkxMl9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2xpZW50LAo+ID4gKyAgICAgICAgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQo+ID4g
K3sKPiA+ICsgICAgICAgc3RhdGljIHN0cnVjdCBsdDg5MTIgKmx0Owo+ID4gKyAgICAgICBpbnQg
cmV0ID0gMDsKPiA+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJmNsaWVudC0+ZGV2Owo+
ID4gKwo+ID4gKyAgICAgICBsdCA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZihzdHJ1Y3QgbHQ4
OTEyKSwgR0ZQX0tFUk5FTCk7Cj4gPiArICAgICAgIGlmICghbHQpCj4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9NRU07Cj4gPiArCj4gPiArICAgICAgIGx0LT5kZXYgPSBkZXY7Cj4gPiAr
ICAgICAgIGx0LT5pMmNfY2xpZW50WzBdID0gY2xpZW50Owo+ID4gKyAgICAgICBsdC0+Y2FibGVf
c3RhdHVzID0gY29ubmVjdG9yX3N0YXR1c191bmtub3duOwo+ID4gKyAgICAgICBsdC0+d29ya3Eg
PSBjcmVhdGVfd29ya3F1ZXVlKCJsdDg5MTJfd29ya3EiKTsKPgo+IExvb2tpbmcgYXQgWzFdIGFu
ZCBtYXliZSBldmVuIGJldHRlciBbMl0sIEkgdGhpbmsgdGhpcyBwb2xsaW5nCj4gYXBwcm9hY2gg
aXMgdGhlIHdyb25nIHdheSB0byBnby4gQW5kIHdpdGggYWNjZXNzIHRvIGRvY3VtZW50YXRpb24s
IEkKPiB0aGluayB3ZSBzaG91bGQgYmUgYWJsZSB0byBzb3J0IHRoaXMgb3V0LgoKSSBuZWl0aGVy
IGxpa2UgdGhlIHBvbGxpbmcgYXBwcm9hY2ggdG9vLiBJIGRpZCBpdCB0byBnbyBvbiB0aGlzIGlz
c3VlLgpJIHdpbGwgdG90YWxseSByZW1vdmUgaXQgb25jZSB0aGUgSFBEIGlzc3VlIHdpbGwgYmUg
cmVzb2x2ZWQuCj4KPiBVc2luZyB0aGUgaXJxIGRyaXZlciBhcHByb2FjaCByZXF1aXJlcyB0aGUg
aW50ZXJydXB0IHBpbiB0byBiZQo+IGNvbmZpZ3VyZWQuIFBpbiA2MyBvZiB0aGUgbHQ4OTEyYiBp
cyB0aGUgSVJRIG91dHB1dCBwaW4uCj4KPiBJbiBvcmRlciB0byB0cmlnZ2VyIGludGVycnVwdHMg
YmFzZWQgb24gaXQsIHRoZSBkdC1iaW5kaW5nIHdvdWxkIG5lZWQKPiB0byBiZSB1cGRhdGVkWzNd
WzRdIGFzIHdlbGwgYXMgd2hpY2hldmVyIERUUyB5b3UncmUgdXNpbmcuCj4KClRoZSBJUlEgcGFy
dCBpcyB3b3JraW5nIHdlbGwgaW4gbXkgRFRCLiBJdCB0ZXN0IGl0IGJ5IGFkZGluZyBzb21lCmVs
ZWN0cm9uaWNzIHRvIGVtdWxhdGUgdGhlIEhQRCBwaW4gb24gdGhlIEdQSU8gZXhwYW5kZXIgd2hl
cmUgdGhlIEhQRApwaW4gaXMgbGlua2VkLgoKPgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vdG9y
dmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9h
bng3NjI1LmMjTDE3NTEKPgo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgv
YmxvYi92NS4xMS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ5NjExLmMjTDExNjAK
Pgo+IFszXSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi92NS4xMS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbG9udGl1bSxsdDk2
MTEueWFtbCNMMjcKPgo+IFs0XSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxv
Yi92NS4xMS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
bG9udGl1bSxsdDk2MTEueWFtbCNMMTQ0CgpUaGFua3MgYSBsb3QsCkFkcmllbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
