Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7E142285
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 12:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1917889395;
	Wed, 12 Jun 2019 10:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1516E89395
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 10:32:01 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190612103200euoutp027c5d7045c756d6d0575466196293f792~nbOOJzIeq1162511625euoutp02L
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 10:32:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190612103200euoutp027c5d7045c756d6d0575466196293f792~nbOOJzIeq1162511625euoutp02L
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190612103200eucas1p2008570be22801b55ab975f75ebc31218~nbONzu0Qs2779727797eucas1p2k;
 Wed, 12 Jun 2019 10:32:00 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0D.37.04377.F94D00D5; Wed, 12
 Jun 2019 11:31:59 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190612103159eucas1p1a21761d840f8b37b4d7270f00148676c~nbONBi3Vx0761607616eucas1p1m;
 Wed, 12 Jun 2019 10:31:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190612103158eusmtrp12f47c31db12d6959a5aa4d554b6d4a8d~nbOMytBhi2572925729eusmtrp10;
 Wed, 12 Jun 2019 10:31:58 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-23-5d00d49f7f8c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BC.50.04140.E94D00D5; Wed, 12
 Jun 2019 11:31:58 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190612103158eusmtip1981e6b82da2355c493dd3e91d549d9a7~nbOMWrGB90171401714eusmtip1s;
 Wed, 12 Jun 2019 10:31:58 +0000 (GMT)
Subject: Re: [PATCH v5 00/15] tc358767 driver improvements
To: Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <2017e112-2b58-8ba4-1176-9e9e6b212478@samsung.com>
Date: Wed, 12 Jun 2019 12:31:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612083252.15321-1-andrew.smirnov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOKsWRmVeSWpSXmKPExsWy7djP87rzrzDEGhzapGPR3GFr0XSogdXi
 x5XDLBYH9xxnsrjy9T2bxYO5N5ksOicuYbe4vGsOm8XdeydYLNbPv8XmwOXxYOp/Jo+ds+6y
 e8zumMnqcb/7OJNH/18Dj+M3tjN5fN4k53Fu6lmmAI4oLpuU1JzMstQifbsErowjW0+xFewV
 rzhwo52xgfGpUBcjJ4eEgInErQc3mbsYuTiEBFYwSlzYdYAJwvnCKHHnxwY2COczo8SNWWdY
 YVreTdjFCpFYzihxbcl2qP63jBKzj69kBKkSFrCS2NbZDtYhIhAg8alpJ9goZoHTTBLtu24z
 gyTYBDQl/m6+yQZi8wrYSTz7+g6sgUVAVeLF5vtgtqhAhMSXnZsYIWoEJU7OfMICYnMC1R9r
 XwAWZxaQl9j+dg4zhC0ucevJfLAnJARusUvsWA5yNweQ4yLR/zAD4gVhiVfHt7BD2DISpyf3
 sEDY9RL3V7QwQ/R2MEps3bCTGSJhLXH4+EWwOcxAR6/fpQ8RdpT4vug/E8R4PokbbwUhTuCT
 mLRtOjNEmFeiow0a1ooS989uhRooLrH0wle2CYxKs5A8NgvJM7OQPDMLYe8CRpZVjOKppcW5
 6anFRnmp5XrFibnFpXnpesn5uZsYgcnr9L/jX3Yw7vqTdIhRgINRiYf3wPT/MUKsiWXFlbmH
 GCU4mJVEeI2yGWKFeFMSK6tSi/Lji0pzUosPMUpzsCiJ81YzPIgWEkhPLEnNTk0tSC2CyTJx
 cEo1MCaen5spH35ihkRmKMOxe2wCC9cZrJq9neOq0AMRTqefu3enbs0sW+R3ct2Bjx2vlzxL
 iq7P0Hz46XWIy80TZ3bY/L8kUukhddQi211RXjR4VshO9uj/c5epOhjvU7S+cyTivcrm524P
 3v7emft21tFvKW6Oh/hefuQ7pKZnanimJHztwoOi3PFKLMUZiYZazEXFiQCAse1bWgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsVy+t/xu7rzrjDEGhy6Z2HR3GFr0XSogdXi
 x5XDLBYH9xxnsrjy9T2bxYO5N5ksOicuYbe4vGsOm8XdeydYLNbPv8XmwOXxYOp/Jo+ds+6y
 e8zumMnqcb/7OJNH/18Dj+M3tjN5fN4k53Fu6lmmAI4oPZui/NKSVIWM/OISW6VoQwsjPUNL
 Cz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYwjW0+xFewVrzhwo52xgfGpUBcjJ4eEgInE
 uwm7WLsYuTiEBJYySqxaPosVIiEusXv+W2YIW1jiz7UuNoii14wSs1ctZAJJCAtYSWzrbAdr
 EBHwk+iad4AJpIhZ4CyTxO/dO6E6JjJKXO9cCVbFJqAp8XfzTTYQm1fATuLZ13dgcRYBVYkX
 m++D2aICERKzdzWwQNQISpyc+QTM5gSqP9a+gBHEZhZQl/gz7xIzhC0vsf3tHChbXOLWk/lM
 ExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjNhtx35u2cHY
 9S74EKMAB6MSD++B6f9jhFgTy4orcw8xSnAwK4nwGmUzxArxpiRWVqUW5ccXleakFh9iNAV6
 biKzlGhyPjCZ5JXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYFxk
 0BSi+Uf/RNN6hVdXxfY9sTri3e947rAbs5DIst55nAe6Oq8qS0isbp1XOoXtI/v8236CGi1W
 TQt8e//fv6KiFBKz5eKazkVzudXCd4jVvxd/7Nw9I0PvSsMBw+cZN8yXP1y1L8j62MKdfWXF
 +f/4Gxw4TRi+7N71vEdp+hWH+QFMu8x371JiKc5INNRiLipOBAA2GGIG7gIAAA==
X-CMS-MailID: 20190612103159eucas1p1a21761d840f8b37b4d7270f00148676c
X-Msg-Generator: CA
X-RootMTR: 20190612083307epcas1p457198b83aff94f588163cbef724ca0da
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190612083307epcas1p457198b83aff94f588163cbef724ca0da
References: <CGME20190612083307epcas1p457198b83aff94f588163cbef724ca0da@epcas1p4.samsung.com>
 <20190612083252.15321-1-andrew.smirnov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560335520;
 bh=RLAhzE8tpglT3XB2opIBLsyeo2pBXlzFYqMGzpKSjVc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=KJDjegjKqjd/mEPB4bNP/Wx8sLQwvfzitwSbCGtgIzGMQleCgchTMBYwtQ26Rc2Es
 eEWBmzFQJlwuAk2wL2r3Rp1ZPq6nwxXtW4U11kGOvl0afYDaYgH2Fs6CFhmkxMQHxH
 SZfMi/ucXQI/MQVSGl5X7uqNo4b8Wph4YZBArWOQ=
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

T24gMTIuMDYuMjAxOSAxMDozMiwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gRXZlcnlvbmU6Cj4K
PiBUaGlzIHNlcmllcyBjb250YWlucyB2YXJpb3VzIGltcHJvdmVtZW50cyAoYXQgbGVhc3QgaW4g
bXkgbWluZCkgYW5kCj4gZml4ZXMgdGhhdCBJIG1hZGUgdG8gdGMzNTg3Njcgd2hpbGUgd29ya2lu
ZyB3aXRoIHRoZSBjb2RlIG9mIHRoZQo+IGRyaXZlci4gSG9wZWZ1bHkgZWFjaCBwYXRjaCBpcyBz
ZWxmIGV4cGxhbmF0b3J5Lgo+Cj4gRmVlZGJhY2sgaXMgd2VsY29tZSEKPgo+IFRoYW5rcywKPiBB
bmRyZXkgU21pcm5vdgoKClRvbWksIHlvdSBjYW4gcXVldWUgaXQgdG8gZHJtLW1pc2MtbmV4dC4K
CgpSZWdhcmRzCgpBbmRyemVqCgoKPgo+IENoYW5nZXMgc2luY2UgW3Y0XToKPgo+ICAgICAtIHRj
X3BsbHVwZGF0ZV9wbGxlbigpIHJlbmFtZWQgdG8gdGNfcGxsdXBkYXRlKCkKPgo+ICAgICAtIENv
bGxlY3RlZCBSZXZpZXdlZC1ieXMgZnJvbSBBbmRyemVqIGZvciB0aGUgcmVzdCBvZiB0aGUgc2Vy
aWVzCj4KPiBDaGFuZ2VzIHNpbmNlIFt2M106Cj4KPiAgICAgLSBDb2xsZWN0ZWQgUmV2aWV3ZWQt
YnlzIGZyb20gQW5kcnplago+ICAgICAKPiAgICAgLSBEcm9wcGVkIGV4cGxpY2l0IGNoZWNrIGZv
ciAtRVRJTUVET1VUIGluICJkcm0vYnJpZGdlOiB0YzM1ODc2NzoKPiAgICAgICBTaW1wbGlmeSBw
b2xsaW5nIGluIHRjX21haW5fbGlua19zZXR1cCgpIiBmb3IgY29uc2lzdGVuY3kKPgo+ICAgICAt
IEFVWCB0cmFuc2ZlciBjb2RlIGNvbnZlcnRlZCB0byB1c2VyIHJlZ21hcF9yYXdfcmVhZCgpLAo+
ICAgICAgIHJlZ21hcF9yYXdfd3JpdGUoKQo+Cj4gQ2hhbmdlcyBzaW5jZSBbdjJdOgo+Cj4gICAg
IC0gUGF0Y2hzZXQgcmViYXNlZCBvbiB0b3Agb2YgdjQgb2YgVG9taSdzIHNlcmllcyB0aGF0IHJl
Y2VudGx5Cj4gICAgICAgd2VudCBpbiAoaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3Nlcmllcy81ODE3Ni8jcmV2NSkKPiAgICAgICAKPiAgICAgLSBBVVggdHJhbnNmZXIgY29kZSBj
b252ZXJ0ZWQgdG8gdXNlciByZWdtYXBfYnVsa19yZWFkKCksCj4gICAgICAgcmVnbWFwX2J1bGtf
d3JpdGUoKQo+Cj4gQ2hhbmdlcyBzaW5jZSBbdjFdOgo+Cj4gICAgIC0gUGF0Y2hzZXQgcmViYXNl
ZCBvbiB0b3Agb2YKPiAgICAgICBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2Vy
aWVzLzU4MTc2Lwo+ICAgICAgIAo+ICAgICAtIFBhdGNoZXMgdG8gcmVtb3ZlIGJvdGggdGNfd3Jp
dGUoKSBhbmQgdGNfcmVhZCgpIGhlbHBlcnMgYWRkZWQKPgo+ICAgICAtIFBhdGNoZXMgdG8gcmV3
b3JrIEFVWCB0cmFuc2ZlciBjb2RlIGFkZGVkCj4KPiAgICAgLSBCb3RoICJkcm0vYnJpZGdlOiB0
YzM1ODc2NzogU2ltcGxpZnkgcG9sbGluZyBpbgo+ICAgICAgIHRjX21haW5fbGlua19zZXR1cCgp
IiBhbmQgImRybS9icmlkZ2U6IHRjMzU4NzY3OiBTaW1wbGlmeQo+ICAgICAgIHBvbGxpbmcgaW4g
dGNfbGlua190cmFpbmluZygpIiBjaGFuZ2VkIHRvIHVzZSB0Y19wb2xsX3RpbWVvdXQoKQo+ICAg
ICAgIGluc3RlYWQgb2YgcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0KCkKPgo+IFt2NF0gbGttbC5r
ZXJuZWwub3JnL3IvMjAxOTA2MDcwNDQ1NTAuMTMzNjEtMS1hbmRyZXcuc21pcm5vdkBnbWFpbC5j
b20KPiBbdjNdIGxrbWwua2VybmVsLm9yZy9yLzIwMTkwNjA1MDcwNTA3LjExNDE3LTEtYW5kcmV3
LnNtaXJub3ZAZ21haWwuY29tCj4gW3YyXSBsa21sLmtlcm5lbC5vcmcvci8yMDE5MDMyMjAzMjkw
MS4xMjA0NS0xLWFuZHJldy5zbWlybm92QGdtYWlsLmNvbQo+IFt2MV0gbGttbC5rZXJuZWwub3Jn
L3IvMjAxOTAyMjYxOTM2MDkuOTg2Mi0xLWFuZHJldy5zbWlybm92QGdtYWlsLmNvbQo+Cj4gQW5k
cmV5IFNtaXJub3YgKDE1KToKPiAgIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBTaW1wbGlmeSB0Y19w
b2xsX3RpbWVvdXQoKQo+ICAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IFNpbXBsaWZ5IHBvbGxpbmcg
aW4gdGNfbWFpbl9saW5rX3NldHVwKCkKPiAgIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBTaW1wbGlm
eSBwb2xsaW5nIGluIHRjX2xpbmtfdHJhaW5pbmcoKQo+ICAgZHJtL2JyaWRnZTogdGMzNTg3Njc6
IFNpbXBsaWZ5IHRjX3NldF92aWRlb19tb2RlKCkKPiAgIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBE
cm9wIGN1c3RvbSB0Y193cml0ZSgpL3RjX3JlYWQoKSBhY2Nlc3NvcnMKPiAgIGRybS9icmlkZ2U6
IHRjMzU4NzY3OiBTaW1wbGlmeSBBVVggZGF0YSByZWFkCj4gICBkcm0vYnJpZGdlOiB0YzM1ODc2
NzogU2ltcGxpZnkgQVVYIGRhdGEgd3JpdGUKPiAgIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBJbmNy
ZWFzZSBBVVggdHJhbnNmZXIgbGVuZ3RoIGxpbWl0Cj4gICBkcm0vYnJpZGdlOiB0YzM1ODc2Nzog
VXNlIHJlcG9ydGVkIEFVWCB0cmFuc2ZlciBzaXplCj4gICBkcm0vYnJpZGdlOiB0YzM1ODc2Nzog
QWRkIHN1cHBvcnQgZm9yIGFkZHJlc3Mtb25seSBJMkMgdHJhbnNmZXJzCj4gICBkcm0vYnJpZGdl
OiB0YzM1ODc2NzogSW50cm9kdWNlIHRjX3NldF9zeXNwbGxwYXJhbSgpCj4gICBkcm0vYnJpZGdl
OiB0YzM1ODc2NzogSW50cm9kdWNlIHRjX3BsbHVwZGF0ZSgpCj4gICBkcm0vYnJpZGdlOiB0YzM1
ODc2NzogU2ltcGxpZnkgdGNfYXV4X3dhaXRfYnVzeSgpCj4gICBkcm0vYnJpZGdlOiB0YzM1ODc2
NzogRHJvcCB1bm5lY2Vzc2FyeSA4IGJ5dGUgYnVmZmVyCj4gICBkcm0vYnJpZGdlOiB0YzM1ODc2
NzogUmVwbGFjZSBtYWdpYyBudW1iZXIgaW4gdGNfbWFpbl9saW5rX2VuYWJsZSgpCj4KPiAgZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgNjQ4ICsrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzcyIGluc2VydGlvbnMoKyksIDI3NiBkZWxl
dGlvbnMoLSkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
