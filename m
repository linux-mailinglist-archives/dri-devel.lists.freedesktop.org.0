Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9BAB6CF5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 21:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEEB6FD26;
	Wed, 18 Sep 2019 19:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83476FD21
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 19:54:27 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MdeSn-1hbcGC3xB3-00ZgA4; Wed, 18 Sep 2019 21:54:22 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: hide an unused variable
Date: Wed, 18 Sep 2019 21:53:58 +0200
Message-Id: <20190918195418.2042610-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:e6RffvOmDj1nBJMeY+rrjixyu4FDdjpSMSkcA7dDa86QdgX8VAy
 vXJqdQHJ2VyuGNpIZmusNm/tmO6LSPOHGvbK29dNEXgwRjzOWBgH3zzgBys0a78d4gFJvgo
 po/+E1JWRhHgORmC1rtGZTv2ShsBdo79xTDlO7Eo10j0iqPbRuIQyj+h2JOyNBiQ1YeSiXh
 LEyb/3BeWh7FWoIm+goxQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SHiyb5ey+ic=:V8Ia1QvLm+87GxeewHaNIj
 +MQq8F2/vjHgW/LvBnX+bhxFxBSm4ML23WPlTYZ0wjJB1nIdj1VkZ0LTPaIgMCdDygijEKJmJ
 CLTRQ/9/A4fdswCadvZxgZVt38EeaHzpNJ/AnGsWJ7hSgB6qnqhXOZVxknwraLTdxbt65Ec9e
 mEdMKNYWaRiD3FisIkIq/8n8NlMTcJwRBdqJGTZDcqKQyZzVtdsdAay8FTq3IPMvyy9KHXm4V
 EVzTuO2vv+5jQHw4HMfICR9cdfGrfHzjAD9MmiiI8ZNvtHHfWw3qyhluD2f99sGP8AkxHx+6N
 FrBdNc0APae8lL9NbzPNZ752lVbZlDM5EZHCt8HLhB9TRbMtB/EMJc+37GhkZx0PQ3eZBqgUg
 blPHdXp2XrbYBkuBJ40E/KJY1End+dyZtDT9HxCxazHooVlQfE18+RFSrtsV6psQ5XDvJq6aZ
 eWDNopJAleGAhBWPw+cLhRwo1fBxC5UvpAL3D3x6fuCW/nKQaatIEc/B2pAmZ04MI6KxYgGbi
 LR6nmsfDosZobbLs3rrupbrYoXkoGi/lhtAVuIbZmgvqVhAmmr3Fi6v7IKaB2cbdHRdwhI+1u
 kfmlfOnQ/i5aK3GkNrwIJRMymQI3N5LYg1TL8DoquPj34rGvs3dZkdgSwp0n2ufKiYP0qgrqE
 N37X5BrJ4OPDim6fEiwKDnPX6DJxzeQjWp2tJoIR3Kmb/xK3o1cZer+q3b1JZHEnDO0r9gmUE
 Fb9dWjayXMttGo7QBlt7rfkpZ7Rv/b/JFwxP42F0f8GTrYtTQ56kAQ4czEeIU6hQBIoG9tYIE
 /tzOM9tFEfF88iR558bdS8BwGR5e7jslFmDy/Fq6f2DasJMIS0GYKdWUQlnv4CszXzYehBDCE
 D26Smq1Ru9yEUHCzXu/A==
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
Cc: Dingchen Zhang <dingchen.zhang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aG91dCBDT05GSUdfREVCVUdfRlMsIHdlIGdldCBhIHdhcm5pbmcgZm9yIGFuIHVudXNlZAp2
YXJpYWJsZToKCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jOjYwMjA6MzM6IGVycm9yOiB1bnVzZWQgdmFyaWFibGUgJ3NvdXJjZScgWy1X
ZXJyb3IsLVd1bnVzZWQtdmFyaWFibGVdCgpIaWRlIHRoZSB2YXJpYWJsZSBpbiBhbiAjaWZkZWYg
bGlrZSBpdHMgb25seSB1c2Vycy4KCkZpeGVzOiAxNGIyNTg0NjM2YzYgKCJkcm0vYW1kL2Rpc3Bs
YXk6IGFkZCBmdW5jdGlvbmFsaXR5IHRvIGdyYWIgRFBSWCBDUkMgZW50cmllcy4iKQpTaWduZWQt
b2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggZTFiMDliYjQzMmJkLi43NDI1MmY1N2JhZmIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YwpAQCAtNjAxNyw3ICs2MDE3LDkgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2VuYWJsZV9jcnRj
X2ludGVycnVwdHMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlzdHJ1Y3QgZHJtX2NydGMgKmNy
dGM7CiAJc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGRfY3J0Y19zdGF0ZSwgKm5ld19jcnRjX3N0
YXRlOwogCWludCBpOworI2lmZGVmIENPTkZJR19ERUJVR19GUwogCWVudW0gYW1kZ3B1X2RtX3Bp
cGVfY3JjX3NvdXJjZSBzb3VyY2U7CisjZW5kaWYKIAogCWZvcl9lYWNoX29sZG5ld19jcnRjX2lu
X3N0YXRlKHN0YXRlLCBjcnRjLCBvbGRfY3J0Y19zdGF0ZSwKIAkJCQkgICAgICBuZXdfY3J0Y19z
dGF0ZSwgaSkgewotLSAKMi4yMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
