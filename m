Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 155342B4D43
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD7A6E090;
	Mon, 16 Nov 2020 17:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA226E061
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:30 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m6so2456059wrg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uPrx+xhJSBB8cqNRTfRxpV861JL0F49FY7TxVtUc7KQ=;
 b=u31O7pj1zGDcrio/FSlsCBviO7IM8g6lQEnTygECI/nuOgTKY4r0NhHol9iTNLGAn+
 zdLph8fd3Yuh5ALkDKEgxnNG18QYa0bsD7qhmJeuL69Mb72Gr7aBgJip239aK5NAxjs8
 bwmKEWSGIl80oReFzD5dPK4o61T22DBvKtr/Ld97VBLSmDf/T7Qe49a2nsurDTjVNSSP
 d45/vKLH6geRF9spJ2Zzz9ibSFfV7qMS1hWPotwBvP0TCMhLJL+wYrqQCZ9jAz3ZAxka
 tQniI5JB4SFW/5S3t/97fz3dr+LiWmC/rvEilaMRA/NEEYJvS1K5XYJQ4LeiDkKq7xyr
 uBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uPrx+xhJSBB8cqNRTfRxpV861JL0F49FY7TxVtUc7KQ=;
 b=oXphnmvudBEggkkhuNf1aOa1Mm1iyHKKOhHV2vgRI9UNzrmr0dbyamvQB9qkXD0gxb
 5QVCG7LdH9yT0voTVMuxlsaWoPdyQatUvClWZIrcM9pvrueF0L9qqexN5FK6BS7BCdqU
 QyLrwxpSej2bIdbZ1zby28x38yocVySzAT/7PE8t0gvWZyhFfeZALooDt8nxWeza4kHj
 w3vOvOJRKocmutjqinYU8M+1EJM4gdFpqz3kc7XTxq3uyzxYVwgl4VQsftaEL7+ulyix
 OVJXLa/jX0FbB6C9gW3awpxeNWvexjT4I14xP78zZ4doD8N1glbfmeXqeCuwcKhTWCMg
 kC5g==
X-Gm-Message-State: AOAM532gHSbeAb5PHl1rc6jLAQL15s5pTj5PZuvIFZjNXdNOclHxjg4E
 owCfMtr/39pNXEDp74n92LLi3g==
X-Google-Smtp-Source: ABdhPJzCHDkei2JEkX1GB2GW8T/eLFBIz2InwIuHUVRCrc6XXSR/icg3z1DWHJMy3glbmKvXNjAaew==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr20117035wrq.236.1605548249538; 
 Mon, 16 Nov 2020 09:37:29 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/43] drm/radeon/ni_dpm: Move 'ni_get_{pi,
 ps}()'s into shared header
Date: Mon, 16 Nov 2020 17:36:36 +0000
Message-Id: <20201116173700.1830487-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9uaV9kcG0uYzo3Mjc6MjM6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHBy
b3RvdHlwZSBmb3Ig4oCYbmlfZ2V0X3Bp4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIDcyNyB8
IHN0cnVjdCBuaV9wb3dlcl9pbmZvICpuaV9nZXRfcGkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJk
ZXYpCiB8IF5+fn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9uaV9kcG0uYzo3MzQ6MTU6
IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYbmlfZ2V0X3Bz4oCZIFstV21p
c3NpbmctcHJvdG90eXBlc10KIDczNCB8IHN0cnVjdCBuaV9wcyAqbmlfZ2V0X3BzKHN0cnVjdCBy
YWRlb25fcHMgKnJwcykKIHwgXn5+fn5+fn5+CgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
bmlfZHBtLmggfCAzICsrKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYyB8IDMgKy0t
CiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pX2RwbS5oIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9uaV9kcG0uaAppbmRleCA2YmJlZTkxODA5MDllLi43NGUzMDE5MzY5MDYzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pX2RwbS5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vbmlfZHBtLmgKQEAgLTI0Nyw0ICsyNDcsNyBAQCB2b2lkIG5pX3NldF91dmRf
Y2xvY2tfYWZ0ZXJfc2V0X2VuZ19jbG9jayhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKIAog
Ym9vbCBuaV9kcG1fdmJsYW5rX3Rvb19zaG9ydChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7
CiAKK3N0cnVjdCBuaV9wb3dlcl9pbmZvICpuaV9nZXRfcGkoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYpOworc3RydWN0IG5pX3BzICpuaV9nZXRfcHMoc3RydWN0IHJhZGVvbl9wcyAqcnBzKTsK
KwogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYwppbmRleCBhODBhMjE0NDdhNzZkLi5jNjhh
YjJmYjFhYzIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmMKQEAgLTMwLDYgKzMwLDcgQEAKICNp
bmNsdWRlICJydjc3MC5oIgogI2luY2x1ZGUgInJhZGVvbi5oIgogI2luY2x1ZGUgInJhZGVvbl9h
c2ljLmgiCisjaW5jbHVkZSAibmlfZHBtLmgiCiAjaW5jbHVkZSAic2lfZHBtLmgiCiAjaW5jbHVk
ZSAic2lkLmgiCiAKQEAgLTE3MTksOCArMTcyMCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2lf
cG93ZXJ0dW5lX2RhdGEgcG93ZXJ0dW5lX2RhdGFfaGFpbmFuID0KIH07CiAKIHN0cnVjdCBldmVy
Z3JlZW5fcG93ZXJfaW5mbyAqZXZlcmdyZWVuX2dldF9waShzdHJ1Y3QgcmFkZW9uX2RldmljZSAq
cmRldik7Ci1zdHJ1Y3QgbmlfcG93ZXJfaW5mbyAqbmlfZ2V0X3BpKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKLXN0cnVjdCBuaV9wcyAqbmlfZ2V0X3BzKHN0cnVjdCByYWRlb25fcHMgKnJw
cyk7CiAKIGV4dGVybiBpbnQgc2lfbWNfbG9hZF9taWNyb2NvZGUoc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpOwogZXh0ZXJuIHZvaWQgdmNlX3YxXzBfZW5hYmxlX21nY2coc3RydWN0IHJhZGVv
bl9kZXZpY2UgKnJkZXYsIGJvb2wgZW5hYmxlKTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
