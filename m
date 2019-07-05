Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B358E6088F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 17:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E0D6E4DD;
	Fri,  5 Jul 2019 15:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63766E4DD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 15:00:58 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190705150057euoutp01ce3e552f3b8d4356883cf0e803aaef89~uiunDmU4x2295122951euoutp01V
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 15:00:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190705150057euoutp01ce3e552f3b8d4356883cf0e803aaef89~uiunDmU4x2295122951euoutp01V
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190705150056eucas1p2962a94d83c842bd45683fcc8bc2a6d1e~uiumo58iL0759907599eucas1p2-;
 Fri,  5 Jul 2019 15:00:56 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 65.A5.04325.8266F1D5; Fri,  5
 Jul 2019 16:00:56 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190705150056eucas1p219959ec433457ff884c9c3bcdf8baadb~uiul7uEKZ0031000310eucas1p2V;
 Fri,  5 Jul 2019 15:00:56 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190705150055eusmtrp1e60e61430e6441af58406f10348db1df~uiultoWW60378503785eusmtrp1e;
 Fri,  5 Jul 2019 15:00:55 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-e8-5d1f66289b89
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A0.46.04146.7266F1D5; Fri,  5
 Jul 2019 16:00:55 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190705150055eusmtip1fa6ef723a0ebf6332e8e9ab8b7628510~uiulQ9VCy1908119081eusmtip1L;
 Fri,  5 Jul 2019 15:00:55 +0000 (GMT)
Subject: Re: [PATCH 07/11] video: fbdev: wm8505fb: convert platform driver
 to use dev_groups
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <3331c596-8150-3113-fc92-ffc72d7565c1@samsung.com>
Date: Fri, 5 Jul 2019 17:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190704142602.GB6281@kroah.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djP87oaafKxBr/uqlhMmvGf2eLK1/ds
 Fl0LDSyaF69ns9j0+BqrxYm+D6wWl3fNYbNoubyC2WL1nhfMDpwem1doeeyfu4bd4373cSaP
 zUvqPc7/b2H3+LxJLoAtissmJTUnsyy1SN8ugSvj/OvDrAXbWCsOTjjK2sB4jqWLkZNDQsBE
 YuuCZexdjFwcQgIrGCWWrO9mhHC+MErcf3UdKvOZUaJ3agsjTMvcRU/ZQGwhgeWMEm3XBSGK
 3jJKnFn8gxUkISwQJ9HY1MwOYosIGEv0n50FNolZYC6TxL+Xu8AmsQlYSUxsXwVm8wrYSTxd
 9wVsKouAisTjRZ1gg0QFIiTuH9vAClEjKHFy5hOwwzkF9CR2vG5mArGZBcQlbj2ZD2XLS2x/
 O4cZZJmEwDF2iam/DrBCnO0icfvrNqivhSVeHd/CDmHLSJye3MMC0bCOUeJvxwuo7u2MEssn
 /2ODqLKWOHz8ItAkDqAVmhLrd+lDhB0lVu14wwwSlhDgk7jxVhDiCD6JSdumQ4V5JTrahCCq
 1SQ2LNvABrO2a+dK5gmMSrOQvDYLyTuzkLwzC2HvAkaWVYziqaXFuempxcZ5qeV6xYm5xaV5
 6XrJ+bmbGIHp6fS/4193MO77k3SIUYCDUYmH94STfKwQa2JZcWXuIUYJDmYlEd7EIKAQb0pi
 ZVVqUX58UWlOavEhRmkOFiVx3mqGB9FCAumJJanZqakFqUUwWSYOTqkGRp40DydfQ6mEN4Yt
 Dk7Pony6N/+9ndfZpqc1ib98b372DrFb3x/NcfnilHhmjWbTwmMrLlmqL9O+ZeDazcqQdmjJ
 Rimf+h9fjth/fRMR8F8vNDa3/rXhsTn9T2oezuWd2fv/mTD7FXXDe+9LZwoHFH2WqnoQ/H7G
 7CTvhay/K9/ckf1c+cR3nxJLcUaioRZzUXEiANcQNw1LAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t/xu7rqafKxBrsnGFlMmvGf2eLK1/ds
 Fl0LDSyaF69ns9j0+BqrxYm+D6wWl3fNYbNoubyC2WL1nhfMDpwem1doeeyfu4bd4373cSaP
 zUvqPc7/b2H3+LxJLoAtSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384m
 JTUnsyy1SN8uQS/j/OvDrAXbWCsOTjjK2sB4jqWLkZNDQsBEYu6ip2wgtpDAUkaJu6tsuxg5
 gOIyEsfXl0GUCEv8udYFVMIFVPKaUeLRm2Vg9cICcRJHl7azgtgiAsYS/WdnsYMUMQvMZZJ4
 /+ANC0THNkaJvgsrmUCq2ASsJCa2r2IEsXkF7CServsCNolFQEXi8aJOsEmiAhESZ96vYIGo
 EZQ4OfMJmM0poCex43Uz2BxmAXWJP/MuMUPY4hK3nsyHistLbH87h3kCo9AsJO2zkLTMQtIy
 C0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIHRuO3Yz807GC9tDD7EKMDBqMTDe8JJ
 PlaINbGsuDL3EKMEB7OSCG9iEFCINyWxsiq1KD++qDQntfgQoynQcxOZpUST84GJIq8k3tDU
 0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA+NC6fN3XJN/bPw5T7R1w+rb
 Ylk2aZcu/w+fdm1TkPwWo+8NjbbT5l83fq7t47/xfr2jmKARG3d859lrc9lqFprYcr2IVvmq
 Oeeag/VkkUdCm0PdNvXUORv933Io8nN2F/vvJ4JhoqvDxWR2z+g/JLZ9zYslNdfrvmiuvnXl
 28JpM5rY1616rRGkxFKckWioxVxUnAgAT5bQTtwCAAA=
X-CMS-MailID: 20190705150056eucas1p219959ec433457ff884c9c3bcdf8baadb
X-Msg-Generator: CA
X-RootMTR: 20190704142610epcas2p1f2dcbf38ea660bc26d306f2c0e1c71ca
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190704142610epcas2p1f2dcbf38ea660bc26d306f2c0e1c71ca
References: <20190704084617.3602-1-gregkh@linuxfoundation.org>
 <CGME20190704142610epcas2p1f2dcbf38ea660bc26d306f2c0e1c71ca@epcas2p1.samsung.com>
 <20190704142602.GB6281@kroah.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562338857;
 bh=/xUJ1oGUicspsjfxf97qw5gPt2tN+F48Se31VAevREk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=iYuz9EdCk1v2sAhI82oVH4E+8CQ6457KUjT5qRdZmcFvyvsFBWLh3O7skMMxZC2Ab
 KJxG3PFOZDbv1bah35ARwdktDymkY50RtNz3u2SgSaI/EdnvoEttNQtIoF0Q7ZgEnG
 7VQaLHQxagTlIOyiDSfO22FX2pizFFHz/Z+cmkY8=
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
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Tony Prisk <linux@prisktech.co.nz>, Andy Shevchenko <andy@infradead.org>,
 Darren Hart <dvhart@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvNC8xOSA0OjI2IFBNLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gUGxhdGZvcm0g
ZHJpdmVycyBub3cgaGF2ZSB0aGUgb3B0aW9uIHRvIGhhdmUgdGhlIHBsYXRmb3JtIGNvcmUgY3Jl
YXRlCj4gYW5kIHJlbW92ZSBhbnkgbmVlZGVkIHN5c2ZzIGF0dHJpYnV0ZSBmaWxlcy4gIFNvIHRh
a2UgYWR2YW50YWdlIG9mIHRoYXQKPiBhbmQgZG8gbm90IHJlZ2lzdGVyICJieSBoYW5kIiBhIHN5
c2ZzIGZpbGUuCj4gCj4gQ2M6IFRvbnkgUHJpc2sgPGxpbnV4QHByaXNrdGVjaC5jby5uej4KPiBD
YzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgo+
IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPgpBY2tlZC1ieTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2ll
QHNhbXN1bmcuY29tPgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6
ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
