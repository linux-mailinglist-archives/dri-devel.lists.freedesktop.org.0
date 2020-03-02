Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475C817639A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 20:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A8F6E7DD;
	Mon,  2 Mar 2020 19:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4E96E44E;
 Mon,  2 Mar 2020 19:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6B447FB08;
 Mon,  2 Mar 2020 20:13:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lt_4OpfdEgK8; Mon,  2 Mar 2020 20:13:37 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 76A544048B; Mon,  2 Mar 2020 20:13:36 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] drm/etnaviv: Ignore MC bit when checking for runtime
 suspend
Date: Mon,  2 Mar 2020 20:13:31 +0100
Message-Id: <cover.1583176306.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXQgbGVhc3QgR0M3MDAwIGZhaWxzIHRvIGVudGVyIHJ1bnRpbWUgc3VzcGVuZCBmb3IgbG9uZyBw
ZXJpb2RzIG9mIHRpbWUgc2luY2UKdGhlIE1DIGJlY29tZXMgYnVzeSBhZ2FpbiBldmVuIHdoZW4g
dGhlIEZFIGlzIGlkbGUuIFRoZSByZXN0IG9mIHRoZSBzZXJpZXMKbWFrZXMgZGV0ZWN0aW5nIHNp
bWlsYXIgaXNzdWVzIGVhc2llciB0byBkZWJ1ZyBpbiB0aGUgZnV0dXJlIGJ5IGNoZWNraW5nCmFs
bCBrbm93biBiaXRzIGluIGRlYnVnZnMgYW5kIGFsc28gd2FybmluZyBpbiB0aGUgRUJVU1kgY2Fz
ZS4KClRlc3RlZCBvbiBHQzcwMDAgd2l0aCBhIHJlZHVjZWQgcnVudGltZSBkZWxheSBvZiA1MG1z
LiBQYXRjaGVzIGFyZQphZ2FpbnN0IG5leHQtMjAyMDAyMjYuCgpUaGFua3MgdG8gTHVjYXMgU3Rh
Y2ggZm9yIHBvaW50aW5nIG1lIGluIHRoZSByaWdodCBkaXJlY3Rpb24uCgpHdWlkbyBHw7xudGhl
ciAoNSk6CiAgZHJtL2V0bmF2aXY6IEZpeCB0eXBvIGluIGNvbW1lbnQKICBkcm0vZXRuYXZpdjog
VXBkYXRlIGlkbGUgYml0cwogIGRybS9ldG5hdml2OiBDb25zaWRlciBhbGwga3dub3duIGlkbGUg
Yml0cyBpbiBkZWJ1Z2ZzCiAgZHJtL2V0bmF2aXY6IElnbm9yZSBNQyB3aGVuIGNoZWNraW5nIHJ1
bnRpbWUgc3VzcGVuZCBpZGxlbmVzcwogIGRybS9ldG5hdml2OiBXYXJuIHdoZW4gR1BVIGRvZXNu
J3QgaWRsZSBmYXN0IGVub3VnaAoKIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1
LmMgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L3N0YXRlX2hpLnhtbC5oIHwgIDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
