Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AC02AFF1
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 10:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CF58994D;
	Mon, 27 May 2019 08:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D3289838;
 Mon, 27 May 2019 08:19:17 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y3so15204705wmm.2;
 Mon, 27 May 2019 01:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YqbHVq5QUABl2P9Yv89r7+mrOBqsSmMjqGDxZ3MKSaI=;
 b=Mft8WsZYYYDr/jJFAV/mAkmTCg6pA3LY6TVP0fYyM1Ul1frZmwr/6BuWpRMwfi24MQ
 W25ktC/4SYYQbuZMzgiSG4XDISvpVtEtMvnJAr/kTCcgbRhiIbcVe0+hKJbIvUsKApJI
 B4rAFdpxtiIBgxZJvh+f0PIl7VWh7/Qu3q4L3E6h1dCm28cmTVVSo/8sSysxV8L86VQs
 7axYEsu2qvZ5xaRxaEkMrOaR8r75ZF/Dt04YAsMZaxplAStrBwhyC8cNMeM6h3Ik4/8U
 y0ZkzAdFT3jiU4BOJ1tYiuZius+/ffeOd96l71XceQouFkzEhUKNHynWmEREGBfiXkhY
 p+MA==
X-Gm-Message-State: APjAAAXvmh8WKbxPOJprr03pLgIa0pn4kaNnymABe8ZiU5K/yLv8lRt2
 BgwAhFKSHF2mrZyg1iu95DE9/CRk
X-Google-Smtp-Source: APXvYqzMAY82FdaZxpr6+J+7Ij1Skdd4lNvE7yNQY8NWQEUaVDaszF01tPS0FeXynIxWoQkhOX5FgA==
X-Received: by 2002:a1c:ca0b:: with SMTP id a11mr26365524wmg.52.1558945155520; 
 Mon, 27 May 2019 01:19:15 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id a124sm7511876wmh.3.2019.05.27.01.19.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 01:19:15 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/13] drm/etnaviv: drop DRM_AUTH usage from the driver
Date: Mon, 27 May 2019 09:17:31 +0100
Message-Id: <20190527081741.14235-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527081741.14235-1-emil.l.velikov@gmail.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YqbHVq5QUABl2P9Yv89r7+mrOBqsSmMjqGDxZ3MKSaI=;
 b=hqrH1vmVkL61um7n9rCaWixSzOmReSb23vvnn7yiOxnRwZV8GjqD7b7mq9JHRc+iyz
 d3I8SLBssTPML6Zm+wKV7W42uPcF1446L6Kq9T6IxYO30ZaSHw/FA7i7tFyHOi5Kcpfx
 xAEJT6eIFFzDFw5NPplvkwDAK39xQXK3E9PrLyIrrA9khSqrIn/7678SFCkxOiTM5Nvn
 coMccJnsityP1ZVyPCGq6CDHv0kxPrtjs0BtIlMzJXiX0oVfvuzjexzBAT+JKruHcJg8
 4ZIzoHqlEIK4oO/2L0WexcjKbCdbItBTw3o2CHhbwaUBTEaEJIR9iBjBMoYt+ImZ0ASY
 Z23g==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
 etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClRoZSBhdXRo
ZW50aWNhdGlvbiBjYW4gYmUgY2lyY3VtdmVudGVkLCBieSBkZXNpZ24sIGJ5IHVzaW5nIHRoZSBy
ZW5kZXIKbm9kZS4KCkZyb20gdGhlIGRyaXZlciBQT1YgdGhlcmUgaXMgbm8gZGlzdGluY3Rpb24g
YmV0d2VlbiBwcmltYXJ5IGFuZCByZW5kZXIKbm9kZXMsIHRodXMgd2UgY2FuIGRyb3AgdGhlIHRv
a2VuLgoKQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpDYzogQ2hyaXN0
aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4KQ2M6IGV0bmF2aXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IEVtaWwgVmVs
aWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9kcnYuYyB8IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9kcnYuYwppbmRleCA3ZWI3Y2Y5YzNmYTguLmEzMDc2NzA0YmE0ZiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5jCkBAIC00MzAsMTcgKzQzMCwxNyBAQCBz
dGF0aWMgaW50IGV0bmF2aXZfaW9jdGxfcG1fcXVlcnlfc2lnKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHZvaWQgKmRhdGEsCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9pb2N0bF9kZXNjIGV0bmF2
aXZfaW9jdGxzW10gPSB7CiAjZGVmaW5lIEVUTkFfSU9DVEwobiwgZnVuYywgZmxhZ3MpIFwKIAlE
Uk1fSU9DVExfREVGX0RSVihFVE5BVklWXyMjbiwgZXRuYXZpdl9pb2N0bF8jI2Z1bmMsIGZsYWdz
KQotCUVUTkFfSU9DVEwoR0VUX1BBUkFNLCAgICBnZXRfcGFyYW0sICAgIERSTV9BVVRIfERSTV9S
RU5ERVJfQUxMT1cpLAotCUVUTkFfSU9DVEwoR0VNX05FVywgICAgICBnZW1fbmV3LCAgICAgIERS
TV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAotCUVUTkFfSU9DVEwoR0VNX0lORk8sICAgICBnZW1f
aW5mbywgICAgIERSTV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAotCUVUTkFfSU9DVEwoR0VNX0NQ
VV9QUkVQLCBnZW1fY3B1X3ByZXAsIERSTV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAotCUVUTkFf
SU9DVEwoR0VNX0NQVV9GSU5JLCBnZW1fY3B1X2ZpbmksIERSTV9BVVRIfERSTV9SRU5ERVJfQUxM
T1cpLAotCUVUTkFfSU9DVEwoR0VNX1NVQk1JVCwgICBnZW1fc3VibWl0LCAgIERSTV9BVVRIfERS
TV9SRU5ERVJfQUxMT1cpLAotCUVUTkFfSU9DVEwoV0FJVF9GRU5DRSwgICB3YWl0X2ZlbmNlLCAg
IERSTV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAotCUVUTkFfSU9DVEwoR0VNX1VTRVJQVFIsICBn
ZW1fdXNlcnB0ciwgIERSTV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAotCUVUTkFfSU9DVEwoR0VN
X1dBSVQsICAgICBnZW1fd2FpdCwgICAgIERSTV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAotCUVU
TkFfSU9DVEwoUE1fUVVFUllfRE9NLCBwbV9xdWVyeV9kb20sIERSTV9BVVRIfERSTV9SRU5ERVJf
QUxMT1cpLAotCUVUTkFfSU9DVEwoUE1fUVVFUllfU0lHLCBwbV9xdWVyeV9zaWcsIERSTV9BVVRI
fERSTV9SRU5ERVJfQUxMT1cpLAorCUVUTkFfSU9DVEwoR0VUX1BBUkFNLCAgICBnZXRfcGFyYW0s
ICAgIERSTV9SRU5ERVJfQUxMT1cpLAorCUVUTkFfSU9DVEwoR0VNX05FVywgICAgICBnZW1fbmV3
LCAgICAgIERSTV9SRU5ERVJfQUxMT1cpLAorCUVUTkFfSU9DVEwoR0VNX0lORk8sICAgICBnZW1f
aW5mbywgICAgIERSTV9SRU5ERVJfQUxMT1cpLAorCUVUTkFfSU9DVEwoR0VNX0NQVV9QUkVQLCBn
ZW1fY3B1X3ByZXAsIERSTV9SRU5ERVJfQUxMT1cpLAorCUVUTkFfSU9DVEwoR0VNX0NQVV9GSU5J
LCBnZW1fY3B1X2ZpbmksIERSTV9SRU5ERVJfQUxMT1cpLAorCUVUTkFfSU9DVEwoR0VNX1NVQk1J
VCwgICBnZW1fc3VibWl0LCAgIERSTV9SRU5ERVJfQUxMT1cpLAorCUVUTkFfSU9DVEwoV0FJVF9G
RU5DRSwgICB3YWl0X2ZlbmNlLCAgIERSTV9SRU5ERVJfQUxMT1cpLAorCUVUTkFfSU9DVEwoR0VN
X1VTRVJQVFIsICBnZW1fdXNlcnB0ciwgIERSTV9SRU5ERVJfQUxMT1cpLAorCUVUTkFfSU9DVEwo
R0VNX1dBSVQsICAgICBnZW1fd2FpdCwgICAgIERSTV9SRU5ERVJfQUxMT1cpLAorCUVUTkFfSU9D
VEwoUE1fUVVFUllfRE9NLCBwbV9xdWVyeV9kb20sIERSTV9SRU5ERVJfQUxMT1cpLAorCUVUTkFf
SU9DVEwoUE1fUVVFUllfU0lHLCBwbV9xdWVyeV9zaWcsIERSTV9SRU5ERVJfQUxMT1cpLAogfTsK
IAogc3RhdGljIGNvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdCB2bV9vcHMgPSB7Ci0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
