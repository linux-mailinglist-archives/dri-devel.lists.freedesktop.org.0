Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B1227FE55
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 13:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AA76E887;
	Thu,  1 Oct 2020 11:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2C16E1DE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 11:28:21 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id i26so7467242ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 04:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HCRpJ2Pn4w4wEjljkTH3BlkZyy0/IlRlmbuw4BFW6D4=;
 b=tLG2/RwPOX+3HuPLozQpQPSUwPnnSzyR3woVgRnZ5JlGERC48hfNiSuCTe9ksMgEpU
 2AWk80TZJlnDzEVx4S7pg0AFNAgVufMP2xT5TfxuOWRhsltdWabVaM67PC7mfFverNgc
 b1xw0gc202ttNjy/IW53mnyjYsl3MDh5lOmeJt6ygCYfISaPAGK8MimUUUScZ38jneEr
 l9OxvZhqgrfD8qwebTbr3fGVOM9i3Gnwxk0ZFFaRVMNQla0IOewKaViYfZ3yIkkKt3dM
 28tj+AUPd9uOkoMs9hA+Rb99VF4bYACf2nB/jE3KhpBPbCNKLd4n5L9aO7e1nJyHvhcE
 KwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HCRpJ2Pn4w4wEjljkTH3BlkZyy0/IlRlmbuw4BFW6D4=;
 b=PoF0lnxPHQsd9XBjVUTLYI+sJosWJDnvBunXDNO1F+jmiJolmErM1GaEOZJQ9tln6x
 RVzz+JmbhtylSnIIcXV8JHyt56dINOirwGm/dHHmccVcDjRYl+VReMcXkOir3PinxhVC
 ualxYAdjSk/zmnHNBAgYPtteJZu9p703DGB+VqRlEyc7zPEOrm+iYNUljqYowpvuWq5s
 d9Zm/XO7phV5wbT7TBgp9jtC18EMi0Ddh2XaeAjfoEzsrQL5ThTIEZhXDg4KxBXlPo8m
 seqAZKD+rDZsjQa9fANQcEr+59mxzW8+UUhuXEaHmqeYvDfyaSyH/7sFpuK42oPD9b5z
 Bu3Q==
X-Gm-Message-State: AOAM530yOoUjbWSeft5V3Z85jdPUEwKrKUdWk+qxniu9GRK6Gadchz4m
 74uCo4VjhJXcdjrA5pmILqFO9OpA6vQ=
X-Google-Smtp-Source: ABdhPJx7PsipliZ5cRqHNg91wzclPwNnLkbz187cXx/1Z1MBx0fsKpRGsqNVsb2ZvqTv/2tuw2BDGA==
X-Received: by 2002:a17:906:b7c1:: with SMTP id
 fy1mr7409470ejb.342.1601551699478; 
 Thu, 01 Oct 2020 04:28:19 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:36be:5a08:8c1d:6b2b])
 by smtp.gmail.com with ESMTPSA id p3sm3834892edp.28.2020.10.01.04.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 04:28:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 2/8] drm/ttm: move ttm_set_memory.h out of include
Date: Thu,  1 Oct 2020 13:28:11 +0200
Message-Id: <20201001112817.20967-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201001112817.20967-1-christian.koenig@amd.com>
References: <20201001112817.20967-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBub3Qgc29tZXRoaW5nIGRyaXZlcnMgc2hvdWxkIHVzZS4KClNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmMgICAgICAgICAgICAgIHwgMyArKy0KIGRyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMgICAgICAgICAgfCAzICsrLQoge2lu
Y2x1ZGUgPT4gZHJpdmVycy9ncHV9L2RybS90dG0vdHRtX3NldF9tZW1vcnkuaCB8IDAKIDMgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIHtpbmNs
dWRlID0+IGRyaXZlcnMvZ3B1fS9kcm0vdHRtL3R0bV9zZXRfbWVtb3J5LmggKDEwMCUpCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5jIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5jCmluZGV4IDE0NjYwZjcyM2Y3MS4uOTEyYzMwZGNj
OWRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5jCkBAIC00Nyw3ICs0Nyw4IEBA
CiAKICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9ib19kcml2ZXIuaD4KICNpbmNsdWRlIDxkcm0vdHRt
L3R0bV9wYWdlX2FsbG9jLmg+Ci0jaW5jbHVkZSA8ZHJtL3R0bS90dG1fc2V0X21lbW9yeS5oPgor
CisjaW5jbHVkZSAidHRtX3NldF9tZW1vcnkuaCIKIAogI2RlZmluZSBOVU1fUEFHRVNfVE9fQUxM
T0MJCShQQUdFX1NJWkUvc2l6ZW9mKHN0cnVjdCBwYWdlICopKQogI2RlZmluZSBTTUFMTF9BTExP
Q0FUSU9OCQkxNgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxv
Y19kbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMKaW5kZXgg
NWUyZGYxMTY4NWU3Li4xMDQ1YTVjMjZlZTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFn
ZV9hbGxvY19kbWEuYwpAQCAtNDksNyArNDksOCBAQAogI2luY2x1ZGUgPGxpbnV4L2t0aHJlYWQu
aD4KICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9ib19kcml2ZXIuaD4KICNpbmNsdWRlIDxkcm0vdHRt
L3R0bV9wYWdlX2FsbG9jLmg+Ci0jaW5jbHVkZSA8ZHJtL3R0bS90dG1fc2V0X21lbW9yeS5oPgor
CisjaW5jbHVkZSAidHRtX3NldF9tZW1vcnkuaCIKIAogI2RlZmluZSBOVU1fUEFHRVNfVE9fQUxM
T0MJCShQQUdFX1NJWkUvc2l6ZW9mKHN0cnVjdCBwYWdlICopKQogI2RlZmluZSBTTUFMTF9BTExP
Q0FUSU9OCQk0CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX3NldF9tZW1vcnkuaCBi
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3NldF9tZW1vcnkuaApzaW1pbGFyaXR5IGluZGV4IDEw
MCUKcmVuYW1lIGZyb20gaW5jbHVkZS9kcm0vdHRtL3R0bV9zZXRfbWVtb3J5LmgKcmVuYW1lIHRv
IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3NldF9tZW1vcnkuaAotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
