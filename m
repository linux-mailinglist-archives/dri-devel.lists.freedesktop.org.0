Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2268E7AA13
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E1C6E523;
	Tue, 30 Jul 2019 13:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20EA6E514
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:48:30 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4332321FF5;
 Tue, 30 Jul 2019 09:48:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 30 Jul 2019 09:48:30 -0400
X-ME-Sender: <xms:rkpAXZ7qCqnOfRAmfgQR7kICuC20_bUtX3brz9dTrWhy33pLpnHL5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleefgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhuffvjgfkffgfgggtgfesthekredttdefjeenucfhrhhomheplfgrnhgpufgv
 sggrshhtihgrnhgpifpnthhtvgcuoehlihhnuhigsehjrghsvghgrdhnvghtqeenucfkph
 epiedtrdejuddrieefrdejheenucfrrghrrghmpehmrghilhhfrhhomheplhhinhhugies
 jhgrshgvghdrnhgvthenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:rkpAXSHNMqbocVeIo3B1PvqG-BEA7DaX8xxF522-lTTAdv3bKm6uKQ>
 <xmx:rkpAXflXbzTAYyoN9zbUJyrc7cldAuGzlU3f-xn8F8e1mi8tS86K7A>
 <xmx:rkpAXSbplTFFzS40jZ_U2DI4s5mzuXkRlxtAquMgM7VG2HCBU1-reg>
 <xmx:rkpAXf5p3ak2vUnAA06dsKcIObrCPJVu6OUxrOtKZ1d7rxkWq6UhoQ>
Received: from [10.137.0.16] (softbank060071063075.bbtec.net [60.71.63.75])
 by mail.messagingengine.com (Postfix) with ESMTPA id BCCF380059;
 Tue, 30 Jul 2019 09:48:28 -0400 (EDT)
From: =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>
Subject: [PATCH 4/6] dt-bindings: add gdepaper documentation
To: dri-devel@lists.freedesktop.org
In-Reply-To: <3c8fccc9-63f7-18bb-dcb5-dcd0b9e151d2@jaseg.net>
Message-ID: <5ba77164-cbb5-8c2f-5980-5dce22716329@jaseg.net>
Date: Tue, 30 Jul 2019 22:48:26 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jaseg.net; h=
 from:subject:to:cc:in-reply-to:message-id:date:mime-version
 :content-type:content-transfer-encoding; s=fm3; bh=YBZJLvOv94xbG
 cKq0AjJSs0mHgqSOiwsUSfwbFtC4lE=; b=P1bccKssVFwepyB2iWiQLtwiCTjUI
 hHuFKwYZQOfPPY5vYO70gZNaeHpfNMhJ0AxG3QCObDEP2NR9dIzqO+D1yuY/Xkm/
 TeGxTTcKoY8BOn3bBXM5IyKlqsspLjI9mGgfUjziQ9IlXolTi33EUUFkjKuTQRz/
 jO+Crg1fenKdaURSIJVdUyK9twwHAYNbJpzAAtotp+2W0YO0nhaPx0I5NxVQ6i5y
 muEaCa2hHKps9QXwCEGmUWJ9hJnAfjmqwu8OpRpPuDG02BAiuFJptk/JOgjJ1JB1
 xmf100YAnKrQrteKF7Ylj/8soLt6nxasYN6En32zS38S4Usss2UmX2FVw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=YBZJLvOv94xbGcKq0AjJSs0mHgqSOiwsUSfwbFtC4lE=; b=vCqjsyaj
 dzkYcvMzpcNQRJEmYi1aY0vmz7anGhSAww8wzW44bNpOeUht7r5h2Zq7EB3CEH1P
 EapAywOFVygOU4xphNMXoSH8ev79kCcT+mU6UZ1lspWeECTe0I7T/UF7IcyCyAZB
 XLoyC/E6kx9/Fdi1rjALwYm2TIv3Ytxi7w83yFEHcGaUB5bLZ6TC1IwbEjmPfmHa
 RnFXxL9NcFDSDCmCXIahKjeucAj/yCgzIPP9jBchJhbc/if5V63gSniTYahVhZKu
 s4sqKHz03h9j/gqnzrMctmD9HRMU2UxszzPRz2MWLxvzGDZWx4bmLynjtSFTrOu8
 LTEAJlT1hr9R2A==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogSmFuIFNlYmFzdGlhbiBHw7Z0dGUgPGxpbnV4QGphc2VnLm5ldD4KLS0t
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2dkZXBhcGVyLnR4dCAgfCAyNyArKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2dk
ZXBhcGVyLnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2dkZXBhcGVyLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2dkZXBhcGVyLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwMDAuLjdiODYzMDRkOTgyZgotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2dkZXBhcGVyLnR4dApAQCAtMCwwICsxLDI3IEBACitH
b29kIERpc3BsYXkvV2F2ZXNoYXJlIGUtaW5rIGRpc3BsYXlzCisKK1JlcXVpcmVkIHByb3BlcnRp
ZXM6CistIGNvbXBhdGlibGU6CQkiZ29vZGRpc3BsYXksd2ZpMDE5MGN6MjIiIGZvciAyLjciIGIv
dy9yZWQgZGlzcGxheXMsCisJCQlyZXBsYWNlIHBhcnQgbnVtYmVyIGZvciBvdGhlciBkaXNwbGF5
cy4KKwkJCVVzZSAiZ29vZGRpc3BsYXksZ2VuZXJpY19lcGFwZXIiIHRvIG1hbnVhbGx5IGNvbmZp
Z3VyZQorCQkJdGhlIGRpc3BsYXkncyByZXNvbHV0aW9uIGV0Yy4KKworLSBkYy1ncGlvczoJCURh
dGEgQ29tbWFuZAorLSByZXNldC1ncGlvczoJCVJlc2V0IHBpbgorLSBidXN5LWdwaW9zOgkJQnVz
eSBwaW4KKy0gc3BpLXNwZWVkLWh6CQlTUEkgYmF1ZCByYXRlIHRvIHVzZSB0byB3aGVuIHRhbGtp
bmcgdG8gdGhlIGRpc3BsYXkKKworVGhlIG5vZGUgZm9yIHRoaXMgZHJpdmVyIG11c3QgYmUgYSBj
aGlsZCBub2RlIG9mIGEgU1BJIGNvbnRyb2xsZXIsIGhlbmNlCithbGwgbWFuZGF0b3J5IHByb3Bl
cnRpZXMgZGVzY3JpYmVkIGluIC4uL3NwaS9zcGktYnVzLnR4dCBtdXN0IGJlIHNwZWNpZmllZC4K
KworRXhhbXBsZToKKworCWVwYXBlckAweworCQljb21wYXRpYmxlID0gImdvb2RkaXNwbGF5LGdk
ZXcwNDJ6MTUiOworCQlyZWcgPSA8MD47CisJCXNwaS1zcGVlZC1oeiA9IDwxMDAwMDAwPjsKKwkJ
c3BpLW1heC1mcmVxdWVuY3kgPSA8NjAwMDAwMD47CisJCWRjLWdwaW9zID0gPCZncGlvIDI1IEdQ
SU9fQUNUSVZFX0hJR0g+OworCQlyZXNldC1ncGlvcyA9IDwmZ3BpbyAxNyBHUElPX0FDVElWRV9I
SUdIPjsKKwkJYnVzeS1ncGlvcyA9IDwmZ3BpbyAyNCBHUElPX0FDVElWRV9MT1c+OworCX07Ci0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
