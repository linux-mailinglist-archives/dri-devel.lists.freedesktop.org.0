Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FC5D07F5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6816E8F9;
	Wed,  9 Oct 2019 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D006E11A;
 Tue,  8 Oct 2019 11:36:02 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iHnma-0007Yv-Re; Tue, 08 Oct 2019 12:36:00 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iHnma-0007hm-9A; Tue, 08 Oct 2019 12:36:00 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/nouveau/fifo/gv100: make gv100_fifo_runlist static
Date: Tue,  8 Oct 2019 12:35:57 +0100
Message-Id: <20191008113559.29569-3-ben.dooks@codethink.co.uk>
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

RG8gbm90IGV4cG9ydCBndjEwMF9maWZvX3J1bmxpc3QgYXMgaXQgaXNuJ3Qgbm90IHVzZWQKdG8g
cmVtb3ZlIHRoZSBmb2xsb3dpbmcgbW9ybmluZzoKCmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252
a20vZW5naW5lL2ZpZm8vZ3YxMDAuYzo1NjoxOiB3YXJuaW5nOiBzeW1ib2wgJ2d2MTAwX2ZpZm9f
cnVubGlzdCcgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KClNpZ25lZC1v
ZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9maWZvL2d2MTAwLmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9maWZvL2d2MTAwLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9maWZvL2d2MTAwLmMKaW5kZXggNmVlMWJiMzJhMDcx
Li4xZjZkZGY4ODAxNzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
ZW5naW5lL2ZpZm8vZ3YxMDAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2Vu
Z2luZS9maWZvL2d2MTAwLmMKQEAgLTUyLDcgKzUyLDcgQEAgZ3YxMDBfZmlmb19ydW5saXN0X2Nn
cnAoc3RydWN0IG52a21fZmlmb19jZ3JwICpjZ3JwLAogCW52a21fd28zMihtZW1vcnksIG9mZnNl
dCArIDB4YywgMHgwMDAwMDAwMCk7CiB9CiAKLWNvbnN0IHN0cnVjdCBnazEwNF9maWZvX3J1bmxp
c3RfZnVuYworc3RhdGljIGNvbnN0IHN0cnVjdCBnazEwNF9maWZvX3J1bmxpc3RfZnVuYwogZ3Yx
MDBfZmlmb19ydW5saXN0ID0gewogCS5zaXplID0gMTYsCiAJLmNncnAgPSBndjEwMF9maWZvX3J1
bmxpc3RfY2dycCwKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
