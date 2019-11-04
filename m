Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09934EE8B4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BF26E832;
	Mon,  4 Nov 2019 19:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2446E428;
 Mon,  4 Nov 2019 13:20:13 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8E3228FD945005EE6D30;
 Mon,  4 Nov 2019 21:20:09 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 4 Nov 2019
 21:20:02 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Jammy.Zhou@amd.com>, <tianci.yin@amd.com>, <sam@ravnborg.org>,
 <luben.tuikov@amd.com>
Subject: [PATCH 0/7] fix various gcc warnings
Date: Mon, 4 Nov 2019 21:27:19 +0800
Message-ID: <1572874046-30996-1-git-send-email-yukuai3@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 04 Nov 2019 19:35:10 +0000
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

VGhpcyBwYXRjaCBzZXQgZml4ZXMgdmFyaW91cyBnY2Mgd2FybmluZ3MuIAoKeXUga3VhaSAoNyk6
CiAgZHJtL2FtZGdwdTogcmVtb3ZlIDQgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZSBpbgogICAg
YW1kZ3B1X2F0b21iaW9zX2dldF9jb25uZWN0b3JfaW5mb19mcm9tX29iamVjdF90YWJsZQogIGRy
bS9hbWRncHU6IGFkZCBmdW5jdGlvbiBwYXJhbWV0ZXIgZGVzY3JpcHRpb24gaW4KICAgICdhbWRn
cHVfZGV2aWNlX3NldF9jZ19zdGF0ZScKICBkcm0vYW1kZ3B1OiBhZGQgZnVuY3Rpb24gcGFyYW1l
dGVyIGRlc2NyaXB0aW9uIGluICdhbWRncHVfZ2FydF9iaW5kJwogIGRybS9hbWRncHU6IHJlbW92
ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdkaWdfY29ubmVjdG9yJwogIGRybS9hbWRncHU6
IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdkaWcnCiAgZHJtL2FtZGdwdTogcmVt
b3ZlIGFsd2F5cyBmYWxzZSBjb21wYXJpc29uIGluCiAgICAnYW1kZ3B1X2F0b21iaW9zX2kyY19w
cm9jZXNzX2kyY19jaCcKICBkcm0vYW1kZ3B1OiByZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJp
YWJsZSAnbWNfc2hhcmVkX2NobWFwJwoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9hdG9tYmlvcy5jIHwgMjAgKystLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dhcnQuYyAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hdG9tYmlvc19kcC5jICAgICB8ICA1IC0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hdG9tYmlvc19pMmMuYyAgICB8ICA1IC0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjhfMC5jICAgICAgICB8ICAzICstLQogNiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDMwIGRlbGV0aW9ucygtKQoKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
