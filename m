Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B3B8DFE2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 23:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A3C6E852;
	Wed, 14 Aug 2019 21:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFCA6E853
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 21:31:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 31so478384wrm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 14:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0TzjYpMy9+0zUnyIhGVp0XLreAg3cbu7k5uuH85z42Y=;
 b=pxzEnMdU6+JrSLM7MwMVuSZLrHueUcluU4AegYDP69JHjd1AMDlfX6Bg+orL+J8ZJd
 rhW5IcAmYA1dF9NM59WoSE4+1JWzo+TfMG4KbUYcfaWIm1Z/vIozvM5rHxpGqFsfu2y+
 IW8hmpZvDegd2Ib0f+q8/MgTx5wT3GXZWhdR1PpHL+4VCKQHRNlXE9yZuILkG5LMhz7Z
 akagBNfHrGHeq7DaBLJrxINgW66SshJqRRufkFfi0/SS/A/+TOlkJIXvQlCs6RaF5z5k
 65kPwxvcETfoyvhAluMt+9hRlRv8vepxAdhhKI2z9BgwzQ/1e0UP5xeis/cLIqVjd0xy
 2hSg==
X-Gm-Message-State: APjAAAUuqHLGqCaVk2wweVQSVmp0345PSymutMT9CfDs3j/mDYmTZZgW
 +2Mz2zFvmUpMx2HNoQxem2qs0g==
X-Google-Smtp-Source: APXvYqzZayfXMMmK+XvZtOaSr4FuQVJXXrQ0d8j9SpvLi3XGme93Isve666keCnmVjrWEvMt/EDx6g==
X-Received: by 2002:a5d:4284:: with SMTP id k4mr1733516wrq.6.1565818296138;
 Wed, 14 Aug 2019 14:31:36 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8108:453f:d1a0:28d1:9d88:57f6:f95b])
 by smtp.gmail.com with ESMTPSA id r17sm2095134wrg.93.2019.08.14.14.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 14:31:26 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH 4/7] drm/nouveau/pci: enable pcie link changes for pascal
Date: Wed, 14 Aug 2019 23:31:15 +0200
Message-Id: <20190814213118.28473-5-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814213118.28473-1-kherbst@redhat.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
MIME-Version: 1.0
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
Cc: Karol Herbst <kherbst@redhat.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+ClJldmlld2Vk
LWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDQzogQWxleCBIdW5nIDxhbGV4Lmh1
bmdAY2Fub25pY2FsLmNvbT4KQ0M6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWwuai53eXNvY2tp
QGludGVsLmNvbT4KQ0M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNDOiBMeXVk
ZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDQzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5j
IHwgIDggKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9n
cDEwMC5jIHwgMTAgKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJk
ZXYvcGNpL3ByaXYuaCAgfCAgNSArKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L3BjaS9nazEwNC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvcGNpL2drMTA0LmMKaW5kZXggZTY4MDMwNTA3ZDg4Li42NjQ4OTAxODVlMTUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5jCkBAIC0y
Myw3ICsyMyw3IEBACiAgKi8KICNpbmNsdWRlICJwcml2LmgiCiAKLXN0YXRpYyBpbnQKK2ludAog
Z2sxMDRfcGNpZV92ZXJzaW9uX3N1cHBvcnRlZChzdHJ1Y3QgbnZrbV9wY2kgKnBjaSkKIHsKIAly
ZXR1cm4gKG52a21fcmQzMihwY2ktPnN1YmRldi5kZXZpY2UsIDB4OGMxYzApICYgMHg0KSA9PSAw
eDQgPyAyIDogMTsKQEAgLTEwOCw3ICsxMDgsNyBAQCBnazEwNF9wY2llX2xua2N0bF9zcGVlZChz
dHJ1Y3QgbnZrbV9wY2kgKnBjaSkKIAlyZXR1cm4gLTE7CiB9CiAKLXN0YXRpYyBlbnVtIG52a21f
cGNpZV9zcGVlZAorZW51bSBudmttX3BjaWVfc3BlZWQKIGdrMTA0X3BjaWVfbWF4X3NwZWVkKHN0
cnVjdCBudmttX3BjaSAqcGNpKQogewogCXUzMiBtYXhfc3BlZWQgPSBudmttX3JkMzIocGNpLT5z
dWJkZXYuZGV2aWNlLCAweDhjMWMwKSAmIDB4MzAwMDAwOwpAQCAtMTQ2LDcgKzE0Niw3IEBAIGdr
MTA0X3BjaWVfc2V0X2xpbmtfc3BlZWQoc3RydWN0IG52a21fcGNpICpwY2ksIGVudW0gbnZrbV9w
Y2llX3NwZWVkIHNwZWVkKQogCW52a21fbWFzayhkZXZpY2UsIDB4OGMwNDAsIDB4MSwgMHgxKTsK
IH0KIAotc3RhdGljIGludAoraW50CiBnazEwNF9wY2llX2luaXQoc3RydWN0IG52a21fcGNpICog
cGNpKQogewogCWVudW0gbnZrbV9wY2llX3NwZWVkIGxua2N0bF9zcGVlZCwgbWF4X3NwZWVkLCBj
YXBfc3BlZWQ7CkBAIC0xNzgsNyArMTc4LDcgQEAgZ2sxMDRfcGNpZV9pbml0KHN0cnVjdCBudmtt
X3BjaSAqIHBjaSkKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludAoraW50CiBnazEwNF9wY2ll
X3NldF9saW5rKHN0cnVjdCBudmttX3BjaSAqcGNpLCBlbnVtIG52a21fcGNpZV9zcGVlZCBzcGVl
ZCwgdTggd2lkdGgpCiB7CiAJc3RydWN0IG52a21fc3ViZGV2ICpzdWJkZXYgPSAmcGNpLT5zdWJk
ZXY7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kv
Z3AxMDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9ncDEwMC5j
CmluZGV4IDgyYzUyMzRhMDZmZi4uZWIxOWM3YTQ0NTYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ3AxMDAuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ3AxMDAuYwpAQCAtMzUsNiArMzUsMTYgQEAgZ3Ax
MDBfcGNpX2Z1bmMgPSB7CiAJLndyMDggPSBudjQwX3BjaV93cjA4LAogCS53cjMyID0gbnY0MF9w
Y2lfd3IzMiwKIAkubXNpX3JlYXJtID0gZ3AxMDBfcGNpX21zaV9yZWFybSwKKworCS5wY2llLmlu
aXQgPSBnazEwNF9wY2llX2luaXQsCisJLnBjaWUuc2V0X2xpbmsgPSBnazEwNF9wY2llX3NldF9s
aW5rLAorCisJLnBjaWUubWF4X3NwZWVkID0gZ2sxMDRfcGNpZV9tYXhfc3BlZWQsCisJLnBjaWUu
Y3VyX3NwZWVkID0gZzg0X3BjaWVfY3VyX3NwZWVkLAorCisJLnBjaWUuc2V0X3ZlcnNpb24gPSBn
ZjEwMF9wY2llX3NldF92ZXJzaW9uLAorCS5wY2llLnZlcnNpb24gPSBnZjEwMF9wY2llX3ZlcnNp
b24sCisJLnBjaWUudmVyc2lvbl9zdXBwb3J0ZWQgPSBnazEwNF9wY2llX3ZlcnNpb25fc3VwcG9y
dGVkLAogfTsKIAogaW50CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmtt
L3N1YmRldi9wY2kvcHJpdi5oIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
cGNpL3ByaXYuaAppbmRleCA3MDA5YWFkODZiNmUuLjE2MmVkNWRjNmZjMyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3ByaXYuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcHJpdi5oCkBAIC01NCw2ICs1NCwx
MSBAQCBpbnQgZ2YxMDBfcGNpZV9jYXBfc3BlZWQoc3RydWN0IG52a21fcGNpICopOwogaW50IGdm
MTAwX3BjaWVfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKik7CiBpbnQgZ2YxMDBfcGNpZV9zZXRfbGlu
ayhzdHJ1Y3QgbnZrbV9wY2kgKiwgZW51bSBudmttX3BjaWVfc3BlZWQsIHU4KTsKIAoraW50IGdr
MTA0X3BjaWVfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKik7CitpbnQgZ2sxMDRfcGNpZV9zZXRfbGlu
ayhzdHJ1Y3QgbnZrbV9wY2kgKiwgZW51bSBudmttX3BjaWVfc3BlZWQsIHU4IHdpZHRoKTsKK2Vu
dW0gbnZrbV9wY2llX3NwZWVkIGdrMTA0X3BjaWVfbWF4X3NwZWVkKHN0cnVjdCBudmttX3BjaSAq
KTsKK2ludCBnazEwNF9wY2llX3ZlcnNpb25fc3VwcG9ydGVkKHN0cnVjdCBudmttX3BjaSAqKTsK
KwogaW50IG52a21fcGNpZV9vbmVpbml0KHN0cnVjdCBudmttX3BjaSAqKTsKIGludCBudmttX3Bj
aWVfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKik7CiAjZW5kaWYKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
