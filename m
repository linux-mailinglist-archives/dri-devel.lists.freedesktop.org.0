Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FBD2F83B8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549906E4F8;
	Fri, 15 Jan 2021 18:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C486E4EA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d26so10195650wrb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ouoNyIGf3M12ncW8jNmga8ZhB/umTlAexno2+hm9vw=;
 b=PN4ofpG3AFQIY2HDhtrxDHd3v0+xd4onwEz7G2/zC+rhfE4HirmzmL3jcXLpUYXBOi
 1hKzvGAxrSr6Dv8cDtBOLdA7LW3HUMbsDnWopgDjwrGvgzeyJHyJwJWkktXJjDTKYn5x
 6sdobPOvJJIR/TrcLU+En4Nb4Sqr3ym2MpFPjZERoM0EqXn73uEydbCIdma4dh+mEVpS
 9T/msFV3PGGbNj49yLhdVehCCKoHHScJgdSAS89oR4U37UhK/tfSoY4zcAxgsB3IEg6M
 gagHknlc1GH0nljzwa8FvQWUO/kBx3xMgu49tE3RqzKT+TqiG4u92puwvRgzcDEP2/vs
 8tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ouoNyIGf3M12ncW8jNmga8ZhB/umTlAexno2+hm9vw=;
 b=DSL/K8PFZL/GPb5564koOZ4fBpZpIoRMj55QqmyJifpRtmqFLsaO3IXGdtc3K4R3uf
 zb7qTDTq2cDrfW8pQxlzkJzFQmDbJTHCOIWy/zjxcrr2FAv4QIPM5YvJn7vgvACtcas4
 JJcMyii4bYz8gVmaFUXYzlTdr0ZKf592FL23MFGsTwf0bgBmD2E7p3/L08xJfxfSQ1ik
 MNQ1zjHE+SqHyM4ZNX0oZwyxY6PHLOpp17DWIdWpcWZidFbhXjHJyhJ3gM2vmR90vwP7
 sEjy+gIUgqlcu2Dc3Q8XxQjCsHCQ5fCGCSRbZpZqhSdizDbBxDYwEgIGPvRYj2rqTcxt
 UD7A==
X-Gm-Message-State: AOAM5309pz9QfWwDy9xla0afAfN0M3BDweG86gbxfmASvsCN+2vDWMmR
 R6arurGgMnnWQFlhV3jTzKH7CQ==
X-Google-Smtp-Source: ABdhPJypPfWiZJEwtJ8E9isJbQjNIe0ev/rxFYQX2OcbRtBc5hQl2j1aWEaiYzfS5p/hRAPbYrpcgA==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr10087109wrp.172.1610734606342; 
 Fri, 15 Jan 2021 10:16:46 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 29/29] drm/vmwgfx/ttm_object: Reorder header to immediately
 precede its struct
Date: Fri, 15 Jan 2021 18:16:01 +0000
Message-Id: <20210115181601.3432599-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Dave Airlie <airlied@redhat.com>, Rob Clark <rob.clark@linaro.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxzbyBhZGQgbWlzc2luZyBkZXNjcmlwdGlvbiBmb3IgJ3JlZmNvdW50JwoKRml4ZXMgdGhlIGZv
bGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC90dG1fb2JqZWN0LmM6NjA6IGVycm9yOiBDYW5ub3QgcGFyc2Ugc3RydWN0IG9yIHVuaW9u
IQoKQ2M6IFZNd2FyZSBHcmFwaGljcyA8bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUu
Y29tPgpDYzogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2FyZS5jb20+CkNjOiBaYWNr
IFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2Fs
IDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4K
Q2M6IFJvYiBDbGFyayA8cm9iLmNsYXJrQGxpbmFyby5vcmc+CkNjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFy
by1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdHRtX29iamVjdC5j
IHwgMTkgKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC90
dG1fb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmplY3QuYwppbmRleCBi
M2ZkYzYzMDQ5N2NiLi4xMTIzOTRkZDBhYjZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3R0bV9vYmplY3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmpl
Y3QuYwpAQCAtNDIsNiArNDIsMTQgQEAKICAqLwogCiAKKyNkZWZpbmUgcHJfZm10KGZtdCkgIltU
VE1dICIgZm10CisKKyNpbmNsdWRlIDxsaW51eC9saXN0Lmg+CisjaW5jbHVkZSA8bGludXgvc3Bp
bmxvY2suaD4KKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisjaW5jbHVkZSA8bGludXgvYXRvbWlj
Lmg+CisjaW5jbHVkZSAidHRtX29iamVjdC5oIgorCiAvKioKICAqIHN0cnVjdCB0dG1fb2JqZWN0
X2ZpbGUKICAqCkBAIC01NSwxNiArNjMsOSBAQAogICoKICAqIEByZWZfaGFzaDogSGFzaCB0YWJs
ZXMgb2YgcmVmIG9iamVjdHMsIG9uZSBwZXIgdHRtX3JlZl90eXBlLAogICogZm9yIGZhc3QgbG9v
a3VwIG9mIHJlZiBvYmplY3RzIGdpdmVuIGEgYmFzZSBvYmplY3QuCisgKgorICogQHJlZmNvdW50
OiByZWZlcmVuY2UvdXNhZ2UgY291bnQKICAqLwotCi0jZGVmaW5lIHByX2ZtdChmbXQpICJbVFRN
XSAiIGZtdAotCi0jaW5jbHVkZSA8bGludXgvbGlzdC5oPgotI2luY2x1ZGUgPGxpbnV4L3NwaW5s
b2NrLmg+Ci0jaW5jbHVkZSA8bGludXgvc2xhYi5oPgotI2luY2x1ZGUgPGxpbnV4L2F0b21pYy5o
PgotI2luY2x1ZGUgInR0bV9vYmplY3QuaCIKLQogc3RydWN0IHR0bV9vYmplY3RfZmlsZSB7CiAJ
c3RydWN0IHR0bV9vYmplY3RfZGV2aWNlICp0ZGV2OwogCXNwaW5sb2NrX3QgbG9jazsKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
