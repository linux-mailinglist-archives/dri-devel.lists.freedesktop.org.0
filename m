Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA10F531B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 19:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EF26FA45;
	Fri,  8 Nov 2019 17:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D3A6FA43
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 17:59:54 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E09FA2A;
 Fri,  8 Nov 2019 18:59:53 +0100 (CET)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v10 3/4] arm64: dts: zynqmp: Add DisplayPort subsystem
Date: Fri,  8 Nov 2019 19:59:34 +0200
Message-Id: <20191108175935.29766-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108175935.29766-1-laurent.pinchart@ideasonboard.com>
References: <20191108175935.29766-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1573235993;
 bh=lAG0Ovj8pgcZUrnaJiVmLtLMdl01vgUD8Wb3jtNqdbc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BCbaD4fJl0Phxlxh/sabQ72Isiqmt/P4y2CoXNQLXuyTNrYe9PWUgWp3xEVEpjopZ
 Efs7uAhXntDltb9DRUt/NoEeZHNRKWcRwYd08CHBj618NIgTTC3L2Y+OuNyM01L2Mz
 1+fsVxPgi4poDvMRd0GP+tCx+PM0Wd/x31/KU3N4=
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
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQpDaGFu
Z2VzIHNpbmNlIHY5OgoKLSBVcGRhdGUgdG8gdGhlIGxhdGVzdCBEUERNQSBEVCBiaW5kaW5ncwot
LS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC1jbGsuZHRzaSB8ICA0ICsrKysK
IGFyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC5kdHNpICAgICB8IDIyICsrKysrKysr
KysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC1jbGsuZHRzaSBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC1jbGsuZHRzaQppbmRleCAyMmI0YmNlNjQzMWYu
LmJjM2Q1MjE5ZTViNCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlu
cW1wLWNsay5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC1jbGsu
ZHRzaQpAQCAtODQsNiArODQsMTAgQEAKIAljbG9ja3MgPSA8JmRwZG1hX2Nsaz47CiB9OwogCism
ZHBzdWIgeworCWNsb2NrcyA9IDwmZHBfYWNsaz4sIDwmZHBfYXVkX2Nsaz4sIDwmZHJtX2Nsb2Nr
PjsKK307CisKICZmcGRfZG1hX2NoYW4xIHsKIAljbG9ja3MgPSA8JmNsazYwMD4sIDwmY2xrMTAw
PjsKIH07CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAuZHRz
aSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC5kdHNpCmluZGV4IDRjNTg4ODg3
Mzk1OS4uMjMxYzRjZTRlMTJmIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlu
eC96eW5xbXAuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAuZHRz
aQpAQCAtMTIsNiArMTIsNyBAQAogICogdGhlIExpY2Vuc2UsIG9yIChhdCB5b3VyIG9wdGlvbikg
YW55IGxhdGVyIHZlcnNpb24uCiAgKi8KIAorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2RtYS94bG54
LXp5bnFtcC1kcGRtYS5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L3hsbngtenlucW1w
LXJlc2V0cy5oPgogCiAvIHsKQEAgLTM4Niw2ICszODcsMjcgQEAKIAkJCWludGVycnVwdHMgPSA8
MCAxMTIgND47CiAJCX07CiAKKwkJZHBzdWI6IGRpc3BsYXlAZmQ0YTAwMDAgeworCQkJY29tcGF0
aWJsZSA9ICJ4bG54LHp5bnFtcC1kcHN1Yi0xLjciOworCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
KwkJCXJlZyA9IDwweDAgMHhmZDRhMDAwMCAweDAgMHgxMDAwPiwKKwkJCSAgICAgIDwweDAgMHhm
ZDRhYTAwMCAweDAgMHgxMDAwPiwKKwkJCSAgICAgIDwweDAgMHhmZDRhYjAwMCAweDAgMHgxMDAw
PiwKKwkJCSAgICAgIDwweDAgMHhmZDRhYzAwMCAweDAgMHgxMDAwPjsKKwkJCXJlZy1uYW1lcyA9
ICJkcCIsICJibGVuZCIsICJhdl9idWYiLCAiYXVkIjsKKwkJCWludGVycnVwdHMgPSA8MCAxMTkg
ND47CisJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+OworCisJCQljbG9jay1uYW1lcyA9ICJk
cF9hcGJfY2xrIiwgImRwX2F1ZF9jbGsiLAorCQkJCSAgICAgICJkcF92dGNfcGl4ZWxfY2xrX2lu
IjsKKworCQkJZG1hLW5hbWVzID0gInZpZDAiLCAidmlkMSIsICJ2aWQyIiwgImdmeDAiOworCQkJ
ZG1hcyA9IDwmZHBkbWEgWllOUU1QX0RQRE1BX1ZJREVPMD4sCisJCQkgICAgICAgPCZkcGRtYSBa
WU5RTVBfRFBETUFfVklERU8xPiwKKwkJCSAgICAgICA8JmRwZG1hIFpZTlFNUF9EUERNQV9WSURF
TzI+LAorCQkJICAgICAgIDwmZHBkbWEgWllOUU1QX0RQRE1BX0dSQVBISUNTPjsKKwkJfTsKKwog
CQlnZW0wOiBldGhlcm5ldEBmZjBiMDAwMCB7CiAJCQljb21wYXRpYmxlID0gImNkbnMsenlucW1w
LWdlbSIsICJjZG5zLGdlbSI7CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwotLSAKUmVnYXJkcywK
CkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
