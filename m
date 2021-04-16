Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EEC36229E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE47E6EBC4;
	Fri, 16 Apr 2021 14:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BA66EC21
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:38:06 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id g5so35780616ejx.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I8mWOth0SK24IkrgdA5t1Y60F5TC0397g52f7X8Rsig=;
 b=YgMDFePlDrbu+lfm/PqgYEnXq98IKmEE0loDCtjkfHsTCMpAqMSDSjSYx714+3DxwP
 sqWegEyqCp6hLKtv9sHQ3EY82v4t8frAeIWli699zbPAb40ZEiBEaw4QPxu4w63nO9cB
 KHuWXBQLE38YoaknaLtK242G6dcoG3qqnb4sXYX5R1NGPq/CEXHvxiHxdnLKTkhav9VT
 d5PwX9lVNlJCGvNS/uKWUMm0C3PLBjQW4xtOybaxuBcKZOVkTF1eiTg3+dod3uTSasqB
 6BDP78jpXknUPSDKOij9kcO1wkGkQeV+VEcLB6h7VbZ6fQUxzDiymRrTsnO2qA7yYH1c
 CIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I8mWOth0SK24IkrgdA5t1Y60F5TC0397g52f7X8Rsig=;
 b=JEliAUDfVZv+Mv4o4ACcuNFFYb7jB4W6kQhDPqRwNSMavNe9rkCHdDEhfJRg010H+G
 Uglk7GisOTx80VMNCxH83zpnXwqyHZqpa/u138IFXqibPYrSB7HUAzKrj8tU0gywZiqA
 uv6qvS5C/gqJzzK0RRxmaHEOMFCDwIfj8YH8SBxFMfKPjHklhUpIfVrzXbmuq4pm3JFD
 tfhXWU9dqYTZUoDCdBEj9E+cKgqc+L4Np9buZ5FWjSbdldh4V6ksDqKDVKXRfzmmc0d9
 H6DfGa29I6BYdY0LOQGPiBSa5vrca0cfOncBZMayCJEgUcNrTzaFaqshuodYaevEh5dc
 yHFQ==
X-Gm-Message-State: AOAM533muSUA2Y8u7dSSSV/kgKDVWcVAgcRPCqEBOVjZcuJBVGjWSfEO
 vydjFRwQ6h2IvoDs3EOJQPt0Cw==
X-Google-Smtp-Source: ABdhPJwB+j4w26WCbdC8MZ2fDdqzcj3geypeOzbRKQYNfP0KVkmEKSezvqx2DhR7+h5BUh8BM1TP8A==
X-Received: by 2002:a17:907:9691:: with SMTP id
 hd17mr8782424ejc.205.1618583884824; 
 Fri, 16 Apr 2021 07:38:04 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:38:04 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 33/40] drm/amd/amdgpu/amdgpu_ring: Provide description for
 'sched_score'
Date: Fri, 16 Apr 2021 15:37:18 +0100
Message-Id: <20210416143725.2769053-34-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuYzoxNjk6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ3NjaGVkX3Njb3JlJyBub3QgZGVzY3JpYmVkIGluICdhbWRn
cHVfcmluZ19pbml0JwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1z
aWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmluZy5jCmluZGV4IDY4ODYyNGViZTQyMTEuLjdiNjM0YTE1MTdmOWMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuYwpAQCAtMTU4LDYgKzE1
OCw3IEBAIHZvaWQgYW1kZ3B1X3JpbmdfdW5kbyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiAg
KiBAaXJxX3NyYzogaW50ZXJydXB0IHNvdXJjZSB0byB1c2UgZm9yIHRoaXMgcmluZwogICogQGly
cV90eXBlOiBpbnRlcnJ1cHQgdHlwZSB0byB1c2UgZm9yIHRoaXMgcmluZwogICogQGh3X3ByaW86
IHJpbmcgcHJpb3JpdHkgKE5PUk1BTC9ISUdIKQorICogQHNjaGVkX3Njb3JlOiBvcHRpb25hbCBz
Y29yZSBhdG9taWMgc2hhcmVkIHdpdGggb3RoZXIgc2NoZWR1bGVycwogICoKICAqIEluaXRpYWxp
emUgdGhlIGRyaXZlciBpbmZvcm1hdGlvbiBmb3IgdGhlIHNlbGVjdGVkIHJpbmcgKGFsbCBhc2lj
cykuCiAgKiBSZXR1cm5zIDAgb24gc3VjY2VzcywgZXJyb3Igb24gZmFpbHVyZS4KLS0gCjIuMjcu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
