Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926A214920
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jul 2020 01:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3C96EBE8;
	Sat,  4 Jul 2020 23:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29226EBE8
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 23:21:12 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20291208B8
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 23:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593904872;
 bh=jjLI1NVY4paYHUmIojobSDVFBbLlkvJZnfkgPCCD+YU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yobnRxgPmq/BD478RO0cvpD+xb/0uvejoPSdBkq3UdFeQZXlXNWCbRavLRi7G5jXN
 sQzEMSW1ZjA5FGsVKMmotrnmqQjs3veB0rUTXS3WX/0QqQ3GXePLVhnFNp/qvg6VcM
 F6HZF0bXrQC8k6Ip8al9F+afQl6w//5t6MLwFunM=
Received: by mail-ej1-f49.google.com with SMTP id a1so38528748ejg.12
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 16:21:12 -0700 (PDT)
X-Gm-Message-State: AOAM533n/HY/nW/kb/n40MS7N3CHv1wXAp2eC3sSv+QD8WqYexnJtFj4
 Wr+ttmedRoeS42rlJFT5c7DNmycMx55Hl6qT3w==
X-Google-Smtp-Source: ABdhPJzSJ1ZWbwUWJLnVTcfoYRxGdqUMKJzrzedJHWFE7nqUV7raFr7/mAlCkHNtCxHv7UjgUk/yH0v2MF8C9pKav+U=
X-Received: by 2002:a17:906:1e83:: with SMTP id
 e3mr23006232ejj.7.1593904870633; 
 Sat, 04 Jul 2020 16:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200615203108.786083-1-enric.balletbo@collabora.com>
 <20200615203108.786083-4-enric.balletbo@collabora.com>
In-Reply-To: <20200615203108.786083-4-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Jul 2020 07:20:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_89jeRvdv01batww9+bY0XWabvQ8xnEOEVCgsPimJ6WWg@mail.gmail.com>
Message-ID: <CAAOTY_89jeRvdv01batww9+bY0XWabvQ8xnEOEVCgsPimJ6WWg@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 3/7] drm/mediatek: mtk_dsi: Rename bridge to
 next_bridge
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
Pgo+IFRoaXMgaXMgcmVhbGx5IGEgY29zbWV0aWMgY2hhbmdlIGp1c3QgdG8gbWFrZSBhIGJpdCBt
b3JlIHJlYWRhYmxlIHRoZQo+IGNvZGUgYWZ0ZXIgY29udmVydCB0aGUgZHJpdmVyIHRvIGRybV9i
cmlkZ2UuIFRoZSBicmlkZ2UgdmFyaWFibGUgbmFtZQo+IHdpbGwgYmUgdXNlZCBieSB0aGUgZW5j
b2RlciBkcm1fYnJpZGdlLCBhbmQgdGhlIGNoYWluZWQgYnJpZGdlIHdpbGwgYmUKPiBuYW1lZCBu
ZXh0X2JyaWRnZS4KPgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4K
ClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVu
a3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMu
YmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IEFja2VkLWJ5OiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5r
dWFuZy5odUBrZXJuZWwub3JnPgo+IC0tLQo+Cj4gQ2hhbmdlcyBpbiB2NDogTm9uZQo+IENoYW5n
ZXMgaW4gdjM6Cj4gLSBSZXBsYWNlIHMvYnJpZGdlL25leHQgYnJpZGdlLyBmb3IgY29tbWVudC4g
KExhdXJlbnQgUGluY2hhcnQpCj4KPiBDaGFuZ2VzIGluIHYyOiBOb25lCj4KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDExICsrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMKPiBpbmRleCAyNzBiZjIyYzk4ZmViLi4yMDhmNDliZjE0YTAxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTE4Myw3ICsxODMsNyBAQCBzdHJ1Y3Qg
bXRrX2RzaSB7Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2VuY29kZXIgZW5jb2RlcjsKPiAgICAgICAg
IHN0cnVjdCBkcm1fY29ubmVjdG9yIGNvbm47Cj4gICAgICAgICBzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbDsKPiAtICAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2U7Cj4gKyAgICAgICBzdHJ1
Y3QgZHJtX2JyaWRnZSAqbmV4dF9icmlkZ2U7Cj4gICAgICAgICBzdHJ1Y3QgcGh5ICpwaHk7Cj4K
PiAgICAgICAgIHZvaWQgX19pb21lbSAqcmVnczsKPiBAQCAtODk0LDkgKzg5NCwxMCBAQCBzdGF0
aWMgaW50IG10a19kc2lfY3JlYXRlX2Nvbm5fZW5jKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0
cnVjdCBtdGtfZHNpICpkc2kpCj4gICAgICAgICAgKi8KPiAgICAgICAgIGRzaS0+ZW5jb2Rlci5w
b3NzaWJsZV9jcnRjcyA9IDE7Cj4KPiAtICAgICAgIC8qIElmIHRoZXJlJ3MgYSBicmlkZ2UsIGF0
dGFjaCB0byBpdCBhbmQgbGV0IGl0IGNyZWF0ZSB0aGUgY29ubmVjdG9yICovCj4gLSAgICAgICBp
ZiAoZHNpLT5icmlkZ2UpIHsKPiAtICAgICAgICAgICAgICAgcmV0ID0gZHJtX2JyaWRnZV9hdHRh
Y2goJmRzaS0+ZW5jb2RlciwgZHNpLT5icmlkZ2UsIE5VTEwsIDApOwo+ICsgICAgICAgLyogSWYg
dGhlcmUncyBhIG5leHQgYnJpZGdlLCBhdHRhY2ggdG8gaXQgYW5kIGxldCBpdCBjcmVhdGUgdGhl
IGNvbm5lY3RvciAqLwo+ICsgICAgICAgaWYgKGRzaS0+bmV4dF9icmlkZ2UpIHsKPiArICAgICAg
ICAgICAgICAgcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goJmRzaS0+ZW5jb2RlciwgZHNpLT5uZXh0
X2JyaWRnZSwgTlVMTCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
MCk7Cj4gICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBEUk1fRVJST1IoIkZhaWxlZCB0byBhdHRhY2ggYnJpZGdlIHRvIGRybVxuIik7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgZ290byBlcnJfZW5jb2Rlcl9jbGVhbnVwOwo+IEBAIC0xMTc3LDcg
KzExNzgsNyBAQCBzdGF0aWMgaW50IG10a19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiAgICAgICAgIH0KPgo+ICAgICAgICAgcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxf
b3JfYnJpZGdlKGRldi0+b2Zfbm9kZSwgMCwgMCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmZHNpLT5wYW5lbCwgJmRzaS0+YnJpZGdlKTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZHNpLT5wYW5lbCwgJmRzaS0+bmV4dF9i
cmlkZ2UpOwo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgZ290byBlcnJfdW5y
ZWdpc3Rlcl9ob3N0Owo+Cj4gLS0KPiAyLjI3LjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
