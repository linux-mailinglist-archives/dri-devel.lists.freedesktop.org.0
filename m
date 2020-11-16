Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECB32B4DCA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C696E9FA;
	Mon, 16 Nov 2020 17:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2A26EA17
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d142so41255wmd.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4XjzABzYijzfUYSQAFjSWGgtY8O6T4iGtJT/GdPVe/g=;
 b=f7neOg4p2FtX/vppSn6QN4LztxxWXPO5PsEPG4P1pfWm9ayx4ZaCXP7Qy5MqXIyTJc
 szXloESY6VRWVHOrJFA0WDsNDfNySfQbMAttyoqqqrPShI2NHvwtsWMnnVe90jgsu6/k
 RfOFgRTAgrB9QnazseVDq0C31vlwqKRYp/3Iv9uR/1K+XMNC2FUSHUFAbjWZFBxEqLMJ
 5yM7hZMKGVWVIANE4KarSM+svzza1WdFLdf+b51OHuQcgM4RzIu0shsgULOJyqo5wxmx
 EpGBaE7lPbGEd1xXXmTdM9La82KremeZzH6buoeGQECFzv4wW0EUHa3LjPQsOWRIRaD3
 rhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4XjzABzYijzfUYSQAFjSWGgtY8O6T4iGtJT/GdPVe/g=;
 b=Qq+Wf6fGUq97l4LVBF5exhALCJLLF6FI6y+K1sbb0MRE1o1z1cBUvzDmLNohU5j4oa
 QXWefwTnsVtjVs04M5rbJ2k+puftumyw77Wy7Kp1kt25flKnoqp00a6rnGZIvPutNhcA
 tr+U/0XAh3KVycKHoUxg4SGSaBpZeTHDJ/hF3ls8X7jG0X6P71ADVK88oBnq+Cld8+4Z
 QCazqhtbiTBMPmmH0RKoltIX91PoMfI6nuDCICF9qpe+9LNhAUu91cJi439acp6348Cp
 wayZPE75jH0vtS2/W43xc7bWaWR+VA/1OEzW3y5rDIQwkCju2mnl7rqrmrKyJMDD+6La
 uKZg==
X-Gm-Message-State: AOAM531dD+YwWpJtE2arSiBAu4fT2DlOAAg/wpkv713D2s+82Y8XR8YC
 +DCU7WlDQ8xQA3QrvAkt+LqfRue/dH9eiurk
X-Google-Smtp-Source: ABdhPJxD3PsXkkAcAPwL+o29CIkE9xzELIl6mVYJ526IXOd8g4jWPgod5PLCtsJAgJzqn/4rRNKQ/Q==
X-Received: by 2002:a1c:c20a:: with SMTP id s10mr8267wmf.23.1605548531381;
 Mon, 16 Nov 2020 09:42:11 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:10 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 36/42] drm/v3d/v3d_sched: Demote non-conformant kernel-doc
 header
Date: Mon, 16 Nov 2020 17:41:06 +0000
Message-Id: <20201116174112.1833368-37-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3YzZC92M2Rfc2NoZWQuYzo3NTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAnc2NoZWRfam9iJyBub3QgZGVzY3JpYmVkIGluICd2M2Rfam9iX2RlcGVuZGVu
Y3knCiBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9zY2hlZC5jOjc1OiB3YXJuaW5nOiBGdW5jdGlv
biBwYXJhbWV0ZXIgb3IgbWVtYmVyICdzX2VudGl0eScgbm90IGRlc2NyaWJlZCBpbiAndjNkX2pv
Yl9kZXBlbmRlbmN5JwoKQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+CkNjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogIkNo
cmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6
IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX3NjaGVk
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9zY2hlZC5jIGIvZHJpdmVycy9n
cHUvZHJtL3YzZC92M2Rfc2NoZWQuYwppbmRleCAwNzQ3NjE0YTc4ZjBiLi40NTI2ODJlMjIwOWY0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9zY2hlZC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS92M2QvdjNkX3NjaGVkLmMKQEAgLTYzLDcgKzYzLDcgQEAgdjNkX2pvYl9mcmVl
KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCiAJdjNkX2pvYl9wdXQoam9iKTsKIH0K
IAotLyoqCisvKgogICogUmV0dXJucyB0aGUgZmVuY2VzIHRoYXQgdGhlIGpvYiBkZXBlbmRzIG9u
LCBvbmUgYnkgb25lLgogICoKICAqIElmIHBsYWNlZCBpbiB0aGUgc2NoZWR1bGVyJ3MgLmRlcGVu
ZGVuY3kgbWV0aG9kLCB0aGUgY29ycmVzcG9uZGluZwotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
