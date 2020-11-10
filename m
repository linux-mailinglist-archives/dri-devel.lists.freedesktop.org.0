Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE68E2ADF70
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145FC89BFC;
	Tue, 10 Nov 2020 19:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5279889C07
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:35 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o15so6165125wru.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5XOKsZA/efGGZlOKtpGd/v3CZQozhQA1lVakbps4Q9E=;
 b=He1zbyiMjWMGE0Hn/kJ/07B4HvpFF4l2fTCYTzQKm73uxkjgAjO49RrZRywLhDWfaH
 mwUj+LJz3HGK4QfSLcNaXCBytZS1llthv7u10eGTB373PipUwbEupelVcIq5Emg5XGDh
 Bcdhoy88TTDCPJeEjI9zrKilUdxFkSMMJtN7Pc9UPkc8pMoSvIPOi+Uoo7TKU96RG/FT
 2GAHytLMKR8eElYDMdfPYN5G7EMIy5w2B0a0ILkXtKkXEfgyzehz9JFZgpVbm9iCGsci
 Ov7rfylLaADoV7Jwk/GvUCXDXmaDoYOWHbOjRUzQqe1vqM5K679Kncl2/mopONbChafV
 qBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5XOKsZA/efGGZlOKtpGd/v3CZQozhQA1lVakbps4Q9E=;
 b=dAf+IfFadsC+6yCqkYUzU1zdweJr8Q4XXtXe5VvoPAi5vOHSGKpGYcaUt45mG916VA
 +VY9lpsDwj7d2UndwrAeJYg+vB4t0TgnS06FfX4ZSk+RzlA21suHaN/iRICnW1B0f1k2
 wnI1pbiYTFsjnci1iolhV2idLVXdilJU6BXwchsd4ABbyCPqk5T0rvcz4Rh4Oz/eBGCH
 QysB0dG0stwpCWZjUSwlKlyhAoM1+/EDspiA1pTwD264ilGvJxr6xHohj87wVRNegsXF
 ivIvI212nj9K4N0Eh/0AQkt74CXVJKW5R/X6l2pbZjE7QF0rLWdjatMRC+UzQTGgHB1x
 f9fQ==
X-Gm-Message-State: AOAM532um8iBg/AKWG7Y/u7kPdp4DIN1wHBZFAXuwAmngTueUJlUldw3
 QEfQV1F6avegDhfnDyJ8t52MmQ==
X-Google-Smtp-Source: ABdhPJxeAAo4Qn14VIx+iSnKxq73eLUxzVIPDWOXBuFMlEIUrORlJQbFdFaBUotDwNNiIK1H5ZjK6A==
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr16338979wrw.89.1605036693922; 
 Tue, 10 Nov 2020 11:31:33 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/30] drm/radeon/evergreen_dma: Fix doc-rot of function
 parameter 'resv'
Date: Tue, 10 Nov 2020 19:30:56 +0000
Message-Id: <20201110193112.988999-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5fZG1hLmM6MTEyOiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdyZXN2JyBub3QgZGVzY3JpYmVkIGluICdldmVyZ3JlZW5fY29w
eV9kbWEnCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9kbWEuYzoxMTI6IHdhcm5p
bmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2ZlbmNlJyBkZXNjcmlwdGlvbiBpbiAnZXZl
cmdyZWVuX2NvcHlfZG1hJwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4K
Q2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1t
bS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2RtYS5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5fZG1hLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9kbWEuYwppbmRleCBhNDZlZTZjMjA5OWRkLi43
Njc4NTdkNGE4YzVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVl
bl9kbWEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9kbWEuYwpAQCAt
OTgsNyArOTgsNyBAQCB2b2lkIGV2ZXJncmVlbl9kbWFfcmluZ19pYl9leGVjdXRlKHN0cnVjdCBy
YWRlb25fZGV2aWNlICpyZGV2LAogICogQHNyY19vZmZzZXQ6IHNyYyBHUFUgYWRkcmVzcwogICog
QGRzdF9vZmZzZXQ6IGRzdCBHUFUgYWRkcmVzcwogICogQG51bV9ncHVfcGFnZXM6IG51bWJlciBv
ZiBHUFUgcGFnZXMgdG8geGZlcgotICogQGZlbmNlOiByYWRlb24gZmVuY2Ugb2JqZWN0CisgKiBA
cmVzdjogcmVzZXJ2YXRpb24gb2JqZWN0IHdpdGggZW1iZWRkZWQgZmVuY2UKICAqCiAgKiBDb3B5
IEdQVSBwYWdpbmcgdXNpbmcgdGhlIERNQSBlbmdpbmUgKGV2ZXJncmVlbi1jYXltYW4pLgogICog
VXNlZCBieSB0aGUgcmFkZW9uIHR0bSBpbXBsZW1lbnRhdGlvbiB0byBtb3ZlIHBhZ2VzIGlmCi0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
