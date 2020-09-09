Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA4263918
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 00:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537106F55F;
	Wed,  9 Sep 2020 22:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50F46F55F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 22:34:01 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07FB1221E7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 22:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599690841;
 bh=qn7F9kIfrQDK9ilpICfJwnlqi88jogiZeINUWgtswHo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iMi/HJEhuhW4pM1AwbvKOq53FSk1YcujGZPO1K9TA6pNwJS8gPW9uq4uB1TRnkz0F
 wPnYcbHWC65NpQ2jbU0bpRveJHozE3zgQXYJLBjYDNQj9MITMfR3fnPK2/CTdHi1Az
 C2sv9nmC8QuACfs+p4/pitJoXrx01d76ieNUkY0c=
Received: by mail-ej1-f53.google.com with SMTP id j11so5896917ejk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 15:34:00 -0700 (PDT)
X-Gm-Message-State: AOAM533PAqirKiPiRWiBzF3ExuslVg1jj+oDo2QXx5whE1RzVqemveUN
 T3zm/gte/hQA9v8f5Ul7XYMqo0GqacynMuOuQQ==
X-Google-Smtp-Source: ABdhPJziy8hMosSfpL73I0q786HLEcsVS9kNOqzP/Nfn7KJ9FugubRKZT1YW+F3eOFoLVx5h6kQovjh9Mn2m2hErytY=
X-Received: by 2002:a17:906:a256:: with SMTP id
 bi22mr5766251ejb.375.1599690839500; 
 Wed, 09 Sep 2020 15:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200826085317.681385-1-enric.balletbo@collabora.com>
 <20200826085317.681385-2-enric.balletbo@collabora.com>
In-Reply-To: <20200826085317.681385-2-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 10 Sep 2020 06:33:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-bix-mpn9rGmU0KGuByOJhG3oQQNS7w28oGdqDr_m4LQ@mail.gmail.com>
Message-ID: <CAAOTY_-bix-mpn9rGmU0KGuByOJhG3oQQNS7w28oGdqDr_m4LQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 1/2] drm/mediatek: mtk_dpi: Rename bridge to
 next_bridge
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>
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
 boris.brezillon@collabora.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEFuZHJ6ZWogJiBOZWlsOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0
Ym9AY29sbGFib3JhLmNvbT4g5pa8IDIwMjDlubQ45pyIMjbml6Ug6YCx5LiJIOS4i+WNiDQ6NTPl
r6vpgZPvvJoKPgo+IFRoaXMgaXMgcmVhbGx5IGEgY29zbWV0aWMgY2hhbmdlIGp1c3QgdG8gbWFr
ZSBhIGJpdCBtb3JlIHJlYWRhYmxlIHRoZQo+IGNvZGUgYWZ0ZXIgY29udmVydCB0aGUgZHJpdmVy
IHRvIGRybV9icmlkZ2UuIFRoZSBicmlkZ2UgdmFyaWFibGUgbmFtZQo+IHdpbGwgYmUgdXNlZCBi
eSB0aGUgZW5jb2RlciBkcm1fYnJpZGdlLCBhbmQgdGhlIGNoYWluZWQgYnJpZGdlIHdpbGwgYmUK
PiBuYW1lZCBuZXh0X2JyaWRnZS4KClRoaXMgaXMgYSBEUk0tYnJpZGdlIHJlbGF0ZWQgcGF0Y2gs
IGhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgaXQ/CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFJl
dmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJv
cmEuY29tPgo+IC0tLQo+Cj4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+Cj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHBpLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBp
LmMKPiBpbmRleCBkNGYwZmI3YWQzMTIuLmY3MzcyZGJkYWMwZSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcGkuYwo+IEBAIC02NCw3ICs2NCw3IEBAIGVudW0gbXRrX2RwaV9vdXRfY29s
b3JfZm9ybWF0IHsKPiAgc3RydWN0IG10a19kcGkgewo+ICAgICAgICAgc3RydWN0IG10a19kZHBf
Y29tcCBkZHBfY29tcDsKPiAgICAgICAgIHN0cnVjdCBkcm1fZW5jb2RlciBlbmNvZGVyOwo+IC0g
ICAgICAgc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsKPiArICAgICAgIHN0cnVjdCBkcm1fYnJp
ZGdlICpuZXh0X2JyaWRnZTsKPiAgICAgICAgIHZvaWQgX19pb21lbSAqcmVnczsKPiAgICAgICAg
IHN0cnVjdCBkZXZpY2UgKmRldjsKPiAgICAgICAgIHN0cnVjdCBjbGsgKmVuZ2luZV9jbGs7Cj4g
QEAgLTYxMCw3ICs2MTAsNyBAQCBzdGF0aWMgaW50IG10a19kcGlfYmluZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiAgICAgICAgIC8qIEN1
cnJlbnRseSBEUEkwIGlzIGZpeGVkIHRvIGJlIGRyaXZlbiBieSBPVkwxICovCj4gICAgICAgICBk
cGktPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPSBCSVQoMSk7Cj4KPiAtICAgICAgIHJldCA9IGRy
bV9icmlkZ2VfYXR0YWNoKCZkcGktPmVuY29kZXIsIGRwaS0+YnJpZGdlLCBOVUxMLCAwKTsKPiAr
ICAgICAgIHJldCA9IGRybV9icmlkZ2VfYXR0YWNoKCZkcGktPmVuY29kZXIsIGRwaS0+bmV4dF9i
cmlkZ2UsIE5VTEwsIDApOwo+ICAgICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICBk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhdHRhY2ggYnJpZGdlOiAlZFxuIiwgcmV0KTsKPiAgICAg
ICAgICAgICAgICAgZ290byBlcnJfY2xlYW51cDsKPiBAQCAtNzcwLDExICs3NzAsMTEgQEAgc3Rh
dGljIGludCBtdGtfZHBpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAg
ICAgICB9Cj4KPiAgICAgICAgIHJldCA9IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShkZXYt
Pm9mX25vZGUsIDAsIDAsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTlVMTCwgJmRwaS0+YnJpZGdlKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBOVUxMLCAmZHBpLT5uZXh0X2JyaWRnZSk7Cj4gICAgICAgICBpZiAocmV0KQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Cj4gLSAgICAgICBkZXZfaW5mbyhkZXYsICJG
b3VuZCBicmlkZ2Ugbm9kZTogJXBPRlxuIiwgZHBpLT5icmlkZ2UtPm9mX25vZGUpOwo+ICsgICAg
ICAgZGV2X2luZm8oZGV2LCAiRm91bmQgYnJpZGdlIG5vZGU6ICVwT0ZcbiIsIGRwaS0+bmV4dF9i
cmlkZ2UtPm9mX25vZGUpOwo+Cj4gICAgICAgICBjb21wX2lkID0gbXRrX2RkcF9jb21wX2dldF9p
ZChkZXYtPm9mX25vZGUsIE1US19EUEkpOwo+ICAgICAgICAgaWYgKGNvbXBfaWQgPCAwKSB7Cj4g
LS0KPiAyLjI4LjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
