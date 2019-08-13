Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A35D8B7B6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 13:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FF56E0F6;
	Tue, 13 Aug 2019 11:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73FE6E0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:58:59 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by xavier.telenet-ops.be with bizsmtp
 id obyx2000H05gfCL01byxtR; Tue, 13 Aug 2019 13:58:57 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hxVS5-0002ty-8C; Tue, 13 Aug 2019 13:58:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hxVS5-0007tu-6K; Tue, 13 Aug 2019 13:58:57 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Alexander Shiyan <shc_work@mail.ru>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH resend] video: backlight: Drop default m for {LCD,
 BACKLIGHT_CLASS_DEVICE}
Date: Tue, 13 Aug 2019 13:58:53 +0200
Message-Id: <20190813115853.30329-1-geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
Y29uZmlnCmluZGV4IDhiMDgxZDYxNzczZTIxZWIuLjQwNjc2YmUyZTQ2YWFlNjEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcKKysrIGIvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvS2NvbmZpZwpAQCAtMTAsNyArMTAsNiBAQCBtZW51ICJCYWNrbGlnaHQgJiBMQ0Qg
ZGV2aWNlIHN1cHBvcnQiCiAjCiBjb25maWcgTENEX0NMQVNTX0RFVklDRQogICAgICAgICB0cmlz
dGF0ZSAiTG93bGV2ZWwgTENEIGNvbnRyb2xzIgotCWRlZmF1bHQgbQogCWhlbHAKIAkgIFRoaXMg
ZnJhbWV3b3JrIGFkZHMgc3VwcG9ydCBmb3IgbG93LWxldmVsIGNvbnRyb2wgb2YgTENELgogCSAg
U29tZSBmcmFtZWJ1ZmZlciBkZXZpY2VzIGNvbm5lY3QgdG8gcGxhdGZvcm0tc3BlY2lmaWMgTENE
IG1vZHVsZXMKQEAgLTE0Myw3ICsxNDIsNiBAQCBlbmRpZiAjIExDRF9DTEFTU19ERVZJQ0UKICMK
IGNvbmZpZyBCQUNLTElHSFRfQ0xBU1NfREVWSUNFCiAgICAgICAgIHRyaXN0YXRlICJMb3dsZXZl
bCBCYWNrbGlnaHQgY29udHJvbHMiCi0JZGVmYXVsdCBtCiAJaGVscAogCSAgVGhpcyBmcmFtZXdv
cmsgYWRkcyBzdXBwb3J0IGZvciBsb3ctbGV2ZWwgY29udHJvbCBvZiB0aGUgTENECiAgICAgICAg
ICAgYmFja2xpZ2h0LiBUaGlzIGluY2x1ZGVzIHN1cHBvcnQgZm9yIGJyaWdodG5lc3MgYW5kIHBv
d2VyLgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
