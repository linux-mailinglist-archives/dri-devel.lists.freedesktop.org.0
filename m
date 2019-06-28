Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5663C59C2F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3CC6E8E7;
	Fri, 28 Jun 2019 12:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E016E8E7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:58:40 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628125838euoutp02f342b2585969fcfc5dbbcbd4721ae8fa~sXi0f6Q2z0793207932euoutp020
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:58:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190628125838euoutp02f342b2585969fcfc5dbbcbd4721ae8fa~sXi0f6Q2z0793207932euoutp020
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190628125837eucas1p117ade18f8ad2f92ca5b5d444c1f33336~sXiz1d8Ax0757307573eucas1p1P;
 Fri, 28 Jun 2019 12:58:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 30.5A.04377.DFE061D5; Fri, 28
 Jun 2019 13:58:37 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190628125836eucas1p26db88c2fc26c7fdfbc9015a0c5252e1a~sXiy5cATZ1701517015eucas1p2P;
 Fri, 28 Jun 2019 12:58:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190628125836eusmtrp282053a9d728b660cbaafa6575e430aee~sXiyrSAiU0722007220eusmtrp2m;
 Fri, 28 Jun 2019 12:58:36 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-98-5d160efdb846
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C9.34.04140.CFE061D5; Fri, 28
 Jun 2019 13:58:36 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190628125836eusmtip27d2be573ba8b7c8512826cc4a44f92b2~sXiyJxH5i0729607296eusmtip2e;
 Fri, 28 Jun 2019 12:58:36 +0000 (GMT)
Subject: Re: [PATCH 01/12] backlight: gpio: allow to probe non-pdata devices
 from board files
To: Bartosz Golaszewski <brgl@bgdev.pl>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <bec514d8-a005-5c10-7770-d6fcd541ded4@samsung.com>
Date: Fri, 28 Jun 2019 14:58:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-2-brgl@bgdev.pl>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+87ZOTuOJp9z6atdGVRU5OwGJ5OoMDgFZf0RpCG68jStbcqW
 ZVclcuUiK5PKZSp2MS10WGhTKVrNaRdDFBPNZrXAyqXorAztcjxK/vf73vd5eJ8HPoZUuKlQ
 JtlwgDcaNDoVLZNUN4w0Lx3zD4oLf9eygPVdfy5ha3uqafZlX7eULckMYtuG+2n2ji9fyn66
 /5Fg3cNOxOaNlhJs1cd2im3MGaDY1toCmn18zkask3P9HVlS7kZ7F8XZrd1Srqo8m+YGzzdR
 3Nv2eppzn3UR3P2bGZyro4bghqrmbJPFyiITeV3yQd6oXpsgS3p9y0ekmun0rnOjVCbKpizI
 jwG8ErJa+0iBFfgOgpF6nQXJ/rEPwaClUSIuhhD0tYVNGjqbPlGiqBTBo+91SHx4EXwtyScs
 iGECcTw4zGrBoMQLobjiHSFoSOwk4XPrXVpY0DgCLp4uRwLL8Vp44jk1HkmC50OXrWw80gy8
 E9wNNkrUBEBTvmc8kR9eAa/sDwmBSRwMnZ6iCZ4LNd4CUjgGOIsBxw2xG+AoKDHfo0UOhC+u
 B1KRZ8EfexEhGioQjJ3pnXDXICi99HvCsQaeuloooRqJF0FlrVocr4fON3VSYQzYHzq8AWII
 f8itvkKKYzmcMStE9QKw3bbRk2ct9jLyAlJZp1SzTqljnVLH+v9uMZKUo2A+zaTX8qblBv5Q
 mEmjN6UZtGF7UvRV6N+3e/Hb5XuIakd3OxBmkGq6vFgWFKegNAdNh/UOBAypUspDmpVxCnmi
 5vAR3pgSb0zT8SYHmslIVMHyo9N6dimwVnOA38/zqbxxckswfqGZaEflhwFlSERjfMyJTH3q
 htXHCzce2/d+3q+o06OXyZMDCf3DGRtio3d7vkWPBRZm5zuznUMGr3azetpQ3pX4gNUPml/+
 yaMcWauW6LzK3Nl30323gut/aq0/7OqYZw05m9JnNbRtPau8djXIKf/s2dITFrX9UG/C4NwX
 4bgjci+lt6okpiTNssWk0aT5C0HcfRJyAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsVy+t/xe7p/+MRiDc5c07L4MvcUi8WuB9vY
 LM68uctusahBzOLK1/dsFiu+zGS3eLr5MZPF/a9HGS2m/FnOZLHp8TVWixN9H1gtLu+aw2ax
 v3cDkwOvx/sbrewei6/dZvXYOesuu8emVZ1sHp/6T7J63Lm2h83jfvdxJo/NS+o9jt/YzuTx
 eZNcAFeUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2C
 Xsb5pV+YCtrYKm73/mFtYOxk7WLk5JAQMJG4dfIpkM3FISSwlFHi6bImti5GDqCEjMTx9WUQ
 NcISf651sUHUvGaU6J/zjxGkRlggXuJQmz5IjYiAusSCdfeYQGqYBY4zSyx8MYUNJCEksJ5R
 YtMSTxCbTcBKYmL7KkYQm1fATuLgkxawI1gEVCVub1jJDGKLCkRInHm/ggWiRlDi5MwnYDan
 gLHE2Z07mEBsZqBlf+ZdYoawxSVuPZkPFZeX2P52DvMERqFZSNpnIWmZhaRlFpKWBYwsqxhF
 UkuLc9Nzi430ihNzi0vz0vWS83M3MQKje9uxn1t2MHa9Cz7EKMDBqMTDu4BLLFaINbGsuDL3
 EKMEB7OSCK/kOZFYId6UxMqq1KL8+KLSnNTiQ4ymQM9NZJYSTc4HJp68knhDU0NzC0tDc2Nz
 YzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2MGldzvQSD45nTk++qz/W3jRc7Fi+Y08f9
 VMd/gb/FUaUtznyRJ9s/zm59oHDm8oG7H7LCl0/64in6Q3vPulP/+pTOBZyd/sx/boxD3eU+
 89PKUzynRMza8rmYy/vs7saKNZ0hfHzGKTHxXnOW7L2ksJGFbx7fdo7o1y+19R1NJ/L/cdif
 eilJiaU4I9FQi7moOBEAbTZJqwQDAAA=
X-CMS-MailID: 20190628125836eucas1p26db88c2fc26c7fdfbc9015a0c5252e1a
X-Msg-Generator: CA
X-RootMTR: 20190625163457epcas3p2e246a27cb3ec0f0ffa48d32561ff3972
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190625163457epcas3p2e246a27cb3ec0f0ffa48d32561ff3972
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <CGME20190625163457epcas3p2e246a27cb3ec0f0ffa48d32561ff3972@epcas3p2.samsung.com>
 <20190625163434.13620-2-brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561726718;
 bh=+fXjqMD80dTEeznXW+urjzkEHk1O/732pqOUC3IDfkY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ZkaWLVUL/EDXvoRU+nPTD+5uB4JPBVfqwGgNBXD662dRx11Kh6eZQk3XZAse4DO8E
 8dLELWVvCGbqSzbr7mzD6px75tuYqA64KoyUkuOyWvhUdWG4OI94vEbExQeN+c1AKC
 vacLiBG9VSo9sPkdgYgmskyWCT2TGCHyIUeH3FnQ=
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
 Jingoo Han <jingoohan1@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjUvMTkgNjozNCBQTSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBGcm9tOiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IAo+IEN1cnJl
bnRseSB3ZSBjYW4gb25seSBwcm9iZSBkZXZpY2VzIHRoYXQgZWl0aGVyIHVzZSBkZXZpY2UgdHJl
ZSBvciBwYXNzCj4gcGxhdGZvcm0gZGF0YSB0byBwcm9iZSgpLiBSZW5hbWUgZ3Bpb19iYWNrbGln
aHRfcHJvYmVfZHQoKSB0bwo+IGdwaW9fYmFja2xpZ2h0X3Byb2JlX3Byb3AoKSBhbmQgdXNlIGdl
bmVyaWMgZGV2aWNlIHByb3BlcnRpZXMgaW5zdGVhZAo+IG9mIE9GIHNwZWNpZmljIGhlbHBlcnMu
IFJldmVyc2UgdGhlIGxvZ2ljIGNoZWNraW5nIHRoZSBwcmVzZW5jZSBvZgo+IHBsYXRmb3JtIGRh
dGEgaW4gcHJvYmUoKS4gVGhpcyB3YXkgd2UgY2FuIHByb2JlIGRldmljZXMoKSByZWdpc3RlcmVk
Cj4gZnJvbSBtYWNoaW5lIGNvZGUgdGhhdCBuZWl0aGVyIGhhdmUgYSBEVCBub2RlIG5vciB1c2Ug
cGxhdGZvcm0gZGF0YS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
Z29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgoKUmV2aWV3ZWQtYnk6IEJhcnRsb21pZWogWm9sbmll
cmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KCkJlc3QgcmVnYXJkcywKLS0KQmFy
dGxvbWllaiBab2xuaWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1
bmcgRWxlY3Ryb25pY3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
