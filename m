Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BFA60A70
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 18:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E576E508;
	Fri,  5 Jul 2019 16:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D2A6E508
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 16:42:30 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id f4so4851849ioh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 09:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9TlywxX14ySmHTYN+js2f/7/fr0bdtbmAsh6I7swK/0=;
 b=nBY5QC/2GtVB9tvGkSdVj7Jg+cYnKpOIfLDOC5UEE/a64zGP6kIgFTC1HhlPkDvp3u
 AnpZzXjEug+PDw5Kqg81GSk2JrQiHTBAtme5BEW49UqLzXUE6vtFRS/gNCPiSiY0tx8l
 GZQ0Js3ptqh25VmYOF4EIjR4v1meJ0wlcdtaUTHPtOyrdZ2o4lj1JqdgNHVxDPENCV6E
 z3iif//k+3lcXu3K/Nx89teOHw6Cvn8qbd33i7b902WjEUFtTjSfMttOA6ltmf7InXFP
 OfD+rMe4FY6Hvxrr29WFD3YdkQCPK9Rq47sRqXTyutKn91jLteZq16bmThMiaGbPtxKp
 0O/w==
X-Gm-Message-State: APjAAAVwVLikI7vECzOV7e8aFS7dBZjvAfuncbQLu2EojMimhutDnRVV
 rHiD8qW8m76NjIO4H/GMarxmCEY=
X-Google-Smtp-Source: APXvYqxHWyS0u8xIf/9PqymPEaYm32f/ja9lh5ILK483/3hMdxhqSKzUW9ptROughYD9aVnk66SskA==
X-Received: by 2002:a5e:990a:: with SMTP id t10mr1765957ioj.182.1562344948712; 
 Fri, 05 Jul 2019 09:42:28 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id b8sm6878104ioj.16.2019.07.05.09.42.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 09:42:28 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 03/13] dt-bindings: display: Convert armadeus,
 st0700-adapt panel to DT schema
Date: Fri,  5 Jul 2019 10:42:11 -0600
Message-Id: <20190705164221.4462-4-robh@kernel.org>
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

Q29udmVydCB0aGUgYXJtYWRldXMsc3QwNzAwLWFkYXB0IHBhbmVsIGJpbmRpbmcgdG8gRFQgc2No
ZW1hLgoKQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnClJldmlld2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3Rs
aW4uY29tPgpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0K
IC4uLi9kaXNwbGF5L3BhbmVsL2FybWFkZXVzLHN0MDcwMC1hZGFwdC50eHQgICB8ICA5IC0tLS0t
CiAuLi4vZGlzcGxheS9wYW5lbC9hcm1hZGV1cyxzdDA3MDAtYWRhcHQueWFtbCAgfCAzMyArKysr
KysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXJtYWRldXMsc3QwNzAwLWFkYXB0LnR4dAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L2FybWFkZXVzLHN0MDcwMC1hZGFwdC55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXJtYWRldXMsc3QwNzAwLWFkYXB0LnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FybWFk
ZXVzLHN0MDcwMC1hZGFwdC50eHQKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGEzMGQ2
M2RiM2M4Zi4uMDAwMDAwMDAwMDAwCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2FybWFkZXVzLHN0MDcwMC1hZGFwdC50eHQKKysrIC9kZXYvbnVs
bApAQCAtMSw5ICswLDAgQEAKLUFybWFkZXVzIFNUMDcwMCBBZGFwdC4gQSBTYW50ZWsgU1QwNzAw
STVZLVJCU0xXIDcuMCIgV1ZHQSAoODAweDQ4MCkgVEZUIHdpdGgKLWFuIGFkYXB0ZXIgYm9hcmQu
Ci0KLVJlcXVpcmVkIHByb3BlcnRpZXM6Ci0tIGNvbXBhdGlibGU6ICJhcm1hZGV1cyxzdDA3MDAt
YWRhcHQiCi0tIHBvd2VyLXN1cHBseTogc2VlIHBhbmVsLWNvbW1vbi50eHQKLQotT3B0aW9uYWwg
cHJvcGVydGllczoKLS0gYmFja2xpZ2h0OiBzZWUgcGFuZWwtY29tbW9uLnR4dApkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXJtYWRl
dXMsc3QwNzAwLWFkYXB0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9hcm1hZGV1cyxzdDA3MDAtYWRhcHQueWFtbApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmE2YWRlNDcwNjZiMwotLS0gL2Rldi9udWxsCisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FybWFkZXVz
LHN0MDcwMC1hZGFwdC55YW1sCkBAIC0wLDAgKzEsMzMgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvYXJtYWRldXMsc3QwNzAwLWFkYXB0LnlhbWwjCiskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0
bGU6IEFybWFkZXVzIFNUMDcwMCBBZGFwdGVyCisKK2Rlc2NyaXB0aW9uOgorICBBIFNhbnRlayBT
VDA3MDBJNVktUkJTTFcgNy4wIiBXVkdBICg4MDB4NDgwKSBURlQgd2l0aCBhbiBhZGFwdGVyIGJv
YXJkLgorCittYWludGFpbmVyczoKKyAgLSAnIlPDqWJhc3RpZW4gU3p5bWFuc2tpIiA8c2ViYXN0
aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+JworICAtIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5
LnJlZGluZ0BnbWFpbC5jb20+CisKK2FsbE9mOgorICAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1s
IworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBhcm1hZGV1cyxzdDA3
MDAtYWRhcHQKKworICBwb3dlci1zdXBwbHk6IHRydWUKKyAgYmFja2xpZ2h0OiB0cnVlCisgIHBv
cnQ6IHRydWUKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK3JlcXVpcmVkOgorICAt
IGNvbXBhdGlibGUKKyAgLSBwb3dlci1zdXBwbHkKKworLi4uCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
