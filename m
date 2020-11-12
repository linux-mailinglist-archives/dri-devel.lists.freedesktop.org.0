Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8249B2B0D16
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79266E1D3;
	Thu, 12 Nov 2020 19:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816C16E314
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:00:49 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l1so7144201wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GWKMq1DqVP98QcoNoXmklvrAILj+KoFN9Nw2d/Tqn0c=;
 b=XQ8aimgR1HOHqJ2EoM1hF1fe6bOlASD4cH6EaZzEzLElHkGP0nIeMXYy3UmjbOO0QO
 lZtt2yakhfBPc/rnh+qCiNyTMP6Nfyk1sESI1z81+HRE88i1PC2XvmL13rioypDBsjtu
 L7MnFhT07OyuWQI7jeyGOclyWrH5+nWo6BK/XX8WeEjWw4CcxDQt6qG2M5Rkwh20ZbNM
 2s4s/JydD02pWOrDjpGemlFW7UEenR1SS9v5dcqwmLRGPempPP4HLsA0baBy5i1rV9on
 ccRf9OiI1ntTuy+b0QqUb1vxTPnSHhOetJ9FJ8UL1gpUWA9TyUkReWUooC2/a51aidOr
 TNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GWKMq1DqVP98QcoNoXmklvrAILj+KoFN9Nw2d/Tqn0c=;
 b=fg5RUgoN/Dq5GtS8iKMVIR8pkfef2lzohD/ZQF+rILq6j1kWUwd+ucMcxqbflTI9Dy
 RSDew0XXO+1Cxc3qROaDAVXe3soCd0RKZpiL6gaDJemzu0VFgYoE7+0Kpldy2CrsnbyE
 1U01utAL2OMQ6ERbW21PiR+1UPGgdaSqcZ4S0uJnmm4V0wo9jN033BwDiLI6IaheD/of
 xQ0lOET2QhZudQ4zCrxVuU0ZKHcpmpN3l2yQsVws0gvZxncuPE0cNC4PjrHj/spayLqk
 JYVSN5dj3Rjl/Q+rbPDu7ZnYkz9XWd1KO1fsHaPOvFreF+6RfYT2yctB0iQuIOJli9vx
 7Nkg==
X-Gm-Message-State: AOAM532orTslyG+EbKOkyh3Aq6G+38Ub30AHkMPT21Rgvv5YN0QBdOJF
 c435F0Vf1CDdDr5tSSMu74uc6g==
X-Google-Smtp-Source: ABdhPJwhzsVgAVaWzBvQEaXjElZKyqFVzX5Lr8qYHX0wE6B0MmSg0w8DqfbbSAyHCSTeiO0rfz/J5A==
X-Received: by 2002:adf:e787:: with SMTP id n7mr1161747wrm.153.1605207647964; 
 Thu, 12 Nov 2020 11:00:47 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:00:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/30] drm/v3d/v3d_gem: Provide descriptions for
 'v3d_lookup_bos's params
Date: Thu, 12 Nov 2020 19:00:12 +0000
Message-Id: <20201112190039.2785914-4-lee.jones@linaro.org>
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
