Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E7C1089C8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BCC89F8B;
	Mon, 25 Nov 2019 08:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E1F6E10C
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 11:40:52 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH4HEaKeuIV"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vAOBeXwEa
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Sun, 24 Nov 2019 12:40:33 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v3 8/8] MIPS: DTS: jz4780: add sgx gpu node
Date: Sun, 24 Nov 2019 12:40:28 +0100
Message-Id: <c73e2cee4f818654f264b0b7b5458bfaa0ac6a7a.1574595627.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574595627.git.hns@goldelico.com>
References: <cover.1574595627.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574595651; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=11dnnmhb1p7k4nx66KvKMNZIk0qpx8gkJedgWR7HCNM=;
 b=pGD/CrX5G1L/q2A7ylGBRY4zI9Ok/6USNegXk/i9VEZ+tFubCs1E2BqSay2pKY6f7D
 QxsqUoxp26eEOB3ljBG7b4g99AIMVSePYNtAf4LQqKjqQuhDgnVdkkwao9IJcTeg0ZD8
 gqQxpjK6S6zNK6W+4pqJXJLElT2jLcENlfrVqZiM8cneLTG9uKCXoJOK+lWZKaxz7IFL
 fKTkmq2Z6Nwlag+v4CtKkp50DP5qVpufFIQvfiAJJQdUEVHxsI/vofqFKqRe5AkpGbul
 wcPeOTljnmFP31suFP9RW3Drn/eeIbfQTsUso5XCAjB0eSMxWbvEdqmBAKoNsSUYVzsD
 EUyg==
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
 "H. Nikolaus Schaller" <hns@goldelico.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Boddie <paul@boddie.org.uk>,
 kernel@pyra-handheld.com, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YW5kIGFkZCBpbnRlcnJ1cHQgYW5kIGNsb2Nrcy4KClRlc3RlZCB0byBidWlsZCBmb3IgQ0kyMCBi
b2FyZCBhbmQgbG9hZCBhIChub24td29ya2luZykgZHJpdmVyLgoKU3VnZ2VzdGVkLWJ5OiBQYXVs
IEJvZGRpZSA8cGF1bEBib2RkaWUub3JnLnVrPgpTaWduZWQtb2ZmLWJ5OiBILiBOaWtvbGF1cyBT
Y2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+Ci0tLQogYXJjaC9taXBzL2Jvb3QvZHRzL2luZ2Vu
aWMvano0NzgwLmR0c2kgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL21pcHMvYm9vdC9kdHMvaW5nZW5pYy9qejQ3ODAu
ZHRzaSBiL2FyY2gvbWlwcy9ib290L2R0cy9pbmdlbmljL2p6NDc4MC5kdHNpCmluZGV4IGM1NGJk
N2NmZWM1NS4uMjFlYTVmNGE0MDViIDEwMDY0NAotLS0gYS9hcmNoL21pcHMvYm9vdC9kdHMvaW5n
ZW5pYy9qejQ3ODAuZHRzaQorKysgYi9hcmNoL21pcHMvYm9vdC9kdHMvaW5nZW5pYy9qejQ3ODAu
ZHRzaQpAQCAtNDYsNiArNDYsMTcgQEAKIAkJI2Nsb2NrLWNlbGxzID0gPDE+OwogCX07CiAKKwln
cHU6IGdwdUAxMzA0MDAwMCB7CisJCWNvbXBhdGlibGUgPSAiaW5nZW5pYyxqejQ3ODAtc2d4NTQw
LTEyMCIsICJpbWcsc2d4NTQwLTEyMCIsICJpbWcsc2d4NTQwIiwgImltZyxzZ3g1IjsKKwkJcmVn
ID0gPDB4MTMwNDAwMDAgMHg0MDAwPjsKKworCQljbG9ja3MgPSA8JmNndSBKWjQ3ODBfQ0xLX0dQ
VT47CisJCWNsb2NrLW5hbWVzID0gImdwdSI7CisKKwkJaW50ZXJydXB0LXBhcmVudCA9IDwmaW50
Yz47CisJCWludGVycnVwdHMgPSA8NjM+OworCX07CisKIAl0Y3U6IHRpbWVyQDEwMDAyMDAwIHsK
IAkJY29tcGF0aWJsZSA9ICJpbmdlbmljLGp6NDc4MC10Y3UiLAogCQkJICAgICAiaW5nZW5pYyxq
ejQ3NzAtdGN1IiwKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
