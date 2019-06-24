Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E043F51DA9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 23:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E85889E50;
	Mon, 24 Jun 2019 21:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D0889E0E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:59:04 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id w25so5016607ioc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qxcMK+QpGg0slednYV4FulPMcMSYDpcVW7BBUR9mgVE=;
 b=Suu3e8rjsQG+3XVftyAT0PCu6GhdWpN801TLPw02e//HpcCdVCuzjDkmZ1xcSZrylw
 KCEzQcOf3XFyFOyfjcqqF48vV+81m30+IgolFMQOiPuc27Jrfr/xyT72pug0xtFYjWPC
 MUkhUQ3QOLR5bfiRvz/a7TslwTNEZkMYatnC4TTfygObU4FUEmOBmDfUtkHpGMqX6OU5
 ImhqUNpbvfYeygu5se7VimrDAOkxIksunzapw00K4AoKQGegUKu0jELllGtYVXRDAv0q
 HBClXHtPLjgL2rgDEWDFth2ZvlHP5Wz6ZK5w/zced7a9CMyM5NsoSarU2hu1vDPbquoA
 6png==
X-Gm-Message-State: APjAAAUoijYeve7IoO3fPDPRcWoaLLCzpbedeFJiOHoapSrIVgywgndA
 j8havXhLLeeUAAUUcbL2aMG+4Tg=
X-Google-Smtp-Source: APXvYqzwIKIeLoUlThoycHNFqIx8+o4MBi9fk3uxcSvOOQ8J69Gxs8VFNebAx//J6Y37gExO+ippjA==
X-Received: by 2002:a5d:81c6:: with SMTP id t6mr483058iol.86.1561413543153;
 Mon, 24 Jun 2019 14:59:03 -0700 (PDT)
Received: from localhost.localdomain ([64.188.179.247])
 by smtp.googlemail.com with ESMTPSA id l5sm14717301ioq.83.2019.06.24.14.59.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 14:59:02 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 07/15] dt-bindings: display: Convert pda,
 91-00156-a0 panel to DT schema
Date: Mon, 24 Jun 2019 15:56:41 -0600
Message-Id: <20190624215649.8939-8-robh@kernel.org>
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

Q29udmVydCB0aGUgcGRhLDkxLTAwMTU2LWEwIHBhbmVsIGJpbmRpbmcgdG8gRFQgc2NoZW1hLgoK
Q2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJk
QGJvb3RsaW4uY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQt
b2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIC4uLi9kaXNwbGF5L3Bh
bmVsL3BkYSw5MS0wMDE1Ni1hMC50eHQgICAgICAgICB8IDE0IC0tLS0tLS0tLS0tCiAuLi4vZGlz
cGxheS9wYW5lbC9wZGEsOTEtMDAxNTYtYTAueWFtbCAgICAgICAgfCAyNSArKysrKysrKysrKysr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL3BkYSw5MS0wMDE1Ni1hMC50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wZGEsOTEtMDAxNTYt
YTAueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL3BkYSw5MS0wMDE1Ni1hMC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wZGEsOTEtMDAxNTYtYTAudHh0CmRlbGV0ZWQgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAxNjM5ZmIxN2E5ZjAuLjAwMDAwMDAwMDAwMAotLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wZGEsOTEtMDAxNTYt
YTAudHh0CisrKyAvZGV2L251bGwKQEAgLTEsMTQgKzAsMCBAQAotUERBIDkxLTAwMTU2LUEwIDUu
MCIgV1ZHQSBURlQgTENEIHBhbmVsCi0KLVJlcXVpcmVkIHByb3BlcnRpZXM6Ci0tIGNvbXBhdGli
bGU6IHNob3VsZCBiZSAicGRhLDkxLTAwMTU2LWEwIgotLSBwb3dlci1zdXBwbHk6IHRoaXMgcGFu
ZWwgcmVxdWlyZXMgYSBzaW5nbGUgcG93ZXIgc3VwcGx5LiBBIHBoYW5kbGUgdG8gYQotcmVndWxh
dG9yIG5lZWRzIHRvIGJlIHNwZWNpZmllZCBoZXJlLiBDb21wYXRpYmxlIHdpdGggcGFuZWwtY29t
bW9uIGJpbmRpbmcgd2hpY2gKLWlzIHNwZWNpZmllZCBpbiB0aGUgcGFuZWwtY29tbW9uLnR4dCBp
biB0aGlzIGRpcmVjdG9yeS4KLS0gYmFja2xpZ2h0OiB0aGlzIHBhbmVsJ3MgYmFja2xpZ2h0IGlz
IGNvbnRyb2xsZWQgYnkgYW4gZXh0ZXJuYWwgYmFja2xpZ2h0Ci1jb250cm9sbGVyLiBBIHBoYW5k
bGUgdG8gdGhpcyBjb250cm9sbGVyIG5lZWRzIHRvIGJlIHNwZWNpZmllZCBoZXJlLgotQ29tcGF0
aWJsZSB3aXRoIHBhbmVsLWNvbW1vbiBiaW5kaW5nIHdoaWNoIGlzIHNwZWNpZmllZCBpbiB0aGUg
cGFuZWwtY29tbW9uLnR4dAotaW4gdGhpcyBkaXJlY3RvcnkuCi0KLVRoaXMgYmluZGluZyBpcyBj
b21wYXRpYmxlIHdpdGggdGhlIHNpbXBsZS1wYW5lbCBiaW5kaW5nLCB3aGljaCBpcyBzcGVjaWZp
ZWQKLWluIHNpbXBsZS1wYW5lbC50eHQgaW4gdGhpcyBkaXJlY3RvcnkuCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wZGEsOTEtMDAx
NTYtYTAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3BkYSw5MS0wMDE1Ni1hMC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwMC4uY2VhNWJjYjNjNDU1Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGRhLDkxLTAwMTU2LWEwLnlhbWwKQEAg
LTAsMCArMSwyNSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorJVlBTUwg
MS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5l
bC9wZGEsOTEtMDAxNTYtYTAueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogUERBIDkxLTAwMTU2LUEwIDUuMCIgV1ZH
QSBURlQgTENEIHBhbmVsCisKK21haW50YWluZXJzOgorICAtIENyaXN0aWFuIEJpcnNhbiA8Y3Jp
c3RpYW4uYmlyc2FuQG1pY3JvY2hpcC5jb20+CisgIC0gVGhpZXJyeSBSZWRpbmcgPHRoaWVycnku
cmVkaW5nQGdtYWlsLmNvbT4KKworYWxsT2Y6CisgIC0gJHJlZjogcGFuZWwtY29tbW9uLnlhbWwj
CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IHBkYSw5MS0wMDE1Ni1h
MAorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcG93ZXItc3VwcGx5CisgIC0gYmFj
a2xpZ2h0CisKKy4uLgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
