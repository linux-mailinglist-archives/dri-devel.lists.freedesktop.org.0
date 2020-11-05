Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60AF2A817D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11C76EDA3;
	Thu,  5 Nov 2020 14:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE276ED9E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:34 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a3so1936492wrx.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rv3e4lR5n3wbFt5a45993iZf/YGmwbWZWnMbXebEIvs=;
 b=XSREkBYK380J4CWNoXmcHRvUSexcxURarBudmCsFRVoIQ5vYDbDJky11tMykMICSa5
 4t9WSt6mx44I9x9YihMhfrnjm70iija84cbYr3L4NqZKBysrWKTcAV2f60BmrUPyFPBc
 uy2UBtjWg1mmBR2rV9UNTmvSNlis678WRkrwrShYsej7hOIa9wV1hL4KdbtQJtzxDpWt
 pdjB5XWNlS0fZTNFXn5zMylPY7TooJTMlFDSFAhcBEEuM3+ByEeXJGnioaHz511LVgxV
 vP5bJbK0TsnoToAaMHJdezPZ7VCMgyK37zQ060GU0rjX/IC+TOsbCJNFnwcMXfS16kho
 26yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rv3e4lR5n3wbFt5a45993iZf/YGmwbWZWnMbXebEIvs=;
 b=ZBGscWX7u3zYfIpgVIVeV+FuVknCRtxLFVRxoA6lg4fx0r/3SdPZKoQbU8pCLUX+Tl
 Z04c2a53pBmPWq0NgpEdkRnuG4HHtepDK1R4DiHfn59KSRCfqiHjhCYgz7Bpn1oVH7QR
 kJDl0zjVFV6Idwowksq08aqGdvDq7KVkPZH3RojbmwnbNkJC1b1MM1gqFJV9Yx+hYkWY
 uLjGzTNwkmwD9oYtj1nugH45AhwDn4qjYBW85sRRw/pxwIG3AvwymVIEcfULB9+W3fTr
 Y1mORpBAoGNFT0nZRDkdMxQG15vjwDjg5h4GDYQuaOoAr3iVL400yDr32pIliuvrKcPP
 y0BA==
X-Gm-Message-State: AOAM531L5xOmhuGvrMRYKGVI6U/Ty8OzQ22UDmNwWx6yN+GdjdFErYZQ
 mv1SmGrDmwZ7A/dYdorLr1nBLQ==
X-Google-Smtp-Source: ABdhPJyRZrB38ZvyOkJUZt6MoLWccltE1b+bbQaqzlHiYSRu4qcXO2ij1vEYl45QgtpeTpFIvxmy+Q==
X-Received: by 2002:adf:fac6:: with SMTP id a6mr3321445wrs.373.1604587953215; 
 Thu, 05 Nov 2020 06:52:33 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/19] gpu: drm: radeon: radeon_drv: Remove unused variable
 'ret'
Date: Thu,  5 Nov 2020 14:45:13 +0000
Message-Id: <20201105144517.1826692-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Gareth Hughes <gareth@valinux.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmM6IEluIGZ1bmN0aW9uIOKAmHJhZGVvbl9wbW9w
c19ydW50aW1lX3N1c3BlbmTigJk6CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYu
Yzo0NTU6Njogd2FybmluZzogdmFyaWFibGUg4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBHYXJldGggSHVnaGVzIDxnYXJldGhAdmFsaW51eC5j
b20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jIHwgMyArLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2Rydi5jCmluZGV4IDY1MDYxYzk0OWFlZWEuLmY1ZjFjYjcwMGQ4NzMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCkBAIC00NTIsNyArNDUyLDYgQEAgc3Rh
dGljIGludCByYWRlb25fcG1vcHNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikK
IHsKIAlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsKIAlzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtX2RldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKLQlpbnQgcmV0OwogCiAJ
aWYgKCFyYWRlb25faXNfcHgoZHJtX2RldikpIHsKIAkJcG1fcnVudGltZV9mb3JiaWQoZGV2KTsK
QEAgLTQ2Miw3ICs0NjEsNyBAQCBzdGF0aWMgaW50IHJhZGVvbl9wbW9wc19ydW50aW1lX3N1c3Bl
bmQoc3RydWN0IGRldmljZSAqZGV2KQogCWRybV9kZXYtPnN3aXRjaF9wb3dlcl9zdGF0ZSA9IERS
TV9TV0lUQ0hfUE9XRVJfQ0hBTkdJTkc7CiAJZHJtX2ttc19oZWxwZXJfcG9sbF9kaXNhYmxlKGRy
bV9kZXYpOwogCi0JcmV0ID0gcmFkZW9uX3N1c3BlbmRfa21zKGRybV9kZXYsIGZhbHNlLCBmYWxz
ZSwgZmFsc2UpOworCXJhZGVvbl9zdXNwZW5kX2ttcyhkcm1fZGV2LCBmYWxzZSwgZmFsc2UsIGZh
bHNlKTsKIAlwY2lfc2F2ZV9zdGF0ZShwZGV2KTsKIAlwY2lfZGlzYWJsZV9kZXZpY2UocGRldik7
CiAJcGNpX2lnbm9yZV9ob3RwbHVnKHBkZXYpOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
