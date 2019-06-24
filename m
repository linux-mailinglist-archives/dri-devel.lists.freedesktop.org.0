Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8C51D97
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 23:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9280689E1B;
	Mon, 24 Jun 2019 21:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB7989E0E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:59:03 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k8so2470112iot.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hq52QEn/OewtdxsavtLn6pDRnEXQBUEM1fJjUXGZO0I=;
 b=RM6+dmEjFkS7TgFbHx4cJBXWcyjZTPa99h5UvZWCnkkgyCQuH2JVHV8IJhwwphLzPk
 73X6HCyEQKa3OomJRtVPCpxhv5zhaT0GSH3SEpe5yP6wNdCsFXXTJjrJX45BCVBf4vvA
 0HVMuJ7YNxZmrrnetJParVBtZKCnK7a0mdCDMVk3/MU5IvgNHTkXUYIALwcmArzHybRX
 iEfg1Y5M7kA04d4mbxZtrQ8nk2+4Vn67WXCU/WF24b5ZaoK+A/JhF1ALoNsbnEJgf3Pg
 hGnqeWZDGf94N7lyflfumQyS7aCFafUNRD6MUt7XzOpJotrj+hUpKYbR8Mcvsnw14hhR
 Q8fw==
X-Gm-Message-State: APjAAAVOLRe57s7jKx5gbLZYa71Gd1CBa5BuMHVZgDvrOlMsvs5CMB6C
 SWQH/8uJZt6T/rl450j/QuWo2AQ=
X-Google-Smtp-Source: APXvYqxg84QEBHR5RlNYAPBEKnrmpuactlgd6/VlkRLE3HLK1rUluLr9fwjtrpBI0gA4+XqNtFHSkA==
X-Received: by 2002:a6b:cb07:: with SMTP id b7mr42084336iog.7.1561413541536;
 Mon, 24 Jun 2019 14:59:01 -0700 (PDT)
Received: from localhost.localdomain ([64.188.179.247])
 by smtp.googlemail.com with ESMTPSA id l5sm14717301ioq.83.2019.06.24.14.58.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 14:59:01 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 06/15] dt-bindings: display: Convert dlc,
 dlc0700yzg-1 panel to DT schema
Date: Mon, 24 Jun 2019 15:56:40 -0600
Message-Id: <20190624215649.8939-7-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624215649.8939-1-robh@kernel.org>
References: <20190624215649.8939-1-robh@kernel.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCB0aGUgZGxjLGRsYzA3MDB5emctMSBwYW5lbCBiaW5kaW5nIHRvIERUIHNjaGVtYS4K
CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogVGhpZXJyeSBS
ZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+
CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogLi4uL2Rpc3BsYXkvcGFuZWwvZGxjLGRsYzA3
MDB5emctMS50eHQgICAgICAgIHwgMTMgLS0tLS0tLS0tCiAuLi4vZGlzcGxheS9wYW5lbC9kbGMs
ZGxjMDcwMHl6Zy0xLnlhbWwgICAgICAgfCAyOCArKysrKysrKysrKysrKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2Rs
YyxkbGMwNzAweXpnLTEudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZGxjLGRsYzA3MDB5emctMS55YW1sCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
ZGxjLGRsYzA3MDB5emctMS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9kbGMsZGxjMDcwMHl6Zy0xLnR4dApkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggYmYwNmJiMDI1YjA4Li4wMDAwMDAwMDAwMDAKLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZGxjLGRsYzA3MDB5emctMS50eHQKKysr
IC9kZXYvbnVsbApAQCAtMSwxMyArMCwwIEBACi1ETEMgRGlzcGxheSBDby4gRExDMDcwMFlaRy0x
IDcuMCIgV1NWR0EgVEZUIExDRCBwYW5lbAotCi1SZXF1aXJlZCBwcm9wZXJ0aWVzOgotLSBjb21w
YXRpYmxlOiBzaG91bGQgYmUgImRsYyxkbGMwNzAweXpnLTEiCi0tIHBvd2VyLXN1cHBseTogU2Vl
IHNpbXBsZS1wYW5lbC50eHQKLQotT3B0aW9uYWwgcHJvcGVydGllczoKLS0gcmVzZXQtZ3Bpb3M6
IFNlZSBwYW5lbC1jb21tb24udHh0Ci0tIGVuYWJsZS1ncGlvczogU2VlIHNpbXBsZS1wYW5lbC50
eHQKLS0gYmFja2xpZ2h0OiBTZWUgc2ltcGxlLXBhbmVsLnR4dAotCi1UaGlzIGJpbmRpbmcgaXMg
Y29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZywgd2hpY2ggaXMgc3BlY2lm
aWVkCi1pbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMgZGlyZWN0b3J5LgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZGxjLGRsYzA3
MDB5emctMS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvZGxjLGRsYzA3MDB5emctMS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uMWIwYjYzZDQ2ZjNlCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZGxjLGRsYzA3MDB5emctMS55YW1s
CkBAIC0wLDAgKzEsMjggQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKyVZ
QU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkv
cGFuZWwvZGxjLGRsYzA3MDB5emctMS55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBETEMgRGlzcGxheSBDby4gRExD
MDcwMFlaRy0xIDcuMCIgV1NWR0EgVEZUIExDRCBwYW5lbAorCittYWludGFpbmVyczoKKyAgLSBQ
aGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgorICAtIFRoaWVycnkgUmVkaW5n
IDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CisKK2FsbE9mOgorICAtICRyZWY6IHBhbmVsLWNv
bW1vbi55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBkbGMs
ZGxjMDcwMHl6Zy0xCisKKyAgcmVzZXQtZ3Bpb3M6IHRydWUKKyAgZW5hYmxlLWdwaW9zOiB0cnVl
CisgIGJhY2tsaWdodDogdHJ1ZQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcG93
ZXItc3VwcGx5CisKKy4uLgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
