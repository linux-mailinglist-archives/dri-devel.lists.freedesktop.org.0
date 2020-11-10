Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5556C2ADF67
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FD289BF6;
	Tue, 10 Nov 2020 19:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F1E89BF6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:30 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p8so13205286wrx.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BMGz1Go+pEr1OAoO/uoDpgq9jEcR7kKbucOo/rEyug8=;
 b=oRjNGtc4H3+Om+51bGN+MLhDkMLLGJE4P9jCjdCKIl0vqVd9TW09aAjP68FcKpOe2I
 HxP90vSfbxnkJJ6RPe4Tj3qiXJd0s1E3HHlMaNVtDLYm8exe5AfqiCeJdHm9SBer0vJB
 xiVK+DwOIDPZqybrvsBcqJX5B6ANJ5QEM/AoUnIM6pyX9FMbYDuPD/iimPCqRNUX8cbT
 g+4Q+wGcAOdelme77sLR3z8woRPdo1jM//1XQTuSZsGs9gBUcj3W2gVsKohL291vpX9n
 /U9CHZN1HdaoV34HMDyVChxZJ1uDh+aBWSnVp7RAyjuDyxsJFyD/ikfXkF1Q0Ld3gaNy
 PHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BMGz1Go+pEr1OAoO/uoDpgq9jEcR7kKbucOo/rEyug8=;
 b=tLF9F/mWLasu4hI/B5VAqFwPap0pqGZu+x07msom6oznWI1aRBL0SlLKYCAPQIYWuy
 /xQ1VQpjoXxvqy47XDavv/45ln/8mWjM14KO3VAjoqZxIvIJQqMKTgPux1rxSz/0l0ok
 N8SYlWLJUGymZXmzyzD7+nfOgDfB/RtOPBPzYZGQdNq8HI1VRPwG2ZhMM+wPrdSNqK41
 oqsC/o/qr27tcpk4ZZVJwnuBHbPNs2D0dYVRbxvZ4prr4BOD1FwECMW+0qQGCwLzN/Fu
 ztUIo4pq1BVX+yCbTnw2FlwWCHE+OXnR9kpcbAcUHVSzHLEIc7+GOoeD94VSyJbQ4PwS
 r0fQ==
X-Gm-Message-State: AOAM5306wEG3P0mZ84G3XWN4Owy63ZIl26aVq//hbyS0G2O6szw4IDdD
 +TIBIqUGaSQgrKvjCMn1H4W3zw==
X-Google-Smtp-Source: ABdhPJy7fVlERZR/Ulkk2Dh9kfxZcd/f1xzr/nIa9kuZd3t2A5+rQcsAtINaBuuwQNGJ0fH7Ig2oQw==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr863570wru.112.1605036689143; 
 Tue, 10 Nov 2020 11:31:29 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 10/30] drm/radeon/radeon_sync: Add description for function
 param 'rdev'
Date: Tue, 10 Nov 2020 19:30:52 +0000
Message-Id: <20201110193112.988999-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fc3luYy5jOjkyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJh
bWV0ZXIgb3IgbWVtYmVyICdyZGV2JyBub3QgZGVzY3JpYmVkIGluICdyYWRlb25fc3luY19yZXN2
JwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGlu
YXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3N5bmMuYyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fc3luYy5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fc3luYy5jCmlu
ZGV4IDU1Y2M3N2E3M2M3YjcuLjVkMzMwMjk0NTA3NmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX3N5bmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9zeW5jLmMKQEAgLTc5LDYgKzc5LDcgQEAgdm9pZCByYWRlb25fc3luY19mZW5jZShzdHJ1
Y3QgcmFkZW9uX3N5bmMgKnN5bmMsCiAvKioKICAqIHJhZGVvbl9zeW5jX3Jlc3YgLSB1c2UgdGhl
IHNlbWFwaG9yZXMgdG8gc3luYyB0byBhIHJlc2VydmF0aW9uIG9iamVjdAogICoKKyAqIEByZGV2
OiByYWRlb25fZGV2aWNlIHBvaW50ZXIKICAqIEBzeW5jOiBzeW5jIG9iamVjdCB0byBhZGQgZmVu
Y2VzIGZyb20gcmVzZXJ2YXRpb24gb2JqZWN0IHRvCiAgKiBAcmVzdjogcmVzZXJ2YXRpb24gb2Jq
ZWN0IHdpdGggZW1iZWRkZWQgZmVuY2UKICAqIEBzaGFyZWQ6IHRydWUgaWYgd2Ugc2hvdWxkIG9u
bHkgc3luYyB0byB0aGUgZXhjbHVzaXZlIGZlbmNlCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
