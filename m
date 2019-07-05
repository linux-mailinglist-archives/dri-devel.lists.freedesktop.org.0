Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACE160892
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 17:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AEA6E4DE;
	Fri,  5 Jul 2019 15:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3381C6E4DE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 15:01:21 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190705150120euoutp019b60dc001030d83e6ed380130504e09d~uiu8LSP7Q2698026980euoutp01I
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 15:01:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190705150120euoutp019b60dc001030d83e6ed380130504e09d~uiu8LSP7Q2698026980euoutp01I
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190705150119eucas1p27fa85466a960f36410e358a8be20ce37~uiu7whjt_0759507595eucas1p2T;
 Fri,  5 Jul 2019 15:01:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 26.0A.04298.F366F1D5; Fri,  5
 Jul 2019 16:01:19 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190705150118eucas1p25cec76e92a4a50a68b7321f88be97f46~uiu6519UW1379413794eucas1p2k;
 Fri,  5 Jul 2019 15:01:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190705150118eusmtrp132bfbac3f00d63077f2cdf17fa13d980~uiu6r0CAe0410604106eusmtrp1v;
 Fri,  5 Jul 2019 15:01:18 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-27-5d1f663f413e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 09.46.04146.E366F1D5; Fri,  5
 Jul 2019 16:01:18 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190705150118eusmtip2a153eeb590dbc01f80a3fefc3f413e88~uiu6VAwZs1530115301eusmtip2J;
 Fri,  5 Jul 2019 15:01:18 +0000 (GMT)
Subject: Re: [PATCH 08/11] video: fbdev: w100fb: convert platform driver to
 use dev_groups
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <ca07c35b-7af1-9573-6378-c7b7bcca40fa@samsung.com>
Date: Fri, 5 Jul 2019 17:01:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190704084617.3602-9-gregkh@linuxfoundation.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0iTYRTHe/ZeN5o9TsuThcMRRkKa1IelpSmGg750I6RmtvLNSzpl816h
 mJiYzZygbCgaeUs0xURLy4UjZ4jXhQ4/qJWUBZKXBK3U3F4lv/2fc37nnP8fHpaQVFPubKw6
 mdOoVfEyWkS2964OHg26LY04Nl8ukX9c/knLHzxrpuWtX8YoeZ9unpJbO8tpea61njhDK0wV
 jYxi6pFFoHhZnaUY2shlFEutHuepq6JTUVx8bCqn8Q28IYr5Zpqlk8xUenV2KZ2NxskCJGQB
 n4DCr2V0ARKxElyPoLlngeQfvxDkLegJ/rGEoNj4FG2P6Cbe0HYtwXUIWheBh+YQVNismxMs
 64KVMDSdZmdc8XEoGjAydobAjQiGDROMvUFjfyh+2OBYKsaBsNI94NAkPgR1kyuOA3txOEz1
 tlA84wwfDDMO30IcBH9nywi7JrAbTMxUCngthY65codrwC8YGBotFdgNAQ6F6apwPoAL/LC0
 Mbw+CP0lheQWj2Atf3ZruANBXck6zVMBYLaMUPZFBD4CzZ2+fDkY2oYrGH6/E9jmnHkPTqBv
 LyP4shjy8yQ87QUttS309tmC18+JJ0hm3JHMuCONcUca4/+7VYhsQG5cijYhmtP6qbk0H60q
 QZuijva5lZjQijb/Tv+6ZfEVWh692YMwi2S7xX0h0ggJpUrVZiT0IGAJmatYdXGzJI5SZWRy
 msRITUo8p+1BB1hS5ia+u2v6mgRHq5K5OxyXxGm2uwJW6J6NMpevNymuXLalH75EDReF3m80
 dqw3OVWmhnhWnc16e7LPfE/ZFTIu+HyhxmujPDJH6G87ZxrT568OKt4xaiJAt2aSfn9/2mqo
 CS/eb/b2nPnNBfczSnbSozpMrJTuC4pT5kRP75kS1Zq79dRIdq5u3NC0QIb5ZcR9snY9NvyR
 kdoYlZ83odGq/gFufRYLNwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsVy+t/xe7p2afKxBo9OiVhc+fqezaJ58Xo2
 i02Pr7FanOj7wGpxedccNouWyyuYHdg89s9dw+5xv/s4k8fmJfUe5/+3sHt83iQXwBqlZ1OU
 X1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl/F8/wu2gsOs
 FUsaprE1MF5n6WLk5JAQMJHou7WHrYuRi0NIYCmjxLSP9xi7GDmAEjISx9eXQdQIS/y51gVV
 85pR4nrzFFaQGmGBGInzD8pBakQEjCX6z85iB6lhFljDKLHs9yEWiIbjjBLzlx9kBqliE7CS
 mNi+ihHE5hWwk/ix7yyYzSKgIrH83g82EFtUIELizPsVLBA1ghInZz4BszkF7CX+vJgONodZ
 QF3iz7xLULa4xK0n85kgbHmJ7W/nME9gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232FCv
 ODG3uDQvXS85P3cTIzDSth37uXkH46WNwYcYBTgYlXh4TzjJxwqxJpYVV+YeYpTgYFYS4U0M
 AgrxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjAJ5JXEG5oamltYGpobmxubWSiJ83YIHIwR
 EkhPLEnNTk0tSC2C6WPi4JRqYHTSOPaD54AfR+PNq9PaVm86mBl0dtuxtQKZ32P+zFkdZlZx
 TTeVb1Lafa7MaU9e9b2eXqyTO31BJPOklTfLBJP2R3Fmh+6X+z5FPO/r3ET/m98TXqfqqj9f
 m/Ji249/xtY7DnL9nnY14PK93sa6vzfu/riXODvre9eHX+deOhzk4v2XfiK8zMBEiaU4I9FQ
 i7moOBEAxTk02soCAAA=
X-CMS-MailID: 20190705150118eucas1p25cec76e92a4a50a68b7321f88be97f46
X-Msg-Generator: CA
X-RootMTR: 20190704084708epcas1p18ca1621224d6726fa07276e186c198ad
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190704084708epcas1p18ca1621224d6726fa07276e186c198ad
References: <20190704084617.3602-1-gregkh@linuxfoundation.org>
 <CGME20190704084708epcas1p18ca1621224d6726fa07276e186c198ad@epcas1p1.samsung.com>
 <20190704084617.3602-9-gregkh@linuxfoundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562338880;
 bh=FKd6Mj3vNO8bNJ6GbhGke6sHU2mU2LiIRVp28H3TLR4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=TWKKUqOzCK07fvkKSXH6HpK01zIsLsgLERsQ+FRa2x0tgc0QoYk8ikkrYytfI6fqk
 xqCURAO8FcodOsb0nn5hVSEXy+xeVjNdrEg+6ZCHc67EXemLTgbEeOvjhU/+Ic9+8R
 /5726OCrtcXzRo1HL0PgcRqD+3o4CMp5Lr9Bt2R8=
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
Cc: Tony Prisk <linux@prisktech.co.nz>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvNC8xOSAxMDo0NiBBTSwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+IFBsYXRmb3Jt
IGRyaXZlcnMgbm93IGhhdmUgdGhlIG9wdGlvbiB0byBoYXZlIHRoZSBwbGF0Zm9ybSBjb3JlIGNy
ZWF0ZQo+IGFuZCByZW1vdmUgYW55IG5lZWRlZCBzeXNmcyBhdHRyaWJ1dGUgZmlsZXMuICBTbyB0
YWtlIGFkdmFudGFnZSBvZiB0aGF0Cj4gYW5kIGRvIG5vdCByZWdpc3RlciAiYnkgaGFuZCIgYSBi
dW5jaCBvZiBzeXNmcyBmaWxlcy4KPiAKPiBDYzogVG9ueSBQcmlzayA8bGludXhAcHJpc2t0ZWNo
LmNvLm56Pgo+IENjOiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ft
c3VuZy5jb20+Cj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LWZiZGV2QHZnZXIu
a2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+CgpBY2tlZC1ieTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8
Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpv
bG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJv
bmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
