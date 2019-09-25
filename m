Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3150CBE946
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 01:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABA86ED22;
	Wed, 25 Sep 2019 23:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DEB6ED22
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 23:56:05 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8E50B25;
 Thu, 26 Sep 2019 01:56:02 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 3/4] arm64: dts: zynqmp: Add DisplayPort subsystem
Date: Thu, 26 Sep 2019 02:55:43 +0300
Message-Id: <20190925235544.11524-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925235544.11524-1-laurent.pinchart@ideasonboard.com>
References: <20190925235544.11524-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1569455763;
 bh=raoFb3UTwuldYZsVW+WIX96LWp40q5FvB29KcOc3J9U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wt2o4C1hQfQy3ZR0YaMHwI5Poj5u2WRSg156yloMv6hz0+KhqhElq0acWnpKfAIq2
 iokfzhFRTRqiQfdjIVq4oRq1eAUmWXmX/q5T2TUJsc4NpaBzq3iP9aco5p37MShizS
 dXOFqpctjrgfld/0450QTXjEk942JxkeQt8b4jAo=
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
Cc: Michal Simek <michal.simek@xilinx.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgRFQgbm9kZSBmb3IgdGhlIERpc3BsYXlQb3J0IHN1YnN5c3RlbSwgYSBoYXJkIElQIHBy
ZXNlbnQgaW4gdGhlClp5bnEgVWx0cmFzY2FsZSsgTVBTb0MuCgpTaWduZWQtb2ZmLWJ5OiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQogYXJj
aC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1wLWNsay5kdHNpIHwgIDQgKysrKwogYXJjaC9h
cm02NC9ib290L2R0cy94aWxpbngvenlucW1wLmR0c2kgICAgIHwgMjEgKysrKysrKysrKysrKysr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtY2xrLmR0c2kgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3hpbGlueC96eW5xbXAtY2xrLmR0c2kKaW5kZXggMjJiNGJjZTY0MzFmLi5iYzNkNTIx
OWU1YjQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC1jbGsu
ZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtY2xrLmR0c2kKQEAg
LTg0LDYgKzg0LDEwIEBACiAJY2xvY2tzID0gPCZkcGRtYV9jbGs+OwogfTsKIAorJmRwc3ViIHsK
KwljbG9ja3MgPSA8JmRwX2FjbGs+LCA8JmRwX2F1ZF9jbGs+LCA8JmRybV9jbG9jaz47Cit9Owor
CiAmZnBkX2RtYV9jaGFuMSB7CiAJY2xvY2tzID0gPCZjbGs2MDA+LCA8JmNsazEwMD47CiB9Owpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1wLmR0c2kgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAuZHRzaQppbmRleCA3NjYzODlkZGY5N2YuLjM1
ZDMxMDMzN2FmZSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1w
LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1wLmR0c2kKQEAgLTQw
Nyw2ICs0MDcsMjcgQEAKIAkJCWludGVycnVwdHMgPSA8MCAxMTIgND47CiAJCX07CiAKKwkJZHBz
dWI6IGRpc3BsYXlAZmQ0YTAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJ4bG54LHp5bnFtcC1kcHN1
Yi0xLjciOworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJCXJlZyA9IDwweDAgMHhmZDRhMDAw
MCAweDAgMHgxMDAwPiwKKwkJCSAgICAgIDwweDAgMHhmZDRhYTAwMCAweDAgMHgxMDAwPiwKKwkJ
CSAgICAgIDwweDAgMHhmZDRhYjAwMCAweDAgMHgxMDAwPiwKKwkJCSAgICAgIDwweDAgMHhmZDRh
YzAwMCAweDAgMHgxMDAwPjsKKwkJCXJlZy1uYW1lcyA9ICJkcCIsICJibGVuZCIsICJhdl9idWYi
LCAiYXVkIjsKKwkJCWludGVycnVwdHMgPSA8MCAxMTkgND47CisJCQlpbnRlcnJ1cHQtcGFyZW50
ID0gPCZnaWM+OworCisJCQljbG9jay1uYW1lcyA9ICJkcF9hcGJfY2xrIiwgImRwX2F1ZF9jbGsi
LAorCQkJCSAgICAgICJkcF92dGNfcGl4ZWxfY2xrX2luIjsKKworCQkJZG1hLW5hbWVzID0gInZp
ZDAiLCAidmlkMSIsICJ2aWQyIiwgImdmeDAiOworCQkJZG1hcyA9IDwmZHBkbWEgMD4sCisJCQkg
ICAgICAgPCZkcGRtYSAxPiwKKwkJCSAgICAgICA8JmRwZG1hIDI+LAorCQkJICAgICAgIDwmZHBk
bWEgMz47CisJCX07CisKIAkJZ2VtMDogZXRoZXJuZXRAZmYwYjAwMDAgewogCQkJY29tcGF0aWJs
ZSA9ICJjZG5zLHp5bnFtcC1nZW0iLCAiY2RucyxnZW0iOwogCQkJc3RhdHVzID0gImRpc2FibGVk
IjsKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
