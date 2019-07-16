Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0586A8A8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 14:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C5489DA3;
	Tue, 16 Jul 2019 12:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FC789DA3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 12:26:28 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190716122626euoutp02c6582c3ff1beaad0a3eaeb5e56454690~x4t2RDdLe0690906909euoutp02U
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 12:26:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190716122626euoutp02c6582c3ff1beaad0a3eaeb5e56454690~x4t2RDdLe0690906909euoutp02U
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190716122626eucas1p2f58b6b1dacae0847ccce4b90920c47ca~x4t1_BREm0474304743eucas1p21;
 Tue, 16 Jul 2019 12:26:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 23.CA.04325.272CD2D5; Tue, 16
 Jul 2019 13:26:26 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190716122625eucas1p2093f157267d4ad2ca6757496ed690c90~x4t1Om64q0474304743eucas1p20;
 Tue, 16 Jul 2019 12:26:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190716122625eusmtrp1a78971d80d5d4e90aec24b9c60961235~x4t1AjR941461614616eusmtrp1w;
 Tue, 16 Jul 2019 12:26:25 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-b5-5d2dc2727795
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 98.74.04146.172CD2D5; Tue, 16
 Jul 2019 13:26:25 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190716122625eusmtip111edf3643d3e89b35d888fc00283dbb9~x4t0qttZP1205612056eusmtip1E;
 Tue, 16 Jul 2019 12:26:25 +0000 (GMT)
Subject: Re: [PATCH 03/10] video: pxafb: Remove cpufreq policy notifier
To: Viresh Kumar <viresh.kumar@linaro.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <648e2ab5-afd7-3b9c-de8b-1e14c0be83e2@samsung.com>
Date: Tue, 16 Jul 2019 14:26:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e69d47b1d497bdbd8c988754d98714e78ddc0a80.1563270828.git.viresh.kumar@linaro.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsWy7djPc7pFh3RjDaa8Fba48vU9m8WJvg+s
 Fpd3zWGz+Nx7hNHizOlLrBYdR74xW2z86uHA7nHn2h42j/vdx5k8tlxtZ/H4vEkugCWKyyYl
 NSezLLVI3y6BK+PWjwvMBc9YKm4c/sfewPiHuYuRk0NCwERi96uv7F2MXBxCAisYJab8Wc0G
 4XxhlDjYO50ZwvnMKPFh/n64lrMzrzNCJJYzSsy9/REsISTwllHi54RUEFtYwF1i7dttTF2M
 HBwiAloSL2+ChZkFzjFKnL3pC2KzCVhJTGxfxQhi8wrYSRzedZkFxGYRUJV4/3YrWFxUIELi
 /rENrBA1ghInZz4Bq+EUiJP4u3cGO8RMcYlbT+YzQdjyEtvfzgE7WkJgHbvE+/uPmCCOdpFY
 +GAmO4QtLPHq+BYoW0bi9OQeFqgGRom/HS+gurczSiyf/I8Nospa4vDxi6wg3zALaEqs36UP
 EXaUePXwECNIWEKAT+LGW0GII/gkJm0DhRxImFeio00IolpNYsOyDWwwa7t2rmSewKg0C8lr
 s5C8MwvJO7MQ9i5gZFnFKJ5aWpybnlpsnJdarlecmFtcmpeul5yfu4kRmHZO/zv+dQfjvj9J
 hxgFOBiVeHhP7NGJFWJNLCuuzD3EKMHBrCTCa/tVO1aINyWxsiq1KD++qDQntfgQozQHi5I4
 bzXDg2ghgfTEktTs1NSC1CKYLBMHp1QDY+ydsN2i11Z8LrvmayWfqbntrVN+/1QB/TWbMxJ6
 DnMxCR3+EyXBlO8b3/EwIG26QbD2sbxJ13b6xAtElflNFBM2uRDiwcwy4VLF6VAW/azLj6+t
 XRW3tJSl6Hjcm5eq72coJ+4rO+adpRL+dm9k/uIG14R+pRPnX7Es7+3m+twqednrvlqIEktx
 RqKhFnNRcSIA3wqUrTcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsVy+t/xu7qFh3RjDZ6vUrC48vU9m8WJvg+s
 Fpd3zWGz+Nx7hNHizOlLrBYdR74xW2z86uHA7nHn2h42j/vdx5k8tlxtZ/H4vEkugCVKz6Yo
 v7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL+PWjwvMBc9Y
 Km4c/sfewPiHuYuRk0NCwETi7MzrjF2MXBxCAksZJY69msLWxcgBlJCROL6+DKJGWOLPtS42
 iJrXjBInPk5nAUkIC7hLrH27jQmkXkRAS+LlzVSQGmaBC4wSsz60QQ3tY5R49ewFK0gDm4CV
 xMT2VYwgNq+AncThXZfBBrEIqEq8f7sVLC4qECFx5v0KFogaQYmTM5+A2ZwCcRJ/985gB7GZ
 BdQl/sy7xAxhi0vcejKfCcKWl9j+dg7zBEahWUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4sN
 9YoTc4tL89L1kvNzNzECI23bsZ+bdzBe2hh8iFGAg1GJh/fEHp1YIdbEsuLK3EOMEhzMSiK8
 tl+1Y4V4UxIrq1KL8uOLSnNSiw8xmgI9N5FZSjQ5H5gE8kriDU0NzS0sDc2NzY3NLJTEeTsE
 DsYICaQnlqRmp6YWpBbB9DFxcEo1MLqk8E+O3rSY8USCbJHVX3lZ/pyELfvc+vOsJ7Y9M566
 6NyfaWfL12lvPySdeHvrS6UZNfwnU1jCI5T8JraGL9V50X7vY4DA537dhfn+y8Pl/rqtzuTS
 60w/qy48X3qD5NaQKHdWh+oNgh6TviT1ZH2KmJhfHe18/fvfmdd3sM/zyr/X5l/yWomlOCPR
 UIu5qDgRADDAAcfKAgAA
X-CMS-MailID: 20190716122625eucas1p2093f157267d4ad2ca6757496ed690c90
X-Msg-Generator: CA
X-RootMTR: 20190716122625eucas1p2093f157267d4ad2ca6757496ed690c90
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190716122625eucas1p2093f157267d4ad2ca6757496ed690c90
References: <cover.1563270828.git.viresh.kumar@linaro.org>
 <e69d47b1d497bdbd8c988754d98714e78ddc0a80.1563270828.git.viresh.kumar@linaro.org>
 <CGME20190716122625eucas1p2093f157267d4ad2ca6757496ed690c90@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563279986;
 bh=zf1SxDfLXmgU3SgPoMi4phv/xSiFjD1yiDoP1x528pM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=YSmMgIBz+rHlm1zkYCS17b12g9ITonMB9b9IIieZ+VQY8PwwpemiZcJbrOGJb4PRr
 qLOxStIc06kPTCu657DSKpfYzcxhfGMLEYsvQUS9B3C0ON83mEOZmIjnrKu4iZVILE
 s3zEfnCPDgHlBfV6g7UxJEnDtfoaJ+uXHFY3cvvQ=
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
Cc: linux-fbdev@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMTYvMTkgMTE6NTQgQU0sIFZpcmVzaCBLdW1hciB3cm90ZToKPiBUaGUgY3B1ZnJlcSBw
b2xpY3kgbm90aWZpZXIncyBDUFVGUkVRX0FESlVTVCBub3RpZmljYXRpb24gaXMgZ29pbmcgdG8K
PiBnZXQgcmVtb3ZlZCBzb29uLgo+IAo+IFRoZSBub3RpZmllciBjYWxsYmFjayBweGFmYl9mcmVx
X3BvbGljeSgpIGlzbid0IGRvaW5nIGFueXRoaW5nIGFwYXJ0Cj4gZnJvbSBwcmludGluZyBhIGRl
YnVnIG1lc3NhZ2Ugb24gQ1BVRlJFUV9BREpVU1Qgbm90aWZpY2F0aW9uLiBUaGVyZSBpcwo+IG5v
IHBvaW50IGluIGtlZXBpbmcgYW4gb3RoZXJ3aXNlIGVtcHR5IGNhbGxiYWNrIGFuZCByZWdpc3Rl
cmluZyB0aGUKPiBub3RpZmllci4KPiAKPiBSZW1vdmUgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
VmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4KCkFja2VkLWJ5OiBCYXJ0bG9t
aWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CgpCZXN0IHJlZ2Fy
ZHMsCi0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBv
bGFuZApTYW1zdW5nIEVsZWN0cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
