Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C51DFCCB4C
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF95E6E3D2;
	Sat,  5 Oct 2019 16:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FD46E1CD;
 Sat,  5 Oct 2019 02:53:08 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CF478276CFE05B825D06;
 Sat,  5 Oct 2019 10:37:33 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 10:37:26 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/amd/display: Remove set but not used variable
 'pixel_width'
Date: Sat, 5 Oct 2019 10:44:35 +0800
Message-ID: <1570243476-44419-5-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570243476-44419-1-git-send-email-zhengbin13@huawei.com>
References: <1570243476-44419-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:30 +0000
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
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RwcC5jOiBJbiBmdW5jdGlvbiBkcHAy
X2dldF9vcHRpbWFsX251bWJlcl9vZl90YXBzOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfZHBwLmM6MzU5OjExOiB3YXJuaW5nOiB2YXJpYWJsZSBwaXhlbF93aWR0
aCBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMgbm90
IHVzZWQgc2luY2UgY29tbWl0IGY3ZGU5NmVlOGI1ZiAoImRybS9hbWQvZGlzcGxheToKQWRkIERD
TjIgRFBQIikKClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2ln
bmVkLW9mZi1ieTogemhlbmdiaW4gPHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHBwLmMgfCA3IC0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kcHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9kcHAuYwppbmRleCAyZjVhYWRlLi5hZTg1MzQzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHBwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RwcC5jCkBA
IC0zNzYsMTMgKzM3Niw2IEBAIGJvb2wgZHBwMl9nZXRfb3B0aW1hbF9udW1iZXJfb2ZfdGFwcygK
IAkJc3RydWN0IHNjYWxlcl9kYXRhICpzY2xfZGF0YSwKIAkJY29uc3Qgc3RydWN0IHNjYWxpbmdf
dGFwcyAqaW5fdGFwcykKIHsKLQl1aW50MzJfdCBwaXhlbF93aWR0aDsKLQotCWlmIChzY2xfZGF0
YS0+dmlld3BvcnQud2lkdGggPiBzY2xfZGF0YS0+cmVjb3V0LndpZHRoKQotCQlwaXhlbF93aWR0
aCA9IHNjbF9kYXRhLT5yZWNvdXQud2lkdGg7Ci0JZWxzZQotCQlwaXhlbF93aWR0aCA9IHNjbF9k
YXRhLT52aWV3cG9ydC53aWR0aDsKLQogCS8qIFNvbWUgQVNJQ3MgZG9lcyBub3Qgc3VwcG9ydCAg
RlAxNiBzY2FsaW5nLCBzbyB3ZSByZWplY3QgbW9kZXMgcmVxdWlyZSB0aGlzKi8KIAlpZiAoc2Ns
X2RhdGEtPnZpZXdwb3J0LndpZHRoICAhPSBzY2xfZGF0YS0+aF9hY3RpdmUgJiYKIAkJc2NsX2Rh
dGEtPnZpZXdwb3J0LmhlaWdodCAhPSBzY2xfZGF0YS0+dl9hY3RpdmUgJiYKLS0KMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
