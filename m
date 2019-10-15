Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A15FD7BE8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F406E851;
	Tue, 15 Oct 2019 16:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43B889C05;
 Tue, 15 Oct 2019 13:55:22 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iKNIC-0003s9-Sv; Tue, 15 Oct 2019 14:55:17 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iKNIC-0002ho-Du; Tue, 15 Oct 2019 14:55:16 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Subject: [PATCH] drm/nouveau/disp/gv100: make gv100_disp_core_mthd_{base,
 sor} static
Date: Tue, 15 Oct 2019 14:55:15 +0100
Message-Id: <20191015135515.10357-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGd2MTAwX2Rpc3BfY29yZV9tdGhkX3tiYXNlLHNvcn0gYXJlIG5vdCB1c2VkIG91dHNpZGUK
b2YgdGhlIGZpbGUgdGhleSBhcmUgZGVmaW5lZCBpbiwgc28gbWFrZSB0aGVtIHN0YXRpYyB0bwph
dm9pZCB0aGUgZm9sbG93aW5nIHNwYXJzZSB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbnZrbS9lbmdpbmUvZGlzcC9jb3JlZ3YxMDAuYzoyNzoxOiB3YXJuaW5nOiBzeW1ib2wgJ2d2
MTAwX2Rpc3BfY29yZV9tdGhkX2Jhc2UnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBz
dGF0aWM/CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3AvY29yZWd2MTAw
LmM6NDM6MTogd2FybmluZzogc3ltYm9sICdndjEwMF9kaXNwX2NvcmVfbXRoZF9zb3InIHdhcyBu
b3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpTaWduZWQtb2ZmLWJ5OiBCZW4gRG9v
a3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+Ci0tLQpCYWQgZGl2aXNvciBpbiBtYWluOjp2
Y3NfYXNzaWduOiAwCkNjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBub3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwotLS0K
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3AvY29yZWd2MTAwLmMgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGlzcC9jb3Jl
Z3YxMDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3AvY29yZWd2
MTAwLmMKaW5kZXggNDU5MmQwZTY5ZmVjLi45NTk0YmE3MzIxMTMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3AvY29yZWd2MTAwLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGlzcC9jb3JlZ3YxMDAuYwpAQCAtMjMs
NyArMjMsNyBAQAogCiAjaW5jbHVkZSA8c3ViZGV2L3RpbWVyLmg+CiAKLWNvbnN0IHN0cnVjdCBu
djUwX2Rpc3BfbXRoZF9saXN0CitzdGF0aWMgY29uc3Qgc3RydWN0IG52NTBfZGlzcF9tdGhkX2xp
c3QKIGd2MTAwX2Rpc3BfY29yZV9tdGhkX2Jhc2UgPSB7CiAJLm10aGQgPSAweDAwMDAsCiAJLmFk
ZHIgPSAweDAwMDAwMCwKQEAgLTM5LDcgKzM5LDcgQEAgZ3YxMDBfZGlzcF9jb3JlX210aGRfYmFz
ZSA9IHsKIAl9CiB9OwogCi1jb25zdCBzdHJ1Y3QgbnY1MF9kaXNwX210aGRfbGlzdAorc3RhdGlj
IGNvbnN0IHN0cnVjdCBudjUwX2Rpc3BfbXRoZF9saXN0CiBndjEwMF9kaXNwX2NvcmVfbXRoZF9z
b3IgPSB7CiAJLm10aGQgPSAweDAwMjAsCiAJLmFkZHIgPSAweDAwMDAyMCwKLS0gCjIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
