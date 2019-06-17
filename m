Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8EC490C5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C940A89FFD;
	Mon, 17 Jun 2019 20:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4F389FFD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:04:23 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id p15so12386933qtl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MoDrWcvfQIcbjX6EFfofy9wV3QW/5fjWQ7KMcAwGXck=;
 b=D5kp47i81yDfHO2mZ56v4kW/3sdTKkWlQ7tuv6P6YFEmZkShXAOKhGXIBBH9IIdleL
 kJ5fd/6AByvNGoWThAtCNNjYNx1HWeOq3R5ilIW2RlKY+frSSkLIsFtH57vH19jBtRrn
 tmF2W0OcqYB7FFL0epKFDRt6BHjFOoPRqhGLDXjXGkGxQ3TVr/CDAndMKHj7Zem4YpP7
 vGY2u1I3atfHHi+EfkODdNN2INwSyCXNdFQw4g2/CDUSCYtye3GqOOi95aO7fNl0qNEu
 EX/1yLNdBbeB+SiK1/+VSX5iRg5zO9w5z+wIImVfVq4qIRud4JRF+9FbhOjOeqL17cYp
 2+9g==
X-Gm-Message-State: APjAAAWD25GKIm//M6epMk9JrEImc7CqjHdNopM8Y4U93k9BtDZpN8BN
 qqAun303J6VlmsuifO+VWeDftMIxXNg=
X-Google-Smtp-Source: APXvYqzKCGN0GuBRRJjvS3GtjbuIGUvGbilM0CRluPyrXr7aW8sG4a6kPDpW5N9YYxuzSOeFFQxsxg==
X-Received: by 2002:ac8:1796:: with SMTP id o22mr89481668qtj.98.1560801862295; 
 Mon, 17 Jun 2019 13:04:22 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
 by smtp.gmail.com with ESMTPSA id j26sm8584794qtj.70.2019.06.17.13.04.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 13:04:21 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [RESEND PATCH 01/13] drm/msm/dpu: Remove call to drm_mode_set_crtcinfo
Date: Mon, 17 Jun 2019 16:03:45 -0400
Message-Id: <20190617200405.131843-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MoDrWcvfQIcbjX6EFfofy9wV3QW/5fjWQ7KMcAwGXck=;
 b=MumptO/KQTle/dU4X+lru1AwzqTHc7POxytAWgmfzMtGqNJsIhXYNDV5qaXc6Xn1TX
 1mLrzP1fnFoiY3kSI0+6YLdEnNNK1Org6t3K4fsAMyuWCsgGqoE0HHPhujrlGl7Padl2
 mvvM6Ovf231kvYoTs5CnBnorccuHuVDn5U7McUK8qGTErjFGJcqcIyf6n8kJGMUJ/P6K
 JWBPxicTjDG3AiisHnACEAnnO5XdwNIv4ZSXRJMS02tZMjSTHNygu+vKow6tKv9SwLgn
 aD5BkRWNphH5fsTEfwndhMA7NOQACUXiE8EQ+b7bqZfamXHVsYbzSIUXhZiS0DjG008+
 Iylw==
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpOb3cgdGhhdCBtb2RlX2Zp
eHVwIGhhcyBiZWVuIHJlbW92ZWQsIHdlIGNhbiBqdXN0IHJlbHkgb24gdGhlIGNhbGwKZnJvbSBk
cm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMoKSwKClNpZ25lZC1vZmYtYnk6
IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMK
aW5kZXggODJiZjE2ZDYxYTQ1Li45NGJhNGE1NzdlZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYwpAQCAtNjIyLDkgKzYyMiw2IEBAIHN0YXRpYyBpbnQg
ZHB1X2VuY29kZXJfdmlydF9hdG9taWNfY2hlY2soCiAJCX0KIAl9CiAKLQlpZiAoIXJldCkKLQkJ
ZHJtX21vZGVfc2V0X2NydGNpbmZvKGFkal9tb2RlLCAwKTsKLQogCXRyYWNlX2RwdV9lbmNfYXRv
bWljX2NoZWNrX2ZsYWdzKERSTUlEKGRybV9lbmMpLCBhZGpfbW9kZS0+ZmxhZ3MsCiAJCQlhZGpf
bW9kZS0+cHJpdmF0ZV9mbGFncyk7CiAKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIs
IEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
