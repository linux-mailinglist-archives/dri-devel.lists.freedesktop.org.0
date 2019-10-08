Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8300D080A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AF46E911;
	Wed,  9 Oct 2019 07:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15206E796;
 Tue,  8 Oct 2019 11:36:02 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iHnma-0007Yw-SX; Tue, 08 Oct 2019 12:36:00 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iHnma-0007hp-As; Tue, 08 Oct 2019 12:36:00 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/nouveau/disp/gv100: make undeclared symbols static
Date: Tue,  8 Oct 2019 12:35:58 +0100
Message-Id: <20191008113559.29569-4-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
References: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:50 +0000
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
Cc: David Airlie <airlied@linux.ie>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHR3byBvYmplY3RzIGd2MTAwX2Rpc3Bfd25kdyBhbmQgZ3YxMDBfZGlzcF93bmR3X210aGQg
YXJlCm5vdCBkZWNsYXJlZCBvciB1c2VkIG91dHNpZGUgdGhlIGZpbGUsIHNvIG1ha2UgdGhlbSBz
dGF0aWMgdG8KYXZvaWQgdGhlIGZvbGxvd2luZyB3YXJuaW5nczoKCmRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252a20vZW5naW5lL2Rpc3Avd25kd2d2MTAwLmM6MTIwOjE6IHdhcm5pbmc6IHN5bWJv
bCAnZ3YxMDBfZGlzcF93bmR3X210aGQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBz
dGF0aWM/CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3Avd25kd2d2MTAw
LmM6MTQwOjE6IHdhcm5pbmc6IHN5bWJvbCAnZ3YxMDBfZGlzcF93bmR3JyB3YXMgbm90IGRlY2xh
cmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwoKU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4u
ZG9va3NAY29kZXRoaW5rLmNvLnVrPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
ZW5naW5lL2Rpc3Avd25kd2d2MTAwLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9lbmdpbmUvZGlzcC93bmR3Z3YxMDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L252a20vZW5naW5lL2Rpc3Avd25kd2d2MTAwLmMKaW5kZXggNWQzYjY0MWRiYjE0Li5lNjM1
MjQ3ZDc5NGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5l
L2Rpc3Avd25kd2d2MTAwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdp
bmUvZGlzcC93bmR3Z3YxMDAuYwpAQCAtMTE2LDcgKzExNiw3IEBAIGd2MTAwX2Rpc3Bfd25kd19t
dGhkX2Jhc2UgPSB7CiAJfQogfTsKIAotY29uc3Qgc3RydWN0IG52NTBfZGlzcF9jaGFuX210aGQK
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgbnY1MF9kaXNwX2NoYW5fbXRoZAogZ3YxMDBfZGlzcF93bmR3
X210aGQgPSB7CiAJLm5hbWUgPSAiV2luZG93IiwKIAkuYWRkciA9IDB4MDAxMDAwLApAQCAtMTM2
LDcgKzEzNiw3IEBAIGd2MTAwX2Rpc3Bfd25kd19pbnRyKHN0cnVjdCBudjUwX2Rpc3BfY2hhbiAq
Y2hhbiwgYm9vbCBlbikKIAludmttX21hc2soZGV2aWNlLCAweDYxMWRhNCwgbWFzaywgZGF0YSk7
CiB9CiAKLWNvbnN0IHN0cnVjdCBudjUwX2Rpc3BfY2hhbl9mdW5jCitzdGF0aWMgY29uc3Qgc3Ry
dWN0IG52NTBfZGlzcF9jaGFuX2Z1bmMKIGd2MTAwX2Rpc3Bfd25kdyA9IHsKIAkuaW5pdCA9IGd2
MTAwX2Rpc3BfZG1hY19pbml0LAogCS5maW5pID0gZ3YxMDBfZGlzcF9kbWFjX2ZpbmksCi0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
