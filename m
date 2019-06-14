Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E653A46AB3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD3E89780;
	Fri, 14 Jun 2019 20:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A0C895C4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:01 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r12so3058356edo.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=88ObG0EAmUExoeYUSgHcXg7RZc5Mb9nZYM2H03Sv18I=;
 b=qmt1sYQuOfgRMi1udIyMRktuROYWfFoSeg2NfDD/XoySN8LfIUoJZApyG94g5gBOxw
 einwAudEtVfntQntDDGz9gj6ix9agxpjrtF+YHPdszlYguCK4rb+Tx6Tv1r8ngAmpOrZ
 /u4r3vykFFIJcEFU8q+BoZ3IWF+YzHby0UDW4TJb5RPso5HreSyqZyxaFiBKQawQ973E
 piAgpG0iQcuZNQWk+zuhYrZrzlPwlH4B9l4CPLJPd+VheQ9xMbaOzUBNU5opF2WYOD0Z
 Vaa5x3mCw6I1zgzh5FrOn80Gk27y4yTDcHwDkFGJ8FeoFWCu7x42Ddxjhp2RiXCCrfDG
 wXqw==
X-Gm-Message-State: APjAAAUk9JHMItFjOJYZl5E0IRYn90kUGm4109QDSCFmsPpYOCOiepj2
 2+sHqG4hnxc+9VWKGQGOYTI5oRKIsMY=
X-Google-Smtp-Source: APXvYqx/XSkMnJ4y2svUMGqkCw7Mf24gm80Ed6knrPOGOKM8YDSyJf43LtGppO4OW3E7kQUr6HHrPA==
X-Received: by 2002:a50:94d9:: with SMTP id t25mr68978048eda.32.1560544618612; 
 Fri, 14 Jun 2019 13:36:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:58 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 32/59] drm/tve2000: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:48 +0200
Message-Id: <20190614203615.12639-33-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=88ObG0EAmUExoeYUSgHcXg7RZc5Mb9nZYM2H03Sv18I=;
 b=WNbRFOJfW6wfXr61L6pDaSCho6Gz0FLCIVJsENhxhyCPiXZNPs+smDnBgKRfFUDlN0
 +ixn4jXmpZylJ+Xxps295Ere1sO0E+XNhnSWCb7qOqlRcTWls+YxfRoZzmmXoPQdVluQ
 TCA2ICEx/TFLw3A0rFVwYNXIRuDPzzCKidTZI=
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

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBMaW51cyBXYWxs
ZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R2ZTIw
MC90dmUyMDBfZHJ2LmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS90dmUyMDAvdHZlMjAwX2Rydi5jCmluZGV4IGExZjYxNGUyMWZjYy4uODMwYTVhZjI1
YWM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYuYwpAQCAtMTUyLDggKzE1Miw2IEBA
IHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciB0dmUyMDBfZHJtX2RyaXZlciA9IHsKIAogCS5wcmlt
ZV9oYW5kbGVfdG9fZmQgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKIAkucHJpbWVfZmRf
dG9faGFuZGxlID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCi0JLmdlbV9wcmltZV9pbXBv
cnQgPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKLQkuZ2VtX3ByaW1lX2V4cG9ydCA9IGRybV9nZW1f
cHJpbWVfZXhwb3J0LAogCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlCT0gZHJtX2dlbV9jbWFfcHJp
bWVfZ2V0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gZHJtX2dlbV9j
bWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfdm1hcCA9IGRybV9nZW1fY21h
X3ByaW1lX3ZtYXAsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
