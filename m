Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F3A510D3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 17:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BA989C89;
	Mon, 24 Jun 2019 15:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EF989C89
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:40:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B0B313086217;
 Mon, 24 Jun 2019 15:40:16 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-153.ams2.redhat.com
 [10.36.116.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96C0219723;
 Mon, 24 Jun 2019 15:40:15 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>
Subject: [PATCH 0/1] drm: panel-orientation-quirks: Add extra quirk table
 entry GPD MicroPC
Date: Mon, 24 Jun 2019 17:40:13 +0200
Message-Id: <20190624154014.8557-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 24 Jun 2019 15:40:16 +0000 (UTC)
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxsLAoKR29vZCBuZXdzIEkgaGF2ZSBhIGNvbnRhY3QgaW5zaWRlIEdQRCBub3cgYW5kIGZy
b20gbm93IG9uIHRoZWlyIEJJT1MtZXMKd2lsbCBoYXZlIHByb3BlciBzeXNfdmVuZG9yIGFuZCBw
cm9kdWN0X25hbWUgRE1JIHN0cmluZ3MuIFRoaXMgbWVhbnMgdGhhdAp3ZSBubyBsb25nZXIgbmVl
ZCB0byBkbyBCSU9TIGRhdGUgbWF0Y2hlcyBhbmQgYWRkIGEgbmV3IEJJT1MgZGF0ZSB0bwpkcm1f
cGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMgZm9yIGVhY2ggQklPUyB1cGRhdGUuCgpUaGUgc2Vj
b25kIGJhdGNoIG9mIEdQRCBNaWNyb1BDLXMgYmVpbmcgZGVsaXZlcmVkIHRvIHVzZXJzIGFscmVh
ZHkgdXNlcwp0aGVzZSBuZXcgc3RyaW5ncywgdGhpcyBwYXRjaCBhZGRzIGEgcXVpcmsgZm9yIHRo
ZSA5MCBkZWdyZWUgbW91bnRlZApMQ0QgcGFuZWwgdXNpbmcgdGhlIG5ldyBETUkgc3RyaW5ncy4K
Ckl0IHdvdWxkIGJlIG5pY2UgdG8gZ2V0IHRoaXMgaW50byA1LjIsIGJ1dCBpdCBpcyBub3QgdGhh
dCB1cmdlbnQsIHNvCkkgYmVsaWV2ZSB0aGF0IGl0IGlzIGJlc3QgdG8gcHVzaCB0aGlzIHRvIGRy
bS1taXNjLW5leHQtZml4ZXMgYW5kIHRoZW4KaXQgY2FuIGdldCBhZGRlZCB0byA1LjIueSBvbmNl
IGl0IGhpdHMgVG9ydmFsZCdzIHRyZWUuCgpJZiBzb21lb25lIGNhbiBnaXZlIHRoaXMgYSByZXZp
ZXcgKGl0IGlzIGEgdHJpdmlhbCBwYXRjaCByZWFsbHkpIGFuZApnaXZlIG1lIGFuIEFja2VkLWJ5
IHRoZW4gSSdsbCBwdXNoIHRoaXMgdG8gZHJtLW1pc2MtbmV4dC1maXhlcy4KClJlZ2FyZHMsCgpI
YW5zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
