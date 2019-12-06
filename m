Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E52114D7A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69816E19C;
	Fri,  6 Dec 2019 08:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC656E1A4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 08:19:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5DBF5BA28;
 Fri,  6 Dec 2019 08:19:07 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: john.p.donnelly@oracle.com,
	daniel.vetter@ffwll.ch,
	airlied@redhat.com
Subject: [PATCH] drm/mgag200: Flag all G200 SE A machines as broken wrt
 <startadd>
Date: Fri,  6 Dec 2019 09:19:01 +0100
Message-Id: <20191206081901.9938-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Allison Randal <allison@lohutok.net>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V2ZXJhbCBNR0EgRzIwMCBTRSBtYWNoaW5lcyBkb24ndCByZXNwZWN0IHRoZSB2YWx1ZSBvZiB0
aGUgc3RhcnRhZGQKcmVnaXN0ZXIgZmllbGQuIEFmdGVyIG1vcmUgZmVlZGJhY2sgb24gYWZmZWN0
ZWQgbWFjaGluZXMsIG5laXRoZXIgUENJCnN1YnZlbmRvciBJRCBub3IgdGhlIGludGVybmFsIElE
IHNlZW0gdG8gaGludCB0b3dhcmRzIHRoZSBidWcuIEFsbAphZmZlY3RlZCBtYWNoaW5lcyBoYXZl
IGEgUENJIElEIG9mIDB4MDUyMiAoaS5lLiwgRzIwMCBTRSBBKS4gSXQgd2FzCmRlY2lkZWQgdG8g
ZmxhZyBhbGwgRzIwMCBTRSBBIG1hY2hpbmVzIGFzIGJyb2tlbi4KClNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpGaXhlczogMTU5MWZhZGY4NTdj
ICgiZHJtL21nYWcyMDA6IEFkZCB3b3JrYXJvdW5kIGZvciBIVyB0aGF0IGRvZXMgbm90IHN1cHBv
cnQgJ3N0YXJ0YWRkJyIpCkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KQ2M6IEpvaG4gRG9ubmVsbHkgPGpvaG4ucC5kb25uZWxseUBvcmFjbGUuY29tPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgpDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KQ2M6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNj
OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiAi
WS5DLiBDaGVuIiA8eWNfY2hlbkBhc3BlZWR0ZWNoLmNvbT4KQ2M6IE5laWwgQXJtc3Ryb25nIDxu
YXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJv
bml4LmRlPgpDYzogIkpvc8OpIFJvYmVydG8gZGUgU291emEiIDxqb3NlLnNvdXphQGludGVsLmNv
bT4KQ2M6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+CkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiA8c3RhYmxlQHZnZXIua2VybmVs
Lm9yZz4gIyB2NS4zKwpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KQ2M6IEFsbGlzb24gUmFuZGFsIDxhbGxpc29uQGxvaHV0b2submV0PgpDYzogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIk5vcmFsZiBUcsO4bm5l
cyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX2Rydi5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYwppbmRleCAzMGIzYjgy
N2FkZjguLjlmNGY1ZjA3MWFkZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAv
bWdhZzIwMF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5j
CkBAIC0zMCw5ICszMCw4IEBAIG1vZHVsZV9wYXJhbV9uYW1lZChtb2Rlc2V0LCBtZ2FnMjAwX21v
ZGVzZXQsIGludCwgMDQwMCk7CiBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZHJpdmVyOwogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRsaXN0W10gPSB7Ci0JeyBQQ0lf
VkVORE9SX0lEX01BVFJPWCwgMHg1MjIsIFBDSV9WRU5ET1JfSURfU1VOLCAweDQ4NTIsIDAsIDAs
CisJeyBQQ0lfVkVORE9SX0lEX01BVFJPWCwgMHg1MjIsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQs
IDAsIDAsCiAJCUcyMDBfU0VfQSB8IE1HQUcyMDBfRkxBR19IV19CVUdfTk9fU1RBUlRBRER9LAot
CXsgUENJX1ZFTkRPUl9JRF9NQVRST1gsIDB4NTIyLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAw
LCAwLCBHMjAwX1NFX0EgfSwKIAl7IFBDSV9WRU5ET1JfSURfTUFUUk9YLCAweDUyNCwgUENJX0FO
WV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgRzIwMF9TRV9CIH0sCiAJeyBQQ0lfVkVORE9SX0lEX01B
VFJPWCwgMHg1MzAsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIEcyMDBfRVYgfSwKIAl7
IFBDSV9WRU5ET1JfSURfTUFUUk9YLCAweDUzMiwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwg
MCwgRzIwMF9XQiB9LAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
