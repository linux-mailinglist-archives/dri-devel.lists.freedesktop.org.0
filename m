Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC874E6E3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 13:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFA76E870;
	Fri, 21 Jun 2019 11:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04216E870
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:15:06 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190621111505euoutp02da1bc2b99d67ddac46c0b223043d7e78~qMnZ3BPpe2215822158euoutp02H
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:15:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190621111505euoutp02da1bc2b99d67ddac46c0b223043d7e78~qMnZ3BPpe2215822158euoutp02H
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190621111504eucas1p24f641ba01defb3d4090372c1cc47fc24~qMnZeAsNo3122131221eucas1p2j;
 Fri, 21 Jun 2019 11:15:04 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 2B.7C.04377.83CBC0D5; Fri, 21
 Jun 2019 12:15:04 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190621111503eucas1p2dfbd7cd8b9e3eb1a2f7f36f178fdf92d~qMnYohBvW0269402694eucas1p2p;
 Fri, 21 Jun 2019 11:15:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190621111503eusmtrp244fb004c79e5e18732496dd5c877925e~qMnYaeHtn0599205992eusmtrp2U;
 Fri, 21 Jun 2019 11:15:03 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-9e-5d0cbc38c3c4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8F.25.04140.73CBC0D5; Fri, 21
 Jun 2019 12:15:03 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190621111503eusmtip23118a0d64fb6a8e431a10b4eca01fb80~qMnYA7gST0528405284eusmtip2b;
 Fri, 21 Jun 2019 11:15:03 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: pvr2fb: fix compile-testing as module
To: Arnd Bergmann <arnd@arndb.de>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <3ee91294-044d-9bcd-0c4c-3365c0c97604@samsung.com>
Date: Fri, 21 Jun 2019 13:15:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190617124758.1252449-1-arnd@arndb.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjtt7vd3c3NrtPYh0rDSYVWmj1gWZhF0P4MghBr1S0vajq1Xd/+
 Y2U+FolNLJziA0lLQecqzTHILJzOB6ZZpjaVli8SK52QpuW8Sv53vu87h3MOfAQmMfI8iei4
 RFoTR8XKcSG3qf1370GFWaQ6VJ/ro1jVtfMVHxzzuCLnSz5H8frbFFfRkf+DpxgwleKKUccU
 N5SvXFnWIWXWuzmesso8w1GO3bdwlMsjozzlgnH3eTxceDKCjo1OpjWBIdeEUVN5Njyh2yV1
 wj7Ez0RvBFokIIA8Cqu6So4WCQkJ+RRB5+zg5rCIoNBsQuywgMD0s4q7JSkbb+exhxoEVeOP
 +Owwh6B4pYzjZLmTShi0DmBO7EH6QNH0JOYkYWQ3ArPVukHCyWB4mFOLnFhMhoChro/vxFxy
 DxgNXRviXWQYjLUbeCzHDTqL7RsxBOQxeJL3EXdijJTCsL2cw2IZNM+VbpgB2cYHbUkTxuY+
 Cw1L85sd3GHW8oLPYm/421LOYQX1CFZzpzfVzQhqCtdwlnUC3lrer8cg1i38oMEUyK5PQ8Hz
 MuRcA+kKQ3NubAhX0DU9xti1GHKzJSx7LxiqDfiWrbblGVaA5Ppt1fTb6ui31dH/961A3Fok
 pZMYdSTNHI6jUwIYSs0kxUUG3IhXG9H6J3WtWRZfIdOf622IJJBcJG7Vu6gkPCqZSVO3ISAw
 uYdYFCtSScQRVFo6rYm/qkmKpZk25EVw5VJxxo7xSxIykkqkY2g6gdZsXTmEwDMTpc42CvJa
 9x2XfQ1zpJz7ZaOWxlJbLySEk7dtVN3MgZRAeV1lVmNJU0HJTf+ZBa3w1Ej/pEfvSHxRn+zy
 Wr/j85UHMcMd+1+GqpeCvncVtvjecmOU2T3edyfuSe/E+Pp52e1FWemq/DM7y0NmLpptE8EZ
 1iPNQv6nIFm1X4W0Z1LOZaKoIH9Mw1D/AO08n/pFAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xe7rme3hiDX7tUbL4O+kYu8WVr+/Z
 LNrv9jFZ7H/6nMXiRN8HVovLu+awWdz5+pzFgd3j969JjB4tR96yeize85LJ4373cSaPX7fv
 sHp83iQXwBalZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqk
 b5egl/G88x5bwRnuiodPbrA3MB7k7GLk5JAQMJGY9+AYaxcjF4eQwFJGieW/zgE5HEAJGYnj
 68sgaoQl/lzrYoOoec0o8WnTCTaQhLCAh8TVU5eZQWwRAUWJqS+eMYMUMQucYZR4uuIL1NQO
 Ron2SVNYQarYBKwkJravYgSxeQXsJDasvsAOYrMIqEps2nAabJKoQITEmfcrWCBqBCVOznwC
 ZnMKmEos7bwGtplZQF3iz7xLzBC2uMStJ/OZIGx5ie1v5zBPYBSahaR9FpKWWUhaZiFpWcDI
 sopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwArcd+7llB2PXu+BDjAIcjEo8vAdmcccKsSaW
 FVfmHmKU4GBWEuHlyeGJFeJNSaysSi3Kjy8qzUktPsRoCvTcRGYp0eR8YHLIK4k3NDU0t7A0
 NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAWLznx8N116POSGTuynn2vzBkxs6f
 h17HVz6R3+t84S7Pt2VX2uvLO2aduNIVaH/e6umsW1cUT6ZdUJzUa/RjTqXLkcUvi3yPiZ6M
 vtT5VXZKRs/14MTEmhYDCYV47R9q17a3n9E7P2tZ47vXe/+mhVv8LfJt/1+9pcX5/ZOnBQe/
 hYs3hC20eqXEUpyRaKjFXFScCAAXu4PR1gIAAA==
X-CMS-MailID: 20190621111503eucas1p2dfbd7cd8b9e3eb1a2f7f36f178fdf92d
X-Msg-Generator: CA
X-RootMTR: 20190617124822epcas2p2c93d6cec3b60d08d85f228945d5c7623
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190617124822epcas2p2c93d6cec3b60d08d85f228945d5c7623
References: <CGME20190617124822epcas2p2c93d6cec3b60d08d85f228945d5c7623@epcas2p2.samsung.com>
 <20190617124758.1252449-1-arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561115705;
 bh=s+UrBPQaVR3tcbqs3Ol/m34bGN/nZjeSUNnxd+RCh/w=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Gku07hFQ9DkB9j5Dh9oBBcbRE57oOmbW8bmDePpXGZN8PrDzY8Zi9rarPD0B16Wy3
 fTgf3GhKDk2Z4rXuWMfDzHRcWWzu2sz5Cgs+uTbT0JMMeYicZ737vJ/zYhAIG5sZNB
 Jg7+rUJd9flCI2ciZWlLx2OQ4PDSwkIK4m/Vh89I=
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
 Ira Weiny <ira.weiny@intel.com>, Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTcvMTkgMjo0NyBQTSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBCdWlsZGluZyBhbiBh
bGxtb2Rjb25maWcga2VybmVsIG5vdyBwcm9kdWNlcyBhIGhhcm1sZXNzIHdhcm5pbmc6Cj4gCj4g
ZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIuYzo3MjY6MTI6IGVycm9yOiB1bnVzZWQgZnVuY3Rp
b24gJ3B2cjJfZ2V0X3BhcmFtX3ZhbCcgWy1XZXJyb3IsLVd1bnVzZWQtZnVuY3Rpb25dCj4gCj4g
U2h1dCB0aGlzIHVwIHRoZSBzYW1lIHdheSBhcyB3ZSBkbyBmb3Igb3RoZXIgdW51c2VkIGZ1bmN0
aW9ucwo+IGluIHRoZSBzYW1lIGZpbGUsIHVzaW5nIHRoZSBfX21heWJlX3VudXNlZCBhdHRyaWJ1
dGUuCj4gCj4gRml4ZXM6IDBmNWE1NzEyYWQxZSAoInZpZGVvOiBmYmRldjogcHZyMmZiOiBhZGQg
Q09NUElMRV9URVNUIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+CgpUaGFua3MgYnV0IEkndmUgZml4ZWQgaXQgYWxyZWFkeSBieSBhZGRpbmcg
I2lmbmRlZiBNT0RVTEUgKHNpbmNlIG90aGVyCmZ1bmN0aW9ucyBpbiB0aGUgc2FtZSBmaWxlIHVz
aW5nIF9fbWF5YmVfdW51c2VkIGRlcGVuZCBvbiBlaXRoZXIgUENJIG9yClNIX0RSRUFNQ0FTVCBJ
J3ZlIHByZWZlcnJlZCBub3QgdG8gdXNlIHRoaXMgYXR0cmlidXRlKToKCmh0dHBzOi8vbWFyYy5p
bmZvLz9sPWxpbnV4LWZiZGV2Jm09MTU2MDUwOTA0MDEwNzc4Jnc9MgoKPiAtLS0KPiAgZHJpdmVy
cy92aWRlby9mYmRldi9wdnIyZmIuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L3B2cjJmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIuYwo+IGluZGV4IDU5
YzU5YjNhNjdjYi4uY2Y5Y2ZkYzVlNjg1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvcHZyMmZiLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B2cjJmYi5jCj4gQEAgLTcy
Myw4ICs3MjMsOCBAQCBzdGF0aWMgc3RydWN0IGZiX29wcyBwdnIyZmJfb3BzID0gewo+ICAJLmZi
X2ltYWdlYmxpdAk9IGNmYl9pbWFnZWJsaXQsCj4gIH07Cj4gIAo+IC1zdGF0aWMgaW50IHB2cjJf
Z2V0X3BhcmFtX3ZhbChjb25zdCBzdHJ1Y3QgcHZyMl9wYXJhbXMgKnAsIGNvbnN0IGNoYXIgKnMs
Cj4gLQkJCSAgICAgIGludCBzaXplKQo+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHB2cjJf
Z2V0X3BhcmFtX3ZhbChjb25zdCBzdHJ1Y3QgcHZyMl9wYXJhbXMgKnAsCj4gKwkJCQkJICAgICBj
b25zdCBjaGFyICpzLCBpbnQgc2l6ZSkKPiAgewo+ICAJaW50IGk7CgpCZXN0IHJlZ2FyZHMsCi0t
CkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApT
YW1zdW5nIEVsZWN0cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
