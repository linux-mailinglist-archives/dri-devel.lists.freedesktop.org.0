Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84057C8A7C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 16:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D47E89D39;
	Wed,  2 Oct 2019 14:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D79289D39
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 14:05:44 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BE65420068B;
 Wed,  2 Oct 2019 16:05:42 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B0576200141;
 Wed,  2 Oct 2019 16:05:42 +0200 (CEST)
Received: from fsr-ub1664-121.ea.freescale.net
 (fsr-ub1664-121.ea.freescale.net [10.171.82.171])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 301982060C;
 Wed,  2 Oct 2019 16:05:42 +0200 (CEST)
From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/5] drm/imx: compile imx directory by default
Date: Wed,  2 Oct 2019 17:04:54 +0300
Message-Id: <1570025100-5634-3-git-send-email-laurentiu.palcu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570025100-5634-1-git-send-email-laurentiu.palcu@nxp.com>
References: <1570025100-5634-1-git-send-email-laurentiu.palcu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: agx@sigxcpu.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5IHRoZSBkcm0vaW14LyBkaXJlY3RvcnkgaXMgY29tcGlsZWQgb25seSBpZiBEUk1f
SU1YIGlzIHNldC4gQWRkaW5nIGEKbmV3IElNWCByZWxhdGVkIElQIGluIHRoZSBzYW1lIGRpcmVj
dG9yeSB3b3VsZCBuZWVkIERSTV9JTVggdG8gYmUgc2V0LCB3aGljaCB3b3VsZApicmluZyBpbiBh
bHNvIElQVXYzIGNvcmUgZHJpdmVyLi4uCgpUaGUgY3VycmVudCBwYXRjaCB3b3VsZCBhbGxvdyBh
ZGRpbmcgbmV3IElQcyBpbiB0aGUgaW14LyBkaXJlY3Rvcnkgd2l0aG91dCBuZWVkaW5nCnRvIHNl
dCBEUk1fSU1YLgoKU2lnbmVkLW9mZi1ieTogTGF1cmVudGl1IFBhbGN1IDxsYXVyZW50aXUucGFs
Y3VAbnhwLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUKaW5kZXggODJm
ZjgyNi4uYTYxOTFmOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQpAQCAtOTgsNyArOTgsNyBAQCBvYmotJChDT05GSUdf
RFJNX01TTSkgKz0gbXNtLwogb2JqLSQoQ09ORklHX0RSTV9URUdSQSkgKz0gdGVncmEvCiBvYmot
JChDT05GSUdfRFJNX1NUTSkgKz0gc3RtLwogb2JqLSQoQ09ORklHX0RSTV9TVEkpICs9IHN0aS8K
LW9iai0kKENPTkZJR19EUk1fSU1YKSArPSBpbXgvCitvYmoteSAJCQkrPSBpbXgvCiBvYmotJChD
T05GSUdfRFJNX0lOR0VOSUMpICs9IGluZ2VuaWMvCiBvYmotJChDT05GSUdfRFJNX01FRElBVEVL
KSArPSBtZWRpYXRlay8KIG9iai0kKENPTkZJR19EUk1fTUVTT04pCSs9IG1lc29uLwotLSAKMi43
LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
