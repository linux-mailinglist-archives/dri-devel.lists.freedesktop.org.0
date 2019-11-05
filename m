Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD1F05F6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 20:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67196EB63;
	Tue,  5 Nov 2019 19:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44116EB47
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 18:35:10 +0000 (UTC)
Received: from ramsan ([84.195.182.253]) by michel.telenet-ops.be with bizsmtp
 id NJb62100N5USYZQ06Jb6zw; Tue, 05 Nov 2019 19:35:08 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iS3fW-0002sL-LC; Tue, 05 Nov 2019 19:35:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iS3fW-0005al-K1; Tue, 05 Nov 2019 19:35:06 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 2/3] drm: rcar-du: Recognize "renesas,
 vsps" in addition to "vsps"
Date: Tue,  5 Nov 2019 19:35:03 +0100
Message-Id: <20191105183504.21447-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105183504.21447-1-geert+renesas@glider.be>
References: <20191105183504.21447-1-geert+renesas@glider.be>
X-Mailman-Approved-At: Tue, 05 Nov 2019 19:26:40 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFJlbmVzYXMtc3BlY2lmaWMgInZzcHMiIHByb3BlcnR5IGxhY2tzIGEgdmVuZG9yIHByZWZp
eC4KQWRkIGEgInJlbmVzYXMsIiBwcmVmaXggdG8gY29tcGx5IHdpdGggRFQgYmVzdCBwcmFjdGlz
ZXMuClJldGFpbiBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IHdpdGggb2xkIERUQnMgYnkgZmFsbGlu
ZyBiYWNrIHRvICJ2c3BzIgp3aGVuIG5lZWRlZC4KCkZpeGVzOiA2ZDYyZWYzYWMzMGJlNzU2ICgi
ZHJtOiByY2FyLWR1OiBFeHBvc2UgdGhlIFZTUDEgY29tcG9zaXRvciB0aHJvdWdoIEtNUyBwbGFu
ZXMiKQpTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgfCAxNyAr
KysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9r
bXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKaW5kZXggMTg2NDIy
YWM1NTJiMjg3MC4uYjE0Njc2ZjdhOWYxNzUwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JjYXItZHUvcmNhcl9kdV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2Fy
X2R1X2ttcy5jCkBAIC01NDQsNiArNTQ0LDcgQEAgc3RhdGljIGludCByY2FyX2R1X3Byb3BlcnRp
ZXNfaW5pdChzdHJ1Y3QgcmNhcl9kdV9kZXZpY2UgKnJjZHUpCiBzdGF0aWMgaW50IHJjYXJfZHVf
dnNwc19pbml0KHN0cnVjdCByY2FyX2R1X2RldmljZSAqcmNkdSkKIHsKIAljb25zdCBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wID0gcmNkdS0+ZGV2LT5vZl9ub2RlOworCWNvbnN0IGNoYXIgKnZzcHNf
cHJvcF9uYW1lID0gInJlbmVzYXMsdnNwcyI7CiAJc3RydWN0IG9mX3BoYW5kbGVfYXJncyBhcmdz
OwogCXN0cnVjdCB7CiAJCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7CkBAIC01NTksMTUgKzU2MCwy
MSBAQCBzdGF0aWMgaW50IHJjYXJfZHVfdnNwc19pbml0KHN0cnVjdCByY2FyX2R1X2RldmljZSAq
cmNkdSkKIAkgKiBlbnRyeSBjb250YWlucyBhIHBvaW50ZXIgdG8gdGhlIFZTUCBEVCBub2RlIGFu
ZCBhIGJpdG1hc2sgb2YgdGhlCiAJICogY29ubmVjdGVkIERVIENSVENzLgogCSAqLwotCWNlbGxz
ID0gb2ZfcHJvcGVydHlfY291bnRfdTMyX2VsZW1zKG5wLCAidnNwcyIpIC8gcmNkdS0+bnVtX2Ny
dGNzIC0gMTsKKwlyZXQgPSBvZl9wcm9wZXJ0eV9jb3VudF91MzJfZWxlbXMobnAsIHZzcHNfcHJv
cF9uYW1lKTsKKwlpZiAocmV0IDwgMCkgeworCQkvKiBCYWNrd2FyZCBjb21wYXRpYmlsaXR5IHdp
dGggb2xkIERUQnMgKi8KKwkJdnNwc19wcm9wX25hbWUgPSAidnNwcyI7CisJCXJldCA9IG9mX3By
b3BlcnR5X2NvdW50X3UzMl9lbGVtcyhucCwgdnNwc19wcm9wX25hbWUpOworCX0KKwljZWxscyA9
IHJldCAvIHJjZHUtPm51bV9jcnRjcyAtIDE7CiAJaWYgKGNlbGxzID4gMSkKIAkJcmV0dXJuIC1F
SU5WQUw7CiAKIAlmb3IgKGkgPSAwOyBpIDwgcmNkdS0+bnVtX2NydGNzOyArK2kpIHsKIAkJdW5z
aWduZWQgaW50IGo7CiAKLQkJcmV0ID0gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2ZpeGVkX2FyZ3Mo
bnAsICJ2c3BzIiwgY2VsbHMsIGksCi0JCQkJCQkgICAgICAgJmFyZ3MpOworCQlyZXQgPSBvZl9w
YXJzZV9waGFuZGxlX3dpdGhfZml4ZWRfYXJncyhucCwgdnNwc19wcm9wX25hbWUsCisJCQkJCQkg
ICAgICAgY2VsbHMsIGksICZhcmdzKTsKIAkJaWYgKHJldCA8IDApCiAJCQlnb3RvIGVycm9yOwog
CkBAIC01ODksOCArNTk2LDggQEAgc3RhdGljIGludCByY2FyX2R1X3ZzcHNfaW5pdChzdHJ1Y3Qg
cmNhcl9kdV9kZXZpY2UgKnJjZHUpCiAKIAkJLyoKIAkJICogU3RvcmUgdGhlIFZTUCBwb2ludGVy
IGFuZCBwaXBlIGluZGV4IGluIHRoZSBDUlRDLiBJZiB0aGUKLQkJICogc2Vjb25kIGNlbGwgb2Yg
dGhlICd2c3BzJyBzcGVjaWZpZXIgaXNuJ3QgcHJlc2VudCwgZGVmYXVsdAotCQkgKiB0byAwIHRv
IHJlbWFpbiBjb21wYXRpYmxlIHdpdGggb2xkZXIgRFQgYmluZGluZ3MuCisJCSAqIHNlY29uZCBj
ZWxsIG9mIHRoZSAncmVuZXNhcyx2c3BzJyBzcGVjaWZpZXIgaXNuJ3QgcHJlc2VudCwKKwkJICog
ZGVmYXVsdCB0byAwIHRvIHJlbWFpbiBjb21wYXRpYmxlIHdpdGggb2xkZXIgRFQgYmluZGluZ3Mu
CiAJCSAqLwogCQlyY2R1LT5jcnRjc1tpXS52c3AgPSAmcmNkdS0+dnNwc1tqXTsKIAkJcmNkdS0+
Y3J0Y3NbaV0udnNwX3BpcGUgPSBjZWxscyA+PSAxID8gYXJncy5hcmdzWzBdIDogMDsKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
