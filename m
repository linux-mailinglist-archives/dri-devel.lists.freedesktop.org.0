Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7DCF3CD2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 01:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E97F6E138;
	Fri,  8 Nov 2019 00:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 332 seconds by postgrey-1.36 at gabe;
 Fri, 08 Nov 2019 00:24:56 UTC
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665026E057;
 Fri,  8 Nov 2019 00:24:56 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20191108001921epoutp013babeddf529ed9798f6bc726b4cfdca7~VB_1_IrDJ2404224042epoutp011;
 Fri,  8 Nov 2019 00:19:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20191108001921epoutp013babeddf529ed9798f6bc726b4cfdca7~VB_1_IrDJ2404224042epoutp011
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191108001920epcas1p1ef074f39297da6debe112c0542d276b5~VB_1DVTd30181501815epcas1p11;
 Fri,  8 Nov 2019 00:19:20 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.157]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 478LVX0T1kzMqYkd; Fri,  8 Nov
 2019 00:19:16 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 B0.DE.04224.384B4CD5; Fri,  8 Nov 2019 09:19:15 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20191108001915epcas1p4916381c427c32987c7284b9fa394849a~VB_wYUkXC1771717717epcas1p4n;
 Fri,  8 Nov 2019 00:19:15 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191108001915epsmtrp2a5d14cbda2ce7681131d383ee7df382e~VB_wWbnlp1445614456epsmtrp2A;
 Fri,  8 Nov 2019 00:19:15 +0000 (GMT)
X-AuditID: b6c32a38-d5bff70000001080-36-5dc4b483760b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 8D.F5.25663.384B4CD5; Fri,  8 Nov 2019 09:19:15 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191108001914epsmtip28c8523b1bba1fedf40581cbdac4f3a37~VB_vvB-fs3242332423epsmtip2a;
 Fri,  8 Nov 2019 00:19:14 +0000 (GMT)
Subject: Re: [PATCH 03/13] drm/exynos: Provide ddc symlink in connector's sysfs
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <79da80ba-aa5b-7c09-c702-df78a22a968c@samsung.com>
Date: Fri, 8 Nov 2019 09:22:17 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <613c1c09ff7db5be60ef86f930b45b3f56b4838d.1564591626.git.andrzej.p@collabora.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ue1DUVRTHu/t77EKu8xMU7mzNhL/RCgpkBexo4Jgx9av8A8MpY4Zoh/0N
 MMCy7YKJo8VjVR5SLBTZsrwK5TESBkg8Q4HBkNiNUIb3QwgiBQRhtWmQdvnhxH+fe873zPec
 e+ZeCeHQIZFJIlSxvEaliGJpe7K2zdXDPbmmPdgzt8wXMkydIsgZbqTgUmWiGC5PjpLQOpBM
 QUvJTwgGJropmBuzZhMba8WwVqsnoMHQQEPxspmC2ysLNPyZNkfD9cReBMaZbgT3sySwdvce
 BXlZZ2AgsVEEuZnVIijprUSgM3xPQnORCNJTUyj4a7SHhGrTBQq+mrxHgNl8VQzdSffFUDXZ
 R4G+pVsMvQ1GGnqTexAsja8RcNH8iwhSlw00FC1eI6Fi9TIBCYbzYkjSeUGpyUjByOivJMzU
 XxXBTNFjAloMfWIYyW5HkDz1pdWxxhlqBu9QcDF7lobqqm8I+Kchn4Qm/aQYKgsGaXj0pEh0
 CLizf6zSXNJCB82VPXDj6kaKEddsKSS5esOImPuhaVbEVZWn0txwXxPNzZtMYu5nyzjF5Xce
 5cbSb4q46uIvOF1nC8llPpijA3BQpG84r1DyGhdeFRqjjFCF+bHvBYa8GeKzz1PuLt8Pr7Eu
 KkU078f6Hwlwfysiyror1uWEIirOGgpQaLXsnoO+mpi4WN4lPEYb68fyamWUer/aQ6uI1sap
 wjxCY6IPyD099/pYhZ9Ehj8qTSDVOvuTQ20ZdAK6IklDdhLMeOP6CaPIxg5MHcLnp4LTkL2V
 lxD+sbOCFBIWhL+tiH9asFh9lhJEzQjf6M/aOCwgPNY2S6QhicSROYoz0g/bCrYzH+CSpa51
 DcHMMTjjug7ZEjSzG+tLx2gbS5mDuDgtlbAxyezCI8by9ZZ2MMfx0ngbJWi24c7vptY7smM+
 xsl5c+tMMM54cKpAJPALOPlaLmEzw4zFDt+6kk8JbftjXfb0Bjviv2/WiAWW4YfzzbTAn+Hp
 +WnSNgBmTmNL3kkBvXBPqdKGBOOKKxv2COKduP7fPCS4bsXzKxcoQS3FKeccBAmLO3r6kcAY
 /16s3/Dh8NqNNSoT7TRsmsuwaRbDplkM/xsXIrIcOfFqbXQYr5WrvTdvugqtv2E3qENNpiOt
 iJEgdov0+PPtwQ6U4oQ2ProVYQnBbpfa6awhqVIRf4rXxIRo4qJ4bSvysV67npDtCI2x/giq
 2BC5z14vLy/wlu/zkctZZ+kbJZeCHZgwRSwfyfNqXvO0TiSxkyWgltPvFLZPHisvmKW9pX6G
 vKC3XZeNnuZnv75j/xEzcSrxrm9RYPgZmaT5w47Hh+0zPh1qSMkLiHqRfMj99v7q60Fq5XP9
 u+YnnHYnaf0jLUNhx26z5w7VlinjnHKebFObPJ5ZecW9/aVbmns576qHA7pCDa8OmGcOdH0u
 2+IYuLh12f9lltSGK+RuhEar+A9Q2tpb2QQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTH99yX5166NbkrOB5fIlmnW2yiTvTDyebY5MvuPm3MZHEmvlS9
 AQNtWa+gaCYvrZkUmSC64BVRFBWabbC2vBUUpMhgG+2kjgVsi64QMFCFxek25hi1WcK3X87/
 /zvny+FpTR1exu83HpDMRn2WFquYZo82aa3F1bPjzYkrApR6+yn4KtDOwpWGQg6uhkMMdA9b
 WOi89h2C4fsDLERGF9LC9mYO5pvLaXArbgy1j30s3PnjEYZxWwRDV6EfQdXEAILpUzzM/zbF
 wvlTn8NwYTsF58qcFFzzNyCwKpcYuF5DQUnxcRYmQ7cZcHpPsHAyPEWDz9fIwUDRNAeO8BAL
 5Z0DHPjdVRj8ltsIfr83T0Ol7wYFxY8VDDWzTQx88+wqDQXKFxwUWTdCnbeKhWCoj4GJtkYK
 Jmr+pKFTGeIgWNGDwDL25cJFVyK4Rn5hobLiAQan4wwNf7mrGegoD3PQcGEEw9N/a6j3QDw2
 +AyLRY96sVg/oxNbg7VIvP7kIiO2KUFOvNzxgBId9mIsBoY6sPjQ6+XElif3WLG6P00cLfme
 Ep21+aK1v5MRy2Yi+COyXbV5n5S1P1cyr0/Zrcp4WlfAZFtVh+56SnEB+pq3oTieCJvIrPMY
 a0MqXiO0IzLbFaJsiF8ICHE18TGMJx6PHKtEEAl9a2ei83ghjZSWpEbXJAifEMdMC4p2aGFO
 ID32KS4mVFKk8de/2WgLC6tJed0ojrJaSCG1tmI6yoywigSr7FSUlwjbiKdVQbHOy6T/7BgT
 5ThhJ7GcjzxnWniD/FM9SMc4kYyMXaBinEQsTefoMqRRFunKIkVZpCiLlIuIsaOlUrZsSDfI
 G7KTjdLBdbLeIOcY09ftNRkc6Pn/6nStqK9vVzcSeKR9Sb1tRc8ODavPlfMM3YjwtDZBHWdd
 GKn36fMOS2bTLnNOliR3o+U8o01UJ5l6P9UI6foDUqYkZUvm/1OKj1tWgD64OxR85YUpqFi6
 56dXB01rApOfrfgxofeWb/zyD6fzc1Yd2ZyZvFJXVBIxHI5f3pJx9K3xOx/2Em0ABy65tx9J
 XjnXlfh+WnjLmdTSQ6enj9LJWzbtvTk5PZpffyL39Y9nHaZ3MlMebvz5pN8y5wrtrk+1u7au
 PbvkeNtr9SbLu8a3X8zTMnKGfoOONsv6/wCmHKUWuwMAAA==
X-CMS-MailID: 20191108001915epcas1p4916381c427c32987c7284b9fa394849a
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190731165921epcas3p4cdba522c2fc78c188075427c064fea5e
References: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com>
 <cover.1564591626.git.andrzej.p@collabora.com>
 <CGME20190731165921epcas3p4cdba522c2fc78c188075427c064fea5e@epcas3p4.samsung.com>
 <613c1c09ff7db5be60ef86f930b45b3f56b4838d.1564591626.git.andrzej.p@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1573172361;
 bh=Qx6JJUOeIPxCw2Lg01fwba3w5G0slgAeqvLXgAErFlI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=czf5GlW1UCGN045boMR2uzQ3uT1E9CFgWWdKNgQ3QZTtNtP657/YvjzhvaHCAQpOK
 DNj+LSRNpOUp69yrnO0Bwx27/By2qHY5ysnpQc4J/fEwa1FCyoffUEM14Vm/QLgt5g
 ILM9fl2zJ9xwQLkiN6rrRYVd6MHaVLmPFpr4/4Gg=
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
Cc: David Airlie <airlied@linux.ie>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, kernel@collabora.com,
 Anthony Koo <Anthony.Koo@amd.com>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 David Francis <David.Francis@amd.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Enrico Weigelt <info@metux.net>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Todor Tomov <todor.tomov@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoxOS4gOC4gMS4g7Jik7KCEIDE6NTjsl5AgQW5kcnplaiBQaWV0cmFzaWV3aWN6IOydtCjqsIAp
IOyTtCDquIA6Cj4gU3dpdGNoIHRvIHVzaW5nIHRoZSBkZGMgcHJvdmlkZWQgYnkgdGhlIGdlbmVy
aWMgY29ubmVjdG9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8
YW5kcnplai5wQGNvbGxhYm9yYS5jb20+Cj4gQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KPiBSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29s
bGFib3JhLmNvbT4KCkFja2VkLWJ5OiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+CgpU
aGFua3MsCklua2kgRGFlCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19o
ZG1pLmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKPiBpbmRleCBi
YzE1NjVmMTgyMmEuLmQ0YTljOWUxNzQzNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19oZG1pLmMKPiBAQCAtOTQwLDggKzk0MCwxMCBAQCBzdGF0aWMgaW50IGhkbWlfY3JlYXRlX2Nv
bm5lY3RvcihzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4gIAljb25uZWN0b3ItPmludGVy
bGFjZV9hbGxvd2VkID0gdHJ1ZTsKPiAgCWNvbm5lY3Rvci0+cG9sbGVkID0gRFJNX0NPTk5FQ1RP
Ul9QT0xMX0hQRDsKPiAgCj4gLQlyZXQgPSBkcm1fY29ubmVjdG9yX2luaXQoaGRhdGEtPmRybV9k
ZXYsIGNvbm5lY3RvciwKPiAtCQkJJmhkbWlfY29ubmVjdG9yX2Z1bmNzLCBEUk1fTU9ERV9DT05O
RUNUT1JfSERNSUEpOwo+ICsJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGhkYXRh
LT5kcm1fZGV2LCBjb25uZWN0b3IsCj4gKwkJCQkJICAmaGRtaV9jb25uZWN0b3JfZnVuY3MsCj4g
KwkJCQkJICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEsCj4gKwkJCQkJICBoZGF0YS0+ZGRjX2Fk
cHQpOwo+ICAJaWYgKHJldCkgewo+ICAJCURSTV9ERVZfRVJST1IoaGRhdGEtPmRldiwKPiAgCQkJ
ICAgICAgIkZhaWxlZCB0byBpbml0aWFsaXplIGNvbm5lY3RvciB3aXRoIGRybVxuIik7Cj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
