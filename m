Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA667AA0D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4506E51A;
	Tue, 30 Jul 2019 13:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6352C6E51A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:48:14 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D8EE2177A;
 Tue, 30 Jul 2019 09:48:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 30 Jul 2019 09:48:13 -0400
X-ME-Sender: <xms:nUpAXTvQYK6YMIB7uevrFdWJ2VvfvgkfDhiNIm1OVkPQmQzK_osDFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleefgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhuffvjgfkffgfgggtgfesthekredttdefjeenucfhrhhomheplfgrnhgpufgv
 sggrshhtihgrnhgpifpnthhtvgcuoehlihhnuhigsehjrghsvghgrdhnvghtqeenucfkph
 epiedtrdejuddrieefrdejheenucfrrghrrghmpehmrghilhhfrhhomheplhhinhhugies
 jhgrshgvghdrnhgvthenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:nUpAXa7Me2QnPqiZdemfqW5Luv37tL0IJOPmEGzMJ-wFf8a3JLRY9A>
 <xmx:nUpAXUQuEWF6TdyIEOHAXdD24X3XbqVzk_Z9ZtH01tYzuAN2-eqsIw>
 <xmx:nUpAXanYS-G5WQ-_ypICJU-L2mUbSsnKE8BSQ5Ggs6RktkLpDc5lCg>
 <xmx:nUpAXU3eR-E1J3LHvJqyT53iUXWdmLY77sALuYg6BPs6EA2ed2_6BA>
Received: from [10.137.0.16] (softbank060071063075.bbtec.net [60.71.63.75])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1911880061;
 Tue, 30 Jul 2019 09:48:11 -0400 (EDT)
From: =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>
Subject: [PATCH 2/6] dt-bindings: add gooddisplay vendor prefix
To: dri-devel@lists.freedesktop.org
In-Reply-To: <3c8fccc9-63f7-18bb-dcb5-dcd0b9e151d2@jaseg.net>
Message-ID: <6bab6d9d-135b-426f-738d-f5ef5bba3453@jaseg.net>
Date: Tue, 30 Jul 2019 22:48:10 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jaseg.net; h=
 from:subject:to:cc:in-reply-to:message-id:date:mime-version
 :content-type:content-transfer-encoding; s=fm3; bh=BV5udAWkY68a8
 1lrXbHWDnn+Gj2t2NQYxWIA3zsL6uE=; b=Sbq1rGrJoNq6CFknKZCn4G+tvR+fT
 G3YYv/t7RWG7DiLouptH7h6Hk9aAS3KlufHONsf2E2s7mWXccis3CxZ0C2df+rdn
 gMAw5/0up+kHOK059ph69R7KKpoxLBJsZDDM+krjnLDJeuKh45Zf2mB+fiU7TY2A
 2a/h5VsnaJfaCKQFhrz8UKYxoK3/Kq3pgZrWdLVo2I5gNYUsJLDGuO1y5QZCZiOv
 6ZRpspcuFsuboEHrEmr6822752famJWWGxkxKSlK+85T2jxLLlq6Df6edA5aQ4Am
 ZZZ7lE6oLwqowcnEof/HWbypKKFY2Wq2YH/gkkXzWsxRYnhlEUzAJ95IQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=BV5udAWkY68a81lrXbHWDnn+Gj2t2NQYxWIA3zsL6uE=; b=fy+g7haM
 v79C6qaq1t8vu0FhJUhFDCzf5altlp1xfpjygD5OKysJ5FmgB0vf68rFyU5pi2wJ
 HNBLu+o1LntrjpZ6SvmBB1Zuxr0M4AJBhHFq0qp0LX2wli7Jp2JQNruDzkPY+rJz
 yhrMUS6Kl5eQ+uhyvzDaaCEaE3FCZjLxXOvnZ5orG5bv8iM6FeoTzy6TDFjZV6U8
 k4cLHA5IiW6q0wC7ZPsYiiBp0v6QguGrTZreWjh4ZR/Uaa/+o7qlKGtCgsnxsWHu
 k5JK5P+bd9gkD9aOy9JSEHh02m6RehxoXLGaK99//zLsMtu/VHnEm1cKHHbgTNEE
 75lEz652D3brdw==
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

RGFsaWFuIEdvb2QgRGlzcGxheSBDby4sIEx0ZC4gYW1vbmcgb3RoZXJzIG1ha2VzIHRocmVlLWNv
bG9yIGVwYXBlcgpwYW5lbHMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gU2ViYXN0aWFuIEfDtnR0ZSA8
bGludXhAamFzZWcubmV0PgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92
ZW5kb3ItcHJlZml4ZXMueWFtbCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9y
LXByZWZpeGVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9y
LXByZWZpeGVzLnlhbWwKaW5kZXggMzNhNjVhNDVlMzE5Li5mYWU2ZGE2Y2Q3N2QgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFt
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVz
LnlhbWwKQEAgLTMzOSw2ICszMzksOCBAQCBwYXR0ZXJuUHJvcGVydGllczoKICAgICBkZXNjcmlw
dGlvbjogR2xvYmFsVG9wIFRlY2hub2xvZ3ksIEluYy4KICAgIl5nbXQsLioiOgogICAgIGRlc2Ny
aXB0aW9uOiBHbG9iYWwgTWl4ZWQtbW9kZSBUZWNobm9sb2d5LCBJbmMuCisgICJeZ29vZGRpc3Bs
YXksLioiOgorICAgIGRlc2NyaXB0aW9uOiBEYWxpYW4gR29vZCBEaXNwbGF5IENvLiwgTHRkLgog
ICAiXmdvb2RpeCwuKiI6CiAgICAgZGVzY3JpcHRpb246IFNoZW56aGVuIEh1aWRpbmcgVGVjaG5v
bG9neSBDby4sIEx0ZC4KICAgIl5nb29nbGUsLioiOgotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
