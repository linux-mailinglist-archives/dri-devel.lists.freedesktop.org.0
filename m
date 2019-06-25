Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A374952464
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB4289FA5;
	Tue, 25 Jun 2019 07:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10E889E05
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 04:05:50 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id p15so16959736qtl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F/H9mhykvcAZ9M5E21oIuq11gruwI8sC3aDFsjVhfLA=;
 b=HhCrbRFTws/YFQlIRaN0Rw7Nlxcwsqrf5IP0vB5hCx8NHUx5MxIwjMQy5LCsQ3j/pr
 HdjTNArJGr8i+eSQKgOlHVzbAu9r0cVJNWTG6k+Xf4ECjKkfCMwNkc6uYsDqnRpCqTdW
 8cao4mQyj3P7gokIkObFWIBtBvz3shbrN0YenY2Y2GzGuZrf66v6DIrCA5BdGtAQkmLk
 BPWHWLhcGx0R7o4neYZm9ByYxOXlPAD9sVhvRjLaJVTS7sjIn9TXjNkyqDBWARrtF19t
 noSv1+MOvR/WJWjiLw/f5qXQxSf8Ee/rSjTuMPEUPc5X93nyiZJZtGoUBB4mAiP1zUoc
 rJfQ==
X-Gm-Message-State: APjAAAVEXU95CYlqC7ramLGl0AyvVztSNKEHHCIY2y+CgbcXb7q88sdL
 wV/40kAvMsB7/x8LVkPP+Co=
X-Google-Smtp-Source: APXvYqxXe8tsbgRJmd17Zj3c4OOToNNWkyBm0yZgfuVdU9s3UQK/icgRIdyQeLqTBUNFHuJE2FmkfQ==
X-Received: by 2002:ac8:4413:: with SMTP id j19mr38266381qtn.281.1561435549920; 
 Mon, 24 Jun 2019 21:05:49 -0700 (PDT)
Received: from bdodge-linux-ub.fios-router.home
 (pool-100-0-123-202.bstnma.fios.verizon.net. [100.0.123.202])
 by smtp.gmail.com with ESMTPSA id e8sm6741029qkn.95.2019.06.24.21.05.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Jun 2019 21:05:49 -0700 (PDT)
From: Brian Dodge <bdodge09@gmail.com>
To: pavel@ucw.cz
Subject: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for ArcticSand
 arcxcnn driver bindings
Date: Tue, 25 Jun 2019 00:05:28 -0400
Message-Id: <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F/H9mhykvcAZ9M5E21oIuq11gruwI8sC3aDFsjVhfLA=;
 b=ImTlavZZ/bV3BqPdDgzZzSx81N6BtUPPYK8L+VKevY8ztou4g0HCa7bVSVaT1WhH3g
 pjuHfv0YEeoMuNRlImknK7dLVzZwuVe0qMvf708fGnJd7PjB+S0Hb7+2nX+4IMqZDGZU
 h3QiLXfTN8E2Ze7ljMKdGDZRrp7mmrnnjTQXefX+WLTH+Mp/3GsBirQ3qKzfu+3PZ8f1
 59HfeXMP2Ro3lVd/A6gQrIAeLVjGjTMgNS/TGOMKuryQtgFK3RSMdYYRA6GWHu5mYm0S
 um/fAu5u4cZmK4lDDK43B16CCiGGqA0rS6+YL7xCclhquGOPrIeeVwwNmNmXpWZ2DYtL
 8U1w==
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 Brian Dodge <bdodge09@gmail.com>, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pbacon@psemi.com, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICAgIFRoZSB2ZW5kb3ItcHJlZml4ZXMudHh0IGZpbGUgcHJvcGVybHkgcmVmZXJzIHRvIEFyY3Rp
Y1NhbmQKICAgIGFzIGFyY3RpYyBidXQgdGhlIGRyaXZlciBiaW5kaW5ncyBpbXByb3Blcmx5IGFi
YnJldmlhdGVkIHRoZQogICAgcHJlZml4IHRvIGFyYy4gVGhpcyB3YXMgYSBtaXN0YWtlIGluIHRo
ZSBvcmlnaW5hbCBwYXRjaAoKU2lnbmVkLW9mZi1ieTogQnJpYW4gRG9kZ2UgPGJkb2RnZTA5QGdt
YWlsLmNvbT4KLS0tCiAuLi4vYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvYXJjeGNubl9ibC50eHQg
ICAgICAgICB8IDI0ICsrKysrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvYXJjeGNubl9ibC50eHQgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvYXJjeGNubl9ibC50
eHQKaW5kZXggMjMwYWJkZS4uOWNmNGM0NCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2FyY3hjbm5fYmwudHh0CisrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9hcmN4Y25uX2JsLnR4
dApAQCAtMSw4ICsxLDEyIEBACi1CaW5kaW5nIGZvciBBcmN0aWNTYW5kIGFyYzJjMDYwOCBMRUQg
ZHJpdmVyCitCaW5kaW5nIGZvciBBcmN0aWNTYW5kIGFyYyBmYW1pbHkgTEVEIGRyaXZlcnMKIAog
UmVxdWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJsZToJCXNob3VsZCBiZSAiYXJjLGFyYzJj
MDYwOCIKLS0gcmVnOgkJCXNsYXZlIGFkZHJlc3MKKy0gY29tcGF0aWJsZTogb25lIG9mCisJImFy
Y3RpYyxhcmMxYzA2MDgiCisJImFyY3RpYyxhcmMyYzA2MDgiCisJImFyY3RpYyxhcmMzYzA4NDUi
CisKKy0gcmVnOgkJc2xhdmUgYWRkcmVzcwogCiBPcHRpb25hbCBwcm9wZXJ0aWVzOgogLSBkZWZh
dWx0LWJyaWdodG5lc3M6CWJyaWdodG5lc3MgdmFsdWUgb24gYm9vdCwgdmFsdWUgZnJvbTogMC00
MDk1CkBAIC0xMSwxOSArMTUsMTkgQEAgT3B0aW9uYWwgcHJvcGVydGllczoKIC0gbGVkLXNvdXJj
ZXM6CQlMaXN0IG9mIGVuYWJsZWQgY2hhbm5lbHMgZnJvbSAwIHRvIDUuCiAJCQlTZWUgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvY29tbW9uLnR4dAogCi0tIGFyYyxsZWQt
Y29uZmlnLTA6CXNldHRpbmcgZm9yIHJlZ2lzdGVyIElMRURfQ09ORklHXzAKLS0gYXJjLGxlZC1j
b25maWctMToJc2V0dGluZyBmb3IgcmVnaXN0ZXIgSUxFRF9DT05GSUdfMQotLSBhcmMsZGltLWZy
ZXE6CQlQV00gbW9kZSBmcmVxdWVuY2Ugc2V0dGluZyAoYml0cyBbMzowXSB1c2VkKQotLSBhcmMs
Y29tcC1jb25maWc6CXNldHRpbmcgZm9yIHJlZ2lzdGVyIENPTkZJR19DT01QCi0tIGFyYyxmaWx0
ZXItY29uZmlnOglzZXR0aW5nIGZvciByZWdpc3RlciBGSUxURVJfQ09ORklHCi0tIGFyYyx0cmlt
LWNvbmZpZzoJc2V0dGluZyBmb3IgcmVnaXN0ZXIgSU1BWFRVTkUKKy0gYXJjdGljLGxlZC1jb25m
aWctMDoJc2V0dGluZyBmb3IgcmVnaXN0ZXIgSUxFRF9DT05GSUdfMAorLSBhcmN0aWMsbGVkLWNv
bmZpZy0xOglzZXR0aW5nIGZvciByZWdpc3RlciBJTEVEX0NPTkZJR18xCistIGFyY3RpYyxkaW0t
ZnJlcToJCVBXTSBtb2RlIGZyZXF1ZW5jZSBzZXR0aW5nIChiaXRzIFszOjBdIHVzZWQpCistIGFy
Y3RpYyxjb21wLWNvbmZpZzoJc2V0dGluZyBmb3IgcmVnaXN0ZXIgQ09ORklHX0NPTVAKKy0gYXJj
dGljLGZpbHRlci1jb25maWc6CXNldHRpbmcgZm9yIHJlZ2lzdGVyIEZJTFRFUl9DT05GSUcKKy0g
YXJjdGljLHRyaW0tY29uZmlnOglzZXR0aW5nIGZvciByZWdpc3RlciBJTUFYVFVORQogCiBOb3Rl
OiBPcHRpb25hbCBwcm9wZXJ0aWVzIG5vdCBzcGVjaWZpZWQgd2lsbCBkZWZhdWx0IHRvIHZhbHVl
cyBpbiBJQyBFUFJPTQogCiBFeGFtcGxlOgogCiBhcmMyYzA2MDhAMzAgewotCWNvbXBhdGlibGUg
PSAiYXJjLGFyYzJjMDYwOCI7CisJY29tcGF0aWJsZSA9ICJhcmN0aWMsYXJjMmMwNjA4IjsKIAly
ZWcgPSA8MHgzMD47CiAJZGVmYXVsdC1icmlnaHRuZXNzID0gPDUwMD47CiAJbGFiZWwgPSAibGNk
LWJhY2tsaWdodCI7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
