Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D70FA114E88
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 10:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501236F9A0;
	Fri,  6 Dec 2019 09:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 376 seconds by postgrey-1.36 at gabe;
 Fri, 06 Dec 2019 09:59:35 UTC
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920026F99F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 09:59:35 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4B6D820058A;
 Fri,  6 Dec 2019 10:53:19 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3BEF0200531;
 Fri,  6 Dec 2019 10:53:19 +0100 (CET)
Received: from fsr-ub1664-121.ea.freescale.net
 (fsr-ub1664-121.ea.freescale.net [10.171.82.171])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id ACB7320395;
 Fri,  6 Dec 2019 10:53:18 +0100 (CET)
From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 1/4] drm/imx: compile imx directory by default
Date: Fri,  6 Dec 2019 11:52:38 +0200
Message-Id: <1575625964-27102-2-git-send-email-laurentiu.palcu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575625964-27102-1-git-send-email-laurentiu.palcu@nxp.com>
References: <1575625964-27102-1-git-send-email-laurentiu.palcu@nxp.com>
MIME-Version: 1.0
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
Cc: agx@sigxcpu.org, lukas@mntmn.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>
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
ZXJzL2dwdS9kcm0vTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUKaW5kZXggOWYx
YzdjNC4uNjkxNTVmOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQpAQCAtMTAwLDcgKzEwMCw3IEBAIG9iai0kKENPTkZJ
R19EUk1fTVNNKSArPSBtc20vCiBvYmotJChDT05GSUdfRFJNX1RFR1JBKSArPSB0ZWdyYS8KIG9i
ai0kKENPTkZJR19EUk1fU1RNKSArPSBzdG0vCiBvYmotJChDT05GSUdfRFJNX1NUSSkgKz0gc3Rp
Lwotb2JqLSQoQ09ORklHX0RSTV9JTVgpICs9IGlteC8KK29iai15IAkJCSs9IGlteC8KIG9iai0k
KENPTkZJR19EUk1fSU5HRU5JQykgKz0gaW5nZW5pYy8KIG9iai0kKENPTkZJR19EUk1fTUVESUFU
RUspICs9IG1lZGlhdGVrLwogb2JqLSQoQ09ORklHX0RSTV9NRVNPTikJKz0gbWVzb24vCi0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
