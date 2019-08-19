Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9361E925BE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFCC6E133;
	Mon, 19 Aug 2019 14:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1786E133
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:02:27 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190819140226euoutp027372b1be83b10474269d6b7f90cb96a6~8V9XHME7d0057200572euoutp02e
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:02:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190819140226euoutp027372b1be83b10474269d6b7f90cb96a6~8V9XHME7d0057200572euoutp02e
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190819140225eucas1p13d915e6b8251ee484c7d1b0b9bbdbca9~8V9WoHy-b1971019710eucas1p1B;
 Mon, 19 Aug 2019 14:02:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F7.E5.04469.1FBAA5D5; Mon, 19
 Aug 2019 15:02:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190819140224eucas1p2f31f721b2ba3bcc3f561c9ee7236422a~8V9V1fEAB1286512865eucas1p2a;
 Mon, 19 Aug 2019 14:02:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190819140224eusmtrp2fbefb65aaacdc43ea3f7d34d472b9793~8V9V07Wfx3080230802eusmtrp2X;
 Mon, 19 Aug 2019 14:02:24 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-4c-5d5aabf1a5e3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8D.D4.04117.0FBAA5D5; Mon, 19
 Aug 2019 15:02:24 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190819140224eusmtip11f2a1b73203fe1055117a8fd78c48298~8V9Ves0B_0431304313eusmtip1-;
 Mon, 19 Aug 2019 14:02:24 +0000 (GMT)
Subject: Re: [PATCH] fbdev: sm712fb: Use dev_get_drvdata
To: Chuhong Yuan <hslester96@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <a7de5851-1b7c-bab5-4e3a-4d1fd5f6b65e@samsung.com>
Date: Mon, 19 Aug 2019 16:02:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190724131744.1709-1-hslester96@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djPc7ofV0fFGjz4wWVx5et7NovZh14y
 W5zo+8BqcXnXHDaLA6enMFusWbKH0YHNY+esu+we97uPM3k8v/+UzePzJrkAligum5TUnMyy
 1CJ9uwSujNe/1jMXHGWqmDg/pIGxh6mLkZNDQsBEonFnI5DNxSEksIJR4v2GsywQzhdGiX07
 2tghnM+MEuvuzGWHadl9+ShUYjmjxPfPG9ggnLeMEv/vXwOrEhawkHjf/BPMFhFQl/i8aydY
 B7PAbkaJlQ9fsYIk2ASsJCa2r2IEsXkF7CS23ZoIFmcRUJXYtm4KM4gtKhAhcf/YBlaIGkGJ
 kzOfsIDYnAKWEr0zQTZzAg0Vl7j1ZD4ThC0vsf3tHGaQZRICy9glft7byAZxt4vEp+0XGCFs
 YYlXx7dA/SMj8X/nfCaIhnWMEn87XkB1b2eUWD75H1S3tcTh4xeBzuAAWqEpsX6XPkTYUeJC
 /zU2kLCEAJ/EjbeCEEfwSUzaNp0ZIswr0dEmBFGtJrFh2QY2mLVdO1cyT2BUmoXktVlI3pmF
 5J1ZCHsXMLKsYhRPLS3OTU8tNsxLLdcrTswtLs1L10vOz93ECEw5p/8d/7SD8eulpEOMAhyM
 Sjy8HtOiYoVYE8uKK3MPMUpwMCuJ8FbMAQrxpiRWVqUW5ccXleakFh9ilOZgURLnrWZ4EC0k
 kJ5YkpqdmlqQWgSTZeLglGpgjNHkPiq0ttmQk53/AO9WRU/2WwYFi5wXXNcXdxOfuj7aSGTK
 2/kcrL+Vfj+KuM+odUQzvn59lMNV08f5r00k5048aLfl8FGltElHl7kWvCq9+yi5pSppQnSh
 QWD9r3KWmzM6v6clL9JjS86eV1GR9M9Suk6Z37HXvqzds3PPnJo1DMteZl5UYinOSDTUYi4q
 TgQAXLrWBjUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xu7ofVkfFGqx5o2Zx5et7NovZh14y
 W5zo+8BqcXnXHDaLA6enMFusWbKH0YHNY+esu+we97uPM3k8v/+UzePzJrkAlig9m6L80pJU
 hYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jNe/1jMXHGWqmDg/
 pIGxh6mLkZNDQsBEYvflo+xdjFwcQgJLGSUO3ZkH5HAAJWQkjq8vg6gRlvhzrYsNouY1o8Tf
 E+uYQRLCAhYS75t/soPYIgLqEp937QQbxCywm1Hi+O3PzBAdPYwSRxauAatiE7CSmNi+ihHE
 5hWwk9h2ayIriM0ioCqxbd0UsKmiAhESZ96vYIGoEZQ4OfMJmM0pYCnRO3MDG4jNDLTtz7xL
 zBC2uMStJ/OZIGx5ie1v5zBPYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0
 L10vOT93EyMwwrYd+7llB2PXu+BDjAIcjEo8vB7TomKFWBPLiitzDzFKcDArifBWzAEK8aYk
 VlalFuXHF5XmpBYfYjQFem4is5Rocj4w+vNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5ak
 ZqemFqQWwfQxcXBKNTBKrZKe9ZPzgKxzt6yle/KZk2n9fEc3SKapBnm9kti/LZdpgmb/sTR1
 x+mK1/if84VfC+O1zvdQqv/rYrVgT+sql02f533ys+q2OydvfqylPzLqzJNXkZk+YrNTvzjX
 rLXgairg+KVj/FDm0NfDjmd6KxeX/WyVcfyyJvO87O2lR27vrt31/KASS3FGoqEWc1FxIgBK
 i/amxgIAAA==
X-CMS-MailID: 20190819140224eucas1p2f31f721b2ba3bcc3f561c9ee7236422a
X-Msg-Generator: CA
X-RootMTR: 20190724131753epcas2p421536b8d2d873766882bea0e3ea4f351
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190724131753epcas2p421536b8d2d873766882bea0e3ea4f351
References: <CGME20190724131753epcas2p421536b8d2d873766882bea0e3ea4f351@epcas2p4.samsung.com>
 <20190724131744.1709-1-hslester96@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566223346;
 bh=jVgWyfwh3DFFBSBvPWE28F27h1CfoutZzZUgQq+jAik=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=BYJgNmKlDl1UgIDktTWZkfincciHXaJNloevc2qD0jGUxEGTbpG1HJuIqcIW7Ie/N
 WK9hDmJB+3mYAsm5Z5rg4aHVK4FXEgLm6zIRBxO60VAFn3RdLSMk1eCF25Txe9vt7N
 VoOxREo5c/VoRwkgFRd3aNYGxpUvShNwlKJzOcjs=
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
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, dri-devel@lists.freedesktop.org,
 Teddy Wang <teddy.wang@siliconmotion.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjQvMTkgMzoxNyBQTSwgQ2h1aG9uZyBZdWFuIHdyb3RlOgo+IEluc3RlYWQgb2YgdXNp
bmcgdG9fcGNpX2RldiArIHBjaV9nZXRfZHJ2ZGF0YSwKPiB1c2UgZGV2X2dldF9kcnZkYXRhIHRv
IG1ha2UgY29kZSBzaW1wbGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENodWhvbmcgWXVhbiA8aHNs
ZXN0ZXI5NkBnbWFpbC5jb20+ClBhdGNoIHF1ZXVlZCBmb3IgdjUuNCwgdGhhbmtzLgoKQmVzdCBy
ZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0
ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
