Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99970101AF5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243C16EBAA;
	Tue, 19 Nov 2019 08:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C2A6E82A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:48 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id o65so14866940lff.13
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SERw9nCbud8tdFDukLLsJdUgk5juTTigzobfxKmrkf0=;
 b=oLXzYKhvKb0OAeUE074525Vj7Z7GoO2avGZzdIE5gX6cUZncSTW75BbPvaOKzXDUfG
 biScY+LAX4Onr7DDmVuyGKBHWOnDLkz+b9NmrRBRWeyWZ7WEpZ38jXjIBFulUEgq2HVf
 gcOCCdq8eSYsrj1s8nzn+nUmwHD0fsaHa2Uso2Aqb/Q1Zrha79ieRplHcEr4bgujZ1Ev
 qVCRp/MhteHtJBQkhX7dKRuQK6DMEcQ+yU3SYo90AmpXMPpOxl37qdkxR+Iy3WchMY/R
 PxznRw+9GpAbq+TpHep3fj8CnZKSPxkHUY4CpofzvrLSaaPqJFAns4ON9GacMVd4iy0n
 OoEQ==
X-Gm-Message-State: APjAAAU9r16Rvmutd087I5u8xm7ASUuelhmJFIdsrdq+RgzapdSu1uCb
 ZWLLf687Dc486qfSLCSTy+I=
X-Google-Smtp-Source: APXvYqy7JAAIPml6XBajTor+RlCN+vGhrDWqbF5FKIOEKhj66PqT47STzTZ7exq/OcNh2vypJEIeug==
X-Received: by 2002:ac2:5594:: with SMTP id v20mr897373lfg.148.1574107546740; 
 Mon, 18 Nov 2019 12:05:46 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:46 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 16/29] memory: tegra: Add interconnect nodes for Terga124
 display controllers
Date: Mon, 18 Nov 2019 23:02:34 +0300
Message-Id: <20191118200247.3567-17-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SERw9nCbud8tdFDukLLsJdUgk5juTTigzobfxKmrkf0=;
 b=da/vl09U+Ezy+opOo0SLb4ri11IQ/xqN6q8Gu1asTD6BPPWjY/HsIELwTwcrHyaGac
 sbTrkftbAT7GTyGGf25TzcVYb+1/lB+7PNsBXwkVW7t+vf/y3YEkd74ZkfFFwuJ0BPU7
 96Fe6gDSHAh8LMfU4fNYdel+pBnzqi+noc78zT3MiiPFzflJdtZqUzX7islk6dA2RBy+
 Qy2kKIhb2scv05kKVmCfKr11xEW1qI3OweaAbUY1wwBOSsuv2qRYWF/JrKM+GbHfhycl
 YNYpuaLgiFAYJSDluPjk5PJ2Z0y6a7wRM7UU8iO2t1svAtYxfa6qTq2+DPSRpjiqHmzY
 FbMA==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGluaXRpYWwgaW50ZXJjb25uZWN0IG5vZGVzIHRoYXQgYWxsb3cgZGlzcGxheSBjb250cm9s
bGVyIGRyaXZlcgp0byBwZXJmb3JtIG1lbW9yeSBiYW5kd2lkdGggcmVxdWVzdHMgdXNpbmcgaW50
ZXJjb25uZWN0IEFQSS4KClNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdt
YWlsLmNvbT4KLS0tCiBkcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTEyNC5jIHwgMTYgKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTEyNC5jIGIvZHJpdmVycy9tZW1vcnkvdGVncmEv
dGVncmExMjQuYwppbmRleCA0OTNiNWRjM2E0YjMuLmRhZTZiMzY2MjgxZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmExMjQuYworKysgYi9kcml2ZXJzL21lbW9yeS90ZWdy
YS90ZWdyYTEyNC5jCkBAIC02LDYgKzYsNyBAQAogI2luY2x1ZGUgPGxpbnV4L29mLmg+CiAjaW5j
bHVkZSA8bGludXgvbW0uaD4KIAorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVyY29ubmVjdC90
ZWdyYS1pY2MuaD4KICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9tZW1vcnkvdGVncmExMjQtbWMuaD4K
IAogI2luY2x1ZGUgIm1jLmgiCkBAIC0xMDI4LDYgKzEwMjksMTcgQEAgc3RhdGljIGNvbnN0IHVu
c2lnbmVkIGxvbmcgdGVncmExMjRfbWNfZW1lbV9yZWdzW10gPSB7CiAJTUNfRU1FTV9BUkJfUklO
RzFfVEhST1RUTEUKIH07CiAKKyNkZWZpbmUgVEVHUkExMjRfTUNfSUNDKF9uYW1lKQkJCQlcCisJ
ewkJCQkJCVwKKwkJLm5hbWUgPSAjX25hbWUsCQkJCVwKKwkJLmlkID0gVEVHUkFfSUNDX01DXyMj
X25hbWUsCQlcCisJfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IHRlZ3JhX21jX2ljY19ub2RlIHRl
Z3JhMTI0X21jX2ljY19ub2Rlc1tdID0geworCVRFR1JBMTI0X01DX0lDQyhEQyksCisJVEVHUkEx
MjRfTUNfSUNDKERDQiksCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IHRlZ3JhX3NtbXVfc29j
IHRlZ3JhMTI0X3NtbXVfc29jID0gewogCS5jbGllbnRzID0gdGVncmExMjRfbWNfY2xpZW50cywK
IAkubnVtX2NsaWVudHMgPSBBUlJBWV9TSVpFKHRlZ3JhMTI0X21jX2NsaWVudHMpLApAQCAtMTA1
Niw2ICsxMDY4LDggQEAgY29uc3Qgc3RydWN0IHRlZ3JhX21jX3NvYyB0ZWdyYTEyNF9tY19zb2Mg
PSB7CiAJLnJlc2V0X29wcyA9ICZ0ZWdyYV9tY19yZXNldF9vcHNfY29tbW9uLAogCS5yZXNldHMg
PSB0ZWdyYTEyNF9tY19yZXNldHMsCiAJLm51bV9yZXNldHMgPSBBUlJBWV9TSVpFKHRlZ3JhMTI0
X21jX3Jlc2V0cyksCisJLmljY19ub2RlcyA9IHRlZ3JhMTI0X21jX2ljY19ub2RlcywKKwkubnVt
X2ljY19ub2RlcyA9IEFSUkFZX1NJWkUodGVncmExMjRfbWNfaWNjX25vZGVzKSwKIH07CiAjZW5k
aWYgLyogQ09ORklHX0FSQ0hfVEVHUkFfMTI0X1NPQyAqLwogCkBAIC0xMDg2LDUgKzExMDAsNyBA
QCBjb25zdCBzdHJ1Y3QgdGVncmFfbWNfc29jIHRlZ3JhMTMyX21jX3NvYyA9IHsKIAkucmVzZXRf
b3BzID0gJnRlZ3JhX21jX3Jlc2V0X29wc19jb21tb24sCiAJLnJlc2V0cyA9IHRlZ3JhMTI0X21j
X3Jlc2V0cywKIAkubnVtX3Jlc2V0cyA9IEFSUkFZX1NJWkUodGVncmExMjRfbWNfcmVzZXRzKSwK
KwkuaWNjX25vZGVzID0gdGVncmExMjRfbWNfaWNjX25vZGVzLAorCS5udW1faWNjX25vZGVzID0g
QVJSQVlfU0laRSh0ZWdyYTEyNF9tY19pY2Nfbm9kZXMpLAogfTsKICNlbmRpZiAvKiBDT05GSUdf
QVJDSF9URUdSQV8xMzJfU09DICovCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
