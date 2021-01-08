Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0732EF8C0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF696E8C4;
	Fri,  8 Jan 2021 20:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A37D6E8DC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:16:00 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id v14so8751418wml.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TsGB1GbRM0lE0DyQTr0kdLB4zVZuV/mNjcQ+anLlZ8k=;
 b=G8ruob3uLWUoFGkXg2GA/wzh7YN3To9pFFqngX5lh6jb6ZP9fzcDMAWNtCSRMw0EJI
 ohAQAqhBbi7T7wkgQHXylQTgplUVDEbTlp08mvRxQzKt1Wv27/kJ12a0pJoYJYGYGUIH
 Vxd1p29aXq8Eo8L7IZ8M8Aa5x2upHls1cXhgf7hp67wDXkwFgiTd4GSceUNYdVJLGKEJ
 Gv+ZJB4i/GW//bkLwhkEQ87maDacEv19mt7dOsic8lCQnPaiqcDa+OwmNOYcm4iEk0AS
 Un+AiOhhi7OBWMPkB0i6OXUtl+noOlMnqhpL2mtwAuC1J2158geqv+1Lbns0tTZhK0Q8
 mVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TsGB1GbRM0lE0DyQTr0kdLB4zVZuV/mNjcQ+anLlZ8k=;
 b=djBq5H0epYAE+l0qm/jgWetz6zWGbLzcJ62bL1D1zmlflwZYerrpJL3+4lFcbNXipT
 f1cC6kxXQBKy73hxjJ9um4/MErTOqCVWRLA1jmBkqs5pFR8plDl0qQEcDqXaJrm+U/jd
 FAkMUxCM590rUPf/Q4QkyL03Llyxu3NaNryQkbUVKHa095wjAz1c1BH/UUa6F95rDcB3
 jpe9oIgOzUqzmLM3zhqdMwHbOoaqQ577FHEK3ofZOv1GEJWGrFv14CWbvuUnCmQ3P+Lm
 7DSthfWdnFCMmcFiTqTZrYtb6tOBSNoP5aVkEomNhMvxwuQIiYEXiCmQSO4tmcc5qc35
 TJ5g==
X-Gm-Message-State: AOAM531Xv/Va8TkQ8UrnThnw5pMi530rQs52dhBQ+NEMubtvQwnasFpz
 PEkXap4sXJAzY+AOkdwQauUOrA==
X-Google-Smtp-Source: ABdhPJwwPGHcY+vfmrr91v+jp+f/K5LWjnXGsz3D0XwUCn+P1mL7BB+7RYk/8up01Y82mjEoOAJB1A==
X-Received: by 2002:a05:600c:1552:: with SMTP id
 f18mr4492260wmg.125.1610136959036; 
 Fri, 08 Jan 2021 12:15:59 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:58 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 38/40] drm/amd/display/dc/dce/dce_panel_cntl: Remove unused
 variables 'bl_pwm_cntl' and 'pwm_period_cntl'
Date: Fri,  8 Jan 2021 20:14:55 +0000
Message-Id: <20210108201457.3078600-39-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX3BhbmVsX2NudGwuYzog
SW4gZnVuY3Rpb24g4oCYZGNlX2dldF8xNl9iaXRfYmFja2xpZ2h0X2Zyb21fcHdt4oCZOgogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX3BhbmVsX2NudGwu
Yzo1NDoxMTogd2FybmluZzogdmFyaWFibGUg4oCYYmxfcHdtX2NudGzigJkgc2V0IGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9wYW5lbF9jbnRsLmM6NTM6MTE6IHdhcm5pbmc6IHZh
cmlhYmxlIOKAmHB3bV9wZXJpb2RfY250bOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEFudGhvbnkgS29vIDxBbnRob255
Lktvb0BhbWQuY29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
L2RjZV9wYW5lbF9jbnRsLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UvZGNlX3BhbmVsX2NudGwuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UvZGNlX3BhbmVsX2NudGwuYwppbmRleCA3NjFmZGZjMWY1YmQwLi5lOTIzMzky
MzU4NjMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2Rj
ZV9wYW5lbF9jbnRsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9k
Y2VfcGFuZWxfY250bC5jCkBAIC01MCwxNiArNTAsMTYgQEAgc3RhdGljIHVuc2lnbmVkIGludCBk
Y2VfZ2V0XzE2X2JpdF9iYWNrbGlnaHRfZnJvbV9wd20oc3RydWN0IHBhbmVsX2NudGwgKnBhbmVs
X2MKIHsKIAl1aW50NjRfdCBjdXJyZW50X2JhY2tsaWdodDsKIAl1aW50MzJfdCByb3VuZF9yZXN1
bHQ7Ci0JdWludDMyX3QgcHdtX3BlcmlvZF9jbnRsLCBibF9wZXJpb2QsIGJsX2ludF9jb3VudDsK
LQl1aW50MzJfdCBibF9wd21fY250bCwgYmxfcHdtLCBmcmFjdGlvbmFsX2R1dHlfY3ljbGVfZW47
CisJdWludDMyX3QgYmxfcGVyaW9kLCBibF9pbnRfY291bnQ7CisJdWludDMyX3QgYmxfcHdtLCBm
cmFjdGlvbmFsX2R1dHlfY3ljbGVfZW47CiAJdWludDMyX3QgYmxfcGVyaW9kX21hc2ssIGJsX3B3
bV9tYXNrOwogCXN0cnVjdCBkY2VfcGFuZWxfY250bCAqZGNlX3BhbmVsX2NudGwgPSBUT19EQ0Vf
UEFORUxfQ05UTChwYW5lbF9jbnRsKTsKIAotCXB3bV9wZXJpb2RfY250bCA9IFJFR19SRUFEKEJM
X1BXTV9QRVJJT0RfQ05UTCk7CisJUkVHX1JFQUQoQkxfUFdNX1BFUklPRF9DTlRMKTsKIAlSRUdf
R0VUKEJMX1BXTV9QRVJJT0RfQ05UTCwgQkxfUFdNX1BFUklPRCwgJmJsX3BlcmlvZCk7CiAJUkVH
X0dFVChCTF9QV01fUEVSSU9EX0NOVEwsIEJMX1BXTV9QRVJJT0RfQklUQ05ULCAmYmxfaW50X2Nv
dW50KTsKIAotCWJsX3B3bV9jbnRsID0gUkVHX1JFQUQoQkxfUFdNX0NOVEwpOworCVJFR19SRUFE
KEJMX1BXTV9DTlRMKTsKIAlSRUdfR0VUKEJMX1BXTV9DTlRMLCBCTF9BQ1RJVkVfSU5UX0ZSQUNf
Q05ULCAodWludDMyX3QgKikoJmJsX3B3bSkpOwogCVJFR19HRVQoQkxfUFdNX0NOVEwsIEJMX1BX
TV9GUkFDVElPTkFMX0VOLCAmZnJhY3Rpb25hbF9kdXR5X2N5Y2xlX2VuKTsKIAotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
