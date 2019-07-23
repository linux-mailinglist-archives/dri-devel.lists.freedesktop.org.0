Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3870D71BC6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 17:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59A96E2EC;
	Tue, 23 Jul 2019 15:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D0A6E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 15:36:29 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190723153628euoutp0182415d9497d96a84d1bcd6012037bd31~0E0w7jQn81092610926euoutp01g
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 15:36:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190723153628euoutp0182415d9497d96a84d1bcd6012037bd31~0E0w7jQn81092610926euoutp01g
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190723153628eucas1p1336ba2d87e17a6d8a0729f684d7deba6~0E0wiawIZ0734507345eucas1p14;
 Tue, 23 Jul 2019 15:36:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F2.A4.04298.B79273D5; Tue, 23
 Jul 2019 16:36:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190723153627eucas1p2c178db48c92e5864bce982f507560eff~0E0v34sWN1825618256eucas1p2e;
 Tue, 23 Jul 2019 15:36:27 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190723153627eusmtrp154562d96acfb5e1e7a9c49d1ef420b70~0E0vp5NTM2233722337eusmtrp1Y;
 Tue, 23 Jul 2019 15:36:27 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-27-5d37297b11a1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 43.D1.04140.B79273D5; Tue, 23
 Jul 2019 16:36:27 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190723153626eusmtip1ee9fba930d829abc318b10176215dd76~0E0vSOsu80838408384eusmtip1b;
 Tue, 23 Jul 2019 15:36:26 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: nvidia: Remove extra return
To: Souptick Joarder <jrdr.linux@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <92c45f9b-015a-d6f0-bb27-558580fb4d35@samsung.com>
Date: Tue, 23 Jul 2019 17:36:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFqt6zb-LmG4PrWCXfmDqor2bgxyFJRt5Yg0vmNgE9zvaw+S3Q@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRmVeSWpSXmKPExsWy7djP87o1muaxBleaGC1+dn9hs7jy9T2b
 xbWrDcwWJ/o+sFpc3jWHzeLSx0NMDmweO2fdZfe4332cyePzJrkA5igum5TUnMyy1CJ9uwSu
 jO29h5gKljBXLPy3ia2B8TJTFyMnh4SAicS9o9/AbCGBFYwSZ+cIdDFyAdlfGCX+31/HBOF8
 ZpT41dvDCNNx8NkXdojEckaJU4snsEI4bxklvk97AlYlLGAncXTRPFYQW0RAW2Lu4V/MIDaz
 wBJGifu7xUFsNgEriYntq8DqeYHq51x+yQJiswioSlxt7AG7SVQgQuL+sQ2sEDWCEidnPgGr
 4RQIlGhuPg81U1zi1pP5TBC2vMT2t3OYQQ6SEFjELvFn0zGos10kbn66wQJhC0u8Or6FHcKW
 kTg9uYcFomEdo8TfjhdQ3dsZJZZP/scGUWUtcfj4RaAzOIBWaEqs36UPEXaUeLvyBCNIWEKA
 T+LGW0GII/gkJm2bzgwR5pXoaBOCqFaT2LBsAxvM2q6dK5knMCrNQvLaLCTvzELyziyEvQsY
 WVYxiqeWFuempxYb5qWW6xUn5haX5qXrJefnbmIEppnT/45/2sH49VLSIUYBDkYlHt4KJvNY
 IdbEsuLK3EOMEhzMSiK8gQ1msUK8KYmVValF+fFFpTmpxYcYpTlYlMR5qxkeRAsJpCeWpGan
 phakFsFkmTg4pRoYjaZvq/v15PIrswtpjede3OVb9m/j5rLgQyYRSfm93xgufxU5rW5XxxDY
 Hedzdkc60yYFFdFY9ufWH3/+k7vWpuHjPjV/dZ2jxhFTRgvvjIT7CYGTG223x/ennzycXsCj
 vKHJZuEyNmGdwy/rTz27GqN6eFlC1bmZHBcfPL7f/jX7UP17Kd4XSizFGYmGWsxFxYkAxn6m
 zS8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7rVmuaxBpNOCVn87P7CZnHl63s2
 i2tXG5gtTvR9YLW4vGsOm8Wlj4eYHNg8ds66y+5xv/s4k8fnTXIBzFF6NkX5pSWpChn5xSW2
 StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Gdt7DzEVLGGuWPhvE1sD42Wm
 LkZODgkBE4mDz76wdzFycQgJLGWUWLnhP3MXIwdQQkbi+PoyiBphiT/Xutggal4zSkztOM4O
 khAWsJM4umgeK4gtIqAtMffwL2aQImaBJYwSf+fMZYLouMcosaf1KDNIFZuAlcTE9lWMIDYv
 UPecyy9ZQGwWAVWJq409YCeJCkRInHm/ggWiRlDi5MwnYDanQKBEc/N5sDnMAuoSf+ZdgrLF
 JW49mc8EYctLbH87h3kCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ
 +bmbGIGRte3Yzy07GLveBR9iFOBgVOLhrWAyjxViTSwrrsw9xCjBwawkwhvYYBYrxJuSWFmV
 WpQfX1Sak1p8iNEU6LmJzFKiyfnAqM8riTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2a
 WpBaBNPHxMEp1cBY47D3l0/ZcXUzX93LKd4HjmonnLoksKWTK1VN3jFfk/9T6ZW4P11L7/Q9
 Ln31QHvRpAlbinzMM5RK4oL7H3jXTX6Tvs/+RvHp444TLu3PPOO0xcPohb9sdvOUi1XxrwJW
 99ybUX6S0SLKbZ9w1LTPk/odlrxwtpxyaf/W067WDU9Lio9e+WyhxFKckWioxVxUnAgADfOP
 8sICAAA=
X-CMS-MailID: 20190723153627eucas1p2c178db48c92e5864bce982f507560eff
X-Msg-Generator: CA
X-RootMTR: 20190722082644epcas3p40d41c7bc15b725e25a882e9209bd25c6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190722082644epcas3p40d41c7bc15b725e25a882e9209bd25c6
References: <1562781795-3494-1-git-send-email-jrdr.linux@gmail.com>
 <CGME20190722082644epcas3p40d41c7bc15b725e25a882e9209bd25c6@epcas3p4.samsung.com>
 <CAFqt6zb-LmG4PrWCXfmDqor2bgxyFJRt5Yg0vmNgE9zvaw+S3Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563896188;
 bh=O8Vpty1gSXpURAMJeyha589DoPW5AsCUoN3Phq7m0bQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=sD2pMxV8phuw+L+S0NCf6X8gOWxsFoctTPgPZdWenO7/Py7Ntn08g8f7LZ1cW8I+P
 ZG3/kE39mx04K0FwaYhIrFw4VER+7/WhL3OMrNKsjJuueUT5cNj7iQuDzrEpHM66N4
 w0pzwUXvPt/klxY3vjbcnCTUKEXBn1Z4rPO53jdE=
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
Cc: linux-fbdev@vger.kernel.org, Sabyasachi Gupta <sabyasachi.linux@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjIvMTkgMTA6MjYgQU0sIFNvdXB0aWNrIEpvYXJkZXIgd3JvdGU6Cj4gT24gV2VkLCBK
dWwgMTAsIDIwMTkgYXQgMTE6MjggUE0gU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFp
bC5jb20+IHdyb3RlOgo+Pgo+PiBNaW5vciBjbGVhbnVwIHRvIHJlbW92ZSBleHRyYSByZXR1cm4g
c3RhdGVtZW50Lgo+Pgo+IAo+IEFueSBjb21tZW50IG9uIHRoaXMgcGF0Y2ggPwo+IAo+PiBTaWdu
ZWQtb2ZmLWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KClBhdGNo
IHF1ZXVlZCBmb3IgdjUuNCwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpv
bG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJv
bmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
