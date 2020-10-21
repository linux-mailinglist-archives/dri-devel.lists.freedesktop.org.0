Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61882295549
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 01:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D396EEB1;
	Wed, 21 Oct 2020 23:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B6D6EEB1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 23:42:28 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 298052419B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 23:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603323748;
 bh=BESI+542e7zfS3UEqo6HAOXoKEmppsFmRI/GraPxDPQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1unrDcjabHeLDDqS/apsiljcFHGIO18AqDTOVKbU+vvALlFaGbNzUssIB6t1VFqK7
 EGSjXx5bDIFwmnNpkGTQxnF1O7La4nHIbZXzKKHB6W+idmBfQytHpuwMZmrYXuRjy+
 Z2GVPU9PeH5FzPjjkFzFe6tAI9Y2170ZsxaPz7zk=
Received: by mail-ej1-f54.google.com with SMTP id t25so5639163ejd.13
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 16:42:28 -0700 (PDT)
X-Gm-Message-State: AOAM532z7Ju/cF27+OpzoSBGHJqnBV+GeMd5cNhMeLmbGC/omq8t2XFZ
 dhcw/14oKyRG/NV2Q8czSbmXI+Ls0ahbzGW5wA==
X-Google-Smtp-Source: ABdhPJwgMVbl3VYJeXaSvXiI9nwXO3E9FGk9CZ7wEou8onpN28BE+CNBywsvzb2a+LmZGUfNobLk6I2nGy6MQrV80nI=
X-Received: by 2002:a17:906:3b8e:: with SMTP id
 u14mr5725503ejf.127.1603323746144; 
 Wed, 21 Oct 2020 16:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201020174253.3757771-1-fparent@baylibre.com>
 <20201020174253.3757771-4-fparent@baylibre.com>
In-Reply-To: <20201020174253.3757771-4-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Oct 2020 07:42:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8vDopCaJ+=kZwhTPgM0ioTL=PdCdQLjgWMdyJHkyD=Pw@mail.gmail.com>
Message-ID: <CAAOTY_8vDopCaJ+=kZwhTPgM0ioTL=PdCdQLjgWMdyJHkyD=Pw@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/mediatek: add disp-color MT8167 support
To: Fabien Parent <fparent@baylibre.com>
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
Cc: DTML <devicetree@vger.kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjHml6Ug6YCx5LiJIOS4iuWNiDE6NDPlr6vpgZPvvJoKPgo+IEFkZCBzdXBwb3J0
IGZvciBkaXNwLWNvbG9yIG9uIE1UODE2NyBTb0MuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBI
dSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogRmFiaWVuIFBh
cmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9jb2xvci5jIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3BfY29sb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jb2xvci5j
Cj4gaW5kZXggM2FlOWM4MTA4NDViLi5hMTIyN2NlZmJmMzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2NvbG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYwo+IEBAIC0xNiw2ICsxNiw3IEBACj4KPiAgI2Rl
ZmluZSBESVNQX0NPTE9SX0NGR19NQUlOICAgICAgICAgICAgICAgICAgICAweDA0MDAKPiAgI2Rl
ZmluZSBESVNQX0NPTE9SX1NUQVJUX01UMjcwMSAgICAgICAgICAgICAgICAgICAgICAgIDB4MGYw
MAo+ICsjZGVmaW5lIERJU1BfQ09MT1JfU1RBUlRfTVQ4MTY3ICAgICAgICAgICAgICAgICAgICAg
ICAgMHgwNDAwCj4gICNkZWZpbmUgRElTUF9DT0xPUl9TVEFSVF9NVDgxNzMgICAgICAgICAgICAg
ICAgICAgICAgICAweDBjMDAKPiAgI2RlZmluZSBESVNQX0NPTE9SX1NUQVJUKGNvbXApICAgICAg
ICAgICAgICAgICAoKGNvbXApLT5kYXRhLT5jb2xvcl9vZmZzZXQpCj4gICNkZWZpbmUgRElTUF9D
T0xPUl9XSURUSChjb21wKSAgICAgICAgICAgICAgICAgKERJU1BfQ09MT1JfU1RBUlQoY29tcCkg
KyAweDUwKQo+IEBAIC0xNDgsNiArMTQ5LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rp
c3BfY29sb3JfZGF0YSBtdDI3MDFfY29sb3JfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAgICAuY29s
b3Jfb2Zmc2V0ID0gRElTUF9DT0xPUl9TVEFSVF9NVDI3MDEsCj4gIH07Cj4KPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBtdGtfZGlzcF9jb2xvcl9kYXRhIG10ODE2N19jb2xvcl9kcml2ZXJfZGF0YSA9
IHsKPiArICAgICAgIC5jb2xvcl9vZmZzZXQgPSBESVNQX0NPTE9SX1NUQVJUX01UODE2NywKPiAr
fTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3BfY29sb3JfZGF0YSBtdDgxNzNf
Y29sb3JfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAgICAuY29sb3Jfb2Zmc2V0ID0gRElTUF9DT0xP
Ul9TVEFSVF9NVDgxNzMsCj4gIH07Cj4gQEAgLTE1NSw2ICsxNjAsOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG10a19kaXNwX2NvbG9yX2RhdGEgbXQ4MTczX2NvbG9yX2RyaXZlcl9kYXRhID0gewo+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZGlzcF9jb2xvcl9kcml2ZXJf
ZHRfbWF0Y2hbXSA9IHsKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAx
LWRpc3AtY29sb3IiLAo+ICAgICAgICAgICAuZGF0YSA9ICZtdDI3MDFfY29sb3JfZHJpdmVyX2Rh
dGF9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctZGlzcC1jb2xv
ciIsCj4gKyAgICAgICAgIC5kYXRhID0gJm10ODE2N19jb2xvcl9kcml2ZXJfZGF0YX0sCj4gICAg
ICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kaXNwLWNvbG9yIiwKPiAgICAg
ICAgICAgLmRhdGEgPSAmbXQ4MTczX2NvbG9yX2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHt9LAo+
IC0tCj4gMi4yOC4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
