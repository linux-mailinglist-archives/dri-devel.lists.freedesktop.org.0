Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D14D07F4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E27B6E8F7;
	Wed,  9 Oct 2019 07:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2EB6E799;
 Tue,  8 Oct 2019 11:36:02 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iHnma-0007Yx-TP; Tue, 08 Oct 2019 12:36:01 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iHnma-0007hs-Bu; Tue, 08 Oct 2019 12:36:00 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/nouveau/disp/gv100: make gv100_disp_wimm static
Date: Tue,  8 Oct 2019 12:35:59 +0100
Message-Id: <20191008113559.29569-5-ben.dooks@codethink.co.uk>
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

VGhlIGd2MTAwX2Rpc3Bfd2ltbSBpcyBub3QgZGVjbGFyZWQsIHNvIG1ha2UgaXQgc3RhdGljCnRv
IGF2b2lkIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKCmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252
a20vZW5naW5lL2Rpc3Avd2ltbWd2MTAwLmM6Mzk6MTogd2FybmluZzogc3ltYm9sICdndjEwMF9k
aXNwX3dpbW0nIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpTaWduZWQt
b2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGlzcC93aW1tZ3YxMDAuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3Avd2ltbWd2MTAwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kaXNwL3dpbW1ndjEwMC5jCmluZGV4
IDg5ZDc4MzM2OGI0Zi4uYmI0ZGI2MzUxZGRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9udmttL2VuZ2luZS9kaXNwL3dpbW1ndjEwMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3Avd2ltbWd2MTAwLmMKQEAgLTM1LDcgKzM1LDcgQEAg
Z3YxMDBfZGlzcF93aW1tX2ludHIoc3RydWN0IG52NTBfZGlzcF9jaGFuICpjaGFuLCBib29sIGVu
KQogCW52a21fbWFzayhkZXZpY2UsIDB4NjExZGE4LCBtYXNrLCBkYXRhKTsKIH0KIAotY29uc3Qg
c3RydWN0IG52NTBfZGlzcF9jaGFuX2Z1bmMKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbnY1MF9kaXNw
X2NoYW5fZnVuYwogZ3YxMDBfZGlzcF93aW1tID0gewogCS5pbml0ID0gZ3YxMDBfZGlzcF9kbWFj
X2luaXQsCiAJLmZpbmkgPSBndjEwMF9kaXNwX2RtYWNfZmluaSwKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
