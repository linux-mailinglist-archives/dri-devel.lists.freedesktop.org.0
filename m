Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D532C369DC1
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 02:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE9C6ECCE;
	Sat, 24 Apr 2021 00:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CE06ECCE
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 00:24:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B16D61466
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 00:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619223862;
 bh=wRZ97aExQGMljYinJjx9Cgnv5qDIbGXWDbTgklJB4Mk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZjXRx4dnOx0OSXtmerXzW7K9oIl5SDba/icm4FTlwwLIz1J4ULaGYJm7moi+6tAbn
 Omiov5p8waK59kVjX689Bwg+Tv8BjnwYBq3wVr3yesUrptBWS1jLerGbO4jthOr2yF
 cmdRgvOCK4rxaGlQH6BLv4uHA/iYFO4ddgSejxbFWsK7eWAjFC3veeN634Nw+cu/9J
 AqUuWvEfgGhqaFlbM8EjcXHTLnzAjnX/Z698MCMKiYr1bLYm1o9gUK/kV6frwn9U1M
 fBt7M0HNCSrEqrAQkjWnZrPbiMEqd3uUpwbSL2qDmXyn9/xNHq+tEclTb/EcYYcNQP
 Oy0tK5kg55OuA==
Received: by mail-ej1-f48.google.com with SMTP id r12so76246193ejr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 17:24:22 -0700 (PDT)
X-Gm-Message-State: AOAM5307XNcHkHE+/OT3pcUJvycU/ZigT4uEXp32mS1nbF48tYpIfCFE
 00xtMojt35tSz/CzG6r6Q8dNzBp8KqCQChm92g==
X-Google-Smtp-Source: ABdhPJwQgBu332eS8r8LCjd2EB6/UqPbtWe9kyT/JTkGqbYDpWNQ9/R+U3T9w831o7oRhYXepsheJyUkpMaP6CCmw7U=
X-Received: by 2002:a17:907:9485:: with SMTP id
 dm5mr6893874ejc.194.1619223860799; 
 Fri, 23 Apr 2021 17:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
 <20210419073244.2678688-4-narmstrong@baylibre.com>
In-Reply-To: <20210419073244.2678688-4-narmstrong@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 24 Apr 2021 08:24:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8g0voFQb22RrvMdYst7U0SZOUE+U5oab5bGJXD0nJsJQ@mail.gmail.com>
Message-ID: <CAAOTY_8g0voFQb22RrvMdYst7U0SZOUE+U5oab5bGJXD0nJsJQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] gpu/drm: mediatek: hdmi: add check for CEA modes
 only
To: Neil Armstrong <narmstrong@baylibre.com>
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE5laWw6CgpOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOaWvCAy
MDIx5bm0NOaciDE55pelIOmAseS4gCDkuIvljYgzOjMz5a+r6YGT77yaCj4KPiBTb21lIFNvQ3Mg
bGlrZSB0aGUgTVQ4MTY3IGFyZSBub3QgdmFsaWRhdGVkIGFuZCBzdXBwb3J0ZWQgZm9yIEhETUkg
bW9kZXMKPiBvdXQgb2YgSERNSSBDRUEgbW9kZXMsIHNvIGFkZCBhIGNvbmZpZ3VyYXRpb24gYm9v
bGVhbiB0byBmaWx0ZXIgb3V0Cj4gbm9uLUNFQSBtb2Rlcy4KClJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJp
ZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFy
bXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hk
bWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gaW5kZXggZGVhNDZk
NjZlNzEyLi4wNTM5MjYyZTY5ZDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWku
Ywo+IEBAIC0xNDgsNiArMTQ4LDcgQEAgc3RydWN0IGhkbWlfYXVkaW9fcGFyYW0gewo+Cj4gIHN0
cnVjdCBtdGtfaGRtaV9jb25mIHsKPiAgICAgICAgIGJvb2wgdHpfZGlzYWJsZWQ7Cj4gKyAgICAg
ICBib29sIGNlYV9tb2Rlc19vbmx5Owo+ICB9Owo+Cj4gIHN0cnVjdCBtdGtfaGRtaSB7Cj4gQEAg
LTEyMjIsNiArMTIyMyw5IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfYnJpZGdlX21vZGVfdmFsaWQo
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gTU9ERV9CQUQ7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIGlmIChoZG1pLT5jb25mLT5jZWFf
bW9kZXNfb25seSAmJiAhZHJtX21hdGNoX2NlYV9tb2RlKG1vZGUpKQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gTU9ERV9CQUQ7Cj4gKwo+ICAgICAgICAgaWYgKG1vZGUtPmNsb2NrIDwgMjcwMDAp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiBNT0RFX0NMT0NLX0xPVzsKPiAgICAgICAgIGlmICht
b2RlLT5jbG9jayA+IDI5NzAwMCkKPiAtLQo+IDIuMjUuMQo+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
