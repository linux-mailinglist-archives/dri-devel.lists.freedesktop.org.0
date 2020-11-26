Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB962C560E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1476F6E95C;
	Thu, 26 Nov 2020 13:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D2D6E957
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:42:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p8so2191866wrx.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JRGzsr7E+IJLlqxa5D+IrFAdZhiFdGYpEedhVyk6GiY=;
 b=npJUR/DbxvX22PhhvsddHD3XwoyyDVf+g0XRN8KgbhT11qHmB4zphgQBWSBHNqNjr/
 8Vo0vv65NfZ9JCW8L/2SMi1OI6FMPbNOzBTW/o/VfmojKflzjEGWCqSYTC7rPf98wwMv
 mSK7VJ0LcB9+AQPMEzZtIq1VLY8QK6X9GkV8LJGK+XMVPn3+lE2rsA/0S10wsQww0dax
 gOzL2JHYgBqZPD72m+1EvomBH7ybMYA10Bci7AkXEShO9cuvmxBL+VMQn7rB6Nholahm
 0H7D+pNpH/VIKwt5Lzsklllify4PiA1rjNC+VV0Q6JzUxkKrm3UyRNkoGvpwqigXwObt
 QsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JRGzsr7E+IJLlqxa5D+IrFAdZhiFdGYpEedhVyk6GiY=;
 b=VvNgNqXWH/SB7qd/WjtLt/2y78yoMw7/NX6ZI+9e4lLs/9YZZKpH9MEMtaLnSLhDnw
 kqYZbE35OCJL4b4b6lddbZBroCJb3vbxrHW8rrpUhMe9uYDjMa5J+8vKDQ/6D1EOMK1f
 ulfRTxEuaa3W5nlRqQCeWdMjx8jYwT9LalPCMKQ8DlCE9pVuWHPhYzFh8l5IG7RMOJm+
 K+Uiy+e34W+JgsBxCM5mffk/Ui25swuguwXIoLoZyZJn6n7OYQ0rVklMaYVApBRrL6NT
 TArtF0pcXmzHoiUiBajcVMRtPDCzrdgZKPaHvPO+DsMJoD/Qah5/jr0h07m5AdXJz6VY
 RZEw==
X-Gm-Message-State: AOAM532Pghq9ObQtDSjsW4iXyVmGpmS6lBgme+69uV8LG6K3Mpwgl/ka
 sLQFlRMJdd9KYRuLtJ9d+S78Fw==
X-Google-Smtp-Source: ABdhPJwo3+FQc6tpgfzfYae15R5ZY9ynnRvbHNRXmcN7/sg1nZfCyc5IUVsESXdGkNqsUW9sg2Vo8g==
X-Received: by 2002:a5d:4408:: with SMTP id z8mr4111560wrq.204.1606398174228; 
 Thu, 26 Nov 2020 05:42:54 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:42:53 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/40] drm/amd/pm/powerplay/smumgr/smu9_smumgr: Include our
 own header containing our prototypes
Date: Thu, 26 Nov 2020 13:42:06 +0000
Message-Id: <20201126134240.3214176-7-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci9zbXU5X3NtdW1nci5j
OjM4OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYc211OV9pc19zbWNf
cmFtX3J1bm5pbmfigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci9zbXU5X3NtdW1nci5jOjExMjo1OiB3YXJu
aW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHNtdTlfc2VuZF9tc2dfdG9fc21j4oCZ
IFstV21pc3NpbmctcHJvdG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bt
L3Bvd2VycGxheS9zbXVtZ3Ivc211OV9zbXVtZ3IuYzoxNDA6NTogd2FybmluZzogbm8gcHJldmlv
dXMgcHJvdG90eXBlIGZvciDigJhzbXU5X3NlbmRfbXNnX3RvX3NtY193aXRoX3BhcmFtZXRlcuKA
mSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9w
bS9wb3dlcnBsYXkvc211bWdyL3NtdTlfc211bWdyLmM6MTY1OjEwOiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmHNtdTlfZ2V0X2FyZ3VtZW504oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KCkNjOiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9zbXU5X3NtdW1nci5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3BtL3Bvd2VycGxheS9zbXVtZ3Ivc211OV9zbXVtZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG0vcG93ZXJwbGF5L3NtdW1nci9zbXU5X3NtdW1nci5jCmluZGV4IDhhOWFlZTg1MDQzZWMu
LjIzZTVkZTNjNGVjMTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJw
bGF5L3NtdW1nci9zbXU5X3NtdW1nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93
ZXJwbGF5L3NtdW1nci9zbXU5X3NtdW1nci5jCkBAIC0yMiw2ICsyMiw3IEBACiAgKi8KIAogI2lu
Y2x1ZGUgInNtdW1nci5oIgorI2luY2x1ZGUgInNtdTlfc211bWdyLmgiCiAjaW5jbHVkZSAidmVn
YTEwX2luYy5oIgogI2luY2x1ZGUgInNvYzE1X2NvbW1vbi5oIgogI2luY2x1ZGUgInBwX2RlYnVn
LmgiCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
