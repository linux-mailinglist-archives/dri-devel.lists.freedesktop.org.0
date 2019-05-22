Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD602672A
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 17:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF79989BC0;
	Wed, 22 May 2019 15:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E73A89B3B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 15:48:30 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t7so2564957wrr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 08:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HdYLKK0O8zjOHfMRuMEVNbPOEm50SE48I5+273koG8=;
 b=Rq6jW5DbqjqEcEZg4nQCtWWXYqv2sb3nuQCTZcOxBm+oY/m2fJPddEc+msHVciAnyr
 F2cJ1v1iC6uTZ3pU7HbCi4pQUSmtwQzmtENt841jw1yJwVfjQuulREDYcBIIWwFt6o6D
 k/okc0GBzlYrjRsIN69/5H/1WAlmbyyxg4z6O7I0npHfMOfvGIQaS/nYWrZum3tc+kJA
 cqTdjhIHDIyzIKNUWihigdy0cb5HjJ6NfUpBCsRe5OXEFNxxtdzAYBQKVnu8EeeBp2HI
 NrN3S+KhPwvpBZceOsRwD4mRjQQOkxWsV8k+l8B5zGzEoWMaqhgAvfs7HcedIAwlinW+
 RDyA==
X-Gm-Message-State: APjAAAWbdaG1Gn074DhFpgKZzN6saoVM6xpY9/UnSq4VJ/dLUvLQvlkI
 drPzX/0mcI8YWy0E7SLioTUoP7Hk
X-Google-Smtp-Source: APXvYqx+GEqSOJqjBnC9BXRRYx6UPpWcOzmT01LzSkVy5hVoMVJDeCL9b2emaAiGhtMaZis22UyUkg==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr3385668wrm.98.1558540108661; 
 Wed, 22 May 2019 08:48:28 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id t6sm12567117wmt.34.2019.05.22.08.48.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 08:48:28 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/virtio: remove irrelevant DRM_UNLOCKED flag
Date: Wed, 22 May 2019 16:47:00 +0100
Message-Id: <20190522154702.16269-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522154702.16269-1-emil.l.velikov@gmail.com>
References: <20190522154702.16269-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9HdYLKK0O8zjOHfMRuMEVNbPOEm50SE48I5+273koG8=;
 b=ZKWtwQxWXNKG+BRGWu0z+IbLQtzSOqMDS65LRAExdT6WgmgSk84/yRn4ULVDS/nvYn
 zeFzFvXKb0+ct67BOLz9x6OjuGLDtOzNgfe3txW2K6e/snXiiKsek+S7QhBzUcQQnQ8O
 RQOMS0QZlsiSZdzpkEk6/6QddP96yQQ6jQEu9YdqpSprULL4ZQ9n0yAh6PeF+f30kG/4
 Mh99tBtzUACFKmWwjgk8c2g4qm6LqjpQJV/w7r+Z/rXtodHz5TvGZYbjjk9KAR/T8hta
 b0VdINsz9acDZpqI2PSVc+7kGLiusRW+DqYAV15H//0/vi97x2x/Q+duNWQTPLoBqSvD
 xXMw==
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
Cc: David Airlie <airlied@linux.ie>, kernel@collabora.com,
 Gerd Hoffmann <kraxel@redhat.com>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkRSTV9VTkxP
Q0tFRCBkb2Vzbid0IGRvIGFueXRoaW5nIGZvciBub24tbGVnYWN5IGRyaXZlcnMuIFJlbW92ZSBp
dC4KCkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBHZXJkIEhvZmZtYW5u
IDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClNpZ25lZC1vZmYt
Ynk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYwppbmRleCA5NDlhMjY0OTg1ZmMuLmI3ZjlkZmU2
MWQxYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKQEAgLTU1MywzNCAr
NTUzLDM0IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9nZXRfY2Fwc19pb2N0bChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LAogCiBzdHJ1Y3QgZHJtX2lvY3RsX2Rlc2MgdmlydGlvX2dwdV9pb2N0bHNb
RFJNX1ZJUlRJT19OVU1fSU9DVExTXSA9IHsKIAlEUk1fSU9DVExfREVGX0RSVihWSVJUR1BVX01B
UCwgdmlydGlvX2dwdV9tYXBfaW9jdGwsCi0JCQkgIERSTV9BVVRIIHwgRFJNX1VOTE9DS0VEIHwg
RFJNX1JFTkRFUl9BTExPVyksCisJCQkgIERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCiAK
IAlEUk1fSU9DVExfREVGX0RSVihWSVJUR1BVX0VYRUNCVUZGRVIsIHZpcnRpb19ncHVfZXhlY2J1
ZmZlcl9pb2N0bCwKLQkJCSAgRFJNX0FVVEggfCBEUk1fVU5MT0NLRUQgfCBEUk1fUkVOREVSX0FM
TE9XKSwKKwkJCSAgRFJNX0FVVEggfCBEUk1fUkVOREVSX0FMTE9XKSwKIAogCURSTV9JT0NUTF9E
RUZfRFJWKFZJUlRHUFVfR0VUUEFSQU0sIHZpcnRpb19ncHVfZ2V0cGFyYW1faW9jdGwsCi0JCQkg
IERSTV9BVVRIIHwgRFJNX1VOTE9DS0VEIHwgRFJNX1JFTkRFUl9BTExPVyksCisJCQkgIERSTV9B
VVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCiAKIAlEUk1fSU9DVExfREVGX0RSVihWSVJUR1BVX1JF
U09VUkNFX0NSRUFURSwKIAkJCSAgdmlydGlvX2dwdV9yZXNvdXJjZV9jcmVhdGVfaW9jdGwsCi0J
CQkgIERSTV9BVVRIIHwgRFJNX1VOTE9DS0VEIHwgRFJNX1JFTkRFUl9BTExPVyksCisJCQkgIERS
TV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCiAKIAlEUk1fSU9DVExfREVGX0RSVihWSVJUR1BV
X1JFU09VUkNFX0lORk8sIHZpcnRpb19ncHVfcmVzb3VyY2VfaW5mb19pb2N0bCwKLQkJCSAgRFJN
X0FVVEggfCBEUk1fVU5MT0NLRUQgfCBEUk1fUkVOREVSX0FMTE9XKSwKKwkJCSAgRFJNX0FVVEgg
fCBEUk1fUkVOREVSX0FMTE9XKSwKIAogCS8qIG1ha2UgdHJhbnNmZXIgYXN5bmMgdG8gdGhlIG1h
aW4gcmluZz8gLSBubyBzdXJlLCBjYW4gd2UKIAkgKiB0aHJlYWQgdGhlc2UgaW4gdGhlIHVuZGVy
bHlpbmcgR0wKIAkgKi8KIAlEUk1fSU9DVExfREVGX0RSVihWSVJUR1BVX1RSQU5TRkVSX0ZST01f
SE9TVCwKIAkJCSAgdmlydGlvX2dwdV90cmFuc2Zlcl9mcm9tX2hvc3RfaW9jdGwsCi0JCQkgIERS
TV9BVVRIIHwgRFJNX1VOTE9DS0VEIHwgRFJNX1JFTkRFUl9BTExPVyksCisJCQkgIERSTV9BVVRI
IHwgRFJNX1JFTkRFUl9BTExPVyksCiAJRFJNX0lPQ1RMX0RFRl9EUlYoVklSVEdQVV9UUkFOU0ZF
Ul9UT19IT1NULAogCQkJICB2aXJ0aW9fZ3B1X3RyYW5zZmVyX3RvX2hvc3RfaW9jdGwsCi0JCQkg
IERSTV9BVVRIIHwgRFJNX1VOTE9DS0VEIHwgRFJNX1JFTkRFUl9BTExPVyksCisJCQkgIERSTV9B
VVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCiAKIAlEUk1fSU9DVExfREVGX0RSVihWSVJUR1BVX1dB
SVQsIHZpcnRpb19ncHVfd2FpdF9pb2N0bCwKLQkJCSAgRFJNX0FVVEggfCBEUk1fVU5MT0NLRUQg
fCBEUk1fUkVOREVSX0FMTE9XKSwKKwkJCSAgRFJNX0FVVEggfCBEUk1fUkVOREVSX0FMTE9XKSwK
IAogCURSTV9JT0NUTF9ERUZfRFJWKFZJUlRHUFVfR0VUX0NBUFMsIHZpcnRpb19ncHVfZ2V0X2Nh
cHNfaW9jdGwsCi0JCQkgIERSTV9BVVRIIHwgRFJNX1VOTE9DS0VEIHwgRFJNX1JFTkRFUl9BTExP
VyksCisJCQkgIERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCiB9OwotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
