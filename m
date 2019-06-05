Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEB235EDD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D4989B7B;
	Wed,  5 Jun 2019 14:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D43089B7B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 14:13:46 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q26so19212495lfc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 07:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=c4fYGOg/GMvs6GLYI5YqboAzrPQMZ+VLjaRtgc7svnY=;
 b=hO8WIBApKhl7FW7q9coMHNZWyK5yKyYu9IFD4G+zei5BgcGGppT25GngEq6jwuWTyc
 cj69HUxBOyuPKNst7YDbVohznDS1ftp6Y7S7VXvPL06Xndp730eEK6xcbO076viLq/li
 arS2OjBGswqMZAzdw4NseGYVy8fEcnE9Q444Y/gvfwlQTgQxW4vp0H4NmUrslsj8fiuR
 7SCkK93YkqdguNeOlAA7pndNJOjBKvHmqpihMnkjCDEA/bNXYYDSNa9cDHSbbzWHsQZe
 U5fY5SEZkWeI6+4lAYZ6LPiY/rIfOj7QPTvzsDAGICa5jJb3EttKvGRTp/a6s6fbs4Oc
 QXdg==
X-Gm-Message-State: APjAAAVE5YW36SVTXk12DUAS36ctPBvivLsJXG4gKCBLyeRnjiCNYE0q
 5HOxoUFHwRwezv/J2sTSK2Osu0BBnns=
X-Google-Smtp-Source: APXvYqyA1kC0tfZpAGr4XGgDZn0CeoSBuiC2Y6gcwzc1YeMP0rhQRrsJiVw/Tt8BRmMOHl1fUp8j2w==
X-Received: by 2002:ac2:4156:: with SMTP id c22mr20031619lfi.12.1559744024212; 
 Wed, 05 Jun 2019 07:13:44 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 f30sm4261675lfa.48.2019.06.05.07.13.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 07:13:43 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/2] drm/r128: drop use of drmP.h
Date: Wed,  5 Jun 2019 16:13:21 +0200
Message-Id: <20190605141321.17819-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190605141321.17819-1-sam@ravnborg.org>
References: <20190605141321.17819-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c4fYGOg/GMvs6GLYI5YqboAzrPQMZ+VLjaRtgc7svnY=;
 b=gnPSsYQSqF/ab0NlG/P183a+of8GGO2hy+SFm30bn2liyyUWthaC84Jrnmsxj0rP1Z
 d46JMAErNe6bfCUjKGoCuGyO+sXImU7t7giEuIp/40OpQzBxpjnxxX0+tDYlT/SZKVfM
 MGomNVOnEX8eM/YaHbB3cEAfwY7MVsQhhjV1sHaOctsCrs8g/2QouP2a7F6yO+iBr/ok
 K83KQJkgtDGsakKSiZZn63+X6GAezMdeoBCW/Qw7lfzPkAPZUtKNZt9J+gmJm21rOWPd
 5A7pWbdVTb8Zq3ToywwlVIGN/xqLgc3VB1b8f6RIrwVi078BOrIFiehMy7DJBh0Jd/c8
 jJog==
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

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgpSZXBsYWNlIGl0
IHdpdGggcmVsZXZhbnQgaW5jbHVkZSBmaWxlcy4KU29ydCBpbmNsdWRlIGZpbGVzIGluIGZpbGVz
IHRvdWNoZWQuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9jY2UuYyAgIHwg
MTIgKysrKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X2Rydi5jICAgfCAgOSAr
KysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfZHJ2LmggICB8ICA2ICsrKysrKwog
ZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9zdGF0ZS5jIHwgIDkgKysrKysrKystCiA0IGZpbGVz
IGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9jY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9yMTI4L3Ix
MjhfY2NlLmMKaW5kZXggNmY0MjZiYjA2OTM0Li4xMzhhZjMyNDgwZDQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfY2NlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3IxMjgv
cjEyOF9jY2UuYwpAQCAtMjksMTMgKzI5LDIxIEBACiAgKiAgICBHYXJldGggSHVnaGVzIDxnYXJl
dGhAdmFsaW51eC5jb20+CiAgKi8KIAorI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CisjaW5jbHVk
ZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KICNpbmNsdWRlIDxsaW51eC9maXJtd2FyZS5oPgorI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5o
PgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KLSNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KKyNp
bmNsdWRlIDxsaW51eC91YWNjZXNzLmg+CiAKLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgorI2luY2x1
ZGUgPGRybS9kcm1fYWdwc3VwcG9ydC5oPgorI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+Cisj
aW5jbHVkZSA8ZHJtL2RybV9maWxlLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9pcnEuaD4KKyNpbmNs
dWRlIDxkcm0vZHJtX3ByaW50Lmg+CiAjaW5jbHVkZSA8ZHJtL3IxMjhfZHJtLmg+CisKICNpbmNs
dWRlICJyMTI4X2Rydi5oIgogCiAjZGVmaW5lIFIxMjhfRklGT19ERUJVRwkJMApkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yMTI4
L3IxMjhfZHJ2LmMKaW5kZXggNGIxYTUwNWFiMzUzLi5mZDc0Zjc0NDYwNGYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ix
MjgvcjEyOF9kcnYuYwpAQCAtMzEsMTEgKzMxLDE0IEBACiAKICNpbmNsdWRlIDxsaW51eC9tb2R1
bGUuaD4KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4K
KyNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3BjaS5oPgorI2lu
Y2x1ZGUgPGRybS9kcm1fcGNpaWRzLmg+CisjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KICNp
bmNsdWRlIDxkcm0vcjEyOF9kcm0uaD4KLSNpbmNsdWRlICJyMTI4X2Rydi5oIgogCi0jaW5jbHVk
ZSA8ZHJtL2RybV9wY2lpZHMuaD4KKyNpbmNsdWRlICJyMTI4X2Rydi5oIgogCiBzdGF0aWMgc3Ry
dWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRsaXN0W10gPSB7CiAJcjEyOF9QQ0lfSURTCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3Ix
MjgvcjEyOF9kcnYuaAppbmRleCAxMTViYjI4NmRkMmEuLmJhOGMzMGVkOTFkMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
cjEyOC9yMTI4X2Rydi5oCkBAIC0zNSw4ICszNSwxNCBAQAogI2lmbmRlZiBfX1IxMjhfRFJWX0hf
XwogI2RlZmluZSBfX1IxMjhfRFJWX0hfXwogCisjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KKyNp
bmNsdWRlIDxsaW51eC9pby5oPgorI2luY2x1ZGUgPGxpbnV4L2lycXJldHVybi5oPgorCiAjaW5j
bHVkZSA8ZHJtL2F0aV9wY2lnYXJ0Lmg+CisjaW5jbHVkZSA8ZHJtL2RybV9pb2N0bC5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fbGVnYWN5Lmg+CisjaW5jbHVkZSA8ZHJtL3IxMjhfZHJtLmg+CiAKIC8q
IEdlbmVyYWwgY3VzdG9taXphdGlvbjoKICAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3IxMjgvcjEyOF9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9zdGF0ZS5jCmlu
ZGV4IDI1MzVlYThkMmQ5Yi4uOWQ3NGM5ZDkxNGNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcjEyOC9yMTI4X3N0YXRlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9zdGF0
ZS5jCkBAIC0yOCw4ICsyOCwxNSBAQAogICogICAgR2FyZXRoIEh1Z2hlcyA8Z2FyZXRoQHZhbGlu
dXguY29tPgogICovCiAKLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgorI2luY2x1ZGUgPGxpbnV4L3Bj
aS5oPgorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKyNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+
CisKKyNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgorI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5o
PgorI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KICNpbmNsdWRlIDxkcm0vcjEyOF9kcm0uaD4K
KwogI2luY2x1ZGUgInIxMjhfZHJ2LmgiCiAKIC8qID09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
