Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FFA1C17AC
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 16:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC946ECB8;
	Fri,  1 May 2020 14:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0296ECB8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 14:26:53 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C498E24957
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 14:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588343213;
 bh=GWJwkvt0+8TQNxyG05ofo9WUCas5EChknR0I2IxYgog=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J6GWbaettKOvk+oK9TnS51EkolS6QgEhWLhlRy8UMkMDxWBHVuBv0+IIaYp3/dbh3
 HltRsMIZPGLN1o4ykQmmop96R4hv/4qpB/f5wZtLIdF6am4OujLdcpaQk45OAm3HnP
 29dXCjiaGEX2RTL6bdKguIrkBNsgDAXISfnoZx/o=
Received: by mail-ed1-f51.google.com with SMTP id k22so7381352eds.6
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 07:26:52 -0700 (PDT)
X-Gm-Message-State: AGi0PuYQi4VOPGfrMmhOwIq5u4xZGZSDFHHyR+T7d/i0cTil3HNmiCpA
 6sVOzwlNY7M71GQMgK4VvpHKO3QSHiQTpsgEIQ==
X-Google-Smtp-Source: APiQypJN7wZ4G/nD2HBUrq+csPQL5onomudMxtaCzeqVlUIAwpqC80OOjadus0NF19FGaH+HaaWVunxmRN799sICD4s=
X-Received: by 2002:aa7:dcd7:: with SMTP id w23mr3810850edu.300.1588343211141; 
 Fri, 01 May 2020 07:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200417150614.2631786-1-enric.balletbo@collabora.com>
 <20200417150614.2631786-8-enric.balletbo@collabora.com>
In-Reply-To: <20200417150614.2631786-8-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 1 May 2020 22:26:37 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8uWP80ZMO5ZQGLJ5YLFZcmGjZwc33Hi_oXsCPj5Yr89A@mail.gmail.com>
Message-ID: <CAAOTY_8uWP80ZMO5ZQGLJ5YLFZcmGjZwc33Hi_oXsCPj5Yr89A@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] drm/mediatek: mtk_dsi: Create connector for bridges
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
b3JhLmNvbT4g5pa8IDIwMjDlubQ05pyIMTfml6Ug6YCx5LqUIOS4i+WNiDExOjA25a+r6YGT77ya
Cj4KPiBVc2UgdGhlIGRybV9icmlkZ2VfY29ubmVjdG9yIGhlbHBlciB0byBjcmVhdGUgYSBjb25u
ZWN0b3IgZm9yIHBpcGVsaW5lcwo+IHRoYXQgdXNlIGRybV9icmlkZ2UuIFRoaXMgYWxsb3dzIHNw
bGl0dGluZyBjb25uZWN0b3Igb3BlcmF0aW9ucyBhY3Jvc3MKPiBtdWx0aXBsZSBicmlkZ2VzIHdo
ZW4gbmVjZXNzYXJ5LCBpbnN0ZWFkIG9mIGhhdmluZyB0aGUgbGFzdCBicmlkZ2UgaW4KPiB0aGUg
Y2hhaW4gY3JlYXRpbmcgdGhlIGNvbm5lY3RvciBhbmQgaGFuZGxpbmcgYWxsIGNvbm5lY3RvciBv
cGVyYXRpb25zCj4gaW50ZXJuYWxseS4KPgo+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJv
IGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4KPiBDaGFuZ2Vz
IGluIHYzOgo+IC0gTW92ZSB0aGUgYnJpZGdlLnR5cGUgbGluZSB0byB0aGUgcGF0Y2ggdGhhdCBh
ZGRzIGRybV9icmlkZ2Ugc3VwcG9ydC4gKExhdXJlbnQgUGluY2hhcnQpCj4KPiBDaGFuZ2VzIGlu
IHYyOiBOb25lCj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDEzICsr
KysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IGluZGV4IDE1NzA5N2M2M2Iy
My4uODVmNzZiMDFhZTRkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAg
LTE3LDYgKzE3LDcgQEAKPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+Cj4g
ICNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9icmlkZ2Vf
Y29ubmVjdG9yLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX21pcGlfZHNpLmg+Cj4gICNpbmNsdWRl
IDxkcm0vZHJtX29mLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3BhbmVsLmg+Cj4gQEAgLTE4Myw2
ICsxODQsNyBAQCBzdHJ1Y3QgbXRrX2RzaSB7Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2VuY29kZXIg
ZW5jb2RlcjsKPiAgICAgICAgIHN0cnVjdCBkcm1fYnJpZGdlIGJyaWRnZTsKPiAgICAgICAgIHN0
cnVjdCBkcm1fYnJpZGdlICpuZXh0X2JyaWRnZTsKPiArICAgICAgIHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3I7Cj4gICAgICAgICBzdHJ1Y3QgcGh5ICpwaHk7Cj4KPiAgICAgICAgIHZv
aWQgX19pb21lbSAqcmVnczsKPiBAQCAtOTc3LDEwICs5NzksMTkgQEAgc3RhdGljIGludCBtdGtf
ZHNpX2VuY29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgbXRrX2RzaSAq
ZHNpKQo+ICAgICAgICAgICovCj4gICAgICAgICBkc2ktPmVuY29kZXIucG9zc2libGVfY3J0Y3Mg
PSAxOwo+Cj4gLSAgICAgICByZXQgPSBkcm1fYnJpZGdlX2F0dGFjaCgmZHNpLT5lbmNvZGVyLCAm
ZHNpLT5icmlkZ2UsIE5VTEwsIDApOwo+ICsgICAgICAgcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2go
JmRzaS0+ZW5jb2RlciwgJmRzaS0+YnJpZGdlLCBOVUxMLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SKTsKPiAgICAgICAgIGlm
IChyZXQpCj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX2NsZWFudXBfZW5jb2RlcjsKPgo+ICsg
ICAgICAgZHNpLT5jb25uZWN0b3IgPSBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9pbml0KGRybSwgJmRz
aS0+ZW5jb2Rlcik7Cj4gKyAgICAgICBpZiAoSVNfRVJSKGRzaS0+Y29ubmVjdG9yKSkgewo+ICsg
ICAgICAgICAgICAgICBEUk1fRVJST1IoIlVuYWJsZSB0byBjcmVhdGUgYnJpZGdlIGNvbm5lY3Rv
clxuIik7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoZHNpLT5jb25uZWN0b3IpOwo+
ICsgICAgICAgICAgICAgICBnb3RvIGVycl9jbGVhbnVwX2VuY29kZXI7Cj4gKyAgICAgICB9Cj4g
KyAgICAgICBkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKGRzaS0+Y29ubmVjdG9yLCAmZHNp
LT5lbmNvZGVyKTsKPiArCgpJJ20gbm90IHZlcnkgY2xlYXIgYWJvdXQgaG93IGJyaWdlLWNvbm5l
Y3RvciB3b3JrcywgYnV0IHdoeSBjb25uZWN0b3IKZG9lcyBub3QgYXR0YWNoIHRvIHBhbmVsPwoK
UmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gICAgICAgICByZXR1cm4gMDsKPgo+ICBlcnJfY2xlYW51
cF9lbmNvZGVyOgo+IC0tCj4gMi4yNS4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
