Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52898E6F6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E136E92E;
	Thu, 15 Aug 2019 08:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6081C6E898
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 04:26:58 +0000 (UTC)
Received: from mail-pl1-f197.google.com ([209.85.214.197])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <matthew.ruffell@canonical.com>)
 id 1hy7Lk-0002Hq-PM
 for dri-devel@lists.freedesktop.org; Thu, 15 Aug 2019 04:26:56 +0000
Received: by mail-pl1-f197.google.com with SMTP id g18so731644plj.19
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 21:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d2jNOLpMPlA9TRX1XtwWml9P/iFeL6L1jrBEvqQDx20=;
 b=aH241A2B1LD63IXyZERX8iQZ4I8eO48dSeIbCOYWMaQl4JjDzaOrboDvK4l5CHYNzk
 U1VoUkNZENF/ewmh4s76rvdzMGo2NpuAoAt00mzFmEepdMjuRgjuE4I1u5SlZWra2hi0
 QXT6cRhyUcLEfmq4LmlFcs8PBMNgRyo0IYKP3tcUPDz1f5jChGfQolBAGfRvz9uPwvV1
 hthYBCO0s5l8CFRRAKJPsw1Yn5RNWZqdmsOdrVwt6uQZ4j8y6UPPMSqxqYUHEL/oUX6w
 3AioBRZx6NNNIomf7j8d7LYRr9pjXT3oDKoqTVYbPNTkRFpGIqIezN5JXNEZoNyO/k0+
 n/Hw==
X-Gm-Message-State: APjAAAVLmsyndGrJr0FS9rJAImdgpu+LbMFZKUc0DS50qw835htVFAkm
 BFON+v7flbd/vB9M18R9kfFYLrNfqV1oVEbQw0Wrl1TQ9mA7VJXm8jk9rxwiHf0O45GloDYwwSg
 26wwzUB+yIJPoiN5OBeWSoc7fRZwoLUl3m8VkGjLlnOzdiA==
X-Received: by 2002:a17:902:d715:: with SMTP id
 w21mr2677748ply.261.1565843215192; 
 Wed, 14 Aug 2019 21:26:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqKyN1jLUsIg0uuPPQ8FMobMAki85iYt8ZfUm9usjLhW9CwZ6xD9+TSB6IF8bRGRVpdYrh7w==
X-Received: by 2002:a17:902:d715:: with SMTP id
 w21mr2677734ply.261.1565843215061; 
 Wed, 14 Aug 2019 21:26:55 -0700 (PDT)
Received: from localhost.localdomain (125-238-115-161-fibre.sparkbb.co.nz.
 [125.238.115.161])
 by smtp.gmail.com with ESMTPSA id t8sm240758pji.24.2019.08.14.21.26.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 21:26:54 -0700 (PDT)
From: Matthew Ruffell <matthew.ruffell@canonical.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/hisilicon/hibmc: Make CONFIG_DRM_HISI_HIBMC depend on
 ARM64
Date: Thu, 15 Aug 2019 16:26:40 +1200
Message-Id: <20190815042640.26938-2-matthew.ruffell@canonical.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815042640.26938-1-matthew.ruffell@canonical.com>
References: <20190815042640.26938-1-matthew.ruffell@canonical.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
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
Cc: Guang Lou Yang <yangguanglou@huawei.com>,
 Zhanglei Mao <zhanglei.mao@canonical.com>, David Airlie <airlied@linux.ie>,
 Chen Feng <puck.chen@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Gavin Guo <gavin.guo@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGlzaWxpY29uIGRldmVsb3BlZCBoaWJtY19kcm0gZm9yIHRoZWlyIGFybTY0IGJhc2VkIHNvYyBh
bmQgZGlkIG5vdAppbnRlbmQgZm9yIHRoaXMgZHJpdmVyIHRvIGJlIHVzZWQgb24gYW55IG90aGVy
IGFyY2hpdGVjdHVyZSB0aGFuIGFybTY0LgoKVXNpbmcgaXQgb24gYW1kNjQgbGVhZHMgdG8gaW5j
b3JyZWN0IHZpZGVvIG1vZGVzIGJlaW5nIHVzZWQsIG1ha2luZwp0aGUgc2NyZWVuIHVucmVhZGFi
bGUsIGZvcmNpbmcgdXNlcnMgdG8gbWFudWFsbHkgYmxhY2tsaXN0IHRoZSBtb2R1bGUKb24gdGhl
IGtlcm5lbCBjb21tYW5kIGxpbmUgdG8gdXNlIHRoZSBkLWkgc2VydmVyIGluc3RhbGxlciBvciBh
bnkKZ3JhcGhpY2FsIHNlc3Npb25zLgoKTWFrZSBDT05GSUdfRFJNX0hJU0lfSElCTUMgZmlybWx5
IGRlcGVuZCBvbiBBUk02NCB0byBlbnN1cmUgaXQgaXMgbm90CmJ1aWx0IGZvciBvdGhlciBhcmNo
aXRlY3R1cmVzLgoKU2lnbmVkLW9mZi1ieTogTWF0dGhldyBSdWZmZWxsIDxtYXR0aGV3LnJ1ZmZl
bGxAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL0tj
b25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL0tjb25maWcg
Yi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL0tjb25maWcKaW5kZXggZjIwZWVkZjAw
NzNhLi4zNWEzYzVmMGMzOGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24v
aGlibWMvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL0tjb25m
aWcKQEAgLTEsNyArMSw3IEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkKIGNvbmZpZyBEUk1fSElTSV9ISUJNQwogCXRyaXN0YXRlICJEUk0gU3VwcG9ydCBmb3IgSGlz
aWxpY29uIEhpYm1jIgotCWRlcGVuZHMgb24gRFJNICYmIFBDSSAmJiBNTVUKKwlkZXBlbmRzIG9u
IERSTSAmJiBQQ0kgJiYgTU1VICYmIEFSTTY0CiAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCiAJc2Vs
ZWN0IERSTV9WUkFNX0hFTFBFUgogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
