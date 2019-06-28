Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A41CB59BFE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A524A6E8DE;
	Fri, 28 Jun 2019 12:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BE36E8DE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:53:13 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628125312euoutp02eb5ca55c6f0877de1dbaae49ccba8e0f~sXeEnwR4N0492304923euoutp029
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:53:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190628125312euoutp02eb5ca55c6f0877de1dbaae49ccba8e0f~sXeEnwR4N0492304923euoutp029
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190628125312eucas1p131164f69bbc54a06a3121abf7907d217~sXeESNh_33049630496eucas1p1Y;
 Fri, 28 Jun 2019 12:53:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id F0.B1.04325.7BD061D5; Fri, 28
 Jun 2019 13:53:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190628125311eucas1p1dfa2eedb5cecdd390471bc7ffae9e6dc~sXeDkYP_m3048730487eucas1p1K;
 Fri, 28 Jun 2019 12:53:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190628125311eusmtrp1599f6533f1c1b26d546ed726cd910664~sXeDWHsfB1299212992eusmtrp1U;
 Fri, 28 Jun 2019 12:53:11 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-c2-5d160db79421
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CA.73.04140.6BD061D5; Fri, 28
 Jun 2019 13:53:11 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190628125310eusmtip165c1bbd0f238dba9686fe08819eb584a~sXeC9SRKT0155001550eusmtip1D;
 Fri, 28 Jun 2019 12:53:10 +0000 (GMT)
Subject: Re: [PATCH 11/43] docs: console.txt: convert docs to ReST and
 rename to *.rst
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <aab88ea1-0309-c18c-5ea6-3bdd72b45169@samsung.com>
Date: Fri, 28 Jun 2019 14:53:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e8cee712026b042eacf3e003a57578d963f24ad8.1561723980.git.mchehab+samsung@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRT2t3t3d7eaXOfS4wofgwINnZXUzcKMIpb+E/0lmdhyF5V02q6u
 TAhJ8bFCzRnZtJoZTs0XZr7yhZlLJcXKCP1jEqImTMUHEb5yu0n+933nfOc754NDYpJOvoyM
 16QwWo0qQU6I8JaBP6P+rWK3qEDTnIKe7s1B9Le1RYLOrGgg6OLGJR5dnv0apz/lL/Hprx1l
 BL24nMej24ZeYaFC5dsqP2VTTR6h7HleK1BaH1p4yop8A1/Z0DyOK1eaPK8IronOqpmEeB2j
 VYTcEMWVjkQn/yLuFryoQxmohq9HQhKoIOhtm+TpkYiUUFUIOn7OII6sIpgfq3KoJNQKgnqb
 Zneic7ST4ERmBJ11kzhHbAimKoZ5dpUrFQEF49W4HUupkzA48tExgVEdPJjotgjsDYIKhsc5
 NciOxVQILFsXHMM4dRi6cmYd+MCOkXWgkc9pXGDw2bTDVEipYNRQ6vDBKHeYmH7J47AXtNrK
 MO7UIQFMmGR6RO7gi7C+cJ0ru8K8pVnA4UMwbHjkCABUPYLN3DmMI60IzIYtglOdgQ+WMb7d
 CKN8oaFDwZXPQ7fRhnH+zvDD5sKd4AxFLU//lcWQmy3h1EegsbKR2F2rb6/GCpHcuCeYcU8Y
 454wxv97TQivQe5MKpsYy7AnNMydAFaVyKZqYgNikhKb0M5PDW9Z1tpQ98bNPkSRSL5fbBK5
 RUn4Kh2bltiHgMTkUrHHiDRKIlar0u4x2qRobWoCw/ahgyQudxenO01FSqhYVQpzi2GSGe1u
 l0cKZRlIWaIgVhNCmeOV6wuBEWVdFybYpbDb4ZdBGvK+Nl9Hm9MNPpufzcFSgWY6a8O38Ci5
 nSldxNzfCLKKesaLw2Vhv32u6urUQftkJfLS4gB1P1PuOfsuZMb7tNAqHXsQ5q25FBOHpek9
 7kduFza3t+qs3528ZvxNT5b7mVPnvshxNk51zA/Tsqq/qD1PJ08DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRmVeSWpSXmKPExsVy+t/xu7rbecViDdYlWjw50M5oceXrezaL
 5sXr2SymbPjAZLGwbQmLxYm+D6wWl3fNYbN4/6mTyWLHqUXMDpwem1doeWxa1cnmsX/uGnaP
 +93HmTwW901m9Vi/5SqLx+dNcgHsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFW
 RqZK+nY2Kak5mWWpRfp2CXoZs8/FF7xkq+ift5axgXEVaxcjJ4eEgInEnvN72LoYuTiEBJYy
 SjxbO4uxi5EDKCEjcXx9GUSNsMSfa11QNa8ZJR63LGUHSQgLREg8alrIBmKLCJhJnDx3FMxm
 FtjDJLGzVwWi4QWjxL/GXYwgCTYBK4mJ7avAbF4BO4lP998xgdgsAqoSe9ufg9miQEPPvF/B
 AlEjKHFy5hMwm1MgUeL85NnsEAvUJf7Mu8QMYYtL3HoynwnClpfY/nYO8wRGoVlI2mchaZmF
 pGUWkpYFjCyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAuNy27GfW3Ywdr0LPsQowMGoxMO7
 gEssVog1say4MvcQowQHs5IIr+Q5kVgh3pTEyqrUovz4otKc1OJDjKZAz01klhJNzgemjLyS
 eENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYyTvkWxtE84I+66JfF5
 0OSfHBZyE/Zce3jybEGfaeGXqpVxrqdWVHk9nLet/FFx1d+DrZZZRkoi9mfmLJwQvZVPYumR
 J7wnDop29v1N8lppxnRW8ZPulxP7S5t8fgsePxR+fYOQXfGsVVsPP+9zjb/Pup7t8ZTYgxs0
 zcX4Hm0X2uLX+HhR9tp4JZbijERDLeai4kQAuhltmuECAAA=
X-CMS-MailID: 20190628125311eucas1p1dfa2eedb5cecdd390471bc7ffae9e6dc
X-Msg-Generator: CA
X-RootMTR: 20190628122050epcas1p28436f681c27ed04495778771e032c6de
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190628122050epcas1p28436f681c27ed04495778771e032c6de
References: <cover.1561723979.git.mchehab+samsung@kernel.org>
 <CGME20190628122050epcas1p28436f681c27ed04495778771e032c6de@epcas1p2.samsung.com>
 <e8cee712026b042eacf3e003a57578d963f24ad8.1561723980.git.mchehab+samsung@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561726392;
 bh=KaumQltM0TQXsxUYD5nd8HElvlSt7Uf+bry2dirxe/E=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=jt4uE0AqVFtrgrD/wA6LNimTv/iGmiRgOOuBtKAzID9TQ3c355q//eGLpsmhT5o+S
 St27mL5JdxqB6957DkusMskdUNG3z4gP3a2X5J9WwWEOe22gIRQSdPn0n0+QZ0Z+0u
 DHyphDQ/Rc91wUVHS1f5+zmQ7x64Yd5xxr4dDA3A=
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
Cc: linux-fbdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjgvMTkgMjoyMCBQTSwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+IENvbnZl
cnQgdGhpcyBzbWFsbCBmaWxlIHRvIFJlU1QgaW4gcHJlcGFyYXRpb24gZm9yIGFkZGluZyBpdCB0
bwo+IHRoZSBkcml2ZXItYXBpIGJvb2suCj4gCj4gV2hpbGUgdGhpcyBpcyBub3QgcGFydCBvZiB0
aGUgZHJpdmVyLWFwaSBib29rLCBtYXJrIGl0IGFzCj4gOm9ycGhhbjosIGluIG9yZGVyIHRvIGF2
b2lkIGJ1aWxkIHdhcm5pbmdzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENo
ZWhhYiA8bWNoZWhhYitzYW1zdW5nQGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IEdyZWcgS3JvYWgt
SGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CgpBY2tlZC1ieTogQmFydGxvbWll
aiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgoKPiAtLS0KPiAgLi4u
L2NvbnNvbGUve2NvbnNvbGUudHh0ID0+IGNvbnNvbGUucnN0fSAgICAgIHwgNjMgKysrKysrKysr
Ky0tLS0tLS0tLQo+ICBEb2N1bWVudGF0aW9uL2ZiL2ZiY29uLnJzdCAgICAgICAgICAgICAgICAg
ICAgfCAgNCArLQo+ICBkcml2ZXJzL3R0eS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDMxIGRlbGV0
aW9ucygtKQo+ICByZW5hbWUgRG9jdW1lbnRhdGlvbi9jb25zb2xlL3tjb25zb2xlLnR4dCA9PiBj
b25zb2xlLnJzdH0gKDgwJSkKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3
aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
