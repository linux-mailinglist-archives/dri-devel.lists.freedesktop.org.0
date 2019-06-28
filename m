Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B8659A00
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A6C6E8EC;
	Fri, 28 Jun 2019 12:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF626E8EA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:06:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 93077263955
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/2] handle vblank when disabling ctc with interrupt
 disabled 
Date: Fri, 28 Jun 2019 13:05:30 +0100
Message-Id: <cover.1561722822.git.bob.beckett@collabora.com>
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
 Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
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
dGhlIG5lZWQgZm9yIGVzdGltYXRpb24uCgpSb2JlcnQgQmVja2V0dCAoMik6CiAgZHJtL3ZibGFu
azogd2FybiBvbiBzZW5kaW5nIHN0YWxlIGV2ZW50CiAgUmV2ZXJ0ICJkcm0vdmJsYW5rOiBEbyBu
b3QgdXBkYXRlIHZibGFuayBjb3VudCBpZiBpbnRlcnJ1cHRzIGFyZQogICAgYWxyZWFkeSBkaXNh
YmxlZC4iCgogZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyB8IDM1ICsrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pCgotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
