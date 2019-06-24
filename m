Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8F051D98
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 23:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3090589E2C;
	Mon, 24 Jun 2019 21:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE39689E08
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:59:00 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id m24so1757753ioo.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hgTCH8T1FFouuaZoULxX1dk9vJ97SA7YisaMIiZjBD4=;
 b=Kx/Zm9Md7YhrvkHrIjngiOgvBzocG4Hd0bKmir1B4Nh+nEkbHEbtrVZfwACclevxoI
 NVV9CRjt66NY8Ai1tXRDoA4hM0rYYQYo0aEab2nsteq1S6K2BUbjN1a4Tka6hqTRySfq
 WRfYqT1L0H9iUqNsMIOjj5mEQdiVURe7xCJcirCy+qX9BH8cQmXNWohl6XLbLVvfThmI
 Tqe3Qt58gALilX3TSlzk3KZwqaR+pZfcN4aFYjRipoQ0SsJ5S7ShV5uNOqR97JZyM3qQ
 sboWvwcRmWwVneShithhz3xYbVKK67hQ77eohrLgNY+Y96jSKAUjNjU8H0h+so/FuGA/
 nzWA==
X-Gm-Message-State: APjAAAVMfHxceIFQtUDr6r2d3hDQEOuNSbyoCCzLtDe784uPok+mzrSv
 4np/Nvl/mgAgeSiP7Gqhnu0z6OQ=
X-Google-Smtp-Source: APXvYqwpRjRUo5xyI5qpCoBZMiPUylQk+P5cFQRqkbHuKdgufy+mn/WStchkhrO7hxpKdKO0z38dag==
X-Received: by 2002:a02:600c:: with SMTP id i12mr14366350jac.108.1561413539674; 
 Mon, 24 Jun 2019 14:58:59 -0700 (PDT)
Received: from localhost.localdomain ([64.188.179.247])
 by smtp.googlemail.com with ESMTPSA id l5sm14717301ioq.83.2019.06.24.14.58.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 14:58:59 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 05/15] dt-bindings: display: Convert bananapi,
 s070wv20-ct16 panel to DT schema
Date: Mon, 24 Jun 2019 15:56:39 -0600
Message-Id: <20190624215649.8939-6-robh@kernel.org>
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

Q29udmVydCB0aGUgYmFuYW5hcGksczA3MHd2MjAtY3QxNiBwYW5lbCBiaW5kaW5nIHRvIERUIHNj
aGVtYS4KCkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1l
LnJpcGFyZEBib290bGluLmNvbT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
U2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KLS0tCiAuLi4vZGlz
cGxheS9wYW5lbC9iYW5hbmFwaSxzMDcwd3YyMC1jdDE2LnR4dCAgfCAxMiAtLS0tLS0tLS0tCiAu
Li4vZGlzcGxheS9wYW5lbC9iYW5hbmFwaSxzMDcwd3YyMC1jdDE2LnlhbWwgfCAyNCArKysrKysr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEyIGRlbGV0
aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2JhbmFuYXBpLHMwNzB3djIwLWN0MTYudHh0CiBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
YmFuYW5hcGksczA3MHd2MjAtY3QxNi55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYmFuYW5hcGksczA3MHd2MjAtY3QxNi50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9iYW5h
bmFwaSxzMDcwd3YyMC1jdDE2LnR4dApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMzVi
YzBjODM5ZjQ5Li4wMDAwMDAwMDAwMDAKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvYmFuYW5hcGksczA3MHd2MjAtY3QxNi50eHQKKysrIC9kZXYv
bnVsbApAQCAtMSwxMiArMCwwIEBACi1CYW5hbmEgUGkgNyIgKFMwNzBXVjIwLUNUMTYpIFRGVCBM
Q0QgUGFuZWwKLQotUmVxdWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJsZTogc2hvdWxkIGJl
ICJiYW5hbmFwaSxzMDcwd3YyMC1jdDE2IgotLSBwb3dlci1zdXBwbHk6IHNlZSAuL3BhbmVsLWNv
bW1vbi50eHQKLQotT3B0aW9uYWwgcHJvcGVydGllczoKLS0gZW5hYmxlLWdwaW9zOiBzZWUgLi9z
aW1wbGUtcGFuZWwudHh0Ci0tIGJhY2tsaWdodDogc2VlIC4vc2ltcGxlLXBhbmVsLnR4dAotCi1U
aGlzIGJpbmRpbmcgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZywg
d2hpY2ggaXMgc3BlY2lmaWVkCi1pbiAuL3NpbXBsZS1wYW5lbC50eHQuCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9iYW5hbmFwaSxz
MDcwd3YyMC1jdDE2LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9iYW5hbmFwaSxzMDcwd3YyMC1jdDE2LnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4yYzFkM2JmMmJhYTAKLS0tIC9kZXYvbnVsbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9iYW5hbmFwaSxz
MDcwd3YyMC1jdDE2LnlhbWwKQEAgLTAsMCArMSwyNCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMAorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvZGlzcGxheS9wYW5lbC9iYW5hbmFwaSxzMDcwd3YyMC1jdDE2LnlhbWwjCiskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0
bGU6IEJhbmFuYSBQaSA3IiAoUzA3MFdWMjAtQ1QxNikgVEZUIExDRCBQYW5lbAorCittYWludGFp
bmVyczoKKyAgLSBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+CisgIC0gVGhpZXJyeSBSZWRp
bmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KKworYWxsT2Y6CisgIC0gJHJlZjogcGFuZWwt
Y29tbW9uLnlhbWwjCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IGJh
bmFuYXBpLHMwNzB3djIwLWN0MTYKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHBv
d2VyLXN1cHBseQorCisuLi4KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
