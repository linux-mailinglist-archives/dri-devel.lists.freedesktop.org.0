Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9DA71A02
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 16:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2740B6E2C1;
	Tue, 23 Jul 2019 14:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F7A6E2C1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 14:12:37 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190723141236euoutp01baf5a348f0c8f02b563d91485eeac50f~0DriC-uU81686116861euoutp01g
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 14:12:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190723141236euoutp01baf5a348f0c8f02b563d91485eeac50f~0DriC-uU81686116861euoutp01g
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190723141235eucas1p27d64c42cbc55c0e06f7b14e1546cc028~0DrhvHRqQ0710607106eucas1p2q;
 Tue, 23 Jul 2019 14:12:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3C.75.04325.3D5173D5; Tue, 23
 Jul 2019 15:12:35 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190723141234eucas1p1774e2e216bae04eef993a75bbba92f7b~0Drg3bR7k2028220282eucas1p1n;
 Tue, 23 Jul 2019 14:12:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190723141234eusmtrp1b36bef0cec6a696ee564ef114af9e9c2~0Drgs0hOY0078900789eusmtrp1s;
 Tue, 23 Jul 2019 14:12:34 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-c6-5d3715d3a202
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 53.A8.04140.2D5173D5; Tue, 23
 Jul 2019 15:12:34 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190723141234eusmtip2a8769115c1e58f6f90e13544f81288de~0DrgWy0mY2221222212eusmtip2E;
 Tue, 23 Jul 2019 14:12:34 +0000 (GMT)
Subject: Re: [PATCH] fbdev: Ditch fb_edid_add_monspecs
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <eb13e720-85a0-8828-ecbc-76968032b677@samsung.com>
Date: Tue, 23 Jul 2019 16:12:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8d925bb9-0769-bc1a-20df-a7fa33e84bae@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe3fO2TkTJ69HzQeVgkGFUs4wdN20wA8rIu1LWGG19KSSNzY1
 LSHDpWuaZIraXF7yLmFL85pZTXDekEwjtbykghVokVleSmseJb/9nv9z/cPDEKyBcmBCI6I5
 ZYQiTCK0IOvbF3v39Nt5Brh1GJ1lRR9HCFl5TzUhG5j/KpR1pH+jZP3NeqGsLKkAySbSZ+gj
 tPz5z0JS3qQboeXFLZ8F8o7cZVI+lmoSyOdqtvkJz1ocCuLCQmM5pdTrokXIwOxtOmqCiMtL
 niQS0YpAi0QM4H3wNmuU1iILhsUVCJZmb5F88ANB7XQ7xQdzCCaXSoUbLQ8622gzs7gcgSE/
 ii+aQdDYOUCZEzbYA3L7h9ZYiA9ARkoVMrMtdgHNqnptBYEXEDzTlqxNEmMvaBiuJ7SIYUi8
 A0YH3M2yHfaHsXYDxZdYQ+f9KdLMIuwNY3XdazqB7WF4qkDA83ZomNET5vmAjTSM579A/NU+
 sKitXmcb+GJ6SvPsBN2ZaSTfUI3gj+bTencDgvLMlXXPB6HN1EeZryOwMzxulvLyUSjK+yAw
 y4CtYHDGmj/CCu7V5xC8LAZNMstX7wRDmUG4sVbbVEncRRLdJmu6TXZ0m+zo/u8tRGQVsudi
 VOHBnMo9grvqqlKEq2Iigl0DI8Nr0L8/6l4xzTei1t+XjAgzSGIpjhN4BrCUIlYVH25EwBAS
 W/GpRI8AVhykiL/GKSMvKGPCOJUROTKkxF58fcv4ORYHK6K5KxwXxSk3sgJG5JCIWg1Zd04r
 h9W+VVszdhd6E13+53cN1ickLb1ObUn7dTnQ2+Td5Zg66VSnT3GU3vCVVgw9Yv1KLd1spTdj
 e0NXE89QlZ7dxWx0v7op/91qlrYn4WHfctz7l1Ulxw/v7xKF1uYsTr/JLnaKO6b4nn3Ssk25
 oPaNfeJTe0KvqbN+NT4pIVUhir0uhFKl+At4UZuGQwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xe7qXRM1jDZ6s0bVY+PAus8XyM+uY
 La58fc9mcaLvA6vF5V1z2CyWNc9ntHjU95bdgd1j77cFLB47Z91l91i85yWTx4kZv1k87ncf
 Z/L4vEkugC1Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI
 3y5BL+PKu072gkfMFbPbHjM3MP5j6mLk5JAQMJGYe/IwexcjF4eQwFJGiSlfX7J0MXIAJWQk
 jq8vg6gRlvhzrYsNouY1o8SC22vZQBLCAmYSMy7fZAWx2QSsJCa2r2IEsUUEtCQ6/rewgDQw
 C/xglLh95y4TRHcnk8SypwfBVvMK2Elsv7WNGWQbi4CqxL0rxiBhUYEIiTPvV7BAlAhKnJz5
 BMzmFLCXuL/1NNgyZgF1iT/zLjFD2OISt57MZ4Kw5SW2v53DPIFRaBaS9llIWmYhaZmFpGUB
 I8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwPjbduznlh2MXe+CDzEKcDAq8fBWMJnHCrEm
 lhVX5h5ilOBgVhLhDWwwixXiTUmsrEotyo8vKs1JLT7EaAr020RmKdHkfGBqyCuJNzQ1NLew
 NDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwJi1i/3tneaJnGe0L+5zePE6ZvOn
 ooaAhIO7237W297SFRZ5neI1STtOKKX9gbvbjn3GX+9ITe+Smpw+2XH6J8nVP0RO51e/TG8x
 aBT/qMRxl/XEpZnrlp6oe7dz9WoZVUkLdpHSN2YNNwRrlfRdQnwaZh/Y669mt/uR8qQLP1iT
 Ex4yLHp0eZoSS3FGoqEWc1FxIgCattMl1QIAAA==
X-CMS-MailID: 20190723141234eucas1p1774e2e216bae04eef993a75bbba92f7b
X-Msg-Generator: CA
X-RootMTR: 20190721203902epcas2p22e8ac33f84bcfb1a414c02d6c8770d91
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190721203902epcas2p22e8ac33f84bcfb1a414c02d6c8770d91
References: <20190721201956.941-1-daniel.vetter@ffwll.ch>
 <CGME20190721203902epcas2p22e8ac33f84bcfb1a414c02d6c8770d91@epcas2p2.samsung.com>
 <CAHk-=wiaHB_0bS_x=p-xeyp7bW7bGgkZ9QkXe6SS9axu7OP95w@mail.gmail.com>
 <8d925bb9-0769-bc1a-20df-a7fa33e84bae@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563891156;
 bh=ShAMdXScdHTPCOZKjFf2HAKollyBOtj92ZOUl4l2vpA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=QRulQBL7O7fkLu/taCbtRNrBEEPLt3ICDfdOZgTywwnwBse/qD/9IwAc40ku/LB9a
 IRzsjatgWuE5rfgNAh+WbS+VKu7zPZyfTQFCfehkyBDM8ezOP44GnO+czOpJ0CLu51
 uVjuluHExzggynZeMxmotFk5sfyUVxhF6AqoukWo=
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
Cc: linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tavis Ormandy <taviso@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjIvMTkgMzo1MiBQTSwgQmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPiAK
PiBPbiA3LzIxLzE5IDEwOjM4IFBNLCBMaW51cyBUb3J2YWxkcyB3cm90ZToKPj4gT24gU3VuLCBK
dWwgMjEsIDIwMTkgYXQgMToyMCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPiB3cm90ZToKPj4+Cj4+PiBJdCdzIGRlYWQgY29kZSBldmVyIHNpbmNlCj4+Cj4+IExvdmVs
eS4gQWNrLgo+IAo+IEdvb2QgY2F0Y2ggaW5kZWVkLgo+IAo+IFRoYW5rcyBEYW5pZWwsIEknbGwg
cXVldWUgaXQgZm9yIHY1LjQgbGF0ZXIuCgpQYXRjaCBxdWV1ZWQgZm9yIHY1LjQgKHRvIGRybS1t
aXNjLW5leHQgdHJlZSkgbm93LCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWog
Wm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0
cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
