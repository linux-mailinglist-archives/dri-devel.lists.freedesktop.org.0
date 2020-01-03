Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2428912F82C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 13:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9414589B98;
	Fri,  3 Jan 2020 12:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5670989B98
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:26:26 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200103122624euoutp01a6bbb26ee66e1a7c9c926d844b2d79d9~mYBogxHGz1375013750euoutp016
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:26:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200103122624euoutp01a6bbb26ee66e1a7c9c926d844b2d79d9~mYBogxHGz1375013750euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578054384;
 bh=+aCWclvV0rZhCCMyxhCs/miKoxo1AiEONhSNOqnKW3Y=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ufh+HaetG8cs6xZc6zKailLfF/azjvScuRKvVD78/cc7hpGoxsm5JRgLu+vyxxx1W
 e+HCquA4SSxRnBr2AJ85Dtt2I0j0AbYwBpeS5uarHzgXD7vZQvCyTNzbhxWZQv0CQP
 N5JZ2tuQExaIJxwburfWz2o9gZ9nlmzyHOLdAlLE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200103122624eucas1p14bbc0d86fcf9074ffec58297f47327c1~mYBn9KEVv2385723857eucas1p1G;
 Fri,  3 Jan 2020 12:26:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 20.67.60679.0F23F0E5; Fri,  3
 Jan 2020 12:26:24 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200103122623eucas1p234b0f5ab28dd95a5cdd1e508e3542e4d~mYBniTinB1703917039eucas1p24;
 Fri,  3 Jan 2020 12:26:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200103122623eusmtrp25a2ad23ba86f7ad47bce1a860f74eafc~mYBnhsR740071200712eusmtrp2f;
 Fri,  3 Jan 2020 12:26:23 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-a3-5e0f32f018f8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7C.C4.08375.FE23F0E5; Fri,  3
 Jan 2020 12:26:23 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200103122623eusmtip23b61d1584b98ff40c75942da64c2fed8~mYBnMMbFl0940109401eusmtip2F;
 Fri,  3 Jan 2020 12:26:23 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: fsl-diu-fb: mark expected switch
 fall-throughs
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <3cc20993-1f45-ba6d-78b8-32be92b4853d@samsung.com>
Date: Fri, 3 Jan 2020 13:26:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911113604.GA31512@embeddedor>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7djP87ofjPjjDBZ+ZLa48vU9m8XWPaoW
 J/o+sFpc3jWHzeLEb3UHVo91B1U9Nq3qZPO4332cyePzJrkAligum5TUnMyy1CJ9uwSujMvv
 +tgLDotULFj3g72B8aZAFyMnh4SAicTBo2fZuhi5OIQEVjBKXDxxngXC+cIo0b77AxtIlZDA
 Z0aJxXOtYDruzrnBBFG0nFGi90kjM4TzllHi2aNGRpAqYYFgidZfy5lBbBEBI4nZM7pZQWxm
 gXqJD3t6wWrYBKwkJravArN5BewkFt7tB6rh4GARUJE4/0wYJCwqECHx6cFhVogSQYmTM5+w
 gNicAgYSG1YvgRopLnHryXwmCFteonnrbLB7JAQms0s82L2NCeJqF4ln35cyQtjCEq+Ob2GH
 sGUk/u+czwTRsI5R4m/HC6ju7YwSyyf/Y4Oospa4c+4XG8h1zAKaEut36UOEHSXeNrcygYQl
 BPgkbrwVhDiCT2LStunMEGFeiY42IYhqNYkNyzawwazt2rmSeQKj0iwkr81C8s4sJO/MQti7
 gJFlFaN4amlxbnpqsVFearlecWJucWleul5yfu4mRmB6Of3v+JcdjLv+JB1iFOBgVOLhTVDm
 jxNiTSwrrsw9xCjBwawkwlseyBsnxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU
 7NTUgtQimCwTB6dUA6N9mtH0WfZzZ9888tvrdoa4UEj8u+INy3bJBnSJ3vR44F1V2XnhudzJ
 ezUG5m79/46f8P5olfXbfZHCuWjRPofDdzo50/Yu4Jw+U9WZf/aSmtCAJTX//afLGguIX951
 T7Fmirr2Tvevc7+Z3Ws9VanFEiN+qWDrhLimpi9HxDmnbk8S4unJX6PEUpyRaKjFXFScCACl
 Hwq8KwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xe7rvjfjjDKbfUre48vU9m8XWPaoW
 J/o+sFpc3jWHzeLEb3UHVo91B1U9Nq3qZPO4332cyePzJrkAlig9m6L80pJUhYz84hJbpWhD
 CyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jMvv+tgLDotULFj3g72B8aZAFyMn
 h4SAicTdOTeYuhi5OIQEljJKLDzVCeRwACVkJI6vL4OoEZb4c62LDaLmNaPEj+YTbCAJYYFg
 idZfy5lBbBEBI4nZM7pZQWxmgXqJ2Rv3Qw1tZpQ4cqWFESTBJmAlMbF9FZjNK2AnsfBuPyvI
 MhYBFYnzz4RBwqICERKHd8yCKhGUODnzCQuIzSlgILFh9RKo+eoSf+ZdYoawxSVuPZnPBGHL
 SzRvnc08gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAeNp2
 7OfmHYyXNgYfYhTgYFTi4U1Q5o8TYk0sK67MPcQowcGsJMJbHsgbJ8SbklhZlVqUH19UmpNa
 fIjRFOi3icxSosn5wFjPK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TB
 KdXA6NWm7qfLoWk188IW7y9NK9Is9X6Kzfs4Q9GaOzzPNlPdXDXgkndiypb9k1fEFKzi/Hxw
 1udLbK+cTDvnHHlx6OgD/UvPL7RJzHmhHKE7X90727SgxuPMlJ0+9j23FzY+k1navjXhxNLX
 O30/xztPqLKOKtmwzz5z9Ryt1t+9XBO/V/Evurh4mRJLcUaioRZzUXEiAMHvSr69AgAA
X-CMS-MailID: 20200103122623eucas1p234b0f5ab28dd95a5cdd1e508e3542e4d
X-Msg-Generator: CA
X-RootMTR: 20190911053645epcas3p36e689569e847f94ea42f1692c7aba22b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190911053645epcas3p36e689569e847f94ea42f1692c7aba22b
References: <CGME20190911053645epcas3p36e689569e847f94ea42f1692c7aba22b@epcas3p3.samsung.com>
 <20190911113604.GA31512@embeddedor>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMTEvMTkgMTozNiBQTSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiBNYXJrIHN3
aXRjaCBjYXNlcyB3aGVyZSB3ZSBhcmUgZXhwZWN0aW5nIHRvIGZhbGwgdGhyb3VnaC4KPiAKPiBG
aXggdGhlIGZvbGxvd2luZyB3YXJuaW5ncyAoQnVpbGRpbmc6IG1wYzUxMnhfZGVmY29uZmlnIHBv
d2VycGMpOgo+IAo+IGRyaXZlcnMvdmlkZW8vZmJkZXYvZnNsLWRpdS1mYi5jOiBJbiBmdW5jdGlv
biDigJhmc2xfZGl1X2lvY3Rs4oCZOgo+IC4vaW5jbHVkZS9saW51eC9kZXZpY2UuaDoxNzUwOjI6
IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFs
bHRocm91Z2g9XQo+ICAgX2Rldl93YXJuKGRldiwgZGV2X2ZtdChmbXQpLCAjI19fVkFfQVJHU19f
KQo+ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IGRyaXZl
cnMvdmlkZW8vZmJkZXYvZnNsLWRpdS1mYi5jOjEyODc6Mzogbm90ZTogaW4gZXhwYW5zaW9uIG9m
IG1hY3JvIOKAmGRldl93YXJu4oCZCj4gICAgZGV2X3dhcm4oaW5mby0+ZGV2LAo+ICAgIF5+fn5+
fn5+Cj4gZHJpdmVycy92aWRlby9mYmRldi9mc2wtZGl1LWZiLmM6MTI5MDoyOiBub3RlOiBoZXJl
Cj4gICBjYXNlIE1GQl9TRVRfUElYRk1UOgo+ICAgXn5+fgo+IEluIGZpbGUgaW5jbHVkZWQgZnJv
bSAuL2luY2x1ZGUvbGludXgvYWNwaS5oOjE1OjAsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4v
aW5jbHVkZS9saW51eC9pMmMuaDoxMywKPiAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRl
L3VhcGkvbGludXgvZmIuaDo2LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGlu
dXgvZmIuaDo2LAo+ICAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2Zz
bC1kaXUtZmIuYzoyMDoKPiAuL2luY2x1ZGUvbGludXgvZGV2aWNlLmg6MTc1MDoyOiB3YXJuaW5n
OiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdo
PV0KPiAgIF9kZXZfd2FybihkZXYsIGRldl9mbXQoZm10KSwgIyNfX1ZBX0FSR1NfXykKPiAgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2ZzbC1kaXUtZmIuYzoxMjk2OjM6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDi
gJhkZXZfd2FybuKAmQo+ICAgIGRldl93YXJuKGluZm8tPmRldiwKPiAgICBefn5+fn5+fgo+IGRy
aXZlcnMvdmlkZW8vZmJkZXYvZnNsLWRpdS1mYi5jOjEyOTk6Mjogbm90ZTogaGVyZQo+ICAgY2Fz
ZSBNRkJfR0VUX1BJWEZNVDoKPiAgIF5+fn4KPiAKPiBSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qg
cm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2
YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KClRoYW5rcywgcGF0Y2ggcXVldWVkIGZvciB2NS42
IChhbHNvIHNvcnJ5IGZvciB0aGUgZGVsYXkpLgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVq
IFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVj
dHJvbmljcwoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9mYmRldi9mc2wtZGl1LWZiLmMgfCAyICsr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9mYmRldi9mc2wtZGl1LWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2ZzbC1k
aXUtZmIuYwo+IGluZGV4IGQxOWY1ODI2M2I0ZS4uM2U0MTBiOWViMjcyIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvZnNsLWRpdS1mYi5jCj4gKysrIGIvZHJpdmVycy92aWRlby9m
YmRldi9mc2wtZGl1LWZiLmMKPiBAQCAtMTI4Nyw2ICsxMjg3LDcgQEAgc3RhdGljIGludCBmc2xf
ZGl1X2lvY3RsKHN0cnVjdCBmYl9pbmZvICppbmZvLCB1bnNpZ25lZCBpbnQgY21kLAo+ICAJCWRl
dl93YXJuKGluZm8tPmRldiwKPiAgCQkJICJNRkJfU0VUX1BJWEZNVCB2YWx1ZSBvZiAweCUwOHgg
aXMgZGVwcmVjYXRlZC5cbiIsCj4gIAkJCSBNRkJfU0VUX1BJWEZNVF9PTEQpOwo+ICsJCS8qIGZh
bGwgdGhyb3VnaCAqLwo+ICAJY2FzZSBNRkJfU0VUX1BJWEZNVDoKPiAgCQlpZiAoY29weV9mcm9t
X3VzZXIoJnBpeF9mbXQsIGJ1Ziwgc2l6ZW9mKHBpeF9mbXQpKSkKPiAgCQkJcmV0dXJuIC1FRkFV
TFQ7Cj4gQEAgLTEyOTYsNiArMTI5Nyw3IEBAIHN0YXRpYyBpbnQgZnNsX2RpdV9pb2N0bChzdHJ1
Y3QgZmJfaW5mbyAqaW5mbywgdW5zaWduZWQgaW50IGNtZCwKPiAgCQlkZXZfd2FybihpbmZvLT5k
ZXYsCj4gIAkJCSAiTUZCX0dFVF9QSVhGTVQgdmFsdWUgb2YgMHglMDh4IGlzIGRlcHJlY2F0ZWQu
XG4iLAo+ICAJCQkgTUZCX0dFVF9QSVhGTVRfT0xEKTsKPiArCQkvKiBmYWxsIHRocm91Z2ggKi8K
PiAgCWNhc2UgTUZCX0dFVF9QSVhGTVQ6Cj4gIAkJcGl4X2ZtdCA9IGFkLT5waXhfZm10Owo+ICAJ
CWlmIChjb3B5X3RvX3VzZXIoYnVmLCAmcGl4X2ZtdCwgc2l6ZW9mKHBpeF9mbXQpKSkKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
