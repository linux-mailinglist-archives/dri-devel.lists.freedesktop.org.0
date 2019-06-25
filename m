Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B65640C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914066E2CD;
	Wed, 26 Jun 2019 08:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net
 [194.109.24.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC876E131
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:45:16 +0000 (UTC)
Received: from cobaltpc1.rd.cisco.com
 ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
 by smtp-cloud9.xs4all.net with ESMTPA
 id fmh4hQwJSSfvXfmh8hHoyn; Tue, 25 Jun 2019 16:45:14 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv9 01/13] cec-notifier: rename variables,
 check kstrdup and n->conn_name
Date: Tue, 25 Jun 2019 16:44:58 +0200
Message-Id: <20190625144510.122214-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
References: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGotbewLqH47JURfpvjZTkncnARHewLy1oqUHYbwzqPtDPvONf3dtrG/IOF9QxJbcyVMhjJt0KGFoWLRBz8EwpyYk6Keyz/Fctqw4aQqOJHQ/TYw8FAZ
 q/JNFcyfuc4wW5+tsoG3t6uUODtH0DZ2Xi/TiHi1fivntsucHa1iEnys/uQpPQ/stBXYqgiICCeRH97g+cTXQn7vCCn2JDdbJ3lqx3i2e8CEI9JiHTQ73L8j
 UhvWGYzzEM2rJ3kbHLDBD0rmnc+jObwYRTPRw2ZWAYoGSJGYECk2wACzZ8jGgK66nAQzyN2IMCEMLGcpjhz1kZmEv44S2SELBDSYSLno5KDCTUJvEcuKVIlm
 VZZDhHwUBqYb+rYoInNBCGsprC+wmhF2rkQXHvZ7c9mBt8p0HLxl5lQcml6eeFcDcUEYjSDM
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, dri-devel@lists.freedesktop.org,
 Cheng-yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGV2IC0+IGhkbWlfZGV2CmNvbm4gLT4gY29ubl9uYW1lCgpDaGVjayBpZiBuLT5jb25uX25hbWUg
aXMgbm90IE5VTEwgYmVmb3JlIGNhbGxpbmcgc3RyY21wLgpDaGVjayB0aGUgcmVzdWx0IG9mIGtz
dHJkdXAsIGFuZCBjbGVhbiB1cCBvbiBlcnJvci4KClNpZ25lZC1vZmYtYnk6IEhhbnMgVmVya3Vp
bCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPgotLS0KIGRyaXZlcnMvbWVkaWEvY2VjL2NlYy1u
b3RpZmllci5jIHwgMjcgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL2NlYy9jZWMtbm90aWZpZXIuYyBiL2RyaXZlcnMvbWVkaWEvY2VjL2NlYy1ub3RpZmll
ci5jCmluZGV4IDk1OThjNzc3ODg3MS4uZjcyYjE5YzM1MWRkIDEwMDY0NAotLS0gYS9kcml2ZXJz
L21lZGlhL2NlYy9jZWMtbm90aWZpZXIuYworKysgYi9kcml2ZXJzL21lZGlhL2NlYy9jZWMtbm90
aWZpZXIuYwpAQCAtMjEsOCArMjEsOCBAQCBzdHJ1Y3QgY2VjX25vdGlmaWVyIHsKIAlzdHJ1Y3Qg
bXV0ZXggbG9jazsKIAlzdHJ1Y3QgbGlzdF9oZWFkIGhlYWQ7CiAJc3RydWN0IGtyZWYga3JlZjsK
LQlzdHJ1Y3QgZGV2aWNlICpkZXY7Ci0JY29uc3QgY2hhciAqY29ubjsKKwlzdHJ1Y3QgZGV2aWNl
ICpoZG1pX2RldjsKKwljb25zdCBjaGFyICpjb25uX25hbWU7CiAJc3RydWN0IGNlY19hZGFwdGVy
ICpjZWNfYWRhcDsKIAl2b2lkICgqY2FsbGJhY2spKHN0cnVjdCBjZWNfYWRhcHRlciAqYWRhcCwg
dTE2IHBhKTsKIApAQCAtMzIsMTQgKzMyLDE2IEBAIHN0cnVjdCBjZWNfbm90aWZpZXIgewogc3Rh
dGljIExJU1RfSEVBRChjZWNfbm90aWZpZXJzKTsKIHN0YXRpYyBERUZJTkVfTVVURVgoY2VjX25v
dGlmaWVyc19sb2NrKTsKIAotc3RydWN0IGNlY19ub3RpZmllciAqY2VjX25vdGlmaWVyX2dldF9j
b25uKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqY29ubikKK3N0cnVjdCBjZWNfbm90
aWZpZXIgKgorY2VjX25vdGlmaWVyX2dldF9jb25uKHN0cnVjdCBkZXZpY2UgKmhkbWlfZGV2LCBj
b25zdCBjaGFyICpjb25uX25hbWUpCiB7CiAJc3RydWN0IGNlY19ub3RpZmllciAqbjsKIAogCW11
dGV4X2xvY2soJmNlY19ub3RpZmllcnNfbG9jayk7CiAJbGlzdF9mb3JfZWFjaF9lbnRyeShuLCAm
Y2VjX25vdGlmaWVycywgaGVhZCkgewotCQlpZiAobi0+ZGV2ID09IGRldiAmJgotCQkgICAgKCFj
b25uIHx8ICFzdHJjbXAobi0+Y29ubiwgY29ubikpKSB7CisJCWlmIChuLT5oZG1pX2RldiA9PSBo
ZG1pX2RldiAmJgorCQkgICAgKCFjb25uX25hbWUgfHwKKwkJICAgICAobi0+Y29ubl9uYW1lICYm
ICFzdHJjbXAobi0+Y29ubl9uYW1lLCBjb25uX25hbWUpKSkpIHsKIAkJCWtyZWZfZ2V0KCZuLT5r
cmVmKTsKIAkJCW11dGV4X3VubG9jaygmY2VjX25vdGlmaWVyc19sb2NrKTsKIAkJCXJldHVybiBu
OwpAQCAtNDgsMTAgKzUwLDE3IEBAIHN0cnVjdCBjZWNfbm90aWZpZXIgKmNlY19ub3RpZmllcl9n
ZXRfY29ubihzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmNvbm4pCiAJbiA9IGt6YWxs
b2Moc2l6ZW9mKCpuKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFuKQogCQlnb3RvIHVubG9jazsKLQlu
LT5kZXYgPSBkZXY7Ci0JaWYgKGNvbm4pCi0JCW4tPmNvbm4gPSBrc3RyZHVwKGNvbm4sIEdGUF9L
RVJORUwpOworCW4tPmhkbWlfZGV2ID0gaGRtaV9kZXY7CisJaWYgKGNvbm5fbmFtZSkgeworCQlu
LT5jb25uX25hbWUgPSBrc3RyZHVwKGNvbm5fbmFtZSwgR0ZQX0tFUk5FTCk7CisJCWlmICghbi0+
Y29ubl9uYW1lKSB7CisJCQlrZnJlZShuKTsKKwkJCW4gPSBOVUxMOworCQkJZ290byB1bmxvY2s7
CisJCX0KKwl9CiAJbi0+cGh5c19hZGRyID0gQ0VDX1BIWVNfQUREUl9JTlZBTElEOworCiAJbXV0
ZXhfaW5pdCgmbi0+bG9jayk7CiAJa3JlZl9pbml0KCZuLT5rcmVmKTsKIAlsaXN0X2FkZF90YWls
KCZuLT5oZWFkLCAmY2VjX25vdGlmaWVycyk7CkBAIC02Nyw3ICs3Niw3IEBAIHN0YXRpYyB2b2lk
IGNlY19ub3RpZmllcl9yZWxlYXNlKHN0cnVjdCBrcmVmICprcmVmKQogCQljb250YWluZXJfb2Yo
a3JlZiwgc3RydWN0IGNlY19ub3RpZmllciwga3JlZik7CiAKIAlsaXN0X2RlbCgmbi0+aGVhZCk7
Ci0Ja2ZyZWUobi0+Y29ubik7CisJa2ZyZWUobi0+Y29ubl9uYW1lKTsKIAlrZnJlZShuKTsKIH0K
IAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
