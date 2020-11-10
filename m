Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4462ADF6B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1900389C05;
	Tue, 10 Nov 2020 19:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2351989BFF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:34 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 10so4353842wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OiQsD+EhT8Lfi4WTa7HEKxexbw01KKvzh7y2CIqIZUI=;
 b=w2cAylpRUwyxpJxnkGOH1jYHVFj+w4ZCRrbjx0+dHVK/k1SkFYcPeOrIv+gyvgruNi
 Y9pmut0MJLCqKVCoxh64xgrnCLtmBui1QC8BuC7C9/SyEufCphx7aeEWfu9jvC3U9III
 ZceExYSW02hI3ANgMEoVc/gxUujRkVafXEX36lKkxEJdphEcj+Nt4JFH1GUruisyFyb+
 29utA9JZezZormWyyDou7bDSGqHFbvgM5R5KhivIJLJ50sK25XDmyMYhwevxCu0Ro86Q
 gL5NDS6YAntMe0J1XRsZ/gdpqa72ODvsBFQ7YoDDIP0oYwu/XnoqidkCr8GBJVcGfCnd
 WUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OiQsD+EhT8Lfi4WTa7HEKxexbw01KKvzh7y2CIqIZUI=;
 b=LMg3w8uAp3mGMIxDbAe6E4A9olo8vbLnsxYMyvhH8VA1NFu9c1QYf586AaCNs/8k4t
 6RTIB5uZqPWaXtwFpfZxSfV8nMVM121ec298c09I9zidd3qnNmT9ZNqjyPjGlssJNOSI
 s5Df6JXsIVxywSvKWeFnIZdKHy9L++WY7tOjXZDsMiA7OYpN8qTfbrFv5jF+r3qQBsxg
 L4lXOm955voKTSvtgPwVqwSGfixYk2ZuSLBYnHhTMU5SnzmhrqTb1gFMXegB9InKU18I
 C4636tV0UWQm1X2ENXaARZbtR0+mOOUREs6VF7mmiBpdAlYwGT+kl7B4JE9JtmN0tJ9X
 Qvow==
X-Gm-Message-State: AOAM532UpkI8u83ghqzsNNeyQQ1+n/wFIj8u1MKhkADa0k/Vr3/A2nUK
 gHdrXZP7EJBCcueDkVT8y4SZkA==
X-Google-Smtp-Source: ABdhPJxCAbP1NBquixJByR3TRuiCtWqX8gVya2e2rBLdVzy1l0jSVoFnzm7ZOkv+OY8g7NTUfw0erw==
X-Received: by 2002:a1c:660b:: with SMTP id a11mr663260wmc.159.1605036692771; 
 Tue, 10 Nov 2020 11:31:32 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/30] drm/radeon/radeon_mn: Supply description for 'cur_seq'
 even if it is unused
Date: Tue, 10 Nov 2020 19:30:55 +0000
Message-Id: <20201110193112.988999-14-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW4uYzo1MTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1l
dGVyIG9yIG1lbWJlciAnY3VyX3NlcScgbm90IGRlc2NyaWJlZCBpbiAncmFkZW9uX21uX2ludmFs
aWRhdGUnCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzog
IkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX21uLmMgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX21uLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9tbi5j
CmluZGV4IDk3YjliNmRkNmRkM2IuLjNjNGM0MjEzYTdiNTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX21uLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fbW4uYwpAQCAtNDEsNiArNDEsNyBAQAogICoKICAqIEBtbjogb3VyIG5vdGlmaWVyCiAg
KiBAcmFuZ2U6IHRoZSBWTUEgdW5kZXIgaW52YWxpZGF0aW9uCisgKiBAY3VyX3NlcTogdW51c2Vk
CiAgKgogICogV2UgYmxvY2sgZm9yIGFsbCBCT3MgYmV0d2VlbiBzdGFydCBhbmQgZW5kIHRvIGJl
IGlkbGUgYW5kCiAgKiB1bm1hcCB0aGVtIGJ5IG1vdmUgdGhlbSBpbnRvIHN5c3RlbSBkb21haW4g
YWdhaW4uCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
