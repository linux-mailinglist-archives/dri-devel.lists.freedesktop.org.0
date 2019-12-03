Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA0C10FF2D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C2F6E558;
	Tue,  3 Dec 2019 13:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CE16E558
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:49:00 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id r11so1724421pgf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 05:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ke4tL+lHXK0j3bKO8x1UNBlk4yZ+cYr66D3IUPPUdkM=;
 b=nC4558qcykslSZFapprs0zAWfFBY31RG6kz2S530dS/hFclc6Eo3uKWw11MXx5YZmG
 HmoWQt+Qs76fHC4kKU/vcC6JT7BKa2hTObc4yW9nL0LxqeLRj1phDVBtF4lC9oFA68Jz
 RvZRqV6JhZAima8AcYBg27b8FUT91Kys8SkkJKi3UE+GGwPN8bD9dvO7CQTdGE0QspE/
 y0oKQ/Ky8BTGqo5dJ0m6I55u1qXgs/6sTUK+SbV82a0sOzLsyyu35bX4mb036kv6CqIy
 EY0wMpkREFUo5YfzNxZHdnFXwfC06Xm7ohtGa5uFOgJohQEQwHXn7rN/Tq0dhM5MGsjx
 retw==
X-Gm-Message-State: APjAAAWNI+mIDLii69opqU3RyK/FAfp0T7ldzwmGuvv6O3edO7Gzh+G3
 shJiqmWoQ9AIMopFKmDw25dmQA==
X-Google-Smtp-Source: APXvYqyIJZHBzy4Ips/O+tLpiqsHSAYb0yd7QO+j8JCAANrcld28OPDSbFiPDZGh4m/TpJVtuLBS9Q==
X-Received: by 2002:a63:c849:: with SMTP id l9mr5543294pgi.330.1575380940429; 
 Tue, 03 Dec 2019 05:49:00 -0800 (PST)
Received: from localhost.localdomain ([115.97.190.29])
 by smtp.gmail.com with ESMTPSA id y144sm4397892pfb.188.2019.12.03.05.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 05:48:59 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v12 6/7] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
Date: Tue,  3 Dec 2019 19:18:15 +0530
Message-Id: <20191203134816.5319-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191203134816.5319-1-jagan@amarulasolutions.com>
References: <20191203134816.5319-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ke4tL+lHXK0j3bKO8x1UNBlk4yZ+cYr66D3IUPPUdkM=;
 b=N5hZ67OMW5NuOOqE/NDh0govtD9Sh3TvScmIgM02xJ3rDzZEn+fnlKfiPMhsOVb1rn
 g3sCxJHkQpAGiV393wdy0S80Ak21VRYMGbCV0KqGV2WIcBnPkOnu12dWsJi5Rpq3Y+w4
 TXl5GGpQL95s7YsAdjU284KNNVjHwIQ+8rAhQ=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIE1JUEkgRFNJIHBpcGVsaW5lIGZvciBBbGx3aW5uZXIgQTY0LgoKLSBkc2kgbm9kZSwgd2l0
aCBBNjQgY29tcGF0aWJsZSBzaW5jZSBpdCBkb2Vzbid0IHN1cHBvcnQKICBEU0lfU0NMSyBnYXRp
bmcgdW5saWtlIEEzMwotIGRwaHkgbm9kZSwgd2l0aCBBNjQgY29tcGF0aWJsZSB3aXRoIEEzMyBm
YWxsYmFjayBzaW5jZQogIERQSFkgb24gQTY0IGFuZCBBMzMgaXMgc2ltaWxhcgotIGZpbmFsbHks
IGF0dGFjaCB0aGUgZHNpX2luIHRvIHRjb24wIGZvciBjb21wbGV0ZSBNSVBJIERTSQoKU2lnbmVk
LW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+ClRlc3RlZC1i
eTogTWVybGlqbiBXYWplciA8bWVybGlqbkB3aXp6dXAub3JnPgotLS0KQ2hhbmdlcyBmb3IgdjEy
OgotIG5vbmUKCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0c2kg
fCAzNyArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQu
ZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQuZHRzaQppbmRl
eCAyN2U0ODIzNGYxYzIuLjFkYjgzNzhmNTlhNCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YWxsd2lubmVyL3N1bjUwaS1hNjQuZHRzaQpAQCAtMzgyLDYgKzM4MiwxMiBAQAogCQkJCQkjYWRk
cmVzcy1jZWxscyA9IDwxPjsKIAkJCQkJI3NpemUtY2VsbHMgPSA8MD47CiAJCQkJCXJlZyA9IDwx
PjsKKworCQkJCQl0Y29uMF9vdXRfZHNpOiBlbmRwb2ludEAxIHsKKwkJCQkJCXJlZyA9IDwxPjsK
KwkJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX2luX3Rjb24wPjsKKwkJCQkJCWFsbHdpbm5l
cix0Y29uLWNoYW5uZWwgPSA8MT47CisJCQkJCX07CiAJCQkJfTsKIAkJCX07CiAJCX07CkBAIC0x
MDE0LDYgKzEwMjAsMzcgQEAKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CiAKKwkJZHNp
OiBkc2lAMWNhMDAwMCB7CisJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW41MGktYTY0LW1p
cGktZHNpIjsKKwkJCXJlZyA9IDwweDAxY2EwMDAwIDB4MTAwMD47CisJCQlpbnRlcnJ1cHRzID0g
PEdJQ19TUEkgODkgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQljbG9ja3MgPSA8JmNjdSBDTEtf
QlVTX01JUElfRFNJPjsKKwkJCXJlc2V0cyA9IDwmY2N1IFJTVF9CVVNfTUlQSV9EU0k+OworCQkJ
cGh5cyA9IDwmZHBoeT47CisJCQlwaHktbmFtZXMgPSAiZHBoeSI7CisJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOworCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsK
KworCQkJcG9ydCB7CisJCQkJZHNpX2luX3Rjb24wOiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1l
bmRwb2ludCA9IDwmdGNvbjBfb3V0X2RzaT47CisJCQkJfTsKKwkJCX07CisJCX07CisKKwkJZHBo
eTogZC1waHlAMWNhMTAwMCB7CisJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW41MGktYTY0
LW1pcGktZHBoeSIsCisJCQkJICAgICAiYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRwaHkiOwor
CQkJcmVnID0gPDB4MDFjYTEwMDAgMHgxMDAwPjsKKwkJCWNsb2NrcyA9IDwmY2N1IENMS19CVVNf
TUlQSV9EU0k+LAorCQkJCSA8JmNjdSBDTEtfRFNJX0RQSFk+OworCQkJY2xvY2stbmFtZXMgPSAi
YnVzIiwgIm1vZCI7CisJCQlyZXNldHMgPSA8JmNjdSBSU1RfQlVTX01JUElfRFNJPjsKKwkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7CisJCQkjcGh5LWNlbGxzID0gPDA+OworCQl9OworCiAJCWhkbWk6
IGhkbWlAMWVlMDAwMCB7CiAJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW41MGktYTY0LWR3
LWhkbWkiLAogCQkJCSAgICAgImFsbHdpbm5lcixzdW44aS1hODN0LWR3LWhkbWkiOwotLSAKMi4x
OC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
