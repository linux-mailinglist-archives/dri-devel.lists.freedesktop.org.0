Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A0538436
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 08:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AF7892E0;
	Fri,  7 Jun 2019 06:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2182E892E0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:15:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607061535euoutp02666eafbcb2a8acb7dcb340e2b755d4c9~l1f6n6X813119831198euoutp02k
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:15:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190607061535euoutp02666eafbcb2a8acb7dcb340e2b755d4c9~l1f6n6X813119831198euoutp02k
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190607061534eucas1p2a29e9a90c9ca901cf15fd11e28a06ed6~l1f57fI4z0190001900eucas1p2S;
 Fri,  7 Jun 2019 06:15:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 73.68.04298.6010AFC5; Fri,  7
 Jun 2019 07:15:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190607061534eucas1p1bd90a699e88649a5af1b3f0da2ea8587~l1f5ONAKc1393713937eucas1p1A;
 Fri,  7 Jun 2019 06:15:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190607061533eusmtrp2248c764b08636df309bb68015e3c1825~l1f4_lz1t2024820248eusmtrp2V;
 Fri,  7 Jun 2019 06:15:33 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-96-5cfa0106b510
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id ED.DA.04146.5010AFC5; Fri,  7
 Jun 2019 07:15:33 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190607061532eusmtip2e494029b58080ebdcedcd6aadea5278e~l1f32ltaD0058200582eusmtip2S;
 Fri,  7 Jun 2019 06:15:32 +0000 (GMT)
Subject: Re: [PATCH v4 11/15] drm/bridge: tc358767: Introduce
 tc_set_syspllparam()
To: Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <ec583c9f-2d67-0168-12b8-18050b4b429d@samsung.com>
Date: Fri, 7 Jun 2019 08:15:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607044550.13361-12-andrew.smirnov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUhTcRTt9772Zk2ey9jNPqQlQYFaEPWg0gKpVxBYBEUqtfJp5TZlT1cZ
 4ZgW09LSHOFUFEsSSxyW5ab0MasVlq4alUFOSzKMJVijXJn5fIv879xz7rnnXrg0rvSQUfRR
 fS5v0Gu0aiqMuP14oi+WQsHU1R3WFWyhZRNrdplI1mzxk+xPbzfBPuhyY6w3MEaxg7X9GFtc
 flXGvnLWUOz7gScE21r3jto8l3tVVopxg9YpjHPY3su4aksVyfnOuTHuwuRqzv32DsZ9a1vK
 9VqfY8ny/WEb03ntUSNviE84GHbk+v1RlGNfdMJZfgs3oZEFJUhOA7MWJoor8RIURiuZJgTV
 LjslFd8RNHaZQ8o3BLaWAPHP8nDUTkjCNQQVpmekVPgR+Mo+Tvtpej6zBz6bUkRDJJMM42bH
 zFicCWBw9tFnJAoUsxImb/ZTIlYwCdDrcc4kEEwMVHZ/ncELmH3ge2wnpZ4IeFo1TIjz5Uwi
 OKcMIo0z0VDYXo1LWAXvhuswMQsYvwx+jXzBpa2ToM53N4Tnw6j7lkzCi2HKIRpEXAC+piJc
 MlsQtNsdIcMG6Ha/IMVgfHrpVme8RG+Bns4yJNLAhMNbf4S0QzhU3L6MS7QCLGeVUvcy8D1v
 Dw1UQaMnQF1Eatusw2yzrrHNusb2P7ceEc1IxecJukxeWKPnj8cJGp2Qp8+MO5yta0PTf9bz
 xz3egQIvD7kQQyP1PAUnm0hVkhqjcFLnQkDj6kiF0fMzValI15zM5w3ZBwx5Wl5woUU0oVYp
 Ts0ZTFEymZpcPovnc3jDPxWj5VEmdHz3ztNpI7WfKhpPl15piL0xZK1Pwlq2OcaNjvI3Oce8
 2dv7o2uyFhrpGnfGvcmWJeb4SwO20rTg1XV7UIy5aGyDJyXrWHD507UpO4r2Ert+NFDDvefX
 n+kr1Ob8BoelPWOr19AcGdxW18l3FfQMESUfPo20+rRvXg/kFyb26U+oCeGIZs0q3CBo/gJT
 84pdYwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7qsjL9iDE43mVg0d9haNB1qYLVo
 6njLavHjymEWi4N7jjNZXPn6ns3iwdybTBadE5ewW1zeNYfN4u69EywW6+ffYnPg9rjc18vk
 8WDqfyaPnbPusnvM7pjJ6nG/+ziTR/9fA4/jN7YzeXzeJOdxbupZpgDOKD2bovzSklSFjPzi
 ElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2M1QdeMRZskK7YNXELcwPj
 c9EuRk4OCQETiSOvNrB0MXJxCAksZZQ4/egtC0RCXGL3/LfMELawxJ9rXWwQRa8ZJZoOzGDq
 YuTgEBYIkXjREA1SIyLgJ9E17wATSA2zwHcmif8Xz0NNPcYo0d+xhg2kik1AU+Lv5ptgNq+A
 ncS5C7vAtrEIqEhMOfwOzBYViJA4834FC0SNoMTJmU9YQJZxCthL7PpfBBJmFlCX+DPvEjOE
 LS/RvHU2lC0ucevJfKYJjEKzkHTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvqFSfmFpfmpesl
 5+duYgRG8LZjPzfvYLy0MfgQowAHoxIPrwPDzxgh1sSy4srcQ4wSHMxKIrxlF37ECPGmJFZW
 pRblxxeV5qQWH2I0BfptIrOUaHI+MLnklcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1O
 TS1ILYLpY+LglGpgDEwLnpt/tmjS3df87BHy5ipy5SFdv7dlruiaxDj5+CVHe1Ex5iIbUx4W
 tU7hsuPCW4/Psen/IPl/ceHchY4s+woPfRRIvZBulvfjoYFkl0fBvYrG3faHJHNEnKYvnJx/
 tflWmGH+M/agr7PEfqprv/xVt/Bfy30/gUzvM2o3GbqdjxY1uV9UYinOSDTUYi4qTgQA6GoI
 oPYCAAA=
X-CMS-MailID: 20190607061534eucas1p1bd90a699e88649a5af1b3f0da2ea8587
X-Msg-Generator: CA
X-RootMTR: 20190607044646epcas1p29293d79cf80db6b15cc97336ebcc8d4e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607044646epcas1p29293d79cf80db6b15cc97336ebcc8d4e
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
 <CGME20190607044646epcas1p29293d79cf80db6b15cc97336ebcc8d4e@epcas1p2.samsung.com>
 <20190607044550.13361-12-andrew.smirnov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559888135;
 bh=JTIdOf4q9i6u6iRJTmQCDtCZM0ySuHwp5IeDLfRv2Fc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Jib87QJk+oc3rAu0B0hNKp2g51Pgntv5hbypFoq4YKrXFPAU+fgZw3TYYRsLzetAp
 hDYJao2FCiId7oiYTAWRFcNK/kTGN75YFuaK5ZAIpETJZxNbDGpsz1zQb7oPHgby+q
 H70PxS6QONKonZYCbUY3XllXk1RDTWACHyzqO4iE=
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDYuMjAxOSAwNjo0NSwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gTW92ZSBjb21tb24g
Y29kZSBjb252ZXJ0aW5nIGNsb2NrIHJhdGUgdG8gYW4gYXBwcm9wcmlhdGUgY29uc3RhbnQgYW5k
Cj4gY29uZmlndXJpbmcgU1lTX1BMTFBBUkFNIHJlZ2lzdGVyIGludG8gYSBzZXBhcmF0ZSByb3V0
aW5lIGFuZCBjb252ZXJ0Cj4gdGhlIHJlc3Qgb2YgdGhlIGNvZGUgdG8gdXNlIGl0LiBObyBmdW5j
dGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBTbWlybm92
IDxhbmRyZXcuc21pcm5vdkBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6
ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJlZ2FyZHMKQW5kcnplago+IENj
OiBBcmNoaXQgVGFuZWphIDxhcmNoaXR0QGNvZGVhdXJvcmEub3JnPgo+IENjOiBBbmRyemVqIEhh
amRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZh
bGtlaW5lbkB0aS5jb20+Cj4gQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dl
bnRlbWJlZGRlZC5jb20+Cj4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXgu
ZGU+Cj4gQ2M6IENocmlzIEhlYWx5IDxjcGhlYWx5QGdtYWlsLmNvbT4KPiBDYzogQ29yeSBUdXNh
ciA8Y29yeS50dXNhckB6aWkuYWVybz4KPiBDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0
cm9uaXguZGU+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMgfCA0NiArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RjMzU4NzY3LmMKPiBpbmRleCA0YmI5YjE1ZTEzMjQuLmFjNTViNTkyNDllMyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPiBAQCAtNTgxLDM1ICs1ODEsNDAgQEAgc3Rh
dGljIGludCB0Y19zdHJlYW1fY2xvY2tfY2FsYyhzdHJ1Y3QgdGNfZGF0YSAqdGMpCj4gIAlyZXR1
cm4gcmVnbWFwX3dyaXRlKHRjLT5yZWdtYXAsIERQMF9WSURNTkdFTjEsIDMyNzY4KTsKPiAgfQo+
ICAKPiAtc3RhdGljIGludCB0Y19hdXhfbGlua19zZXR1cChzdHJ1Y3QgdGNfZGF0YSAqdGMpCj4g
K3N0YXRpYyBpbnQgdGNfc2V0X3N5c3BsbHBhcmFtKHN0cnVjdCB0Y19kYXRhICp0YykKPiAgewo+
ICAJdW5zaWduZWQgbG9uZyByYXRlOwo+IC0JdTMyIGRwMF9hdXhjZmcxOwo+IC0JdTMyIHZhbHVl
Owo+IC0JaW50IHJldDsKPiArCXUzMiBwbGxwYXJhbSA9IFNZU0NMS19TRUxfTFNDTEsgfCBMU0NM
S19ESVZfMjsKPiAgCj4gIAlyYXRlID0gY2xrX2dldF9yYXRlKHRjLT5yZWZjbGspOwo+ICAJc3dp
dGNoIChyYXRlKSB7Cj4gIAljYXNlIDM4NDAwMDAwOgo+IC0JCXZhbHVlID0gUkVGX0ZSRVFfMzhN
NDsKPiArCQlwbGxwYXJhbSB8PSBSRUZfRlJFUV8zOE00Owo+ICAJCWJyZWFrOwo+ICAJY2FzZSAy
NjAwMDAwMDoKPiAtCQl2YWx1ZSA9IFJFRl9GUkVRXzI2TTsKPiArCQlwbGxwYXJhbSB8PSBSRUZf
RlJFUV8yNk07Cj4gIAkJYnJlYWs7Cj4gIAljYXNlIDE5MjAwMDAwOgo+IC0JCXZhbHVlID0gUkVG
X0ZSRVFfMTlNMjsKPiArCQlwbGxwYXJhbSB8PSBSRUZfRlJFUV8xOU0yOwo+ICAJCWJyZWFrOwo+
ICAJY2FzZSAxMzAwMDAwMDoKPiAtCQl2YWx1ZSA9IFJFRl9GUkVRXzEzTTsKPiArCQlwbGxwYXJh
bSB8PSBSRUZfRlJFUV8xM007Cj4gIAkJYnJlYWs7Cj4gIAlkZWZhdWx0Ogo+ICAJCWRldl9lcnIo
dGMtPmRldiwgIkludmFsaWQgcmVmY2xrIHJhdGU6ICVsdSBIelxuIiwgcmF0ZSk7Cj4gIAkJcmV0
dXJuIC1FSU5WQUw7Cj4gIAl9Cj4gIAo+ICsJcmV0dXJuIHJlZ21hcF93cml0ZSh0Yy0+cmVnbWFw
LCBTWVNfUExMUEFSQU0sIHBsbHBhcmFtKTsKPiArfQo+ICsKPiArc3RhdGljIGludCB0Y19hdXhf
bGlua19zZXR1cChzdHJ1Y3QgdGNfZGF0YSAqdGMpCj4gK3sKPiArCWludCByZXQ7Cj4gKwl1MzIg
ZHAwX2F1eGNmZzE7Cj4gKwo+ICAJLyogU2V0dXAgRFAtUEhZIC8gUExMICovCj4gLQl2YWx1ZSB8
PSBTWVNDTEtfU0VMX0xTQ0xLIHwgTFNDTEtfRElWXzI7Cj4gLQlyZXQgPSByZWdtYXBfd3JpdGUo
dGMtPnJlZ21hcCwgU1lTX1BMTFBBUkFNLCB2YWx1ZSk7Cj4gKwlyZXQgPSB0Y19zZXRfc3lzcGxs
cGFyYW0odGMpOwo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGVycjsKPiAgCj4gQEAgLTg2OCw3ICs4
NzMsNiBAQCBzdGF0aWMgaW50IHRjX21haW5fbGlua19lbmFibGUoc3RydWN0IHRjX2RhdGEgKnRj
KQo+ICB7Cj4gIAlzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4ID0gJnRjLT5hdXg7Cj4gIAlzdHJ1Y3Qg
ZGV2aWNlICpkZXYgPSB0Yy0+ZGV2Owo+IC0JdW5zaWduZWQgaW50IHJhdGU7Cj4gIAl1MzIgZHBf
cGh5X2N0cmw7Cj4gIAl1MzIgdmFsdWU7Cj4gIAlpbnQgcmV0Owo+IEBAIC04OTYsMjUgKzkwMCw3
IEBAIHN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX2VuYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCj4g
IAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IC0JcmF0ZSA9IGNsa19nZXRfcmF0ZSh0
Yy0+cmVmY2xrKTsKPiAtCXN3aXRjaCAocmF0ZSkgewo+IC0JY2FzZSAzODQwMDAwMDoKPiAtCQl2
YWx1ZSA9IFJFRl9GUkVRXzM4TTQ7Cj4gLQkJYnJlYWs7Cj4gLQljYXNlIDI2MDAwMDAwOgo+IC0J
CXZhbHVlID0gUkVGX0ZSRVFfMjZNOwo+IC0JCWJyZWFrOwo+IC0JY2FzZSAxOTIwMDAwMDoKPiAt
CQl2YWx1ZSA9IFJFRl9GUkVRXzE5TTI7Cj4gLQkJYnJlYWs7Cj4gLQljYXNlIDEzMDAwMDAwOgo+
IC0JCXZhbHVlID0gUkVGX0ZSRVFfMTNNOwo+IC0JCWJyZWFrOwo+IC0JZGVmYXVsdDoKPiAtCQly
ZXR1cm4gLUVJTlZBTDsKPiAtCX0KPiAtCXZhbHVlIHw9IFNZU0NMS19TRUxfTFNDTEsgfCBMU0NM
S19ESVZfMjsKPiAtCXJldCA9IHJlZ21hcF93cml0ZSh0Yy0+cmVnbWFwLCBTWVNfUExMUEFSQU0s
IHZhbHVlKTsKPiArCXJldCA9IHRjX3NldF9zeXNwbGxwYXJhbSh0Yyk7Cj4gIAlpZiAocmV0KQo+
ICAJCXJldHVybiByZXQ7Cj4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
