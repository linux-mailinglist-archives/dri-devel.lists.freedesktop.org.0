Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19592925C4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8DC6E134;
	Mon, 19 Aug 2019 14:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04306E134
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:02:54 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190819140253euoutp026fa5c198424b7c8aa319e035b1b60b0b~8V9w8zvFw0126801268euoutp02_
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:02:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190819140253euoutp026fa5c198424b7c8aa319e035b1b60b0b~8V9w8zvFw0126801268euoutp02_
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190819140253eucas1p18901738995874ff56f1a7a54eb5cc7be~8V9wiC30_1977819778eucas1p1b;
 Mon, 19 Aug 2019 14:02:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 7A.F5.04469.D0CAA5D5; Mon, 19
 Aug 2019 15:02:53 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190819140252eucas1p1fc087ca9ea3523ef448ce28498e5c977~8V9vny0e91976619766eucas1p1r;
 Mon, 19 Aug 2019 14:02:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190819140252eusmtrp237e6bc47d73c2522b328ce52d08b7556~8V9vnLW3c3080230802eusmtrp2M;
 Mon, 19 Aug 2019 14:02:52 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-b8-5d5aac0d2784
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 76.13.04166.C0CAA5D5; Mon, 19
 Aug 2019 15:02:52 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190819140252eusmtip13065ddc10526edf8763b61a827a80dee~8V9vTZN6k0664206642eusmtip13;
 Mon, 19 Aug 2019 14:02:52 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: aty: Use dev_get_drvdata
To: Chuhong Yuan <hslester96@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <e9d8fe12-e415-19b3-5c84-2927e26de1ec@samsung.com>
Date: Mon, 19 Aug 2019 16:02:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190724131900.2039-1-hslester96@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djP87q8a6JiDb5uZbX40NTKbHHl63s2
 i9mHXjJbnOj7wGpxedccNgdWj52z7rJ79LxpYfW4332cyePzJrkAligum5TUnMyy1CJ9uwSu
 jNVTT7MXHGWqmHogqYGxh6mLkYNDQsBEYme7ZRcjF4eQwApGiSmLPrBCOF8YJXp3b2GDcD4z
 SrzrOQzkcIJ1tO17wgKRWM4o8ap3LSNIQkjgLaPE+p5oEFtYwFriw+cuZhBbREBd4vOunewg
 DcwCUxkltl84yw6SYBOwkpjYvgqsmVfATmLxhulgcRYBVYmzZy6zgNiiAhES949tYIWoEZQ4
 OfMJWJxTwFJi0ooXYPXMAuISt57MZ4Kw5SW2v53DDLJMQmAeu8Scp9fZIR51kfhxPRbiA2GJ
 V8e3sEPYMhL/d4L0gtSvY5T42/ECqnk7o8Tyyf+gfraWOHz8IivIIGYBTYn1u/Qhwo4Sqw5+
 gJrPJ3HjrSDEDXwSk7ZNZ4YI80p0tAlBVKtJbFi2gQ1mbdfOlcwTGJVmIflsFpJvZiH5ZhbC
 3gWMLKsYxVNLi3PTU4sN81LL9YoTc4tL89L1kvNzNzECU8zpf8c/7WD8einpEKMAB6MSD6/H
 tKhYIdbEsuLK3EOMEhzMSiK8FXOAQrwpiZVVqUX58UWlOanFhxilOViUxHmrGR5ECwmkJ5ak
 ZqemFqQWwWSZODilGhg55Aomv3Vkfv5JS87y4bob71ZWXRPbIhabteGm0rSgZV+FTp1cnh7p
 aGu3fFVf5nt5l2Uc5y/YJJ29NmNv0JbXCt/3v/7z/vey049vvTfsVLV5ceW5nWRbQRvTsdc7
 5JZWTbGew93+u+JH0KQHbLctg9a8KemrZJuW+tenyGX1z5AI7yvuim+ylViKMxINtZiLihMB
 fxWyVS0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xu7o8a6JiDXb3ilh8aGpltrjy9T2b
 xexDL5ktTvR9YLW4vGsOmwOrx85Zd9k9et60sHrc7z7O5PF5k1wAS5SeTVF+aUmqQkZ+cYmt
 UrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexuqpp9kLjjJVTD2Q1MDYw9TF
 yMkhIWAi0bbvCUsXIxeHkMBSRokXP9qAEhxACRmJ4+vLIGqEJf5c62IDsYUEXjNKTNjsA2IL
 C1hLfPjcxQxiiwioS3zetZMdZA6zwFRGicnLDrJCDO1hlOhua2ABqWITsJKY2L6KEcTmFbCT
 WLxhOjuIzSKgKnH2zGWwGlGBCIkz71ewQNQISpyc+QTM5hSwlJi04gVYPTPQtj/zLjFD2OIS
 t57MZ4Kw5SW2v53DPIFRaBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiQ73ixNzi0rx0veT8
 3E2MwKjaduzn5h2MlzYGH2IU4GBU4uH1mBYVK8SaWFZcmXuIUYKDWUmEt2IOUIg3JbGyKrUo
 P76oNCe1+BCjKdBzE5mlRJPzgRGfVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUg
 tQimj4mDU6qBMYah6fm84FkBqcY8Ty7P2/iLec5ztxsvGPd3VRyU/y3f/UXq+X6HnBuF89+c
 5/i6Vm1G+LncurNmgXzm05sjXiSki5/cOH2PQZx5mFJ17uMlhTcOeDcL7AypmdCQ6zTryZJU
 qziGHTvEJnZ/zfaPmnjGo+aVYO3+t77+ZS2bbieaLv58dmlTkRJLcUaioRZzUXEiAMxcGbDA
 AgAA
X-CMS-MailID: 20190819140252eucas1p1fc087ca9ea3523ef448ce28498e5c977
X-Msg-Generator: CA
X-RootMTR: 20190724131908epcas2p473bd151e9c12b90d6dc9c4a39b522e3a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190724131908epcas2p473bd151e9c12b90d6dc9c4a39b522e3a
References: <CGME20190724131908epcas2p473bd151e9c12b90d6dc9c4a39b522e3a@epcas2p4.samsung.com>
 <20190724131900.2039-1-hslester96@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566223373;
 bh=f1rgvunrUpzZG+u9msffuBeFeKzI44ZL7IqCjQKLz1g=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=fnE92YcaHdflCIeMeQkYh958JtJHLfOyjfpQOImXDziEGpz/7EBVZ6yEGweNrDNTI
 eBPzrRXSmOor0WnrQszysk9/ZofMeLplSKkmm7q9zvQDNF/rn+U9c/s3i9Pt2GiON5
 zZ85+1XMY5rtOAtV/mJTr7XmXueu3oMkiZ0BjqOg=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjQvMTkgMzoxOSBQTSwgQ2h1aG9uZyBZdWFuIHdyb3RlOgo+IEluc3RlYWQgb2YgdXNp
bmcgdG9fcGNpX2RldiArIHBjaV9nZXRfZHJ2ZGF0YSwKPiB1c2UgZGV2X2dldF9kcnZkYXRhIHRv
IG1ha2UgY29kZSBzaW1wbGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENodWhvbmcgWXVhbiA8aHNs
ZXN0ZXI5NkBnbWFpbC5jb20+ClBhdGNoIHF1ZXVlZCBmb3IgdjUuNCwgdGhhbmtzLgoKQmVzdCBy
ZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0
ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
