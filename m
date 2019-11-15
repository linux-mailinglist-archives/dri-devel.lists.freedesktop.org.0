Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF330FF8F4
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45A46E296;
	Sun, 17 Nov 2019 11:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BEE6E5F5;
 Fri, 15 Nov 2019 13:35:23 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5A0283D9A540D32C7C2C;
 Fri, 15 Nov 2019 21:35:20 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Fri, 15 Nov 2019
 21:35:10 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <bskeggs@redhat.com>, <lyude@redhat.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/nouveau: remove set but not used variable 'pclks',
 'width'
Date: Fri, 15 Nov 2019 21:42:32 +0800
Message-ID: <1573825353-86268-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573825353-86268-1-git-send-email-zhengbin13@huawei.com>
References: <1573825353-86268-1-git-send-email-zhengbin13@huawei.com>
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
cHUvZHJtL25vdXZlYXUvZGlzcG52MDQvYXJiLmM6IEluIGZ1bmN0aW9uIG52MDRfY2FsY19hcmI6
CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2FyYi5jOjU5OjIxOiB3YXJuaW5nOiB2
YXJpYWJsZSBwY2xrcyBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxl
XQpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9hcmIuYzogSW4gZnVuY3Rpb24gbnYw
NF9jYWxjX2FyYjoKZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvYXJiLmM6NTg6MjE6
IHdhcm5pbmc6IHZhcmlhYmxlIHdpZHRoIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1z
ZXQtdmFyaWFibGVdCgpJdCBpcyBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCA2ZWU3Mzg2MTBmNDEgKCJk
cm0vbm91dmVhdToKQWRkIERSTSBkcml2ZXIgZm9yIE5WSURJQSBHUFVzIiksIGJ1dCBuZXZlciB1
c2VkLApzbyByZW1vdmUgaXQuCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdl
aS5jb20+ClNpZ25lZC1vZmYtYnk6IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvYXJiLmMgfCA2ICsrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9hcmIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjA0L2FyYi5jCmluZGV4IDM2MjQ5NTUuLjlkNGEyZDkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2FyYi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2FyYi5jCkBAIC01Myw4ICs1Myw4IEBAIHN0cnVjdCBu
dl9zaW1fc3RhdGUgewogc3RhdGljIHZvaWQKIG52MDRfY2FsY19hcmIoc3RydWN0IG52X2ZpZm9f
aW5mbyAqZmlmbywgc3RydWN0IG52X3NpbV9zdGF0ZSAqYXJiKQogewotCWludCBwYWdlbWlzcywg
Y2FzLCB3aWR0aCwgYnBwOwotCWludCBudmNsa3MsIG1jbGtzLCBwY2xrcywgY3J0cGFnZW1pc3M7
CisJaW50IHBhZ2VtaXNzLCBjYXMsIGJwcDsKKwlpbnQgbnZjbGtzLCBtY2xrcywgY3J0cGFnZW1p
c3M7CiAJaW50IGZvdW5kLCBtY2xrX2V4dHJhLCBtY2xrX2xvb3AsIGNicywgbTEsIHAxOwogCWlu
dCBtY2xrX2ZyZXEsIHBjbGtfZnJlcSwgbnZjbGtfZnJlcTsKIAlpbnQgdXNfbSwgdXNfbiwgdXNf
cCwgY3J0Y19kcmFpbl9yYXRlOwpAQCAtNjUsMTEgKzY1LDkgQEAgbnYwNF9jYWxjX2FyYihzdHJ1
Y3QgbnZfZmlmb19pbmZvICpmaWZvLCBzdHJ1Y3QgbnZfc2ltX3N0YXRlICphcmIpCiAJbnZjbGtf
ZnJlcSA9IGFyYi0+bnZjbGtfa2h6OwogCXBhZ2VtaXNzID0gYXJiLT5tZW1fcGFnZV9taXNzOwog
CWNhcyA9IGFyYi0+bWVtX2xhdGVuY3k7Ci0Jd2lkdGggPSBhcmItPm1lbW9yeV93aWR0aCA+PiA2
OwogCWJwcCA9IGFyYi0+YnBwOwogCWNicyA9IDEyODsKCi0JcGNsa3MgPSAyOwogCW52Y2xrcyA9
IDEwOwogCW1jbGtzID0gMTMgKyBjYXM7CiAJbWNsa19leHRyYSA9IDM7Ci0tCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
