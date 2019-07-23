Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEA671BCF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 17:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A426E2ED;
	Tue, 23 Jul 2019 15:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9F66E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 15:36:49 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190723153648euoutp01d44682503b162569c16d2c2308b23621~0E1DRudvM1173811738euoutp01-
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 15:36:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190723153648euoutp01d44682503b162569c16d2c2308b23621~0E1DRudvM1173811738euoutp01-
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190723153648eucas1p2d1ab16e1997eb6c15d76d1fb7aea227f~0E1C6nA6L2270022700eucas1p2h;
 Tue, 23 Jul 2019 15:36:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id D7.A4.04298.F89273D5; Tue, 23
 Jul 2019 16:36:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190723153647eucas1p2b8f52335ab6d682ce17f59572c275d74~0E1CMCiO32268722687eucas1p2K;
 Tue, 23 Jul 2019 15:36:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190723153646eusmtrp118486f2a4e90f3949510bfaa0deba07e~0E1B4yu5R2308223082eusmtrp1B;
 Tue, 23 Jul 2019 15:36:46 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-4f-5d37298fd48b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 4C.D1.04140.E89273D5; Tue, 23
 Jul 2019 16:36:46 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190723153646eusmtip1e046a7d15dfcce43236fd92440ffdfc0~0E1BmaEB91331613316eusmtip1G;
 Tue, 23 Jul 2019 15:36:46 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: nvidia: Remove dead code
To: Souptick Joarder <jrdr.linux@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <f44e60ed-2432-cf62-3426-d6c21e2081d7@samsung.com>
Date: Tue, 23 Jul 2019 17:36:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFqt6zaNcNdxcT2WLOvL0LTX_R9ShRNx6UW6s4k+wc=Zj2MaSg@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djPc7r9muaxBrO3G1r87P7CZnHl63s2
 i2tXG5gtTvR9YLW4vGsOm8Wlj4eYHNg8ds66y+5xv/s4k8fnTXIBzFFcNimpOZllqUX6dglc
 Gdd/T2UpuMFccfaFVQPjL6YuRg4OCQETiStrTbsYuTiEBFYwSuzqXc8C4XxhlFj2bjEzhPOZ
 UeJN91KgDCdYx64fF6CqljNKzOu4yQrhvGWUWPzxDViVsIC1xN95j9hBbBEBbYm5h38xg9jM
 AksYJe7vFgex2QSsJCa2r2IEsXkF7CReLH8O1ssioCrR2NUFZosKREjcP7aBFaJGUOLkzCdg
 cU6BQImDGy6yQswUl7j1ZD4ThC0vsf3tHLCzJQQWsUtc6XnHDHG2i8Smf9/ZIGxhiVfHt7BD
 2DISpyf3sEA0rGOU+NvxAqp7O6PE8sn/oDqsJQ4fB1nHAbRCU2L9Ln1I6DlK3NovAGHySdx4
 KwhxA5/EpG3TmSHCvBIdbUIQM9QkNizbwAaztWvnSuYJjEqzkHw2C8k3s5B8Mwth7QJGllWM
 4qmlxbnpqcWGeanlesWJucWleel6yfm5mxiBKeb0v+OfdjB+vZR0iFGAg1GJh7eCyTxWiDWx
 rLgy9xCjBAezkghvYINZrBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeaoYH0UIC6YklqdmpqQWp
 RTBZJg5OqQbGWRYFLBM5Ixi95I+05/7UWMDwRXNlZdOGrWkzbs95/Es0Oa/fUf6lgXCCiPuv
 6li1uB2Hr3gu9vr0t05SbcNv4bePPX9Jc827eGTD/wdc1VMUm5t83dLcoi3qry5Pey1qEWaq
 095Sk7syUKvsRX/SkrfX48XW/9qYaOdxv2JHmZxb7q+blzOUWIozEg21mIuKEwEmhPUqLQMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xu7p9muaxBg92WFj87P7CZnHl63s2
 i2tXG5gtTvR9YLW4vGsOm8Wlj4eYHNg8ds66y+5xv/s4k8fnTXIBzFF6NkX5pSWpChn5xSW2
 StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Gdd/T2UpuMFccfaFVQPjL6Yu
 Rk4OCQETiV0/LrB0MXJxCAksZZR4cOkccxcjB1BCRuL4+jKIGmGJP9e62CBqXjNKTL59jg0k
 ISxgLfF33iN2EFtEQFti7uFfzCBFzAJLGCX+zpnLBNFxD8iZPJ0RpIpNwEpiYvsqMJtXwE7i
 xfLnLCA2i4CqRGNXF5gtKhAhceb9ChaIGkGJkzOfgNmcAoESBzdcZAWxmQXUJf7Mu8QMYYtL
 3HoynwnClpfY/nYO8wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLjfSKE3OLS/PS9ZLz
 czcxAuNq27GfW3Ywdr0LPsQowMGoxMNbwWQeK8SaWFZcmXuIUYKDWUmEN7DBLFaINyWxsiq1
 KD++qDQntfgQoynQcxOZpUST84Exn1cSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1
 ILUIpo+Jg1OqgXFt3Pdp13cp5Qa2HLv2/cOKOQe7bA/N25K77YWa3w6Oua4pSboWEW+3xPwX
 0BBl2cgW4PxfRfnMbzE7tZwrc6ZuuFlq+/VilKHAZSmDME8r2Rrj81f4o1O4063Wb+TTPGsV
 9fW7+4rW/QtcrtqJxj1yL9vzf+5G0+2qH4QixeQvZf1YpzH1fY0SS3FGoqEWc1FxIgCnAk3h
 wQIAAA==
X-CMS-MailID: 20190723153647eucas1p2b8f52335ab6d682ce17f59572c275d74
X-Msg-Generator: CA
X-RootMTR: 20190722082707epcas1p389d73a3b7fd3bc960a4caf7bc42bd1e0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190722082707epcas1p389d73a3b7fd3bc960a4caf7bc42bd1e0
References: <1562782586-3994-1-git-send-email-jrdr.linux@gmail.com>
 <CGME20190722082707epcas1p389d73a3b7fd3bc960a4caf7bc42bd1e0@epcas1p3.samsung.com>
 <CAFqt6zaNcNdxcT2WLOvL0LTX_R9ShRNx6UW6s4k+wc=Zj2MaSg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563896208;
 bh=faBCHNzVOX4xvur9dRjDf8G3Yu6o8drNcVqN2j+NkrM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=pLNpkUwaOJkNXkQT7DYUsO0TnjgWqy+JNOQ+NWayqpziXUujF66p/tnTu3s/YA/U4
 fAjBnsEcDuBTjZmyZONUvwGFagLHnPyB7G1vNrHVr8o+t+Hg+304q0g+frBRPXvdW/
 2m7BYw0cpVlCCrI8+DHTc1IoMgSPmLdIbZNQSTrA=
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
dWwgMTAsIDIwMTkgYXQgMTE6NDEgUE0gU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFp
bC5jb20+IHdyb3RlOgo+Pgo+PiBUaGlzIGlzIGRlYWQgY29kZSBzaW5jZSAzLjE1LiBJZiB0aGVy
ZSBpcyBubyBwbGFuIHRvIHVzZSBpdAo+PiBmdXJ0aGVyLCB0aGlzIGNhbiBiZSByZW1vdmVkIGZv
cmV2ZXIuCj4gCj4gQW55IGNvbW1lbnQgb24gdGhpcyBwYXRjaCA/Cj4gCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgpQYXRjaCBxdWV1
ZWQgZm9yIHY1LjQsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVy
a2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
