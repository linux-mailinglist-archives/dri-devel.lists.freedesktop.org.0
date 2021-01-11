Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BD92F1EE6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7BA89EBD;
	Mon, 11 Jan 2021 19:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A2B89E59
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:20:00 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id r4so278761wmh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lOMcvHupoNOe/LWOcIRzth9mgUcklXf22W184Qe4k/0=;
 b=jINxIN2J/6RKcOAL6kDcJF+Mgaxi1T5CpE5VbihyBJ33bI6YWqCr6mAuwzxGwkhsv5
 FVpFw3s+rEwrmOhwZRHxpQwCVJ6CKW4KhXS9inF7U76wq9C00wDaxmKMxpK5qIBgTkOR
 FAk3+eWlt4HKHYXNAUJOtRX0vXVfoGo8yZ9RjBe0UK1n5NYW1e7fJa1hkrwj1qb4TxaB
 WvJ7fmUEe7ofzUqDXvT+2Ldjcdkr2T2ythHyQPLeHDGT/1ngjh+zs01UCY/eu0y3FWOl
 XyWRj0QAOjh8kxv/klpi4IxXJQ0w3ChZ1znaBUXCwhPw4n1LidqzJ0GXUJR/zctFuNzc
 yIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lOMcvHupoNOe/LWOcIRzth9mgUcklXf22W184Qe4k/0=;
 b=KgfkFL7rDTILjt3UhjlE3A5QQho2Q3jJXy7Mrm7DfePPRUPRZwfVrYFVaSwM3DADE6
 9rnQyYZpBuLdaKqWwk2/gBvgUIP+/znX4qOMTOIZOpZb+PLyCWuMKovJaynx2VAaxegf
 jdlh8oHR4K6J0LYkqVxBCvI4EV3jXybjsu8Dwb8hRh/jMw7HyolDB3ENuBy+o48yqqNA
 i+JB92rMNpb2ASnxrnOzfrjKTwN9YgDvnNDTiLreH7qUu9pZZr/vVntMQ1+Qj/qpVJDB
 372A/GzaS6KdioTtP+hVOCLBn+gMV42hfPTZSJeoaQkXUjJqaAmQh5dkGPM9sj9V4hPV
 0sOA==
X-Gm-Message-State: AOAM533dFRO+j0oXJfmwRaayOcmhl6aBMyleJyArZ6BOJklHmAEey9rM
 gBQ1UcNPH/+uVqNtFKm3YoHIWQ==
X-Google-Smtp-Source: ABdhPJzC8kJim0Asdl/jHsMlAY9hTdXgq0nqdS4y/wlPdTiNiOUqq/xEWH3/kje9AOnGdPdj84Nb6Q==
X-Received: by 2002:a05:600c:4ed0:: with SMTP id
 g16mr280323wmq.176.1610392799259; 
 Mon, 11 Jan 2021 11:19:59 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:58 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/40] drm/amd/display/dc/dce110/dce110_hw_sequencer: Demote
 non-conformant kernel-doc header
Date: Mon, 11 Jan 2021 19:19:08 +0000
Message-Id: <20210111191926.3688443-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVl
bmNlci5jOjE2Mzk6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2RjJyBu
b3QgZGVzY3JpYmVkIGluICdkY2UxMTBfZW5hYmxlX2FjY2VsZXJhdGVkX21vZGUnCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVu
Y2VyLmM6MTYzOTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnY29udGV4
dCcgbm90IGRlc2NyaWJlZCBpbiAnZGNlMTEwX2VuYWJsZV9hY2NlbGVyYXRlZF9tb2RlJwoKQ2M6
IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5w
ZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEx
MC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jCmluZGV4IDRjMjMwZjFk
ZTlhMzAuLmM1NzQwNWZhNGJlYmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jCkBAIC0xNjI4LDcg
KzE2MjgsNyBAQCBzdGF0aWMgc3RydWN0IGRjX2xpbmsgKmdldF9lZHBfbGlua193aXRoX3Npbmso
CiAJcmV0dXJuIGxpbms7CiB9CiAKLS8qKgorLyoKICAqIFdoZW4gQVNJQyBnb2VzIGZyb20gVkJJ
T1MvVkdBIG1vZGUgdG8gZHJpdmVyL2FjY2VsZXJhdGVkIG1vZGUgd2UgbmVlZDoKICAqICAxLiBQ
b3dlciBkb3duIGFsbCBEQyBIVyBibG9ja3MKICAqICAyLiBEaXNhYmxlIFZHQSBlbmdpbmUgb24g
YWxsIGNvbnRyb2xsZXJzCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
