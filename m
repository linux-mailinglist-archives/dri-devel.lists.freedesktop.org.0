Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 450C55DE79
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB1A6E0D5;
	Wed,  3 Jul 2019 07:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EF86E0AD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 23:43:08 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id c14so152206plo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 16:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4i2YSPugXI0nrqp33kMy8Y944Y94lb5ecy4lCGMxEsQ=;
 b=dTlcc3tMfogy3USI184Inv+Zra67V6dITV4Mz65qrogCKwh2yKhwjEbZl+4ER4A+5I
 kDW6Da/35RgvWOwppZPjcsSY4QN2yDpmgjnRoJzqAdmQNFHj9S7PQavANt1YoK6cBK1H
 eMlgUdKlB7W7dlaOb1OyRve91yYNgakslbmCwluq5V26PXyIbE+4wNVf3JdMGkJGYeQF
 zDdCjIYEvhh0rP8R40Bs5wVfKOuGvXpghGXGEpGuz93AI6YrGXet43/I5l1CLrQPYzfN
 FdYOMiYYinn86AAEguAm/UrK9UusWd7d0k90CGooa26l/hWXjlZHQcg0cIDSTfq2ZMMF
 ze8g==
X-Gm-Message-State: APjAAAXWsQxFv265Tn8c5sV5CTbpmrX0rG0dISKBjSSyvCIpSPbTIsEk
 rCfVWsgp/Z9sycollj4kSDdtHQ==
X-Google-Smtp-Source: APXvYqy+RvIO2JXddSoisK2cCLcCMjrjCtG7tr4jDoamQP7WMz2EiFnqn53/HRa3MYDHB3+s9NQu5Q==
X-Received: by 2002:a17:902:2bc5:: with SMTP id
 l63mr39458967plb.30.1562110987634; 
 Tue, 02 Jul 2019 16:43:07 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id c26sm167611pfr.172.2019.07.02.16.43.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 16:43:07 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] drm/mtk: add panel orientation property
Date: Tue,  2 Jul 2019 16:42:58 -0700
Message-Id: <20190702234258.136349-5-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190702234258.136349-1-dbasehore@chromium.org>
References: <20190702234258.136349-1-dbasehore@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4i2YSPugXI0nrqp33kMy8Y944Y94lb5ecy4lCGMxEsQ=;
 b=Io3EmwopeQFUFFj8MfEzOz6LKA/W7AncRHgVvChAu8QUpuD2E3VyZqA3FencbnOFjh
 2QFw9FLfiNtoaQSXDSpIrLmj9mPRkqNM1rG/RbcVTya+m+LG3+XUPQhtEIJJBTQunsuR
 e06bOaadoY8m6HPWLWiI4UJBNkFke7GWAqs9Y=
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
Cc: Derek Basehore <dbasehore@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpbml0cyB0aGUgcGFuZWwgb3JpZW50YXRpb24gcHJvcGVydHkgZm9yIHRoZSBtZWRpYXRl
ayBkc2kgZHJpdmVyCmlmIHRoZSBwYW5lbCBvcmllbnRhdGlvbiAoY29ubmVjdG9yLmRpc3BsYXlf
aW5mby5wYW5lbF9vcmllbnRhdGlvbikgaXMKbm90IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9O
X1VOS05PV04uCgpTaWduZWQtb2ZmLWJ5OiBEZXJlayBCYXNlaG9yZSA8ZGJhc2Vob3JlQGNocm9t
aXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgOCArKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RzaS5jCmluZGV4IDRhMGI5MTUwYTdiYi4uMDhmZmRjNzUyNmRkIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMKQEAgLTc4MiwxMCArNzgyLDE4IEBAIHN0YXRpYyBpbnQgbXRrX2Rz
aV9jcmVhdGVfY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBtdGtfZHNp
ICpkc2kpCiAJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBhdHRhY2ggcGFuZWwgdG8gZHJtXG4iKTsK
IAkJCWdvdG8gZXJyX2Nvbm5lY3Rvcl9jbGVhbnVwOwogCQl9CisKKwkJcmV0ID0gZHJtX2Nvbm5l
Y3Rvcl9pbml0X3BhbmVsX29yaWVudGF0aW9uX3Byb3BlcnR5KCZkc2ktPmNvbm4pOworCQlpZiAo
cmV0KSB7CisJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBpbml0IHBhbmVsIG9yaWVudGF0aW9uXG4i
KTsKKwkJCWdvdG8gZXJyX3BhbmVsX2RldGFjaDsKKwkJfQogCX0KIAogCXJldHVybiAwOwogCitl
cnJfcGFuZWxfZGV0YWNoOgorCWRybV9wYW5lbF9kZXRhY2goZHNpLT5wYW5lbCk7CiBlcnJfY29u
bmVjdG9yX2NsZWFudXA6CiAJZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwKCZkc2ktPmNvbm4pOwogCXJl
dHVybiByZXQ7Ci0tIAoyLjIyLjAuNDEwLmdkOGZkYmUyMWI1LWdvb2cKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
