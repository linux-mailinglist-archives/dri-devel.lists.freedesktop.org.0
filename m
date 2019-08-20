Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36058959DF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5656E79D;
	Tue, 20 Aug 2019 08:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCEA6E795
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:41:24 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id f72so1844177wmf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iCcz7VXT3Rri0q0plV0Ks3VAIbY+L7u5e09ODRK9afA=;
 b=NWRkq4Y7meQ9x1mng4LSi+AZNt6f4dbDtJrSTfJm00MA8l2i7olgGZsFgMil/v8VkG
 Gq86Vd1RjoEysNontTxCUPeIBr1piARfnDwz5CLMzT4G+nP64yfS6R/2lasTyhXArtR2
 NMBE9IsIUF0bFS+sy9N+x0qUP7b67uhsdxy043s0qJGPZIkUcz62SGJAESD/it3i//Er
 JTrWvAzRoJkSMAkggrvJmkS4DkPtC24vc32PFMSjs5c5xRQG7Wej0kCQLCDLepvWk8cA
 vWousLEkhMk8ltF7nUy/NvADVaUG6Yg0JjsD+wDhDc6pi6l17YbdBt6s75xbQoChrFVV
 R3lA==
X-Gm-Message-State: APjAAAVdWNl4r4nZZQAK8i35yhnipWC6PppFdmJEGgSDva/p1kPebM3I
 QH/hz/cLQfAlSyXHsh8FtRitGQ==
X-Google-Smtp-Source: APXvYqyEU0PHQl+WTxPI5Y4mWZdoYQS8xETpRbqo/vMyfB2rVnuBI82wdg4WuZX2RO+0DThTBm2nhw==
X-Received: by 2002:a1c:7513:: with SMTP id o19mr15982869wmc.126.1566290482352; 
 Tue, 20 Aug 2019 01:41:22 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 08/11] drm/bridge: synopsys: dw-hdmi: add 420 mode format
 negociation
Date: Tue, 20 Aug 2019 10:41:06 +0200
Message-Id: <20190820084109.24616-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iCcz7VXT3Rri0q0plV0Ks3VAIbY+L7u5e09ODRK9afA=;
 b=TcWzIbs5Rei+udJAkxpcwt14stzXHw97HeoQj79gXS/ZY41E2XJs/7vFgp/XK+eTM0
 NFCACfqCTQ8n/vElqSW4uyboi8Q8ADALAv6vSifu1BxC+TbdCe0WjHUFzbST6eHrO8Lz
 NpKJlSlaryAW5mF6/5cfwz4smy3O6FFuwaDS6ltdxwcHpVGzQ7LFhtlSfv+TGqqUohNc
 JBelFVLTIV2qsgXvugyflMbrxU51p+g2QTqw8sr0hz8DHgiyonGi7DmUmgdGYrrh97nk
 BvT/+CSERG7XYXlWb6CPp7OlLnVvdeQ3TrD+vWsPzkLUhsd8j2ezlz8Sai33AZRngEcx
 /G/g==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHNwZWNpYWwgbmVnb2NpYXRpb24gY2FzZSBmb3IgNDIwIEhETUkyLjAgZm9ybWF0LgoKSW4g
dGhpcyBjYXNlIHRoZSBEVy1IRE1JIENTQyBjYW5ub3QgaGFuZGxlIDQyMCBkYXRhLCBhbmQgbXVz
dCBiZQppbiBwYXNzdGhyb3VnaHQsIHRodXMgaW5wdXRfYnVzX2NmZyBtdXN0IGJlIG91dHB1dF9i
dXNfY2ZnLgoKQWRkIHN1cHBvcnQgZm9yIGhhbmRsaW5nIGEgc3BlY2lmaWMgOC8xMC8xMi8xNiB2
YXJpYW50IGluIHRoZSBjb25uZWN0b3IKYnVzX2Zvcm1hdHMgaWYgc3BlY2lmaWVkLgoKU2lnbmVk
LW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgNDUgKysrKysrKysrKysr
KysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKaW5kZXggY2I1
NjBiMjMxZDc0Li5iOTYxMTljNmZhZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jCkBAIC0yMjEzLDIzICsyMjEzLDUwIEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9i
cmlkZ2VfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCiAJCQkJICAgICAg
IHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlKQogewogCXN0cnVjdCBkd19o
ZG1pICpoZG1pID0gYnJpZGdlLT5kcml2ZXJfcHJpdmF0ZTsKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubiA9IGNvbm5fc3RhdGUtPmNvbm5lY3RvcjsKKwlzdHJ1Y3QgZHJtX2Rpc3BsYXlfaW5m
byAqaW5mbyA9ICZjb25uLT5kaXNwbGF5X2luZm87CisJc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
Km1vZGUgPSAmY3J0Y19zdGF0ZS0+bW9kZTsKKwlib29sIGlzX2hkbWkyX3NpbmsgPSBpbmZvLT5o
ZG1pLnNjZGMuc3VwcG9ydGVkOwogCWludCByZXQ7CiAKLQlyZXQgPSBkcm1fYXRvbWljX2JyaWRn
ZV9jaG9vc2Vfb3V0cHV0X2J1c19jZmcoYnJpZGdlX3N0YXRlLCBjcnRjX3N0YXRlLAotCQkJCQkJ
ICAgICAgY29ubl9zdGF0ZSk7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwkvKgorCSAqIElm
IHRoZSBjdXJyZW50IG1vZGUgZW5mb3JjZXMgNDoyOjAsIGZvcmNlIHRoZSBvdXRwdXQgYnV0IGZv
cm1hdAorCSAqIG9yIHVzZSB0aGUgY29ubmVjdG9yIGJ1cyBmb3JtYXRzIGlmIGEgbm9uIDhiaXQg
NDoyOjAgZm9ybWF0CisJICogaXMgcHJvdmlkZWQuCisJICovCisJaWYgKGRybV9tb2RlX2lzXzQy
MF9vbmx5KGluZm8sIG1vZGUpIHx8CisJCSghaXNfaGRtaTJfc2luayAmJiBkcm1fbW9kZV9pc180
MjBfYWxzbyhpbmZvLCBtb2RlKSkpIHsKKwkJaWYgKGluZm8tPm51bV9idXNfZm9ybWF0cyAmJiBp
bmZvLT5idXNfZm9ybWF0cyAmJgorCQkgICAgaGRtaV9idXNfZm10X2lzX3l1djQyMChpbmZvLT5i
dXNfZm9ybWF0c1swXSkpCisJCQlicmlkZ2Vfc3RhdGUtPm91dHB1dF9idXNfY2ZnLmZtdCA9IGlu
Zm8tPmJ1c19mb3JtYXRzWzBdOworCQllbHNlCisJCQlicmlkZ2Vfc3RhdGUtPm91dHB1dF9idXNf
Y2ZnLmZtdCA9CisJCQkJCU1FRElBX0JVU19GTVRfVVlZVllZOF8wXzVYMjQ7CisJfSBlbHNlIHsK
KwkJcmV0ID0gZHJtX2F0b21pY19icmlkZ2VfY2hvb3NlX291dHB1dF9idXNfY2ZnKGJyaWRnZV9z
dGF0ZSwKKwkJCQkJCQkgICAgICBjcnRjX3N0YXRlLAorCQkJCQkJCSAgICAgIGNvbm5fc3RhdGUp
OworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CisKKwlpZiAoaGRtaV9idXNfZm10X2lz
X3l1djQyMChicmlkZ2Vfc3RhdGUtPm91dHB1dF9idXNfY2ZnLmZtdCkpIHsKKwkJLyogVGhlIERX
LUhETUkgQ1NDIGNhbm5vdCBpbnRlcnBvbGF0ZSBhbmQgZGVjaW1hdGUgaW4gNDoyOjAgKi8KKwkJ
YnJpZGdlX3N0YXRlLT5pbnB1dF9idXNfY2ZnLmZtdCA9CisJCQlicmlkZ2Vfc3RhdGUtPm91dHB1
dF9idXNfY2ZnLmZtdDsKKwl9IGVsc2UgeworCQlyZXQgPSBkcm1fYXRvbWljX2JyaWRnZV9jaG9v
c2VfaW5wdXRfYnVzX2NmZyhicmlkZ2Vfc3RhdGUsCisJCQkJICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjcnRjX3N0YXRlLAorCQkJCQkJCSAgICAgY29ubl9zdGF0ZSk7CisJCWlmIChyZXQp
CisJCQlyZXR1cm4gcmV0OworCX0KIAogCWRldl9kYmcoaGRtaS0+ZGV2LCAic2VsZWN0ZWQgb3V0
cHV0IGZvcm1hdCAleFxuIiwKIAkJCWJyaWRnZV9zdGF0ZS0+b3V0cHV0X2J1c19jZmcuZm10KTsK
IAogCWhkbWktPmhkbWlfZGF0YS5lbmNfb3V0X2J1c19mb3JtYXQgPSBicmlkZ2Vfc3RhdGUtPm91
dHB1dF9idXNfY2ZnLmZtdDsKIAotCXJldCA9IGRybV9hdG9taWNfYnJpZGdlX2Nob29zZV9pbnB1
dF9idXNfY2ZnKGJyaWRnZV9zdGF0ZSwgY3J0Y19zdGF0ZSwKLQkJCQkJCSAgICAgIGNvbm5fc3Rh
dGUpOwotCWlmIChyZXQpCi0JCXJldHVybiByZXQ7Ci0KIAlkZXZfZGJnKGhkbWktPmRldiwgInNl
bGVjdGVkIGlucHV0IGZvcm1hdCAleFxuIiwKIAkJCWJyaWRnZV9zdGF0ZS0+aW5wdXRfYnVzX2Nm
Zy5mbXQpOwogCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
