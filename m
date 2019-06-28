Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD47F59C7F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 15:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC486E8E2;
	Fri, 28 Jun 2019 13:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4A06E8E2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 13:05:00 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628130458euoutp01fd806916331b70069b1e5cc324f072cc~sXoWXUmw50843308433euoutp01d
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 13:04:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190628130458euoutp01fd806916331b70069b1e5cc324f072cc~sXoWXUmw50843308433euoutp01d
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190628130457eucas1p11b07b8522b1efb5aea30bce4fc5480e4~sXoVlntXp0068300683eucas1p1j;
 Fri, 28 Jun 2019 13:04:57 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3A.73.04325.970161D5; Fri, 28
 Jun 2019 14:04:57 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190628130457eucas1p1d35ba783154258f803c027c93c2fb552~sXoU5u6OE0065000650eucas1p1A;
 Fri, 28 Jun 2019 13:04:57 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190628130456eusmtrp10bb31dbc43c50b404d0533e529f67cb8~sXoUrmyDQ2089920899eusmtrp1f;
 Fri, 28 Jun 2019 13:04:56 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-09-5d161079319f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 9E.3C.04146.870161D5; Fri, 28
 Jun 2019 14:04:56 +0100 (BST)
To: undisclosed-recipients:;
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190628130456eusmtip18b5d49eeac50f43f6cdfe3e974afce51~sXoUGs2d_1045810458eusmtip1b;
 Fri, 28 Jun 2019 13:04:56 +0000 (GMT)
Subject: Re: [PATCH 10/12] fbdev: da8xx-fb: use
 devm_platform_ioremap_resource()
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <791c1eed-ad83-3155-8736-9c199f27ad3e@samsung.com>
Date: Fri, 28 Jun 2019 15:04:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-11-brgl@bgdev.pl>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfSxVcRjud8/HPe66+rnEm6za2bJpQ61WJ5nV1h/nr9b6LqOOnGEhuycK
 FW2Fbt/dDJeKkiupfDQiYaxuxTSl6640RImyqy5tFZZ7z7X897zP+z6/533e/RhC84nyZmLi
 j4jaeCGWpVVkzfPfHf7J2DNs5Y1hlhu//ork6vtqaK79+0cldyvdk+uasNJc6XiekvtcPaDg
 eieeIe7apFHBVQ2YKe7FxTGKe1tfQHNNFyoUG9W81XJGyd82f6D4OsNHJV9Vdpbmf156SfE9
 5gaa7z1nUvDVxWm8yVKr4G1VS7aq9qmCI8XYmCRRGxhyQBVdVqJHCX3EsencUjId5RA65MIA
 XgOVb3IVOqRiNLgUQXaGlZKLcQSWd8NILmwIPgz9pmclOdk9tNwwIigx9jve8sA+cD1/wCkf
 RTDScM6hcMfbwGSqJOwNAo8QYDmd51DQOAiuZJYhO1bjEOjO6HXwJF4Omc21SjteiPdA7/MK
 Sp5xg5d5g6Qdu8ys0XamyMET2AveD95UyHgp1I4WOMwAn2JAPzGmlPfeDMa3N5yx3WHE9MjJ
 +0Cb/jwpCx4gmMr66lTXIjDqp52pN0CrqXPGjpmx8IOH9YEyvQme/B1w0IBdwTLqJi/hCldr
 7Ce202rIytDI075QUVJBz9rq6u4SlxFrmBPNMCeOYU4cw3/fQkSWIS8xUYqLEqXV8eLRAEmI
 kxLjowIOHo6rQjM/r23aNPEYNU5GtCDMIHa+ulDlGaahhCQpOa4FAUOwHupFHR5hGnWkkJwi
 ag/v1ybGilILWsyQrJc6dV5fqAZHCUfEQ6KYIGpnuwrGxTsd7bAabY+8bSfvrB3KWhaU9W5Z
 M+WjDje7875d9/w12zon2d1KM9tQ+WtKCk+07mrUp8UuHm4tzjyY7x2SiSO26Jp2fiFK7rss
 +jHVGBxx9lnKixPrYso9W9dTTRBaHJnaI1hHOt3wUHlH+/bjRbDSd6/Q/frpt76uBTZJ5/en
 nyWlaGHVCkIrCf8A6+4jNHUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMIsWRmVeSWpSXmKPExsVy+t/xu7oVAmKxBhsb9Sy+zD3FYrHrwTY2
 izNv7rJbLGoQs7jy9T2bxYovM9ktnm5+zGRx/+tRRospf5YzWWx6fI3V4kTfB1aLy7vmsFns
 793A5MDr8f5GK7vH4mu3WT12zrrL7rFpVSebx6f+k6wed67tYfO4332cyWPzknqP4ze2M3l8
 3iQXwBWlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5eg
 l7Fq2WTGggfMFf9mrGBpYJzO3MXIySEhYCIxfeodti5GLg4hgaWMEm3TTjGCJEQEZCTmzn7M
 2sXIAVQkI3F8fRlEvbDEn2tdUPWvGSXezb0DVi8sECRx/PhGZpAEs8AbZomvZ5+xQlRtAJq6
 djJYFZuAlcTE9lVgNq+AncT1tvtgZ7AIqEq0H9jODmKLCkRInHm/ggWiRlDi5MwnYDYn0Kmn
 WxeygtjMAuoSf+ZdYoawxSVuPZnPBGHLS2x/O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqml
 xbnpucWGesWJucWleel6yfm5mxiBEb7t2M/NOxgvbQw+xCjAwajEw7uASyxWiDWxrLgy9xCj
 BAezkgiv5DmRWCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OByafvJJ4Q1NDcwtLQ3Njc2Mz
 CyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjBO3P7PYY69ak3XwjpdEsem2c+bu7Ym7j9WX
 NjdmH5rrKH0mwGhR4eNtZou4c9imPYvkW1YpL6a86sWaWauWxH9Wq57JyLKsf2Jq7t9WPsGv
 n/8fjz6qMd+WzZL91g2XEIHv1QbtUjdzxZ8x+etsqM3Zcs03OrHmdv731w+mf2W6cFFwgXrH
 bSWW4oxEQy3mouJEAA2MUigGAwAA
X-CMS-MailID: 20190628130457eucas1p1d35ba783154258f803c027c93c2fb552
X-Msg-Generator: CA
X-RootMTR: 20190625163506epcas1p26885f2898ef4b47cc0449344aea947e9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190625163506epcas1p26885f2898ef4b47cc0449344aea947e9
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <CGME20190625163506epcas1p26885f2898ef4b47cc0449344aea947e9@epcas1p2.samsung.com>
 <20190625163434.13620-11-brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561727098;
 bh=azJ0h6ZVhBwbAHngYmcrBwHJm9Bf5q4qoO5kz4/kjtg=;
 h=To:Subject:Cc:From:Date:In-Reply-To:References:From;
 b=c80/i8+sDotncj2R+VBFeHyvnbfO5CzFJg84o1bdOzxLXm0r+89189J7v8NY8E3MR
 hc5sAhOSaTbbSS/+s1qjqY4LDQUi1QPn53etqNqb7o8Un3EKJWcaaHfUrrbREXW7rn
 8UiG17wgeqwjuG6ny3Jd6rZx8ElkrjZLQ4EpruQY=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjUvMTkgNjozNCBQTSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBGcm9tOiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IAo+IFNocmlu
ayB0aGUgY29kZSBhIGJpdCBieSB1c2luZyB0aGUgbmV3IGhlbHBlciB3cmFwcGluZyB0aGUgY2Fs
bHMgdG8KPiBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UoKSBhbmQgZGV2bV9pb3JlbWFwX3Jlc291cmNl
KCkgdG9nZXRoZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8Ymdv
bGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCkFja2VkLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3
aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21p
ZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVs
ZWN0cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
