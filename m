Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8353110E217
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2019 14:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7489C89FC8;
	Sun,  1 Dec 2019 13:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE2989FC8
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2019 13:49:41 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB1DnaHp039061;
 Sun, 1 Dec 2019 07:49:36 -0600
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB1DnaoX072759
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 1 Dec 2019 07:49:36 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 1 Dec
 2019 07:49:35 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 1 Dec 2019 07:49:35 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB1DnW5Z111790;
 Sun, 1 Dec 2019 07:49:32 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: display: ti,
 k2g-dss: Add dt-schema yaml binding
Date: Sun, 1 Dec 2019 15:49:29 +0200
Message-ID: <802bf3af8f5109b22bf615d92bca14f076d25de5.1575203210.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575203210.git.jsarha@ti.com>
References: <cover.1575203210.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575208176;
 bh=iZYF62+IqF0GWydEuUcLGVvt3vdEsHDmf+YVohUaR3U=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=AP8lqIl6gZVlrUQ6DoMEPpwMSGoPeqZqygOHYIiRPTzPG/efPL9t5BkY1Qih00++J
 WOdvoJDmxykpCgYRh4549vyGtvZvcc+1azEBejInEyIVlAU5LSnI3p4oh1H3mlovnk
 f0cJ8Fim2BYpnflv/dthsn9yMSN5fp9clIeW6DUc=
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
Cc: yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com,
 robh+dt@kernel.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, subhajit_paul@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGR0LXNjaGVtYSB5YW1sIGJpbmRpZyBmb3IgSzJHIERTUywgYW4gdWx0cmEtbGlnaHQgdmVy
c2lvbiBvZiBUSQpLZXlzdG9uZSBEaXNwbGF5IFN1YlN5c3RlbS4KClNpZ25lZC1vZmYtYnk6IEp5
cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvdGkvdGks
azJnLWRzcy55YW1sICAgICAgIHwgOTcgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDk3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS90aS90aSxrMmctZHNzLnlhbWwKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS90aS90aSxrMmctZHNz
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS90aS90aSxr
MmctZHNzLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4yZDky
ZGVhMWM0MTEKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS90aS90aSxrMmctZHNzLnlhbWwKQEAgLTAsMCArMSw5NyBAQAorIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQorIyBDb3B5cmln
aHQgMjAxOSBUZXhhcyBJbnN0cnVtZW50cyBJbmNvcnBvcmF0ZWQKKyVZQU1MIDEuMgorLS0tCisk
aWQ6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3RpL3RpLGsyZy1kc3Mu
eWFtbCMiCiskc2NoZW1hOiAiaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjIgorCit0aXRsZTogVGV4YXMgSW5zdHJ1bWVudHMgSzJHIERpc3BsYXkgU3Vic3lzdGVt
CisKK21haW50YWluZXJzOgorICAtIEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+CisgIC0gVG9t
aSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KKworZGVzY3JpcHRpb246IHwKKyAg
VGhlIEsyRyBEU1MgaXMgYW4gdWx0cmEtbGlnaHQgdmVyc2lvbiBvZiBUSSBLZXlzdG9uZSBEaXNw
bGF5CisgIFN1YlN5c3RlbS4gSXQgaGFzIG9ubHkgb25lIG91dHB1dCBwb3J0IGFuZCB2aWRlbyBw
bGFuZS4gVGhlCisgIG91dHB1dCBpcyBEUEkuCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6
CisgICAgY29uc3Q6IHRpLGsyZy1kc3MKKworICByZWc6CisgICAgbWF4SXRlbXM6IDUKKyAgICBt
aW5JdGVtczogNQorCisgIHJlZy1uYW1lczoKKyAgICBpdGVtczoKKyAgICAgIC0gY29uc3Q6IGNm
ZworICAgICAgLSBjb25zdDogY29tbW9uCisgICAgICAtIGNvbnN0OiB2aWQxCisgICAgICAtIGNv
bnN0OiBvdnIxCisgICAgICAtIGNvbnN0OiB2cDEKKworICBjbG9ja3M6CisgICAgbWF4SXRlbXM6
IDIKKyAgICBtaW5JdGVtczogMgorCisgIGNsb2NrLW5hbWVzOgorICAgIGl0ZW1zOgorICAgICAg
LSBjb25zdDogZmNrCisgICAgICAtIGNvbnN0OiB2cDEKKworICBpbnRlcnJ1cHRzOgorICAgIG1h
eEl0ZW1zOiAxCisKKyAgcG93ZXItZG9tYWluczoKKyAgICBtYXhJdGVtczogMQorICAgIGRlc2Ny
aXB0aW9uOiBwaGFuZGxlIHRvIHRoZSBhc3NvY2lhdGVkIHBvd2VyIGRvbWFpbgorCisgIHBvcnRA
MDoKKyAgICB0eXBlOiBvYmplY3QKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIFRoZSBEU1MgRFBJ
IG91dHB1dCBwb3J0IG5vZGUKKworICBtYXgtbWVtb3J5LWJhbmR3aWR0aDoKKyAgICAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBkZXNjcmlwdGlvbjoK
KyAgICAgIElucHV0IG1lbW9yeSAoZnJvbSBtYWluIG1lbW9yeSB0byBkaXNwYykgYmFuZHdpZHRo
IGxpbWl0IGluCisgICAgICBieXRlcyBwZXIgc2Vjb25kCisKK3JlcXVpcmVkOgorICAtIGNvbXBh
dGlibGUKKyAgLSByZWcKKyAgLSByZWctbmFtZXMKKyAgLSBjbG9ja3MKKyAgLSBjbG9jay1uYW1l
cworICAtIGludGVycnVwdHMKKyAgLSBwb3J0QDAKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZh
bHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAgICAgZHNzOiBkc3NAMDI1NDAwMDAgeworICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGksazJnLWRzcyI7CisgICAgICAgICAgICAgICAg
cmVnID0gICA8MHgwMjU0MDAwMCAweDQwMD4sCisgICAgICAgICAgICAgICAgICAgICAgICA8MHgw
MjU1MDAwMCAweDEwMDA+LAorICAgICAgICAgICAgICAgICAgICAgICAgPDB4MDI1NTcwMDAgMHgx
MDAwPiwKKyAgICAgICAgICAgICAgICAgICAgICAgIDwweDAyNTVhODAwIDB4MTAwPiwKKyAgICAg
ICAgICAgICAgICAgICAgICAgIDwweDAyNTVhYzAwIDB4MTAwPjsKKyAgICAgICAgICAgICAgICBy
ZWctbmFtZXMgPSAiY2ZnIiwgImNvbW1vbiIsICJ2aWQxIiwgIm92cjEiLCAidnAxIjsKKyAgICAg
ICAgICAgICAgICBjbG9ja3MgPSAgICAgICAgPCZrMmdfY2xrcyAweDIgMD4sCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwmazJnX2Nsa3MgMHgyIDE+OworICAgICAgICAgICAgICAg
IGNsb2NrLW5hbWVzID0gImZjayIsICJ2cDEiOworICAgICAgICAgICAgICAgIGludGVycnVwdHMg
PSA8R0lDX1NQSSAyNDcgSVJRX1RZUEVfRURHRV9SSVNJTkc+OworCisgICAgICAgICAgICAgICAg
cG93ZXItZG9tYWlucyA9IDwmazJnX3BkcyAweDI+OworICAgICAgICAgICAgICAgIHN0YXR1cyA9
ICJkaXNhYmxlZCI7CisKKyAgICAgICAgICAgICAgICBtYXgtbWVtb3J5LWJhbmR3aWR0aCA9IDwy
MzAwMDAwMDA+OworICAgICAgICAgICAgICAgIHBvcnQgeworICAgICAgICAgICAgICAgICAgICAg
ICAgZHBpX291dDogZW5kcG9pbnQgeworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZW1vdGUtZW5kcG9pbnQgPSA8JnNpaTkwMjJfaW4+OworICAgICAgICAgICAgICAgICAgICAgICAg
fTsKKyAgICAgICAgICAgICAgICB9OworICAgICAgICB9OwotLSAKVGV4YXMgSW5zdHJ1bWVudHMg
RmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuIFktdHVubnVzL0J1
c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
