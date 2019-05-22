Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB532672B
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 17:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB6389BBE;
	Wed, 22 May 2019 15:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AFD89B70;
 Wed, 22 May 2019 15:48:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g12so2858295wro.8;
 Wed, 22 May 2019 08:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vg2EX9j0rvlBkEXHkaqvO5uQm91D2PP9LChxb8DR3ic=;
 b=hdHlVG3C4+SBk3WmYszdInOP8Ne1UyfJeG9Xw1+/f5vqG/BKUTdWL8SuhAT3eIO6eA
 vllzVdXG+bnPrUBOaJSXxhnsUoPHZCe9ZQiV2DTrhSlcRPu6pIP6uKTgQaD1UcFGEB9V
 fnUSuWrtqQUd03Lt9bP220mqJNyUJbIkpNV0axrtY+kDjjKAYV0UgVBs8HsFoIiCQSSY
 w9SNc5I0mNAGRh3+puaKjeggLf+Ur/7vrz+8uvqgoMaKCcJhIDlx+P89mannfxQHlDWd
 D+p6B2MzKb7H0dXxFNsQwrtW1l9ePBcBK55+rkubX0EFiMgdGAZDKVS1n7AGyqRWbCc8
 l4rw==
X-Gm-Message-State: APjAAAWIfXXdw4lAK8j9NJg5mdyT/YLw7OHNU2LHm/82tGQrPtVJGQyu
 roaUW7/Ksyu7mdFChVBCTRq7QmuI
X-Google-Smtp-Source: APXvYqxRfqkx+5eFxeuNI/WF7vvQearHUCtTScWr0fJasuyce+E6HM5xC5wroxovI067TtQho/T0jQ==
X-Received: by 2002:adf:ec0b:: with SMTP id x11mr6751997wrn.88.1558540109594; 
 Wed, 22 May 2019 08:48:29 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id t6sm12567117wmt.34.2019.05.22.08.48.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 08:48:29 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915: remove irrelevant DRM_UNLOCKED flag
Date: Wed, 22 May 2019 16:47:01 +0100
Message-Id: <20190522154702.16269-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522154702.16269-1-emil.l.velikov@gmail.com>
References: <20190522154702.16269-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vg2EX9j0rvlBkEXHkaqvO5uQm91D2PP9LChxb8DR3ic=;
 b=ei2YxqS3vNOVW0KedhVWgnJGhEqfp1cyZ51qLA1C175AlxKXyPaaIh7tw58j5/COyR
 Gshk06xDTY8MEAlhfOCTjUVRSrUUiaSrw6DfoexXWq98/NBn+xCY+s3RK7tadfPc33pk
 MtR0WH+XVQ7jZ7Yn/CYhgAbhpCyyXIz3yqSz8V1Y76nfb9jiSaeJz/SOdTluM1hRnIYg
 CF0Ogvn4MC1zM2L59lsLtN55ZPg+oqdHs6900WUewhMMshptJzzfIoi+nzfH0nGzdpE1
 ydZsaD28gXQYXy9xzpPS1OKZIpGgP6mtLcUhHVogX8nbtLiD6UzjrQC1FaMoM76gmgi1
 jXdg==
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkRSTV9VTkxP
Q0tFRCBkb2Vzbid0IGRvIGFueXRoaW5nIGZvciBub24tbGVnYWN5IGRyaXZlcnMuIFJlbW92ZSBp
dC4KCkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxp
a292QGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYyB8
IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jCmluZGV4IDFhZDg4ZTZkN2MwNC4uYTE4YzE1NWNmZjg4
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMKQEAgLTMxNDUsOSArMzE0NSw5IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2lvY3RsX2Rlc2MgaTkxNV9pb2N0bHNbXSA9IHsKIAlEUk1fSU9DVExf
REVGX0RSVihJOTE1X0dFTV9DT05URVhUX0dFVFBBUkFNLCBpOTE1X2dlbV9jb250ZXh0X2dldHBh
cmFtX2lvY3RsLCBEUk1fUkVOREVSX0FMTE9XKSwKIAlEUk1fSU9DVExfREVGX0RSVihJOTE1X0dF
TV9DT05URVhUX1NFVFBBUkFNLCBpOTE1X2dlbV9jb250ZXh0X3NldHBhcmFtX2lvY3RsLCBEUk1f
UkVOREVSX0FMTE9XKSwKIAlEUk1fSU9DVExfREVGX0RSVihJOTE1X1BFUkZfT1BFTiwgaTkxNV9w
ZXJmX29wZW5faW9jdGwsIERSTV9SRU5ERVJfQUxMT1cpLAotCURSTV9JT0NUTF9ERUZfRFJWKEk5
MTVfUEVSRl9BRERfQ09ORklHLCBpOTE1X3BlcmZfYWRkX2NvbmZpZ19pb2N0bCwgRFJNX1VOTE9D
S0VEfERSTV9SRU5ERVJfQUxMT1cpLAotCURSTV9JT0NUTF9ERUZfRFJWKEk5MTVfUEVSRl9SRU1P
VkVfQ09ORklHLCBpOTE1X3BlcmZfcmVtb3ZlX2NvbmZpZ19pb2N0bCwgRFJNX1VOTE9DS0VEfERS
TV9SRU5ERVJfQUxMT1cpLAotCURSTV9JT0NUTF9ERUZfRFJWKEk5MTVfUVVFUlksIGk5MTVfcXVl
cnlfaW9jdGwsIERSTV9VTkxPQ0tFRHxEUk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVG
X0RSVihJOTE1X1BFUkZfQUREX0NPTkZJRywgaTkxNV9wZXJmX2FkZF9jb25maWdfaW9jdGwsIERS
TV9SRU5ERVJfQUxMT1cpLAorCURSTV9JT0NUTF9ERUZfRFJWKEk5MTVfUEVSRl9SRU1PVkVfQ09O
RklHLCBpOTE1X3BlcmZfcmVtb3ZlX2NvbmZpZ19pb2N0bCwgRFJNX1JFTkRFUl9BTExPVyksCisJ
RFJNX0lPQ1RMX0RFRl9EUlYoSTkxNV9RVUVSWSwgaTkxNV9xdWVyeV9pb2N0bCwgRFJNX1JFTkRF
Ul9BTExPVyksCiB9OwogCiBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZHJpdmVyID0gewotLSAK
Mi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
