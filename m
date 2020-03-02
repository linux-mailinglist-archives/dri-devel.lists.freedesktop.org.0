Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C596C175E7A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12A96E4D2;
	Mon,  2 Mar 2020 15:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E3E6E4F3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:23 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200302154222euoutp01a41e8f96fbce72a03e0ffb996cf15cee~4hwkY3WWf1322613226euoutp015
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200302154222euoutp01a41e8f96fbce72a03e0ffb996cf15cee~4hwkY3WWf1322613226euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583163742;
 bh=zjq+EojuhlvuQQNKL6xXqt/j5WgolxzxcUM9XKMd1Hg=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=DZ0Bp9uW+VZqRaztWrHVeRzkUrcM5NHXKtAyNGDb7bf2YJQNVx3j+Bb8y78RORtDX
 MNluOZv9SgAz3RvODzZTaYd0qX3iuikEZ539LabVvtbvYzOB/ZDG+xzTCD8LJb+Oz0
 fhPlT9x4ZkfsbBnat4cMNKQH+02QlQSha4Dmxheg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200302154221eucas1p16265e859fb75abb478f8fc388de00a6b~4hwkEe89F1685916859eucas1p1L;
 Mon,  2 Mar 2020 15:42:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0F.10.60679.D592D5E5; Mon,  2
 Mar 2020 15:42:21 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200302154221eucas1p2f32849cc5382209002f735d337ae7878~4hwjmoMck1937719377eucas1p2N;
 Mon,  2 Mar 2020 15:42:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200302154221eusmtrp1f1520591edeee3b1223016e839a5191e~4hwjmGuwg2862728627eusmtrp1i;
 Mon,  2 Mar 2020 15:42:21 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-04-5e5d295db593
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 89.FF.07950.D592D5E5; Mon,  2
 Mar 2020 15:42:21 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200302154220eusmtip25f8537a5f58c70209d5871cb0672a474~4hwjQ1cO42192821928eusmtip2J;
 Mon,  2 Mar 2020 15:42:20 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/4] video: fbdev: remove set but not used variable
 'vSyncPol'
To: yu kuai <yukuai3@huawei.com>
Message-ID: <b86b787d-c368-9e1f-d302-1ec0a7af34d1@samsung.com>
Date: Mon, 2 Mar 2020 16:42:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200119121730.10701-3-yukuai3@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7djP87qxmrFxBtt7dS0+NLUyW1z5+p7N
 4kTfB1aLy7vmsFlce3eGzWLOQjaLhY9usDmwe7Qcecvq0fOmhdXjfvdxJo/Pm+QCWKK4bFJS
 czLLUov07RK4Mn4cFiv4wlMx4cVOxgbGI1xdjJwcEgImEltOXGfrYuTiEBJYwSixpuUXC4Tz
 hVFi7e9Z7CBVQgKfGSVuXPeB6dhw4zQjRNFyRolVd1cyQzhvGSU6X/1mBaliE7CSmNi+ihHE
 FhYIkbj9/ynYJBEBBYlbzS/YQRqYQfYte34OrIFXwE5i8qFNYA0sAioSy08vZAKxRQUiJD49
 OAxVIyhxcuYTFhCbU8BCYlrfDDCbWUBc4taT+UwQtrxE89bZzBCnrmOXOPJDvouRA8h2kTgw
 rRIiLCzx6vgWdghbRuL05B6wl4HKGSX+drxghnC2M0osn/yPDaLKWuLOuV9sIIOYBTQl1u/S
 hwg7Slzb28AIMZ9P4sZbQYgT+CQmbZvODBHmlehoE4KoVpPYsGwDG8zarp0rmScwKs1C8tgs
 JM/MQvLMLIS9CxhZVjGKp5YW56anFhvlpZbrFSfmFpfmpesl5+duYgQmndP/jn/ZwbjrT9Ih
 RgEORiUe3gDm2Dgh1sSy4srcQ4wSHMxKIry+nNFxQrwpiZVVqUX58UWlOanFhxilOViUxHmN
 F72MFRJITyxJzU5NLUgtgskycXBKNTDGmgrbnj29/FmwVrqAYPnWH00pM68vnK+wQCjpSEvT
 lYrDs4J3ito5hJTI/ljxW3Pjiucaf8XTixK69rtKesz82c+grNSoz9FfP7Ek9J/0Od+N/Qc+
 q3bu9agRZYn6N5257MW7V4+2Wp6QSnnbs/Sfn8j88OZ7BhU1umYL3diuB7llfVycYK/EUpyR
 aKjFXFScCAAmYBLWNgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xe7qxmrFxBvd+CVh8aGpltrjy9T2b
 xYm+D6wWl3fNYbO49u4Mm8WchWwWCx/dYHNg92g58pbVo+dNC6vH/e7jTB6fN8kFsETp2RTl
 l5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZfw4LFbwhadi
 woudjA2MR7i6GDk5JARMJDbcOM3YxcjFISSwlFFiy8lV7F2MHEAJGYnj68sgaoQl/lzrYoOo
 ec0oMfvPHEaQBJuAlcTE9lVgtrBAiMTt/0/ZQWwRAQWJW80v2EEamAVWMEq8WHEZLCEksJNR
 4tombRCbV8BOYvKhTWDNLAIqEstPL2QCsUUFIiQO75jFCFEjKHFy5hMWEJtTwEJiWt8MMJtZ
 QF3iz7xLzBC2uMStJ/OZIGx5ieats5knMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2yk
 V5yYW1yal66XnJ+7iREYZ9uO/dyyg7HrXfAhRgEORiUe3h8MsXFCrIllxZW5hxglOJiVRHh9
 OaPjhHhTEiurUovy44tKc1KLDzGaAj03kVlKNDkfmALySuINTQ3NLSwNzY3Njc0slMR5OwQO
 xggJpCeWpGanphakFsH0MXFwSjUw6k2rkFN7tvbrbs7Lm9herviubH7ey7RI8qvP5x+bxJYv
 l1C9Hft9X7Jqw9n/zls6hVyuT3hu52v/k+1sa7q4yb9l094Ir3RcevxSSS7DtaBVXxLdT9sm
 xt+XYr6grTgtqjySxf3DiceprX4znVfPss+84Xdl160o+zL9s+KNeqGKyd8571vNUWIpzkg0
 1GIuKk4EALY7g0rJAgAA
X-CMS-MailID: 20200302154221eucas1p2f32849cc5382209002f735d337ae7878
X-Msg-Generator: CA
X-RootMTR: 20200119121831eucas1p1fd9ac9ab84b96d75545e63150c8f8e02
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200119121831eucas1p1fd9ac9ab84b96d75545e63150c8f8e02
References: <20200119121730.10701-1-yukuai3@huawei.com>
 <CGME20200119121831eucas1p1fd9ac9ab84b96d75545e63150c8f8e02@eucas1p1.samsung.com>
 <20200119121730.10701-3-yukuai3@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, yi.zhang@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEvMTkvMjAgMToxNyBQTSwgeXUga3VhaSB3cm90ZToKPiBGaXhlcyBnY2MgJy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy92aWRlby9mYmRldi9hdHkv
cmFkZW9uX2Jhc2UuYzogSW4gZnVuY3Rpb24KPiDigJhyYWRlb25mYl9zZXRfcGFy4oCZOgo+IGRy
aXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmM6MTY1MzozODogd2FybmluZzogdmFy
aWFibGUKPiDigJh2U3luY1BvbOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0
LXZhcmlhYmxlXQo+IAo+IEl0IGlzIG5ldmVyIHVzZWQsIGFuZCBzbyBjYW4gYmUgcmVtb3ZlZC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+CgpQYXRjaCBx
dWV1ZWQgZm9yIHY1LjcsIHRoYW5rcy4KIApCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9s
bmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9u
aWNzCgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9yYWRlb25fYmFzZS5jIHwgNCAr
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmMKPiBpbmRleCBkMmU2OGVjNTgwYzIu
LjA2NjZmODQ4YmY3MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9yYWRl
b25fYmFzZS5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYwo+
IEBAIC0xNjUwLDcgKzE2NTAsNyBAQCBzdGF0aWMgaW50IHJhZGVvbmZiX3NldF9wYXIoc3RydWN0
IGZiX2luZm8gKmluZm8pCj4gIAlzdHJ1Y3QgZmJfdmFyX3NjcmVlbmluZm8gKm1vZGUgPSAmaW5m
by0+dmFyOwo+ICAJc3RydWN0IHJhZGVvbl9yZWdzICpuZXdtb2RlOwo+ICAJaW50IGhUb3RhbCwg
dlRvdGFsLCBoU3luY1N0YXJ0LCBoU3luY0VuZCwKPiAtCSAgICB2U3luY1N0YXJ0LCB2U3luY0Vu
ZCwgdlN5bmNQb2wsIGNTeW5jOwo+ICsJICAgIHZTeW5jU3RhcnQsIHZTeW5jRW5kLCBjU3luYzsK
PiAgCXU4IGhzeW5jX2Fkal90YWJbXSA9IHswLCAweDEyLCA5LCA5LCA2LCA1fTsKPiAgCXU4IGhz
eW5jX2Z1ZGdlX2ZwW10gPSB7MiwgMiwgMCwgMCwgNSwgNX07Cj4gIAl1MzIgc3luYywgaF9zeW5j
X3BvbCwgdl9zeW5jX3BvbCwgZG90Q2xvY2ssIHBpeENsb2NrOwo+IEBAIC0xNzMwLDggKzE3MzAs
NiBAQCBzdGF0aWMgaW50IHJhZGVvbmZiX3NldF9wYXIoc3RydWN0IGZiX2luZm8gKmluZm8pCj4g
IAllbHNlIGlmICh2c3luY193aWQgPiAweDFmKQkvKiBtYXggKi8KPiAgCQl2c3luY193aWQgPSAw
eDFmOwo+ICAKPiAtCXZTeW5jUG9sID0gbW9kZS0+c3luYyAmIEZCX1NZTkNfVkVSVF9ISUdIX0FD
VCA/IDAgOiAxOwo+IC0KPiAgCWNTeW5jID0gbW9kZS0+c3luYyAmIEZCX1NZTkNfQ09NUF9ISUdI
X0FDVCA/ICgxIDw8IDQpIDogMDsKPiAgCj4gIAlmb3JtYXQgPSByYWRlb25fZ2V0X2RzdGJwcChk
ZXB0aCk7Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
