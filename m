Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA89B268558
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6156E1E8;
	Mon, 14 Sep 2020 07:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33956E03F;
 Sat, 12 Sep 2020 02:23:11 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C232617BFD37532447B9;
 Sat, 12 Sep 2020 10:23:04 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Sat, 12 Sep 2020
 10:22:55 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <mikita.lipski@amd.com>, <eryk.brol@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: add debugfs entry for trigger_hotplug
Date: Sat, 12 Sep 2020 10:22:14 +0800
Message-ID: <20200912022214.3767954-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>, Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICd0cmlnZ2VyX2hvdHBsdWcnIGVudHJ5IGluIGRlYnVnZnMgaXMgZGVmaW5lZCBidXQgbm90
IHdpcmVkIHVwLiBUaGlzCmNhdXNlcyBhIGdjYyB3YXJuaW5nIGJ1aWxkIHdpdGggVz0xLgoKZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2Rl
YnVnZnMuYzoyMDQ1OjM3Ogp3YXJuaW5nOiDigJhkcF90cmlnZ2VyX2hvdHBsdWdfZGVidWdmc19m
b3Bz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkClstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiAy
MDQ1IHwgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMKICAgICAgZHBfdHJpZ2dl
cl9ob3RwbHVnX2RlYnVnZnNfZm9wcyA9IHsKICAgICAgfApefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+CgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNp
Z25lZC1vZmYtYnk6IEphc29uIFlhbiA8eWFuYWlqaWVAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9kZWJ1Z2ZzLmMgfCAxICsK
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMuYwppbmRleCA5
NGZjYjA4NjE1NGMuLjk3MmM3ODBiNjI5MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMuYwpAQCAtMjExNSw2
ICsyMTE1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB7CiAJCXsiZHNjX3BpY19oZWlnaHQiLCAm
ZHBfZHNjX3BpY19oZWlnaHRfZGVidWdmc19mb3BzfSwKIAkJeyJkc2NfY2h1bmtfc2l6ZSIsICZk
cF9kc2NfY2h1bmtfc2l6ZV9kZWJ1Z2ZzX2ZvcHN9LAogCQl7ImRzY19zbGljZV9icGciLCAmZHBf
ZHNjX3NsaWNlX2JwZ19vZmZzZXRfZGVidWdmc19mb3BzfSwKKwkJeyJ0cmlnZ2VyX2hvdHBsdWci
LCAmZHBfdHJpZ2dlcl9ob3RwbHVnX2RlYnVnZnNfZm9wc30sCiAJCXsiZHBfZHNjX2ZlY19zdXBw
b3J0IiwgJmRwX2RzY19mZWNfc3VwcG9ydF9mb3BzfQogfTsKIAotLSAKMi4yNS40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
