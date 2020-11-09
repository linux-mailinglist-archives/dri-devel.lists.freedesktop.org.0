Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F52AC6D3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B628926F;
	Mon,  9 Nov 2020 21:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A422B89145
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:19:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h62so911426wme.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 13:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mzXhCpiCwfXhn5UZVrUN8y55iF7Guz7qLR0QXW6Magc=;
 b=E9yOQdMhotNG/FmE2dQJiD0qZR2wVPwJ5vehlHuLTLfjg1jR9o5wsvjApIc0HsAoaZ
 8qkna1nD8pDl/vM/3OBHtp/FmUb2nst5uLUBWgGS6fKuFHw/7kaia+s30iU85HXrgJ2d
 W+AsyMp7+7a2eiwEY49kWaRTKHSfjRPq/fnNRWjEYHm29TrLP53ZF7vB0FubYev+Fb2b
 Zh7m6Bpat6KyzNntvJ5HdJsheSg03sQOSHUslkzMUOhFnBsVIscuSdJVUrqOivIRbb21
 wGeWuPmoWkWfZSKBsErebYJ/J5S6cHJnNh+7AOgnAtr0I/PNy+e4jUw2i/WQqXZ1HpP8
 BmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mzXhCpiCwfXhn5UZVrUN8y55iF7Guz7qLR0QXW6Magc=;
 b=Tb/9xAB18unG6JnRZj3qWF9K8jkAwYMvHd2jRejM/laH/9r//3Q0LwsfiZIF/90VYv
 OuzjgFxBFYwUvliX8Z7fVMooLKHVqKkc80qrm+xVcmBigUfUJFTegsM2ZyHQjQTXk81s
 GvrS1BTExsspB3y71s6SqMXz7/JOCQT/H+8qakS1kANVAcamXoswRc0niKJakgFmSUiJ
 ddrIIFSQKw2a+6R/Gi0xB1L/TZWOud1Vib1ZB6sn7kcwpxu5UrjB1Nplln2fALwzUM2P
 HNb3P9GauTsQkghdUG8kDKQcwQKhC5bNrK6+Fg/BaQRnm7G3AGY1sNq5gRMfqkL1VDcK
 a6zA==
X-Gm-Message-State: AOAM533i3p5qgyNY2Jn1u+Kit7uf4NOtJni7mOUWIuj1vrTOeZn7rVCc
 H42k/AmuZZN15KLhnAU/XzmcLQ==
X-Google-Smtp-Source: ABdhPJz7gosq03zFigv4Og0US7gk4Sex1qokBiUld+OMUY44DLZUxJaFKrfBrf69+FZ+3dQiMYRZLQ==
X-Received: by 2002:a7b:c5c3:: with SMTP id n3mr1133832wmk.44.1604956761276;
 Mon, 09 Nov 2020 13:19:21 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:19:20 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/20] drm/radeon/radeon_display: Remove unused variable 'mod'
Date: Mon,  9 Nov 2020 21:18:42 +0000
Message-Id: <20201109211855.3340030-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
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
 Alex Deucher <alexander.deucher@amd.com>,
 report to <xorg-driver-ati@lists.x.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jOiBJbiBmdW5jdGlvbiDigJhyYWRlb25f
ZGl24oCZOgogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jOjEwOTQ6MTE6
IHdhcm5pbmc6IHZhcmlhYmxlIOKAmG1vZOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4K
Q2M6IHJlcG9ydCB0byA8eG9yZy1kcml2ZXItYXRpQGxpc3RzLngub3JnPgpDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5s
aW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jIHwgNCArLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jCmluZGV4IGJkNjBmMTZmZDBkNzguLjc4ZmNlZWRm
ZDkyNTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMKQEAgLTEwOTEs
MTEgKzEwOTEsOSBAQCB2b2lkIHJhZGVvbl9jb21wdXRlX3BsbF9hdml2byhzdHJ1Y3QgcmFkZW9u
X3BsbCAqcGxsLAogLyogcHJlLWF2aXZvICovCiBzdGF0aWMgaW5saW5lIHVpbnQzMl90IHJhZGVv
bl9kaXYodWludDY0X3QgbiwgdWludDMyX3QgZCkKIHsKLQl1aW50NjRfdCBtb2Q7Ci0KIAluICs9
IGQgLyAyOwogCi0JbW9kID0gZG9fZGl2KG4sIGQpOworCWRvX2RpdihuLCBkKTsKIAlyZXR1cm4g
bjsKIH0KIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
