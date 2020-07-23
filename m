Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D6B22B251
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 17:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B234F6E211;
	Thu, 23 Jul 2020 15:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C946E237
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 15:17:20 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id b13so2407165edz.7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 08:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ML9BWMSeyPKEmQWQpbLVQ5dNfLfsI97wP2MeiPPSwFE=;
 b=XDpALXf2OPSqod1DYXvUJxDPph9lfg9M+3bEn6SbPC3S9E1FAWYmsJwLbO7DWjTjd3
 5rQuRCo3rWwBEBMXbc2uwWPefOQG3h3OKMd1aiHYSipdDkBv+h4BME2eiJ62sBPKr8zo
 n4h3IVwG7LyhG6PpGHCg/+4EBCNMiLi4QR5GFxesCWNjMW2HnltOFov1JoD5UBm/DqK5
 z6yL6EqXpCLOiFoqpvniHkkj3DUHlOxo72l2eHqwPYAOmvqxdpVktDyJlXlqHqW1FWE1
 UgCxj81JeZ6io5LFGRUoFjdpt/LGpshqqlhQ421oq0tm4bEsiZ/0Tv4afIj1rZGEvaCm
 IEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ML9BWMSeyPKEmQWQpbLVQ5dNfLfsI97wP2MeiPPSwFE=;
 b=ORVCd6+I4VC2A5Q2yMaSmPsUbZe1bRwuE73sd1yhijQU1pagl7chVmv44JQS6z0oMU
 NiuPpe1yYUG9O+9kkz+XGwLGRk4iIsidrpMdXm41xdl2JvQKtFx7YEnfwN5MVUKjyqhY
 TMuyMZqRD29iXqwjjahBksuDbNXqslbdnN7CBfUNU6wbmYW1nCaWFjiVy7Uf0b9SCp9q
 C2yDoENsLcS2iGL3rgLIJdt795NS9SNg3LRKYzsl+IUDt/6W9E6wtW23ehXDCbM86TxL
 aFxzVx7FP6nMaXW8af9JhBX2TYNFkOGYUr3PFLxH3Apq1XBEZR2VgHKnOayQVOSyFHAa
 H3ZA==
X-Gm-Message-State: AOAM5314UhIppp8isc6YYUxjltXb1nYqxeouM/S9PbbA0Xkc8WMF5oq6
 QDMvOWtt/ccyelxCOuCyrfqKGwr8
X-Google-Smtp-Source: ABdhPJwGOjarBy22Grf7fik2eCRGuAkNMMUKeUBb6iE6Of7q7BeH5HLiDm1X96F01f0/PyawCDt3mA==
X-Received: by 2002:aa7:c24d:: with SMTP id y13mr4799619edo.123.1595517438849; 
 Thu, 23 Jul 2020 08:17:18 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4ca2:7494:c4d6:51a4])
 by smtp.gmail.com with ESMTPSA id q6sm2239197ejn.30.2020.07.23.08.17.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 08:17:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/qxl: stop implementing init_mem_type
Date: Thu, 23 Jul 2020 17:17:08 +0200
Message-Id: <20200723151710.3591-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723151710.3591-1-christian.koenig@amd.com>
References: <20200723151710.3591-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBqdXN0IGluaXRpYWxpemUgdGhlIG1lbW9yeSB0eXBlIHBhcmFtZXRlcnMKYmVmb3Jl
IGNhbGxpbmcgdHRtX2JvX2luaXRfbW0uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
dHRtLmMgfCAzNSArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRt
LmMKaW5kZXggYWJiOWZhNGQ4MGNmLi44NTIwODlkN2Y3ODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9xeGwvcXhsX3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5j
CkBAIC01MSwyMSArNTEsNiBAQCBzdGF0aWMgc3RydWN0IHF4bF9kZXZpY2UgKnF4bF9nZXRfcWRl
dihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikKIHN0YXRpYyBpbnQgcXhsX2luaXRfbWVtX3R5
cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCiAJCQkgICAgIHN0
cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuKQogewotCXN3aXRjaCAodHlwZSkgewotCWNh
c2UgVFRNX1BMX1NZU1RFTToKLQkJLyogU3lzdGVtIG1lbW9yeSAqLwotCQlicmVhazsKLQljYXNl
IFRUTV9QTF9WUkFNOgotCWNhc2UgVFRNX1BMX1BSSVY6Ci0JCS8qICJPbi1jYXJkIiB2aWRlbyBy
YW0gKi8KLQkJbWFuLT5mdW5jID0gJnR0bV9ib19tYW5hZ2VyX2Z1bmM7Ci0JCW1hbi0+YXZhaWxh
YmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5HOwotCQltYW4tPmRlZmF1bHRfY2FjaGlu
ZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKLQkJYnJlYWs7Ci0JZGVmYXVsdDoKLQkJRFJNX0VSUk9S
KCJVbnN1cHBvcnRlZCBtZW1vcnkgdHlwZSAldVxuIiwgKHVuc2lnbmVkIGludCl0eXBlKTsKLQkJ
cmV0dXJuIC1FSU5WQUw7Ci0JfQogCXJldHVybiAwOwogfQogCkBAIC0yMzgsNiArMjIzLDE5IEBA
IHN0YXRpYyBzdHJ1Y3QgdHRtX2JvX2RyaXZlciBxeGxfYm9fZHJpdmVyID0gewogCS5tb3ZlX25v
dGlmeSA9ICZxeGxfYm9fbW92ZV9ub3RpZnksCiB9OwogCitzdGF0aWMgaW50IHF4bF90dG1faW5p
dF9tZW1fdHlwZShzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwKKwkJCQkgdW5zaWduZWQgaW50IHR5
cGUsCisJCQkJIHVpbnQ2NF90IHNpemUpCit7CisJc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2Vy
ICptYW4gPSAmcWRldi0+bW1hbi5iZGV2Lm1hblt0eXBlXTsKKworCW1hbi0+ZnVuYyA9ICZ0dG1f
Ym9fbWFuYWdlcl9mdW5jOworCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19D
QUNISU5HOworCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOworCisJ
cmV0dXJuIHR0bV9ib19pbml0X21tKCZxZGV2LT5tbWFuLmJkZXYsIHR5cGUsIHNpemUpOworfQor
CiBpbnQgcXhsX3R0bV9pbml0KHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2KQogewogCWludCByOwpA
QCAtMjU1LDE0ICsyNTMsMTMgQEAgaW50IHF4bF90dG1faW5pdChzdHJ1Y3QgcXhsX2RldmljZSAq
cWRldikKIAl9CiAJLyogTk9URTogdGhpcyBpbmNsdWRlcyB0aGUgZnJhbWVidWZmZXIgKGFrYSBz
dXJmYWNlIDApICovCiAJbnVtX2lvX3BhZ2VzID0gcWRldi0+cm9tLT5yYW1faGVhZGVyX29mZnNl
dCAvIFBBR0VfU0laRTsKLQlyID0gdHRtX2JvX2luaXRfbW0oJnFkZXYtPm1tYW4uYmRldiwgVFRN
X1BMX1ZSQU0sCi0JCQkgICBudW1faW9fcGFnZXMpOworCXIgPSBxeGxfdHRtX2luaXRfbWVtX3R5
cGUocWRldiwgVFRNX1BMX1ZSQU0sIG51bV9pb19wYWdlcyk7CiAJaWYgKHIpIHsKIAkJRFJNX0VS
Uk9SKCJGYWlsZWQgaW5pdGlhbGl6aW5nIFZSQU0gaGVhcC5cbiIpOwogCQlyZXR1cm4gcjsKIAl9
Ci0JciA9IHR0bV9ib19pbml0X21tKCZxZGV2LT5tbWFuLmJkZXYsIFRUTV9QTF9QUklWLAotCQkJ
ICAgcWRldi0+c3VyZmFjZXJhbV9zaXplIC8gUEFHRV9TSVpFKTsKKwlyID0gcXhsX3R0bV9pbml0
X21lbV90eXBlKHFkZXYsIFRUTV9QTF9QUklWLAorCQkJCSAgcWRldi0+c3VyZmFjZXJhbV9zaXpl
IC8gUEFHRV9TSVpFKTsKIAlpZiAocikgewogCQlEUk1fRVJST1IoIkZhaWxlZCBpbml0aWFsaXpp
bmcgU3VyZmFjZXMgaGVhcC5cbiIpOwogCQlyZXR1cm4gcjsKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
