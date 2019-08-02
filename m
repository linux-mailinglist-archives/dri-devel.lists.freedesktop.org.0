Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EC17FF18
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 19:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995956EEF7;
	Fri,  2 Aug 2019 17:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5301E6EEF2;
 Fri,  2 Aug 2019 17:01:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g17so77895851wrr.5;
 Fri, 02 Aug 2019 10:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VY2A6whCZJMFwm69hfn5FnK7Z+9ydQLngkA0tgQebjc=;
 b=EaM+Vae5Pn6zTmcZwugfyMQkLZudQD1JtjpechP6u3b9SGXuAEXTlua8APst/dhwr8
 ZzLh336ykO2dvOvcnhapdR0E9qg0T7jq45Tb1a2q+d7fAUYPSM1bltDPZI+I6q2aYYMa
 5Dnm/gSKQn3/xciZURZYOva6G96Qs/ewr8wigM8vRqw4lcIF19B8D8+AV6fenQ3px3PH
 Eh9V3vThjVKvUI1KnPk8nkbiYcpWYvMNBB3LgOSKt3ty2Qu9g02fk0pkKadlJMM5YGdN
 TDAdtdXOVUJ3Te7gaxBEmNNT6M+t3kpcIw2cCjLBMVaDcCpych3jyh89FA0TIDBW2de0
 uNFw==
X-Gm-Message-State: APjAAAXJfzPt839fBb4tTfjXDUXRu+3j1k9fXHAGa8V8dc5d85a1d9CD
 iwTkinbpGDlvc0UubQFbdHJBN3zb
X-Google-Smtp-Source: APXvYqxkfTtOZg0YEisbE5loyC6VE5Wup6Ka0ZkHIbVmtziWpXVacIxM0nmTnQyGEAqrtt4oIYHGzw==
X-Received: by 2002:adf:e941:: with SMTP id m1mr8210167wrn.279.1564765317696; 
 Fri, 02 Aug 2019 10:01:57 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id f12sm82823008wrg.5.2019.08.02.10.01.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 10:01:57 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm: drop DRM_AUTH from PRIME_TO/FROM_HANDLE ioctls
Date: Fri,  2 Aug 2019 18:01:17 +0100
Message-Id: <20190802170117.10942-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190802170117.10942-1-emil.l.velikov@gmail.com>
References: <20190802170117.10942-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VY2A6whCZJMFwm69hfn5FnK7Z+9ydQLngkA0tgQebjc=;
 b=cPgyjXpu/Nxra3FuO0krVazInkbV12FW0ll5EtiGHDrC9hnPhNN5BcIAkjiajvxI21
 H2gOy9PfuGSUU4QBuLQ2ymvvDO0tcK6ydvBlFFakYmmxl4rp7bJbUv1cUnIPvK8TzeJq
 U/uygpjAjLilJnl1QLdGe+45KWW6HRGnSH6AJkKaj1a/ulSuRS/g5CBhqRe+RFdccPd2
 Ya+2N0HuvcjAZYOFcyyuYEcH5uu4QOKWnft9biCCfbVOTLmaSnAnn75QNuF9DrqoK9jY
 fNUyMvm9nWlNft+Delho7tvQoxCWcO/znEwK8q6UV2tI8CwKc4vvpjO93kDLhQtrOtvD
 qUxw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, emil.l.velikov@gmail.com,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkFzIG1lbnRp
b25lZCBieSBDaHJpc3RpYW4sIGZvciBkcml2ZXJzIHdoaWNoIHN1cHBvcnQgb25seSBwcmltYXJ5
IG5vZGVzCnRoaXMgY2hhbmdlcyB0aGUgcmV0dXJuZWQgZXJyb3IgZnJvbSAtRUFDQ0VTIGludG8g
LUVPUE5PVFNVUFAvLUVOT1NZUy4KCkZvciBvdGhlcnMsIHRoaXMgY2hlY2sgaW4gcGFydGljdWxh
ciB3aWxsIGJlIGEgbm9vcC4gU28gbGV0J3MgcmVtb3ZlIGl0CmFzIHN1Z2dlc3RlZCBieSBDaHJp
c3RpYW4uCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3Jh
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9pb2N0bC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jCmlu
ZGV4IGY2NzVhM2JiMmM4OC4uODY3YWI0ZTUwMzc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2lvY3RsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jCkBAIC02NDcs
OCArNjQ3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW9jdGxfZGVzYyBkcm1faW9jdGxz
W10gPSB7CiAKIAlEUk1fSU9DVExfREVGKERSTV9JT0NUTF9NT0RFX0dFVFJFU09VUkNFUywgZHJt
X21vZGVfZ2V0cmVzb3VyY2VzLCAwKSwKIAotCURSTV9JT0NUTF9ERUYoRFJNX0lPQ1RMX1BSSU1F
X0hBTkRMRV9UT19GRCwgZHJtX3ByaW1lX2hhbmRsZV90b19mZF9pb2N0bCwgRFJNX0FVVEh8RFJN
X1JFTkRFUl9BTExPVyksCi0JRFJNX0lPQ1RMX0RFRihEUk1fSU9DVExfUFJJTUVfRkRfVE9fSEFO
RExFLCBkcm1fcHJpbWVfZmRfdG9faGFuZGxlX2lvY3RsLCBEUk1fQVVUSHxEUk1fUkVOREVSX0FM
TE9XKSwKKwlEUk1fSU9DVExfREVGKERSTV9JT0NUTF9QUklNRV9IQU5ETEVfVE9fRkQsIGRybV9w
cmltZV9oYW5kbGVfdG9fZmRfaW9jdGwsIERSTV9SRU5ERVJfQUxMT1cpLAorCURSTV9JT0NUTF9E
RUYoRFJNX0lPQ1RMX1BSSU1FX0ZEX1RPX0hBTkRMRSwgZHJtX3ByaW1lX2ZkX3RvX2hhbmRsZV9p
b2N0bCwgRFJNX1JFTkRFUl9BTExPVyksCiAKIAlEUk1fSU9DVExfREVGKERSTV9JT0NUTF9NT0RF
X0dFVFBMQU5FUkVTT1VSQ0VTLCBkcm1fbW9kZV9nZXRwbGFuZV9yZXMsIDApLAogCURSTV9JT0NU
TF9ERUYoRFJNX0lPQ1RMX01PREVfR0VUQ1JUQywgZHJtX21vZGVfZ2V0Y3J0YywgMCksCi0tIAoy
LjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
