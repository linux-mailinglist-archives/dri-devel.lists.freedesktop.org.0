Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1B0D399D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2136EBB7;
	Fri, 11 Oct 2019 06:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D066EA9B;
 Thu, 10 Oct 2019 06:48:08 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 46110802107B28235897;
 Thu, 10 Oct 2019 14:48:07 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 10 Oct 2019
 14:47:56 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@chromium.org>, <sean@poorly.run>, <airlied@linux.ie>,
 <bjorn.andersson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/msm/mdp5: Remove set but not used variable 'hw_cfg'
 in blend_setup
Date: Thu, 10 Oct 2019 14:55:04 +0800
Message-ID: <1570690506-83287-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
References: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
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
cHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jcnRjLmM6IEluIGZ1bmN0aW9uIGJsZW5kX3NldHVw
Ogpkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NydGMuYzoyMjU6Mjg6IHdhcm5p
bmc6IHZhcmlhYmxlIGh3X2NmZyBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQoKSXQgaXMgbm90IHVzZWQgc2luY2UgY29tbWl0IDE0YmUzMjAwY2Q1ZiAoImRybS9t
c206IHJlbmFtZSBtZHAtPmRpc3AiKQoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBo
dWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY3J0Yy5jIHwgMyAtLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L21kcDUvbWRwNV9jcnRjLmMKaW5kZXggZWIwYjRiNy4uMDVjYzA0ZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jcnRjLmMKQEAgLTIxNCw3ICsyMTQsNiBAQCBzdGF0aWMg
dm9pZCBibGVuZF9zZXR1cChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJc3RydWN0IG1kcDVfcGlw
ZWxpbmUgKnBpcGVsaW5lID0gJm1kcDVfY3N0YXRlLT5waXBlbGluZTsKIAlzdHJ1Y3QgbWRwNV9r
bXMgKm1kcDVfa21zID0gZ2V0X2ttcyhjcnRjKTsKIAlzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZTsK
LQljb25zdCBzdHJ1Y3QgbWRwNV9jZmdfaHcgKmh3X2NmZzsKIAlzdHJ1Y3QgbWRwNV9wbGFuZV9z
dGF0ZSAqcHN0YXRlLCAqcHN0YXRlc1tTVEFHRV9NQVggKyAxXSA9IHtOVUxMfTsKIAljb25zdCBz
dHJ1Y3QgbWRwX2Zvcm1hdCAqZm9ybWF0OwogCXN0cnVjdCBtZHA1X2h3X21peGVyICptaXhlciA9
IHBpcGVsaW5lLT5taXhlcjsKQEAgLTIzMiw4ICsyMzEsNiBAQCBzdGF0aWMgdm9pZCBibGVuZF9z
ZXR1cChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJdTMyIHZhbDsKICNkZWZpbmUgYmxlbmRlcihz
dGFnZSkJKChzdGFnZSkgLSBTVEFHRTApCgotCWh3X2NmZyA9IG1kcDVfY2ZnX2dldF9od19jb25m
aWcobWRwNV9rbXMtPmNmZyk7Ci0KIAlzcGluX2xvY2tfaXJxc2F2ZSgmbWRwNV9jcnRjLT5sbV9s
b2NrLCBmbGFncyk7CgogCS8qIGN0bCBjb3VsZCBiZSByZWxlYXNlZCBhbHJlYWR5IHdoZW4gd2Ug
YXJlIHNodXR0aW5nIGRvd246ICovCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
