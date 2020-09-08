Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C00AE2610DB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECE96E7D9;
	Tue,  8 Sep 2020 11:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024C06E7D9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:52 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113750euoutp025b9355e545655b399dc8d8f23df39765~yy-T8h4a53237932379euoutp02b
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200908113750euoutp025b9355e545655b399dc8d8f23df39765~yy-T8h4a53237932379euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599565070;
 bh=/288GAGi7cofFncgRR5tyjVBqWIquj4HXLwBEHYf7Qw=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=mPS7zcZ8sMF2zK0COeYjxEeIVew5V2dxiYFqId4ADmAZ3vbKhRsuOXnHlOv9Nd8vQ
 KOl3yjoEiYhA+Ef0obleWD/0B7q2tcLnNxwlGeN04pJv+AZgVfi4pHP7/CJrqhGHEM
 u6v5NE5KnA9NFd1Y02HmgMbHZf+UCqMZWgNbjeU8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200908113750eucas1p17567859f704041cc33b779bee75e67d2~yy-T28SBo1307213072eucas1p1-;
 Tue,  8 Sep 2020 11:37:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C0.C5.06318.E0D675F5; Tue,  8
 Sep 2020 12:37:50 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113750eucas1p198b2d514a44cb9604a09a18f4e94554e~yy-TjJ7-t1307213072eucas1p1_;
 Tue,  8 Sep 2020 11:37:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200908113750eusmtrp1294688d346151b316eece8072df90765~yy-Tii8pG2045820458eusmtrp1k;
 Tue,  8 Sep 2020 11:37:50 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-d2-5f576d0e44a3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 05.E1.06314.E0D675F5; Tue,  8
 Sep 2020 12:37:50 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113749eusmtip1a1eb2d3f40ced70f90732a09ffbc7e33~yy-TPFKRh0553105531eusmtip1L;
 Tue,  8 Sep 2020 11:37:49 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: remove set but not used 'ulCoreClock'
To: Jason Yan <yanaijie@huawei.com>
Message-ID: <7d8571f5-7f26-2507-291c-8a66ac3744bd@samsung.com>
Date: Tue, 8 Sep 2020 13:37:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200827130028.428893-1-yanaijie@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djPc7p8ueHxBr0LVSyufH3PZvF/+RVG
 ixN9H1gtLu+aw2axaE8nswOrR8uRt6we97uPM3l83iQXwBzFZZOSmpNZllqkb5fAldHQe5e9
 YD9PxfyXOg2Mc7i6GDk5JARMJO5vW8HexcjFISSwglHiw5LvzBDOF0aJhndvoJzPjBKv9z9n
 gmnpevmfDSKxnFHi/7TVUM5bRokFUzYyg1SxCVhJTGxfxQhiCwt4SEyft4kFxBYRUJZovD+d
 FaSBWaCBUeLe4cPsIAleATuJxd87wWwWARWJI48OgNmiAhESnx4cZoWoEZQ4OfMJ0CAODk6g
 Be/eV4OEmQXEJW49mc8EYctLNG+dzQxx6WR2iWN77EDKJQRcJC70OkGEhSVeHd/CDmHLSJye
 3MMCco6EwDpGib8dL5ghnO2MEssn/2ODqLKWuHPuFxvIIGYBTYn1u/Qhwo4SD9tOM0PM55O4
 8VYQ4gQ+iUnbpkOFeSU62oQgqtUkNizbwAaztmvnSuYJjEqzkPw1C8kzs5A8Mwth7wJGllWM
 4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiBieX0v+NfdzDu+5N0iFGAg1GJh9fDNyxeiDWx
 rLgy9xCjBAezkgiv09nTcUK8KYmVValF+fFFpTmpxYcYpTlYlMR5jRe9jBUSSE8sSc1OTS1I
 LYLJMnFwSjUwtjxw/V9QZ3J1UZGSQnXGv8xFnWEaazheLc+umfaNWTa86skt6RV9ApGRza58
 KgHhgXarZXMLOdqrJ+2y4b6gsf9cttXUK1ydO5ZaMsam3v++NvJi+6m9547s3Zl7q49/pePa
 X3lR6y6xc7esU2tP0FzG6VXaerp3a05W/Yy6zVv550qY5TgosRRnJBpqMRcVJwIAHfYGeCgD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7p8ueHxBs+mCFhc+fqezeL/8iuM
 Fif6PrBaXN41h81i0Z5OZgdWj5Yjb1k97ncfZ/L4vEkugDlKz6Yov7QkVSEjv7jEVina0MJI
 z9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL6Oh9y57wX6eivkvdRoY53B1MXJySAiY
 SHS9/M/WxcjFISSwlFHixP5nQA4HUEJG4vj6MogaYYk/17qgal4zSny6vZQZJMEmYCUxsX0V
 I4gtLOAhMX3eJhYQW0RAWaLx/nRWkAZmgQZGiZNf2xghunsZJWZPuQvWzStgJ7H4eyc7iM0i
 oCJx5NEBMFtUIELi8I5ZjBA1ghInZz5hAbmIE2jbu/fVIGFmAXWJP/MuMUPY4hK3nsxngrDl
 JZq3zmaewCg0C0n3LCQts5C0zELSsoCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgLG07
 9nPzDsZLG4MPMQpwMCrx8H7wCosXYk0sK67MPcQowcGsJMLrdPZ0nBBvSmJlVWpRfnxRaU5q
 8SFGU6DfJjJLiSbnA+M8ryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMH
 p1QDo15lyveLd6ynP7kfJfjgtErl8wcrvE6ruxQukjzwzy5abH2UotCm3380XeYqWAjftJDp
 2fLtt0fIJA+Lqcm5368mrXt6ieXC5VTmdWKaz9fxtDxXuv7mBs8vy3d3FSX3xFotTFnx8dOE
 pWJ/Isv8J/vmLg+tFo09WxcT2jP57bVmjzxd++kWYUosxRmJhlrMRcWJAHvS3ka7AgAA
X-CMS-MailID: 20200908113750eucas1p198b2d514a44cb9604a09a18f4e94554e
X-Msg-Generator: CA
X-RootMTR: 20200827130059eucas1p21c6e4789266a0db0890e20ebdca8c530
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200827130059eucas1p21c6e4789266a0db0890e20ebdca8c530
References: <CGME20200827130059eucas1p21c6e4789266a0db0890e20ebdca8c530@eucas1p2.samsung.com>
 <20200827130028.428893-1-yanaijie@huawei.com>
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
Cc: Hulk Robot <hulkci@huawei.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMjcvMjAgMzowMCBQTSwgSmFzb24gWWFuIHdyb3RlOgo+IFRoaXMgYWRkcmVzc2VzIHRo
ZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmcgd2l0aCAibWFrZSBXPTEiOgo+IAo+IGRyaXZlcnMvdmlk
ZW8vZmJkZXYva3lyby9TVEc0MDAwSW5pdERldmljZS5jOiBJbiBmdW5jdGlvbgo+IOKAmFNldENv
cmVDbG9ja1BMTOKAmToKPiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2t5cm8vU1RHNDAwMEluaXREZXZp
Y2UuYzoyNDc6Njogd2FybmluZzogdmFyaWFibGUKPiDigJh1bENvcmVDbG9ja+KAmSBzZXQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXSAvLyB5YW5haWppZQo+IGZpeGVk
Cj4gICAyNDcgfCAgdTMyIHVsQ29yZUNsb2NrOwo+ICAgICAgIHwgICAgICBefn5+fn5+fn5+fgo+
IAo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+CgpBcHBsaWVkIHRvIGRybS1t
aXNjLW5leHQgdHJlZSwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5p
ZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmlj
cwoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9mYmRldi9reXJvL1NURzQwMDBJbml0RGV2aWNlLmMg
fCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYva3lyby9TVEc0MDAwSW5pdERl
dmljZS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9reXJvL1NURzQwMDBJbml0RGV2aWNlLmMKPiBp
bmRleCAxZDNmMjA4MGFhNmYuLmVkYWVlYzJkOTU5MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2t5cm8vU1RHNDAwMEluaXREZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYva3lyby9TVEc0MDAwSW5pdERldmljZS5jCj4gQEAgLTI0NCw3ICsyNDQsNiBAQCBpbnQg
U2V0Q29yZUNsb2NrUExMKHZvbGF0aWxlIFNURzQwMDBSRUcgX19pb21lbSAqcFNUR1JlZywgc3Ry
dWN0IHBjaV9kZXYgKnBEZXYpCj4gIHsKPiAgCXUzMiBGLCBSLCBQOwo+ICAJdTE2IGNvcmVfcGxs
ID0gMCwgc3ViOwo+IC0JdTMyIHVsQ29yZUNsb2NrOwo+ICAJdTMyIHRtcDsKPiAgCXUzMiB1bENo
aXBTcGVlZDsKPiAgCj4gQEAgLTI4Miw3ICsyODEsNyBAQCBpbnQgU2V0Q29yZUNsb2NrUExMKHZv
bGF0aWxlIFNURzQwMDBSRUcgX19pb21lbSAqcFNUR1JlZywgc3RydWN0IHBjaV9kZXYgKnBEZXYp
Cj4gIAlpZiAodWxDaGlwU3BlZWQgPT0gMCkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gLQl1
bENvcmVDbG9jayA9IFByb2dyYW1DbG9jayhSRUZfRlJFUSwgQ09SRV9QTExfRlJFUSwgJkYsICZS
LCAmUCk7Cj4gKwlQcm9ncmFtQ2xvY2soUkVGX0ZSRVEsIENPUkVfUExMX0ZSRVEsICZGLCAmUiwg
JlApOwo+ICAKPiAgCWNvcmVfcGxsIHw9ICgoUCkgfCAoKEYgLSAyKSA8PCAyKSB8ICgoUiAtIDIp
IDw8IDExKSk7Cj4gIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
