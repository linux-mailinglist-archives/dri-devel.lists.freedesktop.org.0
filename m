Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8529B2EF8B6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963DA6E8E8;
	Fri,  8 Jan 2021 20:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67CE6E8DC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:47 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id n16so7358777wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YEfovM2NKT8ag9TvqZ5TvTpEztKPhuBS/BnjHfStf3g=;
 b=qrFDHa6UMrCuOW/PtBirv0Ncr1vLCDJC57MzIwvydzI8tYtfDhmCZvdRcq+JEaYKFj
 j7lHElH8pycb5tVBNhvAACygNyfntQryXRiD4cAGiUtrML6OGIBkIDaIUyn/bH1pT3Nk
 mbEUKAeUZDcLk7U/O4lCYCQ20NPOfui8QBFwVFHzmaRu0QeeN2Og9A741HgBzdhG8grL
 0Fa4ls1CABD03p++A9w9y1DX1LB3k/YCpqruWCGpbWMhT8gYBlG0FkPBdY7CY2TJ6Rv7
 zdjgfbCO6oeuAuaxBG8OZL7CZTm5vMaWRgC+QgxY4dNb3Qyr3OJHAc71TYnJp9bl2noX
 xv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YEfovM2NKT8ag9TvqZ5TvTpEztKPhuBS/BnjHfStf3g=;
 b=bXhSqFzlKx/xjvnqNbcbpC0nyooZ5igGs4INdf9i9B7pLGGshPu4MsTVFqEZ/HUL8k
 L2hEllWSsU2eu+FN+KNqTxmc2LpU1Wc61Dkvr+mrm6jITMDVFs8SEYe5bXEgwQQxznHL
 duVJmHxWTHfYPGIKxvk5+M5zhd0G2E97ilXZ5BJSqGIMLcxQ6KmXBjhCU0iNRN946dHQ
 g/SKHgX8Sr3T6JTmEu03u5Xo/Wa4EzJbELkp9lLFvuudNFBARdoPtKgZuP22ssaXQGle
 ulzYE4ziTEmw1gzW8zM8UEeHeLaW+GzM4qAYuvbQDCM0Omo1dJmRA1jv51dknxbmwzib
 Kcgg==
X-Gm-Message-State: AOAM533mLHBATZiSA32YgafOYgRYurJ4J9vC/vcEKvMb6DDhquvLIkex
 JmDQPhFA0w0ZnhVq68WL89n0jw==
X-Google-Smtp-Source: ABdhPJyWNXAZMb17ssH50iSdT8H27rJjcQnuXfCL2ZQMggBqNfo6pnT2c08Z3ljkQNjZ2fHs49c11w==
X-Received: by 2002:a1c:87:: with SMTP id 129mr4460111wma.183.1610136946590;
 Fri, 08 Jan 2021 12:15:46 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 29/40] drm/amd/display/dc/dce/dce_dmcu: Staticify local
 function call 'dce_dmcu_load_iram'
Date: Fri,  8 Jan 2021 20:14:46 +0000
Message-Id: <20210108201457.3078600-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
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
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>, Leo Li <sunpeng.li@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2RtY3UuYzo3NDo2OiB3
YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZV9kbWN1X2xvYWRfaXJhbeKA
mSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2RtY3UuYzozMToKCkNjOiBI
YXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVu
Zy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+CkNjOiBLcnVub3NsYXYgS292YWMgPEtydW5vc2xhdi5Lb3ZhY0BhbWQuY29tPgpD
YzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1LmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1LmMKaW5kZXggZjNlZDhi
NjE5Y2FmZC4uZmEyYjQ3ZDQxZWUyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZS9kY2VfZG1jdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UvZGNlX2RtY3UuYwpAQCAtNzEsNyArNzEsNyBAQCBzdGF0aWMgYm9vbCBkY2VfZG1j
dV9pbml0KHN0cnVjdCBkbWN1ICpkbWN1KQogCXJldHVybiB0cnVlOwogfQogCi1ib29sIGRjZV9k
bWN1X2xvYWRfaXJhbShzdHJ1Y3QgZG1jdSAqZG1jdSwKK3N0YXRpYyBib29sIGRjZV9kbWN1X2xv
YWRfaXJhbShzdHJ1Y3QgZG1jdSAqZG1jdSwKIAkJdW5zaWduZWQgaW50IHN0YXJ0X29mZnNldCwK
IAkJY29uc3QgY2hhciAqc3JjLAogCQl1bnNpZ25lZCBpbnQgYnl0ZXMpCi0tIAoyLjI1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
