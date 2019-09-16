Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 694B3B3B17
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 15:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120836E284;
	Mon, 16 Sep 2019 13:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BBE6E284
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 13:16:16 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s18so36357966qkj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 06:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p8H14b8QOC7xyThE796vVQTVHwHGb7hWB3A0YDyKzi8=;
 b=Ti8NMMXfX4XuLbmc5rR4j5TyyGlnbALJygFzDcShqBn3CJM9KCeBOup5x35K534vPL
 rzbqsvkUrAJjYj+xWcFV4kaqfon/Z+VEVF/Q28YI8D1RdPZQQiWiN0F0rqXEtB/3saDJ
 gbXtJnhXd/UZQQ8dvQrwu430A5/RtUoZwxnclU7+sJM4P05qA0mXJ2xb4zQzw4eB5XaS
 1lRnkQa4yDqYZCYy+idacESvhShcBgmLjtJEDrPq9jx6bpX8hFhCNpijOOd0EbvtNGC1
 5MKWTsfhmyB8UJgCu8ib4wNkauAAgbwuGfZwYDtuG0Vw1v09xqkn3pmNvRJ8rcZ8h5to
 Z38w==
X-Gm-Message-State: APjAAAUanxbZvzGX2ckPdVRXexeUneiMS9Xit4bGzwjYkMFaHoZ+otx0
 oDjf8XZ11R42CMPPnq31krTkCoLkn33wB52oAnFTiw==
X-Google-Smtp-Source: APXvYqw2JIJaTfERF5pMhfhzLnLH23suF9vY3fd49RTGa+0vQVfMcg4dlOfYT6eDDrXzOlwQxh/GlMpqslbpzY+szUQ=
X-Received: by 2002:a05:620a:16d2:: with SMTP id
 a18mr29075565qkn.104.1568639776108; 
 Mon, 16 Sep 2019 06:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <1568278589-20400-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1568278589-20400-1-git-send-email-yannick.fertre@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 16 Sep 2019 15:16:05 +0200
Message-ID: <CA+M3ks56v__Lef4wN8KthoLoJ_yYYou8u+-PsJXSUVJQHaimdA@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: dsi: higher pll out only in video burst mode
To: =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p8H14b8QOC7xyThE796vVQTVHwHGb7hWB3A0YDyKzi8=;
 b=vZIYuwEiPxNk76J3bqFOPMb7hAUUS/X0U7oo+vJzdyuvvkHgRlmK3AFwdDGKPHgJce
 jraHYg6hm4koJfMvBz5DtqLV9BOB7NXmHwMzOsoPDSPJ2BbT6sCeyUTeB2VnjPGQaw9c
 /C3Y8Gj3E9j44l1WvkOQqemf+GvIOoW3kJyNE8cwCp+WdtC/MgML25kVKfu2GzTpy9Ep
 LSSJKi299lQyNl1R5e6sCkvdIo4VuUlksmvaX9lLO6AgoW5olf2/1pn30OOp8TtUdqBC
 wNqvxSVlu5yEmm2Tr9kSx7x+3rWq34rVq3sncVuIm64rI8+cYHjcHPKTDCpW9j0pVOMW
 tuVA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, Philippe Cornu <philippe.cornu@st.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgamV1LiAxMiBzZXB0LiAyMDE5IMOgIDEwOjU3LCBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2su
ZmVydHJlQHN0LmNvbT4gYSDDqWNyaXQgOgo+Cj4gSW4gb3JkZXIgdG8gYmV0dGVyIHN1cHBvcnQg
dmlkZW8gbm9uLWJ1cnN0IG1vZGVzLAo+IHRoZSArMjAlIG9uIHBsbCBvdXQgaXMgYWRkZWQgb25s
eSBpbiBidXJzdCBtb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxp
cHBlLmNvcm51QHN0LmNvbT4KPiBSZXZpZXdlZC1ieTogWWFubmljayBGRVJUUkUgPHlhbm5pY2su
ZmVydHJlQHN0LmNvbT4KCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dCwKVGhhbmtzLApCZW5qYW1p
bgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYyB8IDUgKysr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCj4gaW5kZXggYTAzYTY0Mi4uNTE0ZWZl
ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYwo+IEBAIC0yNjAsOCAr
MjYwLDExIEBAIGR3X21pcGlfZHNpX2dldF9sYW5lX21icHModm9pZCAqcHJpdl9kYXRhLCBjb25z
dCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPiAgICAgICAgIC8qIENvbXB1dGUgcmVx
dWVzdGVkIHBsbCBvdXQgKi8KPiAgICAgICAgIGJwcCA9IG1pcGlfZHNpX3BpeGVsX2Zvcm1hdF90
b19icHAoZm9ybWF0KTsKPiAgICAgICAgIHBsbF9vdXRfa2h6ID0gbW9kZS0+Y2xvY2sgKiBicHAg
LyBsYW5lczsKPiArCj4gICAgICAgICAvKiBBZGQgMjAlIHRvIHBsbCBvdXQgdG8gYmUgaGlnaGVy
IHRoYW4gcGl4ZWwgYncgKGJ1cnN0IG1vZGUgb25seSkgKi8KPiAtICAgICAgIHBsbF9vdXRfa2h6
ID0gKHBsbF9vdXRfa2h6ICogMTIpIC8gMTA7Cj4gKyAgICAgICBpZiAobW9kZV9mbGFncyAmIE1J
UElfRFNJX01PREVfVklERU9fQlVSU1QpCj4gKyAgICAgICAgICAgICAgIHBsbF9vdXRfa2h6ID0g
KHBsbF9vdXRfa2h6ICogMTIpIC8gMTA7Cj4gKwo+ICAgICAgICAgaWYgKHBsbF9vdXRfa2h6ID4g
ZHNpLT5sYW5lX21heF9rYnBzKSB7Cj4gICAgICAgICAgICAgICAgIHBsbF9vdXRfa2h6ID0gZHNp
LT5sYW5lX21heF9rYnBzOwo+ICAgICAgICAgICAgICAgICBEUk1fV0FSTigiV2FybmluZyBtYXgg
cGh5IG1icHMgaXMgdXNlZFxuIik7Cj4gLS0KPiAyLjcuNAo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
