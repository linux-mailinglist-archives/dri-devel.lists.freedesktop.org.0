Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C34F260A75
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 18:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DF66E511;
	Fri,  5 Jul 2019 16:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008706E50E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 16:42:39 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id e5so15979930iok.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 09:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2tWKOZQN5j63GOMW8bPg2YdYLUphNbaDT5/UX97P/uo=;
 b=ijbNHNlo1bQnn+KHnBDK9Jf/joBIMmrcievMdnuq4ulO7I4Ngj8ddySV/D2xto0Pyd
 bOgl8srTjdiXb4iSl92Sd39B8QIXuhX1B07ynfQk4iQkxiXdGB2o2pYWOmLNyaz/Pqol
 MW1lLhdwhARSFTJnyxQOxouJ/jbMQRqE1mHQWnlKHMcDIh1/avB6676XvUqqrkOEfyYc
 Yecy6xzGIjYLtgxSLx3BBLE1aAyHKjVPfLj3OJlrahrzRALG5UWYsfDnVMIz0X5FqXY+
 pJWT7URVaVRrmcwtQfZiiuGumRqZiZlYFoMFfVAqi0Cvz8e8bgQUGLa8APH9+ZelPu0d
 xWuQ==
X-Gm-Message-State: APjAAAXAUt/a4NQF5JA7uUVG293V9+hV/YAmMWTRhoDICC04PH5M34bU
 EfyOVN9We5z/IKtJ708GQ/H7e34=
X-Google-Smtp-Source: APXvYqx9WdfjM+nTIv22HXckRghmE2QP5JiFVcCPJrnBeuFT1r//qxUAqUxKtMJB63QyW5QCB7T/Qw==
X-Received: by 2002:a5d:8890:: with SMTP id d16mr2919578ioo.274.1562344958138; 
 Fri, 05 Jul 2019 09:42:38 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id b8sm6878104ioj.16.2019.07.05.09.42.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 09:42:37 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 08/13] dt-bindings: display: Convert tfc,
 s9700rtwv43tr-01b panel to DT schema
Date: Fri,  5 Jul 2019 10:42:16 -0600
Message-Id: <20190705164221.4462-9-robh@kernel.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Heiko Stuebner <heiko.stuebner@bq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCB0aGUgdGZjLHM5NzAwcnR3djQzdHItMDFiIHBhbmVsIGJpbmRpbmcgdG8gRFQgc2No
ZW1hLgoKQ2M6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckBicS5jb20+CkNjOiBUaGll
cnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgpDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpSZXZp
ZXdlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KU2lnbmVk
LW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KLS0tCiAuLi4vZGlzcGxheS9w
YW5lbC90ZmMsczk3MDBydHd2NDN0ci0wMWIudHh0ICAgfCAxNSAtLS0tLS0tLS0KIC4uLi9kaXNw
bGF5L3BhbmVsL3RmYyxzOTcwMHJ0d3Y0M3RyLTAxYi55YW1sICB8IDMzICsrKysrKysrKysrKysr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0p
CiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvdGZjLHM5NzAwcnR3djQzdHItMDFiLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3RmYyxzOTcw
MHJ0d3Y0M3RyLTAxYi55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvdGZjLHM5NzAwcnR3djQzdHItMDFiLnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3RmYyxzOTcwMHJ0d3Y0
M3RyLTAxYi50eHQKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGRmYjU3MmYwODVlYi4u
MDAwMDAwMDAwMDAwCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3RmYyxzOTcwMHJ0d3Y0M3RyLTAxYi50eHQKKysrIC9kZXYvbnVsbApAQCAtMSwx
NSArMCwwIEBACi1URkMgUzk3MDBSVFdWNDNUUi0wMUIgNyIgVGhyZWUgRml2ZSBDb3JwIDgwMHg0
ODAgTENEIHBhbmVsIHdpdGgKLXJlc2lzdGl2ZSB0b3VjaAotCi1UaGUgcGFuZWwgaXMgZm91bmQg
b24gVEkgQU0zMzV4LWV2bS4KLQotUmVxdWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJsZTog
c2hvdWxkIGJlICJ0ZmMsczk3MDBydHd2NDN0ci0wMWIiCi0tIHBvd2VyLXN1cHBseTogU2VlIHBh
bmVsLWNvbW1vbi50eHQKLQotT3B0aW9uYWwgcHJvcGVydGllczoKLS0gZW5hYmxlLWdwaW9zOiBH
UElPIHBpbiB0byBlbmFibGUgb3IgZGlzYWJsZSB0aGUgcGFuZWwsIGlmIHRoZXJlIGlzIG9uZQot
LSBiYWNrbGlnaHQ6IHBoYW5kbGUgb2YgdGhlIGJhY2tsaWdodCBkZXZpY2UgYXR0YWNoZWQgdG8g
dGhlIHBhbmVsCi0KLVRoaXMgYmluZGluZyBpcyBjb21wYXRpYmxlIHdpdGggdGhlIHNpbXBsZS1w
YW5lbCBiaW5kaW5nLCB3aGljaCBpcyBzcGVjaWZpZWQKLWluIHNpbXBsZS1wYW5lbC50eHQgaW4g
dGhpcyBkaXJlY3RvcnkuCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC90ZmMsczk3MDBydHd2NDN0ci0wMWIueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3RmYyxzOTcwMHJ0d3Y0M3Ry
LTAxYi55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uOWU1OTk0
NDE3YzEyCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvdGZjLHM5NzAwcnR3djQzdHItMDFiLnlhbWwKQEAgLTAsMCArMSwz
MyBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorJVlBTUwgMS4yCistLS0K
KyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC90ZmMsczk3
MDBydHd2NDN0ci0wMWIueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRh
LXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogVEZDIFM5NzAwUlRXVjQzVFItMDFCIDciIFRo
cmVlIEZpdmUgQ29ycCA4MDB4NDgwIExDRCBwYW5lbCB3aXRoIHJlc2lzdGl2ZSB0b3VjaAorCitt
YWludGFpbmVyczoKKyAgLSBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgorICAtIFRoaWVycnkg
UmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CisKK2Rlc2NyaXB0aW9uOiB8KworICBU
aGUgcGFuZWwgaXMgZm91bmQgb24gVEkgQU0zMzV4LWV2bS4KKworYWxsT2Y6CisgIC0gJHJlZjog
cGFuZWwtY29tbW9uLnlhbWwjCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29u
c3Q6IHRmYyxzOTcwMHJ0d3Y0M3RyLTAxYgorCisgIGVuYWJsZS1ncGlvczogdHJ1ZQorICBiYWNr
bGlnaHQ6IHRydWUKKyAgcG9ydDogdHJ1ZQorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UK
KworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHBvd2VyLXN1cHBseQorCisuLi4KLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
