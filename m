Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B23C1C4834
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91D76E8B7;
	Wed,  2 Oct 2019 07:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from haggis.mythic-beasts.com (haggis.mythic-beasts.com
 [IPv6:2a00:1098:0:86:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3A36E544
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 08:04:00 +0000 (UTC)
Received: from [199.195.250.187] (port=57030 helo=hermes.aosc.io)
 by haggis.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <icenowy@aosc.io>)
 id 1iFD8W-0004DW-3H; Tue, 01 Oct 2019 09:03:56 +0100
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id DFC5182AC9;
 Tue,  1 Oct 2019 08:03:44 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] drm/sun4i: dsi: misc timing fixes
Date: Tue,  1 Oct 2019 16:02:50 +0800
Message-Id: <20191001080253.6135-1-icenowy@aosc.io>
MIME-Version: 1.0
X-BlackCat-Spam-Score: 50
X-Spam-Status: No, score=5.0
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
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
Cc: linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBmaXhlcyBzb21lIHBvcnRpb24gb2YgdGltaW5nIGNhbGN1bGF0aW9uIGlu
IHN1bjZpX21pcGlfZHNpCmRyaXZlciBhY2NvcmRpbmcgdG8gdGhlIEJTUCBkcml2ZXIuCgpUd28g
b2YgdGhlIHBhdGNoZXMgYXJlIHJldmVydGluZywgb25lIGlzIGZpeGluZyBzb21lIG1pc3JlYWQg
b2YgdGhlIEJTUApzb3VyY2UgY29kZSwgYW5vdGhlciBpcyBmaXhpbmcgYSB3cm9uZyByZWZhY3Rv
ciB0aGF0IGFjdHVhbGx5IGJyZWFrcyB0aGUKZm9ybXVsYS4KClRoZSBvdGhlciBub24tcmV2ZXJ0
aW5nIHBhdGNoIGlzIGZpeGluZyBhIHBvcmNoIGVycm9yIHdoaWNoIGlzIHVzdWFsbHkKc2VlbiBp
biB0aGUgb3JpZ2luYWwgZHJpdmVyIGNvbW1pdC4gTW9zdCBvZiBwb3JjaCBlcnJvcnMgYXJlIHRo
ZW4gZml4ZWQsCmJ1dCB0aGlzIG9uZSBnZXRzIGlnbm9yZWQuCgpCeSBhcHBseWluZyB0aGVzZSBw
YXRjaGVzLCBzZXZlcmFsIERTSSBwYW5lbHMgYXJlIHRlc3RlZCB0byBiZSBkcml2ZW4KcHJvcGVy
bHkgYnkgdGhlIHRpbWluZyBwcm92aWRlZCBieSB0aGUgdmVuZG9yLCBpbmNsdWRpbmcgdGhlIExD
RCBwYW5lbApvZiBQaW5lUGhvbmUgIkRvbid0IEJlIEV2aWwiIERldktpdCwgdGhlIGZpbmFsIFBp
bmVQaG9uZSBwYW5lbCBhbmQgdGhlCnBhbmVsIG9uIFBpbmVUYWIuIFdpdGhvdXQgdGhlc2UgcGF0
Y2hlcyB0aGV5IG5lZWQgZGlydHkgdGltaW5nIGhhY2tzIHRvCndvcmsuCgpJY2Vub3d5IFpoZW5n
ICgzKToKICBSZXZlcnQgImRybS9zdW40aTogZHNpOiBDaGFuZ2UgdGhlIHN0YXJ0IGRlbGF5IGNh
bGN1bGF0aW9uIgogIGRybS9zdW40aTogZHNpOiBmaXggRFJRIGNhbGN1bGF0aW9uCiAgUmV2ZXJ0
ICJkcm0vc3VuNGk6IGRzaTogUmV3b3JrIGEgYml0IHRoZSBoYmxrIGNhbGN1bGF0aW9uIgoKIGRy
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jIHwgMTYgKysrKystLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgotLSAK
Mi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
