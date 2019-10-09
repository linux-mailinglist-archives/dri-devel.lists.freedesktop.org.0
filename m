Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AC1D2128
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A104895A8;
	Thu, 10 Oct 2019 06:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397E16E247;
 Wed,  9 Oct 2019 13:15:33 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iIBoN-0006s3-B8; Wed, 09 Oct 2019 14:15:27 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iIBoM-00019G-PA; Wed, 09 Oct 2019 14:15:26 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Subject: [PATCH] drm/nouveau/falcon: make unexported objects static
Date: Wed,  9 Oct 2019 14:15:25 +0100
Message-Id: <20191009131525.4352-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:04 +0000
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

TWFrZSB0aGUgbXNncXVldWVfMDE0OGNkZWNfYWNyX2Z1bmMgYW5kIG1zZ3F1ZXVlXzAxNDhjZGVj
X2Z1bmMKc3RhdGljIHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcgc3BhcnNlIHdhcm5pbmdzOgoKZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9mYWxjb24vbXNncXVldWVfMDE0OGNkZWMuYzoyMzA6
MTogd2FybmluZzogc3ltYm9sICdtc2dxdWV1ZV8wMTQ4Y2RlY19hY3JfZnVuYycgd2FzIG5vdCBk
ZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZr
bS9mYWxjb24vbXNncXVldWVfMDE0OGNkZWMuYzoyNDE6MTogd2FybmluZzogc3ltYm9sICdtc2dx
dWV1ZV8wMTQ4Y2RlY19mdW5jJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGlj
PwoKU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgot
LS0KQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9mYWxjb24vbXNncXVldWVfMDE0OGNkZWMuYyB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2ZhbGNvbi9tc2dxdWV1ZV8wMTQ4Y2Rl
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9mYWxjb24vbXNncXVldWVfMDE0OGNk
ZWMuYwppbmRleCA5NDI0ODAzYjllZjQuLmRmYzBkNTBmMDgwYiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9mYWxjb24vbXNncXVldWVfMDE0OGNkZWMuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2ZhbGNvbi9tc2dxdWV1ZV8wMTQ4Y2RlYy5jCkBA
IC0yMjYsNyArMjI2LDcgQEAgYWNyX2Jvb3RfZmFsY29uKHN0cnVjdCBudmttX21zZ3F1ZXVlICpw
cml2LCBlbnVtIG52a21fc2VjYm9vdF9mYWxjb24gZmFsY29uKQogCXJldHVybiAwOwogfQogCi1j
b25zdCBzdHJ1Y3QgbnZrbV9tc2dxdWV1ZV9hY3JfZnVuYworc3RhdGljIGNvbnN0IHN0cnVjdCBu
dmttX21zZ3F1ZXVlX2Fjcl9mdW5jCiBtc2dxdWV1ZV8wMTQ4Y2RlY19hY3JfZnVuYyA9IHsKIAku
Ym9vdF9mYWxjb24gPSBhY3JfYm9vdF9mYWxjb24sCiB9OwpAQCAtMjM3LDcgKzIzNyw3IEBAIG1z
Z3F1ZXVlXzAxNDhjZGVjX2R0b3Ioc3RydWN0IG52a21fbXNncXVldWUgKnF1ZXVlKQogCWtmcmVl
KG1zZ3F1ZXVlXzAxNDhjZGVjKHF1ZXVlKSk7CiB9CiAKLWNvbnN0IHN0cnVjdCBudmttX21zZ3F1
ZXVlX2Z1bmMKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbnZrbV9tc2dxdWV1ZV9mdW5jCiBtc2dxdWV1
ZV8wMTQ4Y2RlY19mdW5jID0gewogCS5pbml0X2Z1bmMgPSAmbXNncXVldWVfMDE0OGNkZWNfaW5p
dF9mdW5jLAogCS5hY3JfZnVuYyA9ICZtc2dxdWV1ZV8wMTQ4Y2RlY19hY3JfZnVuYywKLS0gCjIu
MjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
