Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0104A51D95
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 23:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7E189E0D;
	Mon, 24 Jun 2019 21:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD34989E06
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:58:59 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id j6so4404982ioa.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WiTWFl+2LVv/eOXw13HDcJuOO4CS5h8+NNPFsB+2NKE=;
 b=Kmm2gW2t5wwvNUwXrWUznU95Af/ZJ2+iVOTVep8jpccYt7yB/ldYBVDkhczrK4q1v8
 frvX1NPmZz1VvhHMWSRJgTncGGPl+lGY0F2OA2egJh0zgFJV8lkPj81KThTmvqzCjBRV
 X9kUKeezt1sy1jtI6medUfSHDivsshm7xFD7LBWoFK4bhFVC7tE/yyi0eYqjVgLhsrKl
 zOcIv6PS7xRap39Ufy4ac/Uhc7upwSVlFV9YWg+jHthwBaUqu8bCdkf1qmqlMO6M1FNx
 sNymCW1/xMwbsaQBs8fSU+/svcpG3sKfNI/+cd5yzHJTBJglNvfPiIWV10V/uxXB2XhZ
 9I4g==
X-Gm-Message-State: APjAAAXWU5DTyGNIjijGEh/myXuUOUbZfrwQlr/uPD+Otgvj5PXW+brN
 hptxsY7wqd0zRLLZCcpZYrLYDXs=
X-Google-Smtp-Source: APXvYqxq++mc5I7wrF7ScvEQZ8FcQXjoNxrYK1T5UgPSYsQ75AYxxW3mX65fkti/Qu0r4eHZQ19gMQ==
X-Received: by 2002:a5d:8c97:: with SMTP id g23mr3403649ion.250.1561413538556; 
 Mon, 24 Jun 2019 14:58:58 -0700 (PDT)
Received: from localhost.localdomain ([64.188.179.247])
 by smtp.googlemail.com with ESMTPSA id l5sm14717301ioq.83.2019.06.24.14.58.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 14:58:58 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 04/15] dt-bindings: display: Convert armadeus,
 st0700-adapt panel to DT schema
Date: Mon, 24 Jun 2019 15:56:38 -0600
Message-Id: <20190624215649.8939-5-robh@kernel.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCB0aGUgYXJtYWRldXMsc3QwNzAwLWFkYXB0IHBhbmVsIGJpbmRpbmcgdG8gRFQgc2No
ZW1hLgoKQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUu
cmlwYXJkQGJvb3RsaW4uY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpT
aWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIC4uLi9kaXNw
bGF5L3BhbmVsL2FybWFkZXVzLHN0MDcwMC1hZGFwdC50eHQgICB8ICA5IC0tLS0tLS0KIC4uLi9k
aXNwbGF5L3BhbmVsL2FybWFkZXVzLHN0MDcwMC1hZGFwdC55YW1sICB8IDI3ICsrKysrKysrKysr
KysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9hcm1hZGV1cyxzdDA3MDAtYWRhcHQudHh0CiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXJtYWRl
dXMsc3QwNzAwLWFkYXB0LnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hcm1hZGV1cyxzdDA3MDAtYWRhcHQudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXJtYWRldXMsc3Qw
NzAwLWFkYXB0LnR4dApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTMwZDYzZGIzYzhm
Li4wMDAwMDAwMDAwMDAKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvYXJtYWRldXMsc3QwNzAwLWFkYXB0LnR4dAorKysgL2Rldi9udWxsCkBAIC0x
LDkgKzAsMCBAQAotQXJtYWRldXMgU1QwNzAwIEFkYXB0LiBBIFNhbnRlayBTVDA3MDBJNVktUkJT
TFcgNy4wIiBXVkdBICg4MDB4NDgwKSBURlQgd2l0aAotYW4gYWRhcHRlciBib2FyZC4KLQotUmVx
dWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJsZTogImFybWFkZXVzLHN0MDcwMC1hZGFwdCIK
LS0gcG93ZXItc3VwcGx5OiBzZWUgcGFuZWwtY29tbW9uLnR4dAotCi1PcHRpb25hbCBwcm9wZXJ0
aWVzOgotLSBiYWNrbGlnaHQ6IHNlZSBwYW5lbC1jb21tb24udHh0CmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hcm1hZGV1cyxzdDA3
MDAtYWRhcHQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL2FybWFkZXVzLHN0MDcwMC1hZGFwdC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAwMC4uNTkzNzY2Njk0NDJhCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXJtYWRldXMsc3QwNzAw
LWFkYXB0LnlhbWwKQEAgLTAsMCArMSwyNyBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMAorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvZGlzcGxheS9wYW5lbC9hcm1hZGV1cyxzdDA3MDAtYWRhcHQueWFtbCMKKyRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogQXJt
YWRldXMgU1QwNzAwIEFkYXB0ZXIKKworZGVzY3JpcHRpb246CisgIEEgU2FudGVrIFNUMDcwMEk1
WS1SQlNMVyA3LjAiIFdWR0EgKDgwMHg0ODApIFRGVCB3aXRoIGFuIGFkYXB0ZXIgYm9hcmQuCisK
K21haW50YWluZXJzOgorICAtICciU8OpYmFzdGllbiBTenltYW5za2kiIDxzZWJhc3RpZW4uc3p5
bWFuc2tpQGFybWFkZXVzLmNvbT4nCisgIC0gVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5n
QGdtYWlsLmNvbT4KKworYWxsT2Y6CisgIC0gJHJlZjogcGFuZWwtY29tbW9uLnlhbWwjCisKK3By
b3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IGFybWFkZXVzLHN0MDcwMC1hZGFw
dAorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcG93ZXItc3VwcGx5CisKKy4uLgot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
