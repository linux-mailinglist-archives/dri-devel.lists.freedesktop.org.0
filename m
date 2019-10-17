Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33883DCE3B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3DC6EBA4;
	Fri, 18 Oct 2019 18:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92AE6EA50
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 11:04:31 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iL3a1-0002ch-AQ; Thu, 17 Oct 2019 12:04:29 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iL3a0-0008AW-Ld; Thu, 17 Oct 2019 12:04:28 +0100
From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Subject: [PATCH] gpu: host1x: make 'host1x_cdma_wait_pushbuffer_space' static
Date: Thu, 17 Oct 2019 12:04:27 +0100
Message-Id: <20191017110427.31354-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
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
Cc: linux-tegra@vger.kernel.org,
 "Ben Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGhvc3QxeF9jZG1hX3dhaXRfcHVzaGJ1ZmZlcl9zcGFjZSBmdW5jdGlvbiBpcyBub3QgZGVj
bGFyZWQKb3IgZGlyZWN0bHkgY2FsbGVkIGZyb20gb3V0c2lkZSB0aGUgZmlsZSBpdCBpcyBpbiwg
c28gbWFrZSBpdApzdGF0aWMuCgpGaXhlcyB0aGUgZm9sbG93aW5nIHNwYXJzZSB3YXJuaWduOgpk
cml2ZXJzL2dwdS9ob3N0MXgvY2RtYS5jOjIzNTo1OiB3YXJuaW5nOiBzeW1ib2wgJ2hvc3QxeF9j
ZG1hX3dhaXRfcHVzaGJ1ZmZlcl9zcGFjZScgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJl
IHN0YXRpYz8KClNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5j
by51az4KLS0tCkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtdGVncmFAdmdlci5r
ZXJuZWwub3JnCi0tLQogZHJpdmVycy9ncHUvaG9zdDF4L2NkbWEuYyB8IDYgKysrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2hvc3QxeC9jZG1hLmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvY2RtYS5jCmlu
ZGV4IDQ4Yzg0YzQ4Mjk5Yy4uZThkM2ZkYTkxZDhhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9o
b3N0MXgvY2RtYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9jZG1hLmMKQEAgLTIzMiw5ICsy
MzIsOSBAQCB1bnNpZ25lZCBpbnQgaG9zdDF4X2NkbWFfd2FpdF9sb2NrZWQoc3RydWN0IGhvc3Qx
eF9jZG1hICpjZG1hLAogICoKICAqIE11c3QgYmUgY2FsbGVkIHdpdGggdGhlIGNkbWEgbG9jayBo
ZWxkLgogICovCi1pbnQgaG9zdDF4X2NkbWFfd2FpdF9wdXNoYnVmZmVyX3NwYWNlKHN0cnVjdCBo
b3N0MXggKmhvc3QxeCwKLQkJCQkgICAgICBzdHJ1Y3QgaG9zdDF4X2NkbWEgKmNkbWEsCi0JCQkJ
ICAgICAgdW5zaWduZWQgaW50IG5lZWRlZCkKK3N0YXRpYyBpbnQgaG9zdDF4X2NkbWFfd2FpdF9w
dXNoYnVmZmVyX3NwYWNlKHN0cnVjdCBob3N0MXggKmhvc3QxeCwKKwkJCQkJICAgICBzdHJ1Y3Qg
aG9zdDF4X2NkbWEgKmNkbWEsCisJCQkJCSAgICAgdW5zaWduZWQgaW50IG5lZWRlZCkKIHsKIAl3
aGlsZSAodHJ1ZSkgewogCQlzdHJ1Y3QgcHVzaF9idWZmZXIgKnBiID0gJmNkbWEtPnB1c2hfYnVm
ZmVyOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
