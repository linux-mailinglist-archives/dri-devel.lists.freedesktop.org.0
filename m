Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6849A8EB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34D16EBCD;
	Fri, 23 Aug 2019 07:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F7F6EBD3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 07:35:00 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t14so7975071lji.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 00:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+rL/k87007QFrN6e8/rQoCbxlA21xVkhbLU9RX3RGko=;
 b=B7kDATkK2wZ8WWxEWCdmbf9w0aF1FMGZk5lCmrLzmyfPCyaS1bC/d53QE3g9nZt4L6
 LyJKcsyoRoI4w9KjabmBOQ7hDlE9jgJ2IFVaxZfgU04vj7R4NhfwaTAtPVA+rlcepwgq
 Ma2hIv3tiDeh65f/6ZFgG5YEBI4p6WOIOs1255bbjQQ1d8SS9yhbZFhP6pzXy/nnglVF
 NenVC7Q2TQaa3M/xef/vOxqgqGZgykPVLX0WivNidoQrBNNCdhcjE8fM3bWGQZDvueMw
 0u6aQGHllzjy+FKtyMNofxHeRBh1fi7MLKyxOt62niyK6NNOoTqc2ND1Ggw2nKieoevm
 DZiw==
X-Gm-Message-State: APjAAAWMtrfHY9jN5/T9KrmeEL5kglSCLTUFpgrHnOPTlNs4BbuG9L20
 vQduXxiedobTn84Elfpdc0lluQ==
X-Google-Smtp-Source: APXvYqxjnXzHD039zi6yAqeD5P5LSVZFVpvOrtuYsr7ppbLYLI9K3Q8lh/YIW2xm1hJjGxpWyos0yg==
X-Received: by 2002:a2e:93cc:: with SMTP id p12mr2056927ljh.11.1566545698976; 
 Fri, 23 Aug 2019 00:34:58 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id n7sm483780ljh.2.2019.08.23.00.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:34:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/6 v2] drm/msm/dpu: Drop unused GPIO code
Date: Fri, 23 Aug 2019 09:34:45 +0200
Message-Id: <20190823073448.8385-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823073448.8385-1-linus.walleij@linaro.org>
References: <20190823073448.8385-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+rL/k87007QFrN6e8/rQoCbxlA21xVkhbLU9RX3RGko=;
 b=kWDp/eQtFpkwvLB6mBWwZMB+kZWqs4saJHbExwKbSt/Iqnpg7B5CI5goPDzEnqhX17
 kdOslO6f4BYjB4EkEK5l+Jl1Tk1wpgHzojh5Fxdxjrqa66AJHSVlYN/M23vcQfr3ByyY
 ya6SAhLe0ZU8zwqxfJW3sN/dfcgxXnFA3InNoY2r7TOKXz6u01JY/RzR5tRo9QonYwUZ
 0dP/Eaij55d+j9YKiF6cZxLuyYcDpDTXHtbYUp+4iX/JDNqkrfpx5PvG/e2IQQkhVN+z
 BfzVleLdfYSycw7GVmo2G3XAcSEhY6AO46nKZD5ND/ITl6v9bFSA8nbS5fDDnSUoGwfM
 qW1Q==
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
Cc: dri-devel@lists.freedesktop.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERQVSBoYXMgc29tZSBraW5kIG9mIGlkZWEgdGhhdCBpdCB3YW50cyB0byBiZSBhYmxlIHRv
CmJyaW5nIHVwIHBvd2VyIHVzaW5nIEdQSU8gbGluZXMuIFRoZSBzdHJ1Y3QgZHNzX2dwaW8gaXMg
aG93ZXZlcgpjb21wbGV0ZWx5IHVudXNlZCBhbmQgc2hvdWxkIHRoaXMgYmUgZG9uZSwgaXQgc2hv
dWxkIGJlIGRvbmUKdXNpbmcgdGhlIEdQSU8gZGVzY3JpcHRvciBmcmFtZXdvcmsgcmF0aGVyIHRo
YW4gdGhpcyBBUEkKd2hpY2ggcmVsaWVzIG9uIHRoZSBnbG9iYWwgR1BJTyBudW1iZXJzcGFjZS4g
RGVsZXRlIHRoaXMKY29kZSBiZWZvcmUgYW55b25lIGh1cnQgdGhlbXNlbHZlcy4KClRoZSBpbmNs
dXNpb24gb2YgPGxpbnV4L2dwaW8uaD4gd2FzIGFidXNlZCB0byBnZXQgc29tZSBPRgphbmQgSVJR
IGhlYWRlcnMgaW1wbGljaXRseSBpbmNsdWRlZCBpbnRvIHRoZSBEUFUgdXRpbGl0aWVzLAptYWtl
IHRoZXNlIGluY2x1ZGVzIGV4cGxpY2l0IGFuZCBwdXNoIHRoZW0gZG93biBpbnRvIHRoZSBhY3R1
YWwKaW1wbGVtZW50YXRpb24uCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpD
YzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2Vy
bmVsLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpSZXZpZXdlZC1ieTog
QnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+ClNpZ25lZC1vZmYtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCkNoYW5nZUxvZyB2MS0+djI6
Ci0gUmViYXNlZCBvbiB2NS4zLXJjMQotIENvbGxlY3RlZCByZXZpZXcgdGFnCi0tLQogZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuYyB8IDEgKwogZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuaCB8IDkgLS0tLS0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jICAgIHwgNCArKysrCiAzIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuYwppbmRleCA3MWI2OTg3YmZmMWUuLjI3ZmJlYjUwNDM2
MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5jCkBAIC03
LDYgKzcsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2Nsay9jbGstY29uZi5oPgogI2luY2x1ZGUgPGxp
bnV4L2Vyci5oPgogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CisjaW5jbHVkZSA8bGludXgvb2Yu
aD4KIAogI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuaCBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9pb191dGlsLmgKaW5kZXggMDkwODNlOWYwNmJiLi5lNmI1Yzc3MmZhM2Ig
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9pb191dGlsLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuaApAQCAtNSw3
ICs1LDYgQEAKICNpZm5kZWYgX19EUFVfSU9fVVRJTF9IX18KICNkZWZpbmUgX19EUFVfSU9fVVRJ
TF9IX18KIAotI2luY2x1ZGUgPGxpbnV4L2dwaW8uaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9y
bV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgogCkBAIC0xNCwxMiArMTMsNiBA
QAogI2RlZmluZSBERVZfV0FSTihmbXQsIGFyZ3MuLi4pICBwcl93YXJuKGZtdCwgIyNhcmdzKQog
I2RlZmluZSBERVZfRVJSKGZtdCwgYXJncy4uLikgICBwcl9lcnIoZm10LCAjI2FyZ3MpCiAKLXN0
cnVjdCBkc3NfZ3BpbyB7Ci0JdW5zaWduZWQgaW50IGdwaW87Ci0JdW5zaWduZWQgaW50IHZhbHVl
OwotCWNoYXIgZ3Bpb19uYW1lWzMyXTsKLX07Ci0KIGVudW0gZHNzX2Nsa190eXBlIHsKIAlEU1Nf
Q0xLX0FIQiwgLyogbm8gc2V0IHJhdGUuIHJhdGUgY29udHJvbGxlZCB0aHJvdWdoIHJwbSAqLwog
CURTU19DTEtfUENMSywKQEAgLTM0LDggKzI3LDYgQEAgc3RydWN0IGRzc19jbGsgewogfTsKIAog
c3RydWN0IGRzc19tb2R1bGVfcG93ZXIgewotCXVuc2lnbmVkIGludCBudW1fZ3BpbzsKLQlzdHJ1
Y3QgZHNzX2dwaW8gKmdwaW9fY29uZmlnOwogCXVuc2lnbmVkIGludCBudW1fY2xrOwogCXN0cnVj
dCBkc3NfY2xrICpjbGtfY29uZmlnOwogfTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9tZHNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfbWRzcy5jCmluZGV4IDk4NjkxNWJiYmMwMi4uYzk3N2JhZGRmZmZkIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9tZHNzLmMKQEAgLTMsNiArMywxMCBAQAogICogQ29weXJp
Z2h0IChjKSAyMDE4LCBUaGUgTGludXggRm91bmRhdGlvbgogICovCiAKKyNpbmNsdWRlIDxsaW51
eC9pcnEuaD4KKyNpbmNsdWRlIDxsaW51eC9pcnFjaGlwLmg+CisjaW5jbHVkZSA8bGludXgvaXJx
ZGVzYy5oPgorI2luY2x1ZGUgPGxpbnV4L2lycWNoaXAvY2hhaW5lZF9pcnEuaD4KICNpbmNsdWRl
ICJkcHVfa21zLmgiCiAjaW5jbHVkZSA8bGludXgvaW50ZXJjb25uZWN0Lmg+CiAKLS0gCjIuMjEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
