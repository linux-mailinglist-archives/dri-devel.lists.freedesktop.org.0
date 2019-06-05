Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC7235E6E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 15:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C568892AE;
	Wed,  5 Jun 2019 13:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154FC892AE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 13:55:48 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l26so19132861lfh.13
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 06:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1juBIMDcpaRGRxHZ9et3hK2gVZspaTvvW2vlb4cV+QE=;
 b=mA+FYy/9QBgj8cO+YzS7qBSyQ9E0/5qEL0jCksdRY1x7LZYT9ik3pgToNQhQcTDjkL
 oWT4qjNGJhKpqOlfRpTWRVVVKaA/BCvrm42lVWyrIDqbcdXNSdeRzYcTaV2qY6A0hPcv
 0OiMsUJ46YmS2+Ts8g0DWxs02PLRQxli1mpB1VrN1Jen98pdDxRVfFvsWFn9e/WI1lj/
 WW5YLMAZgeu6ZDbYRMchkoKHKEg9GPj6HLxWsDoRb0HQ+Ia2Aqn28lmnUb8pDLWQzxF4
 mWki6BUk2KUhwd7ekfv7ofzuy4H8qWgoJnHcfBLCotAa+1u4waDGBNDoISRyZMD290cQ
 1BPA==
X-Gm-Message-State: APjAAAV7JLSvFYgpANDdmXTBUKCY/UJkhf4EDK3jP7S96S4TasngXC4b
 erQv1vWbgTidTYj2GTti59lFkBxDC3Y=
X-Google-Smtp-Source: APXvYqz6kAJzFOeGddpnKGWWqh1H+rv5WjRVOPZ+VCgklKwBrR4TfWmqig9Jk1MfRS2kr0E25shtTw==
X-Received: by 2002:ac2:424b:: with SMTP id m11mr19701619lfl.163.1559742946207; 
 Wed, 05 Jun 2019 06:55:46 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id v7sm524318ljj.3.2019.06.05.06.55.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 06:55:45 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/1] drm/sis: drop drmP.h use
Date: Wed,  5 Jun 2019 15:55:39 +0200
Message-Id: <20190605135539.12940-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190605135539.12940-1-sam@ravnborg.org>
References: <20190605135539.12940-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1juBIMDcpaRGRxHZ9et3hK2gVZspaTvvW2vlb4cV+QE=;
 b=QQeGSabo1/s5LHmn5g+avj0BgsEN3UDgI8Ac76RP+QZPrGp+2FumZNmYHxyHdIkCpb
 SDmU0vLHBQXYbgjoNWeeF4LGmqauJIa+t/N2Rfyobg37urscLHe156MH0FJ3wNE6kPbd
 iycWtyJrE4xH8PEt9SSGyz2eeQRCkYcUbPTerXdTppGaXzfs3tQj4Y8BiGMY6FAZZBS8
 P0OnIreQnDvfwPcVfG25Zs81PMFkfnlrZzWm2yYlUZUNcg2WeBCaMy+wLuUv4i6A0FNC
 xpDe9NFWErIwumYH8Qwq/HWNr1tqnfnwZ16dLlhBvzuMfG4tUUcE87W7S8CWDGGy4TYJ
 /nYQ==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlci4KUmVwYWxjZWQgd2l0aCBy
ZWxldmFudCBoZWFkZXIgZmlsZXMgYW5kIHNvcnRlZCBoZWFkZXIgZmlsZXMgaW4gYWxsIGZpbGVz
CnRvdWNoZWQuCgpSZXBsYWNlZCBEUk1fe1JFQUQsV1JJVEV9IHRvIGF2b2lkIHRoZSBkcm1fb3Nf
bGludXggaGVhZGVyLgoKQnVpbGQgdGVzdGVkIHdpdGggYWxseWVzY29uZmlnLCBhbGxtb2Rjb25m
aWcgb24gdmFyaW91cyBhcmNoaXRlY3R1cmVzLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9z
aXMvc2lzX2Rydi5jIHwgIDggKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9zaXMvc2lzX2Rydi5o
IHwgMTAgKysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3Npcy9zaXNfbW0uYyAgfCAgNyArKysr
Ky0tCiAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zaXMvc2lzX2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL3Npcy9zaXNfZHJ2LmMKaW5kZXggZTA0YTkyNjU4Y2Q3Li5lZTM4MDEyMDFlY2MgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zaXMvc2lzX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zaXMvc2lzX2Rydi5jCkBAIC0yNywxMSArMjcsMTMgQEAKIAogI2luY2x1ZGUgPGxpbnV4L21v
ZHVsZS5oPgogCi0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2Rydi5o
PgorI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgorI2luY2x1ZGUgPGRybS9kcm1fcGNpLmg+Cisj
aW5jbHVkZSA8ZHJtL2RybV9wY2lpZHMuaD4KICNpbmNsdWRlIDxkcm0vc2lzX2RybS5oPgotI2lu
Y2x1ZGUgInNpc19kcnYuaCIKIAotI2luY2x1ZGUgPGRybS9kcm1fcGNpaWRzLmg+CisjaW5jbHVk
ZSAic2lzX2Rydi5oIgogCiBzdGF0aWMgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRsaXN0W10g
PSB7CiAJc2lzZHJ2X1BDSV9JRFMKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zaXMvc2lz
X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3Npcy9zaXNfZHJ2LmgKaW5kZXggMzI4ZjhhNzUwOTc2
Li44MTMzOTQ0M2IzYjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zaXMvc2lzX2Rydi5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zaXMvc2lzX2Rydi5oCkBAIC0yOCw3ICsyOCw5IEBACiAj
aWZuZGVmIF9TSVNfRFJWX0hfCiAjZGVmaW5lIF9TSVNfRFJWX0hfCiAKKyNpbmNsdWRlIDxkcm0v
ZHJtX2lvY3RsLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9sZWdhY3kuaD4KKyNpbmNsdWRlIDxkcm0v
ZHJtX21tLmg+CiAKIC8qIEdlbmVyYWwgY3VzdG9taXphdGlvbjoKICAqLwpAQCAtNDYsMTIgKzQ4
LDggQEAgZW51bSBzaXNfZmFtaWx5IHsKIAlTSVNfQ0hJUF8zMTUgPSAxLAogfTsKIAotI2luY2x1
ZGUgPGRybS9kcm1fbW0uaD4KLQotCi0jZGVmaW5lIFNJU19CQVNFIChkZXZfcHJpdi0+bW1pbykK
LSNkZWZpbmUgU0lTX1JFQUQocmVnKSAgICAgICAgIERSTV9SRUFEMzIoU0lTX0JBU0UsIHJlZykK
LSNkZWZpbmUgU0lTX1dSSVRFKHJlZywgdmFsKSAgIERSTV9XUklURTMyKFNJU19CQVNFLCByZWcs
IHZhbCkKKyNkZWZpbmUgU0lTX1JFQUQocmVnKSAgICAgICAgIHJlYWRsKCgodm9pZCBfX2lvbWVt
ICopZGV2X3ByaXYtPm1taW8tPmhhbmRsZSkgKyAocmVnKSkKKyNkZWZpbmUgU0lTX1dSSVRFKHJl
ZywgdmFsKSAgIHdyaXRlbCh2YWwsICgodm9pZCBfX2lvbWVtICopZGV2X3ByaXYtPm1taW8tPmhh
bmRsZSkgKyAocmVnKSkKIAogdHlwZWRlZiBzdHJ1Y3QgZHJtX3Npc19wcml2YXRlIHsKIAlkcm1f
bG9jYWxfbWFwX3QgKm1taW87CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2lzL3Npc19t
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3Npcy9zaXNfbW0uYwppbmRleCAxNjIyZGIyNGNkMzkuLmU1
MWQ0Mjg5YTNkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Npcy9zaXNfbW0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vc2lzL3Npc19tbS5jCkBAIC0zMSwxMSArMzEsMTQgQEAKICAqICAg
IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMtYXQtdHVuZ3N0ZW5ncmFwaGljcy1kb3QtY29tPgog
ICovCiAKLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgorI2luY2x1ZGUgPHZpZGVvL3Npc2ZiLmg+CisK
KyNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgorI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgog
I2luY2x1ZGUgPGRybS9zaXNfZHJtLmg+CisKICNpbmNsdWRlICJzaXNfZHJ2LmgiCiAKLSNpbmNs
dWRlIDx2aWRlby9zaXNmYi5oPgogCiAjZGVmaW5lIFZJREVPX1RZUEUgMAogI2RlZmluZSBBR1Bf
VFlQRSAxCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
