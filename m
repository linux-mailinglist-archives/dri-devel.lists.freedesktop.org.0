Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF88739A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4594F6ED0E;
	Fri,  9 Aug 2019 08:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42B0897E4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 13:19:28 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190808131927euoutp0154ea443d3ad8892f66746601614b64c3~49RshsXv_1597915979euoutp01V
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 13:19:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190808131927euoutp0154ea443d3ad8892f66746601614b64c3~49RshsXv_1597915979euoutp01V
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190808131926eucas1p27760b9e4918c7ec639731837f737eb78~49RsDnfW82304523045eucas1p2W;
 Thu,  8 Aug 2019 13:19:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id EA.32.04309.E512C4D5; Thu,  8
 Aug 2019 14:19:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190808131925eucas1p18cbdebea41d0501bf9f9edb3bb0baf97~49Rq4M_Vg2619826198eucas1p1V;
 Thu,  8 Aug 2019 13:19:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190808131925eusmtrp2e2247ca1de6d1cc68f838d639791aa13~49RqqA2ig0955809558eusmtrp2b;
 Thu,  8 Aug 2019 13:19:25 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-8f-5d4c215ea915
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E6.50.04166.D512C4D5; Thu,  8
 Aug 2019 14:19:25 +0100 (BST)
Received: from AMDC3555 (unknown [106.120.51.67]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20190808131924eusmtip1fdcb55f900a56f9267b3b1725f38cee1~49RqA_1gx0713907139eusmtip1h;
 Thu,  8 Aug 2019 13:19:24 +0000 (GMT)
Message-ID: <7f4eeef81c2688c2cb18b7aae71d457197c6d018.camel@partner.samsung.com>
Subject: Re: [RFC PATCH 09/11] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
To: Leonard Crestez <leonard.crestez@nxp.com>, Georgi Djakov
 <georgi.djakov@linaro.org>
Date: Thu, 08 Aug 2019 15:19:23 +0200
In-Reply-To: <VI1PR04MB5055BED59960B4F4147479AEEED50@VI1PR04MB5055.eurprd04.prod.outlook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBKsWRmVeSWpSXmKPExsWy7djP87pxij6xBt9+yFtc//Kc1WL+kXOs
 Fle+vmezmL53E5vFpPsTWCzOn9/AbrHi7kdWi02Pr7FaXN41h83ic+8RRosZ5/cxWaw9cpfd
 4nbjCjaLGZNfsjnweWxa1cnmcefaHjaP+93HmTw2L6n32PhuB5NH35ZVjB6fN8kFsEdx2aSk
 5mSWpRbp2yVwZRy4k1DQwFMx588KxgbGDZxdjJwcEgImEhumb2LqYuTiEBJYwSjxfdl7Ngjn
 C6PE1d67LBDOZ0aJHW0LmGFaDl58DlW1nFHi/rFnUM4zRonXi3+AVfEKBEic+TybFcQWFkiS
 WPDoIpjNJuAu8e/5FTBbRCBSYs/uy2ArmAXOskqcm7gOrJlFQFXi7/WpYEWcArESr1pOQa3W
 kXh7qg+ogQNogaDE3x3CIGFmAXmJ5q2zmUHmSAjcY5foXzeHDaLeReLUksuMELawxKvjW9gh
 bBmJ/zvnM0HYxRJPd95nhWhuYJTYtOwI1DJricPHQa7mANqgKbF+lz5E2FHibd9RZpCwhACf
 xI23ghA38ElM2jYdKswr0dEmBGFqSSz4HQ3RKCHRtPoa1GwPiZZHz9knMCrOQvhlFpJfZiFs
 XcDIvIpRPLW0ODc9tdgoL7Vcrzgxt7g0L10vOT93EyMwfZ3+d/zLDsZdf5IOMQpwMCrx8Bac
 8I4VYk0sK67MPcQowcGsJMJ7r8wzVog3JbGyKrUoP76oNCe1+BCjNAeLkjhvNcODaCGB9MSS
 1OzU1ILUIpgsEwenVAPjlsUv5W8YHehlufcrWd/s2JrQZP8cK0E54ekzbjG6SctMNN6b1eCc
 d3cL+0leJp5XDRZybv0+e7jZZhiu3rej9+Rh2bg51rs8DioKOt033+FVbZtz1fB3pur2XUtS
 bN3WyT4PvfL6WuB6SfbrciGH72heaZQIjvr6wWf3dhXRMtvjajtsinWVWIozEg21mIuKEwHm
 2kMrWwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xu7qxij6xBgduClpc//Kc1WL+kXOs
 Fle+vmezmL53E5vFpPsTWCzOn9/AbrHi7kdWi02Pr7FaXN41h83ic+8RRosZ5/cxWaw9cpfd
 4nbjCjaLGZNfsjnweWxa1cnmcefaHjaP+93HmTw2L6n32PhuB5NH35ZVjB6fN8kFsEfp2RTl
 l5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZRy4k1DQwFMx
 588KxgbGDZxdjJwcEgImEgcvPmcDsYUEljJKfGhyh4hLSHxcf4MVwhaW+HOtC6iGC6jmCaPE
 mdXHGEESvAIBEmc+zwYrEhZIkljw6CKYzSbgLvHv+RUwW0QgSuL5jT4mkGZmgXOsEpe3bgdL
 sAioSvy9PhXM5hSIlXjVcooZYsMSJomDmxexgCSYBTQlWrf/Zoc4Q0fi7ak+oDgH0GZBib87
 hCFK5CWat85mnsAoOAtJxyyEqllIqhYwMq9iFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjMxt
 x35u3sF4aWPwIUYBDkYlHt6CE96xQqyJZcWVuYcYJTiYlUR475V5xgrxpiRWVqUW5ccXleak
 Fh9iNAX6ZyKzlGhyPjBp5JXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi
 4JRqYJQzXVucOq3T69q1HQ7ObwtuPE67Wn2nc2tl4qTHty4q/O9iPTQ1xO3pXYeOKwG6QnwB
 GY5szhKrX/ut/ycxuf2e+w1PdV4mzaj9R3v+Xz9sdO97nIuI2YlWgav2lz1eCZrOS7tW2h93
 +r1P7nvbqZV6e0IyrE7fW/CpXGBWpcdeP03e2yurCpRYijMSDbWYi4oTAeiNT3XiAgAA
X-CMS-MailID: 20190808131925eucas1p18cbdebea41d0501bf9f9edb3bb0baf97
X-Msg-Generator: CA
X-RootMTR: 20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b@eucas1p2.samsung.com>
 <20190723122016.30279-10-a.swigon@partner.samsung.com>
 <VI1PR04MB5055BED59960B4F4147479AEEED50@VI1PR04MB5055.eurprd04.prod.outlook.com>
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1565270367;
 bh=ookusFW9IgM6u0l6dG3jFEGxecF9mJq8IKEqSZsXe3U=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=H3u6q2EgP214ncKYGJdX+T/HXd0sIC82mr+MytSy9JvkNarnKoHTK5j/9b5crL4L+
 MBBfrz6zd/+eyiEor7wQZY2pKhS3rnwWytohGo8DUGPFId6RuzMWr3ZSne+uTMtcib
 ykFa/zxcxZsMntMWswhZRY7cdWHjTvPbUyVt/c0Q=
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
 "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudHMuCgpPbiBUdWUsIDIwMTktMDgtMDYgYXQg
MTM6NDEgKzAwMDAsIExlb25hcmQgQ3Jlc3RleiB3cm90ZToKPiBPbiAyMy4wNy4yMDE5IDE1OjIx
LCBBcnR1ciDFmndpZ2/FhCB3cm90ZToKPiAKPiA+ICtzdGF0aWMgaW50IGV4eW5vc19idXNfaWNj
X2FnZ3JlZ2F0ZShzdHJ1Y3QgaWNjX25vZGUgKm5vZGUsIHUzMiBhdmdfYncsCj4gPiArCQkJCSAg
ICB1MzIgcGVha19idywgdTMyICphZ2dfYXZnLCB1MzIgKmFnZ19wZWFrKQo+ID4gK3sKPiA+ICsJ
KmFnZ19wZWFrID0gKmFnZ19hdmcgPSBwZWFrX2J3Owo+ID4gKwo+ID4gKwlyZXR1cm4gMDsKPiA+
ICt9Cj4gCj4gVGhlIG9ubHkgY3VycmVudCBwcm92aWRlciBhZ2dyZWdhdGVzICJhdmciIHdpdGgg
InN1bSIgYW5kICJwZWFrIiB3aXRoIAo+ICJtYXgiLCBhbnkgcGFydGljdWxhciByZWFzb24gdG8g
ZG8gc29tZXRoaW5nIGRpZmZlcmVudD8gVGhpcyBmdW5jdGlvbiAKPiBkb2Vzbid0IGV2ZW4gcmVh
bGx5IGRvIGFnZ3JlZ2F0aW9uLCBpZiB0aGVyZSBpcyBhIHNlY29uZCByZXF1ZXN0IGZvciAiMCIg
Cj4gdGhlbiB0aGUgZmlyc3QgcmVxdWVzdCBpcyBsb3N0LgoKWWVzLCB5b3UncmUgcmlnaHQuIEkg
YWRvcHRlZCBhbiBvdmVyc2ltcGxpZmllZCBzb2x1dGlvbiBmb3IgdGhlIHB1cnBvc2Ugb2YgdGhp
cwpSRkMgKHBsZWFzZSBiZWFyIGluIG1pbmQgdGhhdCBjdXJyZW50bHkgb25seSBvbmUgaWNjX3Bh
dGggaXMgdXNlZCwgc28gdGhlcmUgaXMKbm8gYWdncmVnYXRpb24gYW55d2F5KS4KCj4gSSBkaWRu
J3QgZmluZCBhbnkgZG9jcyBidXQgbXkgaW50ZXJwcmV0YXRpb24gb2YgYXZnL3BlYWsgaXMgdGhh
dCAiYXZnIiAKPiBpcyBmb3IgY29uc3RhbnQgdHJhZmZpYyBsaWtlIGEgZGlzcGxheSBvciBWUFUg
cHVzaGluZyBwaXhlbHMgYW5kICJwZWFrIiAKPiBpcyBmb3IgdmFyaWFibGUgdHJhZmZpYyBsaWtl
IG5ldHdvcmtpbmcuIEkgYXNzdW1lIGRldmljZXMgd2hpY2ggbWFrZSAKPiAicGVhayIgcmVxdWVz
dHMgYXJlIGFnZ3JlZ2F0ZWQgd2l0aCBtYXggYmVjYXVzZSB0aGV5J3JlIG5vdCBleHBlY3RlZCB0
byAKPiBhbGwgbWF4LW91dCB0b2dldGhlci4KClRoYXQncyBjb3JyZWN0IChhY2NvcmRpbmcgdG8g
bXkgdW5kZXJzdGFuZGluZykuCgo+IEluIFBBVENIIDExIHlvdSdyZSBtYWtpbmcgYSBiYW5kd2lk
dGggcmVxdWVzdCBiYXNlZCBvbiByZXNvbHV0aW9uLCB0aGF0IAo+IHRyYWZmaWMgaXMgY29uc3Rh
bnQgYW5kIGd1YXJhbnRlZWQgdG8gaGFwcGVuZCB3aGlsZSB0aGUgZGlzcGxheSBpcyBvbiBzbyAK
PiBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIHJlcXVlc3QgaXQgYXMgYW4gImF2ZyIgYW5kIGFnZ3Jl
Z2F0ZSBpdCB3aXRoICJzdW0iLgo+IAo+IC0tCj4gUmVnYXJkcywKPiBMZW9uYXJkCj4gCi0tIApB
cnR1ciDFmndpZ2/FhApTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ry
b25pY3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
