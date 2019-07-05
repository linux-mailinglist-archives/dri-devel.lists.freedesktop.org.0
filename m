Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B560942
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 17:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9976E4ED;
	Fri,  5 Jul 2019 15:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B446E4ED
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 15:26:53 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190705152651euoutp02d42205d5f6afc0ecc705976fa81d1404~ujFOiZlcn0965709657euoutp02G
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 15:26:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190705152651euoutp02d42205d5f6afc0ecc705976fa81d1404~ujFOiZlcn0965709657euoutp02G
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190705152651eucas1p22d53e5b2ee96cc5bc188134435df1200~ujFOKJlcs0666606666eucas1p2P;
 Fri,  5 Jul 2019 15:26:51 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 34.1C.04298.A3C6F1D5; Fri,  5
 Jul 2019 16:26:50 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190705152650eucas1p18489d01b339d75aefa8be6cc30b48bad~ujFNV84U51867618676eucas1p14;
 Fri,  5 Jul 2019 15:26:50 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190705152650eusmtrp21dea3bcfe879dde7c20e0e3e8cc8f60e~ujFNHw1d90470504705eusmtrp2k;
 Fri,  5 Jul 2019 15:26:50 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-f5-5d1f6c3aa82b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A9.A1.04140.93C6F1D5; Fri,  5
 Jul 2019 16:26:49 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190705152649eusmtip190b4235f512004d88494fd92ca9cff0f~ujFMpypu73046930469eusmtip1d;
 Fri,  5 Jul 2019 15:26:49 +0000 (GMT)
Subject: Re: [PATCH -next] video: fbdev: imxfb: fix a typo in imxfb_probe()
To: Wei Yongjun <weiyongjun1@huawei.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <2b579d3f-a441-39c9-fdb7-6089edea3cb1@samsung.com>
Date: Fri, 5 Jul 2019 17:26:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190704095225.143177-1-weiyongjun1@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsWy7djPc7pWOfKxBouazSyufH3PZvHwqr/F
 1lvSFqum7mSx2PT4GqvFib4PrBZdv1YyW/zdvonF4sUWcYvDX3axOXB57Jx1l92j5chbVo9N
 qzrZPO53H2fy2Lyk3mPjux1MHv1/DTw+b5IL4IjisklJzcksSy3St0vgyuhZ+YmlYBZXxe0T
 OQ2M2zi6GDk5JARMJK6//M3WxcjFISSwglFi1dK3zBDOF0aJR01PGCGcz4wS+zZfYIRpmXFh
 BlTLckaJRd0XmSCct4wSfXv3soNUCQt4S2z5+YMZxBYR0JDYcvkO2ChmgQtMEst2b2cBSbAJ
 WElMbF8FNpZXwE6i4WUXE4jNIqAisejgJrBBogIREvePbWCFqBGUODnzCVgvp4CtxLlrB8AW
 MAuIS9x6Mp8JwpaX2P52DtgTEgLX2CXezH8BdbeLxJQ7O9kgbGGJV8e3sEPYMhL/d85ngmhY
 xyjxt+MFVPd2Ronlk/9BdVhLHD5+EegMDqAVmhLrd+mDmBICjhLXNslDmHwSN94KQtzAJzFp
 23RmiDCvREebEMQMNYkNyzawwWzt2rmSeQKj0iwkn81C8s0sJN/MQli7gJFlFaN4amlxbnpq
 sWFearlecWJucWleul5yfu4mRmDaOv3v+KcdjF8vJR1iFOBgVOLhPeEkHyvEmlhWXJl7iFGC
 g1lJhDcxCCjEm5JYWZValB9fVJqTWnyIUZqDRUmct5rhQbSQQHpiSWp2ampBahFMlomDU6qB
 UfDA8h2MLto6d68e2Bnl8YA/93CF6rTo7va9TVyP4tvLJZ9Pz826zveD74Did54VEUorJ99W
 33x8hd6lXRZTwvUuTHyZ3JTItNSv+eX9Zu2+T87t09tzSz9zH9Vs61nXorXixIP5vEqFral7
 z1f9yJ+w5ziX6C8usVQO9gdtxhzXpi5euOjpEiWW4oxEQy3mouJEAIFq8EtXAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xu7qWOfKxBl//2Fhc+fqezeLhVX+L
 rbekLVZN3clisenxNVaLE30fWC26fq1ktvi7fROLxYst4haHv+xic+Dy2DnrLrtHy5G3rB6b
 VnWyedzvPs7ksXlJvcfGdzuYPPr/Gnh83iQXwBGlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdk
 YqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl9Gz8hNLwSyuitsnchoYt3F0MXJySAiYSMy4MIOt
 i5GLQ0hgKaPE+Zm7mLoYOYASMhLH15dB1AhL/LnWBVXzmlFi28yNrCAJYQFviS0/fzCD2CIC
 GhJbLt9hBCliFrjEJPHp5HZmiI4JjBL/zt9hB6liE7CSmNi+ihHE5hWwk2h42cUEYrMIqEgs
 OrgJrEZUIELizPsVLBA1ghInZz4BszkFbCXOXTsAto1ZQF3iz7xLULa4xK0n85kgbHmJ7W/n
 ME9gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzBOtx37uWUH
 Y9e74EOMAhyMSjy8J5zkY4VYE8uKK3MPMUpwMCuJ8CYGAYV4UxIrq1KL8uOLSnNSiw8xmgI9
 N5FZSjQ5H5hC8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MAZa
 zzz7XOY8/+kj3jW+ygXnaqSnn/oRdMFF9qCBYsFqLVVlZummoiPVWZ3/eESnTS1MKlg+9fun
 vA9962s9NrdfbLvZlJeysPDW+khDoZpCeVW/Y9zarZqL3m/UVrKQKYmcePgzn+heo81dbu28
 W4veyvtMflXI2S7jzN+4dP1E/fLE7zXPlViKMxINtZiLihMBuxluAukCAAA=
X-CMS-MailID: 20190705152650eucas1p18489d01b339d75aefa8be6cc30b48bad
X-Msg-Generator: CA
X-RootMTR: 20190704094615epcas2p30e66b919c33afcfa233c9218eae892b7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190704094615epcas2p30e66b919c33afcfa233c9218eae892b7
References: <CGME20190704094615epcas2p30e66b919c33afcfa233c9218eae892b7@epcas2p3.samsung.com>
 <20190704095225.143177-1-weiyongjun1@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562340411;
 bh=pYuFsx7cHi1vXY+tY4Fc6WSu6NjqYr65RWHF2eerspo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=NsKp2RUYdWlneWqbL9h7UxrN0QgB8U/cbPlUcBx2QFiV30ORxjXV3P3WTx4WjPo8h
 Ph41K0shMHTgoG/dykr/gZUYrpHYh1VLAjXoVQGUmkdFH224hJjTxeAWegFNJxGilg
 rp4MIEwmeJj4oa8n+31X2SfvUDDByu+L9JTp1Oyg=
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
Cc: linux-fbdev@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvNC8xOSAxMTo1MiBBTSwgV2VpIFlvbmdqdW4gd3JvdGU6Cj4gRml4IHRoZSByZXR1cm4g
dmFsdWUgY2hlY2sgd2hpY2ggdGVzdGluZyB0aGUgd3JvbmcgdmFyaWFibGUKPiBpbiBpbXhmYl9w
cm9iZSgpLgoKSSBhZGRlZCBmb2xsb3dpbmcgY29tbWVudCB3aGlsZSBtZXJnaW5nIHRoZSBwYXRj
aDoKCmIuem9sbmllcmtpZTogcGxlYXNlIG5vdGUgdGhhdCAtPnNjcmVlbl9iYXNlIGFuZCAtPnNj
cmVlbl9idWZmZXIKYXJlIGVxdWl2YWxlbnQgKHRoZXkgYXJlIHBhcnQgb2YgdW5uYW1lZCB1bmlv
biBpbiBzdHJ1Y3QgZmJfaW5mbykKCj4gRml4ZXM6IDczOWE2NDM5YzJiZiAoInZpZGVvOiBmYmRl
djogaW14ZmI6IGZpeCBzcGFyc2Ugd2FybmluZ3MgYWJvdXQgdXNpbmcgaW5jb3JyZWN0IHR5cGVz
IikKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgWW9uZ2p1biA8d2VpeW9uZ2p1bjFAaHVhd2VpLmNvbT4K
ClBhdGNoIHF1ZXVlZCBmb3IgdjUuMywgdGhhbmtzLgoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9m
YmRldi9pbXhmYi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9pbXhmYi5j
IGIvZHJpdmVycy92aWRlby9mYmRldi9pbXhmYi5jCj4gaW5kZXggOGQxMDUzZTllZjlmLi5iMzI4
NmQxZmE1NDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9pbXhmYi5jCj4gKysr
IGIvZHJpdmVycy92aWRlby9mYmRldi9pbXhmYi5jCj4gQEAgLTk3Niw3ICs5NzYsNyBAQCBzdGF0
aWMgaW50IGlteGZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlmYmkt
Pm1hcF9zaXplID0gUEFHRV9BTElHTihpbmZvLT5maXguc21lbV9sZW4pOwo+ICAJaW5mby0+c2Ny
ZWVuX2J1ZmZlciA9IGRtYV9hbGxvY193YygmcGRldi0+ZGV2LCBmYmktPm1hcF9zaXplLAo+ICAJ
CQkJCSAgICZmYmktPm1hcF9kbWEsIEdGUF9LRVJORUwpOwo+IC0JaWYgKCFpbmZvLT5zY3JlZW5f
YmFzZSkgewo+ICsJaWYgKCFpbmZvLT5zY3JlZW5fYnVmZmVyKSB7Cj4gIAkJZGV2X2VycigmcGRl
di0+ZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIHZpZGVvIFJBTTogJWRcbiIsIHJldCk7Cj4gIAkJ
cmV0ID0gLUVOT01FTTsKPiAgCQlnb3RvIGZhaWxlZF9tYXA7CgpCZXN0IHJlZ2FyZHMsCi0tCkJh
cnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1z
dW5nIEVsZWN0cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
