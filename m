Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B19901AEB2F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F1D6E19A;
	Sat, 18 Apr 2020 09:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034216E3DA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 08:57:17 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7A22E5D4279283938D6F;
 Fri, 17 Apr 2020 16:57:15 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 16:57:08 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lee.jones@linaro.org>, 
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>,
 <b.zolnierkie@samsung.com>, <kgunda@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] backlight: qcom-wled: remove 'wled4_string_cfg' and
 'wled3_string_cfg'
Date: Fri, 17 Apr 2020 17:23:35 +0800
Message-ID: <20200417092335.14163-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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

Rml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9x
Y29tLXdsZWQuYzo5Mzk6MzQ6IHdhcm5pbmc6IOKAmHdsZWQ0X3N0cmluZ19jZmfigJkKZGVmaW5l
ZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgd2xlZF92YXJfY2ZnIHdsZWQ0X3N0cmluZ19jZmcgPSB7CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+CmRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L3Fjb20td2xlZC5jOjkzNTozNDogd2FybmluZzog4oCYd2xlZDNfc3RyaW5nX2NmZ+KAmQpkZWZp
bmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogc3RhdGljIGNvbnN0
IHN0cnVjdCB3bGVkX3Zhcl9jZmcgd2xlZDNfc3RyaW5nX2NmZyA9IHsKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KClJlcG9ydGVkLWJ5OiBIdWxrIFJv
Ym90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFzb24gWWFuIDx5YW5haWpp
ZUBodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jIHwg
OCAtLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9xY29tLXdsZWQuYwppbmRleCAzZDI3NmIzMGE3OGMuLmRmNTNmYmQ1Y2QwMyAxMDA2NDQK
LS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKKysrIGIvZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKQEAgLTkzMiwxNCArOTMyLDYgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCB3bGVkX3Zhcl9jZmcgd2xlZDRfc3RyaW5nX2lfbGltaXRfY2ZnID0gewogCS5z
aXplID0gQVJSQVlfU0laRSh3bGVkNF9zdHJpbmdfaV9saW1pdF92YWx1ZXMpLAogfTsKIAotc3Rh
dGljIGNvbnN0IHN0cnVjdCB3bGVkX3Zhcl9jZmcgd2xlZDNfc3RyaW5nX2NmZyA9IHsKLQkuc2l6
ZSA9IDgsCi19OwotCi1zdGF0aWMgY29uc3Qgc3RydWN0IHdsZWRfdmFyX2NmZyB3bGVkNF9zdHJp
bmdfY2ZnID0gewotCS5zaXplID0gMTYsCi19OwotCiBzdGF0aWMgdTMyIHdsZWRfdmFsdWVzKGNv
bnN0IHN0cnVjdCB3bGVkX3Zhcl9jZmcgKmNmZywgdTMyIGlkeCkKIHsKIAlpZiAoaWR4ID49IGNm
Zy0+c2l6ZSkKLS0gCjIuMjEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
