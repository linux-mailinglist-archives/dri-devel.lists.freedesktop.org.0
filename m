Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C2A19764F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 10:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFA689E15;
	Mon, 30 Mar 2020 08:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D726A89E15
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 08:18:26 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200330081825euoutp027592b31078be0e957ecc5b95d5c03e74~BBw8P8woN1473814738euoutp02C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 08:18:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200330081825euoutp027592b31078be0e957ecc5b95d5c03e74~BBw8P8woN1473814738euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585556305;
 bh=R4zKoePkE2jPIN9aq9DgHKaT2r9GlP1DFSynnnPQ5ME=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=NQLgoREVHeJ/WRu/QSmjIvPjhj+PHIY0kBrIa1p/OsSk32Ucho2rEKNC2jzqEJZiu
 E99MU1vTeA3Z69iVuzz57N4TVwz2G/Sq6P4mTeV3xW2BT/Gcsq6funCRBNJrF6ePpx
 rIG4KPlD1HI/xGZ8McmNedeS/qXQqd9DsKiNQ7Cs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200330081824eucas1p24db5a4b1a0e203b1eef2c353c93a2191~BBw768dP_0046300463eucas1p2z;
 Mon, 30 Mar 2020 08:18:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 59.DE.60698.05BA18E5; Mon, 30
 Mar 2020 09:18:24 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200330081824eucas1p296ab0a861f799cf33aed0226869ac6fd~BBw7gAEJx0850008500eucas1p2-;
 Mon, 30 Mar 2020 08:18:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200330081824eusmtrp2e3bb561c7cfe7310445d73d502d0d31f~BBw7faMjc3035830358eusmtrp23;
 Mon, 30 Mar 2020 08:18:24 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-3d-5e81ab504239
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 77.62.08375.05BA18E5; Mon, 30
 Mar 2020 09:18:24 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200330081823eusmtip18b39490b9c1a16667bebde8cd28cdae7~BBw6-6o8S1990419904eusmtip14;
 Mon, 30 Mar 2020 08:18:23 +0000 (GMT)
Subject: Re: [v4,1/3] drm/prime: use dma length macro when mapping sg
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Shane
 Francis <bigbeeshane@gmail.com>, dri-devel@lists.freedesktop.org
Message-ID: <bba81019-d585-d950-ecd0-c0bf36a2f58d@samsung.com>
Date: Mon, 30 Mar 2020 10:18:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cd773011-969b-28df-7488-9fddae420d81@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7djP87oBqxvjDFafUbXoPXeSyWLand2s
 Fuv+3WSxaNzZx2Tx9j6Qe+XrezaLy7vmsDmwe7Re+svmsXPWXXaP7d8esHrc7z7O5PF5k1wA
 axSXTUpqTmZZapG+XQJXxt+PR1gLJghWLHvQztTA2MTXxcjJISFgInHu2FW2LkYuDiGBFYwS
 6z8tY4JwvjBKPLu7ih3C+cwo8X/FYSaYlm3vm6FaljNKrD0yiRnCec8oceb8OjaQKmEBV4md
 Ta2MIDabgKFE19susA4RgU5Gib71m1lAEswCZRKXns8BSnBw8ArYSTTsDgQJswioSvy6dAWs
 V1QgRuLi4X5WEJtXQFDi5MwnYK2cAvYS6+b3QI2Rl2jeOpsZwhaXuPVkPtgPEgLr2CV+b+yH
 OttF4u/V81C2sMSr41vYIWwZif87YRqaGSUenlvLDuH0MEpcbprBCFFlLXHn3C+wS5kFNCXW
 79KHCDtKPLtykhkkLCHAJ3HjrSDEEXwSk7ZNhwrzSnS0CUFUq0nMOr4Obu3BC5eYJzAqzULy
 2iwk78xC8s4shL0LGFlWMYqnlhbnpqcWG+ellusVJ+YWl+al6yXn525iBKah0/+Of93BuO9P
 0iFGAQ5GJR7eGVsb4oRYE8uKK3MPMUpwMCuJ8LL5A4V4UxIrq1KL8uOLSnNSiw8xSnOwKInz
 Gi96GSskkJ5YkpqdmlqQWgSTZeLglGpg1Iu4ZM14TLbYUUdL0q3Gr36ajlpwBldU8ZctMZ/T
 Txz8sfn350qd2emaHxLTrUx6N+77UCzLldLs0Kr2fhev/oe5u5oXCjy64p3RfH568q2suT5L
 73CueV4lkJqzdMFRN787b77NqU70nRh9JaTl3yIVnZdrooUaflYnbc19uLchxHJVylMOJZbi
 jERDLeai4kQAWIaCrT8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsVy+t/xu7oBqxvjDNZe57PoPXeSyWLand2s
 Fuv+3WSxaNzZx2Tx9j6Qe+XrezaLy7vmsDmwe7Re+svmsXPWXXaP7d8esHrc7z7O5PF5k1wA
 a5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJext+P
 R1gLJghWLHvQztTA2MTXxcjJISFgIrHtfTNbFyMXh5DAUkaJDYeXskMkZCROTmtghbCFJf5c
 64Iqesso8fX+KhaQhLCAq8TOplZGEJtNwFCi6y1EkYhAJ6PEnp8XmUASzAJlErsuNDNCdK9k
 kmg8ug2oioODV8BOomF3IEgNi4CqxK9LV8AGiQrESPzc0wW2gFdAUOLkzCdgNqeAvcS6+T0s
 EDPNJOZtfsgMYctLNG+dDWWLS9x6Mp9pAqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucWG
 esWJucWleel6yfm5mxiBcbft2M/NOxgvbQw+xCjAwajEwztja0OcEGtiWXFl7iFGCQ5mJRFe
 Nn+gEG9KYmVValF+fFFpTmrxIUZToOcmMkuJJucDU0JeSbyhqaG5haWhubG5sZmFkjhvh8DB
 GCGB9MSS1OzU1ILUIpg+Jg5OqQbG6m+SsS0XpdYVT2U9IuuTvOnjtylSeR9a8vwXb3IMW2Jo
 URp6Ne/edUMtuUV3Xbm0r39vcp71PJ/j6ZZppc/f2KSv/mR3Z9fJwFhXD4tGqbKtxjOOTbP5
 +pe5bvX+hTsS9mSeKA9WXRtjqc5w7Kez6Yylhsm3Ntxy6nX+etbFNySi/G7+UZd+JZbijERD
 Leai4kQAmghP7tECAAA=
X-CMS-MailID: 20200330081824eucas1p296ab0a861f799cf33aed0226869ac6fd
X-Msg-Generator: CA
X-RootMTR: 20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb
References: <20200325090741.21957-2-bigbeeshane@gmail.com>
 <CGME20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb@eucas1p2.samsung.com>
 <4aef60ff-d9e4-d3d0-1a28-8c2dc3b94271@samsung.com>
 <82df6735-1cf0-e31f-29cc-f7d07bdaf346@amd.com>
 <cd773011-969b-28df-7488-9fddae420d81@samsung.com>
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
Cc: airlied@linux.ie, alexander.deucher@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx-request@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIDIwMjAtMDMtMjcgMTA6MTAsIE1hcmVrIFN6eXByb3dza2kgd3JvdGU6Cj4gSGkgQ2hy
aXN0aWFuLAo+Cj4gT24gMjAyMC0wMy0yNyAwOToxMSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMjcuMDMuMjAgdW0gMDg6NTQgc2NocmllYiBNYXJlayBTenlwcm93c2tpOgo+Pj4gT24g
MjAyMC0wMy0yNSAxMDowNywgU2hhbmUgRnJhbmNpcyB3cm90ZToKPj4+PiBBcyBkbWFfbWFwX3Nn
IGNhbiByZW9yZ2FuaXplIHNjYXR0ZXItZ2F0aGVyIGxpc3RzIGluIGEKPj4+PiB3YXkgdGhhdCBj
YW4gY2F1c2Ugc29tZSBsYXRlciBzZWdtZW50cyB0byBiZSBlbXB0eSB3ZSBzaG91bGQKPj4+PiBh
bHdheXMgdXNlIHRoZSBzZ19kbWFfbGVuIG1hY3JvIHRvIGZldGNoIHRoZSBhY3R1YWwgbGVuZ3Ro
Lgo+Pj4+Cj4+Pj4gVGhpcyBjb3VsZCBub3cgYmUgMCBhbmQgbm90IG5lZWQgdG8gYmUgbWFwcGVk
IHRvIGEgcGFnZSBvcgo+Pj4+IGFkZHJlc3MgYXJyYXkKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IFNoYW5lIEZyYW5jaXMgPGJpZ2JlZXNoYW5lQGdtYWlsLmNvbT4KPj4+PiBSZXZpZXdlZC1ieTog
TWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+Cj4+PiBUaGlzIHBhdGNo
IGxhbmRlZCBpbiBsaW51eC1uZXh0IDIwMjAwMzI2IGFuZCBpdCBjYXVzZXMgYSBrZXJuZWwgCj4+
PiBwYW5pYyBvbgo+Pj4gdmFyaW91cyBFeHlub3MgU29DIGJhc2VkIGJvYXJkcy4KPj4+PiAtLS0K
Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyB8IDIgKy0KPj4+PiDCoMKgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcHJpbWUuYwo+Pj4+IGluZGV4IDg2ZDliMGU0NWM4Yy4uMWRlMmNkZTIyNzdjIDEwMDY0NAo+
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+Pj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcHJpbWUuYwo+Pj4+IEBAIC05NjcsNyArOTY3LDcgQEAgaW50IGRybV9wcmlt
ZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHN0cnVjdCAKPj4+PiBzZ190YWJsZSAqc2d0LCBzdHJ1
Y3QgcGFnZSAqKnBhZ2VzLAo+Pj4+IMKgwqAgwqDCoMKgwqDCoMKgIGluZGV4ID0gMDsKPj4+PiDC
oMKgwqDCoMKgwqAgZm9yX2VhY2hfc2coc2d0LT5zZ2wsIHNnLCBzZ3QtPm5lbnRzLCBjb3VudCkg
ewo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBsZW4gPSBzZy0+bGVuZ3RoOwo+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBsZW4gPSBzZ19kbWFfbGVuKHNnKTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYWdl
ID0gc2dfcGFnZShzZyk7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWRkciA9IHNnX2RtYV9h
ZGRyZXNzKHNnKTsKPj4+IFNvcnJ5LCBidXQgdGhpcyBjb2RlIGlzIHdyb25nIDooCj4+Cj4+IFdl
bGwgaXQgaXMgYXQgbGVhc3QgYmV0dGVyIHRoYW4gYmVmb3JlIGJlY2F1c2UgaXQgbWFrZXMgbW9z
dCBkcml2ZXJzIAo+PiB3b3JrIGNvcnJlY3RseSBhZ2Fpbi4KPgo+IFdlbGwsIEknbSBub3Qgc3Vy
ZSB0aGF0IGEgaGFsZi1icm9rZW4gZml4IHNob3VsZCBiZSBjb25zaWRlcmVkIGFzIGEgCj4gZml4
IDspCj4KPiBBbnl3YXksIEkganVzdCBnb3QgdGhlIGNvbW1lbnQgZnJvbSBTaGFuZSwgdGhhdCBt
eSBwYXRjaCBpcyBmaXhpbmcgdGhlIAo+IGlzc3VlcyB3aXRoIGFtZGdwdSBhbmQgcmFkZW9uLCB3
aGlsZSBzdGlsbCB3b3JraW5nIGZpbmUgZm9yIGV4eW5vcywgc28gCj4gaXQgaXMgaW5kZWVkIGEg
cHJvcGVyIGZpeC4KClRvZGF5IEkndmUgbm90aWNlZCB0aGF0IHRoaXMgcGF0Y2ggd2VudCB0byBm
aW5hbCB2NS42IHdpdGhvdXQgZXZlbiBhIGRheSAKb2YgdGVzdGluZyBpbiBsaW51eC1uZXh0LCBz
byB2NS42IGlzIGJyb2tlbiBvbiBFeHlub3MgYW5kIHByb2JhYmx5IGEgZmV3IApvdGhlciBBUk0g
YXJjaHMsIHdoaWNoIHJlbHkgb24gdGhlIGRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlz
IApmdW5jdGlvbi4KCkJlc3QgcmVnYXJkcwotLSAKTWFyZWsgU3p5cHJvd3NraSwgUGhEClNhbXN1
bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
