Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B8A2B4D10
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801406E039;
	Mon, 16 Nov 2020 17:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ED26E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:34:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o15so19621072wru.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=451+tFthAljOAh2f/Wv8bktxEJYp2PVcrpZPPSF00gU=;
 b=cqC85SAbvKb4vxP7CxB9dr4lJWpnhLV/bViOX/iYNsOK62UjscaixwfZ+7HpQ6X+Aj
 bQ39omF4/4UFe9u8ru1Uka99/ZD+ipHFxL/krKYjAHVCU3ZxW/IqcAiK2X7GDyH++Dmv
 pK5DSQ7ibKOEx9THmb89wrkmPYiWTLCpogCDuvJQcuawwN8RV7vAbaoJH9hNL+XCx667
 On8f9BmcWcdjvdLMOF2P8QfE2Se3Lm6wENVAqdz3wvEHpUaCSqmd7x4b9oLSkRyYkTXe
 E+8QN62Au5MDWSB3V8KIkvypkCRpK2woa2aY9HG6Je98SQtZAkoWZaKKo2uW0KetB71f
 3/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=451+tFthAljOAh2f/Wv8bktxEJYp2PVcrpZPPSF00gU=;
 b=Sywt1JPWaM+K3b7+W+1gY2CG4TUH06D3f4XXDz3E/IApO2W3lm7EFOOm7DQ0GyjGyK
 6S9ZqFw/kdxvFVJo5fuz/wOcu2AGhLGZtk93nCtfmzKNG+YyMdkG98yAJnUuJVIx+3zJ
 UHN+lD703Q4EXnYepKF2DIwCC/lKH8SHdeN3X1EewRVB6crctCxbIb5yrOPScgEyFMBR
 GTGECh7fp08XsEUElgb3/Ae0hgdqvD4GL0kwRPYaqMx2w/Sjj2BER2SLhDOMKXqUckLB
 d84u6zfKml4NaDyJ5om5l8sWMbGAwO+17qTM8O9BY9zvlUFiMLY3PLNmqPwusDL+Mkmq
 IjRg==
X-Gm-Message-State: AOAM532MTOBMXUnvzFSM3bbsZzWWIIL9XgCq+wuZwwiE44ZPhHK6J7Vo
 01+E+7YX3vqYoFHPlMMuo10wyg==
X-Google-Smtp-Source: ABdhPJyl+yo4Rcg9YdVIWN89zKVW7RR+cD87UhdD72nTZQCX9fDvi1132hSNPe+g4gHZNLNSZUmFUA==
X-Received: by 2002:a5d:5701:: with SMTP id a1mr20225355wrv.120.1605548046015; 
 Mon, 16 Nov 2020 09:34:06 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k22sm20178562wmi.34.2020.11.16.09.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:34:05 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/42] drm/drm_dp_mst_topology: Remove set but never used
 variable 'len'
Date: Mon, 16 Nov 2020 17:33:17 +0000
Message-Id: <20201116173356.1828478-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173356.1828478-1-lee.jones@linaro.org>
References: <20201116173356.1828478-1-lee.jones@linaro.org>
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
