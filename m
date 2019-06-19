Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56434C350
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 23:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67966E47F;
	Wed, 19 Jun 2019 21:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891156E47B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 21:52:02 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id j6so226029ioa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 14:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/7RNl0V1WoARVRD/RxLj0SbJgldmEVIr2syT8aiqqBI=;
 b=sAuIYzhrwQDWmKd0SXl5dJTCqLVwsoLAcXjpPcPWSBdKdXgf6yNqd+Ib4PsuSjMqvT
 Q3jcggjRe0mujOinybSLRh+yvd2R8HwTMldZl8E7aoU0WqGToc0WNsdvCywJZwm1bUgD
 VAKkWEBf+Hs0hskRKP0mRbyUmNcKMhExsG6qFKRKZqdB6zruavTJrVH/jvnDzSn3YXd/
 oGsuVSJggKfYLYjJMlq8MpaP0hFCORZOOMHIWTGKMQcPkRjrXA9fh0CytNUnMUz2dic9
 z2N0BwJfGTXeTQGtWICzpIEZfSzf3jXPlaErg4Dcst69beMR1GWhDb0Xl38cHHoZW48I
 R87g==
X-Gm-Message-State: APjAAAUfWuuiYpZEuUYrm7s153d4fJxoGjwes89HkxBMITcy8jL8IcGc
 /N4jyuqIeLGdVD0mqRYsC4/T+v0=
X-Google-Smtp-Source: APXvYqwsCLCHHve5YFnB7Eegl0JTw/80pFtx6JeAxTQ67f75e5Qj4mCBLH4/9MyYF/LdnVCfkHlSJw==
X-Received: by 2002:a5d:94d0:: with SMTP id y16mr42777142ior.123.1560981121583; 
 Wed, 19 Jun 2019 14:52:01 -0700 (PDT)
Received: from localhost.localdomain ([64.188.179.247])
 by smtp.googlemail.com with ESMTPSA id e84sm37754698iof.39.2019.06.19.14.52.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 14:52:01 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 2/4] dt-bindings: display: Convert ampire,
 am-480272h3tmqw-t01h panel to DT schema
Date: Wed, 19 Jun 2019 15:51:54 -0600
Message-Id: <20190619215156.27795-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619215156.27795-1-robh@kernel.org>
References: <20190619215156.27795-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCB0aGUgYW1waXJlLGFtLTQ4MDI3MmgzdG1xdy10MDFoIHBhbmVsIGJpbmRpbmcgdG8g
RFQgc2NoZW1hLgoKQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+
CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBNYXhpbWUgUmlwYXJkIDxt
YXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIC4u
Li9wYW5lbC9hbXBpcmUsYW0tNDgwMjcyaDN0bXF3LXQwMWgudHh0ICAgICB8IDI2IC0tLS0tLS0t
LS0tLQogLi4uL3BhbmVsL2FtcGlyZSxhbS00ODAyNzJoM3RtcXctdDAxaC55YW1sICAgIHwgNDEg
KysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAy
NiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hbXBpcmUsYW0tNDgwMjcyaDN0bXF3LXQwMWgudHh0
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvYW1waXJlLGFtLTQ4MDI3MmgzdG1xdy10MDFoLnlhbWwKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hbXBpcmUs
YW0tNDgwMjcyaDN0bXF3LXQwMWgudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvYW1waXJlLGFtLTQ4MDI3MmgzdG1xdy10MDFoLnR4dApkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNjgxMjI4MGNiMTA5Li4wMDAwMDAwMDAwMDAKLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYW1waXJlLGFt
LTQ4MDI3MmgzdG1xdy10MDFoLnR4dAorKysgL2Rldi9udWxsCkBAIC0xLDI2ICswLDAgQEAKLUFt
cGlyZSBBTS00ODAyNzJIM1RNUVctVDAxSCA0LjMiIFdRVkdBIFRGVCBMQ0QgcGFuZWwKLQotVGhp
cyBiaW5kaW5nIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgc2ltcGxlLXBhbmVsIGJpbmRpbmcsIHdo
aWNoIGlzIHNwZWNpZmllZAotaW4gc2ltcGxlLXBhbmVsLnR4dCBpbiB0aGlzIGRpcmVjdG9yeS4K
LQotUmVxdWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJhbXBpcmUs
YW0tNDgwMjcyaDN0bXF3LXQwMWgiCi0KLU9wdGlvbmFsIHByb3BlcnRpZXM6Ci0tIHBvd2VyLXN1
cHBseTogcmVndWxhdG9yIHRvIHByb3ZpZGUgdGhlIHN1cHBseSB2b2x0YWdlCi0tIGVuYWJsZS1n
cGlvczogR1BJTyBwaW4gdG8gZW5hYmxlIG9yIGRpc2FibGUgdGhlIHBhbmVsCi0tIGJhY2tsaWdo
dDogcGhhbmRsZSBvZiB0aGUgYmFja2xpZ2h0IGRldmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwK
LQotT3B0aW9uYWwgbm9kZXM6Ci0tIFZpZGVvIHBvcnQgZm9yIFJHQiBpbnB1dC4KLQotRXhhbXBs
ZToKLQlwYW5lbF9yZ2I6IHBhbmVsLXJnYiB7Ci0JCWNvbXBhdGlibGUgPSAiYW1waXJlLGFtLTQ4
MDI3MmgzdG1xdy10MDFoIjsKLQkJZW5hYmxlLWdwaW9zID0gPCZncGlvYSA4IDE+OwotCQlwb3J0
IHsKLQkJCXBhbmVsX2luX3JnYjogZW5kcG9pbnQgewotCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwm
Y29udHJvbGxlcl9vdXRfcmdiPjsKLQkJCX07Ci0JCX07Ci0JfTsKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FtcGlyZSxhbS00ODAy
NzJoM3RtcXctdDAxaC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvYW1waXJlLGFtLTQ4MDI3MmgzdG1xdy10MDFoLnlhbWwKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5jYzJmNmVjNmViZjYKLS0tIC9kZXYvbnVsbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hbXBp
cmUsYW0tNDgwMjcyaDN0bXF3LXQwMWgueWFtbApAQCAtMCwwICsxLDQxIEBACisjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL2FtcGlyZSxhbS00ODAyNzJoM3RtcXct
dDAxaC55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjCisKK3RpdGxlOiBBbXBpcmUgQU0tNDgwMjcySDNUTVFXLVQwMUggNC4zIiBXUVZH
QSBURlQgTENEIHBhbmVsCisKK21haW50YWluZXJzOgorICAtIFRoaWVycnkgUmVkaW5nIDx0cmVk
aW5nQG52aWRpYS5jb20+CisKK2FsbE9mOgorICAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1sIwor
Citwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBhbXBpcmUsYW0tNDgwMjcy
aDN0bXF3LXQwMWgKKworICBwb3dlci1zdXBwbHk6IHRydWUKKyAgZW5hYmxlLWdwaW9zOiB0cnVl
CisgIGJhY2tsaWdodDogdHJ1ZQorICBwb3J0OiB0cnVlCisKK3JlcXVpcmVkOgorICAtIGNvbXBh
dGlibGUKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwK
KyAgICBwYW5lbF9yZ2I6IHBhbmVsIHsKKyAgICAgIGNvbXBhdGlibGUgPSAiYW1waXJlLGFtLTQ4
MDI3MmgzdG1xdy10MDFoIjsKKyAgICAgIGVuYWJsZS1ncGlvcyA9IDwmZ3Bpb2EgOCAxPjsKKyAg
ICAgIHBvcnQgeworICAgICAgICBwYW5lbF9pbl9yZ2I6IGVuZHBvaW50IHsKKyAgICAgICAgICBy
ZW1vdGUtZW5kcG9pbnQgPSA8JmNvbnRyb2xsZXJfb3V0X3JnYj47CisgICAgICAgIH07CisgICAg
ICB9OworICAgIH07CisKKy4uLgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
