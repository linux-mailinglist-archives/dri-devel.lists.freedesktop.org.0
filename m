Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 675744C351
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 23:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3506E488;
	Wed, 19 Jun 2019 21:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23A56E47B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 21:52:05 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id j6so226270ioa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 14:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dd4ooG4oZ5quaRJjovQGgQXOJNXz7s0BukxLIFDFMFQ=;
 b=JbkADqsLSnizojgFnOSFdLRRitzB8yAL/N16HmBceJpWeW1An97k2AOBRL98IFqBQO
 OAAe3PCzXvzHZ2ySVco41vMfYPoGeQQHre6Nywf3M9vFKx8Qx4/vaIZ/q8n4Xhd1Nr36
 3Va6sjEt2WcncNhz0/PieKUNXFPoOH8nvmtbWqBz9XbeYx7abhRYi3T1DGfbkmjqH7s/
 fTzpiOU9g80zL7jvcFxFjllbUQEs6fj1+aeqsFE9MGjUgQWrDD94gwsB7N4WmRW1kodV
 Try+KAoCQyvmaJCNKCQHQLJ4QuB+X+JaAC6ViiYDheeQDKbaQx2qSPBQ7WN46df7yRj2
 PIpg==
X-Gm-Message-State: APjAAAUG+Ya523f94LEC2bpoBuEfs9yFI7E2N7COrkfTc/bGl0VxZFps
 Qji5FQV+CjdCvsw1GDBOEKo1nNs=
X-Google-Smtp-Source: APXvYqwE+rBJQkU4kUQX0ZcDA2CS6gXiPS9jFB3GaDr51ImQSjFmxMcfECk9Z2iW7YLikj0LRhpASQ==
X-Received: by 2002:a5d:9957:: with SMTP id v23mr2607174ios.117.1560981124982; 
 Wed, 19 Jun 2019 14:52:04 -0700 (PDT)
Received: from localhost.localdomain ([64.188.179.247])
 by smtp.googlemail.com with ESMTPSA id e84sm37754698iof.39.2019.06.19.14.52.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 14:52:04 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 4/4] dt-bindings: display: Convert innolux,
 ee101ia-01 panel to DT schema
Date: Wed, 19 Jun 2019 15:51:56 -0600
Message-Id: <20190619215156.27795-4-robh@kernel.org>
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

Q29udmVydCB0aGUgaW5ub2x1eCxlZTEwMWlhLTAxIExWRFMgcGFuZWwgYmluZGluZyB0byBEVCBz
Y2hlbWEuCgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
ClNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogLi4uL2Rp
c3BsYXkvcGFuZWwvaW5ub2x1eCxlZTEwMWlhLTAxZC50eHQgICAgIHwgIDcgLS0tLS0tLQogLi4u
L2Rpc3BsYXkvcGFuZWwvaW5ub2x1eCxlZTEwMWlhLTAxZC55YW1sICAgIHwgMjEgKysrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL2lubm9sdXgsZWUxMDFpYS0wMWQudHh0CiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvaW5ub2x1
eCxlZTEwMWlhLTAxZC55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvaW5ub2x1eCxlZTEwMWlhLTAxZC50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5vbHV4LGVlMTAxaWEt
MDFkLnR4dApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTVjYTRjY2Q1NWVkLi4wMDAw
MDAwMDAwMDAKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvaW5ub2x1eCxlZTEwMWlhLTAxZC50eHQKKysrIC9kZXYvbnVsbApAQCAtMSw3ICswLDAg
QEAKLUlubm9sdXggQ29ycG9yYXRpb24gMTAuMSIgRUUxMDFJQS0wMUQgV1hHQSAoMTI4MHg4MDAp
IExWRFMgcGFuZWwKLQotUmVxdWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJsZTogc2hvdWxk
IGJlICJpbm5vbHV4LGVlMTAxaWEtMDFkIgotCi1UaGlzIGJpbmRpbmcgaXMgY29tcGF0aWJsZSB3
aXRoIHRoZSBsdmRzLXBhbmVsIGJpbmRpbmcsIHdoaWNoIGlzIHNwZWNpZmllZAotaW4gcGFuZWwt
bHZkcy50eHQgaW4gdGhpcyBkaXJlY3RvcnkuCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5vbHV4LGVlMTAxaWEtMDFkLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5vbHV4
LGVlMTAxaWEtMDFkLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAw
Li41M2QwZTljNjE2OWYKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5vbHV4LGVlMTAxaWEtMDFkLnlhbWwKQEAgLTAs
MCArMSwyMSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorJVlBTUwgMS4y
CistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9p
bm5vbHV4LGVlMTAxaWEtMDFkLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IElubm9sdXggQ29ycG9yYXRpb24gMTAu
MSIgRUUxMDFJQS0wMUQgV1hHQSAoMTI4MHg4MDApIExWRFMgcGFuZWwKKworbWFpbnRhaW5lcnM6
CisgIC0gVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KKworYWxsT2Y6
CisgIC0gJHJlZjogcGFuZWwtbHZkcy55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxl
OgorICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDogaW5ub2x1eCxlZTEwMWlhLTAxZAorICAgICAg
LSB7fSAjIHBhbmVsLWx2ZHMsIGJ1dCBub3QgbGlzdGVkIGhlcmUgdG8gYXZvaWQgZmFsc2Ugc2Vs
ZWN0CisKKy4uLgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
