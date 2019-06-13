Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AD543647
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A8889932;
	Thu, 13 Jun 2019 13:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AABD89904
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:09:43 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190613130941euoutp0221d0241892fbe5a5c3a4e12dda944bca~nxBLqkMky0197501975euoutp02Y
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:09:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190613130941euoutp0221d0241892fbe5a5c3a4e12dda944bca~nxBLqkMky0197501975euoutp02Y
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190613130940eucas1p1164d9e64a164b45b79386a13c1970a31~nxBK_qeAQ1623716237eucas1p1U;
 Thu, 13 Jun 2019 13:09:40 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 69.9F.04377.41B420D5; Thu, 13
 Jun 2019 14:09:40 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190613130939eucas1p2ed39eed5de6719ced11b82668a10132a~nxBKFxUg31943819438eucas1p2r;
 Thu, 13 Jun 2019 13:09:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190613130939eusmtrp2038b72b76541c3637832e737ded0e8ff~nxBJ2G8PA2146321463eusmtrp2e;
 Thu, 13 Jun 2019 13:09:39 +0000 (GMT)
X-AuditID: cbfec7f4-5632c9c000001119-bf-5d024b14a433
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 78.FD.04140.31B420D5; Thu, 13
 Jun 2019 14:09:39 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190613130938eusmtip2da5be16d87b60a3331e3e3ecf6b15459~nxBJJ2l-y2891228912eusmtip2J;
 Thu, 13 Jun 2019 13:09:38 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: analogix_dp: possible condition with no
 effect (if == else)
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Marc Zyngier <marc.zyngier@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <9bcf16dd-c064-27eb-3749-c3933b4b605f@samsung.com>
Date: Thu, 13 Jun 2019 15:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190525175937.GA29368@hari-Inspiron-1545>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SaUgUYRjHfWdmd2e1lXFVfLSLFvpgkFqIDJqiGDEYdhOhWE06qKW7suOR
 GWQHsVmWhlhu4iopmqwH1ponhIKLlMd6ZmlrqB0eaXmg4ZHrKPnt9/yf6/+8vCQuHxS5kNHK
 eE6tZGMUYmuiumWp46DDcSzMYzjDmU5vb8XotepMnO6ZnxbT+s9NiDZNLGP05N8+jH6QWSih
 u+tyxXTBbwNBrwyuiumSJQPyt2H0eXrE1AwVIqZxIZ9garVDEuaFJkfEvGz4iTFvF4ZFTF7r
 acb80Igxhdm9Yma2as8pmxDrIxFcTHQip3b3u2wdVaEzobhO6fXyX5mSVJRFpiEpCZQnPDY9
 F6cha1JOlSDomtHhQjCHoN3UTgjBLILujizxVktXea9ESBQjGCvPQEIwhSBv6A1hqbKnLkJR
 hR6zsAPVi4Oh4ayFxZQrrLwe2Jgko/xgTdMssjBB7YeJ+j8bvY7UBZirrUJCjR205oxu6FKK
 htHxOxIL49ReuGt4gQvsBJ9GdZjFBFBTEhi+XYwEq0dhRbsgEdgexo1vNnkXrNXqMIFvgbnk
 Hi40axAYKmtxIeEDzUbTujtyfYMrVNS5C3IAFGg0EosMlC18nLITPNjC0+pnuCDLQHNfLlTv
 A3ObYXOgExR1zm8+IgNPsnNQBtqn3Xaldttl2m2Xaf97yEdEKXLiEvjYSI4/rOSS3Hg2lk9Q
 RrqFq2Kr0Pqfe79qnKtBdctXmhBFIsUO2TtvLEwuYhP55NgmBCSucJAtWq1Lsgg2+QanVl1S
 J8RwfBPaSRIKJ1mK1XConIpk47lrHBfHqbeyGCl1SUU3l5rzThzLxYt0wfVly6E+pkUV5qE6
 E9KvOn8uPnA6yf5Sz6vJwtIe1i7B03yV3e2V1lH+JTozPT7AMJ+qPOmZqCNzpLPGNHbMvT/4
 6zdpX0jLXEpgWG69sbHGPr3N2extGzDg6xUU/oMvM1X6nhl5NDPywfF7kHdrl1436b+qIPgo
 9tABXM2z/wDJlQURbwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsVy+t/xe7rC3kyxBmueiVn0njvJZPF/20Rm
 iytf37NZrLl9iNHi4us/TBZvfl1jsuicuITd4vKuOWwWCz9uZbH4e+cfm8WKn1sZHbg91sxb
 w+ix4+4SRo+93xaweOycdZfdY3bHTFaPxXteMnls//aA1WPeyUCP+93HmTyWTLvK5vF5k1wA
 d5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexvr5
 FxkLLnBWrHs3kb2BcQpHFyMnh4SAicSldVfZQWwhgaWMEi8u5EDExSV2z3/LDGELS/y51sXW
 xcgFVPOaUWLew89sIAlhgTiJpevXMIEkRARuMkv0n//ECDGpm1Hi0IFEEJtNQFPi7+abYA28
 AnYS/zsOs4LYLAKqEq93f2IBsUUFIiRm72pggagRlDg58wmYzSlgIfHkVRPYdcwC6hJ/5l1i
 hrDlJZq3zoayxSVuPZnPNIFRcBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0
 veT83E2MwPjdduznlh2MXe+CDzEKcDAq8fAesGKKFWJNLCuuzD3EKMHBrCTC+4MBKMSbklhZ
 lVqUH19UmpNafIjRFOi5icxSosn5wNSSVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7
 NbUgtQimj4mDU6qBcU+oUu3ZKesb7kSoNEk2KjAIqMv1NWfMucQftW1SbdcpoW3zP0Wt2TX5
 9bo1NZO/8CZ9aVidEFRW+V5BWlQ7XPWk0K0DMzXrdR/5C+ke0f24Svzj8shXhh9LnOccPZF6
 /8G5HOt3301nVs54bfFCXcq9gDHrX+Hn3RejV0pXV7Wo/ndzXrXhshJLcUaioRZzUXEiAHCr
 YWv1AgAA
X-CMS-MailID: 20190613130939eucas1p2ed39eed5de6719ced11b82668a10132a
X-Msg-Generator: CA
X-RootMTR: 20190525175948epcas2p31156b3ec2ee712634558e04faa42b342
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190525175948epcas2p31156b3ec2ee712634558e04faa42b342
References: <CGME20190525175948epcas2p31156b3ec2ee712634558e04faa42b342@epcas2p3.samsung.com>
 <20190525175937.GA29368@hari-Inspiron-1545>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560431381;
 bh=zdLA4Nojr9jC09RQ/AblHRjiDN2CeTU+kemvaSieWYY=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=F4iuljgsd4Uj4r83qlWWsZPsixnbRMiKrVvHWX01wccNEj1hDuUM0IKT8XlBqloPT
 BR6hZ4OXMIxHyt+XeADVO+0T3cAYflilSrPaywWbk46tK3zT7tRG+XZR7+P0iBH7Tj
 KPrCgOrXTZNrQgzbN/SoTQmhUIx3GHTQZ6EpeWt4=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUuMDUuMjAxOSAxOTo1OSwgSGFyaXByYXNhZCBLZWxhbSB3cm90ZToKPiBmaXggYmVsb3cg
d2FybmluZyByZXBvcnRlZCBieSBjb2NjaWNoZWNrCj4KPiAuL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jOjE0MTQ6Ni04OiBXQVJOSU5HOgo+IHBvc3Np
YmxlIGNvbmRpdGlvbiB3aXRoIG5vIGVmZmVjdCAoaWYgPT0gZWxzZSkKPgo+IFNpZ25lZC1vZmYt
Ynk6IEhhcmlwcmFzYWQgS2VsYW0gPGhhcmlwcmFzYWQua2VsYW1AZ21haWwuY29tPgoKCk1peGVk
IGZlZWxpbmdzIGFib3V0IGl0LCBidXQ6CgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5o
YWpkYUBzYW1zdW5nLmNvbT4KCgpJIHdpbGwgcXVldWUgaXQgdG8gZHJtLW1pc2MtbmV4dC4KwqAt
LQpSZWdhcmRzCkFuZHJ6ZWoKCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxv
Z2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9h
bmFsb2dpeF9kcF9jb3JlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxv
Z2l4X2RwX2NvcmUuYwo+IGluZGV4IDI1N2Q2OWIuLmNmY2QxNTkgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYwo+IEBAIC0x
NDExLDggKzE0MTEsNiBAQCBzdGF0aWMgdm9pZCBhbmFsb2dpeF9kcF9icmlkZ2VfbW9kZV9zZXQo
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgCQl2aWRlby0+Y29sb3Jfc3BhY2UgPSBDT0xP
Ul9ZQ0JDUjQ0NDsKPiAgCWVsc2UgaWYgKGRpc3BsYXlfaW5mby0+Y29sb3JfZm9ybWF0cyAmIERS
TV9DT0xPUl9GT1JNQVRfWUNSQ0I0MjIpCj4gIAkJdmlkZW8tPmNvbG9yX3NwYWNlID0gQ09MT1Jf
WUNCQ1I0MjI7Cj4gLQllbHNlIGlmIChkaXNwbGF5X2luZm8tPmNvbG9yX2Zvcm1hdHMgJiBEUk1f
Q09MT1JfRk9STUFUX1JHQjQ0NCkKPiAtCQl2aWRlby0+Y29sb3Jfc3BhY2UgPSBDT0xPUl9SR0I7
Cj4gIAllbHNlCj4gIAkJdmlkZW8tPmNvbG9yX3NwYWNlID0gQ09MT1JfUkdCOwo+ICAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
