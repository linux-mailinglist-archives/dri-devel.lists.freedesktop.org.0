Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56032160818
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 03:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059756E428;
	Mon, 17 Feb 2020 02:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD4E6E428
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 02:23:50 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200217022348epoutp015dffc94213fdc2b2dd9cf72371a4c639~0D1Vk3mFD0366403664epoutp01t
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 02:23:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200217022348epoutp015dffc94213fdc2b2dd9cf72371a4c639~0D1Vk3mFD0366403664epoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1581906228;
 bh=VW2eRHY1WIWPnflh6C3vI03xFsrwRIY5oDdbwDaewHQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=rr5NSt1+jd7XMXbW8B5Go9Pphm0SzjDtxS6OwypNtit6Cs3pQ3F3NZGL8p+BZkOdr
 fhq83vkt7WxkOgJRYcxS3wwkGv7QSg96ZqMhW+QC9jfOd9ltmIInanWxQjUCvYXcKC
 +oCxMy8zGGHqmjXxoGEco/7dml+8rG/I4aKB7U0w=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200217022348epcas1p3ff6177de118de422f8861df813ead57f~0D1VQmLNq3167031670epcas1p3i;
 Mon, 17 Feb 2020 02:23:48 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.156]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 48LSTY4wRtzMqYlm; Mon, 17 Feb
 2020 02:23:45 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 6A.7B.51241.A29F94E5; Mon, 17 Feb 2020 11:23:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200217022337epcas1p1af212e7cb44678f1cc87ef0229175f38~0D1LXvAZB0427804278epcas1p1G;
 Mon, 17 Feb 2020 02:23:37 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200217022337epsmtrp27bb91cb1f0dc7e13d9fff546e6c94e61~0D1LXEEBJ0791907919epsmtrp2e;
 Mon, 17 Feb 2020 02:23:37 +0000 (GMT)
X-AuditID: b6c32a39-163ff7000001c829-7a-5e49f92a24fb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0B.CC.10238.929F94E5; Mon, 17 Feb 2020 11:23:37 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200217022337epsmtip270f1adcae0e4bde858f23507368ae37f~0D1LHKAZv0460804608epsmtip2j;
 Mon, 17 Feb 2020 02:23:37 +0000 (GMT)
Subject: Re: [PATCH v3 3/7] drm/exynos: Use drm_encoder_mask()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <317360e1-0c76-1939-aa8b-e965288caae7@samsung.com>
Date: Mon, 17 Feb 2020 11:27:47 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200211162208.16224-4-ville.syrjala@linux.intel.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmga7WT884gx17xS2ufH3PZjF7wmYm
 ixf3LrJYnG16w24xY/JLNostbyayWnz/t5DJgd1j3slAj/vdx5k8+rasYvTYfLo6gCUq2yYj
 NTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6AAlhbLEnFKg
 UEBicbGSvp1NUX5pSapCRn5xia1SakFKToFlgV5xYm5xaV66XnJ+rpWhgYGRKVBhQnbG686r
 jAV/eSre3+tjbmB8xdXFyMkhIWAi8XbtB5YuRi4OIYEdjBIHTnSxQTifGCV2t91lgnC+MUoc
 PbyXBaal78NNZhBbSGAvo8SeCRwQRe8ZJWY/nsIEkhAWsJPY+O0YK4gtIhAisf98I9hYZoGz
 jBITp3aAdbMJqEpMXHGfDcTmBWr4+uIDWDMLUHzKs7lANgeHqECExOmviRAlghInZz4BO4JT
 wFni2v0FYDazgLjErSfzmSBseYnmrbOZQXZJCFxnk7j79zEbxNUuEl8n3mCCsIUlXh3fwg5h
 S0l8frcXqqZaYsLB/ywQzQ2MEt1HO6GKjCX2L50MdhCzgKbE+l36EGFFiZ2/5zJCLOaTePe1
 hxWkREKAV6KjTQiiREni2MUbjBC2hMSFJROhVnlITGh5zzSBUXEWktdmIXlnFpJ3ZiEsXsDI
 sopRLLWgODc9tdiwwBQ5tjcxghOnluUOxmPnfA4xCnAwKvHwvgj0jBNiTSwrrsw9xCjBwawk
 wntY0S1OiDclsbIqtSg/vqg0J7X4EKMpMOAnMkuJJucDk3peSbyhqZGxsbGFiaGZqaGhkjjv
 w0jNOCGB9MSS1OzU1ILUIpg+Jg5OqQbGzN3Ci5T0D12Mn7QloNLMZp7nx9dlFyf1ZKRLdRgd
 N34nEL171ievrQxL/e4+WWm6ZGu0yvMuY7e/IVfePg5Rf6+3MHNV+/pljo/VD9cw6K8p6013
 jLf6wRlxgDUtdo/P6cjzcz9PZ1ghzPvuyoV43ahC712ql0OrY/NUI4zfXTqms02t8v8cJZbi
 jERDLeai4kQASndIULIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRmVeSWpSXmKPExsWy7bCSvK7mT884g72rpC2ufH3PZjF7wmYm
 ixf3LrJYnG16w24xY/JLNostbyayWnz/t5DJgd1j3slAj/vdx5k8+rasYvTYfLo6gCWKyyYl
 NSezLLVI3y6BK+N151XGgr88Fe/v9TE3ML7i6mLk5JAQMJHo+3CTuYuRi0NIYDejxKx/J1i6
 GDmAEhISW7ZyQJjCEocPF0OUvGWUuPRoIjNIr7CAncTGb8dYQWwRgRCJhjePwOLMAucZJa4t
 NoJoALKXL5oIVsQmoCoxccV9NhCbF6j564sPTCA2C1B8yrO5YLaoQITE8+03GCFqBCVOznzC
 AmJzCjhLXLu/gAVigbrEn3mXoJaJS9x6Mp8JwpaXaN46m3kCo9AsJO2zkLTMQtIyC0nLAkaW
 VYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwZGipbmD8fKS+EOMAhyMSjy8LwI944RY
 E8uKK3MPMUpwMCuJ8B5WdIsT4k1JrKxKLcqPLyrNSS0+xCjNwaIkzvs071ikkEB6Yklqdmpq
 QWoRTJaJg1OqgTHgU4pwh17ErlPx4vWaJ6QC3y85y3sk47b1/pCbIp4xPt9yUma9qa1R9Vj+
 urQts07429NsZw2eadk3FUIzzi29uWzF+XkSEceZTTLUH6y4/2uR2QQudn2eDyfXHzv94uDF
 yaY7qgomlH5/+UXTvG2t66IDKx2ef/G/vU/krXIUh776Zxv9d/OVWIozEg21mIuKEwFv4yu1
 kAIAAA==
X-CMS-MailID: 20200217022337epcas1p1af212e7cb44678f1cc87ef0229175f38
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200211162228epcas1p48eaa9653725150cb21766b1ce950d1c7
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
 <CGME20200211162228epcas1p48eaa9653725150cb21766b1ce950d1c7@epcas1p4.samsung.com>
 <20200211162208.16224-4-ville.syrjala@linux.intel.com>
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
Cc: Kyungmin Park <kyungmin.park@samsung.com>, intel-gfx@lists.freedesktop.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoyMC4gMi4gMTIuIOyYpOyghCAxOjIy7JeQIFZpbGxlIFN5cmphbGEg7J20KOqwgCkg7JO0IOq4
gDoKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
Pgo+IAo+IFJlcGxhY2UgdGhlIGhhbmQgcm9sbGVkIGVuY29kZXIgYml0bWFzayB0aGluZyB3aXRo
IGRybV9lbmNvZGVyX21hc2soKQo+IAo+IENjOiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5j
b20+Cj4gQ2M6IEpvb255b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBzYW1zdW5nLmNvbT4KPiBDYzog
U2V1bmctV29vIEtpbSA8c3cwMzEyLmtpbUBzYW1zdW5nLmNvbT4KPiBDYzogS3l1bmdtaW4gUGFy
ayA8a3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbT4KPiBBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFja2VkLWJ5OiBJbmtpIERhZSA8aW5r
aS5kYWVAc2Ftc3VuZy5jb20+CgpUSGFua3MsCklua2kgRGFlCgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMgfCA1ICsrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9kcnYuYwo+IGluZGV4IGJhMGY4NjhiMjQ3Ny4uNTdkZWZlYjQ0NTIyIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYuYwo+IEBAIC0yNzAsNyAr
MjcwLDcgQEAgc3RhdGljIGludCBleHlub3NfZHJtX2JpbmQoc3RydWN0IGRldmljZSAqZGV2KQo+
ICAJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwo+ICAJc3RydWN0IGRybV9kZXZpY2UgKmRy
bTsKPiAgCXVuc2lnbmVkIGludCBjbG9uZV9tYXNrOwo+IC0JaW50IGNudCwgcmV0Owo+ICsJaW50
IHJldDsKPiAgCj4gIAlkcm0gPSBkcm1fZGV2X2FsbG9jKCZleHlub3NfZHJtX2RyaXZlciwgZGV2
KTsKPiAgCWlmIChJU19FUlIoZHJtKSkKPiBAQCAtMjkzLDEwICsyOTMsOSBAQCBzdGF0aWMgaW50
IGV4eW5vc19kcm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAlleHlub3NfZHJtX21vZGVf
Y29uZmlnX2luaXQoZHJtKTsKPiAgCj4gIAkvKiBzZXR1cCBwb3NzaWJsZV9jbG9uZXMuICovCj4g
LQljbnQgPSAwOwo+ICAJY2xvbmVfbWFzayA9IDA7Cj4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KGVu
Y29kZXIsICZkcm0tPm1vZGVfY29uZmlnLmVuY29kZXJfbGlzdCwgaGVhZCkKPiAtCQljbG9uZV9t
YXNrIHw9ICgxIDw8IChjbnQrKykpOwo+ICsJCWNsb25lX21hc2sgfD0gZHJtX2VuY29kZXJfbWFz
ayhlbmNvZGVyKTsKPiAgCj4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KGVuY29kZXIsICZkcm0tPm1v
ZGVfY29uZmlnLmVuY29kZXJfbGlzdCwgaGVhZCkKPiAgCQllbmNvZGVyLT5wb3NzaWJsZV9jbG9u
ZXMgPSBjbG9uZV9tYXNrOwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
