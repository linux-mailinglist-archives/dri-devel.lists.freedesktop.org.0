Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE033AB9A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 07:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2098B89CB3;
	Mon, 15 Mar 2021 06:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 15 Mar 2021 06:33:03 UTC
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F293D89CB3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 06:33:03 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210315062759epoutp0455c4709da380fd65a3184b656da2a3a9~scCca4CFd1732317323epoutp04U
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 06:27:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210315062759epoutp0455c4709da380fd65a3184b656da2a3a9~scCca4CFd1732317323epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1615789679;
 bh=ljwtFnDGAhGeIvjmwPJhEq+BYeIDRG8xkcQeTsi0flo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=cGuLDiuj1u3EqVcSscVhp5FAiBAZsB3tdhY6QehJUZIY1Lokb+b/AN0qu6z496ePQ
 ZngeNUO6bpF27ThNLp0pmlyGM6gd0WU+LDcikJx9EcQwxir6VENzHXwJdFq2yVoMiV
 yshJQs2H22eBOVjz/d6O3daLBjvIoUjakPduUKdE=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20210315062759epcas1p3fea5cacc10879f163b1ecd2ea7ce753e~scCcGHLRO2823628236epcas1p3R;
 Mon, 15 Mar 2021 06:27:59 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.156]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4DzRLJ6tZSz4x9Q8; Mon, 15 Mar
 2021 06:27:52 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 B2.A2.09582.F3EFE406; Mon, 15 Mar 2021 15:27:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210315062710epcas1p107e8186b2138c671620dabf3abd4aea4~scBvFGPtC0400404004epcas1p1y;
 Mon, 15 Mar 2021 06:27:10 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210315062710epsmtrp1669c5c8954c1feb813ba1366d2645dbf~scBvETO8-0391803918epsmtrp1g;
 Mon, 15 Mar 2021 06:27:10 +0000 (GMT)
X-AuditID: b6c32a37-899ff7000000256e-d5-604efe3fa6bd
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B5.A7.08745.E3EFE406; Mon, 15 Mar 2021 15:27:10 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210315062710epsmtip147767b205d7b4af420928428e985dc26~scBu2Fifa2860828608epsmtip1S;
 Mon, 15 Mar 2021 06:27:10 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos/decon5433: Clean up GPIO includes
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 krzk@kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <3fb21326-8e4a-51bf-4f7c-7a3215f08803@samsung.com>
Date: Mon, 15 Mar 2021 15:35:48 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1614654193-40203-1-git-send-email-tiantao6@hisilicon.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEJsWRmVeSWpSXmKPExsWy7bCmvq79P78Eg76dwha9504yWfzfNpHZ
 4srX92wW589vYLfY9Pgaq8WM8/uYLFa/3sfuwO6x99sCFo/Hczeye2xa1cnmsf3bA1aP+93H
 mTw2L6n3+LxJLoA9KtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJ
 xSdA1y0zB+geJYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BZYFecWJucWleul5y
 fq6VoYGBkSlQYUJ2xqMHf9kLPnBUrHm0kLGB8QB7FyMnh4SAicTcKftYuxi5OIQEdjBKvL0M
 kgBxPjFKbG3fA+V8ZpR4ueIeM0xL2463UIldjBKbZ/cwQTjvGSUa294yglQJCzhKvFv8B2yJ
 iEC0xKLPr1hBbGaBPImLv56C2WwCqhITV9xnA7F5BewkjpxvB6tnAYqv+PAAzBYViJA43j2Z
 HaJGUOLkzCcsIDangLvEkzVL2CFmikvcejKfCcKWl2jeOpsZ5CAJgakcEpO+vANaxgHkuEis
 XWUC8YGwxKvjW6ABICXxsr+NHaK+mVFi4ozTTBBOB6PE3cfXWSCqjCX2L53MBDKIWUBTYv0u
 fYiwosTO33MZIRbzSbz72gO1i1eio00IokRJ4tjFG4wQtoTEhSUT2SBsD4kZR5rYJjAqzkLy
 2iwk78xC8s4shMULGFlWMYqlFhTnpqcWGxYYI0f3JkZwYtUy38E47e0HvUOMTByMhxglOJiV
 RHg/6/gmCPGmJFZWpRblxxeV5qQWH2I0BQb2RGYp0eR8YGrPK4k3NDUyNja2MDE0MzU0VBLn
 TTJ4EC8kkJ5YkpqdmlqQWgTTx8TBKdXA5K9yQiW/Wj186g/7r3Ncbya///pP/Iv68QM/mp9E
 9O4WvPzq94RDN5Y+i9ye+9146prT+9N8JI3vfxCdqZAq5lRjtcNXseJXuaxD6bvrb01etGzY
 Xv5T6q6lXOpxGV+mFfyRE4N2ruvfOmmpGYNHCXNaXGXjhY1XJvq5HZ4RuD/o/jID8Q/Nhh0M
 r/KWCX28ot8al1e36c6+wi+Nt8U+Vd3VrZTLfiQirVl9L6CAZXLi1N6VPuJVTrr7GSN7bfvz
 o8TEN3kJ/ko/+txkZ8/VIuO94YtXMu/tqq3PLP+6ISNh91f7XX2HK57Fnrz/QVlAI1UraN75
 HxcNE58f4Z/Jqvwj+NSpwkn2h95Pf28Xp8RSnJFoqMVcVJwIAGi3VRM1BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSnK7dP78Eg7P9eha9504yWfzfNpHZ
 4srX92wW589vYLfY9Pgaq8WM8/uYLFa/3sfuwO6x99sCFo/Hczeye2xa1cnmsf3bA1aP+93H
 mTw2L6n3+LxJLoA9issmJTUnsyy1SN8ugSvj0YO/7AUfOCrWPFrI2MB4gL2LkZNDQsBEom3H
 WyCbi0NIYAejxKV1F4EcDqCEhMSWrRwQprDE4cPFECVvGSXe3p7BCtIrLOAo8W7xH7A5IgLR
 Ej+7t7CA2MwCeRKTty9ggmiYxShx6P4XJpAEm4CqxMQV99lAbF4BO4kj59vBmlmA4is+PACz
 RQUiJFruQwzlFRCUODnzCdhQTgF3iSdrlrBDLFCX+DPvEjOELS5x68l8JghbXqJ562zmCYxC
 s5C0z0LSMgtJyywkLQsYWVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgTHkZbWDsY9
 qz7oHWJk4mA8xCjBwawkwvtZxzdBiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp
 2ampBalFMFkmDk6pBia+JZNXBnmfl/RIOneL6YynrNLfN6cn9TOW/H3DoLO7y/BbyfILj43j
 N3zfqH5+p5zlAqNnN7Zten7F7lLaxbjOYBWfxX/W9K37vz/NL4NRZ/OxnIY3K1ceCfl23WDn
 YYNnrmW7/qj29mbNi3SZFDWxWmC75us003LzR/cSSnym97tEnL/tzmRzK/YW740ITovl2Qvu
 aojc+/Jzwirbc14aXrd2y7ocf6Rkl+BUFheZnnfGj8fWccc8oTvqFy/W2Ngtns/pw9iSOknp
 q4lF5c0/b66ue+vNpTzPv9v7dbf5dafvaZfeyzy239ax5c69pecqjH7dj/u0X+zYyzMOSzmu
 RzI9qTPe6GHua+BQpXJTiaU4I9FQi7moOBEAd9nFbBIDAAA=
X-CMS-MailID: 20210315062710epcas1p107e8186b2138c671620dabf3abd4aea4
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210303014433epcas1p4fefd6787c74d86d6f11f93318c3833fd
References: <CGME20210303014433epcas1p4fefd6787c74d86d6f11f93318c3833fd@epcas1p4.samsung.com>
 <1614654193-40203-1-git-send-email-tiantao6@hisilicon.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGlhbiBUYW8sCgoyMS4gMy4gMi4g7Jik7ZuEIDEyOjAz7JeQIFRpYW4gVGFvIOydtCjqsIAp
IOyTtCDquIA6Cj4gcmVtb3ZlIHRoZSBsZWdhY3kgR1BJTyBoZWFkZXJzIDxsaW51eC9vZl9ncGlv
Lmg+IGJ1dCB3aGF0IGl0IHJlYWxseQo+IHVzZXMgaXMgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4g
c2luY2Ugb25seSBncGlvX2Rlc2Mgc3RydWN0cyBhcmUgZXZlcgo+IHJlZmVyZW5jZWQuCgpUaGlz
IGRyaXZlciBkb2Vzbid0IHJlZmVyZW5jZSBldmVuIGxpbnV4L2dwaW8vY29uc3VtZXIuaCBzbyBj
b3VsZCB5b3UgZHJvcCBvbmx5IG9mX2dwaW8uaCBpbmNsdXNpb24/CgpUaGFua3MsCklua2kgRGFl
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRpYW4gVGFvIDx0aWFudGFvNkBoaXNpbGljb24uY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29u
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMKPiBpbmRl
eCAxZjc5YmMyLi45ZmM1MWE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zNTQzM19kcm1fZGVjb24uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zNTQzM19kcm1fZGVjb24uYwo+IEBAIC0xMSw5ICsxMSw5IEBACj4gICNpbmNsdWRlIDxsaW51
eC9jb21wb25lbnQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPgo+ICAjaW5jbHVkZSA8
bGludXgvaXJxLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9tZmQvc3lzY29uLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4K
PiAtI2luY2x1ZGUgPGxpbnV4L29mX2dwaW8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgo+ICAjaW5jbHVkZSA8
bGludXgvcmVnbWFwLmg+Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
