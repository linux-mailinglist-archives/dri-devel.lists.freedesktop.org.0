Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BDE1DA9F2
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 07:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3563E89F71;
	Wed, 20 May 2020 05:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0C289F71
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 05:33:05 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200520053303epoutp01af6f1fdc924245cc8aff94ef4fb7aa7c~QpaHbzjkR2430024300epoutp01c
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 05:33:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200520053303epoutp01af6f1fdc924245cc8aff94ef4fb7aa7c~QpaHbzjkR2430024300epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589952783;
 bh=C6AurNYTbyjZQ7T4M/l1gdlhyEAt+u9mfH4DDB785aE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=R7UwtBOLlFhsue8KW3W1ICeuQK3ekWrmxMpHksRwgNi87kmIMGOlDLLBOQEi88ODd
 vDZ7a67Bj7ExaMK65tn1hGcogqnfTmAHFKsbFSnE+hrKlBk3U6/JLcmDsgzKtYPCZN
 xX0aO8ZTVBghv8JPIRFuGStj81oByElikpSYATFs=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200520053302epcas1p2b87745894423cce46640ae01c47407b4~QpaGiX5NB2310723107epcas1p2I;
 Wed, 20 May 2020 05:33:02 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.152]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 49RhGz3PSrzMqYkl; Wed, 20 May
 2020 05:32:59 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 F1.E9.04648.801C4CE5; Wed, 20 May 2020 14:32:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200520053255epcas1p10e6fb129b98c5a2627e0387033025be5~QpaAyzNlM1276212762epcas1p1P;
 Wed, 20 May 2020 05:32:55 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200520053255epsmtrp1c0f6234ee815c486e6cf8bec572fa4e3~QpaAx-cLc2704527045epsmtrp1N;
 Wed, 20 May 2020 05:32:55 +0000 (GMT)
X-AuditID: b6c32a37-1f3ff70000001228-97-5ec4c108b7a8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A4.D4.25866.701C4CE5; Wed, 20 May 2020 14:32:55 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200520053255epsmtip21e4b5ba59df548e58e79e419319e67c4~QpaAcQh_90205302053epsmtip2k;
 Wed, 20 May 2020 05:32:55 +0000 (GMT)
Subject: Re: [PATCH v2] drm/exynos: Remove dev_err() on platform_get_irq()
 failure
To: Tamseel Shams <m.shams@samsung.com>, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie,
 daniel@ffwll.ch
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <fa372f07-abba-a296-c315-e9769fb43623@samsung.com>
Date: Wed, 20 May 2020 14:38:16 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200519104904.59246-1-m.shams@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNJsWRmVeSWpSXmKPExsWy7bCmri7HwSNxBm0PxSx6z51ksngwbxub
 xf9tE5ktrnx9z2bx4t5FFovz5zewW5xtesNusenxNVaLy7vmsFnMOL+PyeJu62J2iyMPd7Nb
 zJj8ks2B12PvtwUsHptWdbJ5bP/2gNXjfvdxJo/NS+o9+rasYvT4vEkugD0q2yYjNTEltUgh
 NS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6FolhbLEnFKgUEBicbGS
 vp1NUX5pSapCRn5xia1SakFKToFlgV5xYm5xaV66XnJ+rpWhgYGRKVBhQnbG/glKBUekKq7e
 3sHewPhXtIuRk0NCwESic8Yqxi5GLg4hgR2MEnNenGeCcD4xSlw/28gGUiUk8JlRon2pbRcj
 B1jHzKkJEDW7GCVe7ZzECuG8Z5S4tPkIE0iDsECIxOS7G8DGigjMYpRY/KyZBSTBLHCRUaJ7
 RRCIzSagKjFxxX2wDbwCdhI7ru1hBbFZgOKdbXdZQbaJCkRInP6aCFEiKHFy5hOwMZwClhIf
 +9azQowUl7j1ZD4ThC0v0bx1NjPIXgmBIxwSHU8uMEL86SKxY+s0NghbWOLV8S3sELaUxMv+
 NnaIhmZGiYkzTjNBOB2MEncfX2eBqDKW2L90MhPIRcwCmhLrd+lDhBUldv6eywixmU/i3dce
 VkgQ8Up0tAlBlChJHLt4A+oGCYkLSyZC3eAh8fX2MrYJjIqzkPw2C8k/s5D8Mwth8QJGllWM
 YqkFxbnpqcWGBcbIkb2JEZyQtcx3MG4453OIUYCDUYmH98bOw3FCrIllxZW5hxglOJiVRHgn
 vDgUJ8SbklhZlVqUH19UmpNafIjRFBjyE5mlRJPzgdkiryTe0NTI2NjYwsTQzNTQUEmcd+r1
 nDghgfTEktTs1NSC1CKYPiYOTqkGRg3r6ka9Zf0eGW1NHd+vz4/okm11v7xA6VtNa2SclOj1
 eyaGHZsPvqnk3bd+QvjXr69eZxr37Txnxf/4kNKj6bN6fs079zzBRSqPjTU0pp/1p8jO7UfS
 QhMeJHY7nPm26PvW2z8mtLWmr5u1S+HG4iYG5yn3rRWit16d9852BgdzcMrSji0LY5RYijMS
 DbWYi4oTAZqnRKHeAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRmVeSWpSXmKPExsWy7bCSvC77wSNxBgvOGlr0njvJZPFg3jY2
 i//bJjJbXPn6ns3ixb2LLBbnz29gtzjb9IbdYtPja6wWl3fNYbOYcX4fk8Xd1sXsFkce7ma3
 mDH5JZsDr8febwtYPDat6mTz2P7tAavH/e7jTB6bl9R79G1ZxejxeZNcAHsUl01Kak5mWWqR
 vl0CV8b+CUoFR6Qqrt7ewd7A+Fe0i5GDQ0LARGLm1IQuRi4OIYEdjBIL3v5hg4hLSGzZygFh
 CkscPlwMUfKWUWLm67MsXYycHMICIRKT725gBLFFBGYxSrR9rAaxmQUuMkps3Z8H0dDDKPF6
 +yomkASbgKrExBX32UBsXgE7iR3X9rCC2CxA8c62u2C2qECExPPtNxghagQlTs58AraMU8BS
 4mPfelaIBeoSf+ZdYoawxSVuPZnPBGHLSzRvnc08gVFoFpL2WUhaZiFpmYWkZQEjyypGydSC
 4tz03GLDAqO81HK94sTc4tK8dL3k/NxNjOD409Lawbhn1Qe9Q4xMHIyHGCU4mJVEeCe8OBQn
 xJuSWFmVWpQfX1Sak1p8iFGag0VJnPfrrIVxQgLpiSWp2ampBalFMFkmDk6pBiaHXNZY8eWK
 Pw21pZIydu1zzK9ad3vf6gXl5efU2AyDrxufCL5R3ixnvnFa9fYXJtsfvlx543jU2tV5YjO4
 j9yqDsgvvW3lMv8368WZrx0+H1V3OPpz0ymjqynbsm8f15eT378udf4j0/R7WpdjG0Om7X78
 2sFzfeINNxsuVul/dVePOtpYul1wn/d+b911vlUXf4Ww/nsl8cOlt503wGz36b0H5q9ULTZP
 90x1sXyl2v2iac2laRlbJwhvTf4ru3L3UsXaOefSr/DnX+s6bHegMPRf2yzel3Fs6ToZLhde
 +HyzOi+Z7frb/vPy0M+vy8+FRrnMWKq+RP773neL3NOWr1f5sm7tad1W9kffPLe3KbEUZyQa
 ajEXFScCAECGCTcuAwAA
X-CMS-MailID: 20200520053255epcas1p10e6fb129b98c5a2627e0387033025be5
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200519110323epcas5p23b9472d505f5ba58d033fa468cb9969d
References: <CGME20200519110323epcas5p23b9472d505f5ba58d033fa468cb9969d@epcas5p2.samsung.com>
 <20200519104904.59246-1-m.shams@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, shaik.ameer@samsung.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org, dri-devel@lists.freedesktop.org,
 alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGFtc2VlbCwKClNhbWUgcGF0Y2hbMV0gaGFzIGJlZW4gbWVyZ2VkLiBTbyBjb3VsZCB5b3Ug
cmUtcG9zdCB0aGlzIHBhdGNoIGFmdGVyIHJlYmFzaW5nIGl0IG9uIHRvcCBvZiBleHlub3MtZHJt
LW5leHQgYnJhbmNoPwpBZnRlciByZWJhc2UsIG9ubHkgZzJkIHBhcnQgd291bGQgYmUgdmFsaWQu
CgpUaGFua3MsCklua2kgRGFlCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvZGFlaW5raS9kcm0tZXh5bm9zLmdpdC9jb21taXQvP2g9ZXh5bm9zLWRy
bS1uZXh0JmlkPWZkZDc5YjBkYjE4OTlmOTE1ZjQ4OWU3NDRhMDY4NDYyODRmYTNmMWUKCjIwLiA1
LiAxOS4g7Jik7ZuEIDc6NDnsl5AgVGFtc2VlbCBTaGFtcyDsnbQo6rCAKSDsk7Qg6riAOgo+IHBs
YXRmb3JtX2dldF9pcnEoKSB3aWxsIGNhbGwgZGV2X2VycigpIGl0c2VsZiBvbiBmYWlsdXJlLAo+
IHNvIHRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoZSBkcml2ZXIgdG8gYWxzbyBkbyB0aGlzLgo+IFRo
aXMgaXMgZGV0ZWN0ZWQgYnkgY29jY2luZWxsZS4KPiAKPiBBbHNvIHJlbW92aW5nIHVubmVjZXNz
YXJ5IGN1cmx5IGJyYWNlcyBhcm91bmQgaWYgKCkgc3RhdGVtZW50Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFRhbXNlZWwgU2hhbXMgPG0uc2hhbXNAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gRml4ZWQgcmV2
aWV3IGNvbW1lbnQgYnkgam9lQHBlcmNoZXMuY29tCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9kc2kuYyAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHJtX2cyZC5jICAgICB8IDEgLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fcm90YXRvci5jIHwgNCArLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2RybV9zY2FsZXIuYyAgfCA0ICstLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZHNpLmMKPiBpbmRleCA5MDI5MzhkMjU2OGYuLjk1OGUyYzZhNjcwMiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiBAQCAtMTgwOSwxMCArMTgwOSw4IEBA
IHN0YXRpYyBpbnQgZXh5bm9zX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ICAJfQo+ICAKPiAgCWRzaS0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPiAt
CWlmIChkc2ktPmlycSA8IDApIHsKPiAtCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZXF1ZXN0
IGRzaSBpcnEgcmVzb3VyY2VcbiIpOwo+ICsJaWYgKGRzaS0+aXJxIDwgMCkKPiAgCQlyZXR1cm4g
ZHNpLT5pcnE7Cj4gLQl9Cj4gIAo+ICAJaXJxX3NldF9zdGF0dXNfZmxhZ3MoZHNpLT5pcnEsIElS
UV9OT0FVVE9FTik7Cj4gIAlyZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKGRldiwgZHNp
LT5pcnEsIE5VTEwsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9nMmQuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYwo+IGlu
ZGV4IGZjZWUzM2E0M2FjYS4uMDNiZTMxNDI3MTgxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9nMmQuYwo+IEBAIC0xNDk4LDcgKzE0OTgsNiBAQCBzdGF0aWMgaW50IGcy
ZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAKPiAgCWcyZC0+aXJxID0g
cGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPiAgCWlmIChnMmQtPmlycSA8IDApIHsKPiAtCQlk
ZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgaXJxXG4iKTsKPiAgCQlyZXQgPSBnMmQtPmlycTsK
PiAgCQlnb3RvIGVycl9wdXRfY2xrOwo+ICAJfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fcm90YXRvci5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX3JvdGF0b3IuYwo+IGluZGV4IGRhZmE4N2I4MjA1Mi4uMmQ5NGFmYmEwMzFlIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9yb3RhdG9yLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fcm90YXRvci5jCj4gQEAg
LTI5MywxMCArMjkzLDggQEAgc3RhdGljIGludCByb3RhdG9yX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gIAkJcmV0dXJuIFBUUl9FUlIocm90LT5yZWdzKTsKPiAgCj4gIAlp
cnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+IC0JaWYgKGlycSA8IDApIHsKPiAtCQlk
ZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgaXJxXG4iKTsKPiArCWlmIChpcnEgPCAwKQo+ICAJ
CXJldHVybiBpcnE7Cj4gLQl9Cj4gIAo+ICAJcmV0ID0gZGV2bV9yZXF1ZXN0X2lycShkZXYsIGly
cSwgcm90YXRvcl9pcnFfaGFuZGxlciwgMCwgZGV2X25hbWUoZGV2KSwKPiAgCQkJICAgICAgIHJv
dCk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9zY2Fs
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9zY2FsZXIuYwo+IGluZGV4
IDkzYzQzYzhkOTE0ZS4uY2UxODU3MTM4Zjg5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9zY2FsZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9zY2FsZXIuYwo+IEBAIC01MDIsMTAgKzUwMiw4IEBAIHN0YXRpYyBpbnQg
c2NhbGVyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJcmV0dXJuIFBU
Ul9FUlIoc2NhbGVyLT5yZWdzKTsKPiAgCj4gIAlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYs
IDApOwo+IC0JaWYgKGlycSA8IDApIHsKPiAtCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQg
aXJxXG4iKTsKPiArCWlmIChpcnEgPCAwKQo+ICAJCXJldHVybiBpcnE7Cj4gLQl9Cj4gIAo+ICAJ
cmV0ID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycShkZXYsIGlycSwgTlVMTCwJc2NhbGVyX2ly
cV9oYW5kbGVyLAo+ICAJCQkJCUlSUUZfT05FU0hPVCwgImRybV9zY2FsZXIiLCBzY2FsZXIpOwo+
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
