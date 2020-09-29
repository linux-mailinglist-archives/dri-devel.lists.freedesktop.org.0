Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC26D27E2FD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA3E6E54C;
	Wed, 30 Sep 2020 07:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8967A88F78
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 07:30:08 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 74A5FFD013689A496091;
 Tue, 29 Sep 2020 15:30:04 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Tue, 29 Sep 2020
 15:29:57 +0800
Subject: Re: [PATCH] drm/hisilicon: Delete the unused macro
To: Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao
 <tiantao6@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
References: <1601340326-14049-1-git-send-email-tiantao6@hisilicon.com>
 <b2e756df-a434-f60c-c5f5-0cbb43f00d5c@suse.de>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <e528f881-05bb-3ec0-c0cc-a254288c8c96@huawei.com>
Date: Tue, 29 Sep 2020 15:29:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b2e756df-a434-f60c-c5f5-0cbb43f00d5c@suse.de>
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 30 Sep 2020 07:50:09 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgrlnKggMjAyMC85LzI5IDE1OjI0LCBUaG9tYXMgWmltbWVybWFubiDlhpnpgZM6Cj4gCj4gCj4g
QW0gMjkuMDkuMjAgdW0gMDI6NDUgc2NocmllYiBUaWFuIFRhbzoKPj4gVGhlIG1hY3JvIFBBRERJ
TkcgaXMgbm8gbG9uZ2VyIHVzZWQuIERlbGV0ZSBpdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVGlh
biBUYW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IApUaGFua3MgYSBsb3QgZm9yIHRoZSB0
aW1lbHkgaGVscCB3aXRoIHRoZSByZXZpZXcgY29kZSEKPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUv
ZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZGUuYyB8IDIgLS0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9o
aXNpbGljb24vaGlibWMvaGlibWNfZHJtX2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29u
L2hpYm1jL2hpYm1jX2RybV9kZS5jCj4+IGluZGV4IDRkNTdlYzYuLmIzYTgxZGEgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2RlLmMKPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZGUuYwo+PiBA
QCAtNTIsOCArNTIsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhpYm1jX2Rpc2xheV9wbGxfY29u
ZmlnIGhpYm1jX3BsbF90YWJsZVtdID0gewo+PiAgIAl7MTkyMCwgMTIwMCwgQ1JUX1BMTDFfSFNf
MTkzTUhaLCBDUlRfUExMMl9IU18xOTNNSFp9LAo+PiAgIH07Cj4+ICAgCj4+IC0jZGVmaW5lIFBB
RERJTkcoYWxpZ24sIGRhdGEpICgoKGRhdGEpICsgKGFsaWduKSAtIDEpICYgKH4oKGFsaWduKSAt
IDEpKSkKPj4gLQo+PiAgIHN0YXRpYyBpbnQgaGlibWNfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lLAo+PiAgIAkJCQkgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAq
c3RhdGUpCj4+ICAgewo+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
