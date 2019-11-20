Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2560F104D0B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A856EB7B;
	Thu, 21 Nov 2019 08:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443156E443;
 Wed, 20 Nov 2019 12:54:23 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9690A185A7C5B051E633;
 Wed, 20 Nov 2019 20:54:19 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 20 Nov 2019
 20:54:10 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Jammy.Zhou@amd.com>, <tianci.yin@amd.com>, <sam@ravnborg.org>,
 <luben.tuikov@amd.com>
Subject: [PATCH 0/2] fix inappropriate use of declaring variable 'static' in
 fixed31_32.h
Date: Wed, 20 Nov 2019 21:15:31 +0800
Message-ID: <20191120131533.12720-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:59:20 +0000
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhengbin13@huawei.com,
 amd-gfx@lists.freedesktop.org, yukuai3@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZpcnN0IHBhdGNoIHJlbW92ZSB0d28gc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZS4KClRo
ZSBzZWNvbmQgcGF0Y2ggbWFrZSB0aGUgdmFyaWFibGVzIGluIGZpeGVkMzFfMzIuaCAnZ2xvYmFs
JwppbnN0ZWFkIG9mICdzdGF0aWMnLgoKeXUga3VhaSAoMik6CiAgZHJtL2FtZC9kaXNwbGF5OiBy
ZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZSAnZGNfZml4cHRfZScgYW5kCiAgICAnZGNf
Zml4cHRfcGknCiAgZHJtL2FtZC9kaXNwbGF5OiBtYWtlIHZhcmlvdXMgdmFyaWFibGVzIGluIGZp
eGVkMzFfMzIuaCAnZ2xvYmFsJwogICAgaW5zdGVhZCBvZiAnc3RhdGljJwoKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vTWFrZWZpbGUgfCAgMiArLQogLi4uL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2ZpeGVkMzFfMzIuYyB8IDEzICsrKysrKysrKysrKysKIC4u
Li9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZml4ZWQzMV8zMi5oICAgfCAxOCArKysrKysr
Ky0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9maXhlZDMxXzMyLmMKCi0tIAoyLjE3LjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
