Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B930D2B4DD0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684E56E9F7;
	Mon, 16 Nov 2020 17:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C0D6EA03
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s13so35749wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GWKMq1DqVP98QcoNoXmklvrAILj+KoFN9Nw2d/Tqn0c=;
 b=AZkL0vTTyxk+qn+knrS8JsKh1uX3JBdQV4cxD+BFOWtzaAEZHcJTPFTQTvPiJ+r9MB
 R9rVcYw0cx5xl+uHxcqnLOALxHvDCZOa8wqgvrF1rI7L1Z8dpVX4tYYGBmieDCxg6oV0
 UphxExobgaBvDGn7ZVAN3hpfhT42SJ6wGLomRfx+Wt03bfTFHyOKa79p645Th2ypthB1
 Mbw3pUBRrTA3DGLEu54EWLo6MlZP0u0HkSHy59FpWyhpNuciXw6YOZ+RULCIaHLnrFMJ
 vOwKxOCJWsEiUgbxu0qVsSV48yHmuGEll17GvLRFEncNv3ztpazHJRjLAEg/kRzW/h4O
 k6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GWKMq1DqVP98QcoNoXmklvrAILj+KoFN9Nw2d/Tqn0c=;
 b=EHOtg1HIBrgl82Pl6/bbE3URAQq/8S5NalGE45+U5dYFgf3ddP2/AtBJvqPdW3f4bi
 qLHTY3R8fLAksH8zFqzOVbMB2XDUBC7e2CkZECasujxDP8bioVuwHmhu4QK0ICbINB0z
 tyfg3iU73FrwoWJF9UgeBiWO6QVxJ+r3aVSa00zblwWkW7VrTpw6LJ//l7+7wC0ZT2Lv
 32ypFSEfJdEbBDAtWNhIAB+H5J5x0Rc7WmC9w1ejjWlZknqq/C2IcjKuNHIi/OmPUTT1
 aHE8vic/em5Ezm8yGK4joEqzxwaBJbOz4qIyVY8CippcdK/rnxSHNpr9HyCTMTZ5Ghht
 /Tkg==
X-Gm-Message-State: AOAM531VmeYgFtUeYkG/LmZ9+R5yIPUk1Lv+od/3KWxFbCq+ba1FGa1S
 CfZZnp0TWp7XoBshMjxOxFD1Ig==
X-Google-Smtp-Source: ABdhPJxa2OYyT+kPM38xMqaqvVdak1kEsguesAO3rvzYZo5Fy8xTslicZ8z9OmMrZSCfUnFEO9Jcdw==
X-Received: by 2002:a7b:c18e:: with SMTP id y14mr7522137wmi.123.1605548529946; 
 Mon, 16 Nov 2020 09:42:09 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:09 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 35/42] drm/v3d/v3d_gem: Provide descriptions for
 'v3d_lookup_bos's params
Date: Mon, 16 Nov 2020 17:41:05 +0000
Message-Id: <20201116174112.1833368-36-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3YzZC92M2RfZ2VtLmM6MjkyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIg
b3IgbWVtYmVyICdib19oYW5kbGVzJyBub3QgZGVzY3JpYmVkIGluICd2M2RfbG9va3VwX2JvcycK
IGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jOjI5Mjogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAnYm9fY291bnQnIG5vdCBkZXNjcmliZWQgaW4gJ3YzZF9sb29rdXBf
Ym9zJwoKQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+CkNjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNj
OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogU3VtaXQgU2Vtd2Fs
IDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxp
bmFyby5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9n
ZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jCmluZGV4IDE4MmM1ODY1MjVlYjgu
LjRlYjM1NDIyNjk3MjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jCkBAIC0yNzUsNiArMjc1LDggQEAg
djNkX2xvY2tfYm9fcmVzZXJ2YXRpb25zKHN0cnVjdCB2M2Rfam9iICpqb2IsCiAgKiBAZGV2OiBE
Uk0gZGV2aWNlCiAgKiBAZmlsZV9wcml2OiBEUk0gZmlsZSBmb3IgdGhpcyBmZAogICogQGpvYjog
VjNEIGpvYiBiZWluZyBzZXQgdXAKKyAqIEBib19oYW5kbGVzOiBHRU0gaGFuZGxlcworICogQGJv
X2NvdW50OiBOdW1iZXIgb2YgR0VNIGhhbmRsZXMgcGFzc2VkIGluCiAgKgogICogVGhlIGNvbW1h
bmQgdmFsaWRhdG9yIG5lZWRzIHRvIHJlZmVyZW5jZSBCT3MgYnkgdGhlaXIgaW5kZXggd2l0aGlu
CiAgKiB0aGUgc3VibWl0dGVkIGpvYidzIEJPIGxpc3QuICBUaGlzIGRvZXMgdGhlIHZhbGlkYXRp
b24gb2YgdGhlIGpvYidzCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
