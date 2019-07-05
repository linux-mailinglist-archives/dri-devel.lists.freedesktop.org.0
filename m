Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A148B60A71
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 18:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B691E6E50B;
	Fri,  5 Jul 2019 16:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DC26E509
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 16:42:32 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id m24so10880799ioo.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 09:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QmMSkEMpERvJyjJRrG5g4f+OapV9H/whTXHG0VCoTaM=;
 b=CKc/4uXrWzHe7N85nDFn5E0JuA/Qo7y35XW4t2FyuE7x2QB37Zgxbx+PZRPiSHszjM
 PLz4+5SbOHyDSgFg58bft3BmwuwhgclJ52WwZym/HihZhntFETy+pgfsDhM2an466eGm
 G1gqkaXedHcTFwvFfnMKR63I45gtDU4VbJ3DrzryTyaQ5RSDfHM1/fhBDDeddd4g02nB
 6LL3mo/bBTCcJAdV3nlU6y+kUUy10q/WEQT0egZPNkYkTlMQ9Aq2vDg3e9iDuLuPNOMf
 jM7GXCIZyErWpJedNwrB23Px7NeEtHfmXO97o1S0erfqL2TLzbMSiMylIMGIuf3eotcT
 6+2Q==
X-Gm-Message-State: APjAAAUIr5cW+GSQZyzVoPGlPr/W+pKJcXtqWFa6iqcjgqI3/LdzTN7I
 v1zZI4+w7ITCqo1r/IbKRnWhbQo=
X-Google-Smtp-Source: APXvYqwgijG0bDl9MQ8QMzy7JFWGEXki+c5Gsm88CadBQrl5AZgvMPes1qJpGkDYhMRNkc9YrsNmpg==
X-Received: by 2002:a02:8a:: with SMTP id 132mr5543519jaa.89.1562344950866;
 Fri, 05 Jul 2019 09:42:30 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id b8sm6878104ioj.16.2019.07.05.09.42.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 09:42:30 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 04/13] dt-bindings: display: Convert bananapi,
 s070wv20-ct16 panel to DT schema
Date: Fri,  5 Jul 2019 10:42:12 -0600
Message-Id: <20190705164221.4462-5-robh@kernel.org>
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

Q29udmVydCB0aGUgYmFuYW5hcGksczA3MHd2MjAtY3QxNiBwYW5lbCBiaW5kaW5nIHRvIERUIHNj
aGVtYS4KCkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1l
LnJpcGFyZEBib290bGluLmNvbT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
UmV2aWV3ZWQtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+ClNp
Z25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogLi4uL2Rpc3Bs
YXkvcGFuZWwvYmFuYW5hcGksczA3MHd2MjAtY3QxNi50eHQgIHwgMTIgLS0tLS0tLQogLi4uL2Rp
c3BsYXkvcGFuZWwvYmFuYW5hcGksczA3MHd2MjAtY3QxNi55YW1sIHwgMzEgKysrKysrKysrKysr
KysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9iYW5hbmFwaSxzMDcwd3YyMC1jdDE2LnR4dAogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2JhbmFu
YXBpLHMwNzB3djIwLWN0MTYueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2JhbmFuYXBpLHMwNzB3djIwLWN0MTYudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYmFuYW5hcGks
czA3MHd2MjAtY3QxNi50eHQKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDM1YmMwYzgz
OWY0OS4uMDAwMDAwMDAwMDAwCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL2JhbmFuYXBpLHMwNzB3djIwLWN0MTYudHh0CisrKyAvZGV2L251bGwK
QEAgLTEsMTIgKzAsMCBAQAotQmFuYW5hIFBpIDciIChTMDcwV1YyMC1DVDE2KSBURlQgTENEIFBh
bmVsCi0KLVJlcXVpcmVkIHByb3BlcnRpZXM6Ci0tIGNvbXBhdGlibGU6IHNob3VsZCBiZSAiYmFu
YW5hcGksczA3MHd2MjAtY3QxNiIKLS0gcG93ZXItc3VwcGx5OiBzZWUgLi9wYW5lbC1jb21tb24u
dHh0Ci0KLU9wdGlvbmFsIHByb3BlcnRpZXM6Ci0tIGVuYWJsZS1ncGlvczogc2VlIC4vc2ltcGxl
LXBhbmVsLnR4dAotLSBiYWNrbGlnaHQ6IHNlZSAuL3NpbXBsZS1wYW5lbC50eHQKLQotVGhpcyBi
aW5kaW5nIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgc2ltcGxlLXBhbmVsIGJpbmRpbmcsIHdoaWNo
IGlzIHNwZWNpZmllZAotaW4gLi9zaW1wbGUtcGFuZWwudHh0LgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYmFuYW5hcGksczA3MHd2
MjAtY3QxNi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvYmFuYW5hcGksczA3MHd2MjAtY3QxNi55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAwMC4uYmJmMTI3ZmIyOGY3Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYmFuYW5hcGksczA3MHd2
MjAtY3QxNi55YW1sCkBAIC0wLDAgKzEsMzEgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL2Rpc3BsYXkvcGFuZWwvYmFuYW5hcGksczA3MHd2MjAtY3QxNi55YW1sIworJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBC
YW5hbmEgUGkgNyIgKFMwNzBXVjIwLUNUMTYpIFRGVCBMQ0QgUGFuZWwKKworbWFpbnRhaW5lcnM6
CisgIC0gQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgorICAtIFRoaWVycnkgUmVkaW5nIDx0
aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CisKK2FsbE9mOgorICAtICRyZWY6IHBhbmVsLWNvbW1v
bi55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBiYW5hbmFw
aSxzMDcwd3YyMC1jdDE2CisKKyAgcG93ZXItc3VwcGx5OiB0cnVlCisgIGJhY2tsaWdodDogdHJ1
ZQorICBlbmFibGUtZ3Bpb3M6IHRydWUKKyAgcG9ydDogdHJ1ZQorCithZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHBvd2VyLXN1cHBs
eQorCisuLi4KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
