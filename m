Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4932B1C41
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168B86E4DD;
	Fri, 13 Nov 2020 13:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F356E4EC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:06 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c9so8201424wml.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46jV9p3NGfHHD7RmZzAF9wCbEXnPQwL3oGoQw/6SZqY=;
 b=jcRc33FqvvXfYZDq2w/hkAOKcF2M6UsYfjQCTBQFmt48Mc/W99snUkSH56/FCyd/sR
 2Icd+6Ibx5xO76vEda91ScW6Obx+2JGyG53DC8PMv/rJQHZCkXaJ2jV3ZsFYzX47Gr/Y
 Ydzw+SuXuP0MYCj+U+iC/209+05xF7z+uajdM4hrF7mw9iWqkycWyjqK/OnZ4XgHuNbT
 s7bFMXSTomsPs8pw3U3BmBp+X+CX8onf+3Wt+M/rszLw4RmUWR4fLEeMphKfw0MltKh4
 nzOAPpOhj5Vnrsr6KrPvwgDOntRpLtFNJy73zF+W6qs6FQ4HgUtNRQqTrb0LcGOnx9Aw
 Lazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46jV9p3NGfHHD7RmZzAF9wCbEXnPQwL3oGoQw/6SZqY=;
 b=rxvwfFMdgp3t0NiPvpxXIxVG38r1BNQE3dLrmeSj9EJ1WeUQrxuHtiu+Wb9rKHg+xV
 beP6u6ZZI/90X6T5wBjplEpy7FNnIZKMfVIQ/WApRTQ4zi4ulJ63T3Zj3AdguI3lSGvy
 bTgqYI9/asnRan8WcgDrPbnESIV3Xj2KC4atnIGmsgVoMTZfSCpAqqfdaWzZODxK/tgz
 zEtVTy8O0jauAN/hgMDQ6s4SvJ/0V1RzBWLLeilNfCGbkZnzDLXoaTY9NEmWxZ1r0K9u
 RwaFkx7X+BdF4sfz65YHf1cTWrhyqhIx8f72RH3nl9CfOU+ERi+VUme7pKbXDc2NJ2p6
 MG7g==
X-Gm-Message-State: AOAM532u2znsbVdvrb/+Qi46VmfP3oFYd6DzVjqyefnnNsJn8uysBhvp
 2Ki4b8DNwtRS6XCwxmr2lvwIJw==
X-Google-Smtp-Source: ABdhPJzM5M9flHKJZbmEjS7wmST4v4wEJvRBKQxhpv+CufNQVMmQ8o5VuNY71S/H5cFSMz0jXMkYxg==
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr2635450wmq.178.1605275405100; 
 Fri, 13 Nov 2020 05:50:05 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:04 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/40] drm/amd/amdgpu/amdgpu_vram_mgr: Add missing
 descriptions for 'dev' and 'dir'
Date: Fri, 13 Nov 2020 13:49:17 +0000
Message-Id: <20201113134938.4004947-20-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmM6NjQ4OiB3YXJuaW5nOiBGdW5j
dGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdkZXYnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV92
cmFtX21ncl9mcmVlX3NndCcKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFt
X21nci5jOjY0ODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZGlyJyBu
b3QgZGVzY3JpYmVkIGluICdhbWRncHVfdnJhbV9tZ3JfZnJlZV9zZ3QnCgpDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIHwgMiArKwogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92cmFtX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZyYW1fbWdyLmMKaW5kZXggYzk5YzIxODA3ODVmZS4uZDJkZTJhNzIwYTNkOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKQEAgLTYzNyw2ICs2Mzcs
OCBAQCBpbnQgYW1kZ3B1X3ZyYW1fbWdyX2FsbG9jX3NndChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKICAqIGFtZGdwdV92cmFtX21ncl9mcmVlX3NndCAtIGFsbG9jYXRlIGFuZCBmaWxsIGEg
c2cgdGFibGUKICAqCiAgKiBAYWRldjogYW1kZ3B1IGRldmljZSBwb2ludGVyCisgKiBAZGV2OiBk
ZXZpY2UgcG9pbnRlcgorICogQGRpcjogZGF0YSBkaXJlY3Rpb24gb2YgcmVzb3VyY2UgdG8gdW5t
YXAKICAqIEBzZ3Q6IHNnIHRhYmxlIHRvIGZyZWUKICAqCiAgKiBGcmVlIGEgcHJldmlvdXNseSBh
bGxvY2F0ZSBzZyB0YWJsZS4KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
