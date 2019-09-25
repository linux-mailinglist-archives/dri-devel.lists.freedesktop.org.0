Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EABBE948
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 01:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AA86ECCE;
	Wed, 25 Sep 2019 23:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9023F6E069
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 23:56:06 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AD5BB87;
 Thu, 26 Sep 2019 01:56:03 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 4/4] arm64: dts: zynqmp: zcu106-revA: Wire up the
 DisplayPort subsystem
Date: Thu, 26 Sep 2019 02:55:44 +0300
Message-Id: <20190925235544.11524-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925235544.11524-1-laurent.pinchart@ideasonboard.com>
References: <20190925235544.11524-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1569455763;
 bh=u+oW4yiCqx/jIsBZyBV1J8eTu+D9N9LA6n64ulvhXIs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MpHdspnKb/JF+Ij7KgCiT1r8Xt6OOgjFwQqJXBC7tFm4QXOjQTFI30p75XxJ2sdrr
 riFfZK/mdpULPopCPR1UHZN9rPz1h3qFnaVPbpCd7ld5LJZIj5DBWTcSqDf/d1QtDE
 vq0Lw4iPJnoNmCAcnTuwtkoXUw8RWt3/iczfJy70=
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

RW5hYmxlIHRoZSBkcHN1YiBkZXZpY2UgYW5kIHdpcmUgaXQgdXAgdG8gdGhlIFBTLUdUUiBQSFkg
bGFuZXMgcm91dGVkIHRvCnRoZSBEaXNwbGF5UG9ydCBjb25uZWN0b3IuCgpTaWduZWQtb2ZmLWJ5
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0t
LQogLi4uL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtemN1MTA2LXJldkEuZHRzIHwgMTYg
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtemN1MTA2LXJldkEuZHRz
IGIvYXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1wLXpjdTEwNi1yZXZBLmR0cwppbmRl
eCA5M2NlN2ViODE0OTguLjQ2NTZmMjViNmIwNCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy94aWxpbngvenlucW1wLXpjdTEwNi1yZXZBLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3hpbGlueC96eW5xbXAtemN1MTA2LXJldkEuZHRzCkBAIC0xMyw2ICsxMyw3IEBACiAjaW5j
bHVkZSAienlucW1wLWNsay5kdHNpIgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lucHV0L2lucHV0
Lmg+CiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+CisjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvcGh5L3BoeS5oPgogCiAvIHsKIAltb2RlbCA9ICJaeW5xTVAgWkNVMTA2IFJldkEiOwpA
QCAtNjksNiArNzAsMTcgQEAKIAlzdGF0dXMgPSAib2theSI7CiB9OwogCismZHBkbWEgeworCXN0
YXR1cyA9ICJva2F5IjsKK307CisKKyZkcHN1YiB7CisJc3RhdHVzID0gIm9rYXkiOworCXBoeS1u
YW1lcyA9ICJkcC1waHkwIiwgImRwLXBoeTEiOworCXBoeXMgPSA8JmxhbmUxIFBIWV9UWVBFX0RQ
IDAgMyAyNzAwMDAwMD4sCisJICAgICAgIDwmbGFuZTAgUEhZX1RZUEVfRFAgMSAzIDI3MDAwMDAw
PjsKK307CisKIC8qIGZwZF9kbWEgY2xrIDY2N01IeiwgbHBkX2RtYSA1MDBNSHogKi8KICZmcGRf
ZG1hX2NoYW4xIHsKIAlzdGF0dXMgPSAib2theSI7CkBAIC01MDMsNiArNTE1LDEwIEBACiAJbm8t
MS04LXY7CiB9OwogCismc2VyZGVzIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAmdWFydDAg
ewogCXN0YXR1cyA9ICJva2F5IjsKIH07Ci0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
