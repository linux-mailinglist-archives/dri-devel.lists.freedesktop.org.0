Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2415231CE
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 12:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C578F89286;
	Mon, 20 May 2019 10:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA4C89286
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 10:54:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190520105436euoutp026e097241211f2ddd6709196e7a203eab~gXsZITAG30616706167euoutp02k
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 10:54:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190520105436euoutp026e097241211f2ddd6709196e7a203eab~gXsZITAG30616706167euoutp02k
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190520105436eucas1p26580ca1d26f062438ba39e573750bdce~gXsYgosRb0845008450eucas1p2B;
 Mon, 20 May 2019 10:54:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F6.0B.04298.B6782EC5; Mon, 20
 May 2019 11:54:35 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190520105435eucas1p21c6f5cdf29f29846a46239bde5d9eacb~gXsX2Byz50847908479eucas1p2B;
 Mon, 20 May 2019 10:54:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190520105435eusmtrp2a18be82a74aefca3897487c3db350ec2~gXsXn6wrm0813408134eusmtrp2p;
 Mon, 20 May 2019 10:54:35 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-e4-5ce2876ba00d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BF.F1.04140.B6782EC5; Mon, 20
 May 2019 11:54:35 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190520105434eusmtip29bec11c138fddc764d8c3589e4dd7532~gXsXMa58P1713317133eusmtip2Z;
 Mon, 20 May 2019 10:54:34 +0000 (GMT)
Subject: Re: [PATCHv3 12/23] drm/bridge: tc358767: ensure DP is disabled
 before LT
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <887f3c98-e2b8-7f20-58ba-27c2ddb3e87a@samsung.com>
Date: Mon, 20 May 2019 12:54:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503122949.12266-13-tomi.valkeinen@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUhUYRTte9s8h0aeo+JFDXPCzCDXoAeZVBTMn0BIQkrKUV8qjqPMqGWF
 WpqOSZmmmU9DW5UWFMsprX40gpNbWm7jOk4I4tZiWWmpOb6R/Hfuuee795zLR+PS16QzHatK
 4tQqhVJGiQld80LnrricT2G+HUX+bKZ2H3tJn0GyP/MvE2zP/BeKzcvVkuzY7QGMzS24L2JH
 Rt8RLP/tN8nWVAxS+8XyseIVTN7Aj4jkZdpSUm7KM2Dy/CVfucH4AgumjosDozhlbAqn9gkK
 F8dM8t1E4mfibP/VBSoD/cKvIBsamN3Qrm1fxWJaylQjGGrsIYXiB4Kq2q9IKL4jKCzQidaf
 6I0zmNCoQnCrptZazCLIvmMmLSp7JgRau/m1WQ5MOQ7LN3LWNlKMFyw9G6AsWMIEQUevDrNg
 gvGAuVf1hAU7MqFgaq4lBY0dtJSOr/I0bcMEQtFwmoXGGTfIrC/DBewEg+MVmOBOL4Lp3AAB
 HwLzzDUrbw9ThufWBK6w0rCuTwdTddbaAYDRIqivbbBeZi80GT6Qlr34queaRh+BPgCtmYuY
 hQbGFoyzdoIFWyjUleACLQFttlRQu4Opo9460AkedM1TgkQOE73EdeTOb4jIb8jFb8jF/7dQ
 iYhHyIlL1sRHcxo/FXfGW6OI1ySror0jE+Lr0Oqfals2zL1E8x8j9IihkWyzRF5iDpOSihRN
 arweAY3LHCQBnqYwqSRKkXqOUyecUicrOY0eudCEzElyftPYCSkTrUji4jgukVOvdzHaxjkD
 eXJZ+aFb69IXy0N8C2jXzIljp4sjybfvc2ZHL0yxf/b0DaV3XWSaYiRdnoHbp0UBI8oj7eGd
 Y8a8yr+THp6Hn2zzt7V/6IaU5U9H+8QHHbweq8QndzgOV+iNhUeDw+js2LuDbS3RslAXanxU
 Yb6pjnizZVEn6r+X0Jzmnw8FvIzQxCj8duJqjeIf0aVSfk8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xe7rZ7Y9iDI6s5LBo7rC1aDrUwGrx
 rb+VxeLK1/dsFt2dHawWD+beZLLonLiE3eLuvRMsFrM+/mC1WD//FpsDl8eDqf+ZPHbOusvu
 MbtjJqvH/e7jTB79fw08jt/YzhTAFqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5r
 ZWSqpG9nk5Kak1mWWqRvl6CX8XLWZZaCdywV13t/sjUwfmfuYuTkkBAwkTh04w1TFyMXh5DA
 UkaJI3/nMkEkxCV2z38LVSQs8edaFxtE0WtGiT9PV7CDJIQFQiROXZ7FCpIQEVjALNF95TI7
 RNUBRomf9/+AtbMJaEr83XyTDcTmFbCTOHt1G9gKFgFViU+7t7KA2KICERJn3q9ggagRlDg5
 8wmQzcHBKWAjMeVOHUiYWUBd4s+8S8wQtrxE89bZULa4xK0n85kmMArOQtI9C0nLLCQts5C0
 LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7iREYhduO/dyyg7HrXfAhRgEORiUe3g9THsYI
 sSaWFVfmHmKU4GBWEuE1Vr8fI8SbklhZlVqUH19UmpNafIjRFOi3icxSosn5wASRVxJvaGpo
 bmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBMTl42pN5y8IUxJbH5+3MFgma
 0ttxjTsirvPEUt7nuidufJyv/sOxXcU574OxYH//FjHpLE2X3fyPPxly3V29b8nNSw864uZf
 nCR16rXoId7vLY5ycv8XXdCbsqN92+0ZMuurfQ03VzpcWfFpetPxSY37jfisWfKvW//7e5VB
 eoL1Wd35Et5PRJVYijMSDbWYi4oTAZRmdZbYAgAA
X-CMS-MailID: 20190520105435eucas1p21c6f5cdf29f29846a46239bde5d9eacb
X-Msg-Generator: CA
X-RootMTR: 20190503123117epcas1p276dba3dfe5e2bb1d6c7353ef2e73d3dc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190503123117epcas1p276dba3dfe5e2bb1d6c7353ef2e73d3dc
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
 <CGME20190503123117epcas1p276dba3dfe5e2bb1d6c7353ef2e73d3dc@epcas1p2.samsung.com>
 <20190503122949.12266-13-tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558349676;
 bh=eeeTEcx37t1P25ADGQraroRYis0fFnLulgiPANAIF04=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=Jg1nkZVXLw1C1oznNWeM8aqs5Hwo25l1aK6cNmevwfbz0yX6iS49xQ8HSAMqStAou
 Td7BZs5l2ITorzO7zNf055KJvqg/47ULn9GNpPhWn1Vpcs1LyYSIbtHRm9gBGRjQns
 oCUaKYnqqM60vp44UNF7+boPHLBqmJu++Tk4H0jA=
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

T24gMDMuMDUuMjAxOSAxNDoyOSwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gTGluayB0cmFpbmlu
ZyB3aWxsIHNvbWV0aW1lcyBmYWlsIGlmIHRoZSBEUCBsaW5rIGlzIGVuYWJsZWQgd2hlbgo+IHRj
X21haW5fbGlua19lbmFibGUoKSBpcyBjYWxsZWQuIFRoZSBkcml2ZXIgbWFrZXMgc3VyZSB0aGUg
RFAgbGluayBpcwo+IGRpc2FibGVkIHdoZW4gdGhlIERQIG91dHB1dCBpcyBkaXNhYmxlZCwgYW5k
IHdlIG5ldmVyIGVuYWJsZSB0aGUgRFAKPiB3aXRob3V0IGZpcnN0IGRpc2FibGluZyBpdCwgc28g
dGhpcyBzaG91bGQgbmV2ZXIgaGFwcGVuLgo+Cj4gSG93ZXZlciwgYXMgdGhlIEhXIGJlaGF2aW9y
IHNlZW1zIHRvIGJlIHNvbWV3aGF0IHJhbmRvbSBpZiBEUCBsaW5rIGhhcwo+IGVycm9uZW91c2x5
IGJlZW4gbGVmdCBlbmFibGVkLCBsZXQncyBhZGQgYSBXQVJOX09OKCkgZm9yIHRoZSBjYXNlIGFu
ZAo+IHNldCBEUDBDVEwgdG8gMC4KPgo+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0
b21pLnZhbGtlaW5lbkB0aS5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRh
QHNhbXN1bmcuY29tPgoKwqAtLQpSZWdhcmRzCkFuZHJ6ZWoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
