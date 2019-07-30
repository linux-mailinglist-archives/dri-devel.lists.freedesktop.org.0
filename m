Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD1A7AA0F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F120B88A28;
	Tue, 30 Jul 2019 13:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0681288A28
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:48:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C16B2177A;
 Tue, 30 Jul 2019 09:48:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 30 Jul 2019 09:48:24 -0400
X-ME-Sender: <xms:qEpAXdvi05Io_APVa_6oMV0raCgdYCyMH7qGc5emQqKJdO_BbIJKuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleefgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhuffvjgfkffgfgggtgfesthekredttdefjeenucfhrhhomheplfgrnhgpufgv
 sggrshhtihgrnhgpifpnthhtvgcuoehlihhnuhigsehjrghsvghgrdhnvghtqeenucfkph
 epiedtrdejuddrieefrdejheenucfrrghrrghmpehmrghilhhfrhhomheplhhinhhugies
 jhgrshgvghdrnhgvthenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:qEpAXVv66EwFVV29N4Z5vYGZ4iPnEbtZ1nNrAH_94tDuOMU9d1sF4w>
 <xmx:qEpAXc_vZASqWIwdc7xPMwblRyf0HeRg8S1LyoO7Jxt6mS1UeA7c2A>
 <xmx:qEpAXe9NM7_ymzrBZuNvDxPMz27V9lrmPImmTcHTxUsVRtOe3l5rSQ>
 <xmx:qEpAXXLPotCd2Mc0YPclUxknmovUHiQGwUUpuPHEZgJpMvTMprTPKQ>
Received: from [10.137.0.16] (softbank060071063075.bbtec.net [60.71.63.75])
 by mail.messagingengine.com (Postfix) with ESMTPA id DE2528005B;
 Tue, 30 Jul 2019 09:48:22 -0400 (EDT)
From: =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>
Subject: [PATCH 3/6] dt-bindings: add good display epaper header
To: dri-devel@lists.freedesktop.org
In-Reply-To: <3c8fccc9-63f7-18bb-dcb5-dcd0b9e151d2@jaseg.net>
Message-ID: <889ecf62-0bc6-2ad3-d673-22c8937646a1@jaseg.net>
Date: Tue, 30 Jul 2019 22:48:20 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jaseg.net; h=
 from:subject:to:cc:in-reply-to:message-id:date:mime-version
 :content-type:content-transfer-encoding; s=fm3; bh=32XiqIKnXoUaA
 By8jcbwir7KFpCAvJnhxbDxZJ1lPcA=; b=ViiQmKfhRYLiR3L1q3fwmnqK2qkbm
 sM7bKfzs4mYWu6JM/0ERAl9tLjfXIpQOwiALCzaHEu1QJWy7ZxohmRaQyFP58Ygq
 PziKP3DhiNaMyupgmuNAKbpgDKwYw9++J5rJTtTYDqQIQrFDy/MiaWXBkH5xuXb7
 M1NCVH1hFU0tiarySNQC58LyjrNm31N5ypnBJy7BWGNc5nCCNrHewuGz75n82hkN
 2mqWQ4ulrPpwuK3y32fC2XvPpHFAyXycZTk6Vobqy+/VE8YWxN8ZcUTQOJrL5cf6
 Dwl6cGOUw33aK9fuR3+84zNQJc2QLioFKeIcwodOHYswtDjqOEvYR0cfQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=32XiqIKnXoUaABy8jcbwir7KFpCAvJnhxbDxZJ1lPcA=; b=nGNXwBnw
 s+VDHFL2hMCYX0Qeyko2FWwBIRboJrLWVhsB0UsuRu5D79pA6Wce1NkWkqC29fcQ
 3n0sei+9JDIWhO7G5FwJ1u9AXbIq2gkGcIptNhJTOiG9sh9kRlgCF420owaxCfMI
 ni03FEl53TcFYzHvxx+YogOwqfTPKuXmlTh1vbjFTxRNx4awzfKPSHb6Oyu4siMx
 pFTd+iC5Uxpl4HgIGOJrfy8nsJEupf+aqgYTE1ovCdCaTPTPoDp2LuDKzICj1WOm
 fBEBZyIECthVuBK8RWQArrlfw79whdFkDdgkC6JRX5w4yUYiBhoqxZwXtkUsMTdD
 6/XA1U4h81iAgA==
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
CiBpbmNsdWRlL2R0LWJpbmRpbmdzL2Rpc3BsYXkvZ2RlcGFwZXIuaCB8IDI4ICsrKysrKysrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvZGlzcGxheS9nZGVwYXBlci5oCgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9kaXNwbGF5L2dkZXBhcGVyLmggYi9pbmNsdWRl
L2R0LWJpbmRpbmdzL2Rpc3BsYXkvZ2RlcGFwZXIuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwMDAuLjkyOWIwYmVkYTEzYwotLS0gL2Rldi9udWxsCisrKyBiL2luY2x1ZGUv
ZHQtYmluZGluZ3MvZGlzcGxheS9nZGVwYXBlci5oCkBAIC0wLDAgKzEsMjggQEAKKy8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8KKy8qCisgKiBUaGlzIGhlYWRlciBw
cm92aWRlcyBjb25zdGFudHMgZm9yIEdvb2QgRGlzcGxheSBlcGFwZXIgZGlzcGxheXMKKyAqCisg
KiBDb3B5cmlnaHQgMjAxOSBKYW4gU2ViYXN0aWFuIEdvZXR0ZQorICovCisKK2VudW0gZ2RlcGFw
ZXJfY29udHJvbGxlcl9yZXMgeworCUdERVBfQ1RSTF9SRVNfMzIwWDMwMCA9IDAsCisJR0RFUF9D
VFJMX1JFU18zMDBYMjAwID0gMSwKKwlHREVQX0NUUkxfUkVTXzI5NlgxNjAgPSAyLAorCUdERVBf
Q1RSTF9SRVNfMjk2WDEyOCA9IDMsCit9OworCitlbnVtIGdkZXBhcGVyX2NvbG9yX3R5cGUgewor
CUdERVBBUEVSX0NPTF9CVyA9IDAsCisJR0RFUEFQRVJfQ09MX0JXX1JFRCwKKwlHREVQQVBFUl9D
T0xfQldfWUVMTE9XLAorCUdERVBBUEVSX0NPTF9FTkQKK307CisKK2VudW0gZ2RlcGFwZXJfdmdo
bF9sdiB7CisJR0RFUF9QV1JfVkdITF8xNlYgPSAwLAorCUdERVBfUFdSX1ZHSExfMTVWID0gMSwK
KwlHREVQX1BXUl9WR0hMXzE0ViA9IDIsCisJR0RFUF9QV1JfVkdITF8xM1YgPSAzLAorfTsKKwot
LSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
