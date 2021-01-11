Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A162F1ED4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45E989DD3;
	Mon, 11 Jan 2021 19:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3A489DC7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:34 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id c124so232575wma.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GBLSZTPS8qk7rY11VgJobcJSdYVa2Sl7IRQcchF4a+M=;
 b=uEgsGHtL1R1LmYWVtAlgWHzqWKe0ZR0/dvXOMx1Xo/D9OSPyNzU/zd67KNHNnXjLmU
 8O0UZGjC0CM0GHTEdGIku+WcS9c1+U5hUQSbQuQUPCxycEj3Myn+Vs38kxAq1kgCAhiD
 VHVhw7sfXF+XNDVKGVTfRfCJmDgZXho3+G9/t3Z7M4qXJ4jEQ+ubQ/OLOMiwLn9dyARp
 55Q/M5kPLPxlEbf1QZHnHJahZKiI92+p4ljKzbsWOgE4e9Rh2sf9R4dq+1nO/Uoa1zrF
 i6zsr74q+nNxm7ILEhqR/DZrAjHLJXfqnTtzjMiUPSvBGYEUMzxoclZAbim4ZL55781t
 C4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GBLSZTPS8qk7rY11VgJobcJSdYVa2Sl7IRQcchF4a+M=;
 b=rRqLIcYUq9pgCX+/whJ5aKKde2TA+W+OVp10raiKlyxDolJam9X4WfMklNI+IgBCes
 iQlxTXDc6nLz5M6ZDL26J1vm/Rhubra/kN/0DOKQP6hWayrXRQMN1QEEx+qiMeb9kaKK
 kf9cFghgUJbJXhHEHclZuLNgjmMLtoAYb2gPV6rHMBlakG/1oQIXdXeZe/1FlrtYjylu
 2BgzUS8uarXYMAzFT0S0OYeToCAymLiEFkJyOWWEAb2CPDf72M7VRxrG0uPU/hgLoFIp
 9UtDTR7FHvgwqoVFrpAvUr4wV68BQHNKE+DC2KexONu2PhePlABNeHO4TUaOcrhWjPEV
 7nSg==
X-Gm-Message-State: AOAM531QZ8E0hlS5yC+wAQTcbAq6g/q1Swh7fshANAILlp44rNQ0+dB3
 1ZO0evU8EOK5jl8bdBo0ueAUgw==
X-Google-Smtp-Source: ABdhPJwsPIewKRiPHpMKg9Dgwa6FSZEYYHKguRSX5hvl5lz1TB1qAR/0Ay4A53FcH8i1bV5abHPdPQ==
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr259768wmh.123.1610392773083;
 Mon, 11 Jan 2021 11:19:33 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/40] drm/amd/display/dc/dce/dce_link_encoder: Remove unused
 variable 'value0'
Date: Mon, 11 Jan 2021 19:18:48 +0000
Message-Id: <20210111191926.3688443-3-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2xpbmtfZW5jb2Rlci5j
OiBJbiBmdW5jdGlvbiDigJhkY2UxMTBfbGlua19lbmNvZGVyX3VwZGF0ZV9tc3Rfc3RyZWFtX2Fs
bG9jYXRpb25fdGFibGXigJk6CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5
L2RjL2RjZS9kY2VfbGlua19lbmNvZGVyLmM6MTUwNjoxMTogd2FybmluZzogdmFyaWFibGUg4oCY
dmFsdWUw4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpD
YzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1
bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogTWF1cm8gUm9zc2kgPGlzc29yLm9ydWFtQGdtYWlsLmNvbT4KQ2M6
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfbGlua19lbmNvZGVy
LmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2xp
bmtfZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfbGlu
a19lbmNvZGVyLmMKaW5kZXggMGVmMmY0ZDlkOGJmMy4uMWU3N2ZmZWU3MWIzMCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfbGlua19lbmNvZGVyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfbGlua19lbmNvZGVy
LmMKQEAgLTE1MDMsNyArMTUwMyw2IEBAIHZvaWQgZGNlMTEwX2xpbmtfZW5jb2Rlcl91cGRhdGVf
bXN0X3N0cmVhbV9hbGxvY2F0aW9uX3RhYmxlKAogCWNvbnN0IHN0cnVjdCBsaW5rX21zdF9zdHJl
YW1fYWxsb2NhdGlvbl90YWJsZSAqdGFibGUpCiB7CiAJc3RydWN0IGRjZTExMF9saW5rX2VuY29k
ZXIgKmVuYzExMCA9IFRPX0RDRTExMF9MSU5LX0VOQyhlbmMpOwotCXVpbnQzMl90IHZhbHVlMCA9
IDA7CiAJdWludDMyX3QgdmFsdWUxID0gMDsKIAl1aW50MzJfdCB2YWx1ZTIgPSAwOwogCXVpbnQz
Ml90IHNsb3RzID0gMDsKQEAgLTE2MDQsNyArMTYwMyw3IEBAIHZvaWQgZGNlMTEwX2xpbmtfZW5j
b2Rlcl91cGRhdGVfbXN0X3N0cmVhbV9hbGxvY2F0aW9uX3RhYmxlKAogCWRvIHsKIAkJdWRlbGF5
KDEwKTsKIAotCQl2YWx1ZTAgPSBSRUdfUkVBRChEUF9NU0VfU0FUX1VQREFURSk7CisJCVJFR19S
RUFEKERQX01TRV9TQVRfVVBEQVRFKTsKIAogCQlSRUdfR0VUKERQX01TRV9TQVRfVVBEQVRFLAog
CQkJCURQX01TRV9TQVRfVVBEQVRFLCAmdmFsdWUxKTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
