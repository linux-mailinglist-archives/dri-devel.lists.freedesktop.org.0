Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD462EF8A1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860D36E8C7;
	Fri,  8 Jan 2021 20:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74BA6E8D2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:17 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id k10so8748891wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4m+UfJ8aX5WLjKwBG1Xu8sQ5BNsQhd/cnOc6646uVLM=;
 b=xLshuzqR1S5leuYqYt+i5O0pzH6SK7237sKx76ydZAZ12/sCmWGMaKpZAn5ORm5VxA
 b7AM62dLqUYFa3QkxepEi2Glma4JBkROyGwMzVvdYsXkkMaw3Sgda6nSa6R/FaF31Dpm
 ZiX7Q7jWTDA32xLpGC0RqCfHNihxlDNszP5NaU/LTHZ0sULnT8MXDlKC4miJYJIs4C3X
 7UFv+/hFIZWuQxni+OkJp+bCWx2MOgrkuvoeByqrNPXePBhFcRcz6Mix2yTuGTBFwC9f
 jIbx6kAGiVERht+t17b65sHTRyNoCN2dT3DF3NTdbtSk17MqvxIcY2afNbxf8gFeFwwY
 YJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4m+UfJ8aX5WLjKwBG1Xu8sQ5BNsQhd/cnOc6646uVLM=;
 b=h/FLjY3VPFWk2lRFeYHx3RAILpeOQsEqOykyM3gy1tMJ/R1j+sCFL6+/EuGBhzAxf0
 fL795EruwLW4nxnD1EGwkA468hWE2UOhiCFdOE85r/i97w6pAI9eeIjZxYDqWa4xMPIw
 P7p9/Bf3TESK/lERMADpPQxg6myyiJc+HUPK0iO+GehRiEnkc66YemBW1ntGMC6o8xqi
 h+mBVo6lGJ6CtUaz2a17RlEfcUIS2X+1W0r/8a1miGfOJtb+VwrRBoRqYyrdzH+rVTrS
 eVDN0XT2LUzEZF38HAZzUvmsMiGPVCgSniWLN7uBT9wsNm1YQfxuTZO395tJ/0hHv7c5
 LwCw==
X-Gm-Message-State: AOAM5319JzJRgLpnVx3Qm2efCFpwxW7P7iIx2SfNNHnx74jnc0YjUfe8
 0yimr/mS5A80cz6MFWfqgQ+h/Q==
X-Google-Smtp-Source: ABdhPJzzFAJVmK21o2vqWktdG8/jT/HrmCYeMykde37kQ//uOudXLb2wVW4KTK+B7j9Unkk/ciS3Lg==
X-Received: by 2002:a05:600c:313:: with SMTP id
 q19mr4477223wmd.126.1610136916383; 
 Fri, 08 Jan 2021 12:15:16 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/40] drm/amd/pm/powerplay/hwmgr/vega20_hwmgr: Fix legacy
 function header formatting
Date: Fri,  8 Jan 2021 20:14:26 +0000
Message-Id: <20210108201457.3078600-10-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5j
Ojc4MTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaHdtZ3InIG5vdCBk
ZXNjcmliZWQgaW4gJ3ZlZ2EyMF9pbml0X3NtY190YWJsZScKCkNjOiBFdmFuIFF1YW4gPGV2YW4u
cXVhbkBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdy
L3ZlZ2EyMF9od21nci5jIHwgMTEgKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYwppbmRleCBkYTg0MDEyYjdmZDUxLi44
NzgxMWIwMDViODVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxh
eS9od21nci92ZWdhMjBfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2Vy
cGxheS9od21nci92ZWdhMjBfaHdtZ3IuYwpAQCAtNzcxLDEyICs3NzEsMTEgQEAgc3RhdGljIGlu
dCB2ZWdhMjBfc2V0dXBfZGVmYXVsdF9kcG1fdGFibGVzKHN0cnVjdCBwcF9od21nciAqaHdtZ3Ip
CiB9CiAKIC8qKgotKiBJbml0aWFsaXplcyB0aGUgU01DIHRhYmxlIGFuZCB1cGxvYWRzIGl0Ci0q
Ci0qIEBwYXJhbSAgICBod21nciAgdGhlIGFkZHJlc3Mgb2YgdGhlIHBvd2VycGxheSBoYXJkd2Fy
ZSBtYW5hZ2VyLgotKiBAcGFyYW0gICAgcElucHV0ICB0aGUgcG9pbnRlciB0byBpbnB1dCBkYXRh
IChQb3dlclN0YXRlKQotKiBAcmV0dXJuICAgYWx3YXlzIDAKLSovCisgKiBJbml0aWFsaXplcyB0
aGUgU01DIHRhYmxlIGFuZCB1cGxvYWRzIGl0CisgKgorICogQGh3bWdyOiAgdGhlIGFkZHJlc3Mg
b2YgdGhlIHBvd2VycGxheSBoYXJkd2FyZSBtYW5hZ2VyLgorICogcmV0dXJuOiAgYWx3YXlzIDAK
KyAqLwogc3RhdGljIGludCB2ZWdhMjBfaW5pdF9zbWNfdGFibGUoc3RydWN0IHBwX2h3bWdyICpo
d21ncikKIHsKIAlpbnQgcmVzdWx0OwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
