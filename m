Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF040275294
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275796E462;
	Wed, 23 Sep 2020 07:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FB86E3CE;
 Wed, 23 Sep 2020 00:57:49 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 34A3E1A1E958435A12C6;
 Wed, 23 Sep 2020 08:57:47 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Wed, 23 Sep 2020 08:57:36 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <lyude@redhat.com>, <airlied@redhat.com>,
 <pankaj.laxminarayan.bharadiya@intel.com>, <alexander.deucher@amd.com>,
 <tiwai@suse.de>, <jajones@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH v2] drm/nouveau/kms: Remove set but not used 'ret'
Date: Wed, 23 Sep 2020 08:55:10 +0800
Message-ID: <1600822510-7778-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRyZXNzZXMgdGhlIGZvbGxvd2luZyBnY2Mgd2FybmluZyB3aXRoICJtYWtlIFc9MSI6
CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzogSW4gZnVuY3Rpb24g4oCY
bnY1MF9tc3RtX3ByZXBhcmXigJk6CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rp
c3AuYzoxMzc4OjY6IHdhcm5pbmc6CnZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1c2Vk
IFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKU2lnbmVkLW9mZi1ieTogVGlhbiBUYW8gPHRp
YW50YW82QGhpc2lsaWNvbi5jb20+ClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgotLS0KdjI6UmVtb3ZlIHRoZSBicmFjZXMgYXJvdW5kIHJldAotLS0KIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNw
bnY1MC9kaXNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKaW5k
ZXggYjExMWZlMi4uYWJjNGY0NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
ZGlzcG52NTAvZGlzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rp
c3AuYwpAQCAtMTM3OSw2ICsxMzc5LDggQEAgbnY1MF9tc3RtX3ByZXBhcmUoc3RydWN0IG52NTBf
bXN0bSAqbXN0bSkKIAogCU5WX0FUT01JQyhkcm0sICIlczogbXN0bSBwcmVwYXJlXG4iLCBtc3Rt
LT5vdXRwLT5iYXNlLmJhc2UubmFtZSk7CiAJcmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3Bh
cnQxKCZtc3RtLT5tZ3IpOworCWlmIChyZXQpCisJCU5WX0FUT01JQyhkcm0sICJmYWlsZWQgdG8g
dXBkYXRlIHBheWxvYWQgJWRcbiIsIHJldCk7CiAKIAlkcm1fZm9yX2VhY2hfZW5jb2RlcihlbmNv
ZGVyLCBtc3RtLT5vdXRwLT5iYXNlLmJhc2UuZGV2KSB7CiAJCWlmIChlbmNvZGVyLT5lbmNvZGVy
X3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9EUE1TVCkgewotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
