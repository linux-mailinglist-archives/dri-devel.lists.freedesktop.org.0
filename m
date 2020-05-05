Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5B51C563C
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 15:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202EE6E0D0;
	Tue,  5 May 2020 13:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECFF6E0D0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 13:05:56 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51B3E20735
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 13:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588683956;
 bh=dvbRX7EeM06dsl2ZOfOT5WBgv/T4PM2ppoNNZuX4hm8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=neqboCczN+Cdz09ZuDmJ5SDMNim2FB9HO7s1Q9yYJ3/NilYj5E454ePytgS+Asq6w
 aoC5r10DK1ND17IpN/vWZNpYfjligx54R/u3Wiew9ALEj/kS/uW1r59UOgv5Ivm9AI
 xbI9Syh3SVWVXuDtwl2GIBYcVCLcnkR2I632xPaI=
Received: by mail-ed1-f41.google.com with SMTP id l3so1670881edq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 06:05:56 -0700 (PDT)
X-Gm-Message-State: AGi0PuY6Ywmya+SKdSXY4FKyXMQTdi4Gcw7kJOo+vZTGgP/p4KCgxsHz
 xfea6uuu+WvZhBtO7rmzIg51FVSCKuvu2smhqQ==
X-Google-Smtp-Source: APiQypIQFhovoglRSXHegx9gEyfNNxTtVpJjyKZpJgiRmyVTk2jNz+plbrT0C7AXa4PJSMiG3lL/djzaOe3llc15X/Y=
X-Received: by 2002:aa7:dcd7:: with SMTP id w23mr2569139edu.300.1588683954729; 
 Tue, 05 May 2020 06:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200504141408.60877-1-enric.balletbo@collabora.com>
 <20200504141408.60877-2-enric.balletbo@collabora.com>
In-Reply-To: <20200504141408.60877-2-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 5 May 2020 21:05:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8bOAW-8-8v-=S2qBrdG-dSAjf9WMWON+VHk4EKrQG7XQ@mail.gmail.com>
Message-ID: <CAAOTY_8bOAW-8-8v-=S2qBrdG-dSAjf9WMWON+VHk4EKrQG7XQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/mediatek: mtk_dpi: Rename bridge to next_bridge
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
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ15pyINOaXpSDpgLHkuIAg5LiL5Y2IMTA6MTTlr6vpgZPvvJoK
Pgo+IFRoaXMgaXMgcmVhbGx5IGEgY29zbWV0aWMgY2hhbmdlIGp1c3QgdG8gbWFrZSBhIGJpdCBt
b3JlIHJlYWRhYmxlIHRoZQo+IGNvZGUgYWZ0ZXIgY29udmVydCB0aGUgZHJpdmVyIHRvIGRybV9i
cmlkZ2UuIFRoZSBicmlkZ2UgdmFyaWFibGUgbmFtZQo+IHdpbGwgYmUgdXNlZCBieSB0aGUgZW5j
b2RlciBkcm1fYnJpZGdlLCBhbmQgdGhlIGNoYWluZWQgYnJpZGdlIHdpbGwgYmUKPiBuYW1lZCBu
ZXh0X2JyaWRnZS4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2Vy
bmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJp
Yy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+IC0tLQo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBpLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiBp
bmRleCA3ZmJmYTk1YmFiMDkuLjcxMTIxMjVkYzNkMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcGkuYwo+IEBAIC02MSw3ICs2MSw3IEBAIGVudW0gbXRrX2RwaV9vdXRfY29sb3JfZm9y
bWF0IHsKPiAgc3RydWN0IG10a19kcGkgewo+ICAgICAgICAgc3RydWN0IG10a19kZHBfY29tcCBk
ZHBfY29tcDsKPiAgICAgICAgIHN0cnVjdCBkcm1fZW5jb2RlciBlbmNvZGVyOwo+IC0gICAgICAg
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsKPiArICAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpu
ZXh0X2JyaWRnZTsKPiAgICAgICAgIHZvaWQgX19pb21lbSAqcmVnczsKPiAgICAgICAgIHN0cnVj
dCBkZXZpY2UgKmRldjsKPiAgICAgICAgIHN0cnVjdCBjbGsgKmVuZ2luZV9jbGs7Cj4gQEAgLTYw
Nyw3ICs2MDcsNyBAQCBzdGF0aWMgaW50IG10a19kcGlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiAgICAgICAgIC8qIEN1cnJlbnRs
eSBEUEkwIGlzIGZpeGVkIHRvIGJlIGRyaXZlbiBieSBPVkwxICovCj4gICAgICAgICBkcGktPmVu
Y29kZXIucG9zc2libGVfY3J0Y3MgPSBCSVQoMSk7Cj4KPiAtICAgICAgIHJldCA9IGRybV9icmlk
Z2VfYXR0YWNoKCZkcGktPmVuY29kZXIsIGRwaS0+YnJpZGdlLCBOVUxMLCAwKTsKPiArICAgICAg
IHJldCA9IGRybV9icmlkZ2VfYXR0YWNoKCZkcGktPmVuY29kZXIsIGRwaS0+bmV4dF9icmlkZ2Us
IE5VTEwsIDApOwo+ICAgICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICBkZXZfZXJy
KGRldiwgIkZhaWxlZCB0byBhdHRhY2ggYnJpZGdlOiAlZFxuIiwgcmV0KTsKPiAgICAgICAgICAg
ICAgICAgZ290byBlcnJfY2xlYW51cDsKPiBAQCAtNzQ3LDExICs3NDcsMTEgQEAgc3RhdGljIGlu
dCBtdGtfZHBpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICB9
Cj4KPiAgICAgICAgIHJldCA9IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShkZXYtPm9mX25v
ZGUsIDAsIDAsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVM
TCwgJmRwaS0+YnJpZGdlKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBOVUxMLCAmZHBpLT5uZXh0X2JyaWRnZSk7Cj4gICAgICAgICBpZiAocmV0KQo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Owo+Cj4gLSAgICAgICBkZXZfaW5mbyhkZXYsICJGb3VuZCBi
cmlkZ2Ugbm9kZTogJXBPRlxuIiwgZHBpLT5icmlkZ2UtPm9mX25vZGUpOwo+ICsgICAgICAgZGV2
X2luZm8oZGV2LCAiRm91bmQgYnJpZGdlIG5vZGU6ICVwT0ZcbiIsIGRwaS0+bmV4dF9icmlkZ2Ut
Pm9mX25vZGUpOwo+Cj4gICAgICAgICBjb21wX2lkID0gbXRrX2RkcF9jb21wX2dldF9pZChkZXYt
Pm9mX25vZGUsIE1US19EUEkpOwo+ICAgICAgICAgaWYgKGNvbXBfaWQgPCAwKSB7Cj4gLS0KPiAy
LjI2LjIKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
