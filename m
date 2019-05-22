Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6342D2672C
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 17:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF3189BF6;
	Wed, 22 May 2019 15:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0682789BBE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 15:48:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m3so2875514wrv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 08:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dgKnb+ZMAHPqo6jMH0ZRWvWPrzNuLtMxTP5x4mydrM8=;
 b=f9t0VhCSH8EYnks+KAjRs4IZssKxhGH2H3gTMvauURQ24PcJk6XXvbjUVsIbxhjluA
 YN/TR5K6/HuV3g7ZOM/xtsLoYIYlWVk4b4rqyAeDOdo+4FxFUr2Zk9jjJ9EnQLhsEruH
 DyUlvP8hlcpxqiS/FK5nwf+so5J6m35KPErn2AhWXdY/MnvuvTAxFhqCIi3tHx/5Q4AQ
 nQHJvtGluWqbUgqtwRfToSRQEfWinArKGCB6bHOK/p/d5s3K/KcWhiXJZDcAxZQGBOao
 BN6+kHdMyE9qVFqauOwIcCsA6+OUPkWh/NfrarBSTZoJAKckJ7RR8P57k6GPisXJB5bc
 BgeA==
X-Gm-Message-State: APjAAAU/uSjDaDCT0Fs4st1ALTxekuv5BZ5ePndHsCrN4U9q9zAemhPb
 jSLtY6NE5qrH+wUi+WBGx0JuklrM
X-Google-Smtp-Source: APXvYqx8HI+IZhhKjevA7awIPqbHQcCeXf2djysEOqMBFtegldOzcbbsJcAtx96/yLFrNIydc/KRww==
X-Received: by 2002:adf:d088:: with SMTP id y8mr18602094wrh.286.1558540110418; 
 Wed, 22 May 2019 08:48:30 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id t6sm12567117wmt.34.2019.05.22.08.48.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 08:48:29 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/TODO: add a task to kill DRM_UNLOCKED
Date: Wed, 22 May 2019 16:47:02 +0100
Message-Id: <20190522154702.16269-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522154702.16269-1-emil.l.velikov@gmail.com>
References: <20190522154702.16269-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dgKnb+ZMAHPqo6jMH0ZRWvWPrzNuLtMxTP5x4mydrM8=;
 b=SCj0bAWmdFdQ2Mw/RtMDceep46w8/2vWhqVYDeUhXpwoKr/qNB0g8bJO8QAXFzfdN6
 3yBiWMt1sQJi1XFVTxVzN6HVrOA+vSxONYbtDeY1jHIlHapmsP+uGzElwmjEBzCAz+Im
 WFnDUysk3sXdfPV4LN+yWqJjf40yYJ+djqCGwWw4TMuSxgyQzuTZ/iHNq2M570E2YHAB
 BJ9AhySshIRjyZyXpytEXgyYKpcnOJ9+1negcNWkJthMQEaGQ5zXUSpUo85Nd/2DdxIt
 re1daW05IKscvAywPiq8kY1uwWralrF7nD8g/9xwTKNn2DjshznyzG+9ReDguMnOaRkn
 gk2w==
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
Cc: kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClNob3VsZCBt
aW5pbWlzZSB0aGUgY29weS9wYXN0ZSBtaXN0YWtlcywgZml4ZWQgd2l0aCBwcmV2aW91cyBwYXRj
aGVzLgoKQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTog
RW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCkRhbmllbCwgbm90
IDEwMCUgc29sZCBvbiB0aGUgaWRlYS4gVGhhdCBwbHVzIGxpc3RpbmcgeW91IGFzIGEgY29udGFj
dApwb2ludCA7LSkKCldoYXQgZG8geW91IHRoaW5nPwpFbWlsCi0tLQogRG9jdW1lbnRhdGlvbi9n
cHUvdG9kby5yc3QgfCAxOSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTkg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIv
RG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKaW5kZXggNjZmMDVmNGU0NjlmLi45ZTY3ZDEyNWYy
ZmQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CisrKyBiL0RvY3VtZW50
YXRpb24vZ3B1L3RvZG8ucnN0CkBAIC0zOTcsNiArMzk3LDI1IEBAIFNvbWUgb2YgdGhlc2UgZGF0
ZSBmcm9tIHRoZSB2ZXJ5IGludHJvZHVjdGlvbiBvZiBLTVMgaW4gMjAwOCAuLi4KICAgZW5kLCBm
b3Igd2hpY2ggd2UgY291bGQgYWRkIGRybV8qX2NsZWFudXBfa2ZyZWUoKS4gQW5kIHRoZW4gdGhl
cmUncyB0aGUgKGZvcgogICBoaXN0b3JpY2FsIHJlYXNvbnMpIG1pc25hbWVkIGRybV9wcmltYXJ5
X2hlbHBlcl9kZXN0cm95KCkgZnVuY3Rpb24uCiAKK1VzZSBEUk1fTE9DS0VEIGluc3RlYWQgb2Yg
RFJNX1VOTE9DS0VECistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCitE
Uk1fVU5MT0NLRUQgaXMgYSByZW1haW5kZXIgZnJvbSB0aGUgbGVnYWN5IERSTSBkcml2ZXJzLiBT
ZWVtaW5nbHkgZHJpdmVycyBnZXQKK3RyaWNrZWQgYnkgaXQgYW5kIGl0IGVuZHMgdXAgaW4gdGhl
IGRyaXZlciBwcml2YXRlIGlvY3Rscy4KKworVG9kYXkgbm8gbW9yZSBsZWdhY3kgZHJpdmVycyBh
cmUgYWxsb3dlZCBhbmQgbW9zdCBjb3JlIERSTSBpb2N0bHMgYXJlIHVubG9ja2VkLgorCitJbnRy
b2R1Y2UgRFJNX0xPQ0tFRCwgdXNlIGl0IHRvIGFubm90YXRlIG9ubHkgdGhlIHJlbGV2YW50IGlv
Y3RscyBhbmQga2lsbCB0aGUKK29sZCBEUk1fVU5MT0NLRUQuCisKK1BhdGNoIHNlcmllcyBzaG91
bGQgYmUgc3BsaXQgYXMgZm9sbG93czoKKyAtIFBhdGNoIDE6IGRybTogYWRkIHRoZSBuZXcgRFJN
X0xPQ0tFRCBmbGFnIGFuZCBob25vdXIgaXQKKyAtIFBhdGNoIDI6IGRybTogY29udmVydCBjb3Jl
IGlvY3RscyBmcm9tIERSTV9VTkxPQ0tFRCB0byBEUk1fTE9DS0VECisgLSBQYXRjaCAzLS4uLjog
ZHJtL2RyaXZlclg6IGNvbnZlcnQgZHJpdmVyIGlvY3RscyBmcm9tIC4uLgorIC0gUGF0Y2ggWDog
ZHJtOiByZW1vdmUgbm8gbG9uZ2VyIHVzZWQgRFJNX1VOTE9DS0VELCBkcm9wIHRvZG8gaXRlbQor
CitDb250YWN0OiBFbWlsIFZlbGlrb3YsIERhbmllbCBWZXR0ZXIKKwogQmV0dGVyIFRlc3RpbmcK
ID09PT09PT09PT09PT09CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
