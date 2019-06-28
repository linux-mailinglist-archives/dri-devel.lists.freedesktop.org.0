Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54525988A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 12:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844886E8D2;
	Fri, 28 Jun 2019 10:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA44C6E8D2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:39:38 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628103937euoutp0272625859c6213e4631a4f7815ac3c4c9~sVpcIov5y0062900629euoutp02D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:39:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190628103937euoutp0272625859c6213e4631a4f7815ac3c4c9~sVpcIov5y0062900629euoutp02D
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190628103936eucas1p26685f8adf006b35a11477e4280202310~sVpbOfd-B2835028350eucas1p2-;
 Fri, 28 Jun 2019 10:39:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 49.14.04298.86EE51D5; Fri, 28
 Jun 2019 11:39:36 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190628103935eucas1p1ed57a3e2f9ecae6cb299cfacb48452d3~sVpaJGe031469414694eucas1p1v;
 Fri, 28 Jun 2019 10:39:35 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190628103935eusmtrp1331c3b3754737d4a782136682bb7f5bf~sVpZ64OIs2528125281eusmtrp17;
 Fri, 28 Jun 2019 10:39:35 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-f6-5d15ee68253a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B6.DB.04146.66EE51D5; Fri, 28
 Jun 2019 11:39:35 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190628103934eusmtip265136dc79895f63db099ac34349007b6~sVpZCX4-D1929119291eusmtip2P;
 Fri, 28 Jun 2019 10:39:34 +0000 (GMT)
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345
 bridge on Teres-I
To: Maxime Ripard <maxime.ripard@bootlin.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <bb2c2c00-b46e-1984-088f-861ac8952331@samsung.com>
Date: Fri, 28 Jun 2019 12:39:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612152022.c3cfhp4cauhzhfyr@flea>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+85tR2t1PC72lkW1KCrIjAo+ulHhHwciiCCKLtjKk0pOZafZ
 xcphTrQStRBxmVlp11Wy6WqaCNNcZs7UYRcyLe2OpqmLBWmbx8D/fjzP877f93x8LMkXM7PZ
 uISjoj5BG69hgil7g69leWz/zP0RT58E4Wx3I4FNDZ8RHrPnkfhqvZvGnpGfDPZ6nhP47I2H
 DK6oaqbx0LX3BM7KK1Vga08Hjdurihhc9qqVwN3fahE21dQrcGd5M8I2az6JfVXFFPY5W4hN
 ocIN3yghWIotSCi2pAif6n4ohMvGVkoo/3iPFmq8JZTgMHf6tcxCWrDezWKEfrdbITzydtNC
 7RWLQug67yIEW2mqUP3GyGwP2RO8PlqMj0sW9Ss2HgiO/WYbZZJs6uNDpnuUEeWEnkNBLHCr
 IS3jGXUOBbM8dxuBK6sTBQyeG0aQb+FlYwhB4+s2+v/EcMZ1Sg7dQjB2RyeH+hB42gYVASOU
 2wM5tQVEgFXccsguuUQHQiTXTsPQy6/jBsMthb+2N0yAldxGyLHnjm+luEXwosk7fo2Z3G4Y
 dliRnAmBxsLe8UwQtwrSPMNkgEkuAuqvF9Eyz4NHfUUTuhre9l4lAgcD52GhocBIyRUiIb26
 k5A5FL67KhQyz4GmSxcmMqnQdTudlIczEVSWO0jZWAd1rtaJt9gMfwacfmb9PB1e94XIB0+H
 i/YCUpaVkJnBy+kF0NVcObFFDWUvR5hcpDFPqmaeVMc8qY55Up0SRN1FatEg6WJEaWWCeCxc
 0uokQ0JM+KFEnRX5f23TqOvXYzTSdtCJOBZppinnO1T7eVqbLJ3QORGwpEalnOX2S8po7YmT
 oj4xSm+IFyUnCmMpjVqZMqV7L8/FaI+KR0QxSdT/dwk2aLYRpQ+GrZtxeHfI4jT+ftlY/v2B
 nvIHjrXn/7ZUj605dWyh9MmwRTX1ZtKuDX1hW76kZuQbInGlqa7QvmPV6UMDDfVZD7MvtEd1
 fIja+bx/X+7guwiDq8NycQ6n6kj21VSEt5rcqp+XV2/7PXfrElNP4j5vTbNvgz57seJMV+kP
 3tRbnaKhpFjtymWkXtL+A3HRcwKxAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHec9tU1sct5lvQmWDwAKPHS/5Gir1oTgWhNAXsSQPetJoF9mZ
 ZgU1MkOtMEtBN2+lJukg20pTEXGKZda6eMtA0zRjSQZdBotabc7Ab3/+z+/3vLzwSHF5Bxkm
 PaU1CHotr1ZRgcSo58lsZM5KSMbua2p03TGCoeLhJYD+dlbgqGHIQaLxn18p5Bp/hqGipvsU
 etjzgkTfb89iqLSiWYKsC5MkGuuppVDL1GsMzTn7ASruG5KgmY4XANmsVThy99QTyG1/ie1T
 cE1uD8ZZ6i2Aq7ec5z4OLks4s/E1wXV8aCe5PlcjwXWbZrxdSQ3JWdtKKW7F4ZBwXa45kuuv
 s0i491efYJyt+SLXO22kUoPTmUS9Lt8ghOfqREOS6hiLohk2ATHRsQkMGxOfsTc6ThWVnJgt
 qE8VCPqo5Ewm12nzUHm20MLvxe2EEZQrykCAFNKx8MeVO0QZCJTK6RYAS8vMmH8QCnsbvuD+
 rIC/J8soP7QMYNfAAvANFHQ6fNVftAop6Uh4vfEW6YNweoqEVZUda2tbCfi0+gHpoyh6J/xj
 m6Z8WUYnw/LOG4QvE/QO+HzUtbo1hE6D5h4j4WeC4UjN4moOoGPgpfEfq6/hNAMfT/0i/Xkb
 7PpSu9aHwneLDdgNIDet003rFNM6xbROaQREG1AK+aImRyOyjMhrxHxtDpOl01iB91o6h922
 x+DNg6N2QEuBaoMsvFuZISf5AvGsxg6gFFcpZZsd3kqWzZ89J+h1J/T5akG0gzjv5yrwsJAs
 nff2tIYTbBwbjxLY+Jj4mD1IFSoroQeOy+kc3iCcFoQ8Qf/fw6QBYUaQpP4JJ5T2TM6T5ko6
 +PCee3vyOWfQpju6X+Vv48IignhnxK1a5oCiM3Ne9inrcHWVLPvIYHapem+ieUmUXX6UZTBH
 p7TuE8ZSq1siU2KTwk82ba/bksu7rU5d3xls8MLnAzdTqXnPxmXthIUNOmSn9i+tFN28WxnY
 Ujj7besRFSHm8uwuXC/y/wB7i4BKQwMAAA==
X-CMS-MailID: 20190628103935eucas1p1ed57a3e2f9ecae6cb299cfacb48452d3
X-Msg-Generator: CA
X-RootMTR: 20190607094103epcas1p4babbb11ec050974a62f2af79bc64d752
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607094103epcas1p4babbb11ec050974a62f2af79bc64d752
References: <20190604122150.29D6468B05@newverein.lst.de>
 <20190604122308.98D4868B20@newverein.lst.de>
 <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
 <20190605101317.GA9345@lst.de> <20190605120237.ekmytfxcwbjaqy3x@flea>
 <E1hYsvP-0000PY-Pz@stardust.g4.wien.funkfeuer.at>
 <20190607062802.m5wslx3imiqooq5a@flea>
 <CGME20190607094103epcas1p4babbb11ec050974a62f2af79bc64d752@epcas1p4.samsung.com>
 <20190607094030.GA12373@lst.de>
 <66707fcc-b48e-02d3-5ed7-6b7e77d53266@samsung.com>
 <20190612152022.c3cfhp4cauhzhfyr@flea>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561718377;
 bh=KxYCFb299NuCBuskzrs32fM+mCiZc0Ki+XeRZlLfjq0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=jsdULTZwxp+xU/hui5qSc5dMtcUCAD+wD4H6XURck7iAQx2nlOVnpZSO8jyOoV42M
 z+1ogKFgVEelOCnGCxeuVB5HxL2mTPKyOQo8jpatoz0hO26WrGJrmwgQ+UlhO+LujG
 cLeWhgUlCou8ay8nB0cMWRZTmkTyPNPalAey4PkM=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lLAoKSXQgc2VlbXMgSSBoYXZlIG1pc3NlZCB5b3VyIHJlc3BvbnNlLgoKT24gMTIu
MDYuMjAxOSAxNzoyMCwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPj4gSSBhbSBub3Qgc3VyZSBpZiBJ
IHVuZGVyc3RhbmQgd2hvbGUgZGlzY3Vzc2lvbiBoZXJlLCBidXQgSSBhbHNvIGRvIG5vdAo+PiB1
bmRlcnN0YW5kIHdob2xlIGVkcC1jb25uZWN0b3IgdGhpbmcuCj4gVGhlIGNvbnRleHQgaXMgdGhp
cyBvbmU6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzI1NzM1Mi8/
c2VyaWVzPTUxMTgyJnJldj0xCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Bh
dGNoLzI4MzAxMi8/c2VyaWVzPTU2MTYzJnJldj0xCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3BhdGNoLzI4NjQ2OC8/c2VyaWVzPTU2Nzc2JnJldj0yCj4KPiBUTDtEUjogVGhp
cyBicmlkZ2UgaXMgYmVpbmcgdXNlZCBvbiBBUk0gbGFwdG9wcyB0aGF0IGNhbiBjb21lIHdpdGgK
PiBkaWZmZXJlbnQgZURQIHBhbmVscy4gU29tZSBvZiB0aGVzZSBwYW5lbHMgcmVxdWlyZSBhIHJl
Z3VsYXRvciB0byBiZQo+IGVuYWJsZWQgZm9yIHRoZSBwYW5lbCB0byB3b3JrLCBhbmQgdGhpcyBp
cyBvYnZpb3VzbHkgc29tZXRoaW5nIHRoYXQKPiBzaG91bGQgYmUgaW4gdGhlIERULgo+Cj4gSG93
ZXZlciwgd2UgY2FuJ3QgcmVhbGx5IGRlc2NyaWJlIHRoZSBwYW5lbCBpdHNlbGYsIHNpbmNlIHRo
ZSB2ZW5kb3IKPiB1c2VzIHNldmVyYWwgb2YgdGhlbSBhbmQganVzdCByZWxpZXMgb24gdGhlIGVE
UCBidXMgdG8gZG8gaXRzIGpvYiBhdAo+IHJldHJpZXZpbmcgdGhlIEVESURzLiBBIGdlbmVyaWMg
cGFuZWwgaXNuJ3QgcmVhbGx5IHdvcmtpbmcgZWl0aGVyCj4gc2luY2UgdGhhdCB3b3VsZCBtZWFu
IGhhdmluZyBhIGdlbmVyaWMgYmVoYXZpb3VyIGZvciBhbGwgdGhlIHBhbmVscwo+IGNvbm5lY3Rl
ZCB0byB0aGF0IGJ1cywgd2hpY2ggaXNuJ3QgdGhlcmUgZWl0aGVyLgo+Cj4gVGhlIGNvbm5lY3Rv
ciBhbGxvd3MgdG8gZXhwb3NlIHRoaXMgbmljZWx5LgoKCkFzIFZFU0EgcHJlc2VudGF0aW9uIHNh
eXNbMV0gZURQIGlzIGJhc2VkIG9uIERQIGJ1dCBpcyBtdWNoIG1vcmUKZmxleGlibGUsIGl0IGlz
IHVwIHRvIGludGVncmF0b3IgKCEhISkgaG93IHRoZSBjb25uZWN0aW9uLCBwb3dlcgp1cC9kb3du
LCBpbml0aWFsaXphdGlvbiBzZXF1ZW5jZSBzaG91bGQgYmUgcGVyZm9ybWVkLiBUcnlpbmcgdG8g
Y292ZXIKZXZlcnkgc3VjaCBjYXNlIGluIGVkcC1jb25uZWN0b3Igc2VlbXMgdG8gbWUgc2ltaWxh
ciB0byBwYW5lbC1zaW1wbGUKYXR0ZW1wdCBmYWlsdXJlLiBNb3Jlb3ZlciB0aGVyZSBpcyBubyBz
dWNoIHRoaW5nIGFzIHBoeXNpY2FsIHN0YW5kYXJkCmVEUCBjb25uZWN0b3IuIFRpbGwgbm93IEkg
dGhvdWdoIERUIGNvbm5lY3RvciBzaG91bGQgZGVzY3JpYmUgcGh5c2ljYWwKY29ubmVjdG9yIG9u
IHRoZSBkZXZpY2UsIG5vdyBJIGFtIGxvc3QsIGFyZSB0aGVyZSBzb21lIERUIGJpbmRpbmdzCmd1
aWRlbGluZXMgYWJvdXQgZGVmaW5pdGlvbiBvZiBhIGNvbm5lY3Rvcj8KCk1heWJlIGluc3RlYWQg
b2YgZWRwLWNvbm5lY3RvciBvbmUgd291bGQgaW50cm9kdWNlIGludGVncmF0b3IncyBzcGVjaWZp
Ywpjb25uZWN0b3IsIGZvciBleGFtcGxlIHdpdGggY29tcGF0aWJsZSAib2xpbWV4LHRlcmVzLWVk
cC1jb25uZWN0b3IiCndoaWNoIHNob3VsZCBmb2xsb3cgZWRwIGFic3RyYWN0IGNvbm5lY3RvciBy
dWxlcz8gVGhpcyB3aWxsIGJlIGF0IGxlYXN0CmNvbnNpc3RlbnQgd2l0aCBiZWxvdyBwcmVzZW50
YXRpb25bMV0gLSBlRFAgcmVxdWlyZW1lbnRzIGRlcGVuZHMgb24KaW50ZWdyYXRvci4gVGhlbiBp
ZiBvbGltZXggaGFzIHN0YW5kYXJkIHdheSBvZiBkZWFsaW5nIHdpdGggcGFuZWxzCnByZXNlbnQg
aW4gb2xpbWV4L3RlcmVzIHBsYXRmb3JtcyB0aGUgZHJpdmVyIHdvdWxkIHRoZW4gY3JlYXRlCmRy
bV9wYW5lbC9kcm1fY29ubmVjdG9yL2RybV9icmlkZ2UoPykgYWNjb3JkaW5nIHRvIHRoZXNlIHJ1
bGVzLCBJIGd1ZXNzLgpBbnl3YXkgaXQgc3RpbGwgbG9va3MgZmlzaHkgZm9yIG1lIDopLCBtYXli
ZSBiZWNhdXNlIEkgYW0gbm90CmZhbWlsaWFyaXplZCB3aXRoIGRldGFpbHMgb2YgdGhlc2UgcGxh
dGZvcm1zLgoKWzFdOiBodHRwczovL3d3dy52ZXNhLm9yZy93cC1jb250ZW50L3VwbG9hZHMvMjAx
MC8xMi9EaXNwbGF5UG9ydC1EZXZDb24tUHJlc2VudGF0aW9uLWVEUC1EZWMtMjAxMC12My5wZGYK
Cgo+Cj4+IEFjY29yZGluZyB0byBWRVNBWzFdIGVEUCBpcyAiSW50ZXJuYWwgZGlzcGxheSBpbnRl
cmZhY2UiIC0gdGhlcmUgaXMgbm8KPj4gZXh0ZXJuYWwgY29ubmVjdG9yIGZvciBlRFAsIHRoZSB3
YXkgaXQgaXMgY29ubmVjdGVkIGlzIGludGVncmF0b3Incwo+PiBkZWNpc2lvbiwgYnV0IGl0IGlz
IGZpeGVkIC0gaWUgZW5kIHVzZXIgZG8gbm90IHBsdWcvdW5wbHVnIGl0Lgo+IEknbSBub3Qgc3Vy
ZSBpZiB5b3UgbWVhbiBEUk0gb3IgRFQgY29ubmVjdG9yIGhlcmUgdGhvdWdoLiBJbiBEUk0sCj4g
d2UncmUgZG9pbmcgdGhpcyBhbGwgdGhlIHRpbWUgZm9yIHBhbmVscy4gSSdtIGxpdGVyYWx5IHR5
cGluZyB0aGlzCj4gZnJvbSBhIGxhcHRvcCB0aGF0IGhhcyBhIHNjcmVlbiB3aXRoIGFuIGVEUCBj
b25uZWN0b3IuCgoKVkVTQSBkZXNjcmliZXMgb25seSBoYXJkd2FyZSwgYnV0IHNpbmNlIERUIGFs
c28gZGVzY3JpYmVzIGhhcmR3YXJlIEkKZ3Vlc3MgaXQgc2hvdWxkIGJlIHNpbWlsYXIuCgoKUmVn
YXJkcwoKQW5kcnplagoKCgoKPgo+IE1heGltZQo+Cj4gLS0KPiBNYXhpbWUgUmlwYXJkLCBCb290
bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHBzOi8vYm9v
dGxpbi5jb20KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
