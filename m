Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF4F6CAC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F4F6E81E;
	Mon, 11 Nov 2019 02:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AE96E188;
 Sat,  9 Nov 2019 09:37:45 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 90CE4619E8C40F4C68F4;
 Sat,  9 Nov 2019 17:37:37 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Sat, 9 Nov 2019
 17:37:27 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH -next] drm/amd/display: remove set but not used variable
 'ds_port'
Date: Sat, 9 Nov 2019 17:37:25 +0800
Message-ID: <20191109093725.42364-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYzogSW4gZnVu
Y3Rpb24gZHBfd2FfcG93ZXJfdXBfMDAxMEZBOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8u
Li9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jOjIzMjA6MzU6IHdhcm5pbmc6CiB2YXJpYWJs
ZSBkc19wb3J0IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpJ
dCBpcyBuZXZlciB1c2VkLCBzbyBjYW4gYmUgcmVtb3ZlZC4KClNpZ25lZC1vZmYtYnk6IFl1ZUhh
aWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX2xpbmtfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X2xpbmtfZHAuYwppbmRleCA2NWRlMzJmLi5iODE0Yjc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCkBAIC0yOTEwLDcgKzI5MTAsNiBA
QCBzdGF0aWMgdm9pZCBkcF93YV9wb3dlcl91cF8wMDEwRkEoc3RydWN0IGRjX2xpbmsgKmxpbmss
IHVpbnQ4X3QgKmRwY2RfZGF0YSwKIAkJaW50IGxlbmd0aCkKIHsKIAlpbnQgcmV0cnkgPSAwOwot
CXVuaW9uIGRwX2Rvd25zdHJlYW1fcG9ydF9wcmVzZW50IGRzX3BvcnQgPSB7IDAgfTsKIAogCWlm
ICghbGluay0+ZHBjZF9jYXBzLmRwY2RfcmV2LnJhdykgewogCQlkbyB7CkBAIC0yOTIzLDkgKzI5
MjIsNiBAQCBzdGF0aWMgdm9pZCBkcF93YV9wb3dlcl91cF8wMDEwRkEoc3RydWN0IGRjX2xpbmsg
KmxpbmssIHVpbnQ4X3QgKmRwY2RfZGF0YSwKIAkJfSB3aGlsZSAocmV0cnkrKyA8IDQgJiYgIWxp
bmstPmRwY2RfY2Fwcy5kcGNkX3Jldi5yYXcpOwogCX0KIAotCWRzX3BvcnQuYnl0ZSA9IGRwY2Rf
ZGF0YVtEUF9ET1dOU1RSRUFNUE9SVF9QUkVTRU5UIC0KLQkJCQkgRFBfRFBDRF9SRVZdOwotCiAJ
aWYgKGxpbmstPmRwY2RfY2Fwcy5kb25nbGVfdHlwZSA9PSBESVNQTEFZX0RPTkdMRV9EUF9WR0Ff
Q09OVkVSVEVSKSB7CiAJCXN3aXRjaCAobGluay0+ZHBjZF9jYXBzLmJyYW5jaF9kZXZfaWQpIHsK
IAkJLyogMDAxMEZBIGFjdGl2ZSBkb25nbGVzIChEUC1WR0EsIERQLURMRFZJIGNvbnZlcnRlcnMp
IHBvd2VyIGRvd24KLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
