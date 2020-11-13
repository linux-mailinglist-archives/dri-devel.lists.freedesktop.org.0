Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6962B1C4D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279486E528;
	Fri, 13 Nov 2020 13:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724D36E4FE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so9994436wrt.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=451+tFthAljOAh2f/Wv8bktxEJYp2PVcrpZPPSF00gU=;
 b=pe6e21nu0qjtMO7L/dhgnVP1pOLq2uLl2Q603f2mIEfsxLZ4RIF5ndrN5ElCTk5gBH
 qQChgdrqm4R3PWyX5mMgOaxx9OkofEfBCcsS2ylOlDJ7yGlIIK5W9xGGJPcsDPMjho8J
 0j2P0H2AQeAsAZf+VeoXuXFXESasVb2kJfTC2fFe3IqwTvNbzmL61XTiAJLVbf//ktvE
 7wgdTtkmRnKSQmwwcqNylRCy7SZdv0M1aolSP2I49SYf0yYufITdguFUZ3pxAGSsFjQ3
 3Wi/1IjSnNLf+E/nmecH+3SNI7gxA8ulpguIdKsungNlVSzRdzgfEjtTVghmCWTbEB79
 ZvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=451+tFthAljOAh2f/Wv8bktxEJYp2PVcrpZPPSF00gU=;
 b=nLOoLrLUYogTHp3ngqzr60Chn/QrEapmgCan4mT6SzjQPfc6UKi63WyRwDlVISQZJR
 t5Jl2qJVv50ReNm0KqVsl3uOb6VSjz/sMpt5tN23ds9PCw2NbNqOvcnJ51jhVy6k/3Kb
 Hd0VwxwpZQjybiwPkbZFNFOCRsV4rZ2ywiWxqqIcnC82wwgeSEvRyBKnLOa0MYA8IgKX
 idc1XcNuCGtVgU8WMmenZNYg5+BLEJ3CHJgfy5g103Ytt9nM0as7qHvTUZNjfTMxX6Au
 CWu6S6VwpUGKS42wPACpAyIs1St5eaCNDGDVYZwDu5bl40pp118X074AoIukJ7qhSQ+f
 zrLA==
X-Gm-Message-State: AOAM533WBKsLZki0sCugVGKMUqiHaTkRl5H3qjQCJWua9Rv+8v1M7puQ
 T7jRekNHveiNhPJtoXjsprHYaQ==
X-Google-Smtp-Source: ABdhPJyjledgKwa6fPP8UYFTcytP7jLttiwL2vQI0keB72vsOIAUvnnP5rtBVPtFkTM4WWb/v+5bVA==
X-Received: by 2002:adf:f852:: with SMTP id d18mr3466397wrq.232.1605275423174; 
 Fri, 13 Nov 2020 05:50:23 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 33/40] drm/drm_dp_mst_topology: Remove set but never used
 variable 'len'
Date: Fri, 13 Nov 2020 13:49:31 +0000
Message-Id: <20201113134938.4004947-34-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYzogSW4gZnVuY3Rpb24g4oCYZHJtX2RwX3Nl
bmRfcXVlcnlfc3RyZWFtX2VuY19zdGF0dXPigJk6CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jOjMyNjM6Njogd2FybmluZzogdmFyaWFibGUg4oCYbGVu4oCZIHNldCBidXQg
bm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQg
PG1yaXBhcmRAa2VybmVsLm9yZz4KQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKaW5kZXggZTg3NTQyNTMzNjQwNi4uMDQwMWIyZjQ3NTAwMiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC0zMjYwLDcgKzMyNjAsNyBAQCBpbnQg
ZHJtX2RwX3NlbmRfcXVlcnlfc3RyZWFtX2VuY19zdGF0dXMoc3RydWN0IGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyICptZ3IsCiB7CiAJc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfdHggKnR4bXNn
OwogCXU4IG5vbmNlWzddOwotCWludCBsZW4sIHJldDsKKwlpbnQgcmV0OwogCiAJdHhtc2cgPSBr
emFsbG9jKHNpemVvZigqdHhtc2cpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIXR4bXNnKQpAQCAtMzI4
MSw3ICszMjgxLDcgQEAgaW50IGRybV9kcF9zZW5kX3F1ZXJ5X3N0cmVhbV9lbmNfc3RhdHVzKHN0
cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCSAqLwogCXR4bXNnLT5kc3QgPSBt
Z3ItPm1zdF9wcmltYXJ5OwogCi0JbGVuID0gYnVpbGRfcXVlcnlfc3RyZWFtX2VuY19zdGF0dXMo
dHhtc2csIHBvcnQtPnZjcGkudmNwaSwgbm9uY2UpOworCWJ1aWxkX3F1ZXJ5X3N0cmVhbV9lbmNf
c3RhdHVzKHR4bXNnLCBwb3J0LT52Y3BpLnZjcGksIG5vbmNlKTsKIAogCWRybV9kcF9xdWV1ZV9k
b3duX3R4KG1nciwgdHhtc2cpOwogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
