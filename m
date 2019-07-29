Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3389A78617
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2ECC89CB2;
	Mon, 29 Jul 2019 07:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687D389C27
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 06:36:07 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A20888BD6424470D0156;
 Mon, 29 Jul 2019 14:36:02 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Mon, 29 Jul 2019
 14:35:53 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <eric@anholt.net>
Subject: [PATCH] drm/bridge: lvds-encoder: Fix build error
Date: Mon, 29 Jul 2019 14:35:39 +0800
Message-ID: <20190729063539.19328-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgQ09ORklHX0RSTV9MVkRTX0VOQ09ERVI9eSBidXQgQ09ORklHX0RSTV9LTVNfSEVMUEVSPW0s
CmJ1aWxkIGZhaWxzOgoKZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWVuY29kZXIubzogSW4g
ZnVuY3Rpb24gYGx2ZHNfZW5jb2Rlcl9wcm9iZSc6Cmx2ZHMtZW5jb2Rlci5jOigudGV4dCsweDE1
NSk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRldm1fZHJtX3BhbmVsX2JyaWRnZV9hZGQnCgpS
ZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+CkZpeGVzOiBkYmI1OGJm
ZDlhZTYgZHJtL2JyaWRnZTogKCJGaXggbHZkcy1lbmNvZGVyIHNpbmNlIHRoZSBwYW5lbF9icmlk
Z2UgcmV3b3JrLiIpClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2Vp
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25m
aWcKaW5kZXggYTZlZWM5MC4uMjkyNjc1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwpAQCAtOCw3
ICs4LDcgQEAgY29uZmlnIERSTV9CUklER0UKIGNvbmZpZyBEUk1fUEFORUxfQlJJREdFCiAJZGVm
X2Jvb2wgeQogCWRlcGVuZHMgb24gRFJNX0JSSURHRQotCWRlcGVuZHMgb24gRFJNX0tNU19IRUxQ
RVIKKwlzZWxlY3QgRFJNX0tNU19IRUxQRVIKIAlzZWxlY3QgRFJNX1BBTkVMCiAJaGVscAogCSAg
RFJNIGJyaWRnZSB3cmFwcGVyIG9mIERSTSBwYW5lbHMKLS0gCjIuNy40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
