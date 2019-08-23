Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC2C9C6BB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D254E8991E;
	Mon, 26 Aug 2019 00:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A2189CC9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 11:24:33 +0000 (UTC)
Received: from tschai.fritz.box ([46.9.232.237])
 by smtp-cloud7.xs4all.net with ESMTPA
 id 17gBikVExThuu17gEiolpz; Fri, 23 Aug 2019 13:24:31 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCH 0/3] drm: cec: call cec_s_conn_info()
Date: Fri, 23 Aug 2019 13:24:24 +0200
Message-Id: <20190823112427.42394-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFpP5ahn1mixZEgS2DpGEwnLDr611pFCD0NV1aR4xDYjIfGWFW+alp1i6B90RB0a37/Eyyj7pCnCYYUaCLZWGPDbccEpv6R6CEdgP2ingXp4qaLpUgdk
 2QEv8r4eNX2KTzASPzqxoRsHnNXPUyAYnyPIH8ULL7c2JNpYgE3P2/Xs7jn5L8blqnrhGPRdVPeq4B62Jfpq1ACe6RF9cb8go6Q8hlopjpeyCdyeA6sxLCCH
 LkPEAkG6jR46B4qw36CbMkUxJqvjdcyZ/PWijBDQ03sUly2G6N82ASKLF2gbslwNJ6sRVE3NROdI2SFsHex9qxrVm4aOuzw3Iy4Htz/nL9CV0K+9PVFL8Ngi
 BFec1pniNSXqP9vMgpoBicSPRSSF624K8kMJMZ2J9O1qS5c0snOZ8ZDE4BuAxq00XyvpTAY/
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:57 +0000
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhyZWUgZHJpdmVycyB3ZXJlIG5vdCB1cGRhdGVkIGluIERhcml1c3onIHNlcmllczoKCmh0dHBz
Oi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Byb2plY3QvbGludXgtbWVkaWEvbGlzdC8/c2VyaWVz
PTU3MwoKVGhpcyBzZXJpZXMgYWRkcyBjb25uZWN0b3IgaW5mbyBzdXBwb3J0IGZvciB0aG9zZSB0
aHJlZS4KCk5vdGUgdGhhdCB0aGUgc3VuNGkgcGF0Y2ggaGFzIHRoaXMgcGF0Y2ggYXMgYSBwcmVy
ZXF1aXNpdGU6CgpodHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9wcm9qZWN0L2xpbnV4LW1l
ZGlhL2xpc3QvP3Nlcmllcz01NzMKClRoaXMgd2lsbCBiZSBtZXJnZWQgZm9yIHY1LjMsIHNvIHRo
aXMgc2hvdWxkIGJlIGluIGJlZm9yZSB0aGUKc3VuNGkgcGF0Y2ggaXMgbWVyZ2VkLgoKUmVnYXJk
cywKCglIYW5zCgpEYXJpdXN6IE1hcmNpbmtpZXdpY3ogKDEpOgogIGRybS92YzQvdmM0X2hkbWk6
IGZpbGwgaW4gY29ubmVjdG9yIGluZm8KCkhhbnMgVmVya3VpbCAoMik6CiAgZHJtL3N1bjRpL3N1
bjRpX2hkbWlfZW5jOiBjYWxsIGNlY19zX2Nvbm5faW5mbygpCiAgZHJtL2JyaWRnZS9hZHY3NTEx
OiBlbmFibGUgQ0VDIGNvbm5lY3RvciBpbmZvCgogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3
NTExL2Fkdjc1MTFfY2VjLmMgfCAgNyArKysrKystCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fk
djc1MTEvYWR2NzUxMV9kcnYuYyB8IDIyICsrKysrKysrKystLS0tLS0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuNGlfaGRtaV9lbmMuYyAgICAgICB8ICA2ICsrKystLQogZHJpdmVycy9n
cHUvZHJtL3ZjNC92YzRfaGRtaS5jICAgICAgICAgICAgICAgfCAxMyArKysrKysrKy0tLS0KIDQg
ZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
