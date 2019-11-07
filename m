Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DEDF41B3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A7C6F864;
	Fri,  8 Nov 2019 08:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114936F3C8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:29:57 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f2so2115209wrs.11
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 01:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=O+PJ1ZZn/46Tl9iY76CTFXkJGMuUClMcIKHPnfX67PU=;
 b=AmtQQszv05SxJ2AX6KWNmGjLW25mmrqlYx3CqAPgf7Jom8cjspO9UiE165f/0DAe2A
 oUHStAL4RHWEaIam/kmPbhYDS1K0xXQvaVMMdBe7hubF8obydhGO0acsJRwgqFRUxHPD
 OPqkfXvbLdMoHTiAHpWk3gTLS3yfzeku18a8uzR7ue9cXg5v1Bh62+9nxx2u19wttrWR
 bHVqKQ2h9jHzc2Hl4sapGK7prZdp+9xzDN+vcaCv9vy8sVOSPNZe8OcMUY/kYd3CdHWk
 /cJfKXV+VO0LhiO5+MbhK5eJP5DINrzb4GTb4t+bE2D5Y3V+sKiDpaF7DxKCwncuv8t+
 2APA==
X-Gm-Message-State: APjAAAWAcSZ8mXdKUIQJTNj8q91ALUFtYKBazO+eHFjZFKUWdvZ2MQl3
 7Jp1s0L+7KflB4R5shh6ui5mOcsVkmENPg==
X-Google-Smtp-Source: APXvYqwiYbI6O8+aUPp6Ep2W/Inr6Kp4MKn0CHA3p1g484JYEvk7zEomTG0WmL9mVQ81Yz5M61a3fA==
X-Received: by 2002:adf:9d87:: with SMTP id p7mr1829599wre.11.1573118995612;
 Thu, 07 Nov 2019 01:29:55 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id v8sm2323607wra.79.2019.11.07.01.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 01:29:54 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: hjc@rock-chips.com, heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: use DRM_DEV_ERROR for log output
Date: Thu,  7 Nov 2019 12:29:45 +0300
Message-Id: <20191107092945.15513-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=O+PJ1ZZn/46Tl9iY76CTFXkJGMuUClMcIKHPnfX67PU=;
 b=ExSSkNBMRaqpENwcyHoUMKVHRx3ERHMBPqqA7vNtUGEM8uyNE+q89FAIx4p/bXQ80y
 xuuu2alYaeIc/YDffYAgPI/VkJ9LWRJrTxHFGX8VWQwysDcT+y1iZ0LXPGqx00A3yVUI
 0VXzjUXBPH0RN7eascN/a8xn9B+qwMneU0yD8OKnU5gMKBaaBfvomqid6hshuXeTbDMB
 +VXKMjc2+5O0+iCl8fM083zJgKxW+htnmS36fEw+vt+5jfq6OYKIEJ8ddX6lXd5Y3pPY
 EWUw/neg7duyc37aqN/EAe7EW/YXhUU08xGynlny2LoQgwIOXX6phgXUqroQbuYk/JGa
 eZvg==
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSB0aGUgdXNlIG9mIHRoZSBkZXZfZXJyIG1hY3JvIHdpdGggdGhlIERSTV9ERVZfRVJS
T1IKRFJNIGhlbHBlciBtYWNyby4KClNpZ25lZC1vZmYtYnk6IFdhbWJ1aSBLYXJ1Z2EgPHdhbWJ1
aS5rYXJ1Z2F4QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlw
aS1kc2ktcm9ja2NoaXAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1t
aXBpLWRzaS1yb2NrY2hpcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNp
LXJvY2tjaGlwLmMKaW5kZXggYmMwNzNlYzVjMTgzLi41ZjIzY2Y3MDJjYjQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jCkBAIC05MTYsNyAr
OTE2LDcgQEAgc3RhdGljIGludCBkd19taXBpX2RzaV9yb2NrY2hpcF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCX0KIAogCWlmICghZHNpLT5jZGF0YSkgewotCQlkZXZfZXJy
KGRldiwgIm5vIGRzaS1jb25maWcgZm9yICVzIG5vZGVcbiIsIG5wLT5uYW1lKTsKKwkJRFJNX0RF
Vl9FUlJPUihkZXYsICJubyBkc2ktY29uZmlnIGZvciAlcyBub2RlXG4iLCBucC0+bmFtZSk7CiAJ
CXJldHVybiAtRUlOVkFMOwogCX0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
