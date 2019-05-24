Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0C029653
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 12:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7016E0F3;
	Fri, 24 May 2019 10:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF626E0F3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:50:25 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y11so258022pfm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 03:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nP3yWdSdOBguUQvL1Rluu0V+blq5lMGRtGXamF3bLkw=;
 b=LH6Kyn40r6Rypj7+T2u4sAQDlt5c+TASo5VO1jL9KjM2lLGnQGQvvjsskzh2HyPMJz
 mYQFfYvrE003efI1mmEQeI0mCYHxjLR9erYgr2b90neaGjry/WRQcI7Qm1DPMynHDTI8
 5fevxLmkwOukgT4HJGmEjXuo5zR8PiU6JegbyRXtF3EoWJl6xxwjGC8TFrGJu/WaFIWc
 awTtqAPWbDhccTnz3ty2CAGK0x4PC8odzVa2nzU8NqO71pCbwtvAutsCpXxMXLrBVrus
 9GkEm26teb6CSkHi/IFAE2NeGyV0QRckYjD/9IXPdCFfr5xZJADmuewilspjsaA9CLEa
 s3lQ==
X-Gm-Message-State: APjAAAUcZKcApy4OS20BNKU12PmvjVMn0f6nG6NCk3EBHF5i3h1dVYni
 3QJ1YGdAOseaqbMIxwqXt4t9XA==
X-Google-Smtp-Source: APXvYqxrirpUHWJCS4XTsorLCGVLEXohr/Hu6n159kHS43nSAQBPXQ2rskeSgI2M8selLJJyC1lBrA==
X-Received: by 2002:a63:225b:: with SMTP id t27mr18104506pgm.25.1558694587171; 
 Fri, 24 May 2019 03:43:07 -0700 (PDT)
Received: from localhost.localdomain ([183.82.227.60])
 by smtp.gmail.com with ESMTPSA id u1sm2176028pfh.85.2019.05.24.03.43.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 03:43:06 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [DO NOT MERGE] [PATCH v2 2/6] ARM: dts: sun8i: bananapi-m2m: Enable
 Bananapi S070WV20-CT16 DSI panel
Date: Fri, 24 May 2019 16:12:52 +0530
Message-Id: <20190524104252.20236-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nP3yWdSdOBguUQvL1Rluu0V+blq5lMGRtGXamF3bLkw=;
 b=Umf6KdVJ9NBQr824CkR3whnBByI3We6uojHAy4ZHN7aGThpcSheG/NUEteAhmo4BZr
 Tv3iTdzkL3hZ1221FRM9gKTC009LNKGhRQd/2Sb66A6bKtWHwQKYuaOlJstrgROIkLqy
 D/raVHojoJ6xnSPJKnpRe1QKrLqYeYrXcqEw8=
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
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgQmFuYW5hcGkgUzA3MFdWMjAtQ1QxNiBEU0kgcGFu
ZWwgdG8KQlBJLU0yTSBib2FyZC4KCkRTSSBwYW5lbCBjb25uZWN0ZWQgdmlhIGJvYXJkIERTSSBw
b3J0IHdpdGgsCi0gRENEQzEgYXMgVkNDLURTSSBzdXBwbHkKLSBQTDUgZ3BpbyBmb3IgbGNkIHJl
c2V0IGdwaW8gcGluCi0gUEI3IGdwaW8gZm9yIGxjZCBlbmFibGUgZ3BpbyBwaW4KLSBQTDQgZ3Bp
byBmb3IgYmFja2xpZ2h0IGVuYWJsZSBwaW4KClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGph
Z2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXIx
Ni1iYW5hbmFwaS1tMm0uZHRzIHwgNTkgKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA1OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Vu
OGktcjE2LWJhbmFuYXBpLW0ybS5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdW44aS1yMTYtYmFu
YW5hcGktbTJtLmR0cwppbmRleCBlMWM3NWY3ZmEzY2EuLjc2MmQ0Y2ZjZmYwMSAxMDA2NDQKLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjE2LWJhbmFuYXBpLW0ybS5kdHMKKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvc3VuOGktcjE2LWJhbmFuYXBpLW0ybS5kdHMKQEAgLTQ0LDYgKzQ0LDcg
QEAKICNpbmNsdWRlICJzdW44aS1hMzMuZHRzaSIKIAogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dw
aW8vZ3Bpby5oPgorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3B3bS9wd20uaD4KIAogLyB7CiAJbW9k
ZWwgPSAiQmFuYW5hUGkgTTIgTWFnaWMiOwpAQCAtNjEsNiArNjIsMTQgQEAKIAkJc3Rkb3V0LXBh
dGggPSAic2VyaWFsMDoxMTUyMDBuOCI7CiAJfTsKIAorCWJhY2tsaWdodDogYmFja2xpZ2h0IHsK
KwkJY29tcGF0aWJsZSA9ICJwd20tYmFja2xpZ2h0IjsKKwkJcHdtcyA9IDwmcHdtIDAgNTAwMDAg
UFdNX1BPTEFSSVRZX0lOVkVSVEVEPjsKKwkJYnJpZ2h0bmVzcy1sZXZlbHMgPSA8MSAyIDQgOCAx
NiAzMiA2NCAxMjggMjU1PjsKKwkJZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsID0gPDg+OworCQll
bmFibGUtZ3Bpb3MgPSA8JnJfcGlvIDAgNCBHUElPX0FDVElWRV9ISUdIPjsgLyogTENELUJMLUVO
OiBQTDQgKi8KKwl9OworCiAJbGVkcyB7CiAJCWNvbXBhdGlibGUgPSAiZ3Bpby1sZWRzIjsKIApA
QCAtMTIyLDYgKzEzMSw0NiBAQAogCXN0YXR1cyA9ICJva2F5IjsKIH07CiAKKyZkZSB7CisJc3Rh
dHVzID0gIm9rYXkiOworfTsKKworJmRwaHkgeworCXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZk
c2kgeworCXZjYy1kc2ktc3VwcGx5ID0gPCZyZWdfZGNkYzE+OwkJLyogVkNDLURTSSAqLworCXN0
YXR1cyA9ICJva2F5IjsKKworCXBvcnRzIHsKKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCSNz
aXplLWNlbGxzID0gPDA+OworCisJCWRzaV9vdXQ6IHBvcnRAMCB7CisJCQlyZWcgPSA8MD47CisK
KwkJCWRzaV9vdXRfcGFuZWw6IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnBh
bmVsX291dF9kc2k+OworCQkJfTsKKwkJfTsKKwl9OworCisJcGFuZWxAMCB7CisJCWNvbXBhdGli
bGUgPSAiYmFuYW5hcGksczA3MHd2MjAtY3QxNi1pY242MjExIjsKKwkJcmVnID0gPDA+OworCQll
bmFibGUtZ3Bpb3MgPSA8JnBpbyAxIDcgR1BJT19BQ1RJVkVfSElHSD47IC8qIExDRC1QV1ItRU46
IFBCNyAqLworCQlyZXNldC1ncGlvcyA9IDwmcl9waW8gMCA1IEdQSU9fQUNUSVZFX0hJR0g+OyAv
KiBMQ0QtUlNUOiBQTDUgKi8KKwkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+OworCisJCXBvcnQg
eworCQkJcGFuZWxfb3V0X2RzaTogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwm
ZHNpX291dF9wYW5lbD47CisJCQl9OworCQl9OworCX07Cit9OworCiAmZWhjaTAgewogCXN0YXR1
cyA9ICJva2F5IjsKIH07CkBAIC0xNTcsNiArMjA2LDEyIEBACiAJc3RhdHVzID0gIm9rYXkiOwog
fTsKIAorJnB3bSB7CisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwlwaW5jdHJsLTAgPSA8
JnB3bTBfcGluPjsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAmcl9yc2IgewogCXN0YXR1cyA9
ICJva2F5IjsKIApAQCAtMjY5LDYgKzMyNCwxMCBAQAogCXN0YXR1cyA9ICJva2F5IjsKIH07CiAK
KyZ0Y29uMCB7CisJc3RhdHVzID0gIm9rYXkiOworfTsKKwogJnVhcnQwIHsKIAlwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOwogCXBpbmN0cmwtMCA9IDwmdWFydDBfcGJfcGlucz47Ci0tIAoyLjE4
LjAuMzIxLmdmZmM2ZmEwZTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
