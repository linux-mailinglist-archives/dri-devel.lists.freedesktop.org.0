Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4E02F1EE1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AB48972C;
	Mon, 11 Jan 2021 19:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ACF89E50
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id y23so302286wmi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ygXlsea1j1ghgNQFnw1H978M537fO8hMkf4tF7c92PM=;
 b=l0mLo+tzQpWlBoBKL8Z4VS6/DvkWb/hffm4vC/r93BqpOCEZdmRsBfHgyK8eshU4Bl
 TRdKZu029FApVLQljGUcOiDQZOf2MNdy6xwE4jnB/A52Uhh12zl2WmZM8Z8FPQOPL2i4
 KZyFU89I2pMZkvclUC3cykkzxTJfVOawLn2G7MsvDRx5Lma4fT9Fa6NFfC7edyK+/Q/J
 DhA7oShBVnCM7dVCk09xik4NVAdIVAeLquxLdHHGFhfXjKhDoC5Nil5a4LWPhKYcAEuW
 Q5HlB32YtHtiUAAtlyA4pbNyBcRwRO7A2gXKyB7OAaTUvFW5vr/8nj7aBHHatEEvWhkQ
 brwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ygXlsea1j1ghgNQFnw1H978M537fO8hMkf4tF7c92PM=;
 b=cCQMwFQ2Lur/T6dVxz6x1MHZrrsYmTfWYMUJUin9rV1iJfaytaEFXqotbP0z9NSAtR
 GrT01ha71DrIs5vAQxP3hJ7Qb8ihx/+0KVvCThyGMdiY6RbGFr3Mw5PqDsCGbkD3M/tz
 64sWk0tF+aiFsDUPebLPxGjwcaGX9e4U1MWoClxIMq6DvpvXcg2fR0Vyel5daAAXd7Ep
 wfh3VqL30TiI62mzH/WXPkHk0wrKXJsyVYm4vpJ/8PhgReLs8QYUNO6eFRUJbbU+J8FZ
 lxX9hKJfWeORAo1BhPR9KHCNDStHr1kcX/BwDSVZm+1hCWsYWsKFcfGVnpVLddL2A4hR
 B0wg==
X-Gm-Message-State: AOAM532EtoAorP1fMFH8M/zxb1cm0qOWQJ/jpkjDoZU3+ej3Sl4Fonex
 RzHs6trFCUCiZbhoSX4ZnyPF0Q==
X-Google-Smtp-Source: ABdhPJzrrPnEkqyVVOgksMUOoP+NL4WzUV16TJPxHXMKFD4NTKigi8F1CQ0Gu+lQN3c09XAbusBcYw==
X-Received: by 2002:a1c:6446:: with SMTP id y67mr281642wmb.144.1610392791539; 
 Mon, 11 Jan 2021 11:19:51 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/40] drm/amd/display/dc/dce120/dce120_timing_generator:
 Demote non-kerneldoc headers
Date: Mon, 11 Jan 2021 19:19:02 +0000
Message-Id: <20210111191926.3688443-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3RpbWluZ19n
ZW5lcmF0b3IuYzo2MDI6MTM6IHdhcm5pbmc6IOKAmGRjZTEyMF90aW1pbmdfZ2VuZXJhdG9yX2dl
dF9wb3NpdGlvbuKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfdGlt
aW5nX2dlbmVyYXRvci5jOjczOiB3YXJuaW5nOiBDYW5ub3QgdW5kZXJzdGFuZCAgKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNl
MTIwL2RjZTEyMF90aW1pbmdfZ2VuZXJhdG9yLmM6NTkzOiB3YXJuaW5nOiBDYW5ub3QgdW5kZXJz
dGFuZCAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioKCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2Vu
dGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWci
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UxMjAvZGNlMTIwX3RpbWluZ19nZW5lcmF0b3IuYyAgIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3RpbWluZ19nZW5lcmF0b3Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3RpbWluZ19n
ZW5lcmF0b3IuYwppbmRleCBlYmM3ZDYxZThiZjM2Li5kMDJlY2I5ODNjOWNkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF90aW1pbmdfZ2Vu
ZXJhdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2Ux
MjBfdGltaW5nX2dlbmVyYXRvci5jCkBAIC02OSw3ICs2OSw3IEBACiAjZGVmaW5lIENSVENfUkVH
X1NFVF8zKHJlZywgZmllbGQxLCB2YWwxLCBmaWVsZDIsIHZhbDIsIGZpZWxkMywgdmFsMykJXAog
CQlDUlRDX1JFR19TRVRfTihyZWcsIDMsIEZEKHJlZyMjX18jI2ZpZWxkMSksIHZhbDEsIEZEKHJl
ZyMjX18jI2ZpZWxkMiksIHZhbDIsIEZEKHJlZyMjX18jI2ZpZWxkMyksIHZhbDMpCiAKLS8qKgor
LyoKICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKgogICogIEZ1bmN0aW9uOiBpc19pbl92ZXJ0aWNhbF9i
bGFuawogICoKQEAgLTU4OSw3ICs1ODksNyBAQCBzdGF0aWMgdm9pZCBkY2UxMjBfdGltaW5nX2dl
bmVyYXRvcl9zZXRfZHJyKAogCX0KIH0KIAotLyoqCisvKgogICoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
CiAgKiAgRnVuY3Rpb246IGRjZTEyMF90aW1pbmdfZ2VuZXJhdG9yX2dldF9wb3NpdGlvbgogICoK
LS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
