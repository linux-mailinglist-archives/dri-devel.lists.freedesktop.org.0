Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F3A2B1C4E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558716E563;
	Fri, 13 Nov 2020 13:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880D46E520
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:21 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 10so8208306wml.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xrnyrit0v6fzfrooRNMi88M6HiPrfycz27kzVEg4yYM=;
 b=xzX7/w5JkEJWFNmWJ9XhEULYWxZdlL484sgDqokJC2N74ZDAzRW9fNa/+pZRfQXoPX
 w8vSlD7sbufyf6Tbg3R5IVs4V60sFs7/H1PbDBA3gNe9bY4Alpdn5tnIKN9vL33TD/0/
 mBKobWhQGaWzcEpKoZgfmMMnI6AFkzBZ2vwAbhyHidq2K495ZRsaes76xKfe29AD2cyR
 nySZLdB8HAYVQO489IHNmmRwG9MTK+nyLd/nS9jyON3UfUIlWkwfmGp8vli3eiE1+llt
 U96cfho0m+d73d4rKqV6kECpeYyodlf1MvO+KdIAWSFaXtAEGdGp4kXCjLjro1ttEEA5
 qnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xrnyrit0v6fzfrooRNMi88M6HiPrfycz27kzVEg4yYM=;
 b=m2VorLTlQrmeKngdYISnu37O9px+ENmdgS1sE1vmIyOTxtclhYSvHhGJkP3Bvplapu
 cQHgTrsMTno6Kk8g62aHt5fygFX5BoI9QZcYJnx1p+F9KeZxZEx+i9WASV+RpIw6cgdO
 9ZrcRKmPtsOTmzxBnY9aUIyPDIFYBUUoFI9kfpAkLwkUlQBt7xtS18ExTU8ghcNR4Rhk
 b9WF0jpkuk0BhjYlZilX559Tp0d3aHpvxDyCPF4vnMmuAj/FKp2tie5FaMdrXbmXz4zu
 8SQGkGPAwi7bAkYkrzX+K4pHCqmFzg03X0jX5NMGpy1sc+GjI+gyfdIlXqjad/Hw83SE
 q30g==
X-Gm-Message-State: AOAM531zBk4Gav8u+b3mwfysgKxSggeOWgErKOpijqsdbQ5zl2NjlJad
 p2g7hG52rU+kDyUEVq+irKaCzA==
X-Google-Smtp-Source: ABdhPJxleAxe551m1648cnVusxHBA+2YOfp8Wr3sW/9AY28jfMWSIiglJKFPwmqZEbfjZhTBw2Q2Yw==
X-Received: by 2002:a1c:448:: with SMTP id 69mr2516516wme.12.1605275420178;
 Fri, 13 Nov 2020 05:50:20 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:19 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 31/40] drm/amd/amdgpu/amdgpu_vm_sdma: Fix
 'amdgpu_vm_sdma_prepare()'s doc-rot
Date: Fri, 13 Nov 2020 13:49:29 +0000
Message-Id: <20201113134938.4004947-32-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEuYzo2Mzogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAncmVzdicgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3Zt
X3NkbWFfcHJlcGFyZScKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1h
LmM6NjM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3N5bmNfbW9kZScg
bm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3ZtX3NkbWFfcHJlcGFyZScKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmM6NjM6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlv
biBwYXJhbWV0ZXIgJ293bmVyJyBkZXNjcmlwdGlvbiBpbiAnYW1kZ3B1X3ZtX3NkbWFfcHJlcGFy
ZScKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmM6NjM6IHdhcm5p
bmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2V4Y2x1c2l2ZScgZGVzY3JpcHRpb24gaW4g
J2FtZGdwdV92bV9zZG1hX3ByZXBhcmUnCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5h
cm8ub3JnPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzog
bGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtX3NkbWEuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm1fc2RtYS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3Nk
bWEuYwppbmRleCBkYjc5MDU3NGRjMmU4Li5hODNhNjQ2NzU5YzU4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fc2RtYS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmMKQEAgLTUxLDggKzUxLDggQEAgc3RhdGlj
IGludCBhbWRncHVfdm1fc2RtYV9tYXBfdGFibGUoc3RydWN0IGFtZGdwdV9ibyAqdGFibGUpCiAg
KiBhbWRncHVfdm1fc2RtYV9wcmVwYXJlIC0gcHJlcGFyZSBTRE1BIGNvbW1hbmQgc3VibWlzc2lv
bgogICoKICAqIEBwOiBzZWUgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgZGVmaW5pdGlvbgotICog
QG93bmVyOiBvd25lciB3ZSBuZWVkIHRvIHN5bmMgdG8KLSAqIEBleGNsdXNpdmU6IGV4Y2x1c2l2
ZSBtb3ZlIGZlbmNlIHdlIG5lZWQgdG8gc3luYyB0bworICogQHJlc3Y6IHJlc2VydmF0aW9uIG9i
amVjdCB3aXRoIGVtYmVkZGVkIGZlbmNlCisgKiBAc3luY19tb2RlOiBzeW5jaHJvbml6YXRpb24g
bW9kZQogICoKICAqIFJldHVybnM6CiAgKiBOZWdhdGl2IGVycm5vLCAwIGZvciBzdWNjZXNzLgot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
