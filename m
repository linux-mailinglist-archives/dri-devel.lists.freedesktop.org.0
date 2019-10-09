Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6893DD212E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490EA89F53;
	Thu, 10 Oct 2019 06:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CE16E98C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 12:14:53 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iIAri-0005Hf-Ro; Wed, 09 Oct 2019 13:14:50 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iIAri-000852-BK; Wed, 09 Oct 2019 13:14:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Subject: [PATCH] drm/scheduler: make unexported items static
Date: Wed,  9 Oct 2019 13:14:47 +0100
Message-Id: <20191009121447.31017-1-ben.dooks@codethink.co.uk>
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
Cc: David Airlie <airlied@linux.ie>, Ben Dooks <ben.dooks@codethink.co.uk>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRybV9zY2hlZF9mZW5jZV9vcHNfe3NjaGVkdWxlZCxmaW5pc2hlZH0gYXJlIG5vdCBleHBv
cnRlZApmcm9tIHRoZSBmaWxlIHNvIG1ha2UgdGhlbSBzdGF0aWMgdG8gYXZvaWQgdGhlIGZvbGxv
d2luZwp3YXJuaW5ncyBmcm9tIHNwYXJzZToKCmRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfZmVuY2UuYzoxMzE6Mjg6IHdhcm5pbmc6IHN5bWJvbCAnZHJtX3NjaGVkX2ZlbmNlX29wc19z
Y2hlZHVsZWQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CmRyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZmVuY2UuYzoxMzc6Mjg6IHdhcm5pbmc6IHN5bWJvbCAn
ZHJtX3NjaGVkX2ZlbmNlX29wc19maW5pc2hlZCcgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0
IGJlIHN0YXRpYz8KClNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGlu
ay5jby51az4KLS0tCkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9mZW5jZS5jIHwgNCAr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZmVuY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZmVuY2UuYwppbmRleCA1NDk3NzQwOGY1NzQuLjhi
NDVjM2ExYjg0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9m
ZW5jZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZmVuY2UuYwpAQCAt
MTI4LDEzICsxMjgsMTMgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2ZlbmNlX3JlbGVhc2VfZmlu
aXNoZWQoc3RydWN0IGRtYV9mZW5jZSAqZikKIAlkbWFfZmVuY2VfcHV0KCZmZW5jZS0+c2NoZWR1
bGVkKTsKIH0KIAotY29uc3Qgc3RydWN0IGRtYV9mZW5jZV9vcHMgZHJtX3NjaGVkX2ZlbmNlX29w
c19zY2hlZHVsZWQgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9mZW5jZV9vcHMgZHJtX3Nj
aGVkX2ZlbmNlX29wc19zY2hlZHVsZWQgPSB7CiAJLmdldF9kcml2ZXJfbmFtZSA9IGRybV9zY2hl
ZF9mZW5jZV9nZXRfZHJpdmVyX25hbWUsCiAJLmdldF90aW1lbGluZV9uYW1lID0gZHJtX3NjaGVk
X2ZlbmNlX2dldF90aW1lbGluZV9uYW1lLAogCS5yZWxlYXNlID0gZHJtX3NjaGVkX2ZlbmNlX3Jl
bGVhc2Vfc2NoZWR1bGVkLAogfTsKIAotY29uc3Qgc3RydWN0IGRtYV9mZW5jZV9vcHMgZHJtX3Nj
aGVkX2ZlbmNlX29wc19maW5pc2hlZCA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX2ZlbmNl
X29wcyBkcm1fc2NoZWRfZmVuY2Vfb3BzX2ZpbmlzaGVkID0gewogCS5nZXRfZHJpdmVyX25hbWUg
PSBkcm1fc2NoZWRfZmVuY2VfZ2V0X2RyaXZlcl9uYW1lLAogCS5nZXRfdGltZWxpbmVfbmFtZSA9
IGRybV9zY2hlZF9mZW5jZV9nZXRfdGltZWxpbmVfbmFtZSwKIAkucmVsZWFzZSA9IGRybV9zY2hl
ZF9mZW5jZV9yZWxlYXNlX2ZpbmlzaGVkLAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
