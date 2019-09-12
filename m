Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74723B18D5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045356EE9D;
	Fri, 13 Sep 2019 07:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE616EDC1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 16:15:53 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190912161552euoutp02a87bffadf47985692ce41b28e570c422~DvQtuhM_U0557705577euoutp02e
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 16:15:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190912161552euoutp02a87bffadf47985692ce41b28e570c422~DvQtuhM_U0557705577euoutp02e
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190912161551eucas1p162d3b75081c28ba0055f29ba9c108738~DvQs_ULft1983319833eucas1p15;
 Thu, 12 Sep 2019 16:15:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A1.E8.04309.63F6A7D5; Thu, 12
 Sep 2019 17:15:50 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190912161550eucas1p2bdc813d46f337f3717bdbfd33bae8d4a~DvQsP4wtY2511725117eucas1p2g;
 Thu, 12 Sep 2019 16:15:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190912161550eusmtrp24ea158bfa6ff6484de3615a219097eff~DvQsBuYOO1661816618eusmtrp2F;
 Thu, 12 Sep 2019 16:15:50 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-6f-5d7a6f3624a6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 0A.22.04166.53F6A7D5; Thu, 12
 Sep 2019 17:15:49 +0100 (BST)
Received: from AMDC2459.DIGITAL.local (unknown [106.120.51.95]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190912161549eusmtip27f78cece0ec8888a08c554da80ef8f57~DvQrP0X3A1586615866eusmtip2E;
 Thu, 12 Sep 2019 16:15:49 +0000 (GMT)
From: Maciej Falkowski <m.falkowski@samsung.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2] dt-bindings: gpu: Convert Samsung Image Rotator to
 dt-schema
Date: Thu, 12 Sep 2019 18:15:38 +0200
Message-Id: <20190912161538.4321-1-m.falkowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912093315.5744-1-m.falkowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djP87pm+VWxBq+n2VjcWneO1aL33Ekm
 i//bJjJbzD8C5F75+p7N4vz5DewWl3fNYbOYcX4fk8WD5nVsFmuP3GW3WHr9IpNF694j7A48
 HmvmrWH02PttAYvHplWdbB7bvz1g9bjffZzJo2/LKkaPz5vkAtijuGxSUnMyy1KL9O0SuDKu
 fO9kKVgoXdGz+wJbA2ObWBcjJ4eEgIlEx4pmti5GLg4hgRWMEpNunmeEcL4wSmxtW8sO4Xxm
 lJh//gU7TMuqls9QieWMEs97X7LAtWxavYINpIpNwECi/81esISIQBNQ+6rjYIOZBdYwSvya
 2coEUiUsECRxv+0yUAcHB4uAqsSnj2AreAWsJZ6d2ssGsU5eYvWGA8wgNqeAjcS8eXNYQeZI
 CCxil7j/+CQLRJGLxNF5jawQtrDEq+NboG6Vkfi/cz4TyHwJgWqJa99kIXpbGCWuT3sLtcBa
 4s+qiWA3MAtoSqzfpQ8RdpR4+aKVHaKVT+LGW0GQMDOQOWnbdGaIMK9ER5sQhKkq8WZCLESj
 tETrmv2MEGEPif5bZpDQ6WeUWLNrJ9sERvlZCKsWMDKuYhRPLS3OTU8tNspLLdcrTswtLs1L
 10vOz93ECEw0p/8d/7KDcdefpEOMAhyMSjy8FjpVsUKsiWXFlbmHGCU4mJVEeH3eVMYK8aYk
 VlalFuXHF5XmpBYfYpTmYFES561meBAtJJCeWJKanZpakFoEk2Xi4JRqYAz+caVscvMV07bD
 h2Miz7PM/hzqvHlK4L05Gnf/b07SZNYtt+izc5o0R/Lt8jlsdu9flllJlp7dcOql2mRRpdfR
 4rKeQdV97vPyo5bXHd+ipFld/I1ZrulGn/jx0B2rdmz7tnHlfo3/DSqz/Ywep/kYiPBP3vox
 XyRO4Km/tcSMU/ni07re/1NiKc5INNRiLipOBAADlkh5MAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsVy+t/xe7qm+VWxBldvWlvcWneO1aL33Ekm
 i//bJjJbzD8C5F75+p7N4vz5DewWl3fNYbOYcX4fk8WD5nVsFmuP3GW3WHr9IpNF694j7A48
 HmvmrWH02PttAYvHplWdbB7bvz1g9bjffZzJo2/LKkaPz5vkAtij9GyK8ktLUhUy8otLbJWi
 DS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DKufO9kKVgoXdGz+wJbA2ObWBcj
 J4eEgInEqpbP7F2MXBxCAksZJRr/nWCDSEhL7L/2kR3CFpb4c62LDaLoE6PEvhVtYAk2AQOJ
 /jd7WUASIgJtjBJPTx1hAnGYBbYxSuxeex+ohYNDWCBA4vudehCTRUBV4hPEUF4Ba4lnp/ZC
 LZOXWL3hADOIzSlgIzFv3hxWkHIhoJqGNqYJjHwLGBlWMYqklhbnpucWG+oVJ+YWl+al6yXn
 525iBAb+tmM/N+9gvLQx+BCjAAejEg+vhU5VrBBrYllxZe4hRgkOZiURXp83lbFCvCmJlVWp
 RfnxRaU5qcWHGE2BTprILCWanA+MyrySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2amp
 BalFMH1MHJxSDYxVBjo8LOc2O92YFcS1zbW2auVnRz2deXNWpe+84P9Pr69wrUPog2btrh0C
 Z45lKq96EdW0d+a2H3mLb68OUAj9NGWJfaWRb5RxofzLRdJ+DBWv9gj+lJGv9dJmvJnOVOEx
 xUznqPoBrkCfK4s3Rk9kazzy9kJw/K6N98Qm1LHwT6/m9Jms6KjEUpyRaKjFXFScCAChZdWy
 kgIAAA==
X-CMS-MailID: 20190912161550eucas1p2bdc813d46f337f3717bdbfd33bae8d4a
X-Msg-Generator: CA
X-RootMTR: 20190912161550eucas1p2bdc813d46f337f3717bdbfd33bae8d4a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190912161550eucas1p2bdc813d46f337f3717bdbfd33bae8d4a
References: <20190912093315.5744-1-m.falkowski@samsung.com>
 <CGME20190912161550eucas1p2bdc813d46f337f3717bdbfd33bae8d4a@eucas1p2.samsung.com>
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568304952;
 bh=5S4jHwjySXMeViPrPMP4YNn6x+hNkId00H3i+t4121Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I4gUetCiketbGypAEnn8x+J+8hyO8LPlR2nETTJH0Ax5z0iEUiULZYH33JneNd3M1
 P8IJhItsztEqueAT6kxFuHzM11kpg19T6bPPufCaHXiXXbMK9tP36q3qBH9rtbM9mt
 6jIhbYf+Hza+iyqp9/uRoSVxNgW/TocNEAs4Tv5U=
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
Cc: mark.rutland@arm.com, m.falkowski@samsung.com, airlied@linux.ie,
 krzk@kernel.org, robh+dt@kernel.org, m.szyprowski@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCBTYW1zdW5nIEltYWdlIFJvdGF0b3IgdG8gbmV3ZXIgZHQtc2NoZW1hIGZvcm1hdC4K
ClNpZ25lZC1vZmYtYnk6IE1hY2llaiBGYWxrb3dza2kgPG0uZmFsa293c2tpQHNhbXN1bmcuY29t
PgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5j
b20+Ci0tLQp2MjoKLSBhZGQgcmVxdWlyZWQgcHJvcGVydGllcwotIGFkZCBwcm9wZXIgY29tbWl0
IHJlY2lwaWVudHMKLS0tCiAuLi4vYmluZGluZ3MvZ3B1L3NhbXN1bmctcm90YXRvci50eHQgICAg
ICAgICAgfCAyOCAtLS0tLS0tLS0tCiAuLi4vYmluZGluZ3MvZ3B1L3NhbXN1bmctcm90YXRvci55
YW1sICAgICAgICAgfCA1MiArKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDUy
IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvc2Ftc3VuZy1yb3RhdG9yLnR4dAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvc2Ft
c3VuZy1yb3RhdG9yLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3B1L3NhbXN1bmctcm90YXRvci50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZ3B1L3NhbXN1bmctcm90YXRvci50eHQKZGVsZXRlZCBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDNhY2EyNTc4ZGEwYi4uMDAwMDAwMDAwMDAwCi0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvc2Ftc3VuZy1yb3RhdG9yLnR4dAorKysgL2Rldi9udWxs
CkBAIC0xLDI4ICswLDAgQEAKLSogU2Ftc3VuZyBJbWFnZSBSb3RhdG9yCi0KLVJlcXVpcmVkIHBy
b3BlcnRpZXM6Ci0gIC0gY29tcGF0aWJsZSA6IHZhbHVlIHNob3VsZCBiZSBvbmUgb2YgdGhlIGZv
bGxvd2luZzoKLQkqICJzYW1zdW5nLHM1cHYyMTAtcm90YXRvciIgZm9yIFJvdGF0b3IgSVAgaW4g
UzVQVjIxMAotCSogInNhbXN1bmcsZXh5bm9zNDIxMC1yb3RhdG9yIiBmb3IgUm90YXRvciBJUCBp
biBFeHlub3M0MjEwCi0JKiAic2Ftc3VuZyxleHlub3M0MjEyLXJvdGF0b3IiIGZvciBSb3RhdG9y
IElQIGluIEV4eW5vczQyMTIvNDQxMgotCSogInNhbXN1bmcsZXh5bm9zNTI1MC1yb3RhdG9yIiBm
b3IgUm90YXRvciBJUCBpbiBFeHlub3M1MjUwCi0KLSAgLSByZWcgOiBQaHlzaWNhbCBiYXNlIGFk
ZHJlc3Mgb2YgdGhlIElQIHJlZ2lzdGVycyBhbmQgbGVuZ3RoIG9mIG1lbW9yeQotCSAgbWFwcGVk
IHJlZ2lvbi4KLQotICAtIGludGVycnVwdHMgOiBJbnRlcnJ1cHQgc3BlY2lmaWVyIGZvciByb3Rh
dG9yIGludGVycnVwdCwgYWNjb3JkaW5nIHRvIGZvcm1hdAotCQkgc3BlY2lmaWMgdG8gaW50ZXJy
dXB0IHBhcmVudC4KLQotICAtIGNsb2NrcyA6IENsb2NrIHNwZWNpZmllciBmb3Igcm90YXRvciBj
bG9jaywgYWNjb3JkaW5nIHRvIGdlbmVyaWMgY2xvY2sKLQkgICAgIGJpbmRpbmdzLiAoU2VlIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9leHlub3MqLnR4dCkKLQotICAt
IGNsb2NrLW5hbWVzIDogTmFtZXMgb2YgY2xvY2tzLiBGb3IgZXh5bm9zIHJvdGF0b3IsIGl0IHNo
b3VsZCBiZSAicm90YXRvciIuCi0KLUV4YW1wbGU6Ci0Jcm90YXRvckAxMjgxMDAwMCB7Ci0JCWNv
bXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3M0MjEwLXJvdGF0b3IiOwotCQlyZWcgPSA8MHgxMjgx
MDAwMCAweDEwMDA+OwotCQlpbnRlcnJ1cHRzID0gPDAgODMgMD47Ci0JCWNsb2NrcyA9IDwmY2xv
Y2sgMjc4PjsKLQkJY2xvY2stbmFtZXMgPSAicm90YXRvciI7Ci0JfTsKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvc2Ftc3VuZy1yb3RhdG9yLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L3NhbXN1bmctcm90YXRvci55
YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uOTZhZmFmZTk4Mzg4
Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dw
dS9zYW1zdW5nLXJvdGF0b3IueWFtbApAQCAtMCwwICsxLDUyIEBACisjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9ncHUvc2Ftc3VuZy1yb3RhdG9yLnlhbWwjCiskc2NoZW1hOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFNhbXN1bmcg
SW1hZ2UgUm90YXRvcgorCittYWludGFpbmVyczoKKyAgLSBJbmtpIERhZSA8aW5raS5kYWVAc2Ft
c3VuZy5jb20+CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgZW51bToKKyAgICAg
IC0gInNhbXN1bmcsczVwdjIxMC1yb3RhdG9yIiAgICAjIGZvciBSb3RhdG9yIElQIGluIFM1UFYy
MTAKKyAgICAgIC0gInNhbXN1bmcsZXh5bm9zNDIxMC1yb3RhdG9yIiAjIGZvciBSb3RhdG9yIElQ
IGluIEV4eW5vczQyMTAKKyAgICAgIC0gInNhbXN1bmcsZXh5bm9zNDIxMi1yb3RhdG9yIiAjIGZv
ciBSb3RhdG9yIElQIGluIEV4eW5vczQyMTIvNDQxMgorICAgICAgLSAic2Ftc3VuZyxleHlub3M1
MjUwLXJvdGF0b3IiICMgZm9yIFJvdGF0b3IgSVAgaW4gRXh5bm9zNTI1MAorICByZWc6CisgICAg
bWF4SXRlbXM6IDEKKworICBpbnRlcnJ1cHRzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgY2xvY2tz
OgorICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICBDbG9jayBzcGVjaWZpZXIgZm9yIHJvdGF0b3Ig
Y2xvY2sgYWNjb3JkaW5nIHRvIGdlbmVyaWMgY2xvY2sKKyAgICAgIGJpbmRpbmdzLiAoU2VlIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9leHlub3MqLnR4dCkKKyAgICBt
YXhJdGVtczogMQorCisgIGNsb2NrLW5hbWVzOgorICAgIGl0ZW1zOgorICAgIC0gY29uc3Q6IHJv
dGF0b3IKKyAgICBtYXhJdGVtczogMQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0g
cmVnCisgIC0gaW50ZXJydXB0cworICAtIGNsb2NrcworICAtIGNsb2NrLW5hbWVzCisKK2V4YW1w
bGVzOgorICAtIHwKKyAgICByb3RhdG9yQDEyODEwMDAwIHsKKyAgICAgICAgY29tcGF0aWJsZSA9
ICJzYW1zdW5nLGV4eW5vczQyMTAtcm90YXRvciI7CisgICAgICAgIHJlZyA9IDwweDEyODEwMDAw
IDB4MTAwMD47CisgICAgICAgIGludGVycnVwdHMgPSA8MCA4MyAwPjsKKyAgICAgICAgY2xvY2tz
ID0gPCZjbG9jayAyNzg+OworICAgICAgICBjbG9jay1uYW1lcyA9ICJyb3RhdG9yIjsKKyAgICB9
OworCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
