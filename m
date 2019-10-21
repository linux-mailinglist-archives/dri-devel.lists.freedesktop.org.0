Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D122BDF7F7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CAD6E2A8;
	Mon, 21 Oct 2019 22:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4DC6E149
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:52:11 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by andre.telenet-ops.be with bizsmtp
 id GErr2100905gfCL01Erri1; Mon, 21 Oct 2019 16:52:09 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2E-00075d-VZ; Mon, 21 Oct 2019 16:51:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2E-0008FP-Rq; Mon, 21 Oct 2019 16:51:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Breno=20Leit=C3=A3o?= <leitao@debian.org>,
 Nayna Jain <nayna@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David@rox.of.borg, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Casey Leedom <leedom@chelsio.com>,
 Shannon Nelson <snelson@pensando.io>,
 Pensando Drivers <drivers@pensando.io>, Kevin Hilman <khilman@kernel.org>,
 Nishanth Menon <nm@ti.com>
Subject: [PATCH 0/5] debugfs: Remove casts in debugfs_create_*() callers
Date: Mon, 21 Oct 2019 16:51:44 +0200
Message-Id: <20191021145149.31657-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:23:09 +0000
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
Cc: amd-gfx@lists.freedesktop.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CUhpIGFsbCwKCkNhc3RpbmcgcGFyYW1ldGVycyBpbiBkZWJ1Z2ZzX2NyZWF0ZV8qKCkgY2FsbHMg
cHJldmVudHMgdGhlIGNvbXBpbGVyCmZyb20gcGVyZm9ybWluZyBzb21lIGNoZWNrcy4KCkhlbmNl
IHRoaXMgcGF0Y2ggc2VyaWVzIHJlbW92ZXMgc3VwZXJmbHVvdXMgY2FzdHMsIG9yIHJld29ya3Mg
Y29kZSB0byBubwpsb25nZXIgbmVlZCB0aGUgY2FzdHMuCgpBbGwgcGF0Y2hlcyBjYW4gYmUgYXBw
bGllZCBpbmRlcGVuZGVudGx5LCB0aGVyZSBhcmUgbm8gZGVwZW5kZW5jaWVzLgpUaGFua3MgZm9y
IHlvdXIgY29tbWVudHMhCgpHZWVydCBVeXR0ZXJob2V2ZW4gKDUpOgogIGNyeXB0bzogbnggLSBJ
bXByb3ZlIGRlYnVnZnNfY3JlYXRlX3V7MzIsNjR9KCkgaGFuZGxpbmcgZm9yIGF0b21pY3MKICBj
eGdiNC9jeGdiNHZmOiBSZW1vdmUgc3VwZXJmbHVvdXMgdm9pZCAqIGNhc3QgaW4gZGVidWdmc19j
cmVhdGVfZmlsZSgpCiAgICBjYWxsCiAgZHJtL2FtZGdwdTogUmVtb3ZlIHN1cGVyZmx1b3VzIHZv
aWQgKiBjYXN0IGluIGRlYnVnZnNfY3JlYXRlX2ZpbGUoKQogICAgY2FsbAogIHBvd2VyOiBhdnM6
IHNtYXJ0cmVmbGV4OiBSZW1vdmUgc3VwZXJmbHVvdXMgY2FzdCBpbgogICAgZGVidWdmc19jcmVh
dGVfZmlsZSgpIGNhbGwKICBpb25pYzogVXNlIGRlYnVnZnNfY3JlYXRlX2Jvb2woKSB0byBleHBv
cnQgYm9vbAoKIGRyaXZlcnMvY3J5cHRvL254L254X2RlYnVnZnMuYyAgICAgICAgICAgICAgICAg
fCAxOCArKysrKysrKystLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZWJ1Z2ZzLmMgICAgfCAgNCArKy0tCiAuLi4vZXRoZXJuZXQvY2hlbHNpby9jeGdiNHZmL2N4
Z2I0dmZfbWFpbi5jICAgIHwgIDIgKy0KIC4uLi9ldGhlcm5ldC9wZW5zYW5kby9pb25pYy9pb25p
Y19kZWJ1Z2ZzLmMgICAgfCAgMyArLS0KIGRyaXZlcnMvcG93ZXIvYXZzL3NtYXJ0cmVmbGV4LmMg
ICAgICAgICAgICAgICAgfCAgMiArLQogNSBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
LCAxNSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCkdye29ldGplLGVldGluZ31zLAoKCQkJCQkJ
R2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgoJCQkJCQkJICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
