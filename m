Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCD32B4D3A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87866E061;
	Mon, 16 Nov 2020 17:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFABC6E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:40 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a3so11009wmb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5TTguyaQuVrd+USo/F+rMhw06NLnXmuljJDk3k933AM=;
 b=WRLJ1q4UqmT47CdbxnEAngUmUOahyGqrN/s44SVmCRGE6+Btb4XOge97Tzm/ASOQvQ
 kHutEnIMP6rdOJgwGTAuB09lr/dhhN/C9SIIs5MrfN7Hw1/lT9c19lWAECUjdPa/KzFp
 9WRrW4r8nRawZqPNQclJS4KzH2uIjbHP4ys9TnqtcZPjX+SZRjt1oNPvWGWb6WeY5OHz
 3GnCQNaU27a0kw0JU1LPD5VPe/xWhnp19+XdWN77fMIVozxsf5337JKUQThHXJ5HuR7d
 8pR0Uwf6UbEh1hBKF0a3CAPdBv/gWuvcX04dnPdYdSsvHxCMg2WVTP6jTa433VpmMBi9
 8DVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5TTguyaQuVrd+USo/F+rMhw06NLnXmuljJDk3k933AM=;
 b=OxuW0bEluRYIPb2XAeFqOVyr73MGMHa3k2kwwQh6B7b9RKD3cnpT4tEgVzGQZQa3U5
 piIqqIIb1oymeP/U0z9BPY711uedRnwyTKrGVk+HoDUK3JWZez/eq7KwfEj2/NukRNh+
 FPRBFLokaF+39DD4JCOhmEvOPjjNrJsSNy58N8PxELiENVuRITuiHxhRUR5DATfnou3n
 idPwTQDY5hXg9NypGVOKsCE/+oCB6yUG1rc5k2j9dJbNhuKNCyHE8ziSvDxqkab5vaYC
 o//grKKn9jhE97KRTWgz5NlY04tXwfxiw099Hoijvh/b9iKL4AsLN22m/FhjbDMvcsRG
 99MQ==
X-Gm-Message-State: AOAM533MFXuB/OW5k/NWyIbTx9gQSO2hd2cHK+Fk3w9nuwoklgnOllqA
 vfAvaZZAxaDu5IyHOOAkZI7ELw==
X-Google-Smtp-Source: ABdhPJw0MoOwO876rhqimSbMBMXrkpTGHAmxxSzdJkaUcBzp1n6ZUGdVjsQTISfCOxCG5I7moeivOA==
X-Received: by 2002:a1c:c203:: with SMTP id s3mr16952678wmf.77.1605548259534; 
 Mon, 16 Nov 2020 09:37:39 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:38 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/43] drm/radeon/ni_dma: Move
 'cayman_gpu_check_soft_reset()'s prototype to shared header
Date: Mon, 16 Nov 2020 17:36:42 +0000
Message-Id: <20201116173700.1830487-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9uaS5jOjE3MzM6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciDigJhjYXltYW5fZ3B1X2NoZWNrX3NvZnRfcmVzZXTigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQogMTczMyB8IHUzMiBjYXltYW5fZ3B1X2NoZWNrX3NvZnRfcmVzZXQoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpCiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmggICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL25pX2RtYS5jIHwgMyArLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vbmkuaCBi
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vbmkuaAppbmRleCBkNjNiZTFjODhjMGYxLi45YTVmMzFh
MDVlNjhmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9uaS5oCkBAIC0zNCw1ICszNCw2IEBAIHZvaWQgY2F5bWFuX2Nw
X2ludF9jbnRsX3NldHVwKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAogCQkJICAgICAgaW50
IHJpbmcsIHUzMiBjcF9pbnRfY250bCk7CiB2b2lkIGNheW1hbl92bV9kZWNvZGVfZmF1bHQoc3Ry
dWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCiAJCQkgICAgdTMyIHN0YXR1cywgdTMyIGFkZHIpOwor
dTMyIGNheW1hbl9ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
dik7CiAKICNlbmRpZgkJCQkvKiBfX05JX0hfXyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9uaV9kbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vbmlfZG1hLmMKaW5k
ZXggYzU2MTM2ODQ4MzYwZS4uYmQ1MTVhZDRmZTRjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9uaV9kbWEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pX2RtYS5j
CkBAIC0yNSwxMCArMjUsOSBAQAogI2luY2x1ZGUgInJhZGVvbi5oIgogI2luY2x1ZGUgInJhZGVv
bl9hc2ljLmgiCiAjaW5jbHVkZSAicmFkZW9uX3RyYWNlLmgiCisjaW5jbHVkZSAibmkuaCIKICNp
bmNsdWRlICJuaWQuaCIKIAotdTMyIGNheW1hbl9ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmRldik7Ci0KIC8qCiAgKiBETUEKICAqIFN0YXJ0aW5nIHdpdGggUjYw
MCwgdGhlIEdQVSBoYXMgYW4gYXN5bmNocm9ub3VzCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
