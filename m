Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C6959D9C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 16:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3026E92B;
	Fri, 28 Jun 2019 14:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B3C6E92B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 14:17:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id C19B827D85C
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/2] handle vblank when disabling ctc with interrupt
 disabled 
Date: Fri, 28 Jun 2019 15:15:34 +0100
Message-Id: <cover.1561729581.git.bob.beckett@collabora.com>
X-Mailer: git-send-email 2.18.0
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 David Airlie <airlied@linux.ie>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHdhcm5pbmcgd2hlbiBhYm91dCB0byBzZW5kIHN0YWxlIHZibGFuay4KUmV2ZXJ0IGNoYW5n
ZSB0aGF0IHN0b3BzIHZibGFuayBpbmZvIGJlaW5nIHVwZGF0ZWQgaWYgaW50ZXJydXB0cyBhbHJl
YWR5CmRpc2FibGVkLiBUaGlzIGZpeGVzIGEgc3RhbGUgdmJsYW5rIHRpbWVzdGFtcCBpc3N1ZSBz
ZWVuIG9uIGRybS9pbXguCgoKQ2hhbmdlcyBzaW5jZSB2MjoKU3BsaXQgdXAgdGhlIHBhdGNoIGlu
IHRvIHNtYWxsZXIgcGllY2VzLgpBZGQgd2FybmluZyB3aGVuIGFib3V0IHRvIHNlbmQgYm9ndXMg
dmJsYW5rIGV2ZW50LgpVcGRhdGUgdmJsYW5rIHRvIGJlc3QgZ3Vlc3MgaW5mbyBkdXJpbmcgZHJt
X3ZibGFua19kaXNhYmxlX2FuZF9zYXZlLgoKQ2hhbmdlcyBzaW5jZSB2MzoKVXBkYXRlIGNvdmVy
IGxldHRlciB0ZXh0IHRvIGRlc2NyaWJlIHJlbWFpbmluZyBhY3Rpb25zLgpEcm9wIGRybS9pbXgg
cGF0Y2hlcyBhcyB0aGV5IGhhdmUgbm93IGJlZW4gbWVyZ2VkLgpSZXBsYWNlIHZibGFuayBpbmZv
IGVzdGltYXRpb24gcGF0Y2ggd2l0aCBhIHJldmVydCBvZiB0aGUgaXNzdWUgdGhhdApjYXVzZWQg
dGhlIG5lZWQgZm9yIGVzdGltYXRpb24uCgpDaGFuZ2VzIHNpbmNlIHY0OgpVcGRhdGVkIGRvYyBm
b3IgZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoKSBiYXNlZCBvbiBmZWVkYmFjay4KQ29uZmly
bWVkIHRoYXQgaHRtbGRvYyBsb29rcyBnb29kLgoKUm9iZXJ0IEJlY2tldHQgKDIpOgogIGRybS92
Ymxhbms6IHdhcm4gb24gc2VuZGluZyBzdGFsZSBldmVudAogIFJldmVydCAiZHJtL3ZibGFuazog
RG8gbm90IHVwZGF0ZSB2YmxhbmsgY291bnQgaWYgaW50ZXJydXB0cyBhcmUKICAgIGFscmVhZHkg
ZGlzYWJsZWQuIgoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgfCAzNiArKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkKCi0tIAoyLjE4LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
