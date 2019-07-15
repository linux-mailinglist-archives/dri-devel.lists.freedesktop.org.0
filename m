Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1036883B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 13:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF45E899B0;
	Mon, 15 Jul 2019 11:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774D8899B0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:35:01 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190715113459euoutp023f74d32e79e1bc4d965ec621cb8fed89~xkXpEuF-h0052900529euoutp02j
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:34:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190715113459euoutp023f74d32e79e1bc4d965ec621cb8fed89~xkXpEuF-h0052900529euoutp02j
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190715113459eucas1p15f693e2320dbbd2bcf775538ef550176~xkXoskwew1822918229eucas1p1V;
 Mon, 15 Jul 2019 11:34:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 97.09.04377.3E46C2D5; Mon, 15
 Jul 2019 12:34:59 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190715113458eucas1p16ced6c5303d28fa77c232dac8aa8979c~xkXn9ZaLM3249932499eucas1p1D;
 Mon, 15 Jul 2019 11:34:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190715113458eusmtrp20da04edc4180399cab77519238696a28~xkXnvWuL41624216242eusmtrp2x;
 Mon, 15 Jul 2019 11:34:58 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-9b-5d2c64e3cc8e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 82.77.04146.2E46C2D5; Mon, 15
 Jul 2019 12:34:58 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190715113458eusmtip1daaf872522432a32f452cf1b288ac30b~xkXncM0NI0034400344eusmtip1B;
 Mon, 15 Jul 2019 11:34:58 +0000 (GMT)
Subject: Re: [PATCH] video: radeon.h Fix Shifting signed 32 bit value by 31
 bits problem
To: Shobhit Kukreti <shobhitkukreti@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <46c5dc00-eb00-e229-62af-6e171f9f2a40@samsung.com>
Date: Mon, 15 Jul 2019 13:34:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190706184111.GA13070@t-1000>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djPc7qPU3RiDVZuF7W48vU9m0XX4xcs
 Fpd3zWGzmL1lHrvF3unLWB1YPXbOusvusX/uGnaP+93HmTx+/5jM6PF5k1wAaxSXTUpqTmZZ
 apG+XQJXxtwnL9gL/nJXTLs/i7GBcS5nFyMnh4SAicT2NadYuxi5OIQEVjBK3G34zALhfGGU
 OLv/FROE85lRYvXjVawwLX135jFDJJYzSnSvWgpV9ZZR4t+if0wgVcICURKLn0wG6xAR0JN4
 cmoTmM0s0Mcose5jCojNJmAlMbF9FSOIzStgJ9G/5yQbiM0ioCpxYtUMFhBbVCBC4v6xDawQ
 NYISJ2c+AYtzCuhInP9+AmqmuMStJ/OZIGx5ie1v54BdJyGwil3i0p0HbBBnu0jcb17NCGEL
 S7w6voUdwpaR+L9zPhNEwzpGib8dL6C6tzNKLJ/8D6rbWuLw8YtA6ziAVmhKrN+lDxF2lFh/
 fj8jSFhCgE/ixltBiCP4JCZtm84MEeaV6GgTgqhWk9iwbAMbzNqunSuZJzAqzULy2iwk78xC
 8s4shL0LGFlWMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525iBKac0/+Of9nBuOtP0iFGAQ5G
 JR5ehxTtWCHWxLLiytxDjBIczEoivLZfgUK8KYmVValF+fFFpTmpxYcYpTlYlMR5qxkeRAsJ
 pCeWpGanphakFsFkmTg4pRoY2xK2PJpQe9pu1ocJSzvUls53Xj93TRDXk7qUIpc1l2a0m8oX
 P5vWxj0vIaXG/nJznlDrv7bdK1Z4T9g386Jn9IPNIp8PnJst/ezXaYHIKZYVV+ey58haba1W
 N956U/of0zTdvbs1kvnznt0zt3Wrqp3IEXjANaFJmOm39/PKp6fPXl3yzvhomRJLcUaioRZz
 UXEiAKG5rUk1AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xu7qPUnRiDfZdVbC48vU9m0XX4xcs
 Fpd3zWGzmL1lHrvF3unLWB1YPXbOusvusX/uGnaP+93HmTx+/5jM6PF5k1wAa5SeTVF+aUmq
 QkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJextwnL9gL/nJXTLs/
 i7GBcS5nFyMnh4SAiUTfnXnMXYxcHEICSxkldm2Zz9rFyAGUkJE4vr4MokZY4s+1LjaImteM
 Eq3X7rKDJIQFoiQWP5nMCmKLCOhJPDm1CcwWEqiXePnnMitIA7NAH6PEoZ1L2UASbAJWEhPb
 VzGC2LwCdhL9e06CxVkEVCVOrJrBAmKLCkRInHm/ggWiRlDi5MwnYDangI7E+e8nwBYwC6hL
 /Jl3iRnCFpe49WQ+E4QtL7H97RzmCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6hUn
 5haX5qXrJefnbmIERti2Yz8372C8tDH4EKMAB6MSD69DinasEGtiWXFl7iFGCQ5mJRFe269A
 Id6UxMqq1KL8+KLSnNTiQ4ymQM9NZJYSTc4HRn9eSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB
 9MSS1OzU1ILUIpg+Jg5OqQZGzkwBaeHZHnwuG5dwuz6e/XHlbclUNWemAw3Tnmr4+tVvnryL
 o7H0+mrevwsef8466NJ0928/26Zn56c4hx96/yPsWvy2da/1Kl/Ei/94HMV91Efsx/Yc+buz
 n/wX+bmx+5yvigbbX/EPuR5beiIlPuwP+uKfa3f+0yqV//eOaa8qmWrW4/7NTImlOCPRUIu5
 qDgRAJtg/vvGAgAA
X-CMS-MailID: 20190715113458eucas1p16ced6c5303d28fa77c232dac8aa8979c
X-Msg-Generator: CA
X-RootMTR: 20190706184121epcas2p3e9f8717c9e809f7756b1dfa4665ce1c2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190706184121epcas2p3e9f8717c9e809f7756b1dfa4665ce1c2
References: <CGME20190706184121epcas2p3e9f8717c9e809f7756b1dfa4665ce1c2@epcas2p3.samsung.com>
 <20190706184111.GA13070@t-1000>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563190500;
 bh=MIukH0El9tJcqtJbIIQFsKMKpIMhv4HEJMktrHZYBsk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=LdXEgd4hMqP1S4WLWQeNEwAc7lamXzzu+4mwEAOY/xF3YzxUcaiUuW9tbW+LAzdIy
 +yiGzgLTU4sV/sDVKVp9g5nI8ziJ+ZxmHhodbX+orzh411Ti+QjW3dNLOv+RofdcbE
 TMqqyyT6qdoYGGYRp7Ri0xqjWycU7LtDbZY49xAE=
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvNi8xOSA4OjQxIFBNLCBTaG9iaGl0IEt1a3JldGkgd3JvdGU6Cj4gRml4IFJCMkRfRENf
QlVTWSBhbmQgSE9SWl9BVVRPX1JBVElPX0lOQyBkZWZpbmVzIHRvIHVzZSAiVSIgY2FzdCB0bwo+
IGF2b2lkIHNoaWZ0aW5nIHNpZ25lZCAzMiBiaXQgdmFsdWVzIGJ5IDMxIGJpdCBwcm9ibGVtLiBU
aGlzIGlzIG5vdCBhCj4gcHJvYmxlbSBmb3IgZ2NjIGJ1aWx0IGtlcm5lbC4KPiAKPiBIb3dldmVy
LCB0aGUgaGVhZGVyIGZpbGUgYmVpbmcgYSBwdWJsaWMgYXBpLCBvdGhlciBjb21waWxlcnMgbWF5
IG5vdAo+IGhhbmRsZSB0aGUgY29uZGl0aW9uIHNhZmVseSByZXN1bHRpbmcgaW4gdW5kZWZpbmVk
IGJlaGF2aW9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNob2JoaXQgS3VrcmV0aSA8c2hvYmhpdGt1
a3JldGlAZ21haWwuY29tPgoKV2hpbGUgeW91IGFyZSBhdCBpdCBwbGVhc2UgY29udmVydCByYWRl
b24uaCB0byB1c2UgQklUKCkgbWFjcm8uCgo+IC0tLQo+ICBpbmNsdWRlL3ZpZGVvL3JhZGVvbi5o
IHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdmlkZW8vcmFkZW9uLmggYi9pbmNsdWRlL3Zp
ZGVvL3JhZGVvbi5oCj4gaW5kZXggMDA1ZWFlMS4uY2IwYTVmNiAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL3ZpZGVvL3JhZGVvbi5oCj4gKysrIGIvaW5jbHVkZS92aWRlby9yYWRlb24uaAo+IEBAIC01
MzEsNyArNTMxLDcgQEAKPiAgI2RlZmluZSBSQjJEX0RDX0ZMVVNIXzJECQkJICAgKDEgPDwgMCkK
PiAgI2RlZmluZSBSQjJEX0RDX0ZSRUVfMkQJCQkJICAgKDEgPDwgMikKPiAgI2RlZmluZSBSQjJE
X0RDX0ZMVVNIX0FMTAkJCSAgIChSQjJEX0RDX0ZMVVNIXzJEIHwgUkIyRF9EQ19GUkVFXzJEKQo+
IC0jZGVmaW5lIFJCMkRfRENfQlVTWQkJCQkgICAoMSA8PCAzMSkKPiArI2RlZmluZSBSQjJEX0RD
X0JVU1kJCQkJICAgKDFVIDw8IDMxKQo+ICAKPiAgLyogRFNUQ0FDSEVfTU9ERSBiaXRzIGNvbnN0
YW50cyAqLwo+ICAjZGVmaW5lIFJCMkRfRENfQVVUT0ZMVVNIX0VOQUJMRSAgICAgICAgICAgICAg
ICAgICAoMSA8PCA4KQo+IEBAIC02NzIsNyArNjcyLDcgQEAKPiAgI2RlZmluZSBIT1JaX1NUUkVU
Q0hfRU5BQkxFCQkJICAgKDEgPDwgMjUpCj4gICNkZWZpbmUgSE9SWl9BVVRPX1JBVElPCQkJCSAg
ICgxIDw8IDI3KQo+ICAjZGVmaW5lIEhPUlpfRlBfTE9PUF9TVFJFVENICQkJICAgKDB4NyA8PCAy
OCkKPiAtI2RlZmluZSBIT1JaX0FVVE9fUkFUSU9fSU5DCQkJICAgKDEgPDwgMzEpCj4gKyNkZWZp
bmUgSE9SWl9BVVRPX1JBVElPX0lOQwkJCSAgICgxVSA8PCAzMSkKPiAgCj4gIAo+ICAvKiBGUF9W
RVJUX1NUUkVUQ0ggYml0IGNvbnN0YW50cyAqLwoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVq
IFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVj
dHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
