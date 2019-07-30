Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1167AA14
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332086E51D;
	Tue, 30 Jul 2019 13:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFE76E51D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:48:35 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id ACFF52151C;
 Tue, 30 Jul 2019 09:48:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 30 Jul 2019 09:48:34 -0400
X-ME-Sender: <xms:skpAXaf-AzKlyhOHJPp3bTcdQKP-3eQ5y8wALKSMOwzsYDiro-XJBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleefgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhuffvjgfkffgfgggtgfesthekredttdefjeenucfhrhhomheplfgrnhgpufgv
 sggrshhtihgrnhgpifpnthhtvgcuoehlihhnuhigsehjrghsvghgrdhnvghtqeenucfkph
 epiedtrdejuddrieefrdejheenucfrrghrrghmpehmrghilhhfrhhomheplhhinhhugies
 jhgrshgvghdrnhgvthenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:skpAXSuhBgQtUmGXyEEa73S1GqEJ-f2h_osQhOZj9aGScQ9r79EAPw>
 <xmx:skpAXWVos4zvcSXZSdyaxPWsgThWtEqoQkqJWc5p9VbzyFMQKz99bg>
 <xmx:skpAXeK8wNCjTpnkvY149f886uYHBXhzSitZ_yB11GRn5MZVuD_Z8A>
 <xmx:skpAXZZ1XFQ1pm7WlodyWra1y5gRcs5Arc2gUKq5rrGsHu8ipBzPkA>
Received: from [10.137.0.16] (softbank060071063075.bbtec.net [60.71.63.75])
 by mail.messagingengine.com (Postfix) with ESMTPA id F097480066;
 Tue, 30 Jul 2019 09:48:32 -0400 (EDT)
From: =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>
Subject: [PATCH 5/6] drm: uapi: add gdepaper uapi header
To: dri-devel@lists.freedesktop.org
In-Reply-To: <3c8fccc9-63f7-18bb-dcb5-dcd0b9e151d2@jaseg.net>
Message-ID: <0e22c86a-3998-c2fd-cb14-203df547eb5c@jaseg.net>
Date: Tue, 30 Jul 2019 22:48:31 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jaseg.net; h=
 from:subject:to:cc:in-reply-to:message-id:date:mime-version
 :content-type:content-transfer-encoding; s=fm3; bh=KSj52GsTAdLdw
 I7UgYSPIJjgaA3C1W8AG1/f615DsBY=; b=VfcLmm6mogFWW28ej/AB7ZvjWpXjD
 wHlntHH2I6m9c7tp4r6dbvj1VSMp2uZU9Ko10i4GSuOr02PgsZy7HEXIscaKOYDi
 4Un214vMGE9ZV4Xyq9NOsyHQi4wmsdKuofB+7GkgYTFVMm3E8gC04lJgNSgRWSlY
 VDXXbKY6qNh1jDRZIKgP0CAzuL49ziJCMHmm32SL6LhTrYJ4kpEK7bjWDw5DX/Bl
 DDuCS3EJ6yMVAhghyBVL7Lw/sKWf+xGGGyBKdLwD+W2becUcoZ1jbUXhbTi9ADCO
 wmu0FZ8HCAVZD+VYE5eeovATXoKI38pKj8DEuLB2m8QDwbrEEwi6zSWAQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=KSj52GsTAdLdwI7UgYSPIJjgaA3C1W8AG1/f615DsBY=; b=itK2Dnzu
 /i0aZX5YW3ubY2t86rDs10Wrt0Hz5Cz2dGsDT8v8ZvqlELFnktPcU1K3YuBBjTCY
 yLfi4MZrxoGoVUMRH/06hdkc++v5O3qk2RflwD8ywsL6LJkVa4C97YaYMF2Frsvd
 5BRTqiJUuZltCFb4x2nb2rVDoGX2cQ9gqyt1UwIhCp28E3mpqRlR1HPH2cpMskQr
 hayqKniismAxyMTKX+qbrnL/n179xWsJLi3+hp9RruE+yNac1hl5hpOOS/YS68va
 ODJ/LwP0hIlhbO3gwLmexNckNHayAeQcHqwCD7CzMU3PT+TDWm9Brb8+csizNBoY
 QvTwRYs6ahTRGg==
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
CiBpbmNsdWRlL3VhcGkvZHJtL2dkZXBhcGVyX2RybS5oIHwgNjIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvdWFwaS9kcm0vZ2RlcGFwZXJfZHJtLmgKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL3VhcGkvZHJtL2dkZXBhcGVyX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9nZGVw
YXBlcl9kcm0uaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjg0ZmY2
NDI5YmVmNQotLS0gL2Rldi9udWxsCisrKyBiL2luY2x1ZGUvdWFwaS9kcm0vZ2RlcGFwZXJfZHJt
LmgKQEAgLTAsMCArMSw2MiBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAr
IFdJVEggTGludXgtc3lzY2FsbC1ub3RlICovCisvKiBnZGVwYXBlcl9kcm0uaAorICoKKyAqIENv
cHlyaWdodCAoYykgMjAxOSBKYW4gU2ViYXN0aWFuIEfDtnR0ZQorICovCisKKyNpZm5kZWYgX1VB
UElfR0RFUEFQRVJfRFJNX0hfCisjZGVmaW5lIF9VQVBJX0dERVBBUEVSX0RSTV9IXworCisjaW5j
bHVkZSAiZHJtLmgiCisKKyNpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKQorZXh0ZXJuICJDIiB7Cisj
ZW5kaWYKKworZW51bSBkcm1fZ2RlcGFwZXJfdmdobF9sdiB7CisJRFJNX0dERVBfUFdSX1ZHSExf
MTZWID0gMCwKKwlEUk1fR0RFUF9QV1JfVkdITF8xNVYgPSAxLAorCURSTV9HREVQX1BXUl9WR0hM
XzE0ViA9IDIsCisJRFJNX0dERVBfUFdSX1ZHSExfMTNWID0gMywKK307CisKK3N0cnVjdCBnZGVw
YXBlcl9yZWZyZXNoX3BhcmFtcyB7CisJZW51bSBkcm1fZ2RlcGFwZXJfdmdobF9sdiB2Z19sdjsg
LyogZ2F0ZSB2b2x0YWdlIGxldmVsICovCisJX191MzIgdmNvbV9zZWw7IC8qIFZDT00gc2VsZWN0
IGJpdCBhY2NvcmRpbmcgdG8gZGF0YXNoZWV0ICovCisJX19zMzIgdmRoX2J3X212OyAvKiBkcml2
ZSBoaWdoIGxldmVsLCBiL3cgcGl4ZWwgKG1WKSAqLworCV9fczMyIHZkaF9jb2xfbXY7IC8qIGRy
aXZlIGhpZ2ggbGV2ZWwsIHJlZC95ZWxsb3cgcGl4ZWwgKG1WKSAqLworCV9fczMyIHZkbF9tdjsg
LyogZHJpdmUgbG93IGxldmVsIChtVikgKi8KKwlfX3MzMiB2Y29tX2RjX212OworCV9fdTMyIHZj
b21fZGF0YV9pdmxfaHN5bmM7IC8qIGRhdGEgaXZsIGxlbiBpbiBoc3luYyBwZXJpb2RzICovCisJ
X191MzIgYm9yZGVyX2RhdGFfc2VsOyAvKiAidmJkIiBpbiBkYXRhc2hlZXQgKi8KKwlfX3UzMiBk
YXRhX3BvbGFyaXR5OyAvKiAiZGR4IiBpbiBkYXRhc2hlZXQgKi8KKwlfX3UzMiB1c2Vfb3RwX2x1
dHNfZmxhZzsgLyogVXNlIE9UUCBMVVRzICovCisJX191OCBsdXRfdmNvbV9kY1s0NF07CisJX191
OCBsdXRfd3dbNDJdOworCV9fdTggbHV0X2J3WzQyXTsKKwlfX3U4IGx1dF9iYls0Ml07CisJX191
OCBsdXRfd2JbNDJdOworfTsKKworLyogRm9yY2UgYSBmdWxsIGRpc3BsYXkgcmVmcmVzaCAqLwor
I2RlZmluZSBEUk1fR0RFUEFQRVJfRk9SQ0VfRlVMTF9SRUZSRVNICQkweDAwCisjZGVmaW5lIERS
TV9HREVQQVBFUl9HRVRfUkVGUkVTSF9QQVJBTVMJCTB4MDEKKyNkZWZpbmUgRFJNX0dERVBBUEVS
X1NFVF9SRUZSRVNIX1BBUkFNUwkJMHgwMgorI2RlZmluZSBEUk1fR0RFUEFQRVJfU0VUX1BBUlRJ
QUxfVVBEQVRFX0VOCTB4MDMKKworI2RlZmluZSBEUk1fSU9DVExfR0RFUEFQRVJfRk9SQ0VfRlVM
TF9SRUZSRVNIIFwKKwlEUk1fSU8oRFJNX0NPTU1BTkRfQkFTRSArIERSTV9HREVQQVBFUl9GT1JD
RV9GVUxMX1JFRlJFU0gpCisjZGVmaW5lIERSTV9JT0NUTF9HREVQQVBFUl9HRVRfUkVGUkVTSF9Q
QVJBTVMgXAorCURSTV9JT1IoRFJNX0NPTU1BTkRfQkFTRSArIERSTV9HREVQQVBFUl9HRVRfUkVG
UkVTSF9QQVJBTVMsIFwKKwlzdHJ1Y3QgZ2RlcGFwZXJfcmVmcmVzaF9wYXJhbXMpCisjZGVmaW5l
IERSTV9JT0NUTF9HREVQQVBFUl9TRVRfUkVGUkVTSF9QQVJBTVMgXAorCURSTV9JT1IoRFJNX0NP
TU1BTkRfQkFTRSArIERSTV9HREVQQVBFUl9TRVRfUkVGUkVTSF9QQVJBTVMsIFwKKwlzdHJ1Y3Qg
Z2RlcGFwZXJfcmVmcmVzaF9wYXJhbXMpCisjZGVmaW5lIERSTV9JT0NUTF9HREVQQVBFUl9TRVRf
UEFSVElBTF9VUERBVEVfRU4gXAorCURSTV9JT1IoRFJNX0NPTU1BTkRfQkFTRSArIERSTV9HREVQ
QVBFUl9TRVRfUEFSVElBTF9VUERBVEVfRU4sIF9fdTMyKQorCisjaWYgZGVmaW5lZChfX2NwbHVz
cGx1cykKK30KKyNlbmRpZgorCisjZW5kaWYgLyogX1VBUElfR0RFUEFQRVJfRFJNX0hfICovCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
