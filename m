Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 237D9FF8F6
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9846E29B;
	Sun, 17 Nov 2019 11:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCC76E925
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 16:07:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11937AEED;
 Fri, 15 Nov 2019 16:07:38 +0000 (UTC)
Date: Fri, 15 Nov 2019 17:07:36 +0100
From: Jean Delvare <jdelvare@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 RESEND] drm/edid: no CEA v3 extension is not an error
Message-ID: <20191115170736.7d88593d@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgZmluZSBmb3IgZGlzcGxheXMgd2l0aG91dCBhdWRpbyBmdW5jdGlvbmFsaXR5IHRvIG5v
dCBpbXBsZW1lbnQKQ0VBIHYzIGV4dGVuc2lvbiBpbiB0aGVpciBFRElELiBEbyBub3QgcmV0dXJu
IGFuIGVycm9yIGluIHRoYXQgY2FzZSwKaW5zdGVhZCByZXR1cm4gMCBhcyBpZiB0aGVyZSB3YXMg
YSBDRUEgdjMgZXh0ZW5zaW9uIHdpdGggbm8gYXVkaW8gb3IKc3BlYWtlciBibG9jay4KClRoaXMg
Zml4ZXMgdGhlIHNlY29uZCBoYWxmIG9mIGJ1ZyBmZG8jMTA3ODI1OgpodHRwczovL2J1Z3MuZnJl
ZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDc4MjUKClNpZ25lZC1vZmYtYnk6IEplYW4g
RGVsdmFyZSA8amRlbHZhcmVAc3VzZS5kZT4KUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1l
LnJpcGFyZEBib290bGluLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgotLS0KQWxyZWFkeSBzZW50IG9uOiAyMDE5LTA5LTA0CgpDaGFuZ2VzIHNpbmNl
IHYxOgogKiBUcmVhdCBDRUEgZXh0ZW5zaW9uIHZlcnNpb24gPCAzIGFzIG5vbi1lcnJvciB0b28g
KHN1Z2dlc3RlZCBieSBWaWxsZQogICBTeXJqw6Rsw6QpCgogZHJpdmVycy9ncHUvZHJtL2RybV9l
ZGlkLmMgfCAgICA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKLS0tIGxpbnV4LTUuNC1yYzcub3JpZy9kcml2ZXJzL2dwdS9kcm0vZHJt
X2VkaWQuYwkyMDE5LTExLTE1IDEyOjA5OjAzLjE4NjcyNTQxNCArMDEwMAorKysgbGludXgtNS40
LXJjNy9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwkyMDE5LTExLTE1IDE0OjIxOjQxLjY3NjA3
MzQ1MSArMDEwMApAQCAtNDE4NiwxMiArNDE4NiwxMiBAQCBpbnQgZHJtX2VkaWRfdG9fc2FkKHN0
cnVjdCBlZGlkICplZGlkLCBzCiAJY2VhID0gZHJtX2ZpbmRfY2VhX2V4dGVuc2lvbihlZGlkKTsK
IAlpZiAoIWNlYSkgewogCQlEUk1fREVCVUdfS01TKCJTQUQ6IG5vIENFQSBFeHRlbnNpb24gZm91
bmRcbiIpOwotCQlyZXR1cm4gLUVOT0VOVDsKKwkJcmV0dXJuIDA7CiAJfQogCiAJaWYgKGNlYV9y
ZXZpc2lvbihjZWEpIDwgMykgewogCQlEUk1fREVCVUdfS01TKCJTQUQ6IHdyb25nIENFQSByZXZp
c2lvblxuIik7Ci0JCXJldHVybiAtRU5PVFNVUFA7CisJCXJldHVybiAwOwogCX0KIAogCWlmIChj
ZWFfZGJfb2Zmc2V0cyhjZWEsICZzdGFydCwgJmVuZCkpIHsKQEAgLTQyNDcsMTIgKzQyNDcsMTIg
QEAgaW50IGRybV9lZGlkX3RvX3NwZWFrZXJfYWxsb2NhdGlvbihzdHJ1YwogCWNlYSA9IGRybV9m
aW5kX2NlYV9leHRlbnNpb24oZWRpZCk7CiAJaWYgKCFjZWEpIHsKIAkJRFJNX0RFQlVHX0tNUygi
U0FEOiBubyBDRUEgRXh0ZW5zaW9uIGZvdW5kXG4iKTsKLQkJcmV0dXJuIC1FTk9FTlQ7CisJCXJl
dHVybiAwOwogCX0KIAogCWlmIChjZWFfcmV2aXNpb24oY2VhKSA8IDMpIHsKIAkJRFJNX0RFQlVH
X0tNUygiU0FEOiB3cm9uZyBDRUEgcmV2aXNpb25cbiIpOwotCQlyZXR1cm4gLUVOT1RTVVBQOwor
CQlyZXR1cm4gMDsKIAl9CiAKIAlpZiAoY2VhX2RiX29mZnNldHMoY2VhLCAmc3RhcnQsICZlbmQp
KSB7CgoKLS0gCkplYW4gRGVsdmFyZQpTVVNFIEwzIFN1cHBvcnQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
