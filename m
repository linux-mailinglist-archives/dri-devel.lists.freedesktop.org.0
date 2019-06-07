Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15738442
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 08:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380A0899DB;
	Fri,  7 Jun 2019 06:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DDD892E0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:21:22 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607062121euoutp01ee2072e916c313b168c829dad043c1c2~l1k8s2Ci00034000340euoutp01_
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:21:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607062121euoutp01ee2072e916c313b168c829dad043c1c2~l1k8s2Ci00034000340euoutp01_
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190607062120eucas1p1451fd2f62646aa8420421d4800a2ade0~l1k8BNVUD1447614476eucas1p1K;
 Fri,  7 Jun 2019 06:21:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 07.BD.04377.0620AFC5; Fri,  7
 Jun 2019 07:21:20 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190607062119eucas1p1296cbd76216303b7ec1b712d59abbc1e~l1k66NLFs3127331273eucas1p1a;
 Fri,  7 Jun 2019 06:21:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190607062119eusmtrp284823900f41674c04cca049d26ae409b~l1k6pR5og2248522485eusmtrp2R;
 Fri,  7 Jun 2019 06:21:19 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-38-5cfa02604296
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B3.4B.04146.F520AFC5; Fri,  7
 Jun 2019 07:21:19 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190607062118eusmtip15d25a35d1130ec20b1ba6a2387f29f1b~l1k59O-jb0566205662eusmtip1a;
 Fri,  7 Jun 2019 06:21:18 +0000 (GMT)
Subject: Re: [PATCH v4 13/15] drm/bridge: tc358767: Simplify tc_aux_wait_busy()
To: Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <fab61a07-6842-f986-25e9-a4cc2e5c8978@samsung.com>
Date: Fri, 7 Jun 2019 08:21:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607044550.13361-14-andrew.smirnov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUhUURj23GXmOjV2HI35UUkapBVXCm5laSA0L0Wagpigo17UXJmrk8tD
 LmWmQWmZNSb2kGiFaeOSDqG44LhgKSm4j4FhZlKmYlpqXa+Sbx/fcv7vg8OQig7ajomOT+K0
 8ZpYlURGNXSufnAOJdaC3VY37Nns3LNsVlsGzf4abKfY1ncmgh1c/i5hp0pHCPZOwXMp+9H4
 VMJOTHZRbHXZqMRbpp4q2iTUTfoJqbok9wmtNuebCPW9dTe1afgtoV40HFC/L+ojLjNBMs8I
 LjZax2ldz4XKoqoWfRJf45RvP2boDFQvz0OWDOATcHd9nchDMkaBKxEszD9AgqDASwjmqpJE
 YRHB5NKkZCdRvbxIi0IFgkZDBi0m5hG8MQQI2Ab7wueVrq2ALb4MP7OaJEKAxL0E3DaOkYIg
 wUdhvXZkyyTH56Bn9JNUwBR2grnxVkLA+3EgmDtraNFjDd1Ppqk8xDCW2AsKGsMFmsSOkF1f
 QopYCaPTZVtzAE9Kobx4iBJb+0D7gJkQsQ18NdVJRewAm01l2/wNMFfeJMVwLoL6miZSFM5A
 u2mAFg6T/0pXG11F+jwstDwiBRqwFQzPW4sdrKCwoXiblkNujkJ0HwRzX/32g0oo71+W3Ecq
 /a5h+l1r9LvW6P/ffYaol0jJJfNxkRzvEc9dd+E1cXxyfKRLeEKcAf37W70bpqVGZPwT1oYw
 g1R75d4Wq8EKWqPjU+PaEDCkylau6/8VrJBHaFLTOG1CiDY5luPbkD1DqZTydIupqwocqUni
 YjgukdPuqARjaZeBctzMwT4ufY5H/HytkoKa10i7rJVXlwoPlwaleftIle6HLsyOt/h3bQw7
 dUVVPPCPcTDMWiQ+tDC2Zj/uaLbJP2Xr3LPA63jprcxrfjOeziV1ypCLp/3HPDJXU2uP5ylP
 Gx0DL3x5oXPRBvxuAG2lc7j70MmWtX0pN7uveKWHVe9RUXyUxv0YqeU1fwFaVQPlVwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsVy+t/xu7rxTL9iDO69FLBo7rC1aDrUwGrx
 48phFouDe44zWVz5+p7N4sHcm0wWnROXsFtc3jWHzeLuvRMsFuvn32Jz4PJ4MPU/k8fOWXfZ
 PWZ3zGT1uN99nMmj/6+Bx/Eb25k8Pm+S8zg39SxTAEeUnk1RfmlJqkJGfnGJrVK0oYWRnqGl
 hZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbazy4F6wQq3nx4ztrAuJW3i5GTQ0LARGL9
 18+sXYxcHEICSxklLt7qYINIiEvsnv+WGcIWlvhzrYsNoug1o8SD/nesIAlhgUCJp99PgDWI
 CPhJdM07wARSxCxwlkni9+6dUB3HGCW69n0B62AT0JT4u/kmWAevgJ3EqVsP2UFsFgEVidd3
 DjKB2KICERJn3q9ggagRlDg58wmQzcHBKWAvMXFHMkiYWUBd4s+8S8wQtrxE89bZULa4xK0n
 85kmMArNQtI9C0nLLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iREYrduO/dy8
 g/HSxuBDjAIcjEo8vA4MP2OEWBPLiitzDzFKcDArifCWXfgRI8SbklhZlVqUH19UmpNafIjR
 FOi3icxSosn5wESSVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qB
 UfPmMt/cP8liOzW+bXq48saP7xkM+/5JN84XDV1/+z3/6l7Zk4eDn73mn65vH/fW9eHpXU+n
 n35cVdDg+uD5Iq/TyxwXMLaIWvB9Y91q+evarv7km/2f64rvrZa7yHnzsPDKD94vWbcUuIZu
 /L5l7vn9jRluKZFvr8VUtDKqbusVKXa705eon6fEUpyRaKjFXFScCADbaYPf7AIAAA==
X-CMS-MailID: 20190607062119eucas1p1296cbd76216303b7ec1b712d59abbc1e
X-Msg-Generator: CA
X-RootMTR: 20190607044648epcas1p1362e8ce905aa3eb81c46f95b527e408e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607044648epcas1p1362e8ce905aa3eb81c46f95b527e408e
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
 <CGME20190607044648epcas1p1362e8ce905aa3eb81c46f95b527e408e@epcas1p1.samsung.com>
 <20190607044550.13361-14-andrew.smirnov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559888481;
 bh=4HQUvtnVFKSCot9Y4wFuv+WoVDO7QgUm/yf8qlXrVgI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=iuPpEETG9YjUwYr35q4Tc/a8Sjpq1zQD3avSWE8FyH2DpsO+wzyieTczjacZIlk16
 3R1a663Bdd4gRKr3jOaHcnEntOfRlss3CTC2vvTUK2ttvw1H7s/H+teUoFo9cVMQD6
 DNI8/G+4yTXe4jWmNcwX/aW+JyAAXZw9JCjeCuhM=
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDYuMjAxOSAwNjo0NSwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gV2UgbmV2ZXIgcGFz
cyBhbnl0aGluZyBidXQgMTAwIGFzIHRpbWVvdXRfbXMgdG8gdGNfYXV4X3dhaXRfYnVzeSgpLCBz
bwo+IHdlIG1heSBhcyB3ZWxsIGhhcmRjb2RlIHRoYXQgdmFsdWUgYW5kIHNpbXBsaWZ5IGZ1bmN0
aW9uJ3Mgc2lnbmF0dXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJl
dy5zbWlybm92QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFA
c2Ftc3VuZy5jb20+CgrCoC0tClJlZ2FyZHMKQW5kcnplago+IENjOiBBbmRyemVqIEhhamRhIDxh
LmhhamRhQHNhbXN1bmcuY29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5l
bkB0aS5jb20+Cj4gQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRlbWJl
ZGRlZC5jb20+Cj4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4g
Q2M6IENvcnkgVHVzYXIgPGNvcnkudHVzYXJAemlpLmFlcm8+Cj4gQ2M6IENocmlzIEhlYWx5IDxj
cGhlYWx5QGdtYWlsLmNvbT4KPiBDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXgu
ZGU+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMgfCA5ICsrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMz
NTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+IGluZGV4IGM5OTRj
NzJlYjMzMC4uZTc0N2YxMDAyMWUzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGMzNTg3NjcuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+
IEBAIC0yOTQsMTAgKzI5NCw5IEBAIHN0YXRpYyBpbmxpbmUgaW50IHRjX3BvbGxfdGltZW91dChz
dHJ1Y3QgdGNfZGF0YSAqdGMsIHVuc2lnbmVkIGludCBhZGRyLAo+ICAJCQkJCXNsZWVwX3VzLCB0
aW1lb3V0X3VzKTsKPiAgfQo+ICAKPiAtc3RhdGljIGludCB0Y19hdXhfd2FpdF9idXN5KHN0cnVj
dCB0Y19kYXRhICp0YywgdW5zaWduZWQgaW50IHRpbWVvdXRfbXMpCj4gK3N0YXRpYyBpbnQgdGNf
YXV4X3dhaXRfYnVzeShzdHJ1Y3QgdGNfZGF0YSAqdGMpCj4gIHsKPiAtCXJldHVybiB0Y19wb2xs
X3RpbWVvdXQodGMsIERQMF9BVVhTVEFUVVMsIEFVWF9CVVNZLCAwLAo+IC0JCQkgICAgICAgMTAw
MCwgMTAwMCAqIHRpbWVvdXRfbXMpOwo+ICsJcmV0dXJuIHRjX3BvbGxfdGltZW91dCh0YywgRFAw
X0FVWFNUQVRVUywgQVVYX0JVU1ksIDAsIDEwMDAsIDEwMDAwMCk7Cj4gIH0KPiAgCj4gIHN0YXRp
YyBpbnQgdGNfYXV4X3dyaXRlX2RhdGEoc3RydWN0IHRjX2RhdGEgKnRjLCBjb25zdCB2b2lkICpk
YXRhLAo+IEBAIC0zNTAsNyArMzQ5LDcgQEAgc3RhdGljIHNzaXplX3QgdGNfYXV4X3RyYW5zZmVy
KHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCj4gIAl1MzIgYXV4c3RhdHVzOwo+ICAJaW50IHJldDsK
PiAgCj4gLQlyZXQgPSB0Y19hdXhfd2FpdF9idXN5KHRjLCAxMDApOwo+ICsJcmV0ID0gdGNfYXV4
X3dhaXRfYnVzeSh0Yyk7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IEBAIC0z
NzcsNyArMzc2LDcgQEAgc3RhdGljIHNzaXplX3QgdGNfYXV4X3RyYW5zZmVyKHN0cnVjdCBkcm1f
ZHBfYXV4ICphdXgsCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IC0JcmV0ID0g
dGNfYXV4X3dhaXRfYnVzeSh0YywgMTAwKTsKPiArCXJldCA9IHRjX2F1eF93YWl0X2J1c3kodGMp
Owo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
