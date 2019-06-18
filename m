Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FCE498C6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 08:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390DE6E0DC;
	Tue, 18 Jun 2019 06:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B516E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 06:13:41 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id k187so7089924pga.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 23:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=CslQ849M1Db5mIkFJ5eazlY+Ewel3BYfmjuNnmrj/MI=;
 b=pk3id6Tlgt7ET5tSZBouRn+rHYxuKRf6XiUja25vq7L2loSWD9k+Lg2tZXbZQIXwVs
 dXI6pYXEhgGg1izTFuJiVsr6tQLjDzjlePv3JnV5KYtUGGW3IwonWihbJKrU4wYr16uk
 7iER/X1w4buCvUhFp0G53s5LGvU8D8ruJbwmtytSH34Ht3HLNrH+2cPZyOhvMZVonm4C
 0XAERSJ8K38WV3rSZRMUOMcX6nStRXsXPPXkzgfEMqUnTj38LmJlDPki/0Nu/pUteM9/
 gDn+G7VHdIDdmovJZ8kGeoDGFMXXvsG9KXoyuiO0U8hhKs8CTRouqZ5z373uHListHuh
 rJVQ==
X-Gm-Message-State: APjAAAW1v9tEVL37wu6+OC6QJ0W0jBzKycD2I+RgNL9y85OWyIEsPZl3
 WT5e3UnfRCyWfOx9n2wSjKs=
X-Google-Smtp-Source: APXvYqwnbdU5BnubJLJ+WVxXv1g0uES3n9SY7KAofvwe3MkKrQE7902pC5oMAwymmXxHNasC8jVJsQ==
X-Received: by 2002:aa7:9254:: with SMTP id 20mr1688580pfp.212.1560838420984; 
 Mon, 17 Jun 2019 23:13:40 -0700 (PDT)
Received: from PSXP216MB0662.KORP216.PROD.OUTLOOK.COM ([40.100.44.181])
 by smtp.gmail.com with ESMTPSA id 196sm10334598pfy.167.2019.06.17.23.13.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 23:13:40 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] video: fbdev: s3c-fb: return -ENOMEM on
 framebuffer_alloc() failure
Thread-Topic: [PATCH 1/3] video: fbdev: s3c-fb: return -ENOMEM on
 framebuffer_alloc() failure
Thread-Index: AWZkMnA0HIwkbu1fGnDQIvP1wx9CWGYwZDNj2lFR4qc=
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Tue, 18 Jun 2019 06:13:29 +0000
Message-ID: <PSXP216MB066270BD6566CA5CDCEB1C7AAAEA0@PSXP216MB0662.KORP216.PROD.OUTLOOK.COM>
References: <CGME20190614144735eucas1p2f71313b752ae4ea841ddd4ea502fd79f@eucas1p2.samsung.com>
 <bbf32fbc-b4bc-39fc-e8dd-db9f0cd0d83f@samsung.com>
In-Reply-To: <bbf32fbc-b4bc-39fc-e8dd-db9f0cd0d83f@samsung.com>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=CslQ849M1Db5mIkFJ5eazlY+Ewel3BYfmjuNnmrj/MI=;
 b=JkcgKMLTMU+vFlyJCX1IAHOQVfTUgSvxB/uXYZ+Fzf8u5b18vf5TD943h7ewSaaXEV
 uoUShHPyNYhT627H/qDUtc0F3u096CARV5Bfu7Be5z+qGWwCac/+zExkU8+ZcW4nfTxm
 fbIpMHXog4vGxizzJPc3nV5Iy7Gby9gvD6qWQJwhsOk3awqCoF+tb7BAlaCTr8So6yRR
 9FlD/Ej7afPkPZEEjaerBLcR3sBoEdYSlU/e2w7uz0hs+FeLiMl/hfup9RXca/auwpOF
 mb1vkLl6ruUUFFP39/zhkFDtAq8yAL+FLgIAgsJ7jDZwpL+JCVoaNJD2AZUT4iiZGDNU
 aDAg==
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
Cc: Han Jingoo <jingoohan1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xNC8xOSwgMTE6NDcgUE0sIEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogd3JvdGU6Cj4g
Cj4gRml4IGVycm9yIGNvZGUgZnJvbSAtRU5PRU5UIHRvIC1FTk9NRU0uCj4KPiBDYzogSmluZ29v
IEhhbiA8amluZ29vaGFuMUBnbWFpbC5jb20+CkFja2VkLWJ5OiBKaW5nb28gSGFuIDxqaW5nb29o
YW4xQGdtYWlsLmNvbT4KCkJlc3QgcmVnYXJkcywKSmluZ29vIEhhbgoKPiBTaWduZWQtb2ZmLWJ5
OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvczNjLWZiLmMgfCAgICAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gSW5kZXg6IGIvZHJpdmVy
cy92aWRlby9mYmRldi9zM2MtZmIuYwo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L3MzYy1mYi5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9zM2MtZmIuYwo+IEBA
IC0xMTkxLDcgKzExOTEsNyBAQCBzdGF0aWMgaW50IHMzY19mYl9wcm9iZV93aW4oc3RydWN0IHMz
Y19mCj4gIAkJCQkgICBwYWxldHRlX3NpemUgKiBzaXplb2YodTMyKSwgc2ZiLT5kZXYpOwo+ICAJ
aWYgKCFmYmluZm8pIHsKPiAgCQlkZXZfZXJyKHNmYi0+ZGV2LCAiZmFpbGVkIHRvIGFsbG9jYXRl
IGZyYW1lYnVmZmVyXG4iKTsKPiAtCQlyZXR1cm4gLUVOT0VOVDsKPiArCQlyZXR1cm4gLUVOT01F
TTsKPiAgCX0KPiAgCj4gIAl3aW5kYXRhID0gc2ZiLT5wZGF0YS0+d2luW3dpbl9ub107Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
