Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF39633AC38
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 08:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1286589CDF;
	Mon, 15 Mar 2021 07:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095D089CD7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 07:28:23 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210315072821epoutp016d6724eafc7bee82ded462d49000a66a~sc3J92Is31583415834epoutp01O
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 07:28:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210315072821epoutp016d6724eafc7bee82ded462d49000a66a~sc3J92Is31583415834epoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1615793301;
 bh=W4rJ99qkpqE4Aix67bTRAH3sbG9gvSQJ5mXUd21FDTU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=n7JSMmPDWhlKLdjm2cp5csxx87Vk1dOwy96DIh2s/lTm16tUlz1nVFhWAvxUkWbDh
 xolNBrm+eqV8zZdzOJt7M/jpA7qRqofIub7xzzTFCtC9hAmM/bNJih6ysXd2vBcpPd
 IsJCwES0Dqpp4l0YgEdWZaoSmvg9bBTKaEci0jZg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20210315072821epcas1p30a9d10f37a01160b78a6d3fc8126ee23~sc3JtMo9g3100331003epcas1p3j;
 Mon, 15 Mar 2021 07:28:21 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.155]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4DzSh32P2Xz4x9Px; Mon, 15 Mar
 2021 07:28:19 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 6A.7E.02418.29C0F406; Mon, 15 Mar 2021 16:28:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210315072817epcas1p2cafc753cd81b1d1171532e013eac64bd~sc3GHUmj31802018020epcas1p2l;
 Mon, 15 Mar 2021 07:28:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210315072817epsmtrp1ba30a349d27de734b18348020dd1e372~sc3GGjPvA0427604276epsmtrp1g;
 Mon, 15 Mar 2021 07:28:17 +0000 (GMT)
X-AuditID: b6c32a35-c23ff70000010972-78-604f0c9285ea
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F9.EE.13470.19C0F406; Mon, 15 Mar 2021 16:28:17 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210315072817epsmtip29fc480d31db905adc12b2c2e883c36b4~sc3F3DFmB3031630316epsmtip2S;
 Mon, 15 Mar 2021 07:28:17 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos/decon5433: Clean up GPIO includes
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 krzk@kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <ed1e2d7b-242a-7a9f-46dd-9a81af0dd19d@samsung.com>
Date: Mon, 15 Mar 2021 16:37:11 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1e83f1d7-20c7-0ab3-0d8d-e331e7e5d09c@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmge4kHv8Eg39tUha9504yWfzfNpHZ
 4srX92wW589vYLfY9Pgaq8WM8/uYLFa/3sfuwO6x99sCFo/Hczeye2xa1cnmsf3bA1aP+93H
 mTw2L6n3+LxJLoA9KtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJ
 xSdA1y0zB+geJYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BZYFecWJucWleul5y
 fq6VoYGBkSlQYUJ2xoLpJ9gLtotUXJt0gKmBcYVgFyMnh4SAicSUz/+Yuxi5OIQEdjBKzO2d
 zQ7hfGKUaJt7hQXC+cYocfzGb2aYlrX3v7KA2EICexklzq5xgrDfA7VflQWxhQUcJd4t/sMO
 YosIREss+vyKFcRmFsiTuPjrKZjNJqAqMXHFfTYQm1fATmJ55wSwOAtQ/NLBPWBxUYEIiePd
 k9khagQlTs58AraXE6j+4NcXbBAzxSVuPZnPBGHLSzRvnQ32joTAVA6Jp0e+ATkcQI6LxMsf
 MRD3C0u8Or6FHcKWknjZ38YOUd/MKDFxxmkmCKeDUeLu4+ssEFXGEvuXTmYCGcQsoCmxfpc+
 RFhRYufvuYwQi/kk3n3tYYXYxSvR0SYEUaIkceziDUYIW0LiwpKJbBC2h8SMI01sExgVZyF5
 bRaSd2YheWcWwuIFjCyrGMVSC4pz01OLDQsMkSN7EyM4qWqZ7mCc+PaD3iFGJg7GQ4wSHMxK
 IryfdXwThHhTEiurUovy44tKc1KLDzGaAgN7IrOUaHI+MK3nlcQbmhoZGxtbmBiamRoaKonz
 Jhk8iBcSSE8sSc1OTS1ILYLpY+LglGpg2rxr+2ej+ysXPf2WfcHsfEbY0zX7p6///+x0iOK+
 37vWvjxrHyu6p46xMOUdi8ETyegFbR7zju/v8POUtOv/of5wwzOldWUFFzjPfZhZVvf9yjlB
 joVSCbcl8z5s/hMSJP1VWI9J5JZZ+grXpFvO66s3PZbctnxn8tEEpm9PWG+f/W1cavnjr1v6
 LLk7D8Q9i1bISx3ytWzTdizoLrrqqCgss7D0l/N8g1tzuHPVhEOm7Z88K2GbWvwC9kdWz3bq
 t21i/7lPdurx9cFs3Il2f18czuDXkg8Tc7Cs21UWPC20QLfognTKhUvei8IXGSyJk/lg/+fI
 hbvRK9MCU5slI/wFvytPvmxu2eMvUrdURImlOCPRUIu5qDgRAJ7WXH0zBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSvO5EHv8Eg+vv1Cx6z51ksvi/bSKz
 xZWv79kszp/fwG6x6fE1VosZ5/cxWax+vY/dgd1j77cFLB6P525k99i0qpPNY/u3B6we97uP
 M3lsXlLv8XmTXAB7FJdNSmpOZllqkb5dAlfGgukn2Au2i1Rcm3SAqYFxhWAXIyeHhICJxNr7
 X1m6GLk4hAR2M0qcvT2NqYuRAyghIbFlKweEKSxx+HAxRMlbRolFP6czg/QKCzhKvFv8hx3E
 FhGIlvjZvYUFxGYWyJOYvH0BE0RDM5PE+rc/mEASbAKqEhNX3GcDsXkF7CSWd05gBbFZgOKX
 Du4Bi4sKREi03IcYyisgKHFy5hOwoZxA9Qe/vmCDWKAu8WfeJWYIW1zi1pP5TBC2vETz1tnM
 ExiFZiFpn4WkZRaSlllIWhYwsqxilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dLzs/dxAiOIy3N
 HYzbV33QO8TIxMF4iFGCg1lJhPezjm+CEG9KYmVValF+fFFpTmrxIUZpDhYlcd4LXSfjhQTS
 E0tSs1NTC1KLYLJMHJxSDUwGSZp1jy8wLHwbclGkVXOH2YOmoiSug9cy3CuKV/5dUxVqLrsq
 copPZFXaCqm3NQ5rI4oe/3P069rQnsp0O7Tyd2a3bb7IoZusG5zOL9zp8iJRSt8sRPAhb3Zv
 1eoWHd8Lx34pfhP/ZXzrUNfK+5uSyuNKtv3zur3p4K5i09f+U7N6tSbVsPCclik3/q7g98gr
 jFsjNYX50DItl2ZeYeOftecVVQ7GqGf4O7zd2ed74E1Khs+U7PLdCkZmxaeeCtjdS5n0ZJH2
 YQ/z3SVbGI/zfr/Yqn1O/Zguo0pfjsK5C7Gfld2SSzTeX/PUTIw4wB3+nzNA/AhzpHCbLUec
 Vlxr2aqzhrn/8702H1ulxFKckWioxVxUnAgAgKtpURIDAAA=
X-CMS-MailID: 20210315072817epcas1p2cafc753cd81b1d1171532e013eac64bd
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210303014433epcas1p4fefd6787c74d86d6f11f93318c3833fd
References: <CGME20210303014433epcas1p4fefd6787c74d86d6f11f93318c3833fd@epcas1p4.samsung.com>
 <1614654193-40203-1-git-send-email-tiantao6@hisilicon.com>
 <3fb21326-8e4a-51bf-4f7c-7a3215f08803@samsung.com>
 <1e83f1d7-20c7-0ab3-0d8d-e331e7e5d09c@huawei.com>
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

CgoyMS4gMy4gMTUuIOyYpO2bhCAzOjQ17JeQIHRpYW50YW8gKEgpIOydtCjqsIApIOyTtCDquIA6
Cj4gCj4g5ZyoIDIwMjEvMy8xNSAxNDozNSwgSW5raSBEYWUg5YaZ6YGTOgo+PiBIaSBUaWFuIFRh
bywKPj4KPj4gMjEuIDMuIDIuIOyYpO2bhCAxMjowM+yXkCBUaWFuIFRhbyDsnbQo6rCAKSDsk7Qg
6riAOgo+Pj4gcmVtb3ZlIHRoZSBsZWdhY3kgR1BJTyBoZWFkZXJzIDxsaW51eC9vZl9ncGlvLmg+
IGJ1dCB3aGF0IGl0IHJlYWxseQo+Pj4gdXNlcyBpcyA8bGludXgvZ3Bpby9jb25zdW1lci5oPiBz
aW5jZSBvbmx5IGdwaW9fZGVzYyBzdHJ1Y3RzIGFyZSBldmVyCj4+PiByZWZlcmVuY2VkLgo+PiBU
aGlzIGRyaXZlciBkb2Vzbid0IHJlZmVyZW5jZSBldmVuIGxpbnV4L2dwaW8vY29uc3VtZXIuaCBz
byBjb3VsZCB5b3UgZHJvcCBvbmx5IG9mX2dwaW8uaCBpbmNsdXNpb24/Cj4gCj4gVGhhbmtzIGZv
ciBoZWxwaW5nIHRvIHJldmlldyBwYXRjaCxJJ3ZlIHBvc3RlZCBhIG5ldyBwYXRjaCB0byBmaXgg
dGhpcyBwcm9ibGVtwqAgSWYgeW91IGNhbiBnaXZlIG1lIHJldmlldy1ieSwgSSBjYW4gaGVscCBw
dXNoIHRvIGRybS1taXNjLgoKSSBjYW4gbWVyZ2UgdGhpcyBwYXRjaCBhbmQgb3RoZXIgb25lWzFd
IHRvIGV4eW5vcyBkcm0gdHJlZSBhZnRlciByZXZpZXcsIGFuZCB3aWxsIGhhdmUgYSBwdWxsLXJl
cXVlc3Qgc29vbiBzbyBubyBuZWVkIHRvIGxhbmQgdG8gZHJtLW1pc2MgdHJlZS4KTGV0J3Mgbm90
IGJvdGhlciBEYW5pZWwuIDopCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2RyaS1kZXZlbC9wYXRjaC8xNjE1NTQ5Mzg1LTMzNzg0LTEtZ2l0LXNlbmQtZW1haWwtdGlh
bnRhbzZAaGlzaWxpY29uLmNvbS8KClRoYW5rcywKSW5raSBEYWUKCj4gCj4gU3ViamVjdDogW1BB
VENIXSBkcm0vZXh5bm9zL2RlY29uNTQzMzogUmVtb3ZlIHRoZSB1bnVzZWQgaW5jbHVkZSBzdGF0
ZW1lbnRzCj4gCj4gVGhpcyBkcml2ZXIgZG9lc24ndCByZWZlcmVuY2Ugb2ZfZ3Bpby5oLCBzbyBk
cm9wIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRpYW4gVGFvIDx0aWFudGFvNkBoaXNpbGljb24u
Y29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M1NDMzX2RybV9kZWNv
bi5jIHwgMSAtCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMKPiBpbmRleCAxZjc5YmMy
Li4xNTEwZTRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQz
M19kcm1fZGVjb24uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19k
cm1fZGVjb24uYwo+IEBAIC0xMyw3ICsxMyw2IEBACj4gwqAjaW5jbHVkZSA8bGludXgvaXJxLmg+
Cj4gwqAjaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nvbi5oPgo+IMKgI2luY2x1ZGUgPGxpbnV4L29m
X2RldmljZS5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2ZfZ3Bpby5oPgo+IMKgI2luY2x1ZGUgPGxp
bnV4L3BsYXRmb3JtX2RldmljZS5oPgo+IMKgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4K
PiDCoCNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPiAKPj4KPj4gVGhhbmtzLAo+PiBJbmtpIERh
ZQo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogVGlhbiBUYW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20+
Cj4+PiAtLS0KPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVj
b24uYyB8IDIgKy0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
czU0MzNfZHJtX2RlY29uLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJt
X2RlY29uLmMKPj4+IGluZGV4IDFmNzliYzIuLjlmYzUxYTYgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMKPj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVjb24uYwo+Pj4gQEAgLTExLDkgKzEx
LDkgQEAKPj4+IMKgICNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4KPj4+IMKgICNpbmNsdWRl
IDxsaW51eC9pb3BvbGwuaD4KPj4+IMKgICNpbmNsdWRlIDxsaW51eC9pcnEuaD4KPj4+ICsjaW5j
bHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgo+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L21mZC9z
eXNjb24uaD4KPj4+IMKgICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KPj4+IC0jaW5jbHVk
ZSA8bGludXgvb2ZfZ3Bpby5oPgo+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rldmlj
ZS5oPgo+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KPj4+IMKgICNpbmNsdWRl
IDxsaW51eC9yZWdtYXAuaD4KPj4+Cj4+IC4KPj4KPiAKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
