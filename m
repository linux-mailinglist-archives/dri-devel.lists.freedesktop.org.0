Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97911D212D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B19189F1B;
	Thu, 10 Oct 2019 06:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4966E987;
 Wed,  9 Oct 2019 11:58:58 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iIAcG-0004o4-NP; Wed, 09 Oct 2019 12:58:52 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iIAcG-0004Cy-09; Wed, 09 Oct 2019 12:58:52 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Subject: [PATCH] drm/nouveau/core/client: make nvkm_uclient_sclass static
Date: Wed,  9 Oct 2019 12:58:32 +0100
Message-Id: <20191009115832.16130-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:05 +0000
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Dooks <ben.dooks@codethink.co.uk>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG52a21fdWNsaWVudF9zY2xhc3Mgb2JqZWN0IGlzIG5vdCB1c2VkIG91dHNpZGUgdGhlIGZp
bGUKaXQgaXMgZGVmaW5lZCBpbiwgc28gbWFrZSBpdCBzdGF0aWMgdG8gYXZvaWQgdGhlIGZvbGxv
d2luZwpzcGFyc2Ugd2FybmluZzoKCmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vY29yZS9j
bGllbnQuYzo2NDoxOiB3YXJuaW5nOiBzeW1ib2wgJ252a21fdWNsaWVudF9zY2xhc3MnIHdhcyBu
b3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpTaWduZWQtb2ZmLWJ5OiBCZW4gRG9v
a3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+Ci0tLQpDYzogQmVuIFNrZWdncyA8YnNrZWdn
c0ByZWRoYXQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL2NvcmUvY2xpZW50LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmttL2NvcmUvY2xpZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL2NvcmUvY2xpZW50LmMKaW5kZXggYWM2NzEyMDI5MTllLi4wYzhjNTVjNzNiMTIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vY29yZS9jbGllbnQuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2NvcmUvY2xpZW50LmMKQEAgLTYwLDcgKzYwLDcg
QEAgbnZrbV91Y2xpZW50X25ldyhjb25zdCBzdHJ1Y3QgbnZrbV9vY2xhc3MgKm9jbGFzcywgdm9p
ZCAqYXJndiwgdTMyIGFyZ2MsCiAJcmV0dXJuIDA7CiB9CiAKLWNvbnN0IHN0cnVjdCBudmttX3Nj
bGFzcworc3RhdGljIGNvbnN0IHN0cnVjdCBudmttX3NjbGFzcwogbnZrbV91Y2xpZW50X3NjbGFz
cyA9IHsKIAkub2NsYXNzID0gTlZJRl9DTEFTU19DTElFTlQsCiAJLm1pbnZlciA9IDAsCi0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
