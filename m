Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08B7B529E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 18:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF846ECFB;
	Tue, 17 Sep 2019 16:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63556ECFB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 16:12:37 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id h144so8925021iof.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 09:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WEnd6CA2jothE5bzqT12cUNUGcNA3mMbmNkUCnktma0=;
 b=ZsHKzJkYbUM7ZJA8jLTydWC5+FIUzwcUJZcBZk18X+TP5Y3awongiScBowTdq5qIP2
 yNXkD/dwq4UmfppVX807Uth73cvGruAS3rVdqO9siLX/0ClsOf+0jzAxmeJTy/gPfrzc
 cFR/DW52UMKhX8vBmNswTgdUwBumu6601B2XH9te5pfMXPAxwAnjPmArj+ryCC192kUg
 /jxdKuqVfghj4eRqElTTRiwQVjziHknnzXrojmb5fH/KIgvRki+u6JeKul+hv7CaJkwn
 TtTYOaJX0Rs5SFkUBO4NvkqYnINoVsYAUMp/63gYqAQlB5pKHlwkFoWSrouDLEmWWBR0
 dW/Q==
X-Gm-Message-State: APjAAAUECEisJxhG+HzaAaAmp8gVmowwwVSBgef+mOrINs9e4L9r/XIs
 8th+xZkL6516gL64UCGJJlxbhVz9VnT6dg==
X-Google-Smtp-Source: APXvYqw82gd41rtWEeRFIHmEkIZ2K8Aglv1g8Yt6qRLTT0Ioa2nHqoN00Z0QQU7dccgXgV/FSJ8H7w==
X-Received: by 2002:a05:6602:10a:: with SMTP id
 s10mr1068356iot.171.1568736756502; 
 Tue, 17 Sep 2019 09:12:36 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
 by smtp.gmail.com with ESMTPSA id p25sm2090487ioo.35.2019.09.17.09.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 09:12:35 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference new DRM
 panel
Date: Tue, 17 Sep 2019 11:12:13 -0500
Message-Id: <20190917161214.2913-3-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917161214.2913-1-aford173@gmail.com>
References: <20190917161214.2913-1-aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WEnd6CA2jothE5bzqT12cUNUGcNA3mMbmNkUCnktma0=;
 b=Y8QIhZ+mpfw2Dc8DUoh3Vg0RCtS632bvaOxR2MyzC/t+T7ADNqaVqoaU59sFo6EcCn
 llAGQDzMGgUdcvVlwxXT935otNrZba7U65A4hxjdwfA5zI43ge2E3pO7JPHfnL5WXYuz
 W2Nqtwlw8N6PBypphkowTlhNqj5ZWq56psxAhywwtfmGKmfJNE2pmTf20PPNT0WCJ1dR
 z65m8X2gv9iQnTDbUXFVtR9e60bCXVgNel0cjqPVH+ygAFWc2szpH7Wl9yYgWJWmw5Fd
 Wcjm41n3p4jKVUO+Pf88Bd+ZJvmLe+Krk4EkJOfcOTwcQu3dtI8N0lEoYF0oKQ8SAwwv
 KHOg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 adam.ford@logicpd.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgcmVtb3ZhbCBvZiB0aGUgcGFuZWwtZHBpIGZyb20gdGhlIG9tYXAgZHJpdmVycywg
dGhlCkxDRCBubyBsb25nZXIgd29ya3MuICBUaGlzIHBhdGNoIHBvaW50cyB0aGUgZGV2aWNlIHRy
ZWUgdG8KYSBuZXdseSBjcmVhdGVkIHBhbmVsIG5hbWVkICJsb2dpY3BkLHR5cGUyOCIKCkZpeGVz
OiA4YmY0YjE2MjExNzggKCJkcm0vb21hcDogUmVtb3ZlIHBhbmVsLWRwaSBkcml2ZXIiKQoKU2ln
bmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+CgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvbG9naWNwZC10b3JwZWRvLTM3eHgtZGV2a2l0LTI4LmR0cyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2xvZ2ljcGQtdG9ycGVkby0zN3h4LWRldmtpdC0yOC5kdHMKaW5kZXgg
MDdhYzk5YjljZGE2Li4wMGM0MjZiZDUxYTAgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L2xvZ2ljcGQtdG9ycGVkby0zN3h4LWRldmtpdC0yOC5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvbG9naWNwZC10b3JwZWRvLTM3eHgtZGV2a2l0LTI4LmR0cwpAQCAtMTEsMjIgKzExLDggQEAK
ICNpbmNsdWRlICJsb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZraXQuZHRzIgogCiAmbGNkMCB7Ci0K
KwkvKiBUaGlzIGlzbid0IHRoZSBleGFjdCBMQ0QsIGJ1dCB0aGUgdGltaW5ncyBtZWV0IHNwZWMg
Ki8KKwkvKiBUbyBtYWtlIGl0IHdvcmssIHNldCBDT05GSUdfT01BUDJfRFNTX01JTl9GQ0tfUEVS
X1BDSz00ICovCisJY29tcGF0aWJsZSA9ICJsb2dpY3BkLHR5cGUyOCI7CiAJbGFiZWwgPSAiMjgi
OwotCi0JcGFuZWwtdGltaW5nIHsKLQkJY2xvY2stZnJlcXVlbmN5ID0gPDkwMDAwMDA+OwotCQlo
YWN0aXZlID0gPDQ4MD47Ci0JCXZhY3RpdmUgPSA8MjcyPjsKLQkJaGZyb250LXBvcmNoID0gPDM+
OwotCQloYmFjay1wb3JjaCA9IDwyPjsKLQkJaHN5bmMtbGVuID0gPDQyPjsKLQkJdmJhY2stcG9y
Y2ggPSA8Mz47Ci0JCXZmcm9udC1wb3JjaCA9IDwyPjsKLQkJdnN5bmMtbGVuID0gPDExPjsKLQkJ
aHN5bmMtYWN0aXZlID0gPDE+OwotCQl2c3luYy1hY3RpdmUgPSA8MT47Ci0JCWRlLWFjdGl2ZSA9
IDwxPjsKLQkJcGl4ZWxjbGstYWN0aXZlID0gPDA+OwotCX07CiB9OwotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
