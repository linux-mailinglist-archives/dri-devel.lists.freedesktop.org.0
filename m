Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FE92B0D6B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6D26E3D8;
	Thu, 12 Nov 2020 19:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9246E3D8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:07:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a3so6432761wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xZd7d6xqls8jDl+M8ybA/csJQ/XOet7ACTV4JHLbfR4=;
 b=JKv9Y9oU0JhE2143HXtvB0mFtf5ERN77Q+DLf+PeSGB5sCN2dC7AZILVbxIh31xHSc
 8k1pm/1KJOEo3/ArxZJ8DKvzExo09zMPG4iXTqFFGnj8nrSFCh7c7sq4z79vWFjaCUhF
 cu4fJW1K//nCA7e7k0RRLxi0M51e5DxMihSLptphtScOCeHe/hfDg4S0voMBktpD+0/i
 JZEIwYVDd4b7qpIp1CcSn8FE9VB/WPm1Sm4sIHFjeDyxvJKAuMC+KMKBxCwuGgwTwt+K
 hE4wStSmmI2U1HpMNaEeHCn09SRh/SW0rrv3fFBLfXRzIfDor1UtNowtcSPSrC1A1GO8
 Lplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xZd7d6xqls8jDl+M8ybA/csJQ/XOet7ACTV4JHLbfR4=;
 b=KuW9spo0VUaXzRebYRuGsjqb/At7RZCiUeE9FC201YFTs9vHw7kA8PU+MZ18ysNUrh
 xgZLk6TlLJhup1t6mvND5eQOVTBQVmhcZ4T+8vAJujVQQfRzxAKOGTorRCXnSXqKTIsH
 1xhPvBScq4BWGUHOgWHot+XK00XSqbuNk6SHM6Sk4yKPFyqFtBaOSkGsI7XsJs6E0/mE
 Br/3oT0xHbLEbN8pzyFs82gdIxEN/jmaBIQzbx+YzqV6EhNinh9FS4f3Dj/dDSCXTOVF
 LA3bAKc5y+dJbfI4UjmCnUw3a48KjjaarcEL4Lrlo08UcTkgQPEYfzxnBvc2YUZ4ux2h
 0mmg==
X-Gm-Message-State: AOAM531A2iiyliOePC2KnSbhZT8N13LesjF578IoBwEd4GIyyGL4p7oH
 d9V9f8nPZ/2d29x1x4riVEzJuqW5IOJsUgmC
X-Google-Smtp-Source: ABdhPJxssIxVYH+hdM3iTUSfocLV+rScXqNtIh5LmjSZQBzffjCk/HPBo0B9+7pPvlDzmWHoFcUuMw==
X-Received: by 2002:a1c:dd06:: with SMTP id u6mr1084482wmg.155.1605207684974; 
 Thu, 12 Nov 2020 11:01:24 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:24 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/30] drm/amd/amdgpu/amdgpu_cs: Add a couple of missing
 function param descriptions
Date: Thu, 12 Nov 2020 19:00:28 +0000
Message-Id: <20201112190039.2785914-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
 linaro-mm-sig@lists.linaro.org, Jerome Glisse <glisse@freedesktop.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmM6Njg1OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdiYWNrb2ZmJyBub3QgZGVzY3JpYmVkIGluICdhbWRncHVfY3Nf
cGFyc2VyX2ZpbmknCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYzoxNjU1
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdtYXAnIG5vdCBkZXNjcmli
ZWQgaW4gJ2FtZGdwdV9jc19maW5kX21hcHBpbmcnCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdh
bEBsaW5hcm8ub3JnPgpDYzogSmVyb21lIEdsaXNzZSA8Z2xpc3NlQGZyZWVkZXNrdG9wLm9yZz4K
Q2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1t
bS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5j
IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2NzLmMKaW5kZXggOGQyODc4ZTk1MGRhYi4uNTk0YTAxMDhlOTBmYSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKQEAgLTY3Niw2ICs2NzYsNyBA
QCBzdGF0aWMgaW50IGFtZGdwdV9jc19zeW5jX3JpbmdzKHN0cnVjdCBhbWRncHVfY3NfcGFyc2Vy
ICpwKQogICogY3NfcGFyc2VyX2ZpbmkoKSAtIGNsZWFuIHBhcnNlciBzdGF0ZXMKICAqIEBwYXJz
ZXI6CXBhcnNlciBzdHJ1Y3R1cmUgaG9sZGluZyBwYXJzaW5nIGNvbnRleHQuCiAgKiBAZXJyb3I6
CWVycm9yIG51bWJlcgorICogQGJhY2tvZmY6CWluZGljYXRvciB0byBiYWNrb2ZmIHRoZSByZXNl
cnZhdGlvbgogICoKICAqIElmIGVycm9yIGlzIHNldCB0aGFuIHVudmFsaWRhdGUgYnVmZmVyLCBv
dGhlcndpc2UganVzdCBmcmVlIG1lbW9yeQogICogdXNlZCBieSBwYXJzaW5nIGNvbnRleHQuCkBA
IC0xNjQ0LDYgKzE2NDUsNyBAQCBpbnQgYW1kZ3B1X2NzX3dhaXRfZmVuY2VzX2lvY3RsKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAgKiBAcGFyc2VyOiBjb21tYW5kIHN1Ym1p
c3Npb24gcGFyc2VyIGNvbnRleHQKICAqIEBhZGRyOiBWTSBhZGRyZXNzCiAgKiBAYm86IHJlc3Vs
dGluZyBCTyBvZiB0aGUgbWFwcGluZyBmb3VuZAorICogQG1hcDogUGxhY2Vob2xkZXIgdG8gcmV0
dXJuIGZvdW5kIEJPIG1hcHBpbmcKICAqCiAgKiBTZWFyY2ggdGhlIGJ1ZmZlciBvYmplY3RzIGlu
IHRoZSBjb21tYW5kIHN1Ym1pc3Npb24gY29udGV4dCBmb3IgYSBjZXJ0YWluCiAgKiB2aXJ0dWFs
IG1lbW9yeSBhZGRyZXNzLiBSZXR1cm5zIGFsbG9jYXRpb24gc3RydWN0dXJlIHdoZW4gZm91bmQs
IE5VTEwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
