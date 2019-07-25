Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 448F074833
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FAC6E693;
	Thu, 25 Jul 2019 07:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8856E5D5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 01:10:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 355FE21FBC;
 Wed, 24 Jul 2019 21:10:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 24 Jul 2019 21:10:21 -0400
X-ME-Sender: <xms:egE5XeW7kZvQ9egeyjjFPGT_Jz-3NUpb2L8A72zmWRiLgAqmafE_sA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkedugdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:egE5XVFmtKPksS0mLeVK3pJ2RvFGODGVseqK6TGANCZgoLCsneqJVQ>
 <xmx:egE5XfXzjZ6F9kA-eLW9_ZC-PHaoeYesnpKn4F1US-NptTJ5WvHDWg>
 <xmx:egE5XYDE54I6zx4Fhs2E7uu7j3gLff9Nwl8ozKKchsPSAewL0xBHjQ>
 <xmx:fQE5XQp0G_y4WUSzGSGO59QkCPaZRpqRwXl2fAfSy9Z7luzJZJ4Wdw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 64D16E0129; Wed, 24 Jul 2019 21:10:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <4f6709f8-381f-415c-8569-798b074b66c5@www.fastmail.com>
In-Reply-To: <2a0c5ef5c7e20b190156908991e4c964a501d80a.camel@perches.com>
References: <cover.1562734889.git.joe@perches.com>
 <cddd7ad7e9f81dec1e86c106f04229d21fc21920.1562734889.git.joe@perches.com>
 <2a0c5ef5c7e20b190156908991e4c964a501d80a.camel@perches.com>
Date: Thu, 25 Jul 2019 10:40:32 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joe Perches" <joe@perches.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 03/12] drm: aspeed_gfx: Fix misuse of GENMASK macro
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=hT6VUAYNVIFczKSf7p2tdTIbi+IZpnd
 9IggzGcLtHyQ=; b=mVWrDOAS8HG4YyOWzxSU9uDXvpp/q9weSwMs3XphM6+9j4G
 Vn5uC+KFR+gSeezq3K6biFvC0IAw7FpCTooOSKmKNt/wAmOIGai7wXCP6hi9FMwV
 fmH8aADBK+O9iw6eWc5VQG32hdB/1zZ1mvC9tM0UDGIU/zSFZatxi103lvBA9ymE
 mQ+9YepIikdaS3zI4HcrIIgvw7sGA9Tyjcp1xYkFYmPq7OTL3ZbkQAzNJAulfvVs
 7xhpucFz6WHmVQhLoXGh0yXP3ZLy2+JnWAeVz2KrKsqzaT9sVmyWFyBsHZtlC5zQ
 t7oYf4T4oExHpv6azHLECU+C+VWrVBVxlZbsH0Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hT6VUA
 YNVIFczKSf7p2tdTIbi+IZpnd9IggzGcLtHyQ=; b=YXNOT5yI7R7e/gLkcPvVid
 o6vJv1Zkzo3zG02qo1uU4TnIth2J21EgzmyreA5qLiATdqEjgJ0T6kueXsEqoe/i
 IsvDprSz7d2La5nluRvdMpESMqz0nRTnmVuEhyjza/Rib82IcNVAMn5X8x19oj/P
 kmEh2NvRgsJKNeI4s+KhWon4/qSY01J1jkmC0f9bpuBPjL1JzsJOXasrbB6PwmSw
 WH1WUJ2iTUF1UsI9V01nGwusK5uuutXuyKPK6Ellc1yd5K+2jTgTuLBzt0BSKjk5
 rrdBpjmF1XMShHCsTZFWcTwFKLIw9XPohW2++c7WPq2aMq+jos/o0maU3Yu1/goQ
 ==
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiBUaHUsIDI1IEp1bCAyMDE5LCBhdCAwMjo0NiwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24g
VHVlLCAyMDE5LTA3LTA5IGF0IDIyOjA0IC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiA+IEFy
Z3VtZW50cyBhcmUgc3VwcG9zZWQgdG8gYmUgb3JkZXJlZCBoaWdoIHRoZW4gbG93Lgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9hc3BlZWRfZ2Z4LmggfCAyICstCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnguaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hc3BlZWQvYXNwZWVkX2dmeC5oCj4gPiBpbmRleCBhMTAzNThiYjYxZWMuLjA5NWVhMDNlNTgz
MyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3BlZWQvYXNwZWVkX2dmeC5oCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnguaAo+ID4gQEAgLTc0LDcg
Kzc0LDcgQEAgaW50IGFzcGVlZF9nZnhfY3JlYXRlX291dHB1dChzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtKTsKPiA+ICAvKiBDVFJMMiAqLwo+ID4gICNkZWZpbmUgQ1JUX0NUUkxfREFDX0VOCQkJQklU
KDApCj4gPiAgI2RlZmluZSBDUlRfQ1RSTF9WQkxBTktfTElORSh4KQkJKCgoeCkgPDwgMjApICYg
Q1JUX0NUUkxfVkJMQU5LX0xJTkVfTUFTSykKPiA+IC0jZGVmaW5lIENSVF9DVFJMX1ZCTEFOS19M
SU5FX01BU0sJR0VOTUFTSygyMCwgMzEpCj4gPiArI2RlZmluZSBDUlRfQ1RSTF9WQkxBTktfTElO
RV9NQVNLCUdFTk1BU0soMzEsIDIwKQoKUmV2aWV3ZWQtYnk6IEFuZHJldyBKZWZmZXJ5IDxhbmRy
ZXdAYWouaWQuYXU+Cgo+IAo+IHBpbmc/Cj4gCj4gCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
