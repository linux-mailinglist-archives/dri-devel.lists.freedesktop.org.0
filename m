Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB6A1B5E67
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 16:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A4B6E884;
	Thu, 23 Apr 2020 14:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1B26E884
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:55:38 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200423145536euoutp0213401e0a12b62330d6dca673801c702a~Ieqlvuot93032730327euoutp02c
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:55:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200423145536euoutp0213401e0a12b62330d6dca673801c702a~Ieqlvuot93032730327euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587653736;
 bh=4jBedYbVs9iPISb4SHRfEbPFJqP00QurHGBQmIMMH9o=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=KmXYnhcFiNWsqafuebllh6+baVzXgyJ35Y/K6QD6Tr++BrpHYhXI/OhzxCArk9+kT
 awrP/Wa4vz3+aJSzNTLu1EyVF/chzn0/E1cpk6K3JawP18fEosiwmFRyNcRTD4GgY0
 x8ANFqiUqjb/bkrr0fv5bwfosG9SGDYL1CID2ckY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200423145536eucas1p11d03e6479cd7a4ae7276a37b6d2c144f~IeqlZ1cJj3041030410eucas1p1Q;
 Thu, 23 Apr 2020 14:55:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3E.4A.60698.86CA1AE5; Thu, 23
 Apr 2020 15:55:36 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200423145536eucas1p1d17d340c8ac30b9e186bfaeaf593f1b4~IeqlFFyEW3041030410eucas1p1N;
 Thu, 23 Apr 2020 14:55:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200423145536eusmtrp14eaca221daa39987e6c63814679c691d~IeqlEWxNm1059810598eusmtrp1I;
 Thu, 23 Apr 2020 14:55:36 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-85-5ea1ac689cbc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A3.6B.08375.76CA1AE5; Thu, 23
 Apr 2020 15:55:35 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200423145535eusmtip16a9e68a9b4493120f55398ce1a99fd94~Ieqkkhsqz1968119681eusmtip1u;
 Thu, 23 Apr 2020 14:55:35 +0000 (GMT)
Subject: Re: [PATCH v2] console: console: Complete exception handling in
 newport_probe()
To: Dejin Zheng <zhengdejin5@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <081f8192-1708-80ff-6eef-885d72bdf5c5@samsung.com>
Date: Thu, 23 Apr 2020 16:55:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200423142627.1820-1-zhengdejin5@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOKsWRmVeSWpSXmKPExsWy7djPc7oZaxbGGTRPErV4OeEwo8WVr+/Z
 LDpnXmO0aF68ns3iRN8HVovLu+awWVzao2KxedNUZovDTQeZLXY9usnswOXRemk5i8fOWXfZ
 PT58jPN4d+4cu8fRlWuZPPbPXcPucb/7OJPH501yARxRXDYpqTmZZalF+nYJXBlnFjSxFTQK
 VEy99pq5gbGPt4uRg0NCwERi8Ra2LkYuDiGBFYwSbQcaGSGcL4wSy68fZ4dwPjNKLN03AaiM
 E6yj59cKqJbljBKXP0xhhnDeMkoc7H7GCDJXWCBK4uMxTpAGEQF1iZkt/SwgNcwC3UwSr083
 gE1iE7CSmNi+ihHE5hWwk1j8tpkJxGYRUJX4tvEDC4gtKhAh8enBYVaIGkGJkzOfgMU5gXr/
 7D8FFmcWEJe49WQ+E4QtL9G8dTbYQRIC99glln87ygRxtovEkxNN7BC2sMSr41ugbBmJ05N7
 WCAa1jFK/O14AdW9HRgCk/9BPW0tcefcLzaQ15gFNCXW79KHCDtKfNi1hA0SknwSN94KQhzB
 JzFp23RmiDCvREebEES1msSGZRvYYNZ27VzJPIFRaRaS12YheWcWkndmIexdwMiyilE8tbQ4
 Nz212DgvtVyvODG3uDQvXS85P3cTIzB5nf53/OsOxn1/kg4xCnAwKvHwGpQujBNiTSwrrsw9
 xCjBwawkwrvh4bw4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17GCgmkJ5akZqemFqQWwWSZ
 ODilGhj5nv5I0zVbwOnI/61jemo/t7mtjel+QaEydS2mvjUrwn0CV7i4lDb+6mq6uHq5n0fg
 5s+yU1LY3kWqPHmyL/SXtNIX4cylLb/eXz48UXn31Mdv90U08rOWZ2Quf2f6+fG61YILDshK
 Km2/Hvj12hoR6QlTEj++sfNJTNp052vezFc5+YfNzwcrsRRnJBpqMRcVJwIAhgtLnVoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsVy+t/xu7rpaxbGGfS/trJ4OeEwo8WVr+/Z
 LDpnXmO0aF68ns3iRN8HVovLu+awWVzao2KxedNUZovDTQeZLXY9usnswOXRemk5i8fOWXfZ
 PT58jPN4d+4cu8fRlWuZPPbPXcPucb/7OJPH501yARxRejZF+aUlqQoZ+cUltkrRhhZGeoaW
 FnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlnFjSxFTQKVEy99pq5gbGPt4uRk0NCwESi
 59cKti5GLg4hgaWMEuvnrmXsYuQASshIHF9fBlEjLPHnWhdUzWtGiemXVrKA1AgLREl8PMYJ
 UiMioC4xs6WfBaSGWaCbSeLeq72MEA29jBJLTkxnB6liE7CSmNi+ihHE5hWwk1j8tpkJxGYR
 UJX4tvEDC4gtKhAhcXjHLKgaQYmTM5+AxTmBev/sP8UKYjMDbfsz7xIzhC0ucevJfCYIW16i
 eets5gmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucWG+oVJ+YWl+al6yXn525iBEbrtmM/
 N+9gvLQx+BCjAAejEg/vjaKFcUKsiWXFlbmHGCU4mJVEeDc8nBcnxJuSWFmVWpQfX1Sak1p8
 iNEU6LmJzFKiyfnARJJXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNT
 qoGRu+BVlJ+tQ/LDI+8rHiyw1og5U3blvpRH++lI7YD7DeFm/Rs2+k2rWnvS/zxHD3Or/GNu
 62MVJSvmpR7ZvLml1fX0r5yG6fMmec2e6y5zRSeXkY/9o7XhSb2VLCxfnVjn9S048Hjr75yT
 G/w3BxzWYOdaEP5vXt4T/ov3DhebH275kxLPI/JeiaU4I9FQi7moOBEAYiueT+wCAAA=
X-CMS-MailID: 20200423145536eucas1p1d17d340c8ac30b9e186bfaeaf593f1b4
X-Msg-Generator: CA
X-RootMTR: 20200423142637eucas1p2ea543e281d96c75aa4292b49756f2146
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200423142637eucas1p2ea543e281d96c75aa4292b49756f2146
References: <CGME20200423142637eucas1p2ea543e281d96c75aa4292b49756f2146@eucas1p2.samsung.com>
 <20200423142627.1820-1-zhengdejin5@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, tsbogend@alpha.franken.de,
 FlorianSchandinat@gmx.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, ralf@linux-mips.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpLAoKSSBiZWxpZXZlIHRoYXQgdGhlIHBhdGNoIHN1bW1hcnkgbGluZSBzaG91bGQgYmU6Cgoi
W1BBVENIIHYyXSBjb25zb2xlOiBuZXdwb3J0X2NvbjogLi4uIgoKT24gNC8yMy8yMCA0OjI2IFBN
LCBEZWppbiBaaGVuZyB3cm90ZToKPiBBIGNhbGwgb2YgdGhlIGZ1bmN0aW9uIMKhwrBkb190YWtl
X292ZXJfY29uc29sZcKhwrEgY2FuIGZhaWwgaGVyZS4KPiBUaGUgY29ycmVzcG9uZGluZyBzeXN0
ZW0gcmVzb3VyY2VzIHdlcmUgbm90IHJlbGVhc2VkIHRoZW4uCj4gVGh1cyBhZGQgYSBjYWxsIG9m
IHRoZSBmdW5jdGlvbiDCocKwaW91bm1hcMKhwrEgdG9nZXRoZXIgd2l0aCB0aGUgY2hlY2sKPiBv
ZiBhIGZhaWx1cmUgcHJlZGljYXRlLgo+IAo+IEZpeGVzOiBlODRkZTBjNjE5MDUwMyAoIk1JUFM6
IEdJTyBidXMgc3VwcG9ydCBmb3IgU0dJIElQMjIvMjgiKQoKSSBjYW5ub3Qgc2VlIGhvdyB0aGlz
IHBhdGNoIGZpeGVzIGNvbW1pdCBlODRkZTBjNjE5MDUwMwooQUZBSUNTIG5wcmVncyBoYXMgYWxz
byBiZWVuIGxlYWtlZCBvbiBlcnJvciBiZWZvcmUpPwoKPiBDQzogQW5keSBTaGV2Y2hlbmtvIDxh
bmR5LnNoZXZjaGVua29AZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERlamluIFpoZW5nIDx6
aGVuZ2RlamluNUBnbWFpbC5jb20+Cj4gLS0tCj4gdjEgLT4gdjI6Cj4gCS0gbW9kaWZ5IHRoZSBj
b21taXQgY29tbWVudHMgYnkgTWFya3VzJ3N1Z2dlc3Rpb24uCj4gCj4gIGRyaXZlcnMvdmlkZW8v
Y29uc29sZS9uZXdwb3J0X2Nvbi5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvbmV3cG9ydF9j
b24uYyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS9uZXdwb3J0X2Nvbi5jCj4gaW5kZXggMDBkZGRm
NmUwOGIwLi42YmZjOGUzZmZkNGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9jb25zb2xl
L25ld3BvcnRfY29uLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvbmV3cG9ydF9jb24u
Ywo+IEBAIC03MjAsNiArNzIwLDkgQEAgc3RhdGljIGludCBuZXdwb3J0X3Byb2JlKHN0cnVjdCBn
aW9fZGV2aWNlICpkZXYsCj4gIAljb25zb2xlX2xvY2soKTsKPiAgCWVyciA9IGRvX3Rha2Vfb3Zl
cl9jb25zb2xlKCZuZXdwb3J0X2NvbiwgMCwgTUFYX05SX0NPTlNPTEVTIC0gMSwgMSk7Cj4gIAlj
b25zb2xlX3VubG9jaygpOwo+ICsKPiArCWlmIChlcnIpCj4gKwkJaW91bm1hcCgodm9pZCAqKW5w
cmVncyk7CgpMb29rcyBPSyBidXQgd2hpbGUgeW91IGFyZSBhdCBpdCwgY291bGQgeW91IHBsZWFz
ZSBhbHNvIGFkZCBtaXNzaW5nCnJlbGVhc2VfbWVtX3JlZ2lvbigpIG9uIGVycm9yIGFuZCBvbiBk
ZXZpY2UgcmVtb3ZhbDoKCgluZXdwb3J0X2FkZHIgPSBkZXYtPnJlc291cmNlLnN0YXJ0ICsgMHhG
MDAwMDsKCWlmICghcmVxdWVzdF9tZW1fcmVnaW9uKG5ld3BvcnRfYWRkciwgMHgxMDAwMCwgIk5l
d3BvcnQiKSkKCQlyZXR1cm4gLUVOT0RFVjsKCglucHJlZ3MgPSAoc3RydWN0IG5ld3BvcnRfcmVn
cyAqKS8qIGlvcmVtYXAgY2Fubm90IGZhaWwgKi8KCQlpb3JlbWFwKG5ld3BvcnRfYWRkciwgc2l6
ZW9mKHN0cnVjdCBuZXdwb3J0X3JlZ3MpKTsKCWNvbnNvbGVfbG9jaygpOwoJZXJyID0gZG9fdGFr
ZV9vdmVyX2NvbnNvbGUoJm5ld3BvcnRfY29uLCAwLCBNQVhfTlJfQ09OU09MRVMgLSAxLCAxKTsK
CWNvbnNvbGVfdW5sb2NrKCk7CglyZXR1cm4gZXJyOwp9CgpzdGF0aWMgdm9pZCBuZXdwb3J0X3Jl
bW92ZShzdHJ1Y3QgZ2lvX2RldmljZSAqZGV2KQp7CglnaXZlX3VwX2NvbnNvbGUoJm5ld3BvcnRf
Y29uKTsKCWlvdW5tYXAoKHZvaWQgKilucHJlZ3MpOwp9Cgo/Cgo+ICAJcmV0dXJuIGVycjsKPiAg
fQo+ICAKCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpTYW1zdW5n
IFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
