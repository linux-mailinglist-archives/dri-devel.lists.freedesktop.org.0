Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1EF2C562F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF58A6E98D;
	Thu, 26 Nov 2020 13:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9E06E994
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:40 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p8so2194297wrx.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTlQph4T9x2clQDWFRQKUxH5e24azy8BuVSYzp5lBkU=;
 b=Rz+Vn8n1GJmQ/rxsl/asCB4OMfEleQg7MQ7bd6+UCqkmm74BIESn/bQbICzXd8MhjA
 QuNQ4O4dVDJ6LSLLa5dkqVQvWlr9KRQbjeT2N3rOGGVAxe1qZjzmiu/Ix+dTg0/srPE0
 kzde8m10jLEIPnZeUuIQv4H+GX0bSwc3iQGh8KHXvAP6sOp+abDZeHDY+eOa7Fqy1vJd
 WvIxy4ElqE4NzC45RHvb+UftFhN8PtHHYGLc5UKM76FNhLdb7CRbZbUQuq4IoMxMmS5R
 Jda+Kc6IQMS3qx3X0gNu4CDnxZlLrVVplJsduhtZzyo6uI1PfQ6E23pRQdT9Rg4WMhO3
 5xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTlQph4T9x2clQDWFRQKUxH5e24azy8BuVSYzp5lBkU=;
 b=E0qGsRnUVzeT3+KQb7Zg0Zh0rfBlOt0rd64buFTkTPz1xc74zjdrD4sOW+FOQwsv97
 F/FVofnMp7ey20lCpXEnuXR6f5BzYa1cxJCIztVRnrOuQBzhhPDZ0GcY2n+8M6NVexyl
 K3ez6Itc0XDa/d0gbgBYU/ZdSHVBGoBTxaILuL6BtJB/y+HcBmIk8NdE8Wf/UroT4aX6
 57YUcrN1XyPflYDzPn5aUd55MTrpUB/pYP9LHbdoF31S5UWE72MnRw1ItdorU6STy3yZ
 PhCxWzmL+6nQ85byiFOzy0/sAbUpkpcnOswuDNo7hKnzJcb0vVOYZpkoc7fqDbIDWDqa
 FLUw==
X-Gm-Message-State: AOAM531GWl5UlG25uOU7oVjdCYolH8TZaIPA87pVXi2GQpOENtLd7c04
 MxXc/GHeWQbvDNjHgXcxDuorVQ==
X-Google-Smtp-Source: ABdhPJyjFZb/CZGkNbJquN6qeOeEmF3gQUTLtH3m5Nlq0vmYqCf2gV6hQrse5Mhswj35yLTHU2zP6w==
X-Received: by 2002:a5d:6186:: with SMTP id j6mr4005475wru.359.1606398219495; 
 Thu, 26 Nov 2020 05:43:39 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:38 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 37/40] drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu: Remove
 unused function 'pp_nv_set_pme_wa_enable()'
Date: Thu, 26 Nov 2020 13:42:37 +0000
Message-Id: <20201126134240.3214176-38-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3Nt
dS5jOjY2NDoyMDogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhwcF9udl9z
ZXRfcG1lX3dhX2VuYWJsZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogSGFycnkgV2Vu
dGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1k
LmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJD
aHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211
LmMgfCAxNiAtLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1fcHBfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9wcF9zbXUuYwppbmRleCBhYzBhMDUzOTg1NGVmLi42MDdlYzA5OTk0NDU2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9w
cF9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9wcF9zbXUuYwpAQCAtNjYxLDIyICs2NjEsNiBAQCBzdGF0aWMgZW51bSBwcF9zbXVfc3Rh
dHVzIHBwX252X3NldF93bV9yYW5nZXMoc3RydWN0IHBwX3NtdSAqcHAsCiAJcmV0dXJuIFBQX1NN
VV9SRVNVTFRfT0s7CiB9CiAKLXN0YXRpYyBlbnVtIHBwX3NtdV9zdGF0dXMgcHBfbnZfc2V0X3Bt
ZV93YV9lbmFibGUoc3RydWN0IHBwX3NtdSAqcHApCi17Ci0JY29uc3Qgc3RydWN0IGRjX2NvbnRl
eHQgKmN0eCA9IHBwLT5kbTsKLQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGN0eC0+ZHJp
dmVyX2NvbnRleHQ7Ci0Jc3RydWN0IHNtdV9jb250ZXh0ICpzbXUgPSAmYWRldi0+c211OwotCi0J
aWYgKCFzbXUtPnBwdF9mdW5jcykKLQkJcmV0dXJuIFBQX1NNVV9SRVNVTFRfVU5TVVBQT1JURUQ7
Ci0KLQkvKiAwOiBzdWNjZXNzZnVsIG9yIHNtdS5wcHRfZnVuY3MtPnNldF9hemFsaWFfZDNfcG1l
ID0gTlVMTDsgIDE6IGZhaWwgKi8KLQlpZiAoc211X3NldF9hemFsaWFfZDNfcG1lKHNtdSkpCi0J
CXJldHVybiBQUF9TTVVfUkVTVUxUX0ZBSUw7Ci0KLQlyZXR1cm4gUFBfU01VX1JFU1VMVF9PSzsK
LX0KLQogc3RhdGljIGVudW0gcHBfc211X3N0YXR1cyBwcF9udl9zZXRfZGlzcGxheV9jb3VudChz
dHJ1Y3QgcHBfc211ICpwcCwgaW50IGNvdW50KQogewogCWNvbnN0IHN0cnVjdCBkY19jb250ZXh0
ICpjdHggPSBwcC0+ZG07Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
