Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE2120C865
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 16:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9397E6E235;
	Sun, 28 Jun 2020 14:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9256E235
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 14:19:44 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDC4220885
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593353984;
 bh=FM4B6O890rOp11oQrSU4ptT/qfDOHTlolMOEiV7c7eg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ferf/tRhh+Cyjnbgp3+HUzWJL7BG8wJdiusxjhIetWjKuYQLl1NXBXPjmBnr3vCvh
 dWv/o8RrX2s86NOIEDgsogfylbi+64Vl0yWbnZnSa9GCWp6fP+GaPtakZlExoeSwaZ
 Bbc5g+ADqv3U4MT/VcWtmh/WHRGkU0jlflrDU7+E=
Received: by mail-ej1-f50.google.com with SMTP id y10so14048797eje.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 07:19:43 -0700 (PDT)
X-Gm-Message-State: AOAM533yUIpzmsC8URUUjz2pYjLcaGoJvjGrDEIQzzeiSSq7kYV/24L0
 5QFG2Jn8xOPKMoUIcNo1pa7UYdL5CHds1zPp8Q==
X-Google-Smtp-Source: ABdhPJyBxW8NlX1UpfAJTQrr9ECyVfuVuXvUNgqMd8hviZLwctZBgwiwnmX4TCg6/5R7MfpzaqzdROaukyvUmvcYUqY=
X-Received: by 2002:a17:906:5fc4:: with SMTP id
 k4mr10157244ejv.94.1593353982337; 
 Sun, 28 Jun 2020 07:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200616065102.15756-1-bernard@vivo.com>
In-Reply-To: <20200616065102.15756-1-bernard@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 28 Jun 2020 22:19:31 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-yTjG7xW6MZ6NFYUDaeKCkASPP4JQPD1WTLUmOCG3muA@mail.gmail.com>
Message-ID: <CAAOTY_-yTjG7xW6MZ6NFYUDaeKCkASPP4JQPD1WTLUmOCG3muA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: remove unnecessary conversion to bool
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
NuaciDE25pelIOmAseS6jCDkuIvljYgyOjUx5a+r6YGT77yaCj4KPiBJbiBmdW5jdGlvbiBtdGtf
ZHNpX2Nsa19oc19zdGF0ZSwgcmVtb3ZlIHVubmVjZXNzYXJ5IGNvbnZlcnNpb24KPiB0byBib29s
IHJldHVybiwgdGhpcyBjaGFuZ2UgaXMgdG8gbWFrZSB0aGUgY29kZSBhIGJpdCByZWFkYWJsZS4K
CkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLWZpeGVzIFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51
eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1maXhlcwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+Cj4gLS0tCj4g
Q2hhbmdlcyBzaW5jZSBWMToKPiAqb3B0aW1pemUgdG8gbWFrZSB0aGUgY29kZSBhIGJpdCBtb3Jl
IGNsZWFyLgo+Cj4gTGluayBmb3IgVjE6Cj4gKmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNo
d29yay9wYXRjaC8xMjU1MzI3Lwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jIHwgNSArLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCA0NDkxZTY0
YjNmMDYuLjg0MGNjOWI5ZWZjOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+
IEBAIC0zMTYsMTAgKzMxNiw3IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfbGFuZTBfdWxwX21vZGVf
bGVhdmUoc3RydWN0IG10a19kc2kgKmRzaSkKPgo+ICBzdGF0aWMgYm9vbCBtdGtfZHNpX2Nsa19o
c19zdGF0ZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICB7Cj4gLSAgICAgICB1MzIgdG1wX3JlZzE7
Cj4gLQo+IC0gICAgICAgdG1wX3JlZzEgPSByZWFkbChkc2ktPnJlZ3MgKyBEU0lfUEhZX0xDQ09O
KTsKPiAtICAgICAgIHJldHVybiAoKHRtcF9yZWcxICYgTENfSFNfVFhfRU4pID09IDEpOwo+ICsg
ICAgICAgcmV0dXJuIChyZWFkbChkc2ktPnJlZ3MgKyBEU0lfUEhZX0xDQ09OKSAmIExDX0hTX1RY
X0VOKTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIG10a19kc2lfY2xrX2hzX21vZGUoc3RydWN0IG10
a19kc2kgKmRzaSwgYm9vbCBlbnRlcikKPiAtLQo+IDIuMTcuMQo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
