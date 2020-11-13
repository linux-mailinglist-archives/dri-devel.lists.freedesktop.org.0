Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606FE2B1C36
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408586E4F9;
	Fri, 13 Nov 2020 13:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF7B6E4DD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:10 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c9so8201610wml.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fbx/i6xkdl5U3TCyGHC7OwtokMdU84+FveVergF6/Ok=;
 b=R1shnNVetX4luA2olSUjEUcn8RXbxoyUmnCpZ4pRXk8LujJR/7t/PmhuT/jdLA0YG8
 xdD0sDqtV4pG7nM8HQoEmSLcyNOcnklXEXFWPprk1HzH6oLPRMe5Fr9o0dn+a7JVklBJ
 AOTs4bmp6IjZ4AfdE8x0MIOIsH8NcoCqCq/sRmde2nuqAllLptX0ST7D4MjQoyp6LwXf
 98S1AE24vbzy5BEPTalNeNPn8kzE1W1M1RMP1zwRYbvH1oAKvH6IrHr3iLcroO7PnjzQ
 peUSjRSdghyuoehDuQU18l3Ps2p3pKevRGrvwtdEJPWnF8CIpwUpgVqVQRjVjzMciRnM
 WqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fbx/i6xkdl5U3TCyGHC7OwtokMdU84+FveVergF6/Ok=;
 b=sMj6Pt4xUOyIwRWG13l0iwpp5+kHUAKxle3vpk+IOP19z4YAg5qD27G1T8x9wMbieG
 eLUv6JR/gkSKoXEzqVKfJkdqb5cZxdrZs39C50pBwM3vAdIhyCy9hbkdRQZAdypqHJuU
 24MnK/H0vq5yuCGQ/4PJdIHU4ODa2fCN7/HdSV3J2FZJ0PBYPqbBS00XCHWoXpqNc1Bo
 L7Sc6VuHgbm1/mj71WxfSGsLcOxwemH82sZjjKbbFd53w0cBtxCa6Aa9I4lISrjeUfAC
 AktxoudpgVBlY5t+dPSjeBRqs0dL9tURtyrwg5sbfGhXOYr7K6uvaJpDVRUqM9XcjLXv
 uALQ==
X-Gm-Message-State: AOAM531m2pdPs8gyAkE8P6OYvczIMgAyD0b0Hqog4XLe8dtUDWSxpX3d
 Gwu8SqJiQzYS7/LWTz8MiE9uXQ==
X-Google-Smtp-Source: ABdhPJwb2YkE98pyU3fex6KmUTxG2VWK5VdMpzDRBejv+5JxJWIng0MFvboFaeU2oxPsca91cfjeeA==
X-Received: by 2002:a05:600c:2204:: with SMTP id
 z4mr2536234wml.57.1605275408939; 
 Fri, 13 Nov 2020 05:50:08 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:08 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/40] drm/amd/amdgpu/amdgpu_sched: Consume our own header
 containing prototypes
Date: Fri, 13 Nov 2020 13:49:20 +0000
Message-Id: <20201113134938.4004947-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Andres Rodriguez <andresx7@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NjaGVkLmM6MzU6NTogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhhbWRncHVfdG9fc2NoZWRfcHJpb3JpdHnigJkgWy1XbWlz
c2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NjaGVk
LmM6MTIyOjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYYW1kZ3B1X3Nj
aGVkX2lvY3Rs4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEx1YmVuIFR1aWtvdiA8bHViZW4u
dHVpa292QGFtZC5jb20+CkNjOiBBbmRyZXMgUm9kcmlndWV6IDxhbmRyZXN4N0BnbWFpbC5jb20+
CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zY2hlZC5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NjaGVkLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2NoZWQuYwppbmRleCAwZGEwYTBkOTg2NzIwLi5i
N2Q4NjFlZDUyODQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfc2NoZWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2NoZWQu
YwpAQCAtMjksNyArMjksNyBAQAogI2luY2x1ZGUgPGRybS9hbWRncHVfZHJtLmg+CiAKICNpbmNs
dWRlICJhbWRncHUuaCIKLQorI2luY2x1ZGUgImFtZGdwdV9zY2hlZC5oIgogI2luY2x1ZGUgImFt
ZGdwdV92bS5oIgogCiBpbnQgYW1kZ3B1X3RvX3NjaGVkX3ByaW9yaXR5KGludCBhbWRncHVfcHJp
b3JpdHksCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
