Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2412C5605
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F476E954;
	Thu, 26 Nov 2020 13:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A296E954
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:42:49 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p22so2193666wmg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L9lgGUDlM7py1bAmh0K2ReeB9Skou96C92LhLu83qxQ=;
 b=DCQv/x0DIszjvscBb36cxqtG1a0DErbfJW+KXTrIqfTU1euX2kddV9clliTxjLQ4QX
 CD9TG8I+DosTGJG8D8N6ITX1PgUIu1NNdKrtsutaSvoyePqg8JbRQtVEY/dT/ovpu65t
 m6Wn/oUGmKqJn4umqIpSlSHZNCi07Aw+LXEtTQ0R/XvZGz+K80m0H6JehoZQ7H3Ucckl
 FT3aGJnooxLNS+dmiqnxCC9awsK0OogkN/9pXro1UI8E6Pn7I/o4YH9Iy3wDxEApnVcF
 5tCKExUMh1kXY3VsC5me7/hwHWsKOBNMPrbQVb25mW4mrCOcKmyvOHf9poBgNzBY0Orr
 HE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L9lgGUDlM7py1bAmh0K2ReeB9Skou96C92LhLu83qxQ=;
 b=H0tiFjHEjEThrdtn5+Df2Wo2ZmGSEplLWJZXck6KcLXnOYQgggtgDGmYkEVnjBPGNB
 +IoizXhQjn8/ggn/kBT4RRm0CIEdGOrT9Vcs4VC4yaV7itcu8djulRwAuJW5m+CDKOFs
 1z5JzJzd/8PAT2OrguhM91nf+/9xRccTupmNIMFbkU2b6IjfSeBwxN3CljpeoUbH43/H
 vjQTe/eFWCkX9CWdaXSSKrruA4c+Is11qoOsA13jSgdm49RQWLMUupnpgdX1r0GOnFhZ
 LQNruEI2R+/IFW8jFRiqaWyQyCjjbhZ9Eg+aKU1I6Cye07aEFp/QBcO7kEFHme+Ma7nB
 QP3Q==
X-Gm-Message-State: AOAM530ahs6yhEP5eJoxbHxPwzxjB0GlVao6g4jiQE9IkSj5NsDjdOoK
 W6iedXAQK/xgfWYf0XIiqSfJdQ==
X-Google-Smtp-Source: ABdhPJzvwkDW0s2vxiNf5+aK/oS+gcALiJrv7eq8sae3U4oQh/q0CF/GyjEm5e+T0OwBp2um+s9Ugg==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr3526378wmj.69.1606398168126; 
 Thu, 26 Nov 2020 05:42:48 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:42:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/40] drm/amd/pm/powerplay/smumgr/ci_smumgr: Remove set but
 unused variable 'res'
Date: Thu, 26 Nov 2020 13:42:03 +0000
Message-Id: <20201126134240.3214176-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
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
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci9jaV9zbXVtZ3IuYzog
SW4gZnVuY3Rpb24g4oCYY2lfdGhlcm1hbF9zZXR1cF9mYW5fdGFibGXigJk6CiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvc211bWdyL2NpX3NtdW1nci5jOjIxMzI6
Njogd2FybmluZzogdmFyaWFibGUg4oCYcmVz4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4g
S8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvY2lfc211bWdyLmMgfCAz
ICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9jaV9zbXVt
Z3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9jaV9zbXVtZ3Iu
YwppbmRleCAzMjliZjRkNDRiYmNlLi5jMWQ4NjliNGM3YTQyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvY2lfc211bWdyLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL2NpX3NtdW1nci5jCkBAIC0yMTI5LDcg
KzIxMjksNiBAQCBzdGF0aWMgaW50IGNpX3RoZXJtYWxfc2V0dXBfZmFuX3RhYmxlKHN0cnVjdCBw
cF9od21nciAqaHdtZ3IpCiAJdWludDMyX3QgdF9kaWZmMSwgdF9kaWZmMiwgcHdtX2RpZmYxLCBw
d21fZGlmZjI7CiAJdWludDE2X3QgZmRvX21pbiwgc2xvcGUxLCBzbG9wZTI7CiAJdWludDMyX3Qg
cmVmZXJlbmNlX2Nsb2NrOwotCWludCByZXM7CiAJdWludDY0X3QgdG1wNjQ7CiAKIAlpZiAoIXBo
bV9jYXBfZW5hYmxlZChod21nci0+cGxhdGZvcm1fZGVzY3JpcHRvci5wbGF0Zm9ybUNhcHMsIFBI
TV9QbGF0Zm9ybUNhcHNfTWljcm9jb2RlRmFuQ29udHJvbCkpCkBAIC0yMTkxLDcgKzIxOTAsNyBA
QCBzdGF0aWMgaW50IGNpX3RoZXJtYWxfc2V0dXBfZmFuX3RhYmxlKHN0cnVjdCBwcF9od21nciAq
aHdtZ3IpCiAKIAlmYW5fdGFibGUuVGVtcFNyYyA9ICh1aW50OF90KVBITV9SRUFEX1ZGUEZfSU5E
SVJFQ1RfRklFTEQoaHdtZ3ItPmRldmljZSwgQ0dTX0lORF9SRUdfX1NNQywgQ0dfTVVMVF9USEVS
TUFMX0NUUkwsIFRFTVBfU0VMKTsKIAotCXJlcyA9IGNpX2NvcHlfYnl0ZXNfdG9fc21jKGh3bWdy
LCBjaV9kYXRhLT5mYW5fdGFibGVfc3RhcnQsICh1aW50OF90ICopJmZhbl90YWJsZSwgKHVpbnQz
Ml90KXNpemVvZihmYW5fdGFibGUpLCBTTUNfUkFNX0VORCk7CisJY2lfY29weV9ieXRlc190b19z
bWMoaHdtZ3IsIGNpX2RhdGEtPmZhbl90YWJsZV9zdGFydCwgKHVpbnQ4X3QgKikmZmFuX3RhYmxl
LCAodWludDMyX3Qpc2l6ZW9mKGZhbl90YWJsZSksIFNNQ19SQU1fRU5EKTsKIAogCXJldHVybiAw
OwogfQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
