Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE531F42A
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 14:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9ED2892FD;
	Wed, 15 May 2019 12:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Wed, 15 May 2019 12:21:50 UTC
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6242A892FD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 12:21:50 +0000 (UTC)
Received: from ramsan ([84.194.111.163]) by laurent.telenet-ops.be with bizsmtp
 id CcGm2000P3XaVaC01cGm6o; Wed, 15 May 2019 14:16:47 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hQspy-0002Tk-5Z; Wed, 15 May 2019 14:16:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hQspy-0007PS-2L; Wed, 15 May 2019 14:16:46 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Alexander Shiyan <shc_work@mail.ru>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH] video: backlight: Drop default m for {LCD,
 BACKLIGHT_CLASS_DEVICE}
Date: Wed, 15 May 2019 14:16:45 +0200
Message-Id: <20190515121645.28413-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBydW5uaW5nICJtYWtlIG9sZGNvbmZpZyIgb24gYSAuY29uZmlnIHdoZXJlCkNPTkZJR19C
QUNLTElHSFRfTENEX1NVUFBPUlQgaXMgbm90IHNldCwgdHdvIG5ldyBjb25maWcgb3B0aW9ucwoo
Ikxvd2xldmVsIExDRCBjb250cm9scyIgYW5kICJMb3dsZXZlbCBCYWNrbGlnaHQgY29udHJvbHMi
KSBhcHBlYXIsIGJvdGgKZGVmYXVsdGluZyB0byAibSIuCgpEcm9wIHRoZSAiZGVmYXVsdCBtIiwg
YXMgb3B0aW9ucyBzaG91bGQgZGVmYXVsdCB0byBkaXNhYmxlZCwgYW5kIGJlY2F1c2UKc2V2ZXJh
bCBkcml2ZXIgY29uZmlnIG9wdGlvbnMgYWxyZWFkeSBzZWxlY3QgTENEX0NMQVNTX0RFVklDRSBv
cgpCQUNLTElHSFRfQ0xBU1NfREVWSUNFIHdoZW4gbmVlZGVkLgoKRml4ZXM6IDhjNWRjOGQ5ZjE5
Yzc5OTIgKCJ2aWRlbzogYmFja2xpZ2h0OiBSZW1vdmUgdXNlbGVzcyBCQUNLTElHSFRfTENEX1NV
UFBPUlQga2VybmVsIHN5bWJvbCIpClNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+Ci0tLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZp
ZyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9L
Y29uZmlnCmluZGV4IDNlZDFkOTA4NGY5NDI2ODguLjhkMTM4Y2M5ZWFiYjljZDIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcKKysrIGIvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvS2NvbmZpZwpAQCAtOSw3ICs5LDYgQEAgbWVudSAiQmFja2xpZ2h0ICYgTENEIGRl
dmljZSBzdXBwb3J0IgogIwogY29uZmlnIExDRF9DTEFTU19ERVZJQ0UKICAgICAgICAgdHJpc3Rh
dGUgIkxvd2xldmVsIExDRCBjb250cm9scyIKLQlkZWZhdWx0IG0KIAloZWxwCiAJICBUaGlzIGZy
YW1ld29yayBhZGRzIHN1cHBvcnQgZm9yIGxvdy1sZXZlbCBjb250cm9sIG9mIExDRC4KIAkgIFNv
bWUgZnJhbWVidWZmZXIgZGV2aWNlcyBjb25uZWN0IHRvIHBsYXRmb3JtLXNwZWNpZmljIExDRCBt
b2R1bGVzCkBAIC0xNDIsNyArMTQxLDYgQEAgZW5kaWYgIyBMQ0RfQ0xBU1NfREVWSUNFCiAjCiBj
b25maWcgQkFDS0xJR0hUX0NMQVNTX0RFVklDRQogICAgICAgICB0cmlzdGF0ZSAiTG93bGV2ZWwg
QmFja2xpZ2h0IGNvbnRyb2xzIgotCWRlZmF1bHQgbQogCWhlbHAKIAkgIFRoaXMgZnJhbWV3b3Jr
IGFkZHMgc3VwcG9ydCBmb3IgbG93LWxldmVsIGNvbnRyb2wgb2YgdGhlIExDRAogICAgICAgICAg
IGJhY2tsaWdodC4gVGhpcyBpbmNsdWRlcyBzdXBwb3J0IGZvciBicmlnaHRuZXNzIGFuZCBwb3dl
ci4KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
