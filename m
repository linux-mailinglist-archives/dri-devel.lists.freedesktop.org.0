Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B918EDDB9B
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F67189CAD;
	Sun, 20 Oct 2019 00:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3096EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:46:47 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
 with ESMTPSA id R0b2a8v9IIkWDLC
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 18 Oct 2019 20:46:32 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>
Subject: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
Date: Fri, 18 Oct 2019 20:46:24 +0200
Message-Id: <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571424390.git.hns@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1571424405; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=iSkqypEOIXqjPnMech7nom91pT488acblcWrfraIbHk=;
 b=S0o92dELx2JgxFuyzeVh4CxkHCK9MH4nmJHazpFBFpyxbZgjw45vgz9OO8VjaoQRYZ
 +gdEiARB4Ap4nmj8j/vjgPnTUMJFtBgjzFNx2TLJAw6rEVI0ixzSjLybJYWRov/QT4/L
 Eqrhg3MGuh+F/ZQZJ81SIKhN6ScAAEa79msI47aQwfAC1QibK7tZPev3HD2JoYgU0x+o
 fx47VXXZ5eRgTyj6EFnVZzgZmIF5ALWqoaWPTPPu2TQF3cu+EaFp9bdPW1tqhT610nq5
 VqM63+I0Oco5ZIEpD5z8L4SEut2qrG+jHHs/NPY/ANXFomndLWcCq1Oz5OpFo78Ej710
 GL5A==
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEltYWdpbmF0aW9uIFBWUi9TR1ggR1BVIGlzIHBhcnQgb2Ygc2V2ZXJhbCBTb0MgZnJvbQpt
dWx0aXBsZSB2ZW5kb3JzLCBlLmcuIFRJIE9NQVAsIEluZ2VuaWMgSlo0NzgwLCBJbnRlbCBQb3Vs
c2JvCmFuZCBvdGhlcnMuCgpIZXJlIHdlIGRlc2NyaWJlIGhvdyB0aGUgU0dYIHByb2Nlc3NvciBp
cyBpbnRlcmZhY2VkIHRvCnRoZSBTb0MgKHJlZ2lzdGVycywgaW50ZXJydXB0IGV0Yy4pLgoKQ2xv
Y2ssIFJlc2V0IGFuZCBwb3dlciBtYW5hZ2VtZW50IHNob3VsZCBiZSBoYW5kbGVkCmJ5IHRoZSBw
YXJlbnQgbm9kZS4KClNpZ25lZC1vZmYtYnk6IEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29s
ZGVsaWNvLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHB2cnNneC50
eHQgICAgfCA3NiArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNzYgaW5zZXJ0
aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ncHUvaW1nLHB2cnNneC50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwdnJzZ3gudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2dwdS9pbWcscHZyc2d4LnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwMDAuLjRhZDg3YzA3NTc5MQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHB2cnNneC50eHQKQEAgLTAsMCArMSw3
NiBAQAorSW1hZ2luYXRpb24gUFZSL1NHWCBHUFUKKworT25seSB0aGUgSW1hZ2luYXRpb24gU0dY
NTMwLCBTR1g1NDAgYW5kIFNHWDU0NCBHUFVzIGFyZSBjdXJyZW50bHkgY292ZXJlZCBieSB0aGlz
IGJpbmRpbmcuCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBhdGlibGU6CVNob3VsZCBi
ZSBvbmUgb2YKKwkJImltZyxzZ3g1MzAtMTIxIiwgImltZyxzZ3g1MzAiLCAidGksb21hcC1vbWFw
My1zZ3g1MzAtMTIxIjsKKwkJICAtIEJlYWdsZUJvYXJkIEFCQywgT3BlblBhbmRvcmEgNjAwTUh6
CisJCSJpbWcsc2d4NTMwLTEyNSIsICJpbWcsc2d4NTMwIiwgInRpLG9tYXAtb21hcDMtc2d4NTMw
LTEyNSI7CisJCSAgLSBCZWFnbGVCb2FyZCBYTSwgR1RBMDQsIE9wZW5QYW5kb3JhIDFHSHoKKwkJ
ImltZyxzZ3g1MzAtMTI1IiwgImltZyxzZ3g1MzAiLCAidGksb21hcC1hbTM1MTctc2d4NTMwLTEy
NSI7CisJCSJpbWcsc2d4NTMwLTEyNSIsICJpbWcsc2d4NTMwIiwgInRpLG9tYXAtYW0zMzV4LXNn
eDUzMC0xMjUiOworCQkgIC0gQmVhZ2xlQm9uZSBCbGFjaworCQkiaW1nLHNneDU0MC0xMjAiLCAi
aW1nLHNneDU0MCIsICJ0aSxvbWFwLW9tYXA0LXNneDU0MC0xMjAiOworCQkgIC0gUGFuZGFib2Fy
ZCAoRVMpCisJCSJpbWcsc2d4NTQ0LTExMiIsICJpbWcsc2d4NTQ0IiwgInRpLG9tYXAtb21hcDQt
c2d4NTQ0LTExMiI7CisJCSJpbWcsc2d4NTQ0LTExNiIsICJpbWcsc2d4NTQ0IiwgInRpLG9tYXAt
b21hcDUtc2d4NTQ0LTExNiI7CisJCSAgLSBPTUFQNSBVRVZNLCBQeXJhIEhhbmRoZWxkCisJCSJp
bWcsc2d4NTQ0LTExNiIsICJpbWcsc2d4NTQ0IiwgInRpLG9tYXAtZHJhNy1zZ3g1NDQtMTE2IjsK
KworCQlGb3IgZnVydGhlciBzdHVkeToKKwkJCSJ0aSxvbWFwLWFtMzUxNy1zZ3g1MzAtPyIKKwkJ
CSJ0aSxvbWFwLWFtNDN4eC1zZ3g1MzAtPyIKKwkJCSJ0aSx0aTQzeHgtc2d4IgorCQkJInRpLHRp
ODF4eC1zZ3giCisJCQkiaW1nLGp6NDc4MC1zZ3g1Pz8tPyIKKwkJCSJpbnRlbCxwb3Vsc2JvLXNn
eD8iCisJCQkiaW50ZWwsY2VkYXJ2aWV3LXNneD8iCisJCQkic3VueGksc2d4LTU0NC0/IiAtIEJh
bmFuYS1QaS1NMyAoQWxsd2lubmVyIEE4M1QpCisKKwkJVGhlICJ0aSxvbWFwLi4uIiBlbnRyaWVz
IGFyZSBuZWVkZWQgdGVtcG9yYXJpbHkgdG8gaGFuZGxlIFNvQworCQlzcGVjaWZpYyBidWlsZHMg
b2YgdGhlIGtlcm5lbCBtb2R1bGUuCisKKwkJSW4gdGhlIGxvbmcgcnVuLCBvbmx5IHRoZSAiaW1n
LHNneC4uLiIgZW50cnkgc2hvdWxkIHN1ZmZpY2UKKwkJdG8gbWF0Y2ggYSBnZW5lcmljIGRyaXZl
ciBmb3IgYWxsIGFyY2hpdGVjdHVyZXMgYW5kIGRyaXZlcgorCQljb2RlIGNhbiBkeW5hbWljYWxs
eSBmaW5kIG91dCBvbiB3aGljaCBTb0MgaXQgaXMgcnVubmluZy4KKworCistIHJlZzoJCVBoeXNp
Y2FsIGJhc2UgYWRkcmVzc2VzIGFuZCBsZW5ndGhzIG9mIHRoZSByZWdpc3RlciBhcmVhcy4KKy0g
cmVnLW5hbWVzOglOYW1lcyBmb3IgdGhlIHJlZ2lzdGVyIGFyZWFzLgorLSBpbnRlcnJ1cHRzOglU
aGUgaW50ZXJydXB0IG51bWJlcnMuCisKK09wdGlvbmFsIHByb3BlcnRpZXM6CistIHRpbWVyOgl0
aGUgdGltZXIgdG8gYmUgdXNlZCBieSB0aGUgZHJpdmVyLgorLSBpbWcsY29yZXM6CW51bWJlciBv
ZiBjb3Jlcy4gRGVmYXVsdHMgdG8gPDE+LgorCisvIHsKKwlvY3AgeworCQlzZ3hfbW9kdWxlOiB0
YXJnZXQtbW9kdWxlQDU2MDAwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAidGksc3lzYy1vbWFwNCIs
ICJ0aSxzeXNjIjsKKwkJCXJlZyA9IDwweDU2MDBmZTAwIDB4ND4sCisJCQkgICAgICA8MHg1NjAw
ZmUxMCAweDQ+OworCQkJcmVnLW5hbWVzID0gInJldiIsICJzeXNjIjsKKwkJCXRpLHN5c2MtbWlk
bGUgPSA8U1lTQ19JRExFX0ZPUkNFPiwKKwkJCQkJPFNZU0NfSURMRV9OTz4sCisJCQkJCTxTWVND
X0lETEVfU01BUlQ+OworCQkJdGksc3lzYy1zaWRsZSA9IDxTWVNDX0lETEVfRk9SQ0U+LAorCQkJ
CQk8U1lTQ19JRExFX05PPiwKKwkJCQkJPFNZU0NfSURMRV9TTUFSVD47CisJCQljbG9ja3MgPSA8
JmdwdV9jbGtjdHJsIE9NQVA1X0dQVV9DTEtDVFJMIDA+OworCQkJY2xvY2stbmFtZXMgPSAiZmNr
IjsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUtY2VsbHMgPSA8MT47CisJCQly
YW5nZXMgPSA8MCAweDU2MDAwMDAwIDB4MjAwMDAwMD47CisKKwkJCXNneEBmZTAwIHsKKwkJCQlj
b21wYXRpYmxlID0gImltZyxzZ3g1NDQtMTE2IiwgImltZyxzZ3g1NDQiLCAidGksb21hcC1vbWFw
NS1zZ3g1NDQtMTE2IjsKKwkJCQlyZWcgPSA8MHhmZTAwIDB4MjAwPjsKKwkJCQlyZWctbmFtZXMg
PSAic2d4IjsKKwkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjEgSVJRX1RZUEVfTEVWRUxfSElH
SD47CisJCQkJdGltZXIgPSA8JnRpbWVyMTE+OworCQkJCWltZyxjb3JlcyA9IDwyPjsKKwkJCX07
CisJCX07CisJfTsKK307Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
