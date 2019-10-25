Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C594E5214
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 19:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46138973E;
	Fri, 25 Oct 2019 17:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28A38973E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 17:11:54 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iO37w-00014o-0d; Fri, 25 Oct 2019 17:11:52 +0000
From: Colin King <colin.king@canonical.com>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: remove redundant assignment to variable ret
Date: Fri, 25 Oct 2019 18:11:51 +0100
Message-Id: <20191025171151.3493-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSB2YXJp
YWJsZSByZXQgaXMgYmVpbmcgYXNzaWduZWQgd2l0aCBhIHZhbHVlIHRoYXQKaXMgbmV2ZXIgcmVh
ZCBhbmQgaXMgYmVpbmcgcmUtYXNzaWduZWQgb24gdGhlIG5leHQgc3RhdGVtZW50LgpUaGUgYXNz
aWdubWVudCBpcyByZWR1bmRhbnQgYW5kIGhlbmNlIGNhbiBiZSByZW1vdmVkLgoKQWRkcmVzc2Vz
LUNvdmVyaXR5OiAoIlVudXNlZCB2YWx1ZSIpClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5n
IDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfc2Nybi5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc2Nybi5jIGIvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfc2Nybi5jCmluZGV4IGU1YTI4MzI2MzIxMS4uYjZhOGNlMjNk
M2E4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zY3JuLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc2Nybi5jCkBAIC05NTksOCArOTU5LDYg
QEAgaW50IHZtd19rbXNfc291X2luaXRfZGlzcGxheShzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9w
cml2KQogCQlyZXR1cm4gLUVOT1NZUzsKIAl9CiAKLQlyZXQgPSAtRU5PTUVNOwotCiAJcmV0ID0g
ZHJtX3ZibGFua19pbml0KGRldiwgVk1XR0ZYX05VTV9ESVNQTEFZX1VOSVRTKTsKIAlpZiAodW5s
aWtlbHkocmV0ICE9IDApKQogCQlyZXR1cm4gcmV0OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
