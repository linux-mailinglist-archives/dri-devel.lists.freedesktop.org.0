Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2088E95D93
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 13:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9146E2B1;
	Tue, 20 Aug 2019 11:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142396E2B1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 11:40:14 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190820114013euoutp02ed240c99588cef0f792744417ea404a8~8nqev6OCZ0802108021euoutp02w
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 11:40:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190820114013euoutp02ed240c99588cef0f792744417ea404a8~8nqev6OCZ0802108021euoutp02w
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190820114013eucas1p2faf2ec88ecff56144dc3881860e49742~8nqeanVZR0494904949eucas1p20;
 Tue, 20 Aug 2019 11:40:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 43.BE.04374.C1CDB5D5; Tue, 20
 Aug 2019 12:40:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190820114012eucas1p246d6e6599155eca854d2f43ab1d8bdff~8nqdbJ5Cf0726207262eucas1p20;
 Tue, 20 Aug 2019 11:40:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190820114011eusmtrp2dd0a8dbc988c9ad79dbac5e91f370cec~8nqdNFHHI0769407694eusmtrp2S;
 Tue, 20 Aug 2019 11:40:11 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-f0-5d5bdc1c933d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E0.A6.04166.B1CDB5D5; Tue, 20
 Aug 2019 12:40:11 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190820114011eusmtip23b3b91c24a12070b1a9a955d2ba80467~8nqc1yTUK2203422034eusmtip2N;
 Tue, 20 Aug 2019 11:40:11 +0000 (GMT)
Subject: Re: [PATCH 1/2] video: omapfb2: Make standard and custom panel
 drivers mutually exclusive
To: Sam Ravnborg <sam@ravnborg.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <b7f0b681-f6c0-8e85-1385-46cbe3c6f9a6@samsung.com>
Date: Tue, 20 Aug 2019 13:40:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190819151706.GA21252@ravnborg.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djPc7oyd6JjDVa9VLJY+PAus8WVr+/Z
 LDonLmG3WPFzK6PF1r1X2S3Wz7/F5sDm0XjjBpvH3m8LWDxmd8xk9bjffZzJY8m0q2wex29s
 Zwpgi+KySUnNySxLLdK3S+DKaH+eXLCRr+Lk0U6mBsZb3F2MHBwSAiYSexdWdzFycQgJrGCU
 2HR9KROE84VR4vnzTyxdjJxAzmdGiUMTxUBskIanPYdYIYqWM0qs+NDPBuG8ZZS4N6ODGaRK
 WCBFouPqEbBuEQFliePnr4F1MAtcY5Ro7nrIBpJgE7CSmNi+ihHE5hWwk9i3t48VxGYRUJV4
 uXwaO4gtKhAhcf/YBlaIGkGJkzOfgA3lFDCSuLPtAVgNs4C4xK0n85kgbHmJ7W/nMIMskxDY
 xS5xb98JVoi7XSSaDtxjhLCFJV4d38IOYctI/N85nwmiYR2jxN+OF1Dd2xkllk/+xwZRZS1x
 +PhFVlCQMQtoSqzfpQ8RdpS4dPIkOyQk+SRuvBWEOIJPYtK26cwQYV6JjjYhiGo1iQ3LNrDB
 rO3auZJ5AqPSLCSvzULyziwk78xC2LuAkWUVo3hqaXFuemqxcV5quV5xYm5xaV66XnJ+7iZG
 YBI6/e/41x2M+/4kHWIU4GBU4uFNuB4dK8SaWFZcmXuIUYKDWUmEt2JOVKwQb0piZVVqUX58
 UWlOavEhRmkOFiVx3mqGB9FCAumJJanZqakFqUUwWSYOTqkGxmlhc6LnJT59+dmzYc66WwVn
 On9M0DIrfyPHJmXZ7a20jLvq1wauL/PmfVjid8il8E7Tqot5beunihnW1HqequEv8MoJffgg
 8IThO/nb6QtuvF/UF/ZmauuDFfVbrhXo9up++JAhvH8/3zrdjS5TCuw9n36QVr24zfsu2/Uj
 tgwC3jvKFNbvr1JiKc5INNRiLipOBAD7yjLHPgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRmVeSWpSXmKPExsVy+t/xe7rSd6JjDd7d0LVY+PAus8WVr+/Z
 LDonLmG3WPFzK6PF1r1X2S3Wz7/F5sDm0XjjBpvH3m8LWDxmd8xk9bjffZzJY8m0q2wex29s
 Zwpgi9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL
 aH+eXLCRr+Lk0U6mBsZb3F2MnBwSAiYST3sOsXYxcnEICSxllNj7cy9TFyMHUEJG4vj6Moga
 YYk/17rYIGpeM0r09v1hAkkIC6RIdFw9wgJiiwgoSxw/fw1sELPADUaJ/q8n2UASQgLTmSVe
 nWIEsdkErCQmtq8Cs3kF7CT27e1jBbFZBFQlXi6fxg5iiwpESJx5v4IFokZQ4uTMJ2A2p4CR
 xJ1tD8BqmAXUJf7Mu8QMYYtL3HoynwnClpfY/nYO8wRGoVlI2mchaZmFpGUWkpYFjCyrGEVS
 S4tz03OLDfWKE3OLS/PS9ZLzczcxAqNu27Gfm3cwXtoYfIhRgINRiYd3x83oWCHWxLLiytxD
 jBIczEoivBVzomKFeFMSK6tSi/Lji0pzUosPMZoCPTeRWUo0OR+YEPJK4g1NDc0tLA3Njc2N
 zSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTBO6okOnHxk32u7Lw1FghdK9aSuvcopDDde
 sDfTd67CTkHl9az3Qp+HzZ6SVGjm6aC08U7t8m7XHNM0LpGVrE+EdbY8+P3G/l+V77TsZav0
 bs7Uv+q1P2U1w07h76c9BHria7nbs3W9PpcsaJjJt68iXuKKxKmrv2yX3OlvWM0fOUf78zdF
 x1wlluKMREMt5qLiRAChRmJi0AIAAA==
X-CMS-MailID: 20190820114012eucas1p246d6e6599155eca854d2f43ab1d8bdff
X-Msg-Generator: CA
X-RootMTR: 20190816133300epcas3p344aaa1347aeea65da7015a2598ff51df
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190816133300epcas3p344aaa1347aeea65da7015a2598ff51df
References: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
 <20190816122228.9475-2-laurent.pinchart@ideasonboard.com>
 <96dc63bc-92b4-6d55-bbf5-006aab111bec@ti.com>
 <CGME20190816133300epcas3p344aaa1347aeea65da7015a2598ff51df@epcas3p3.samsung.com>
 <20190816133250.GI5020@pendragon.ideasonboard.com>
 <2b79b0e9-14bd-5add-a602-49ef1f1f577c@samsung.com>
 <20190819151706.GA21252@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566301213;
 bh=pfI2dK1t229gvRb2vBBdzbzdG8WJF1DOS2UW16LT5a8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=pyO58SqQSZ55+9cEO7zML2hAkp5O91+6dTowjPGL3fHAJkWOyt+MZr8exfQvbHCJ4
 7toDvbc+/UPr772cQkor+TiiV52YPPk2/k9Bbc6VlLklkeU0V7dr+b8Y9WG1sVgqKJ
 vvJYfxlU0Vtmki12RYbGFwlGgyAp5UtmR4OH71Ls=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMTkvMTkgNToxNyBQTSwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IEhpIEJhcnRsb21pZWoK
CkhpIFNhbSwKCj4gT24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMDQ6MTY6MjZQTSArMDIwMCwgQmFy
dGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPj4KPj4gT24gOC8xNi8xOSAzOjMyIFBNLCBM
YXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+Pj4gT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDQ6MjA6
NDZQTSArMDMwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+Pj4gT24gMTYvMDgvMjAxOSAxNToy
MiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPj4+Pj4gU3RhbmRhcmQgRFJNIHBhbmVsIGRyaXZl
cnMgZm9yIHNldmVyYWwgcGFuZWxzIHVzZWQgYnkgb21hcGZiMiBhcmUgbm93Cj4+Pj4+IGF2YWls
YWJsZS4gVGhlaXIgbW9kdWxlIG5hbWUgY2xhc2hlcyB3aXRoIHRoZSBtb2R1bGVzIGZyb20KPj4+
Pj4gZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMvLCBwYXJ0IG9mIHRoZSBkZXByZWNh
dGVkIG9tYXBmYjIgZmJkZXYKPj4+Pgo+Pj4+IFNob3VsZG4ndCB0aGF0IHBhdGggYmUgZHJpdmVy
cy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXM/Cj4+Pgo+Pj4gQWJzb2x1dGVseSA6
LSkgQ291bGQgdGhpcyBiZSBmaXhlZCB3aGVuIGFwcGx5aW5nID8gT3RoZXJ3aXNlIEknbGwKPj4+
IHN1Ym1pdCBhIHYyLgo+Pj4KPj4+Pj4gZHJpdmVyLiBBcyBvbWFwZmIyIGNhbiBvbmx5IGJlIGNv
bXBpbGVkIHdoZW4gdGhlIG9tYXBkcm0gZHJpdmVyIGlzCj4+Pj4+IGRpc2FibGVkLCBhbmQgdGhl
IERSTSBwYW5lbCBkcml2ZXJzIGFyZSB1c2VsZXNzIGluIHRoYXQgY2FzZSwgbWFrZSB0aGUKPj4+
Pj4gb21hcGZiMiBwYW5lbHMgZGVwZW5kIG9uIHRoZSBzdGFuZGFyZCBEUk0gcGFuZWxzIGJlaW5n
IGRpc2FibGVkIHRvIGZpeAo+Pj4+PiB0aGUgbmFtZSBjbGFzaC4KPj4+Pj4KPj4+Pj4gU2lnbmVk
LW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgo+Pj4+PiAtLS0KPj4+Pj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9k
aXNwbGF5cy9LY29uZmlnIHwgNSArKysrKwo+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKykKPj4+Pgo+Pj4+IENjJ2QgQmFydGxvbWllai4KPj4KPj4gVGhhbmtzIFRvbWkuCj4+
Cj4+PiBPb3BzLCBzb3JyeSwgZm9yZ290IHRvIGRvIHRoYXQgOi1TCj4+Pgo+Pj4+IFJldmlld2Vk
LWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+Pgo+PiBBY2tlZC1i
eTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgo+
IAo+IEkgdG9vayB0aGUgbGliZXJ0eSB0byBhcHBseSBpdCBhbHJlYWR5IG9ubHkgd2l0aCBUb21p
J3Mgci1iLgoKRmluZSB3aXRoIG1lLCBJIGRvbid0IHdhbnQgdG8gYmxvY2sgdGhlIG1lcmdpbmcg
cHJvY2VzcyBhbmQgSSBhbHNvCnRydXN0IHlvdXIganVkZ21lbnQuIDopCgo+IExldCBtZSBrbm93
IGlmIHlvdSB3YW50IG1lIHRvIHdhaXQgZm9yIHlvdXIgYWNrIGluIHRoZSBmdXR1cmUuCj4gVGhp
cyB3YXMgdG91Y2hpbmcgdHdvIHN1Yi1zeXN0ZW1zIGFuZCBpdCBjYW4KPiBpbiBzdWNoIGNhc2Vz
IHNvbWV0aW1lcyBiZSBhIGNoYWxsZW5nZSB0byBnZXQgYWxsIGFja3MuCgpCZXN0IHJlZ2FyZHMs
Ci0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFu
ZApTYW1zdW5nIEVsZWN0cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
