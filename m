Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D716B214931
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jul 2020 01:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8C26EBEA;
	Sat,  4 Jul 2020 23:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EC66EBEA
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 23:42:40 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF3AF214F1
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 23:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593906160;
 bh=tKeXckq/cljxhi5PiM5Dr9pzZi/BIbGaNVQdbwe/LTw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XOTnF7WFbN+I3+4XbpNUfQdU9F2XN8kWx2sQS96lM0g+xtAJffleOtqFCHmgYwUyw
 8mmAP1WBG857Srm8CXxA6AQXXLRl+bAa+Cek+IuM9wmJz8JvEUGQYHKSM7KUshNJ6j
 N4X77ofJAoIvqifk6YTo2zEE5epKUYsfe2G1PyoQ=
Received: by mail-ej1-f45.google.com with SMTP id p20so38564114ejd.13
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 16:42:39 -0700 (PDT)
X-Gm-Message-State: AOAM533srdyM/UPnyH8hV4k0tZEPOmot/z7bXDIb2IF7No+oi6kCiFtY
 WUV86yl5bMdK4RbQ+IYJS+DdwpqtNUsNCtE8ew==
X-Google-Smtp-Source: ABdhPJwfuIFm+ZpQSysHQPpOfHT3QfoveqSeIAFpPPao09rGA3nmGZIPzTn+hkhaV5sDiarPLt0IrUMCan35uDuvI3A=
X-Received: by 2002:a17:906:1e83:: with SMTP id
 e3mr23048914ejj.7.1593906158358; 
 Sat, 04 Jul 2020 16:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200615203108.786083-1-enric.balletbo@collabora.com>
 <20200615203108.786083-6-enric.balletbo@collabora.com>
In-Reply-To: <20200615203108.786083-6-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Jul 2020 07:42:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9pLOMSx+8YzP6YQFJM+rqjoaJUzg3Y8xf3+GqYJCCf7Q@mail.gmail.com>
Message-ID: <CAAOTY_9pLOMSx+8YzP6YQFJM+rqjoaJUzg3Y8xf3+GqYJCCf7Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 5/7] drm/mediatek: mtk_dsi: Use simple encoder
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
 Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ25pyIMTbml6Ug6YCx5LqMIOS4iuWNiDQ6MzHlr6vpgZPvvJoK
Pgo+IFRoZSBtdGtfZHNpIGRyaXZlciB1c2VzIGFuIGVtcHR5IGltcGxlbWVudGF0aW9uIGZvciBp
dHMgZW5jb2Rlci4gUmVwbGFjZQo+IHRoZSBjb2RlIHdpdGggdGhlIGdlbmVyaWMgc2ltcGxlIGVu
Y29kZXIuCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5o
dS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5n
LgoKPgo+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxl
dGJvQGNvbGxhYm9yYS5jb20+Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4KPiAtLS0KPgo+IENoYW5nZXMgaW4gdjQ6IE5vbmUKPiBDaGFuZ2VzIGlu
IHYzOiBOb25lCj4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMgfCAxMyArKy0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jCj4gaW5kZXggNzU5YTViMzdmYjRkMi4uZTAyZDE2YTA4NmFjMCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYwo+IEBAIC03ODksMTUgKzc4OSw2IEBAIHN0YXRpYyB2b2lkIG10
a19vdXRwdXRfZHNpX2Rpc2FibGUoc3RydWN0IG10a19kc2kgKmRzaSkKPiAgICAgICAgIGRzaS0+
ZW5hYmxlZCA9IGZhbHNlOwo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgbXRrX2RzaV9lbmNvZGVyX2Rl
c3Ryb3koc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+IC17Cj4gLSAgICAgICBkcm1fZW5j
b2Rlcl9jbGVhbnVwKGVuY29kZXIpOwo+IC19Cj4gLQo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9lbmNvZGVyX2Z1bmNzIG10a19kc2lfZW5jb2Rlcl9mdW5jcyA9IHsKPiAtICAgICAgIC5kZXN0
cm95ID0gbXRrX2RzaV9lbmNvZGVyX2Rlc3Ryb3ksCj4gLX07Cj4gLQo+ICBzdGF0aWMgaW50IG10
a19kc2lfY3JlYXRlX2Nvbm5fZW5jKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBtdGtf
ZHNpICpkc2kpOwo+ICBzdGF0aWMgdm9pZCBtdGtfZHNpX2Rlc3Ryb3lfY29ubl9lbmMoc3RydWN0
IG10a19kc2kgKmRzaSk7Cj4KPiBAQCAtMTEyNyw4ICsxMTE4LDggQEAgc3RhdGljIGludCBtdGtf
ZHNpX2VuY29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgbXRrX2RzaSAq
ZHNpKQo+ICB7Cj4gICAgICAgICBpbnQgcmV0Owo+Cj4gLSAgICAgICByZXQgPSBkcm1fZW5jb2Rl
cl9pbml0KGRybSwgJmRzaS0+ZW5jb2RlciwgJm10a19kc2lfZW5jb2Rlcl9mdW5jcywKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX01PREVfRU5DT0RFUl9EU0ksIE5VTEwpOwo+
ICsgICAgICAgcmV0ID0gZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoZHJtLCAmZHNpLT5lbmNvZGVy
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX01PREVfRU5DT0RF
Ul9EU0kpOwo+ICAgICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICBEUk1fRVJST1Io
IkZhaWxlZCB0byBlbmNvZGVyIGluaXQgdG8gZHJtXG4iKTsKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsKPiAtLQo+IDIuMjcuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
