Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F422B4DD4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63DC6EA16;
	Mon, 16 Nov 2020 17:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D426EA14
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:15 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l1so19648266wrb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kn9g1kMG5JlU7ctdIXE2LbkwCeCLbWZDScIEWNzvtKI=;
 b=TjXthjttEpmJXsxziQtJEgvptDqsm2IsMdlIZDf2ll+O3GDNYuajE0ftV8lFIdMW20
 sb7gHK7eew5HhS2T8VF1svXf4x6DaTH/qnWItZoXjoCQbfK5zbk/wdMR5+HAloUjJrr4
 PHqMKcXYueDMUUWbuzAxxJ/L0bfnO1NIqAxF0fhT/ycL4/BRJ+ckcIHt2ZvXJyKHIYS3
 UD0PCl6u6AP2alOfvZKLw2BGhLfkN/h0hlD5sTYfOvW2+jmz6mlWKhKUmQgmkEaSa8zH
 sXKFSFkB4u6zAygOG9BZ3+S3GBvWQpluxgeoZarTXAQ9g+epMBQDJWftsEQT7/DT/yAE
 Eicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kn9g1kMG5JlU7ctdIXE2LbkwCeCLbWZDScIEWNzvtKI=;
 b=cFDE6QzkjQgX9w5FJLm7z4i6SJPfZ9rDzITXJocz9OWYRWmy38WSzkW6pncCq8KVAY
 JYibRW+3atoQEbhEzoHQ6izMH1SpJqIdHo7YpG8vHCgf9RI/ckSGrjooUiuhh7IcDbt8
 T254ZtDoh1VtTlZNu5dPIr14/24qhZzu0a9zWUInftbMstWYNBJ3u+HHzyAHaSuNnd2a
 +WXGdfq96s0zsECumn5dklC0D+8ph1uNj0ahcbqhN0k651dDJYnRmjir5cZRWtqWTTk0
 d3cl5IfYhVy0PGNOVdwWzz3zHCjbPE+cvWP/KgSo/iWdxLZ8Ar8bYMi7djW4GF2Cd5dY
 7iHw==
X-Gm-Message-State: AOAM5336NRZVEP6XVhnXZeUdMHLPt0o8NtfhtbAkcy6kON+5nMzCBr3e
 LWTpo18LyAxiEf5tIOEQULoaHw==
X-Google-Smtp-Source: ABdhPJyAXVf2/cgIvwC56rcD5A8G4Ad6Kn2UAK55+eDnXsJvtjSRnX56sS6h1gKA2V+1GziFtMfVWw==
X-Received: by 2002:a5d:4991:: with SMTP id r17mr20913528wrq.70.1605548534067; 
 Mon, 16 Nov 2020 09:42:14 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:13 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 38/42] drm/vc4/vc4_hdmi: Remove set but unused variable 'ret'
Date: Mon, 16 Nov 2020 17:41:08 +0000
Message-Id: <20201116174112.1833368-39-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jOiBJbiBmdW5jdGlvbiDigJh2YzRfaGRtaV9zZXRfYXVk
aW9faW5mb2ZyYW1l4oCZOgogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jOjMzNDo2OiB3
YXJuaW5nOiB2YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0
LXNldC12YXJpYWJsZV0KCkNjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzogTWF4
aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogUGhpbGlw
cCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJr
QGdtYWlsLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9m
Zi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vdmM0L3ZjNF9oZG1pLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hk
bWkuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYwppbmRleCA5NTc3OWQ1MGNjYTBi
Li5iODBlYjlkM2Q5ZDVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1p
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCkBAIC0zMzEsOSArMzMxLDgg
QEAgc3RhdGljIHZvaWQgdmM0X2hkbWlfc2V0X2F1ZGlvX2luZm9mcmFtZShzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXIpCiB7CiAJc3RydWN0IHZjNF9oZG1pICp2YzRfaGRtaSA9IGVuY29kZXJf
dG9fdmM0X2hkbWkoZW5jb2Rlcik7CiAJdW5pb24gaGRtaV9pbmZvZnJhbWUgZnJhbWU7Ci0JaW50
IHJldDsKIAotCXJldCA9IGhkbWlfYXVkaW9faW5mb2ZyYW1lX2luaXQoJmZyYW1lLmF1ZGlvKTsK
KwloZG1pX2F1ZGlvX2luZm9mcmFtZV9pbml0KCZmcmFtZS5hdWRpbyk7CiAKIAlmcmFtZS5hdWRp
by5jb2RpbmdfdHlwZSA9IEhETUlfQVVESU9fQ09ESU5HX1RZUEVfU1RSRUFNOwogCWZyYW1lLmF1
ZGlvLnNhbXBsZV9mcmVxdWVuY3kgPSBIRE1JX0FVRElPX1NBTVBMRV9GUkVRVUVOQ1lfU1RSRUFN
OwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
