Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B0C2B4DA6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C966E8E7;
	Mon, 16 Nov 2020 17:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C9C89FCE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:24 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p19so378382wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=451+tFthAljOAh2f/Wv8bktxEJYp2PVcrpZPPSF00gU=;
 b=XGCk6s8gC8Z7wwqz/yakD2Actx1/SDxlJWpn6VZXYaCcZgwFWPIiwikiWrSfoDH1CY
 eoyz/KluCphA/lJ1/dcnuK8uF1wLI4GwD2IuYSvn/QpePKLy80V5b4ResvbhO8AJSa2h
 AuO1DEYoX4OcOKEvamcX7MR2cFDcfgRQZD03tFja5kLg+EDyqI2PN0WelbUbGJdFWcR9
 qsLBgHOvcP5PeWWLWZVF/7/MPWWr0mXikaw7doM1MvCg7vjAv9VGWYC/Q/iK7T7Cp4Kz
 O6mdYmXV4Nt/nd9+89fMr8shFLkuMiT9zKMRumtWDe5SfMO3vzuOjAqn2sriZEQUbxGN
 gsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=451+tFthAljOAh2f/Wv8bktxEJYp2PVcrpZPPSF00gU=;
 b=MB8UsuhnuFV9KY7Eh8nOAJcM+jwwLxLDJEPbF2KSjBieLPCvNuTpUHBVMZsHHjynB3
 kEOH6VU/EvozG6tpFN2W7OaGmSRQiLS8yOhqlJHJAM0LWPJCifLKDxRkyh/UzOAktir3
 D/ZQstaa/pip52C0nuoJVoDYB3aVNtjjyxKG/CPyqoNna4O2uQhGcDinOHhDlpiSHB8O
 ctUzV2QuPwvI5mKHVmlOPvMSotoz7lsdmPknnJpFPfJlXWXqZuDmD4495IpWxz0WdT0Q
 e9VxeamampO3rLJLxIsbRH7HeCnZBtxCVayT4K1zk/JK6q8a8QyECwlIKTCgIk2GXBWR
 Mwmg==
X-Gm-Message-State: AOAM532zH17lT4cyCGnu5Wj7TwK6WqJY0Oxs4NbKh7S5mhtKmdevEn22
 DM98FhLrOx/b0G+l2QdLDAfGRA==
X-Google-Smtp-Source: ABdhPJwZBZpSzy/6KpIKdwNmgKx3o+w5BcHKVqsUZqBOvYAmzytj7ySLSeOcE9qh+eybQ0AMFCy/Vw==
X-Received: by 2002:a1c:b387:: with SMTP id c129mr37255wmf.58.1605548483095;
 Mon, 16 Nov 2020 09:41:23 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/42] drm/drm_dp_mst_topology: Remove set but never used
 variable 'len'
Date: Mon, 16 Nov 2020 17:40:33 +0000
Message-Id: <20201116174112.1833368-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
