Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6352B2B1C48
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492C56E54C;
	Fri, 13 Nov 2020 13:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D11C6E513
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:20 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 23so9966144wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a52ICVH+xE+6XFb27F1p5fPxl4mBgRlINo5mYgFGiGQ=;
 b=L05jL7z2ETjWI9KIsm7A5p4VGI9RsHiDec6sbmMFg65N8W/3J2fLj8Gize4e3TKmij
 HbeGEC+Jkb6BGQy9k6jMszJ5Q2Yv6A/poxxZ+HidxYyMzMaJkyj8FnFRzfP6acpRrLHs
 +lsvbVezKoAwn4Yc5OmFzXaVssxUlV/nlF/Lz9hJn2Ii2njVhZGF17dwmDo+jxrHzeGY
 sHe317SIWSifDtomdptySzHypaTbMJCwGEiP7Oork0h5OlGWH5SJS7aef0HgK+9xKWYX
 /JufKCuIU5fSvai1z4mdUsGZ+Yer6KWirS9w0tDtnpFWcMq0DvfiRETtkERwB6wqBr+L
 rW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a52ICVH+xE+6XFb27F1p5fPxl4mBgRlINo5mYgFGiGQ=;
 b=UV0iMdwGoxdE76IcZeKsAPD/MlWgHWJMuuUkKbs3CUUPK/daO/LHgOsJOeBkvsqB8+
 RegPACR0gTCSQ0ZqsTkYslw9hUwXJqfSSlTNxpLnr7AQgdOgoJISdz4gUftQbqCqHwx+
 S5l2UApVvjVYQYQF3R7D4IJY9B3Nn4qLPZ3nuSG3GbR0ksDkJD+D8z8iJQcv2w9lWgMd
 Ahv+fyzVtuL9pf9URbtZ2mGOscggNSq+a6QRdtmdX8Joe1kH8jpkIomS5CJK/eUNtBX6
 8KxGa5/enbMPKWBzCvfIbHJ9mceawVkX46a+3CsGP8C6R2G3oaNDPVWy0+I/suwC1qMy
 b9yQ==
X-Gm-Message-State: AOAM532T4D7Vdvqi/XOztUqWQ0khHsEwLAY0blSfYREtNrpRvFsh/PBB
 vxyXp+fpy6IH34QrW/OzrP94KA==
X-Google-Smtp-Source: ABdhPJxoM/5L2V6PAjUnoUZECKaqTMYBE6srvcr6DjvjId68CnDWgP++QlPsk5O+bhjYDoqI3Gunvw==
X-Received: by 2002:adf:e983:: with SMTP id h3mr3474235wrm.382.1605275418913; 
 Fri, 13 Nov 2020 05:50:18 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/40] drm/amd/amdgpu/amdgpu_vm_cpu: Fix
 'amdgpu_vm_cpu_prepare()'s doc-rot
Date: Fri, 13 Nov 2020 13:49:28 +0000
Message-Id: <20201113134938.4004947-31-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX2NwdS5jOjUwOiB3YXJuaW5nOiBGdW5jdGlv
biBwYXJhbWV0ZXIgb3IgbWVtYmVyICdyZXN2JyBub3QgZGVzY3JpYmVkIGluICdhbWRncHVfdm1f
Y3B1X3ByZXBhcmUnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fY3B1LmM6
NTA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3N5bmNfbW9kZScgbm90
IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3ZtX2NwdV9wcmVwYXJlJwogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtX2NwdS5jOjUwOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFy
YW1ldGVyICdvd25lcicgZGVzY3JpcHRpb24gaW4gJ2FtZGdwdV92bV9jcHVfcHJlcGFyZScKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9jcHUuYzo1MDogd2FybmluZzogRXhj
ZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnZXhjbHVzaXZlJyBkZXNjcmlwdGlvbiBpbiAnYW1kZ3B1
X3ZtX2NwdV9wcmVwYXJlJwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4K
Q2M6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5s
aW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX2NwdS5jIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9jcHUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9jcHUuYwppbmRleCAwNzg2ZTc1NTU1NTRi
Li5hYzQ1ZDljN2E0ZTk0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm1fY3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zt
X2NwdS5jCkBAIC0zOCw4ICszOCw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2NwdV9tYXBfdGFi
bGUoc3RydWN0IGFtZGdwdV9ibyAqdGFibGUpCiAgKiBhbWRncHVfdm1fY3B1X3ByZXBhcmUgLSBw
cmVwYXJlIHBhZ2UgdGFibGUgdXBkYXRlIHdpdGggdGhlIENQVQogICoKICAqIEBwOiBzZWUgYW1k
Z3B1X3ZtX3VwZGF0ZV9wYXJhbXMgZGVmaW5pdGlvbgotICogQG93bmVyOiBvd25lciB3ZSBuZWVk
IHRvIHN5bmMgdG8KLSAqIEBleGNsdXNpdmU6IGV4Y2x1c2l2ZSBtb3ZlIGZlbmNlIHdlIG5lZWQg
dG8gc3luYyB0bworICogQHJlc3Y6IHJlc2VydmF0aW9uIG9iamVjdCB3aXRoIGVtYmVkZGVkIGZl
bmNlCisgKiBAc3luY19tb2RlOiBzeW5jaHJvbml6YXRpb24gbW9kZQogICoKICAqIFJldHVybnM6
CiAgKiBOZWdhdGl2IGVycm5vLCAwIGZvciBzdWNjZXNzLgotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
