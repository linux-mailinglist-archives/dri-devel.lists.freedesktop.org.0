Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DEC2F1EDB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A83089E19;
	Mon, 11 Jan 2021 19:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F68989DFE
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:44 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r3so958979wrt.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a2Y1r1imcED85eFixB5AGXQS5WVhMYvk3Zres7MALT0=;
 b=A9a7/txq8Sk8aZPWjqlVS7sQ7X76uzBkQT+uQKbCuBAo6drReTQXWZzzobNcV+49OM
 pvmfjOh3M1yF+g53OxFNO/eVMX/9KDnyoXnJvlMGgp9k5u+2lbEQwmsAiQ+qTe0z4720
 h4sAgdSkVS4WAaju+KzUlV5nDOxBJwQN1H4rB7+H3WeuPQVHAl53ZfPgPt9lvOMG9CqD
 +nMhXKTCFutgeUQqBtyIO5KKAv6e7VamtSiG1HwXUi6EbynxBAZgFFmsZTUMwlIvf0ku
 Ehr+GTNdqFcdN83P3mFAC3mZ/ZuK6kDWklTQaSJBI4NWhVdL1LGS2VZl+jp8araC7iay
 v2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a2Y1r1imcED85eFixB5AGXQS5WVhMYvk3Zres7MALT0=;
 b=rfiKXMjQJsJy8+vWP1kcHLoIiyHaZ+yR55qSYDa3iUSKztzxbHOsz4enmaAOYDQGwr
 /uubIRgBxRWMNpq0H6c2bCZuhptwbOUWBfpcpAUfmWaf3XbarFFLoCHui7AeDi6C/l8B
 h78mKqlLJR4QpYlwgkkEiimTCt3daCD2Jp9j9j0nWvyi8DiAvAS4O+Lc92J7c2Jn72UI
 d/4kt8c4GDk9s6PHjiuKvn6bnmoHhBzYfpkjCwjT4pJXpX/HoiGcz8q14Ok+unr6eDpM
 iHPkF2B9JGFwrloeW87FXPjgmsHPSfxCOGN5H2Zi2saxbt7B/zimKqiiDh/CGTWj4aMe
 4QkQ==
X-Gm-Message-State: AOAM532lRqy3cykUdMtOKDFgSpJiWehnaZZx/kjOux7YXfgmgJ++Fw6F
 mnCGwGmb1dcgNKqjoriczTywiw==
X-Google-Smtp-Source: ABdhPJxMkvS+0WgCtIpMj49T+7z6ZxDRGngvPDkgDzadkF0BRqZKDE3Fxouh4Z8iFzMsZ6o+KiI48Q==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr565190wrt.425.1610392783332; 
 Mon, 11 Jan 2021 11:19:43 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 10/40] drm/amd/display/dc/dce120/dce120_hw_sequencer:
 Encompass defines in same clause as their use
Date: Mon, 11 Jan 2021 19:18:56 +0000
Message-Id: <20210111191926.3688443-11-lee.jones@linaro.org>
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

SWRlYWxseSBzb21lb25lIHNob3VsZCBzdHJpcC1vdXQgYWxsIHRoZXNlIGdhcmJhZ2UgJ2lmIDAn
cy4KClRlbXB0ZWQgdG8gY2Fycnkgb3V0IHRoZSB3b3JrIG15c2VsZiBvbiBwcmluY2lwbGUhCgpG
aXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfaHdfc2VxdWVu
Y2VyLmM6NTM6NDc6IHdhcm5pbmc6IOKAmHJlZ19vZmZzZXRz4oCZIGRlZmluZWQgYnV0IG5vdCB1
c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5
LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9od19zZXF1ZW5jZXIu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIw
X2h3X3NlcXVlbmNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9k
Y2UxMjBfaHdfc2VxdWVuY2VyLmMKaW5kZXggNjZhMTNhYTM5Yzk1MS4uZDRhZmU2YzgyNGQyYyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBf
aHdfc2VxdWVuY2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEy
MC9kY2UxMjBfaHdfc2VxdWVuY2VyLmMKQEAgLTUwLDYgKzUwLDcgQEAgc3RydWN0IGRjZTEyMF9o
d19zZXFfcmVnX29mZnNldHMgewogCXVpbnQzMl90IGNydGM7CiB9OwogCisjaWYgMAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBkY2UxMjBfaHdfc2VxX3JlZ19vZmZzZXRzIHJlZ19vZmZzZXRzW10gPSB7
CiB7CiAJLmNydGMgPSAobW1DUlRDMF9DUlRDX0dTTF9DT05UUk9MIC0gbW1DUlRDMF9DUlRDX0dT
TF9DT05UUk9MKSwKQEAgLTc5LDcgKzgwLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkY2UxMjBf
aHdfc2VxX3JlZ19vZmZzZXRzIHJlZ19vZmZzZXRzW10gPSB7CiAvKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKgogICogUHJpdmF0ZSBkZWZpbml0aW9ucwogICoqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KLSNp
ZiAwCiBzdGF0aWMgdm9pZCBkY2UxMjBfaW5pdF9wdGUoc3RydWN0IGRjX2NvbnRleHQgKmN0eCwg
dWludDhfdCBjb250cm9sbGVyX2lkKQogewogCXVpbnQzMl90IGFkZHI7Ci0tIAoyLjI1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
