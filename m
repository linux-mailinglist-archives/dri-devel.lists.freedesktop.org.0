Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE5B9E1C4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 10:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1374389167;
	Tue, 27 Aug 2019 08:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC73E89915
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 08:14:30 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e16so720817wro.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 01:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3fwLgPt/sy0VRW5cHDJyRotay9sWSMyISJ5IvQ5QQMA=;
 b=UtGrW5Bc9FQLqg0eUyVoChwkxIWWE6idCxhQp6ptR4IthpcPyxIo8WuZX47UPrU1xV
 aw2f3nednRL9yJVSxevplkAiJE8DUWTyPI0jWCL0ruMTPS9fjhN+I6wlPRk5K0+kT5sy
 Dwz1DeraJ6ioqX5+euSDscvG2AzE9JzYDysRHl1sz8ZL/wMEAWh/GRBXtB8qveq4aULg
 8SXPi1EjTbQnXCIkB+IxS/N0iSbj0VRd7cz28dfhRrM3yf/pGQzx4ybt5hU5hG5sSO4D
 x3dN7qYh2LYY3jX7U1ku3dXaCCUOzeZMq/YU3CVcYht0Ajfz8S84Y3BmZb3zgSWK+QcS
 D5DQ==
X-Gm-Message-State: APjAAAVK4/myp+wafLCbbYXVUwNl6nT+iqCaX9dkHyNYlB9nibi0/Ahf
 OxgrZKAJ+M/Upu5rEhnsztCjeQ==
X-Google-Smtp-Source: APXvYqztWS6qzctrIjcT+AV41CNogqI+Ep6+I+AnpQFdQmvtAHxf1STFdqtf+tvOdN6+ooP8EYCImA==
X-Received: by 2002:a5d:658b:: with SMTP id q11mr2210567wru.211.1566893669171; 
 Tue, 27 Aug 2019 01:14:29 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f18sm11911792wrx.85.2019.08.27.01.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 01:14:28 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH RFC v2 1/8] drm/meson: venc: make drm_display_mode const
Date: Tue, 27 Aug 2019 10:14:18 +0200
Message-Id: <20190827081425.15011-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827081425.15011-1-narmstrong@baylibre.com>
References: <20190827081425.15011-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3fwLgPt/sy0VRW5cHDJyRotay9sWSMyISJ5IvQ5QQMA=;
 b=C9GqNB7Zx2gcvaVzTdzCbkKaigQKRB7taaAM92mqpg588P/+1/L5odJieFPNb0LTwN
 8RczG1CjJ/RyL5OyJlcfTqSew2yax0JYZJh/l4Y+UzzRSp+ANIfP7SuSkrWustPY4+Hn
 6RV1d5TbNu7JaqsqYlY6hA8inCmFL8gan4+a+SNE0xAC7sYznX0dy3LZPVLvgtfu1YOf
 Nm9n7/2lm6kIyvnOk45RNmGIvQKdiozzb6wQDVoBIvrcdt9EbEoNaJ6Rv1wXxZ8eSLBq
 9qktKeEvuLDRO2wI+b/aPcWoljP8SN7KpIkah35+Ca945fvXDNHjsexq3DlTPS0lUDnE
 S/ig==
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

QmVmb3JlIHN3aXRjaGluZyB0byBicmlkZ2UgZnVuY3MsIG1ha2Ugc3VyZSBkcm1fZGlzcGxheV9t
b2RlIGlzIHBhc3NlZAphcyBjb25zdCB0byB0aGUgdmVuYyBmdW5jdGlvbnMuCgpTaWduZWQtb2Zm
LWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5
OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fdmVuYy5oIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21l
c29uX3ZlbmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMKaW5kZXggNjc5
ZDIyNzQ1MzFjLi5kMmQ0YzNlYmY0NmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNv
bi9tZXNvbl92ZW5jLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYwpA
QCAtOTQ2LDcgKzk0Niw3IEBAIGJvb2wgbWVzb25fdmVuY19oZG1pX3ZlbmNfcmVwZWF0KGludCB2
aWMpCiBFWFBPUlRfU1lNQk9MX0dQTChtZXNvbl92ZW5jX2hkbWlfdmVuY19yZXBlYXQpOwogCiB2
b2lkIG1lc29uX3ZlbmNfaGRtaV9tb2RlX3NldChzdHJ1Y3QgbWVzb25fZHJtICpwcml2LCBpbnQg
dmljLAotCQkJICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCisJCQkgICAgICBj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIHsKIAl1bmlvbiBtZXNvbl9oZG1p
X3ZlbmNfbW9kZSAqdm1vZGUgPSBOVUxMOwogCXVuaW9uIG1lc29uX2hkbWlfdmVuY19tb2RlIHZt
b2RlX2RtdDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5oCmluZGV4IDU3Njc2OGJkZDA4ZC4u
MWFiZGNiZGY1MWMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVu
Yy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmgKQEAgLTYwLDcgKzYw
LDcgQEAgZXh0ZXJuIHN0cnVjdCBtZXNvbl9jdmJzX2VuY2lfbW9kZSBtZXNvbl9jdmJzX2VuY2lf
bnRzYzsKIHZvaWQgbWVzb25fdmVuY2lfY3Zic19tb2RlX3NldChzdHJ1Y3QgbWVzb25fZHJtICpw
cml2LAogCQkJICAgICAgIHN0cnVjdCBtZXNvbl9jdmJzX2VuY2lfbW9kZSAqbW9kZSk7CiB2b2lk
IG1lc29uX3ZlbmNfaGRtaV9tb2RlX3NldChzdHJ1Y3QgbWVzb25fZHJtICpwcml2LCBpbnQgdmlj
LAotCQkJICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOworCQkJICAgICAgY29u
c3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwogdW5zaWduZWQgaW50IG1lc29uX3Zl
bmNpX2dldF9maWVsZChzdHJ1Y3QgbWVzb25fZHJtICpwcml2KTsKIAogdm9pZCBtZXNvbl92ZW5j
X2VuYWJsZV92c3luYyhzdHJ1Y3QgbWVzb25fZHJtICpwcml2KTsKLS0gCjIuMjIuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
