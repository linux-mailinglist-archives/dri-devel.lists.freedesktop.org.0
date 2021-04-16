Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB32362297
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D366EC20;
	Fri, 16 Apr 2021 14:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B6E6EC17
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:57 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id o20so6273484edc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nl9Ia26K/OXp5QH7iR+CbZa0T1DkwvGhAbdA6rubQXU=;
 b=oRdDDVJnzU3oMYTdwqGq9oXyUcUTdpDa1cOLOtcv0eXH+IRscfrSxyE41XMoKgAynl
 ymX3w3afs7fC3P3KgCkr/gH01+c3nkSfjS0tJAv9h7srrtpvdGbujaFCQuzYffzvjJR6
 AYBhsbaS03ELNdlRIGdVO2wm/yA6LLFAujh4O3RUcl+pIhLax9HkuhTycdAsJK5Rh7Qb
 4NcL9vZZuLNrgSVcoPsDaw64oAa4gqBf+FwDOJepaoBBaxgAvFdEntsSh1aGplh0bKgt
 kZ7ytIwCvAADgk32eYBabFmahqZvK3qX5L7bFuh7Z01D2pTsDY+n4wUrcN6+JC7tGEoZ
 G84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nl9Ia26K/OXp5QH7iR+CbZa0T1DkwvGhAbdA6rubQXU=;
 b=r1MPG8K9a/e85O38xJrEhvE6mA3a6LCTbtLQlZLZSRITKcq2bRdFxQLUHGPHFTjDKI
 P4nyWCix3YHRtySf9+ocEDW7qHR/EGoNWpF4idbhuZ02lMR8P9DAO1iNU2daAjY2ZeJ6
 Jvw6T+z65z4SRJdCMM2oYBJTjDBfDX3mPxfy/QVfyF6GrpsUNMbonJYy6fCy7KRvn8Yn
 ltwuLbawbBPuq680ROV6M4WVm+KkIFCKd9n7RrEfU936YThFikFPO4ntMuDkPtfZPUPd
 9aAMltUNoz1uI/RAMqpAJqRg4xQ6rO/djqIXwvCAXKE1ZmXXioShKOItU080h5++Y4G+
 TMig==
X-Gm-Message-State: AOAM531LO++67wTErmy2MdAKp14FXP/jvvHXwVCCWzvOuR5ArkOFPyka
 iC7JESG/k691iSW4K8cLND3/TA==
X-Google-Smtp-Source: ABdhPJwPgmM7wgMTNVvKHslB4VCGOhOKe5VlAyEqYISlgKU0gq2jXg+T/USowGVX/n309irhgUvG+g==
X-Received: by 2002:a05:6402:3506:: with SMTP id
 b6mr10702102edd.175.1618583876478; 
 Fri, 16 Apr 2021 07:37:56 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:55 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/40] drm/radeon/radeon_device: Provide function name in
 kernel-doc header
Date: Fri, 16 Apr 2021 15:37:10 +0100
Message-Id: <20210416143725.2769053-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmM6MTEwMTogd2FybmluZzogVGhpcyBjb21t
ZW50IHN0YXJ0cyB3aXRoICcvKionLCBidXQgaXNuJ3QgYSBrZXJuZWwtZG9jIGNvbW1lbnQuIFJl
ZmVyIERvY3VtZW50YXRpb24vZG9jLWd1aWRlL2tlcm5lbC1kb2MucnN0CgpDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2RldmljZS5jCmluZGV4IGNjNDQ1YzRjYmEyZTMuLjQ2ZWVhMDE5NTBjYjEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5jCkBAIC0xMDk4LDcgKzEwOTgsOCBAQCBzdGF0aWMg
Ym9vbCByYWRlb25fY2hlY2tfcG90X2FyZ3VtZW50KGludCBhcmcpCiB9CiAKIC8qKgotICogRGV0
ZXJtaW5lIGEgc2Vuc2libGUgZGVmYXVsdCBHQVJUIHNpemUgYWNjb3JkaW5nIHRvIEFTSUMgZmFt
aWx5LgorICogcmFkZW9uX2dhcnRfc2l6ZV9hdXRvIC0gRGV0ZXJtaW5lIGEgc2Vuc2libGUgZGVm
YXVsdCBHQVJUIHNpemUKKyAqICAgICAgICAgICAgICAgICAgICAgICAgIGFjY29yZGluZyB0byBB
U0lDIGZhbWlseS4KICAqCiAgKiBAZmFtaWx5OiBBU0lDIGZhbWlseSBuYW1lCiAgKi8KLS0gCjIu
MjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
