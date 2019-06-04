Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D46534A5C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C1189A34;
	Tue,  4 Jun 2019 14:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA8C89829
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 12:53:48 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzTh/eDM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
 with ESMTPSA id i01b98v54Cra7YB
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 4 Jun 2019 14:53:36 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
 marek.belisko@gmail.com
Subject: [PATCH 1/2] drm/panel: simple: Add Sharp LQ070Y3DG3B panel support
Date: Tue,  4 Jun 2019 14:53:33 +0200
Message-Id: <9eb82ea247a8c3ab5198976d45c599375815c4c1.1559652814.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559652814.git.hns@goldelico.com>
References: <cover.1559652814.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Jun 2019 14:26:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1559652826; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=VdoUWsvZWV89sTtg0Ev9avLZKnfeDC7oajjC1QE6iiQ=;
 b=jcAwK9xie6HMNK8AN8AE8HPBfGP9kUht3CHAwfMOZ6nB+GLcmVym5YZ7ri43zQnPK2
 pDjfVwbKPu5QKHkm2iz0i7NcNdWqpejY3Wb8EbYzxyE5QtYYeOSTVsuLAIUmOs7aY40m
 3cNv+z7uncQn7nYTSHbUDlO8+S56IN1RzhYzw6M2+6csKelnCseqxnj/fUzfXy9r+tpn
 HTupPy/NsDzyCCWDMwMigLKqP3tX13Pex5YRxAJOPwjfF7Nsl3qR9ySyw1kpLxZc3yzI
 CiNsGV4PT2/Kt5YE61+rhri1FzsO15sbrbKUoCBDqS95xBCi2K6E3ufrJShK08a+BIES
 muzw==
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
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNoYW5nZSBhZGRzIHN1cHBvcnQgZm9yIHRoZSBTaGFycCBMUTA3MFkzREczQiA3LjAiIFRG
VCBMQ0QgcGFuZWwuCgpTaWduZWQtb2ZmLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdv
bGRlbGljby5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwg
MzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMwIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggNTY5YmU0ZWZk
OGQxLi41YjI3ODI5YzVhNzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKQEAg
LTIyMDQsNiArMjIwNCwzMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mgc2Ftc3Vu
Z19sdG4xNDBhdDI5XzMwMSA9IHsKIAl9LAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlIHNoYXJwX2xxMDcweTNkZzNiX21vZGUgPSB7CisJLmNsb2NrID0gMzMyNjAs
CisJLmhkaXNwbGF5ID0gODAwLAorCS5oc3luY19zdGFydCA9IDgwMCArIDY0LAorCS5oc3luY19l
bmQgPSA4MDAgKyA2NCArIDEyOCwKKwkuaHRvdGFsID0gODAwICsgNjQgKyAxMjggKyA2NCwKKwku
dmRpc3BsYXkgPSA0ODAsCisJLnZzeW5jX3N0YXJ0ID0gNDgwICsgOCwKKwkudnN5bmNfZW5kID0g
NDgwICsgOCArIDIsCisJLnZ0b3RhbCA9IDQ4MCArIDggKyAyICsgMzUsCisJLnZyZWZyZXNoID0g
NjAsCisJLmZsYWdzID0gRElTUExBWV9GTEFHU19QSVhEQVRBX1BPU0VER0UsCit9OworCitzdGF0
aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mgc2hhcnBfbHEwNzB5M2RnM2IgPSB7CisJLm1vZGVz
ID0gJnNoYXJwX2xxMDcweTNkZzNiX21vZGUsCisJLm51bV9tb2RlcyA9IDEsCisJLmJwYyA9IDgs
CisJLnNpemUgPSB7CisJCS53aWR0aCA9IDE1MiwJLyogMTUyLjRtbSAqLworCQkuaGVpZ2h0ID0g
OTEsCS8qIDkxLjRtbSAqLworCX0sCisJLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4
OF8xWDI0LAorCS5idXNfZmxhZ3MgPSBEUk1fQlVTX0ZMQUdfREVfSElHSCB8IERSTV9CVVNfRkxB
R19QSVhEQVRBX1BPU0VER0UgfAorCQkgICAgIERSTV9CVVNfRkxBR19TWU5DX0RSSVZFX1BPU0VE
R0UsCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgc2hhcnBfbHEw
MzVxN2RiMDNfbW9kZSA9IHsKIAkuY2xvY2sgPSA1NTAwLAogCS5oZGlzcGxheSA9IDI0MCwKQEAg
LTI3ODYsNiArMjgxMyw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHBsYXRm
b3JtX29mX21hdGNoW10gPSB7CiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJzaGFycCxscTAzNXE3
ZGIwMyIsCiAJCS5kYXRhID0gJnNoYXJwX2xxMDM1cTdkYjAzLAorCX0sIHsKKwkJLmNvbXBhdGli
bGUgPSAic2hhcnAsbHEwNzB5M2RnM2IiLAorCQkuZGF0YSA9ICZzaGFycF9scTA3MHkzZGczYiwK
IAl9LCB7CiAJCS5jb21wYXRpYmxlID0gInNoYXJwLGxxMTAxazFseTA0IiwKIAkJLmRhdGEgPSAm
c2hhcnBfbHExMDFrMWx5MDQsCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
