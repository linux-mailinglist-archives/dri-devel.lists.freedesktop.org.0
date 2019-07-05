Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D9760A73
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 18:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918E46E50D;
	Fri,  5 Jul 2019 16:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4019F6E50C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 16:42:35 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k8so20432892iot.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 09:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIsUK/A7o9jXe5kJWwnsjnmxD0dE/u9IBMQhPou9+Nw=;
 b=hMdfVRH5/e24vJYKquiFoMfyJCy9rFXnsNBXEXIYlMh185n8h6ZGsMOCorliNV5iSd
 riuASwkFSac+5Ae9p1RbZuzle5E7pHIeETDefQ9swH9yiFQaWt+nD/RMr4fIdoEFCN1M
 XUJUuqYpnZadU1N6LoSyS5MUj5CQfwYyhsaT5R5IxTRq+ImmFIVGcKmBg8IwJkZxlZyv
 FWnyHdNt+MUQLps4DSmxaD4b2j/i1/N5K74xIY8tgmFa7tzdkFTLqHak7iuCBxyEi/42
 Zj2KVzEn5F3nlZYvJSx/tptmbHExRBIYt7dbnwzZpPVGQ+PD2EcLM2BnLg8/LoYw3mKI
 qXeQ==
X-Gm-Message-State: APjAAAU9KnWvCT6BRcQNZSfe2GmonBDkS0MDOE4y8TvG7JNd5wLDyXoC
 Aktq9R9G2Yx5kIc6mWDHfA7arvE=
X-Google-Smtp-Source: APXvYqxSXKchEkeCyFw5xuYukonFXjVB9Cg+hG3Hv8gJXgse0AvU6VciMG96yT7QMKO6pTCQoVFEfg==
X-Received: by 2002:a02:bca:: with SMTP id 193mr5789955jad.46.1562344954046;
 Fri, 05 Jul 2019 09:42:34 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id b8sm6878104ioj.16.2019.07.05.09.42.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 09:42:33 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 06/13] dt-bindings: display: Convert pda,
 91-00156-a0 panel to DT schema
Date: Fri,  5 Jul 2019 10:42:14 -0600
Message-Id: <20190705164221.4462-7-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705164221.4462-1-robh@kernel.org>
References: <20190705164221.4462-1-robh@kernel.org>
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

Q29udmVydCB0aGUgcGRhLDkxLTAwMTU2LWEwIHBhbmVsIGJpbmRpbmcgdG8gRFQgc2NoZW1hLgoK
Q2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnClJldmlld2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29t
PgpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIC4uLi9k
aXNwbGF5L3BhbmVsL3BkYSw5MS0wMDE1Ni1hMC50eHQgICAgICAgICB8IDE0IC0tLS0tLS0tLQog
Li4uL2Rpc3BsYXkvcGFuZWwvcGRhLDkxLTAwMTU2LWEwLnlhbWwgICAgICAgIHwgMzEgKysrKysr
KysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxNCBkZWxl
dGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9wZGEsOTEtMDAxNTYtYTAudHh0CiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGRhLDkx
LTAwMTU2LWEwLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9wZGEsOTEtMDAxNTYtYTAudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGRhLDkxLTAwMTU2LWEwLnR4dApkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMTYzOWZiMTdhOWYwLi4wMDAwMDAwMDAwMDAKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGRhLDkx
LTAwMTU2LWEwLnR4dAorKysgL2Rldi9udWxsCkBAIC0xLDE0ICswLDAgQEAKLVBEQSA5MS0wMDE1
Ni1BMCA1LjAiIFdWR0EgVEZUIExDRCBwYW5lbAotCi1SZXF1aXJlZCBwcm9wZXJ0aWVzOgotLSBj
b21wYXRpYmxlOiBzaG91bGQgYmUgInBkYSw5MS0wMDE1Ni1hMCIKLS0gcG93ZXItc3VwcGx5OiB0
aGlzIHBhbmVsIHJlcXVpcmVzIGEgc2luZ2xlIHBvd2VyIHN1cHBseS4gQSBwaGFuZGxlIHRvIGEK
LXJlZ3VsYXRvciBuZWVkcyB0byBiZSBzcGVjaWZpZWQgaGVyZS4gQ29tcGF0aWJsZSB3aXRoIHBh
bmVsLWNvbW1vbiBiaW5kaW5nIHdoaWNoCi1pcyBzcGVjaWZpZWQgaW4gdGhlIHBhbmVsLWNvbW1v
bi50eHQgaW4gdGhpcyBkaXJlY3RvcnkuCi0tIGJhY2tsaWdodDogdGhpcyBwYW5lbCdzIGJhY2ts
aWdodCBpcyBjb250cm9sbGVkIGJ5IGFuIGV4dGVybmFsIGJhY2tsaWdodAotY29udHJvbGxlci4g
QSBwaGFuZGxlIHRvIHRoaXMgY29udHJvbGxlciBuZWVkcyB0byBiZSBzcGVjaWZpZWQgaGVyZS4K
LUNvbXBhdGlibGUgd2l0aCBwYW5lbC1jb21tb24gYmluZGluZyB3aGljaCBpcyBzcGVjaWZpZWQg
aW4gdGhlIHBhbmVsLWNvbW1vbi50eHQKLWluIHRoaXMgZGlyZWN0b3J5LgotCi1UaGlzIGJpbmRp
bmcgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZywgd2hpY2ggaXMg
c3BlY2lmaWVkCi1pbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMgZGlyZWN0b3J5LgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGRh
LDkxLTAwMTU2LWEwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9wZGEsOTEtMDAxNTYtYTAueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwMDAuLmNjZDM2MjNiNDk1NQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BkYSw5MS0wMDE1Ni1hMC55
YW1sCkBAIC0wLDAgKzEsMzEgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAK
KyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3Bs
YXkvcGFuZWwvcGRhLDkxLTAwMTU2LWEwLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFBEQSA5MS0wMDE1Ni1BMCA1
LjAiIFdWR0EgVEZUIExDRCBwYW5lbAorCittYWludGFpbmVyczoKKyAgLSBDcmlzdGlhbiBCaXJz
YW4gPGNyaXN0aWFuLmJpcnNhbkBtaWNyb2NoaXAuY29tPgorICAtIFRoaWVycnkgUmVkaW5nIDx0
aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CisKK2FsbE9mOgorICAtICRyZWY6IHBhbmVsLWNvbW1v
bi55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBwZGEsOTEt
MDAxNTYtYTAKKworICBwb3dlci1zdXBwbHk6IHRydWUKKyAgYmFja2xpZ2h0OiB0cnVlCisgIHBv
cnQ6IHRydWUKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK3JlcXVpcmVkOgorICAt
IGNvbXBhdGlibGUKKyAgLSBwb3dlci1zdXBwbHkKKyAgLSBiYWNrbGlnaHQKKworLi4uCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
