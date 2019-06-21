Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7434D4E692
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 12:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918916E82E;
	Fri, 21 Jun 2019 10:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4A86E82E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 10:58:33 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190621105831euoutp020adaf3169997a9435006d4c28afb552c~qMY8RjLI31284312843euoutp02J
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 10:58:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190621105831euoutp020adaf3169997a9435006d4c28afb552c~qMY8RjLI31284312843euoutp02J
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190621105830eucas1p1fc2359f1ccacd3cdc649c6885c9da491~qMY7v731h0680206802eucas1p1u;
 Fri, 21 Jun 2019 10:58:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 66.B9.04325.658BC0D5; Fri, 21
 Jun 2019 11:58:30 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190621105829eucas1p2b19a886df01e57f5b5a04f9eb5ab7d4f~qMY64VMzZ1768217682eucas1p2Q;
 Fri, 21 Jun 2019 10:58:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190621105829eusmtrp2b12321237892dcf14b1d5b0265247ec6~qMY6qPm6E2690226902eusmtrp2i;
 Fri, 21 Jun 2019 10:58:29 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-59-5d0cb856927d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 00.73.04140.558BC0D5; Fri, 21
 Jun 2019 11:58:29 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190621105829eusmtip222e6d4a5e5d1c4975e0c08077666f869~qMY6U14r62320223202eusmtip2W;
 Fri, 21 Jun 2019 10:58:29 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: pvr2fb: fix link error for pvr2fb_pci_exit
To: Arnd Bergmann <arnd@arndb.de>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <1628618a-7cf6-506e-9d87-c0966a99fbea@samsung.com>
Date: Fri, 21 Jun 2019 12:58:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190617131624.2382303-1-arnd@arndb.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djP87phO3hiDdp+ylvMWb+GzeLvpGPs
 Fle+vmez2P/0OYvFib4PrBaXd81hs7jz9TmLA7vH71+TGD1ajrxl9Vi85yWTx4kZv1k87ncf
 Z/L4vEkugC2KyyYlNSezLLVI3y6BK+PDk5fsBfc4Kzbf62BrYJzE0cXIySEhYCLx/dQk5i5G
 Lg4hgRWMEmeP/WOBcL4wSqzq/g7lfGaU+PdyCxNMy4fpO6ASyxklrs78CuW8ZZQ4Nu0hI0iV
 sIC/RNvva2wgtoiAosTUF8/AljALXGKUuLliCjtIgk3ASmJi+yqgBg4OXgE7ib3T60DCLAKq
 Eo8nvQfbJioQIXH/2AZWEJtXQFDi5MwnLCA2p4CpxNVVJ5lBbGYBcYlbT+YzQdjyEtvfzgHb
 JSFwiF3ia99/FoizXSRWXPjBCmELS7w6voUdwpaR+L8TpBmkYR2jxN+OF1Dd2xkllk/+xwZR
 ZS1x+PhFVpBLmQU0Jdbv0ocIO0qs2r6VCSQsIcAnceOtIMQRfBKTtk1nhgjzSnS0CUFUq0ls
 WLaBDWZt186VzBMYlWYheW0WkndmIXlnFsLeBYwsqxjFU0uLc9NTi43zUsv1ihNzi0vz0vWS
 83M3MQIT0ul/x7/uYNz3J+kQowAHoxIP74FZ3LFCrIllxZW5hxglOJiVRHh5cnhihXhTEiur
 Uovy44tKc1KLDzFKc7AoifNWMzyIFhJITyxJzU5NLUgtgskycXBKNTBWZ8gvE73bnv3si/O1
 eF+njgPfC+OURZ7PD83K6gm/3DHpv/Sqk7e+nw9y4O96vcZY9WaLTYC+3N2r+ndSVnMdK3q7
 Q2rv1/SwXXI+i4/KGW3kNal7EfX+S3iFgscLw+9l4une+hf9hd/qz66Z/vOi25MNzOu9V8dI
 Wi0S3lu4z/y86rRJ65KUWIozEg21mIuKEwHBo/otRAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xe7qhO3hiDVqmq1rMWb+GzeLvpGPs
 Fle+vmez2P/0OYvFib4PrBaXd81hs7jz9TmLA7vH71+TGD1ajrxl9Vi85yWTx4kZv1k87ncf
 Z/L4vEkugC1Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI
 3y5BL+PDk5fsBfc4Kzbf62BrYJzE0cXIySEhYCLxYfoOli5GLg4hgaWMEvdvNjN2MXIAJWQk
 jq8vg6gRlvhzrYsNouY1o0TrxQ/sIAlhAV+JGW9+g9kiAooSU188YwYpYha4xChxsHsxK0RH
 B6NE28J7zCBVbAJWEhPbV4Ft4BWwk9g7vQ4kzCKgKvF40nsmEFtUIELizPsVLCA2r4CgxMmZ
 T8BsTgFTiaurToKNYRZQl/gz7xKULS5x68l8JghbXmL72znMExiFZiFpn4WkZRaSlllIWhYw
 sqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjL9tx35u2cHY9S74EKMAB6MSD++BWdyxQqyJ
 ZcWVuYcYJTiYlUR4eXJ4YoV4UxIrq1KL8uOLSnNSiw8xmgI9N5FZSjQ5H5ga8kriDU0NzS0s
 Dc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MB6/8knxZpf3xjsemeekO54+fi1x
 wfb8G+Nr03NnKBqVtQjHinQ/Onj2Wk9R1+PYaZd1Yz58fnJLIKO97ptWtqHa9NDe6xdP3pqx
 vmPJKfMY98cv/iotmbv9V5PWj0vvRVnvrTm/Qk7u9ZbN06TnTVsaf+LoPmuGCd12Uw7P4mPZ
 GGyUvbr//iRVJZbijERDLeai4kQA9VpxwdUCAAA=
X-CMS-MailID: 20190621105829eucas1p2b19a886df01e57f5b5a04f9eb5ab7d4f
X-Msg-Generator: CA
X-RootMTR: 20190617131645epcas1p3340c80f9e83af93bcbb4c68128b1ea44
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190617131645epcas1p3340c80f9e83af93bcbb4c68128b1ea44
References: <CGME20190617131645epcas1p3340c80f9e83af93bcbb4c68128b1ea44@epcas1p3.samsung.com>
 <20190617131624.2382303-1-arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561114711;
 bh=A9pBNbBVOLmjuiX6NSWUHx7tGtewDcJ1QzxPHg8R51k=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=C/Jpiahv2U6o5Wrt1Ua/p5e9gjNJnZzQomYUaRC/We685GifcxkEU/VyDrg7920Dd
 Nl/ULYxT/Rb0whvAPPvLzRMejb63t6Otv0a24ecSfWj2tpwn+3apBwwRVDCsZsomJB
 iDDXXD85Fhl10e79lf4bWACiHD+mO86vri9SuOak=
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
Cc: linux-fbdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpLAoKT24gNi8xNy8xOSAzOjE2IFBNLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IFdoZW4gdGhl
IGRyaXZlciBpcyBidWlsdC1pbiBmb3IgUENJLCB3ZSByZWZlcmVuY2UgdGhlIGV4aXQgZnVuY3Rp
b24KPiBhZnRlciBkaXNjYXJkaW5nIGl0Ogo+IAo+IGBwdnIyZmJfcGNpX2V4aXQnIHJlZmVyZW5j
ZWQgaW4gc2VjdGlvbiBgLnJlZi5kYXRhJyBvZiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3B2cjJmYi5v
OiBkZWZpbmVkIGluIGRpc2NhcmRlZCBzZWN0aW9uIGAuZXhpdC50ZXh0JyBvZiBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L3B2cjJmYi5vCj4gCj4gSnVzdCByZW1vdmUgdGhlIF9fZXhpdCBhbm5vdGF0aW9u
IGFzIHRoZSBlYXNpZXN0IHdvcmthcm91bmQuCgpEb24ndCB3ZSBhbHNvIG5lZWQgdG8gZml4IHB2
cjJmYl9kY19leGl0KCkgZm9yIENPTkZJR19TSF9EUkVBTUNBU1Q9eSBjYXNlPyAKCkJlc3QgcmVn
YXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUg
UG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKCj4gRml4ZXM6IDBmNWE1NzEyYWQxZSAoInZpZGVv
OiBmYmRldjogcHZyMmZiOiBhZGQgQ09NUElMRV9URVNUIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYt
Ynk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvcHZyMmZiLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B2cjJm
Yi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIuYwo+IGluZGV4IDI5OWVhN2RiOTIyMC4u
Y2Y5Y2ZkYzVlNjg1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHZyMmZiLmMK
PiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B2cjJmYi5jCj4gQEAgLTk5MCw3ICs5OTAsNyBA
QCBzdGF0aWMgaW50IF9faW5pdCBwdnIyZmJfcGNpX2luaXQodm9pZCkKPiAgCXJldHVybiBwY2lf
cmVnaXN0ZXJfZHJpdmVyKCZwdnIyZmJfcGNpX2RyaXZlcik7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2
b2lkIF9fZXhpdCBwdnIyZmJfcGNpX2V4aXQodm9pZCkKPiArc3RhdGljIHZvaWQgcHZyMmZiX3Bj
aV9leGl0KHZvaWQpCj4gIHsKPiAgCXBjaV91bnJlZ2lzdGVyX2RyaXZlcigmcHZyMmZiX3BjaV9k
cml2ZXIpOwo+ICB9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
