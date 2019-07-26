Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E488B76C25
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 16:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB9E6ED9B;
	Fri, 26 Jul 2019 14:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC696ED9B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 14:56:04 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190726145603euoutp020a4d8bd9ac8980732d675fe2b2f46f73~0-NVDUNiV2582625826euoutp02d
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 14:56:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190726145603euoutp020a4d8bd9ac8980732d675fe2b2f46f73~0-NVDUNiV2582625826euoutp02d
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190726145603eucas1p2927ed7fc5abdc7e91a7bedf4b524cf54~0-NUty3DO0069700697eucas1p2P;
 Fri, 26 Jul 2019 14:56:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 60.75.04298.2841B3D5; Fri, 26
 Jul 2019 15:56:02 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190726145602eucas1p10c5b58e0cc5bdf499eaea4ada620eefc~0-NT7PIdx1003510035eucas1p1l;
 Fri, 26 Jul 2019 14:56:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190726145602eusmtrp29b7fed674c90597e17bd41b412f703a8~0-NTtHzq42451324513eusmtrp23;
 Fri, 26 Jul 2019 14:56:02 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-8a-5d3b14820158
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A9.7B.04146.1841B3D5; Fri, 26
 Jul 2019 15:56:02 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190726145601eusmtip1c9f008916d65059ed21aa5cd7301e6bb~0-NTe8qWR2629526295eusmtip1B;
 Fri, 26 Jul 2019 14:56:01 +0000 (GMT)
Subject: Re: [PATCH] video: Demote panel timing not found error message
To: Sam Ravnborg <sam@ravnborg.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <e9bf4cf5-f4de-0a3b-52f4-67f1ae7af5b9@samsung.com>
Date: Fri, 26 Jul 2019 16:56:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190726113625.GC20065@ravnborg.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsWy7djP87pNItaxBqe2G1tc+fqezeJE3wdW
 ixU/tzJa/Nw1j8WBxWPnrLvsHve7jzN5LJl2lc3j8ya5AJYoLpuU1JzMstQifbsEroy2W+uZ
 CqZJVvxc+IapgXG7SBcjJ4eEgInE3e2/GLsYuTiEBFYwSlw79JQZwvnCKPF9ZSsbhPOZUWLC
 ji6mLkYOsJY9hwwg4ssZJZrnHoLqeMso8fPoKyaQucIC7hKLmt4ygtgiAsoSx89fYwWxmQVy
 JVZPXggWZxOwkpjYvgrM5hWwk2iffZMNxGYRUJXYtuovC4gtKhAhcf/YBlaIGkGJkzOfgMU5
 BYwkFt7cywwxU1zi1pP5TBC2vMT2t3PADpIQmMwu8fLnEmaIR10ktt4/wwRhC0u8Or6FHcKW
 kfi/E6QZpGEdo8TfjhdQ3dsZJZZP/scGUWUtcfj4RVaQ/5kFNCXW79KHCDtKHLs8kxkSLHwS
 N94KQhzBJzFp23SoMK9ER5sQRLWaxIZlG9hg1nbtXMk8gVFpFpLXZiF5ZxaSd2Yh7F3AyLKK
 UTy1tDg3PbXYMC+1XK84Mbe4NC9dLzk/dxMjMLmc/nf80w7Gr5eSDjEKcDAq8fAG/LSKFWJN
 LCuuzD3EKMHBrCTCu3WHZawQb0piZVVqUX58UWlOavEhRmkOFiVx3mqGB9FCAumJJanZqakF
 qUUwWSYOTqkGRodNDr8CL5xjt5jYy7ilIelfQ80ftjebbF7mGPr5Oa+NmHTty+0p53QmTrzD
 361W4VDIdensbGFbnvxVPH+l3l02C204PK3kVbTzl2lvfvRtXnArQado+olb1num9GY5/727
 Tc8rjSFJ2ttlUuaOoqqe7ZkJDFIvbetn7mw/JHvuKIuLXeEuESWW4oxEQy3mouJEAIJ6FdMq
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7pNItaxBnfeMlpc+fqezeJE3wdW
 ixU/tzJa/Nw1j8WBxWPnrLvsHve7jzN5LJl2lc3j8ya5AJYoPZui/NKSVIWM/OISW6VoQwsj
 PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYy2W+uZCqZJVvxc+IapgXG7SBcjB4eE
 gInEnkMGXYxcHEICSxklNh57yQwRl5E4vr6si5ETyBSW+HOtiw2i5jWjxPnTB5lAEsIC7hKL
 mt4ygtgiAsoSx89fYwWxmQVyJXo2b2eFaNjJKPHqwxywBJuAlcTE9lVgDbwCdhLts2+ygdgs
 AqoS21b9ZQGxRQUiJM68X8ECUSMocXLmEzCbU8BIYuHNvcwQC9Ql/sy7BGWLS9x6Mp8JwpaX
 2P52DvMERqFZSNpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQJjadux
 n5t3MF7aGHyIUYCDUYmHN+CnVawQa2JZcWXuIUYJDmYlEd6tOyxjhXhTEiurUovy44tKc1KL
 DzGaAj03kVlKNDkfGOd5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4
 pRoYberDJleUPGY4fJtjtnzStrtnFpj9+7tgUmpM1ZM5DK07sv22KRTzLXz8XODSxMp4k/CL
 JXf57+29caN2ypPtr1163tYrhHEsOH5G48szoYq36zXYHk64LlFdo7rux4Rlv5nvv5dcxrur
 Ki98huiFtJ4upbTFD/odO+Wkcj+cebCgkV9Hm2ubqhJLcUaioRZzUXEiAAzYWsq7AgAA
X-CMS-MailID: 20190726145602eucas1p10c5b58e0cc5bdf499eaea4ada620eefc
X-Msg-Generator: CA
X-RootMTR: 20190726113631epcas1p4159fcc746f1409b6b16c7912968b65d2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190726113631epcas1p4159fcc746f1409b6b16c7912968b65d2
References: <20190726101849.27322-1-thierry.reding@gmail.com>
 <CGME20190726113631epcas1p4159fcc746f1409b6b16c7912968b65d2@epcas1p4.samsung.com>
 <20190726113625.GC20065@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1564152963;
 bh=LxoHOsIrXQtmvQEc4eZgBrguRkQWrR1UdLrpqRZbzfE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Q2uVzJtDk09xLxeXDdeEOWM9KA40bEsEucG1m0tGwedqYu5galt6V90bcjXJO8bBx
 S9QV5U2ZaYz7Wb7nvV1IDv1kaThT+owmCrCsW/Z6cVzOsaY5l+ae/vM6s0UPjJnziV
 rp1adUhiLl2QWjM0tEOnKeJOPg53f/J3kPMnxIXo=
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
Cc: linux-fbdev@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIFNhbSwKCk9uIDcvMjYvMTkgMTozNiBQTSwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IEhpIFRo
aWVycnkuCj4gCj4gT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTI6MTg6NDlQTSArMDIwMCwgVGhp
ZXJyeSBSZWRpbmcgd3JvdGU6Cj4+IEZyb206IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+Cj4+Cj4+IEZhaWxpbmcgdG8gZmluZCBhIHBhbmVsLXRpbWluZyBub2RlIGlzIG5vdCBh
biBlcnJvciBpbiBhbGwgY2FzZXMsIHNvIGRvCj4+IG5vdCBvdXRwdXQgYW4gZXJyb3IgbWVzc2Fn
ZSBpbiB0aGF0IGNhc2UuIEluc3RlYWQgdHVybiBpdCBpbnRvIGEgZGVidWcKPj4gbWVzc2FnZSBh
bmQgbWFrZSB0aGUgZHJpdmVycyB0aGF0IGNhcmUgYWJvdXQgaXQgb3V0cHV0IGFuIGVycm9yIG1l
c3NhZ2UKPj4gb2YgdGhlaXIgb3duLgo+IAo+IFRoaXMgaXMgbW9yZSBvciBsZXNzIHRoZSBzYW1l
IGFzIGFscmVhZHkgaW1wbG1lbnRlZCBieSBEb3VnbGFzIGhlcmU6Cj4gaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9jb3Zlci8xMTA1MzI0My8KPiAKPiBEb3VnJ3MgaGFzIGFuIGV4dHJhIGJ1
Zy1maXggdGhhdCB3ZSBzaGFsbCBub3QgbWlzcy4KPiAKPiBJIGFtIHdhaXRpbmcgZm9yIGZlZWRi
YWNrIGZyb20gQmFydGxvbWllaiBiZWZvcmUgcHJvY2VlZGluZy4KClRoZSBwYXRjaHNldCBpcyBp
biBkcm0tbWlzYy1uZXh0IHRyZWUgbm93LgoKPiBJIGd1ZXNzIGhlIGlzIG9uIGhvbGlkYXkgc29t
ZXdoZXJlIGFuZCB3aWxsIHJldHVybiBzb29uLgoKSSB3aXNoIGl0IHdhcyB0aGUgY2FzZS4gOy0p
CgpJJ3ZlIGp1c3QgYmVlbiBidXN5IHdpdGggb3RoZXIgdGhpbmdzICh0aGUgcGF0Y2hzZXQgaGFz
IGJlZW4gcG9zdGVkCmp1c3QgZmV3IGRheXMgYWdvIGFuZCB0aGUgaXNzdWUgYWRkcmVzc2VkIGlz
IG5vdCBjcml0aWNhbCkuCgpQUyBXaGVuIEkgZ28gb24gaG9saWRheXMgSSBzZXQgYXV0b21hdGlj
IG91dCBvZiBvZmZpY2UgcmVwbHkgYW5kCmFsc28gYW5ub3VuY2UgaXQgb24gdGhlIG1haWxpbmct
bGlzdCAoZm9yIGxvbmdlciBob2xpZGF5cykuCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWog
Wm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0
cm9uaWNzCgo+IAlTYW0KPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRy
ZWRpbmdAbnZpZGlhLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
bHZkcy5jIHwgNCArKystCj4+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2FtYmEtY2xjZC5jICAgIHwg
NCArKystCj4+ICBkcml2ZXJzL3ZpZGVvL29mX2Rpc3BsYXlfdGltaW5nLmMgIHwgMiArLQo+PiAg
MyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYwo+PiBpbmRleCAxZWM1N2QwODA2YTguLjdmY2IzNTI3
Yzc4OCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYwo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jCj4+IEBAIC0xNDcsOCAr
MTQ3LDEwIEBAIHN0YXRpYyBpbnQgcGFuZWxfbHZkc19wYXJzZV9kdChzdHJ1Y3QgcGFuZWxfbHZk
cyAqbHZkcykKPj4gIAlpbnQgcmV0Owo+PiAgCj4+ICAJcmV0ID0gb2ZfZ2V0X2Rpc3BsYXlfdGlt
aW5nKG5wLCAicGFuZWwtdGltaW5nIiwgJnRpbWluZyk7Cj4+IC0JaWYgKHJldCA8IDApCj4+ICsJ
aWYgKHJldCA8IDApIHsKPj4gKwkJZGV2X2VycihsdmRzLT5kZXYsICIlcE9GOiBjb3VsZCBub3Qg
ZmluZCBwYW5lbCB0aW1pbmdcbiIsIG5wKTsKPj4gIAkJcmV0dXJuIHJldDsKPj4gKwl9Cj4+ICAK
Pj4gIAl2aWRlb21vZGVfZnJvbV90aW1pbmcoJnRpbWluZywgJmx2ZHMtPnZpZGVvX21vZGUpOwo+
PiAgCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2FtYmEtY2xjZC5jIGIvZHJp
dmVycy92aWRlby9mYmRldi9hbWJhLWNsY2QuYwo+PiBpbmRleCA4OTMyNGU0MmEwMzMuLjEzZGY4
OThhMzQ4MSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9hbWJhLWNsY2QuYwo+
PiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2FtYmEtY2xjZC5jCj4+IEBAIC01NjEsOCArNTYx
LDEwIEBAIHN0YXRpYyBpbnQgY2xjZGZiX29mX2dldF9kcGlfcGFuZWxfbW9kZShzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5vZGUsCj4+ICAJc3RydWN0IHZpZGVvbW9kZSB2aWRlbzsKPj4gIAo+PiAgCWVy
ciA9IG9mX2dldF9kaXNwbGF5X3RpbWluZyhub2RlLCAicGFuZWwtdGltaW5nIiwgJnRpbWluZyk7
Cj4+IC0JaWYgKGVycikKPj4gKwlpZiAoZXJyKSB7Cj4+ICsJCXByX2VycigiJXBPRjogY291bGQg
bm90IGZpbmQgcGFuZWwgdGltaW5nXG4iLCBub2RlKTsKPj4gIAkJcmV0dXJuIGVycjsKPj4gKwl9
Cj4+ICAKPj4gIAl2aWRlb21vZGVfZnJvbV90aW1pbmcoJnRpbWluZywgJnZpZGVvKTsKPj4gIAo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9vZl9kaXNwbGF5X3RpbWluZy5jIGIvZHJpdmVy
cy92aWRlby9vZl9kaXNwbGF5X3RpbWluZy5jCj4+IGluZGV4IGY1YzFjNDY5YzBhZi4uOTM4NWI1
MTgzNDlmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL29mX2Rpc3BsYXlfdGltaW5nLmMK
Pj4gKysrIGIvZHJpdmVycy92aWRlby9vZl9kaXNwbGF5X3RpbWluZy5jCj4+IEBAIC0xMjUsNyAr
MTI1LDcgQEAgaW50IG9mX2dldF9kaXNwbGF5X3RpbWluZyhjb25zdCBzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wLCBjb25zdCBjaGFyICpuYW1lLAo+PiAgCj4+ICAJdGltaW5nX25wID0gb2ZfZ2V0X2No
aWxkX2J5X25hbWUobnAsIG5hbWUpOwo+PiAgCWlmICghdGltaW5nX25wKSB7Cj4+IC0JCXByX2Vy
cigiJXBPRjogY291bGQgbm90IGZpbmQgbm9kZSAnJXMnXG4iLCBucCwgbmFtZSk7Cj4+ICsJCXBy
X2RlYnVnKCIlcE9GOiBjb3VsZCBub3QgZmluZCBub2RlICclcydcbiIsIG5wLCBuYW1lKTsKPj4g
IAkJcmV0dXJuIC1FTk9FTlQ7Cj4+ICAJfQo+PiAgCj4+IC0tIAo+PiAyLjIyLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
