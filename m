Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 863AD46AEF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9656A8936B;
	Fri, 14 Jun 2019 20:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB20897E7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:27 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z25so5222434edq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WNVhuNaVyCI/JIOzVNXYBbUMoYsbM3r+tFBxKMKg+es=;
 b=Ms5t9kgkpBbydL7+Mu6iYrIr8qAK5RMw+M3S7VVtmT1cbkfImio+/bqkYdwhsla4sT
 /LQIAwSa1Ecb1ct7wOBM1K3gUsSzlv222JUmjCKePL4AYCQ5r0XkS8psOFNxk9jKGO/I
 NyEpSSa5eDUMwBW+0tY3AoAtdoPbgJfrI1+p66HA3Oc9iq923FPVRkI/qCF4h019jPoo
 U5nGTVr5T96uLRZqJCG+MC0iaDAp5danCgahmSUda3ksI9j3eszIIhkfQVCipjKk75tH
 U8YrqVIJV4ig7XpALjfDuaWsO/MvQCms2LG/AXncTK+Io9rnvE6KV30sz+tOIHlvng3U
 xbqg==
X-Gm-Message-State: APjAAAUucylluI6v3YSvbQQUoPlGVbHPThPY2V8HKpJkrQLN7p7zzEoP
 O+333vRKBP9JhJN5EsRj/cf80vKzR+M=
X-Google-Smtp-Source: APXvYqzqiPS1klkq4orWdDvJZ42ExkoZk2KkWz+DQ0VP2/5PDZKs/yKqgyE7Pl4YzN0iWbmPl50TnQ==
X-Received: by 2002:a05:6402:712:: with SMTP id
 w18mr15845764edx.201.1560544645014; 
 Fri, 14 Jun 2019 13:37:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:24 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 55/59] drm/todo: remove gem_prime_import/export todo
Date: Fri, 14 Jun 2019 22:36:11 +0200
Message-Id: <20190614203615.12639-56-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WNVhuNaVyCI/JIOzVNXYBbUMoYsbM3r+tFBxKMKg+es=;
 b=khDli+Dc92u6YMjIP1ybVZ4ulHhMaeUvbM8cRVHHMiPu2a5m584bc1GeCxOrroytO6
 Uewfm7b0naH9BdqgXGrKxiUdY6qNRnwF9DY+T83WO3MVnP8FiZwQlvop3694fJAa2lxB
 vmLeEQiyuhKr2voAlNQ+1duAMcfiCu4BbwuiU=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSd2ZSBkb25lIHRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCB8IDcgLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9ncHUvdG9kby5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAppbmRleCA4MWZi
YjE1Yzk0YzYuLjIxYTdiNzgwMGQzZSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9k
by5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKQEAgLTIwNiwxMyArMjA2LDYg
QEAgZWZmaWNpZW50LgogCiBDb250YWN0OiBEYW5pZWwgVmV0dGVyCiAKLURlZmF1bHRzIGZvciAu
Z2VtX3ByaW1lX2ltcG9ydCBhbmQgZXhwb3J0Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQotCi1Nb3N0IGRyaXZlcnMgZG9uJ3QgbmVlZCB0byBzZXQgZHJtX2RyaXZl
ci0+Z2VtX3ByaW1lX2ltcG9ydCBhbmQKLS0+Z2VtX3ByaW1lX2V4cG9ydCBub3cgdGhhdCBkcm1f
Z2VtX3ByaW1lX2ltcG9ydCgpIGFuZCBkcm1fZ2VtX3ByaW1lX2V4cG9ydCgpCi1hcmUgdGhlIGRl
ZmF1bHQuCi0KIHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcwogLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
