Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB852A9F6A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA346EB2C;
	Fri,  6 Nov 2020 21:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A766EB25
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:50:11 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n15so2791771wrq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjA8v4JLA0wt0cf7/uKVTogVLZnV31tTyBrzOli6fTM=;
 b=Oia3Jh4+Z4jZyw1RDFWjabOewBGewQgIFa2hSMdeANo/YNjwRKSyyHR/LmjPTFtqt1
 s1PWVzmYK/yiFcYzVOiScC7s9flKEXDvrwkM8+oFQquVQSrvMGl3gMbuKiDFQZsoSMb0
 rVNafzN6YaSO41UutCfcOGF7aLMiRl5tBPvTD3hz392MP3sMQmLcsT4BykIuFqirx8xj
 L0xAzBNZGRx/MvGtnG1EMg+6rETJR5G94Dl9+sR3bxebp6rscL2fgQ57Y0TR5TU2S0dL
 hBmeBZSxQW/agwFMc4PH6qo9+jx7lpTW+LKLienKAzuco0zomsAXcRe7G/4pzTNyydrt
 sa0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjA8v4JLA0wt0cf7/uKVTogVLZnV31tTyBrzOli6fTM=;
 b=Y4dyr9lHJq/ckIWIOamNXr8UGqCSeqPTze2OYAfduGBiGbVphPRZRsLW736CTTE+ts
 Op89rhZtz3ig2Jwbr7FeHIE71AU0Y/ygAHkQ6qRfvD9IgYUUSFxRDKllSKtusj1vFdOf
 FKJdERMlbNj96+XZvE+EibmLX0igoKw+v6YvFPY22dY03I0RERnUnYr+olvoKkUUjPnU
 Bg552Z/wnS1EnUmfw3LADoF8aN8uNgG4lv0OvIy/8y7X5cxH07UwWj9j4LRYYDIVshHT
 Va6QtPDAIDUc177wzj2/n/eIHmxOE4/wdgfOfhonxU8M5kmK6z3KktGY3uovalwZFoLb
 bl9Q==
X-Gm-Message-State: AOAM533hvunc4XqFZF46bQnIV78qYIc9P9iKfNHll4TAoADCxgtcDirj
 vDCtbOHKUOelmh07Kl3dJONl4g==
X-Google-Smtp-Source: ABdhPJz+gy7qopMT/b5AA8BVa5aWxWSV04A6Br6J+M2a8ma5BFJoYvg7Jj40fv8t9h+032uRRuXJ8g==
X-Received: by 2002:adf:c14c:: with SMTP id w12mr5035604wre.40.1604699409717; 
 Fri, 06 Nov 2020 13:50:09 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:50:09 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/19] drm/radeon/radeon_drv: Move prototypes to a shared
 headerfile
Date: Fri,  6 Nov 2020 21:49:43 +0000
Message-Id: <20201106214949.2042120-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Gareth Hughes <gareth@valinux.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogNjIgfCB2
b2lkIHJhZGVvbl9kcml2ZXJfdW5sb2FkX2ttcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogfCBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2tt
cy5jOjEwNTo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHJhZGVvbl9k
cml2ZXJfbG9hZF9rbXPigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogMTA1IHwgaW50IHJhZGVv
bl9kcml2ZXJfbG9hZF9rbXMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyBm
bGFncykKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fa21zLmM6NjE5OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCY
cmFkZW9uX2RyaXZlcl9sYXN0Y2xvc2Vfa21z4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIDYx
OSB8IHZvaWQgcmFkZW9uX2RyaXZlcl9sYXN0Y2xvc2Vfa21zKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpCiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fa21zLmM6NjM0OjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig
4oCYcmFkZW9uX2RyaXZlcl9vcGVuX2ttc+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiA2MzQg
fCBpbnQgcmFkZW9uX2RyaXZlcl9vcGVuX2ttcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdikKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmM6NzA1OjY6IHdhcm5pbmc6IG5vIHByZXZpb3Vz
IHByb3RvdHlwZSBmb3Ig4oCYcmFkZW9uX2RyaXZlcl9wb3N0Y2xvc2Vfa21z4oCZIFstV21pc3Np
bmctcHJvdG90eXBlc10KIDcwNSB8IHZvaWQgcmFkZW9uX2RyaXZlcl9wb3N0Y2xvc2Vfa21zKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsCiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4g
S8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogR2Fy
ZXRoIEh1Z2hlcyA8Z2FyZXRoQHZhbGludXguY29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1i
eTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9kcnYuYyB8IDYgLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9kcnYuaCB8IDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwppbmRleCBiYjdi
MzNlNTM1ZjgxLi5lMGQ2NjRlOWUyZmViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYu
YwpAQCAtMTEyLDEyICsxMTIsNiBAQAogI2RlZmluZSBLTVNfRFJJVkVSX01BSk9SCTIKICNkZWZp
bmUgS01TX0RSSVZFUl9NSU5PUgk1MAogI2RlZmluZSBLTVNfRFJJVkVSX1BBVENITEVWRUwJMAot
aW50IHJhZGVvbl9kcml2ZXJfbG9hZF9rbXMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWdu
ZWQgbG9uZyBmbGFncyk7Ci12b2lkIHJhZGVvbl9kcml2ZXJfdW5sb2FkX2ttcyhzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KTsKLXZvaWQgcmFkZW9uX2RyaXZlcl9sYXN0Y2xvc2Vfa21zKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpOwotaW50IHJhZGVvbl9kcml2ZXJfb3Blbl9rbXMoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYpOwotdm9pZCByYWRlb25fZHJp
dmVyX3Bvc3RjbG9zZV9rbXMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKLQkJCQkgc3RydWN0IGRy
bV9maWxlICpmaWxlX3ByaXYpOwogaW50IHJhZGVvbl9zdXNwZW5kX2ttcyhzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCBib29sIHN1c3BlbmQsCiAJCSAgICAgICBib29sIGZiY29uLCBib29sIGZyZWV6
ZSk7CiBpbnQgcmFkZW9uX3Jlc3VtZV9rbXMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgYm9vbCBy
ZXN1bWUsIGJvb2wgZmJjb24pOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuaAppbmRleCAx
NzNkZWI0NjM0MTQ2Li5hYzc5NzA5MTljNGQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9k
cnYuaApAQCAtMTE4LDQgKzExOCwxMSBAQAogbG9uZyByYWRlb25fZHJtX2lvY3RsKHN0cnVjdCBm
aWxlICpmaWxwLAogCQkgICAgICB1bnNpZ25lZCBpbnQgY21kLCB1bnNpZ25lZCBsb25nIGFyZyk7
CiAKK2ludCByYWRlb25fZHJpdmVyX2xvYWRfa21zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVu
c2lnbmVkIGxvbmcgZmxhZ3MpOwordm9pZCByYWRlb25fZHJpdmVyX3VubG9hZF9rbXMoc3RydWN0
IGRybV9kZXZpY2UgKmRldik7Cit2b2lkIHJhZGVvbl9kcml2ZXJfbGFzdGNsb3NlX2ttcyhzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KTsKK2ludCByYWRlb25fZHJpdmVyX29wZW5fa21zKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KTsKK3ZvaWQgcmFkZW9u
X2RyaXZlcl9wb3N0Y2xvc2Vfa21zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCisJCQkJIHN0cnVj
dCBkcm1fZmlsZSAqZmlsZV9wcml2KTsKKwogI2VuZGlmCQkJCS8qIF9fUkFERU9OX0RSVl9IX18g
Ki8KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
