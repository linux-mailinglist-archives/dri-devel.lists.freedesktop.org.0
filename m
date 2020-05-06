Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EF91C715E
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 15:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F1389CB3;
	Wed,  6 May 2020 13:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7576789CB3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 13:06:29 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 139E720882
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 13:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588770389;
 bh=ATHyH8IAOOsseNmBMuvH1bf7K+ZrPk88T3wrysHsvGo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nDhpwgGwrJRfIBy7r2ksIqvQKoAT+kJNfZnce9bdk2GF3cqQReLYpUCsgE+FSKx1t
 cHsExvLIyx91KR0wsLbxQxLj8iNOm5dYDDL1eIvQAoEj7cy3EWsuQcM9x3c7w6AkjZ
 BbBhm0kJjfiehpFPVj5HH6tjeIFPoIvbJ6QteoQk=
Received: by mail-ej1-f50.google.com with SMTP id a2so1264872ejx.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 06:06:29 -0700 (PDT)
X-Gm-Message-State: AGi0PuaGRE0kz17ErOVr4b2cluzjcIuetA7KY3tc3jBTOYoxI1AP/VfD
 dj+sCOtHz8cYWJpQbouEphNx4a0MCdwOhMScKg==
X-Google-Smtp-Source: APiQypJOTbmWiSdzVNGly6SSLaZh9jOGdF2PgGiwlRXhJuZC2XmN36POei/eZpRmaP/4PMMLclDtYH7GC0RLkw+m2ik=
X-Received: by 2002:a17:906:31d7:: with SMTP id
 f23mr7140816ejf.118.1588770387409; 
 Wed, 06 May 2020 06:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200506124255.9477-1-bernard@vivo.com>
In-Reply-To: <20200506124255.9477-1-bernard@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 6 May 2020 21:06:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9HjWiWq5twkpXd+-D4fZ32f483815BcZ-5UbA9cyxCjA@mail.gmail.com>
Message-ID: <CAAOTY_9HjWiWq5twkpXd+-D4fZ32f483815BcZ-5UbA9cyxCjA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: eliminate the magic number in array size
To: Bernard Zhao <bernard@vivo.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEJlcm5hcmQ6CgpCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+IOaWvCAyMDIw5bm0
NeaciDbml6Ug6YCx5LiJIOS4i+WNiDg6NDPlr6vpgZPvvJoKPgo+IEVpbWluYXRlIHRoZSBtYWdp
YyBudW1iZXIgaW4gYXJyYXkgc2l6ZSwgdGhlcmUgbWFjcm8gZGVmaW5lcyBpbgo+IGhkbWkuaC4K
ClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgNiArKystLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jCj4gaW5kZXggZmY0M2EzZDgwNDEwLi40Yzk2MmM3ZjA2ZTUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+IEBAIC05ODIsNyArOTgyLDcgQEAg
c3RhdGljIGludCBtdGtfaGRtaV9zZXR1cF9hdmlfaW5mb2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAq
aGRtaSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKm1vZGUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBoZG1pX2F2aV9pbmZv
ZnJhbWUgZnJhbWU7Cj4gLSAgICAgICB1OCBidWZmZXJbMTddOwo+ICsgICAgICAgdTggYnVmZmVy
W0hETUlfSU5GT0ZSQU1FX0hFQURFUl9TSVpFICsgSERNSV9BVklfSU5GT0ZSQU1FX1NJWkVdOwo+
ICAgICAgICAgc3NpemVfdCBlcnI7Cj4KPiAgICAgICAgIGVyciA9IGRybV9oZG1pX2F2aV9pbmZv
ZnJhbWVfZnJvbV9kaXNwbGF5X21vZGUoJmZyYW1lLAo+IEBAIC0xMDA4LDcgKzEwMDgsNyBAQCBz
dGF0aWMgaW50IG10a19oZG1pX3NldHVwX3NwZF9pbmZvZnJhbWUoc3RydWN0IG10a19oZG1pICpo
ZG1pLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFy
ICpwcm9kdWN0KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgaGRtaV9zcGRfaW5mb2ZyYW1lIGZyYW1l
Owo+IC0gICAgICAgdTggYnVmZmVyWzI5XTsKPiArICAgICAgIHU4IGJ1ZmZlcltIRE1JX0lORk9G
UkFNRV9IRUFERVJfU0laRSArIEhETUlfU1BEX0lORk9GUkFNRV9TSVpFXTsKPiAgICAgICAgIHNz
aXplX3QgZXJyOwo+Cj4gICAgICAgICBlcnIgPSBoZG1pX3NwZF9pbmZvZnJhbWVfaW5pdCgmZnJh
bWUsIHZlbmRvciwgcHJvZHVjdCk7Cj4gQEAgLTEwMzEsNyArMTAzMSw3IEBAIHN0YXRpYyBpbnQg
bXRrX2hkbWlfc2V0dXBfc3BkX2luZm9mcmFtZShzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksCj4gIHN0
YXRpYyBpbnQgbXRrX2hkbWlfc2V0dXBfYXVkaW9faW5mb2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAq
aGRtaSkKPiAgewo+ICAgICAgICAgc3RydWN0IGhkbWlfYXVkaW9faW5mb2ZyYW1lIGZyYW1lOwo+
IC0gICAgICAgdTggYnVmZmVyWzE0XTsKPiArICAgICAgIHU4IGJ1ZmZlcltIRE1JX0lORk9GUkFN
RV9IRUFERVJfU0laRSArIEhETUlfQVVESU9fSU5GT0ZSQU1FX1NJWkVdOwo+ICAgICAgICAgc3Np
emVfdCBlcnI7Cj4KPiAgICAgICAgIGVyciA9IGhkbWlfYXVkaW9faW5mb2ZyYW1lX2luaXQoJmZy
YW1lKTsKPiAtLQo+IDIuMjYuMgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
