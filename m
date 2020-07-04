Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD78215328
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456856E32F;
	Mon,  6 Jul 2020 07:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF37B89711
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:25:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o11so35334205wrv.9
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2uyp/MfaDITohcGBEN+pDw23B/gCn7tCuAyxbyBm56M=;
 b=hS2gSZNYwy/ZY2DBi6VycIP0XgCiAQvLzQbonhggp0zl69dzXQxeTngj314MAY2pBO
 YVyBsVuJg/sTryjpXZHBKHVES/nVJgsiPhRuN4LxZJSOQDPLjuyR9fPyn1LxXxjnXfTS
 yaTJh/daGv7gV/5UmAfQYI/c/gMep45swriGx6RKB5S0axtuK6JXWfve3XrS1s/xYc+Y
 gEWA5yxWrgxL1a0KHfyJQUNllGNjmtbr+WGwQ6Wivy56IMl4I9NPFnms/ksB8xWO0Kpe
 wc+IcTtXVvg++aoFbv8Fw807+90zvO50EtDWCZr4phVpt0Y7ARzG+jE/xYNDrRQHBUh9
 MAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2uyp/MfaDITohcGBEN+pDw23B/gCn7tCuAyxbyBm56M=;
 b=FiRlnK8DpGQI/Z9BLB1u7QAE2J+AEopXiZEDgrJsLd6m7kOKyVzeTlpRp51tDZcWzP
 orE1Z/ewBhb0bqvQzpHCdu4+Pj6n8c/vM3GGHT57XR9EKV5uJOo5E0eMnDkh/3ehB4dR
 +9notb/reHNX6GYeSWOS7Kl8Z4zt2S/IOiJ/ccDetOPRNaLnr8VB6ggq5JoijZC9JjxY
 mFcicHvs+RVDA1IQOS1L+eD2atnE3QzTpedpEIs3sEs5i1TOqQCMPX47sB2nyj32JaJj
 DAIqfUcWnPWuEtPTfI+6j7nMoMyLSuZaNe0jycymsM0gb7NTq2qaTrOj+Hmj0VR9XyZ2
 wGig==
X-Gm-Message-State: AOAM531pd7/WT8/kRTI3K/c+NYH4U+SyaspM3crOVj681s/kyFFApW6a
 zauqlkGbaTLlg0PkXdCanMo=
X-Google-Smtp-Source: ABdhPJwDC6OrmJ3KyitbYyv9GGaSuSJ8BHvwjptu2GIXtAgJx6HO9WktHkuYPp8IujxLo+KSXAhw0g==
X-Received: by 2002:adf:8091:: with SMTP id 17mr28205914wrl.13.1593858344483; 
 Sat, 04 Jul 2020 03:25:44 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id g14sm16421428wrm.93.2020.07.04.03.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:25:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 02/14] drm/panfrost: clean headers in devfreq
Date: Sat,  4 Jul 2020 12:25:23 +0200
Message-Id: <20200704102535.189647-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102535.189647-1-peron.clem@gmail.com>
References: <20200704102535.189647-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9uJ3QgaW5jbHVkZSBub3QgcmVxdWlyZWQgaGVhZGVycyBhbmQgc29ydCB0aGVtLgoKU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KUmV2aWV3ZWQt
Ynk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDggKystLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKaW5kZXggMWI1NjBiOTAzZWE2Li5kZjdiNzFkYTlh
ODQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVx
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwpAQCAt
MSwxOCArMSwxNCBAQAogLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKIC8qIENv
cHlyaWdodCAyMDE5IENvbGxhYm9yYSBsdGQuICovCisKKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4K
ICNpbmNsdWRlIDxsaW51eC9kZXZmcmVxLmg+CiAjaW5jbHVkZSA8bGludXgvZGV2ZnJlcV9jb29s
aW5nLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGlu
dXgvcG1fb3BwLmg+Ci0jaW5jbHVkZSA8bGludXgvY2xrLmg+Ci0jaW5jbHVkZSA8bGludXgvcmVn
dWxhdG9yL2NvbnN1bWVyLmg+CiAKICNpbmNsdWRlICJwYW5mcm9zdF9kZXZpY2UuaCIKICNpbmNs
dWRlICJwYW5mcm9zdF9kZXZmcmVxLmgiCi0jaW5jbHVkZSAicGFuZnJvc3RfZmVhdHVyZXMuaCIK
LSNpbmNsdWRlICJwYW5mcm9zdF9pc3N1ZXMuaCIKLSNpbmNsdWRlICJwYW5mcm9zdF9ncHUuaCIK
LSNpbmNsdWRlICJwYW5mcm9zdF9yZWdzLmgiCiAKIHN0YXRpYyB2b2lkIHBhbmZyb3N0X2RldmZy
ZXFfdXBkYXRlX3V0aWxpemF0aW9uKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogewot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
