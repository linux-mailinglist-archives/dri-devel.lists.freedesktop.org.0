Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CDB2A9F72
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D046EB37;
	Fri,  6 Nov 2020 21:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE586EB38
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:50:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 33so2779813wrl.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H95rA0QKKaL3+FIhv21U45aIyhbFkd+FiaPq5zaa4zk=;
 b=ccFvN7q5RxD4CM0NZ+0NxOOG6O0PgSIXE+amCe86rCTSBZLuWX37GhNGsshfXsaMgJ
 iJ+m8coKTU8tmP8qge3HwIuTlw6dRtNHcwYQoDi0f2+qc7AJiR+nGeV09VYcqv3176Ps
 Z4rIW0Ek+Ibod01RSdTTLjdionhBuOzof//ifUqw8gtS7OVpCBHufYnY7iISAOwDON89
 8xox35G1GiJLy2sNXn3sNnHV8RbvddMWz/MEVUR8Lekn7rI/ELHoZ3UWfBQdxqeSpqyX
 4Z0EBLkLyasPaxfUW9RF1jPxDJT4MtCVhxwJV7ziZHtyfaZlgC6YN1pEUtBZ0X+ZzIJj
 +nTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H95rA0QKKaL3+FIhv21U45aIyhbFkd+FiaPq5zaa4zk=;
 b=EGtI8T7Am7QnSw/n3p+6QOotbAHzoFhLaaHVs3dm9JoIqorQp5cZKyC665lNwOjDqg
 uaBDSKpgSNPpTok7cAe+2vtGAlWQDzPelHn9XM2mxzieuZeohBPGRba6srRZkAHKrNz+
 bxyOOXCbypVlYEwwxQQUNDwT/j9Z69aWvqa/TKw80qz/qL5bQH8qs/ztJWmBdtrWg/h0
 C8j5tMB8f3/nMkLlDlD6EXwNi7pB1RWqaiAuPqpLUcUjn4vBOnczFstE8YIq/PsY6Ylz
 8XPpd2tBBCfuuEDfGFnqYo2VA/TuijedK/95BcX5lsAwGpfYZopz3XtyD2WNvUvpTq8h
 uxpg==
X-Gm-Message-State: AOAM530cN8dz27IxERLm5JRFDqA8I9qirmNTvzoW/6qJtkH8lxI3J4Cd
 9NbfPtJlyevhRRbqcTeYxkCZAQ==
X-Google-Smtp-Source: ABdhPJz9AWUMB39aA8Da4lz3LdJLIZWfCG0guHXHUnmy1PklBu/Fnl293iGu8GFZZ/mVR1JdkoPY7g==
X-Received: by 2002:adf:cd0d:: with SMTP id w13mr2494726wrm.382.1604699416188; 
 Fri, 06 Nov 2020 13:50:16 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:50:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/19] drm/radeon/atombios_crtc: Remove description of
 non-existent function param 'encoder'
Date: Fri,  6 Nov 2020 21:49:48 +0000
Message-Id: <20201106214949.2042120-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9hdG9tYmlvc19jcnRjLmM6MTc5Njogd2FybmluZzogRXhjZXNzIGZ1
bmN0aW9uIHBhcmFtZXRlciAnZW5jb2RlcicgZGVzY3JpcHRpb24gaW4gJ3JhZGVvbl9nZXRfc2hh
cmVkX25vbmRwX3BwbGwnCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbWJpb3NfY3J0
Yy5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbWJpb3NfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9hdG9tYmlvc19jcnRjLmMKaW5kZXggOTE4MTE3NTcxMDRjMC4uMTk3OWVkM2Q2NTQ3MiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tYmlvc19jcnRjLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tYmlvc19jcnRjLmMKQEAgLTE3ODcsNyArMTc4Nyw2
IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2dldF9zaGFyZWRfZHBfcHBsbChzdHJ1Y3QgZHJtX2NydGMg
KmNydGMpCiAgKiByYWRlb25fZ2V0X3NoYXJlZF9ub25kcF9wcGxsIC0gcmV0dXJuIHRoZSBQUExM
IHVzZWQgYnkgYW5vdGhlciBub24tRFAgY3J0YwogICoKICAqIEBjcnRjOiBkcm0gY3J0YwotICog
QGVuY29kZXI6IGRybSBlbmNvZGVyCiAgKgogICogUmV0dXJucyB0aGUgUFBMTCAoUGl4ZWwgUExM
KSB1c2VkIGJ5IGFub3RoZXIgbm9uLURQIGNydGMvZW5jb2RlciB3aGljaCBjYW4KICAqIGJlIHNo
YXJlZCAoaS5lLiwgc2FtZSBjbG9jaykuCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
