Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B24FF92A
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171F36E3BC;
	Sun, 17 Nov 2019 11:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ED96E519;
 Fri, 15 Nov 2019 12:05:53 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id F16483CF5751AA724F9D;
 Fri, 15 Nov 2019 20:05:46 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Fri, 15 Nov 2019
 20:05:38 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/6] drm/radeon: remove set but not used variable
 'radeon_connector'
Date: Fri, 15 Nov 2019 20:12:58 +0800
Message-ID: <1573819980-54523-5-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573819980-54523-1-git-send-email-zhengbin13@huawei.com>
References: <1573819980-54523-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jOiBJbiBmdW5jdGlvbiByYWRlb25fY3J0Y19z
Y2FsaW5nX21vZGVfZml4dXA6CmRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXku
YzoxNjg1OjI3OiB3YXJuaW5nOiB2YXJpYWJsZSByYWRlb25fY29ubmVjdG9yIHNldCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpJdCBpcyBub3QgdXNlZCBzaW5jZSBj
b21taXQgMzc3YmQ4YTk4ZDdkICgiZHJtL3JhZGVvbjoKdXNlIGEgZmV0Y2ggZnVuY3Rpb24gdG8g
Z2V0IHRoZSBlZGlkIikKClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNv
bT4KU2lnbmVkLW9mZi1ieTogemhlbmdiaW4gPHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMgfCAyIC0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5
LmMKaW5kZXggZTgxYjAxZi4uODRkM2Q4ODUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9kaXNwbGF5LmMKQEAgLTE2ODcsNyArMTY4Nyw2IEBAIGJvb2wgcmFkZW9uX2NydGNfc2NhbGlu
Z19tb2RlX2ZpeHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlzdHJ1Y3QgcmFkZW9uX2NydGMg
KnJhZGVvbl9jcnRjID0gdG9fcmFkZW9uX2NydGMoY3J0Yyk7CiAJc3RydWN0IHJhZGVvbl9lbmNv
ZGVyICpyYWRlb25fZW5jb2RlcjsKIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwot
CXN0cnVjdCByYWRlb25fY29ubmVjdG9yICpyYWRlb25fY29ubmVjdG9yOwogCWJvb2wgZmlyc3Qg
PSB0cnVlOwogCXUzMiBzcmNfdiA9IDEsIGRzdF92ID0gMTsKIAl1MzIgc3JjX2ggPSAxLCBkc3Rf
aCA9IDE7CkBAIC0xNzAwLDcgKzE2OTksNiBAQCBib29sIHJhZGVvbl9jcnRjX3NjYWxpbmdfbW9k
ZV9maXh1cChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJCQljb250aW51ZTsKIAkJcmFkZW9uX2Vu
Y29kZXIgPSB0b19yYWRlb25fZW5jb2RlcihlbmNvZGVyKTsKIAkJY29ubmVjdG9yID0gcmFkZW9u
X2dldF9jb25uZWN0b3JfZm9yX2VuY29kZXIoZW5jb2Rlcik7Ci0JCXJhZGVvbl9jb25uZWN0b3Ig
PSB0b19yYWRlb25fY29ubmVjdG9yKGNvbm5lY3Rvcik7CgogCQlpZiAoZmlyc3QpIHsKIAkJCS8q
IHNldCBzY2FsaW5nICovCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
