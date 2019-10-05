Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3294ECCA56
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 16:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6CE6E37C;
	Sat,  5 Oct 2019 14:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFABF6E37C
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 14:19:45 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id y22so5684305pfr.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Oct 2019 07:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5sUB0RooONzqGELXbytY+LCL6wUVKNVeZUfz3wJVzw4=;
 b=GcVoYzhqLTN5hx1mGc4JfXVzTtUZfWgtKuDev/CGWnQepK82uVFqPWr4z2GOik/yrj
 htfgt37ddCBQG+4hT0O5/pA0ASd9CNU+Q0DhoZ8qRy7UtcGwo7rW4gbMFMcPM1Z8rvvh
 R9FZXkhe30SyPxGy4J6By1Ke0JolPyccP+9Ceb96/ZGBWbYKmSNPxUJhd/SOPudJzjo4
 iQpNFiK27AEyMJ1sFdyV1S0aBEeFvW1pHckFikXsJy8RoC/v99Yz/GA/sj98BFyAZjCn
 QHwKDq/mGZfI74z6IVbC01r6vyfTVYHcbsOVbocJ7R2qCzo+NB9M5bvfT425Vr022xOq
 XVew==
X-Gm-Message-State: APjAAAVoaE9E0lA6uKcJqm+js3HcRwBouaWQ89GU5uSL1BeyiPgnZ5Fu
 9W/HOdtrxt+xe15/FaSMegmmOQ==
X-Google-Smtp-Source: APXvYqx10j7PRU3fLEOZ4azx/txsZuy2oIBSXEvFfbkS6wRKhiOEl3gRVIzJmlphFdU23Kz8OymjUg==
X-Received: by 2002:a63:d34c:: with SMTP id u12mr1238630pgi.88.1570285184885; 
 Sat, 05 Oct 2019 07:19:44 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
 by smtp.gmail.com with ESMTPSA id y138sm8977604pfb.174.2019.10.05.07.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 07:19:44 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v10 5/6] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
Date: Sat,  5 Oct 2019 19:49:12 +0530
Message-Id: <20191005141913.22020-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191005141913.22020-1-jagan@amarulasolutions.com>
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5sUB0RooONzqGELXbytY+LCL6wUVKNVeZUfz3wJVzw4=;
 b=h43kBO4gkvkkFs9AcbIQ2JN0yVcInn0HaBvXKvfGyM9qcSJgl/vsmd1u+bgYJOE0cx
 3qeTR/2h78QA02/D/R+EcsDBWI1dkXb4qutu8bWvyVpXe4iCghv3OV5MdTu357cqf9d3
 1jAGQ/5oRtDxAiYN9K3zXBPrxycQVfbLe414o=
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
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
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
eTogTWVybGlqbiBXYWplciA8bWVybGlqbkB3aXp6dXAub3JnPgotLS0KIGFyY2gvYXJtNjQvYm9v
dC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQuZHRzaSB8IDM4ICsrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNpCmluZGV4IDY5MTI4YTZkZmM0Ni4uYWQ0MTcwYjhh
ZWUwIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0
LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNp
CkBAIC0zODIsNiArMzgyLDEyIEBACiAJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJCQkj
c2l6ZS1jZWxscyA9IDwwPjsKIAkJCQkJcmVnID0gPDE+OworCisJCQkJCXRjb24wX291dF9kc2k6
IGVuZHBvaW50QDEgeworCQkJCQkJcmVnID0gPDE+OworCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0g
PCZkc2lfaW5fdGNvbjA+OworCQkJCQkJYWxsd2lubmVyLHRjb24tY2hhbm5lbCA9IDwxPjsKKwkJ
CQkJfTsKIAkJCQl9OwogCQkJfTsKIAkJfTsKQEAgLTEwMDMsNiArMTAwOSwzOCBAQAogCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsKIAkJfTsKIAorCQlkc2k6IGRzaUAxY2EwMDAwIHsKKwkJCWNvbXBh
dGlibGUgPSAiYWxsd2lubmVyLHN1bjUwaS1hNjQtbWlwaS1kc2kiOworCQkJcmVnID0gPDB4MDFj
YTAwMDAgMHgxMDAwPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA4OSBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsKKwkJCWNsb2NrcyA9IDwmY2N1IENMS19CVVNfTUlQSV9EU0k+OworCQkJY2xvY2st
bmFtZXMgPSAiYnVzIjsKKwkJCXJlc2V0cyA9IDwmY2N1IFJTVF9CVVNfTUlQSV9EU0k+OworCQkJ
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
