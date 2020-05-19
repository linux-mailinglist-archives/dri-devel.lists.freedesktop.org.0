Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD661D9AE1
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 17:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF128968D;
	Tue, 19 May 2020 15:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EF98968D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 15:13:00 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB74120842
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589901180;
 bh=Qtbu//gwpsRgyyl9L3XkraCEI0EULn3K3RbouB9xCeQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jpt+oYEr/qLu8YKDUQL8P9cwVuslDQk/015dkdkhmsDRvEfaZtFD4uA1yKlYIYne8
 y47NLk9GyDnv+rTz3Jeuatg8RFxszmBvD4CUBHFaLvXDWHBGCz6HCGmaM6g1RiVCJp
 2AeoGrgrAa+hzL2tngLpK22kKiZ60Pq1WRzfandA=
Received: by mail-ed1-f52.google.com with SMTP id be9so7643758edb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 08:12:59 -0700 (PDT)
X-Gm-Message-State: AOAM531YktlL6K6F4xKzPZNxo0Muq/rAXb+0o2X0vKx1JJGckGBNoWfC
 C0YC/Gf+ZvN+eTH25pGtTcueepoISN2h41XcZg==
X-Google-Smtp-Source: ABdhPJyFxb862sEE7yUUw8vzjALBePQs+s7LW5KIAbQcfYVO9A/nJbgo93p98Hnk05Kl1tbTOxD4nL6FFB/3FC4K5Eo=
X-Received: by 2002:a50:e1c5:: with SMTP id m5mr12614504edl.47.1589901178288; 
 Tue, 19 May 2020 08:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200519094045.2447940-1-enric.balletbo@collabora.com>
In-Reply-To: <20200519094045.2447940-1-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 19 May 2020 23:12:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-m67cCrrgb=Ot9gnj22Ks3qDCDFQhELMA=m0xSB9mwWQ@mail.gmail.com>
Message-ID: <CAAOTY_-m67cCrrgb=Ot9gnj22Ks3qDCDFQhELMA=m0xSB9mwWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_mt8173_hdmi_phy: Remove unnused const
 variables
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
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ15pyIMTnml6Ug6YCx5LqMIOS4i+WNiDU6NDDlr6vpgZPvvJoK
Pgo+IFRoZXJlIGFyZSBzb21lIGBzdGF0aWMgY29uc3QgdThgIHZhcmlhYmxlcyB0aGF0IGFyZSBu
b3QgdXNlZCwgdGhpcwo+IHRyaWdnZXJzIGEgd2FybmluZyBidWlsZGluZyB3aXRoIGBtYWtlIFc9
MWAsIGl0IGlzIHNhZmUgdG8gcmVtb3ZlIHRoZW0sCj4gc28gZG8gaXQgYW5kIG1ha2UgdGhlIGNv
bXBpbGVyIG1vcmUgaGFwcHkuCj4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vh
bmcuaHVAa2VybmVsLm9yZz4KCj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJy
YSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KPiAtLS0KPgo+ICAuLi4vZ3B1L2RybS9t
ZWRpYXRlay9tdGtfbXQ4MTczX2hkbWlfcGh5LmMgICAgfCA0OCAtLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0OCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19oZG1pX3BoeS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19tdDgxNzNfaGRtaV9waHkuYwo+IGluZGV4IDFjMzU3NTM3MjIzMC4u
ODI3YjkzNzg2ZmFjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
bXQ4MTczX2hkbWlfcGh5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210
ODE3M19oZG1pX3BoeS5jCj4gQEAgLTEwNyw1NCArMTA3LDYgQEAKPiAgI2RlZmluZSBSR1NfSERN
SVRYXzVUMV9FREcgICAgICAgICAgICAgKDB4ZiA8PCA0KQo+ICAjZGVmaW5lIFJHU19IRE1JVFhf
UExVR19UU1QgICAgICAgICAgICBCSVQoMCkKPgo+IC1zdGF0aWMgY29uc3QgdTggUFJFRElWWzNd
WzRdID0gewo+IC0gICAgICAgezB4MCwgMHgwLCAweDAsIDB4MH0sICAgLyogMjdNaHogKi8KPiAt
ICAgICAgIHsweDEsIDB4MSwgMHgxLCAweDF9LCAgIC8qIDc0TWh6ICovCj4gLSAgICAgICB7MHgx
LCAweDEsIDB4MSwgMHgxfSAgICAvKiAxNDhNaHogKi8KPiAtfTsKPiAtCj4gLXN0YXRpYyBjb25z
dCB1OCBUWERJVlszXVs0XSA9IHsKPiAtICAgICAgIHsweDMsIDB4MywgMHgzLCAweDJ9LCAgIC8q
IDI3TWh6ICovCj4gLSAgICAgICB7MHgyLCAweDEsIDB4MSwgMHgxfSwgICAvKiA3NE1oeiAqLwo+
IC0gICAgICAgezB4MSwgMHgwLCAweDAsIDB4MH0gICAgLyogMTQ4TWh6ICovCj4gLX07Cj4gLQo+
IC1zdGF0aWMgY29uc3QgdTggRkJLU0VMWzNdWzRdID0gewo+IC0gICAgICAgezB4MSwgMHgxLCAw
eDEsIDB4MX0sICAgLyogMjdNaHogKi8KPiAtICAgICAgIHsweDEsIDB4MCwgMHgxLCAweDF9LCAg
IC8qIDc0TWh6ICovCj4gLSAgICAgICB7MHgxLCAweDAsIDB4MSwgMHgxfSAgICAvKiAxNDhNaHog
Ki8KPiAtfTsKPiAtCj4gLXN0YXRpYyBjb25zdCB1OCBGQktESVZbM11bNF0gPSB7Cj4gLSAgICAg
ICB7MTksIDI0LCAyOSwgMTl9LCAgICAgICAvKiAyN01oeiAqLwo+IC0gICAgICAgezE5LCAyNCwg
MTQsIDE5fSwgICAgICAgLyogNzRNaHogKi8KPiAtICAgICAgIHsxOSwgMjQsIDE0LCAxOX0gICAg
ICAgIC8qIDE0OE1oeiAqLwo+IC19Owo+IC0KPiAtc3RhdGljIGNvbnN0IHU4IERJVkVOWzNdWzRd
ID0gewo+IC0gICAgICAgezB4MiwgMHgxLCAweDEsIDB4Mn0sICAgLyogMjdNaHogKi8KPiAtICAg
ICAgIHsweDIsIDB4MiwgMHgyLCAweDJ9LCAgIC8qIDc0TWh6ICovCj4gLSAgICAgICB7MHgyLCAw
eDIsIDB4MiwgMHgyfSAgICAvKiAxNDhNaHogKi8KPiAtfTsKPiAtCj4gLXN0YXRpYyBjb25zdCB1
OCBIVFBMTEJQWzNdWzRdID0gewo+IC0gICAgICAgezB4YywgMHhjLCAweDgsIDB4Y30sICAgLyog
MjdNaHogKi8KPiAtICAgICAgIHsweGMsIDB4ZiwgMHhmLCAweGN9LCAgIC8qIDc0TWh6ICovCj4g
LSAgICAgICB7MHhjLCAweGYsIDB4ZiwgMHhjfSAgICAvKiAxNDhNaHogKi8KPiAtfTsKPiAtCj4g
LXN0YXRpYyBjb25zdCB1OCBIVFBMTEJDWzNdWzRdID0gewo+IC0gICAgICAgezB4MiwgMHgzLCAw
eDMsIDB4Mn0sICAgLyogMjdNaHogKi8KPiAtICAgICAgIHsweDIsIDB4MywgMHgzLCAweDJ9LCAg
IC8qIDc0TWh6ICovCj4gLSAgICAgICB7MHgyLCAweDMsIDB4MywgMHgyfSAgICAvKiAxNDhNaHog
Ki8KPiAtfTsKPiAtCj4gLXN0YXRpYyBjb25zdCB1OCBIVFBMTEJSWzNdWzRdID0gewo+IC0gICAg
ICAgezB4MSwgMHgxLCAweDAsIDB4MX0sICAgLyogMjdNaHogKi8KPiAtICAgICAgIHsweDEsIDB4
MiwgMHgyLCAweDF9LCAgIC8qIDc0TWh6ICovCj4gLSAgICAgICB7MHgxLCAweDIsIDB4MiwgMHgx
fSAgICAvKiAxNDhNaHogKi8KPiAtfTsKPiAtCj4gIHN0YXRpYyBpbnQgbXRrX2hkbWlfcGxsX3By
ZXBhcmUoc3RydWN0IGNsa19odyAqaHcpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBtdGtfaGRtaV9w
aHkgKmhkbWlfcGh5ID0gdG9fbXRrX2hkbWlfcGh5KGh3KTsKPiAtLQo+IDIuMjYuMgo+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
