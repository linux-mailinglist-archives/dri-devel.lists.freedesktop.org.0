Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D54D649D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 16:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961626E155;
	Mon, 14 Oct 2019 14:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AEF895C4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 14:04:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 766B4AF92;
 Mon, 14 Oct 2019 14:04:20 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, b.zolnierkie@samsung.com,
 ajax@redhat.com, ville.syrjala@linux.intel.com, malat@debian.org,
 michel@daenzer.net
Subject: [PATCH v2 01/15] fbdev: Export fb_check_foreignness()
Date: Mon, 14 Oct 2019 16:04:02 +0200
Message-Id: <20191014140416.28517-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014140416.28517-1-tzimmermann@suse.de>
References: <20191014140416.28517-1-tzimmermann@suse.de>
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
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 corbet@lwn.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmdW5jdGlvbiBpcyByZXF1aXJlZCBieSBEUk0ncyBmYmRldiBjb252ZXJzaW9uIGhlbHBl
cnMuIEV4cG9ydCBpdApmcm9tIHRoZSBtb2R1bGUuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2Nv
cmUvZmJtZW0uYyB8IDMgKystCiBpbmNsdWRlL2xpbnV4L2ZiLmggICAgICAgICAgICAgICB8IDEg
KwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYm1lbS5jCmluZGV4IDk1YzMyOTUyZmE4YS4uZTgyOGZjY2NjZTQwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYworKysgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwpAQCAtMTQ4MSw3ICsxNDgxLDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgZmJfZm9wcyA9IHsKIHN0cnVjdCBjbGFzcyAqZmJfY2xh
c3M7CiBFWFBPUlRfU1lNQk9MKGZiX2NsYXNzKTsKIAotc3RhdGljIGludCBmYl9jaGVja19mb3Jl
aWdubmVzcyhzdHJ1Y3QgZmJfaW5mbyAqZmkpCitpbnQgZmJfY2hlY2tfZm9yZWlnbm5lc3Moc3Ry
dWN0IGZiX2luZm8gKmZpKQogewogCWNvbnN0IGJvb2wgZm9yZWlnbl9lbmRpYW4gPSBmaS0+Zmxh
Z3MgJiBGQklORk9fRk9SRUlHTl9FTkRJQU47CiAKQEAgLTE1MDUsNiArMTUwNSw3IEBAIHN0YXRp
YyBpbnQgZmJfY2hlY2tfZm9yZWlnbm5lc3Moc3RydWN0IGZiX2luZm8gKmZpKQogCiAJcmV0dXJu
IDA7CiB9CitFWFBPUlRfU1lNQk9MKGZiX2NoZWNrX2ZvcmVpZ25uZXNzKTsKIAogc3RhdGljIGJv
b2wgYXBlcnR1cmVzX292ZXJsYXAoc3RydWN0IGFwZXJ0dXJlICpnZW4sIHN0cnVjdCBhcGVydHVy
ZSAqaHcpCiB7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2ZiLmggYi9pbmNsdWRlL2xpbnV4
L2ZiLmgKaW5kZXggNDFlMDA2OWVjYTBhLi4zNzJmMWY2YWU0MmUgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvZmIuaAorKysgYi9pbmNsdWRlL2xpbnV4L2ZiLmgKQEAgLTYyMiw2ICs2MjIsNyBA
QCBleHRlcm4gaW50IGZiX2dldF9jb2xvcl9kZXB0aChzdHJ1Y3QgZmJfdmFyX3NjcmVlbmluZm8g
KnZhciwKIAkJCSAgICAgIHN0cnVjdCBmYl9maXhfc2NyZWVuaW5mbyAqZml4KTsKIGV4dGVybiBp
bnQgZmJfZ2V0X29wdGlvbnMoY29uc3QgY2hhciAqbmFtZSwgY2hhciAqKm9wdGlvbik7CiBleHRl
cm4gaW50IGZiX25ld19tb2RlbGlzdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbyk7CitleHRlcm4gaW50
IGZiX2NoZWNrX2ZvcmVpZ25uZXNzKHN0cnVjdCBmYl9pbmZvICpmaSk7CiAKIGV4dGVybiBzdHJ1
Y3QgZmJfaW5mbyAqcmVnaXN0ZXJlZF9mYltGQl9NQVhdOwogZXh0ZXJuIGludCBudW1fcmVnaXN0
ZXJlZF9mYjsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
