Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A0D8319E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 14:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD5C6E366;
	Tue,  6 Aug 2019 12:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FA56E366
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 12:44:20 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z1so87764034wru.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 05:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KO3I9isK829bDAzoIYhMJ5BHP8qWfbUOhOqwyY1Ue8Q=;
 b=XDQoW9Eo4Jv0ysWZ+xQzuzsUH/UhxrHhXMsIpSKrfr/hV7R7G6wb+sZmj/1iYWDuPb
 Dycf3xYkhS2+KvwNDzfV8D1IIFdQUFZQ1VbhcinrPo3cU9EaUKo7ByIUBVQyPB0y4ydh
 NzOFNw37dzkraA7x+Vfv0KgwkJCQy9zMgYNsmwLwZq9dyohoTm4KgRpZQdfu+4weeprJ
 vz8mdhXnHYeME8knPQqYK/DBWgQd6UuXE/rNNMX6TW7fcX5u0yRKAD/fIv1Ouyhn+qXI
 p/WuPhFltRWH156WJU/iEL8dOu/v4uRWutEWg0Ii6MEGNNs9AKSGENkJ3cmc7x4Fd9k4
 yE9w==
X-Gm-Message-State: APjAAAX96o6FYiQzgNuoIklhK2BhPtGXYNd9dSmKudujCpbz29nrRJy3
 8RejZ7jlG6W54Nu5nXOENa4d0w==
X-Google-Smtp-Source: APXvYqxzWD1+g+8j3XMze7/L/Id/Sa6g7GtYPAKutoXeGaVKKMV2UxVERxWGXrSeGKhdH+ieqhGhpQ==
X-Received: by 2002:a5d:56cb:: with SMTP id m11mr4724737wrw.255.1565095458656; 
 Tue, 06 Aug 2019 05:44:18 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q20sm3842135wrc.79.2019.08.06.05.44.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 05:44:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH v2 0/3] drm/meson: convert bindings to YAML schemas
Date: Tue,  6 Aug 2019 14:44:13 +0200
Message-Id: <20190806124416.15561-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KO3I9isK829bDAzoIYhMJ5BHP8qWfbUOhOqwyY1Ue8Q=;
 b=JrZ6jaH1U8FIHz6Bc8fph0FiiWO6K+omU5EUJU4jjF30+ys1KQU3SZdTkQa3jdLrn0
 E7L1bTIc93b/aDcBr4funyN2HbaOOQUAE267YVC5GaaLCnjz+RM+FVzJYaATJfGImyc4
 r6Z/odJIDA5rFceLBE0XAZqZejXuLitKd5blVAf8H3urYm7jwPHgHTODfcZ95TA+PDaC
 cMRx3zSX1Q9811UjLuu4eddHynsPD0T53VLfp1zJFwHCtjukZZVpw8UERDQBYTmkMekx
 iEKyihqFLrtNAD0AeVEQsc4DtgbJxve5flvT1gYQRYBfikrDEVDcFYH4/Ghsmm6sJuJc
 OtRQ==
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBjb252ZXJ0cyB0aGUgZXhpc3RpbmcgdGV4dCBiaW5kaW5ncyB0byBZQU1M
IHNjaGVtYXMuCgpUaG9zZSBiaW5kaW5ncyBoYXZlIGEgbG90IG9mIHRleHRzLCB0aHVzIGlzIGlu
dGVyZXN0aW5nIHRvIGNvbnZlcnQuCgpBbGwgaGF2ZSBiZWVuIHRlc3RlZCB1c2luZyA6CiQgbWFr
ZSBBUkNIPWFybTY0IGR0YnNfY2hlY2sKCklzc3VlcyB3aXRoIHRoZSBhbWxvZ2ljIGFybTY0IERU
cyBoYXMgYWxyZWFkeSBiZWVuIGlkZW50aWZpZWQgdGhhbmtzCnRvIHRoZSB2YWxpZGF0aW9uIHNj
cmlwdHMuIFRoZSBEVCBmaXhlcyB3aWxsIGJlIHB1c2hlZCBvbmNlIHRoZXNlIHlhbWwKYmluZGlu
Z3MgYXJlIGFja2VkLgoKTmVpbCBBcm1zdHJvbmcgKDMpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5
OiBhbWxvZ2ljLG1lc29uLWR3LWhkbWk6IGNvbnZlcnQgdG8geWFtbAogIGR0LWJpbmRpbmdzOiBk
aXNwbGF5OiBhbWxvZ2ljLG1lc29uLXZwdTogY29udmVydCB0byB5YW1sCiAgTUFJTlRBSU5FUlM6
IFVwZGF0ZSB3aXRoIEFtbG9naWMgRFJNIGJpbmRpbmdzIGNvbnZlcnRlZCBhcyBZQU1MCgogLi4u
L2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnR4dCAgICAgICAgIHwgMTE5IC0tLS0tLS0t
LS0tLS0tCiAuLi4vZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFtbCAgICAgICAgfCAx
NTAgKysrKysrKysrKysrKysrKysrCiAuLi4vYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29u
LXZwdS50eHQgICAgfCAxMjEgLS0tLS0tLS0tLS0tLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2Ft
bG9naWMsbWVzb24tdnB1LnlhbWwgICB8IDEzOCArKysrKysrKysrKysrKysrCiBNQUlOVEFJTkVS
UyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIDUgZmlsZXMgY2hh
bmdlZCwgMjkwIGluc2VydGlvbnMoKyksIDI0MiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1l
c29uLWR3LWhkbWkudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnlhbWwKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxv
Z2ljLG1lc29uLXZwdS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLXZwdS55YW1sCgotLSAKMi4yMi4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
