Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2FC5B58C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 09:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DFA89E1D;
	Mon,  1 Jul 2019 07:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707E889D81
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 00:28:35 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id s22so9690616qkj.12
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 17:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HKNvw3apNedvPNTZXgfoh6gluQQ+cVAOJ/uV9fQblt8=;
 b=PIUQ2fKiKpnRxSha/rKwoNU9KOv8xNbZKoMe9IBpSZ9SACpK3YqapMybDgi1yeWrPt
 fisHOhNYxvT94LTQIWuy7RwlhaAWHXPFUIIHYaUS39Hb8aKE03kMc6FxeciQrfjEC2bU
 DJek/DDFZ5qj2hX9WI9mJp1Z5vEy3+0Iw9ppGc6k9qzosqmUgnE9PHo8rSou64rqLWyV
 OOVVBrUD360RVwL3PpSGSSEp1lf0//ToV5ngqo5Ok0d0olprNcbsHuIVdHp2vp6fv4n7
 TvNyKl8Q7bZb34HxAHHEevLLgRqLZjJXfRjyOvAH+NKq10gRWMcMjxAQPiBjehlQlTfb
 S/WA==
X-Gm-Message-State: APjAAAVMavObo/BEBjNTiZZXejOZ6bBoxF8XmCyywza0V5qrjdYrrJ82
 x2sUOZVgiK1GNWJ1l4FaCcI=
X-Google-Smtp-Source: APXvYqyPFGUYsrCeq17oaPYdrWNxFEHboE/ILrbLppbw6ARNF392bJ8ysvYwaXD8bKQm3GhOsE4LgA==
X-Received: by 2002:a05:620a:13f9:: with SMTP id
 h25mr16514567qkl.283.1561940914554; 
 Sun, 30 Jun 2019 17:28:34 -0700 (PDT)
Received: from bdodge-linux-ub.fios-router.home
 (pool-100-0-123-202.bstnma.fios.verizon.net. [100.0.123.202])
 by smtp.gmail.com with ESMTPSA id 70sm3971404qkj.118.2019.06.30.17.28.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 30 Jun 2019 17:28:33 -0700 (PDT)
From: Brian Dodge <bdodge09@gmail.com>
To: pavel@ucw.cz
Subject: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for ArcticSand
 arcxcnn driver bindings
Date: Sun, 30 Jun 2019 20:28:14 -0400
Message-Id: <1561940895-15837-2-git-send-email-bdodge09@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
References: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
X-Mailman-Approved-At: Mon, 01 Jul 2019 07:12:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HKNvw3apNedvPNTZXgfoh6gluQQ+cVAOJ/uV9fQblt8=;
 b=XjQMQpqpIfiJexl2wv5HW5IaOomJjJQGNmkMKYB+fXK58Kq7SIo+FIlb3LuTRL1c4K
 WQxHSsRLAQ4ZHBtXnx53zYgJkiUCaCO27l6ykRXWNZxcqHJwa01PcRhPur4ufuuVoUw0
 1Y3u0t3krgG0wjvMAjSQeqAwgq/IhAiWLtOyUpfqRYPL7os/TMnWSQutYKBRDm9qlxqJ
 /l8VHWjmji8eCz7F7y5i0j1DkGwdU96bzDuMvq73wsM9F0m5LjMDslLhmesJVdsIqmZm
 RCn1EdCFSsU57KI6JVqf9Tk/Xn69aEeNIL/cXiLckYYlfgOV4LKGRPpbHVNnADa6v1Th
 SfkA==
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

VGhlIHZlbmRvci1wcmVmaXhlcy50eHQgZmlsZSBwcm9wZXJseSByZWZlcnMgdG8gQXJjdGljU2Fu
ZAphcyBhcmN0aWMgYnV0IHRoZSBkcml2ZXIgYmluZGluZ3MgaW1wcm9wZXJseSBhYmJyZXZpYXRl
ZCB0aGUKcHJlZml4IHRvIGFyYy4gVGhpcyB3YXMgYSBtaXN0YWtlIGluIHRoZSBvcmlnaW5hbCBw
YXRjaC4gVGhpcwpwYXRjaCBhZGRzICJhcmN0aWMiIGFuZCByZXRhaW5zICJhcmMiIChkZXByZWNh
dGVkKSBiaW5kaW5ncwoKU2lnbmVkLW9mZi1ieTogQnJpYW4gRG9kZ2UgPGJkb2RnZTA5QGdtYWls
LmNvbT4KLS0tCiAuLi4vYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvYXJjeGNubl9ibC50eHQgICAg
ICAgICB8IDMxICsrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvYXJjeGNubl9ibC50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvYXJjeGNubl9ibC50eHQK
aW5kZXggMjMwYWJkZS4uNGQ5ODM5NCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2FyY3hjbm5fYmwudHh0CisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9hcmN4Y25uX2JsLnR4dApA
QCAtMSw4ICsxLDEzIEBACi1CaW5kaW5nIGZvciBBcmN0aWNTYW5kIGFyYzJjMDYwOCBMRUQgZHJp
dmVyCitCaW5kaW5nIGZvciBBcmN0aWNTYW5kIGFyYyBmYW1pbHkgTEVEIGRyaXZlcnMKIAogUmVx
dWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJsZToJCXNob3VsZCBiZSAiYXJjLGFyYzJjMDYw
OCIKLS0gcmVnOgkJCXNsYXZlIGFkZHJlc3MKKy0gY29tcGF0aWJsZTogb25lIG9mCisJImFyY3Rp
YyxhcmMxYzA2MDgiCisJImFyY3RpYyxhcmMyYzA2MDgiCisJImFyY3RpYyxhcmMzYzA4NDUiCisJ
ImFyYyxhcmMyYzA2MDgiIChkZXByZWNhdGVkKQorCistIHJlZzoJCXNsYXZlIGFkZHJlc3MKIAog
T3B0aW9uYWwgcHJvcGVydGllczoKIC0gZGVmYXVsdC1icmlnaHRuZXNzOglicmlnaHRuZXNzIHZh
bHVlIG9uIGJvb3QsIHZhbHVlIGZyb206IDAtNDA5NQpAQCAtMTEsMTkgKzE2LDI1IEBAIE9wdGlv
bmFsIHByb3BlcnRpZXM6CiAtIGxlZC1zb3VyY2VzOgkJTGlzdCBvZiBlbmFibGVkIGNoYW5uZWxz
IGZyb20gMCB0byA1LgogCQkJU2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9s
ZWRzL2NvbW1vbi50eHQKIAotLSBhcmMsbGVkLWNvbmZpZy0wOglzZXR0aW5nIGZvciByZWdpc3Rl
ciBJTEVEX0NPTkZJR18wCi0tIGFyYyxsZWQtY29uZmlnLTE6CXNldHRpbmcgZm9yIHJlZ2lzdGVy
IElMRURfQ09ORklHXzEKLS0gYXJjLGRpbS1mcmVxOgkJUFdNIG1vZGUgZnJlcXVlbmNlIHNldHRp
bmcgKGJpdHMgWzM6MF0gdXNlZCkKLS0gYXJjLGNvbXAtY29uZmlnOglzZXR0aW5nIGZvciByZWdp
c3RlciBDT05GSUdfQ09NUAotLSBhcmMsZmlsdGVyLWNvbmZpZzoJc2V0dGluZyBmb3IgcmVnaXN0
ZXIgRklMVEVSX0NPTkZJRwotLSBhcmMsdHJpbS1jb25maWc6CXNldHRpbmcgZm9yIHJlZ2lzdGVy
IElNQVhUVU5FCistIGFyY3RpYyxsZWQtY29uZmlnLTA6CXNldHRpbmcgZm9yIHJlZ2lzdGVyIElM
RURfQ09ORklHXzAKKy0gYXJjdGljLGxlZC1jb25maWctMToJc2V0dGluZyBmb3IgcmVnaXN0ZXIg
SUxFRF9DT05GSUdfMQorLSBhcmN0aWMsZGltLWZyZXE6CVBXTSBtb2RlIGZyZXF1ZW5jZSBzZXR0
aW5nIChiaXRzIFszOjBdIHVzZWQpCistIGFyY3RpYyxjb21wLWNvbmZpZzoJc2V0dGluZyBmb3Ig
cmVnaXN0ZXIgQ09ORklHX0NPTVAKKy0gYXJjdGljLGZpbHRlci1jb25maWc6CXNldHRpbmcgZm9y
IHJlZ2lzdGVyIEZJTFRFUl9DT05GSUcKKy0gYXJjdGljLHRyaW0tY29uZmlnOglzZXR0aW5nIGZv
ciByZWdpc3RlciBJTUFYVFVORQorLSBhcmMsbGVkLWNvbmZpZy0wOglzZXR0aW5nIGZvciByZWdp
c3RlciBJTEVEX0NPTkZJR18wIChkZXByZWNhdGVkKQorLSBhcmMsbGVkLWNvbmZpZy0xOglzZXR0
aW5nIGZvciByZWdpc3RlciBJTEVEX0NPTkZJR18xIChkZXByZWNhdGVkKQorLSBhcmMsZGltLWZy
ZXE6CQlQV00gbW9kZSBmcmVxdWVuY2Ugc2V0dGluZyAoYml0cyBbMzowXSB1c2VkKSAoZGVwcmVj
YXRlZCkKKy0gYXJjLGNvbXAtY29uZmlnOglzZXR0aW5nIGZvciByZWdpc3RlciBDT05GSUdfQ09N
UCAoZGVwcmVjYXRlZCkKKy0gYXJjLGZpbHRlci1jb25maWc6CXNldHRpbmcgZm9yIHJlZ2lzdGVy
IEZJTFRFUl9DT05GSUcgKGRlcHJlY2F0ZWQpCistIGFyYyx0cmltLWNvbmZpZzoJc2V0dGluZyBm
b3IgcmVnaXN0ZXIgSU1BWFRVTkUgKGRlcHJlY2F0ZWQpCiAKIE5vdGU6IE9wdGlvbmFsIHByb3Bl
cnRpZXMgbm90IHNwZWNpZmllZCB3aWxsIGRlZmF1bHQgdG8gdmFsdWVzIGluIElDIEVQUk9NCiAK
IEV4YW1wbGU6CiAKIGFyYzJjMDYwOEAzMCB7Ci0JY29tcGF0aWJsZSA9ICJhcmMsYXJjMmMwNjA4
IjsKKwljb21wYXRpYmxlID0gImFyY3RpYyxhcmMyYzA2MDgiOwogCXJlZyA9IDwweDMwPjsKIAlk
ZWZhdWx0LWJyaWdodG5lc3MgPSA8NTAwPjsKIAlsYWJlbCA9ICJsY2QtYmFja2xpZ2h0IjsKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
