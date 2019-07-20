Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685D26F9F9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 09:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B94A89B67;
	Mon, 22 Jul 2019 07:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0BB89A0F
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 22:47:17 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 62so19189900lfa.8
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 15:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKLhyz5p7oO0FaWu/NXqNoTadAdq14oGhVItmu/qz+8=;
 b=tFuQQCqQrApOdfMJ0OitKBFjw+TBdUAz3KHGdcLqoohBbl/I6MsS3R6RecArprmywn
 F8yUt2ZQU1cBwDKYfIoUlTpCLPGPfkHOsDLpQkWcS4i+Tkw/le8pZTUDFKVaj31CQoKE
 k3APMH88GD2pmtvq7VhhluBpeTgGPAPBnoCR2NDr2ceh+62I6oWXhNjJ5BnrgyplY/bH
 usszmxwUI7agOLJoqkcl7mSRthZ5+szgymKM9FpYsT3+2V0xhphla77noBPRm4k918pn
 p25z2886g3YumZXxRHyowYqbbfZzAaalfyzWjp9UQISE3WJt6bmrr88iQ/L8qFZQv2Rb
 +AtQ==
X-Gm-Message-State: APjAAAWuzHFm+YFWnGnucYKURerBkKtmL4FQJIse9yAo4Y3i7LQrM7bJ
 5ZiNR2D3N1oArMrtRQFzjNYeZJUFsIA=
X-Google-Smtp-Source: APXvYqymM8Y4GGCs1pVZgbG8Q5g8fYJgIf/F/qNzgm9YnjgAKKAhSu8gLrNlXE5K/MmvH1a6D1LVzA==
X-Received: by 2002:ac2:44ce:: with SMTP id d14mr27873653lfm.143.1563662836241; 
 Sat, 20 Jul 2019 15:47:16 -0700 (PDT)
Received: from vostro.lan (18.177.94.90.dynamic.jazztel.es. [90.94.177.18])
 by smtp.gmail.com with ESMTPSA id f30sm5293251lfa.48.2019.07.20.15.47.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 20 Jul 2019 15:47:15 -0700 (PDT)
From: =?UTF-8?q?David=20Santamar=C3=ADa=20Rogado?= <howl.nsp@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: panel-orientation-quirks: Add D330 HD version
Date: Sun, 21 Jul 2019 00:47:13 +0200
Message-Id: <20190720224713.5187-1-howl.nsp@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jul 2019 07:08:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKLhyz5p7oO0FaWu/NXqNoTadAdq14oGhVItmu/qz+8=;
 b=sD+5En42Zfex6IXM33CZfAsVRS8pLWzRKVwhziHDA6O88iI8AwFALzv1B5muC8YFKR
 /pv62SrUVxGMYUNyVrSxGCOrYopaBsBtFT1gtPNKmNG/j8iezQ+aGZnZYOrwkeDQ3Jv6
 oDLVCEoec7o/vy74OKmikIah3Jp1geBR9cu5rrRkKFR5HUkW/zOMmRdYyRIj3vz1CHNj
 SQ3tvNy0xajY8u8VqcE1KV+skS2bR1O7+746eSe6mV2lNoI2o1DmvtXl7QSnQu00g0o5
 /Hk1PX7zI8Pafziu4DkI16RY4yWULDEEWnMPUOjSjzFmtReZglTQeOM0pU3A50rO530C
 fPEg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHRoZSBIRCB2ZXJzaW9uIG9mIExlbm92byBJZGVhcGFkIEQzMzAuCkFsc28gZWRp
dCB0aGUgRkhEIHZlcnNpb24gY29tbWVudCB0byBkaXN0aW5ndWlzaC4KVGhpcyBzaG91bGQgd29y
ayBkZXNwaXRlIHRoZSBkbWkgZGF0YSBpcyB0aGUgc2FtZSBiZWNhdXNlCnRoZSByZXNvbHV0aW9u
IGNoZWNrcy4KClNpZ25lZC1vZmYtYnk6IERhdmlkIFNhbnRhbWFyw61hIFJvZ2FkbyA8aG93bC5u
c3BAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25f
cXVpcmtzLmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3Jp
ZW50YXRpb25fcXVpcmtzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9u
X3F1aXJrcy5jCmluZGV4IGZmZDk1YmZlYWE5NC4uMWE5YWFmZTUxOWJjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKQEAgLTE5OCw3ICsxOTgs
MTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIG9yaWVudGF0aW9uX2RhdGFb
XSA9IHsKIAkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfVkVSU0lPTiwgIkxlbm92byBN
SUlYIDMyMC0xMElDUiIpLAogCQl9LAogCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZsY2Q4MDB4
MTI4MF9yaWdodHNpZGVfdXAsCi0JfSwgewkvKiBMZW5vdm8gSWRlYXBhZCBEMzMwICovCisJfSwg
ewkvKiBMZW5vdm8gSWRlYXBhZCBEMzMwIChIRCkgKi8KKwkJLm1hdGNoZXMgPSB7CisJCSAgRE1J
X0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAiTEVOT1ZPIiksCisJCSAgRE1JX0VYQUNUX01B
VENIKERNSV9QUk9EVUNUX05BTUUsICI4MUgzIiksCisJCSAgRE1JX0VYQUNUX01BVENIKERNSV9Q
Uk9EVUNUX1ZFUlNJT04sICJMZW5vdm8gaWRlYXBhZCBEMzMwLTEwSUdNIiksCisJCX0sCisJCS5k
cml2ZXJfZGF0YSA9ICh2b2lkICopJmxjZDgwMHgxMjgwX3JpZ2h0c2lkZV91cCwKKwl9LCB7CS8q
IExlbm92byBJZGVhcGFkIEQzMzAgKEZIRCkgKi8KIAkJLm1hdGNoZXMgPSB7CiAJCSAgRE1JX0VY
QUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAiTEVOT1ZPIiksCiAJCSAgRE1JX0VYQUNUX01BVENI
KERNSV9QUk9EVUNUX05BTUUsICI4MUgzIiksCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
