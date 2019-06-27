Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B99F57DAC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 10:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696776E826;
	Thu, 27 Jun 2019 08:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9EBDB6E82C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 08:01:37 +0000 (UTC)
X-UUID: af4a2c27b60c4198b5025a5939c6f097-20190627
X-UUID: af4a2c27b60c4198b5025a5939c6f097-20190627
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1262622998; Thu, 27 Jun 2019 16:01:27 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 27 Jun 2019 16:01:25 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 27 Jun 2019 16:01:23 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, <linux-pwm@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [v5 4/7] drm/mediatek: add frame size control
Date: Thu, 27 Jun 2019 16:01:12 +0800
Message-ID: <20190627080116.40264-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627080116.40264-1-jitao.shi@mediatek.com>
References: <20190627080116.40264-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24720.003
X-TM-AS-Result: No-7.797800-8.000000-10
X-TMASE-MatchedRID: 4fIxLVRlVoz935chln091FZ85UImhNta+eBf9ovw8I2RoQLwUmtov7BZ
 szSz1qei2XHJ0L4jOITTDbyTDLiYnZxBJWVIsdLqA9lly13c/gE5B3KUNlRt51VkJxysad/IJTn
 jWSezJPZBXFYsxXKTlvssoJBke0RlqZWpk+GKRVNIUlKkz3wfmX0tCKdnhB589yM15V5aWpj6C0
 ePs7A07RQEL0GGu6SDsXWDONKz/s5QaPnzkRZpYjy4hCRTklRkE6fTC+T7uQ4=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.797800-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24720.003
X-TM-SNTS-SMTP: C8B5EEBD7AA18A239CFB080C5B9AB92E1996F13A41DB17C5AA1328425E81A0FC2000:8
X-MTK: N
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
Cc: stonea168@163.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3VyIG5ldyBEU0kgY2hpcCBoYXMgZnJhbWUgc2l6ZSBjb250cm9sLgpTbyBhZGQgdGhlIGRyaXZl
ciBkYXRhIHRvIGNvbnRyb2wgZm9yIGRpZmZlcmVudCBjaGlwcy4KClNpZ25lZC1vZmYtYnk6IEpp
dGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5o
dUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8
IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMKaW5kZXggNmI2NTUwOTI2ZGI2Li40NWUzMzEwNTU4NDIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kc2kuYwpAQCAtNzgsNiArNzgsNyBAQAogI2RlZmluZSBEU0lfVkJQ
X05MCQkweDI0CiAjZGVmaW5lIERTSV9WRlBfTkwJCTB4MjgKICNkZWZpbmUgRFNJX1ZBQ1RfTkwJ
CTB4MkMKKyNkZWZpbmUgRFNJX1NJWkVfQ09OCQkweDM4CiAjZGVmaW5lIERTSV9IU0FfV0MJCTB4
NTAKICNkZWZpbmUgRFNJX0hCUF9XQwkJMHg1NAogI2RlZmluZSBEU0lfSEZQX1dDCQkweDU4CkBA
IC0xNjIsNiArMTYzLDcgQEAgc3RydWN0IHBoeTsKIHN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRh
IHsKIAljb25zdCB1MzIgcmVnX2NtZHFfb2ZmOwogCWJvb2wgaGFzX3NoYWRvd19jdGw7CisJYm9v
bCBoYXNfc2l6ZV9jdGw7CiB9OwogCiBzdHJ1Y3QgbXRrX2RzaSB7CkBAIC00MzAsNiArNDMyLDEw
IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfY29uZmlnX3Zkb190aW1pbmcoc3RydWN0IG10a19kc2kg
KmRzaSkKIAl3cml0ZWwodm0tPnZmcm9udF9wb3JjaCwgZHNpLT5yZWdzICsgRFNJX1ZGUF9OTCk7
CiAJd3JpdGVsKHZtLT52YWN0aXZlLCBkc2ktPnJlZ3MgKyBEU0lfVkFDVF9OTCk7CiAKKwlpZiAo
ZHNpLT5kcml2ZXJfZGF0YS0+aGFzX3NpemVfY3RsKQorCQl3cml0ZWwodm0tPnZhY3RpdmUgPDwg
MTYgfCB2bS0+aGFjdGl2ZSwKKwkJICAgICAgIGRzaS0+cmVncyArIERTSV9TSVpFX0NPTik7CisK
IAlob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGUgPSAodm0tPmhzeW5jX2xlbiAqIGRzaV90bXBf
YnVmX2JwcCAtIDEwKTsKIAogCWlmIChkc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX1ZJ
REVPX1NZTkNfUFVMU0UpCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
