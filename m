Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23592D0808
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074866E90A;
	Wed,  9 Oct 2019 07:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7A96E8DB;
 Wed,  9 Oct 2019 06:18:12 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 908189DDBE1B181A4B4D;
 Wed,  9 Oct 2019 14:18:08 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Wed, 9 Oct 2019
 14:18:01 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amd/display: Remove set but not used variables
 'bl_pwm_cntl', 'pwm_period_cntl'
Date: Wed, 9 Oct 2019 14:25:10 +0800
Message-ID: <1570602312-49690-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570602312-49690-1-git-send-email-zhengbin13@huawei.com>
References: <1570602312-49690-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
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
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmM6IEluIGZ1bmN0aW9uIGNhbGN1bGF0
ZV8xNl9iaXRfYmFja2xpZ2h0X2Zyb21fcHdtOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9hYm0uYzo4MzoxMTogd2FybmluZzogdmFyaWFibGUgYmxfcHdtX2NudGwgc2V0
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmM6IEluIGZ1bmN0aW9uIGNhbGN1bGF0ZV8xNl9i
aXRfYmFja2xpZ2h0X2Zyb21fcHdtOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
L2RjZV9hYm0uYzo4MjoxMTogd2FybmluZzogdmFyaWFibGUgcHdtX3BlcmlvZF9jbnRsIHNldCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpUaGV5IGFyZSBub3QgdXNl
ZCBzaW5jZSBjb21taXQgNWU3NzczYTIxOWY3ICgiZHJtL2FtZC9kaXNwbGF5OgpETUNVIENvbXBp
bGUgYW5kIExvYWQiKQoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29t
PgpTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jIHwgOCArKysrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hYm0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jCmluZGV4IDllZGQzNjkuLmIz
MDZmYjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNl
X2FibS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5j
CkBAIC04NCwxNSArODQsMTUgQEAgc3RhdGljIHVuc2lnbmVkIGludCBjYWxjdWxhdGVfMTZfYml0
X2JhY2tsaWdodF9mcm9tX3B3bShzdHJ1Y3QgZGNlX2FibSAqYWJtX2RjZSkKIHsKIAl1aW50NjRf
dCBjdXJyZW50X2JhY2tsaWdodDsKIAl1aW50MzJfdCByb3VuZF9yZXN1bHQ7Ci0JdWludDMyX3Qg
cHdtX3BlcmlvZF9jbnRsLCBibF9wZXJpb2QsIGJsX2ludF9jb3VudDsKLQl1aW50MzJfdCBibF9w
d21fY250bCwgYmxfcHdtLCBmcmFjdGlvbmFsX2R1dHlfY3ljbGVfZW47CisJdWludDMyX3QgYmxf
cGVyaW9kLCBibF9pbnRfY291bnQ7CisJdWludDMyX3QgYmxfcHdtLCBmcmFjdGlvbmFsX2R1dHlf
Y3ljbGVfZW47CiAJdWludDMyX3QgYmxfcGVyaW9kX21hc2ssIGJsX3B3bV9tYXNrOwoKLQlwd21f
cGVyaW9kX2NudGwgPSBSRUdfUkVBRChCTF9QV01fUEVSSU9EX0NOVEwpOworCVJFR19SRUFEKEJM
X1BXTV9QRVJJT0RfQ05UTCk7CiAJUkVHX0dFVChCTF9QV01fUEVSSU9EX0NOVEwsIEJMX1BXTV9Q
RVJJT0QsICZibF9wZXJpb2QpOwogCVJFR19HRVQoQkxfUFdNX1BFUklPRF9DTlRMLCBCTF9QV01f
UEVSSU9EX0JJVENOVCwgJmJsX2ludF9jb3VudCk7CgotCWJsX3B3bV9jbnRsID0gUkVHX1JFQUQo
QkxfUFdNX0NOVEwpOworCVJFR19SRUFEKEJMX1BXTV9DTlRMKTsKIAlSRUdfR0VUKEJMX1BXTV9D
TlRMLCBCTF9BQ1RJVkVfSU5UX0ZSQUNfQ05ULCAodWludDMyX3QgKikoJmJsX3B3bSkpOwogCVJF
R19HRVQoQkxfUFdNX0NOVEwsIEJMX1BXTV9GUkFDVElPTkFMX0VOLCAmZnJhY3Rpb25hbF9kdXR5
X2N5Y2xlX2VuKTsKCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
