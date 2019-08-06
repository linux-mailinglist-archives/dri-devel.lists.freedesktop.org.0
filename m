Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E568335F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 15:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2559E6E393;
	Tue,  6 Aug 2019 13:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E99C6E393
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 13:55:02 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y17so57768401ljk.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 06:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IJ12Dy3JfyZ0l7CageHav/zHZkBqP0OCWfzKRPvmdoc=;
 b=ihXi9r1B73Yq035bRJK3KBUqNumvyljJ20BpxPZU7aCOak0UsXiY8j19YDGEBvhTP0
 tsOKD/fkk9oqyKPpkhu3reqC5yt1NNjO5VxZ9vAs59G8JridRzbjDLSeli/cz8asF2VU
 klQR+Y+Nhbdrh1uXSzaHOr37nZcaVoeIOSPQpfo6BjkicS4ajegNsS4kZqAzEYSJqYqA
 kdVYxgzhJTnm9bJd/Fq12z8sVGsX8WGX1T3eNYVx1ITm0vKO6sAyZfS4iicRVL1nPWeB
 UZglvL1YjeuhNxF9ZYyD2s3QMvDWFbwT5oXhfmn5dzahv9tZv9h8eeLeFuhP+CmuwP6C
 x++w==
X-Gm-Message-State: APjAAAVDimFARbnKpPvBkuwG8NMPZxxY2E0kZLJ2mmhfHdhzXzE2s58Z
 IteUkvnzJ6zBQ+9ABWc8X2hw1EBODgY=
X-Google-Smtp-Source: APXvYqxv8qeBsyp4+j8+tEUZfsnPoqeK+HtBmP4WRrTSf4gzVQpnVHOuB+aJZHmFKhJdaRZiGmjR4A==
X-Received: by 2002:a2e:7614:: with SMTP id r20mr1896078ljc.42.1565099700349; 
 Tue, 06 Aug 2019 06:55:00 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id u22sm20071875ljd.18.2019.08.06.06.54.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 06:54:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 2/4 v3] drm/panel: simple: Add TI nspire panel bindings
Date: Tue,  6 Aug 2019 15:54:37 +0200
Message-Id: <20190806135437.7451-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IJ12Dy3JfyZ0l7CageHav/zHZkBqP0OCWfzKRPvmdoc=;
 b=p40EAZqxGwsk7cv76bOJBxNqqa0AeZzd3w3C2VYzbT8LY1ssw9DC7sCkwirZoazfZq
 BU5IMdW/tQtlFGdsGju93CFQ56bexUWSN13iJEImGWjA1aWQAPr/CX2AkBkiMuoRuV/M
 jplktamrvZRG/kWsC9EmW6QUaHibt/6YNQor+3USjTVm627JdrzSCt/S4LneRh0kervw
 qKfVB8b1pVbhIT5aiO1GCUSl9EYUa0AQ85wMqRRi6uCk9agFjrH5gDxoGFHzLR2FJ7Rk
 qo+mpMzKUQXjli74QUS9KnxIt50OYX+b/EY49TuDplwuT6HJuC5aTzw3OjM80NcsQdZG
 z7tg==
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGJpbmRpbmdzIGZvciB0aGUgVEkgTlNQSVJFIHNpbXBsZSBkaXNwbGF5IHBhbmVscy4KCkNj
OiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQpDaGFuZWdMb2cgdjItPnYzOgotIFN3aXRj
aCB0byBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlIGxpY2Vuc2UKLSBVc2UgYSBzaW1wbGUg
ZW51bSBmb3IgdGhlIGNvbXBhdGlibGUKLSBVc2UgdGhlIG5ldyBuaWZ0eSBwYW5lbC1jb21tb24u
eWFtbCwgdGVzdGVkIG9uCiAgbGludXgtbmV4dApDaGFuZ2VMb2cgdjEtPnYyOgotIE5ldyBwYXRj
aCBhcyBiaW5kaW5ncyBhcmUgcmVxdWlyZWQKLSBMZXQncyB1c2UgWUFNTAotLS0KIC4uLi9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3RpLG5zcGlyZS55YW1sICAgICB8IDM2ICsrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvdGksbnNw
aXJlLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC90aSxuc3BpcmUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL3RpLG5zcGlyZS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAwMC4uNWM1YTNiNTE5ZTMxCi0tLSAvZGV2L251bGwKKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvdGksbnNwaXJlLnlh
bWwKQEAgLTAsMCArMSwzNiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAt
b25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3RpLG5zcGlyZS55YW1sIworJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBU
ZXhhcyBJbnN0cnVtZW50cyBOU1BJUkUgRGlzcGxheSBQYW5lbHMKKworbWFpbnRhaW5lcnM6Cisg
IC0gTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgorCithbGxPZjoKKyAg
LSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToK
KyAgICBlbnVtOgorICAgICAgLSB0aSxuc3BpcmUtY3gtbGNkLXBhbmVsCisgICAgICAtIHRpLG5z
cGlyZS1jbGFzc2ljLWxjZC1wYW5lbAorICBwb3J0OiB0cnVlCisKK3JlcXVpcmVkOgorICAtIGNv
bXBhdGlibGUKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAt
IHwKKyAgICBwYW5lbCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAidGksbnNwaXJlLWN4LWxjZC1w
YW5lbCI7CisgICAgICAgIHBvcnQgeworICAgICAgICAgICAgcGFuZWxfaW46IGVuZHBvaW50IHsK
KyAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JnBhZHM+OworICAgICAgICAgICAg
fTsKKyAgICAgICAgfTsKKyAgICB9OwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
