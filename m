Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EC0566F1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7073F6E375;
	Wed, 26 Jun 2019 10:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7CF6E379
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 5BFE2FB03;
 Wed, 26 Jun 2019 12:37:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqCczjRyAxuN; Wed, 26 Jun 2019 12:37:52 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 77E7048EAB; Wed, 26 Jun 2019 12:37:51 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH v2 0/4] drm/panel: jh057n0090: Add regulators and drop magic
 value in init
Date: Wed, 26 Jun 2019 12:37:47 +0200
Message-Id: <cover.1561542477.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBvbWlzc2lvbiBvZiBhIHJlZ3VsYXRvcnMgZm9yIHRoZSByZWNlbnRseSBhZGRlZCBw
YW5lbCBhbmQgbWFrZSBzdXJlIGFsbApkc2kgY29tbWFuZHMgc3RhcnQgd2l0aCBhIGNvbW1hbmQg
aW5zdGVhZCBvZiBvbmUgaGF2aW5nIGEgbWFnaWMgY29uc3RhbnQgKHdoaWNoCmFscmVhZHkgY2F1
c2VkIGNvbmZ1c2lvbikuCgpBbHNvIGFkZHMgYSBtYWlsIGFsaWFzIHRvIHRoZSBwYW5lbCdzIE1B
SU5UQUlORVIgZW50cnkgdG8gcmVkdWNlIHRoZSBidXMKZmFjdG9yLgoKQ2hhbmdlcyBmcm9tIHYx
OgoqIEFzIHBlciByZXZpZXcgY29tbWVudHMgZnJvbSBTYW0gUmF2bmJvcmc6CiAgLSBQcmludCBl
cnJvciBvbiBkZXZtX3JlZ3VsYXRvcl9nZXQoKSBmYWlscmVzCiAgLSBGaXggdHlwb3MgaW4gY29t
bWl0IG1lc3NhZ2VzCiogUHJpbnQgYW4gZXJyb3Igb24gcmVndWxhdG9yX2VuYWJsZSgpCiogRGlz
YWJsZSB2Y2MgaWYgaW92Y2MgZmFpbHMgdG8gZW5hYmxlCgpHdWlkbyBHw7xudGhlciAoNCk6CiAg
TUFJTlRBSU5FUlM6IEFkZCBQdXJpc20gbWFpbCBhbGlhcyBhcyByZXZpZXdlciBmb3IgdGhlaXIg
ZGV2a2l0J3MKICAgIHBhbmVsCiAgZHJtL3BhbmVsOiBqaDA1N24wMDkwMDogRG9uJ3QgdXNlIG1h
Z2ljIGNvbnN0YW50CiAgZHQtYmluZGluZ3M6IGRpc3BsYXkvcGFuZWw6IGpoMDU3bjAwOTAwOiBE
b2N1bWVudCBwb3dlciBzdXBwbHkKICAgIHByb3BlcnRpZXMKICBkcm0vcGFuZWw6IGpoMDU3bjAw
OTAwOiBBZGQgcmVndWxhdG9yIHN1cHBvcnQKCiAuLi4vZGlzcGxheS9wYW5lbC9yb2NrdGVjaCxq
aDA1N24wMDkwMC50eHQgICAgfCAgNSArKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxICsKIC4uLi9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgw
NTduMDA5MDAuYyAgICB8IDQ0ICsrKysrKysrKysrKysrKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwg
NDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
