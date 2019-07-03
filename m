Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F201F5E752
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 17:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65A96E14E;
	Wed,  3 Jul 2019 15:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cam-smtp0.cambridge.arm.com (unknown [217.140.106.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2656E14E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 15:03:46 +0000 (UTC)
Received: from e110455-lin.cambridge.arm.com (e110455-lin.cambridge.arm.com
 [10.2.131.87])
 by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id x63F3Uwx025553;
 Wed, 3 Jul 2019 16:03:30 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/drm_debugfs_crc.c: Document that .verify_crc_source vfunc
 is required for enabling CRC support.
Date: Wed,  3 Jul 2019 16:03:30 +0100
Message-Id: <20190703150330.21992-1-Liviu.Dudau@arm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Liviu Dudau <liviu.dudau@arm.com>, DRI devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2RlYnVnZnNfY3J0Y19jcmNfYWRkKCkgZnVuY3Rpb24gY2hlY2tzIHRoYXQgYm90aCAuc2V0
X2NyY19zb3VyY2UgYW5kCi52ZXJpZnlfY3JjX3NvdXJjZSBob29rcyBhcmUgcHJvdmlkZWQgYmVm
b3JlIGVuYWJsaW5nIGRlYnVnZnMgc3VwcG9ydCBmb3IKcmVhZGluZyBwZXItZnJhbWUgQ1JDIGRh
dGEuIE1ha2UgdGhhdCBleHBsaWNpdCBpbiB0aGUgZG9jdW1lbnRhdGlvbi4KCkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IExpdml1IER1ZGF1IDxsaXZp
dS5kdWRhdUBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8
IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwppbmRleCA3Y2E0ODZkNzUwZTkuLjY2MDRlZDIy
MzE2MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwpAQCAtNjYsOSArNjYsOSBAQAogICog
dGhlIHJlcG9ydGVkIENSQ3Mgb2YgZnJhbWVzIHRoYXQgc2hvdWxkIGhhdmUgdGhlIHNhbWUgY29u
dGVudHMuCiAgKgogICogT24gdGhlIGRyaXZlciBzaWRlIHRoZSBpbXBsZW1lbnRhdGlvbiBlZmZv
cnQgaXMgbWluaW1hbCwgZHJpdmVycyBvbmx5IG5lZWQgdG8KLSAqIGltcGxlbWVudCAmZHJtX2Ny
dGNfZnVuY3Muc2V0X2NyY19zb3VyY2UuIFRoZSBkZWJ1Z2ZzIGZpbGVzIGFyZSBhdXRvbWF0aWNh
bGx5Ci0gKiBzZXQgdXAgaWYgdGhhdCB2ZnVuYyBpcyBzZXQuIENSQyBzYW1wbGVzIG5lZWQgdG8g
YmUgY2FwdHVyZWQgaW4gdGhlIGRyaXZlciBieQotICogY2FsbGluZyBkcm1fY3J0Y19hZGRfY3Jj
X2VudHJ5KCkuCisgKiBpbXBsZW1lbnQgJmRybV9jcnRjX2Z1bmNzLnNldF9jcmNfc291cmNlIGFu
ZCAmZHJtX2NydGNfZnVuY3MudmVyaWZ5X2NyY19zb3VyY2UuCisgKiBUaGUgZGVidWdmcyBmaWxl
cyBhcmUgYXV0b21hdGljYWxseSBzZXQgdXAgaWYgdGhvc2UgdmZ1bmNzIGFyZSBzZXQuIENSQyBz
YW1wbGVzCisgKiBuZWVkIHRvIGJlIGNhcHR1cmVkIGluIHRoZSBkcml2ZXIgYnkgY2FsbGluZyBk
cm1fY3J0Y19hZGRfY3JjX2VudHJ5KCkuCiAgKi8KIAogc3RhdGljIGludCBjcmNfY29udHJvbF9z
aG93KHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
