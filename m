Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25755B923
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 12:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0E389DFA;
	Mon,  1 Jul 2019 10:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A507689E32
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 10:36:50 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190701103649euoutp010a0f346366d4060ba43757d23850d594~tQi2kOY3d0569505695euoutp01j
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 10:36:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190701103649euoutp010a0f346366d4060ba43757d23850d594~tQi2kOY3d0569505695euoutp01j
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190701103648eucas1p15baa282254e802ce482042f2047941f7~tQi17tvi50125501255eucas1p1r;
 Mon,  1 Jul 2019 10:36:48 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 75.68.04377.042E91D5; Mon,  1
 Jul 2019 11:36:48 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190701103648eucas1p1620cd2b7f6d5d820f60a77e606e0cb22~tQi1MDMnX0799407994eucas1p17;
 Mon,  1 Jul 2019 10:36:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190701103647eusmtrp1e83afefe3104da592061b05c5651e223~tQi097AUZ1778817788eusmtrp1X;
 Mon,  1 Jul 2019 10:36:47 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-81-5d19e240c2ac
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 55.65.04140.F32E91D5; Mon,  1
 Jul 2019 11:36:47 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190701103647eusmtip19c40a629c7c8640fb38eca335b00c849~tQi0X_5xH2991829918eusmtip1V;
 Mon,  1 Jul 2019 10:36:47 +0000 (GMT)
Subject: Re: [PATCH v2] drm/bridge: adv7511: Attach to DSI host at probe time
To: Matt Redfearn <matt.redfearn@thinci.com>, Archit Taneja
 <architt@codeaurora.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec
 <jernej.skrabec@siol.net>, Thierry Reding <thierry.reding@gmail.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <a68a3c20-b3a0-7d0e-6a2e-28649bf9effc@samsung.com>
Date: Mon, 1 Jul 2019 12:36:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190627151740.2277-1-matt.redfearn@thinci.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRj1vfduXofT2yp8+qDayB/2aVF0QZOKwEuYRR9QmeTKy5Sc1eb8
 KmxIxrK2nILVtLnKUgprrNp0aNoql9UqXZZFOTP74WhlpYaSmds18t95zjnv857z8pK4yMub
 TaZnZrGKTGmGhC8grK0jL5au652VHO36LKa1z9swulDj49HjVj1Ovxr6xqc7f/XjdNuXToI+
 pa8Opt32Sj5t95gw2mY0Y7RDl0R/MLsQPWI3EuuEzLeuomCmQt1OMG6dFmOahk0E02D4MMFp
 LvCYxyUdGGMb7uExntNOjGnRlhFMRVkvj/lpmbc1dI8gNpXNSM9mFcvjUgRplsIi/PB7Ua6h
 VIerkTm8GJEkUKtgUAPFSECKqFoEr91eghsGERTp3Xxu+Ing8zvjhBISONFvqQvmhBoE4xcb
 edzgQ6Cteo77906ntoChNdzPz6AsGFSc7wiYcOoKBpcejfP9q/hUFIzdfhvAQioObuq+Y35M
 UAvhur06wM+kdoH7jh1xnmnQdqEvECOEWgujnt4Aj1PzwearxDkcAe/6qjAuqp6EHquEwxvh
 a6N2kp8OXuedYA7PhadlZyarHQdP7QncHxQoDYK75gacE2LggbOd52+GT4S+ZV/O0evhTXcz
 4h4yDLp807gIYVBqPYdztBA0J0WcWwwe193JhRFw9eUQvwRJDFOKGaaUMUwpY/h/rwkR11EE
 q1LKZaxyZSabs0wplStVmbJlBw7JLWjiBz794xysR/bf+x2IIpEkVKh+D8kinjRbmSd3ICBx
 yQxhc+2sZJEwVZqXzyoO7VOoMlilA80hCUmE8GhQT5KIkkmz2IMse5hV/FMxMmS2Ggk+1SFX
 7o3ubG/IE3GY7bRPxZj2pajHBiIfhO/fli/eefbIvYzCAueGchSkV21qwVUtpvjLMQk74ld3
 CQYWm6sXGI9tJ4SyNTHhvpnXoiQUHSm2r0+sqLmx+2P0j3bnw2f5TTnS2IZXm/VL2gv23q8b
 GKyPpEefJZZ38hP2bjBICGWadMUiXKGU/gXn8rdbfQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42I5/e/4XV37R5KxBu++6Fr0njvJZNHU8ZbV
 4v+2icwWV76+Z7O4+v0ls8XJN1dZLDonLmG3uLxrDpvFrvsLmCy2z9vAZHGoL9ri7oazjBY/
 d81jceD1eH+jld1jdsNFFo/Lfb1MHnu/LWDx2DnrLlCsYyarx4kJl5g8tn97wOpxv/s4k8eB
 3sksHrMnP2L1+LxJLoAnSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384m
 JTUnsyy1SN8uQS9jU1Mrc8EdoYpZk/qYGxg38HcxcnJICJhIvNy0lr2LkYtDSGApo8Tets9M
 EAlxid3z3zJD2MISf651sUEUvWaU+PJoKViRsICvxKfbuxhBEiICW5gkvm08ADaKWWAxk0Tz
 ut+sEC0TGCXmXu4Fm8UmoCnxd/NNNhCbV8BOYl3fR7BRLAIqEqt2LQGLiwpESPS1zYaqEZQ4
 OfMJC4jNKWAr8ev+I0YQm1lAXeLPvEvMELa8xPa3c6BscYlbT+YzTWAUmoWkfRaSlllIWmYh
 aVnAyLKKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMPa3Hfu5ZQdj17vgQ4wCHIxKPLwatyRi
 hVgTy4orcw8xSnAwK4nw7l8hGSvEm5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cC0lFcSb2hq
 aG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgbHk6InJyrK37rS4N045HW7X
 Z1h38yKTTKQCS5GS8n37BUuPPomY35F1V0M9Z58bw/WnV4/V7rvDtO+Eiqagso6im83Uz5IH
 Ox61ztj/1vZV5qb1z059qtRyZgkNaNqt4sgjk/L4UVzK7WpJ61XGhwL09y/4vbyt9FD/6m9u
 3RbnfjJZrNNqeaHEUpyRaKjFXFScCABhd1/WEwMAAA==
X-CMS-MailID: 20190701103648eucas1p1620cd2b7f6d5d820f60a77e606e0cb22
X-Msg-Generator: CA
X-RootMTR: 20190627151810epcas2p14661fda980f479627c6beb501f52bfb2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190627151810epcas2p14661fda980f479627c6beb501f52bfb2
References: <CGME20190627151810epcas2p14661fda980f479627c6beb501f52bfb2@epcas2p1.samsung.com>
 <20190627151740.2277-1-matt.redfearn@thinci.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561977409;
 bh=QlKaur9fP+7+/WrimQJNRX1Ptyxs2WCP18dZV/gz7rA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=HFYhfqJc+uVdX+24IalJ169qlgiyElHnUJkcTNz7holdAcONUj3+x7+rTl3JPrXKt
 wPGJcOYag17GBAOoaEnr8rcoJ25XYGgmFFIFx8I1ZOHy+zuViyrJs8Th0g/zyq3zNV
 tbnGKEZ06+N3s7xDW8YNRlj+0jq99Y6/niXCF89E=
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Redfearn <matthew.redfearn@thinci.com>,
 Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcuMDYuMjAxOSAxNzoxOCwgTWF0dCBSZWRmZWFybiB3cm90ZToKPiBJbiBjb250cmFzdCB0
byBhbGwgb2YgdGhlIERTSSBwYW5lbCBkcml2ZXJzIGluIGRyaXZlcnMvZ3B1L2RybS9wYW5lbAo+
IHdoaWNoIGF0dGFjaCB0byB0aGUgRFNJIGhvc3QgdmlhIG1pcGlfZHNpX2F0dGFjaCgpIGF0IHBy
b2JlIHRpbWUsIHRoZQo+IEFEVjc1MzMgYnJpZGdlIGRldmljZSBkb2VzIG5vdC4gSW5zdGVhZCBp
dCBkZWZlcnMgdGhpcyB0byB0aGUgcG9pbnQgdGhhdAo+IHRoZSB1cHN0cmVhbSBkZXZpY2UgY29u
bmVjdHMgdG8gaXRzIGJyaWRnZSB2aWEgZHJtX2JyaWRnZV9hdHRhY2goKS4KPiBUaGUgZ2VuZXJp
YyBTeW5vcHN5cyBNSVBJIERTSSBob3N0IGRyaXZlciBkb2VzIG5vdCByZWdpc3RlciBpdCdzIG93
bgo+IGRybV9icmlkZ2UgdW50aWwgdGhlIE1JUEkgRFNJIGhhcyBhdHRhY2hlZC4gQnV0IGl0IGRv
ZXMgbm90IGNhbGwKPiBkcm1fYnJpZGdlX2F0dGFjaCgpIG9uIHRoZSBkb3duc3RyZWFtIGRldmlj
ZSB1bnRpbCB0aGUgdXBzdHJlYW0gZGV2aWNlCj4gaGFzIGF0dGFjaGVkLiBUaGlzIGxlYWRzIHRv
IGEgY2hpY2tlbiBhbmQgdGhlIGVnZyBmYWlsdXJlIGFuZCB0aGUgRFJNCj4gcGlwZWxpbmUgZG9l
cyBub3QgY29tcGxldGUuCj4gU2luY2UgYWxsIG90aGVyIG1pcGlfZHNpX2RldmljZSBkcml2ZXJz
IGNhbGwgbWlwaV9kc2lfYXR0YWNoKCkgaW4KPiBwcm9iZSgpLCBtYWtlIHRoZSBhZHY3NTMzIG1p
cGlfZHNpX2RldmljZSBkbyB0aGUgc2FtZS4gVGhpcyBlbnN1cmVzIHRoYXQKPiB0aGUgU3lub3Bz
eXMgTUlQSSBEU0kgaG9zdCByZWdpc3RlcnMgaXQncyBicmlkZ2Ugc3VjaCB0aGF0IGl0IGlzCj4g
YXZhaWxhYmxlIGZvciB0aGUgdXBzdHJlYW0gZGV2aWNlIHRvIGNvbm5lY3QgdG8uCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXR0IFJlZGZlYXJuIDxtYXR0LnJlZGZlYXJuQHRoaW5jaS5jb20+CgpRdWV1
ZWQgdG8gZHJtLW1pc2MtbmV4dC4KCgpSZWdhcmRzCgpBbmRyemVqCgo+Cj4gLS0tCj4KPiBDaGFu
Z2VzIGluIHYyOgo+IENsZWFudXAgaWYgYWR2NzUzM19hdHRhY2hfZHNpIGZhaWxzLgo+Cj4gIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jIHwgMTIgKysrKysrKysr
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYwo+IGluZGV4
IGU3ZGRkM2UzZGI5Li44MDc4MjdiZDkxMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jCj4gQEAgLTg3NCw5ICs4NzQsNiBAQCBzdGF0aWMgaW50
IGFkdjc1MTFfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ICAJCQkJ
ICZhZHY3NTExX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwo+ICAJZHJtX2Nvbm5lY3Rvcl9hdHRh
Y2hfZW5jb2RlcigmYWR2LT5jb25uZWN0b3IsIGJyaWRnZS0+ZW5jb2Rlcik7Cj4gIAo+IC0JaWYg
KGFkdi0+dHlwZSA9PSBBRFY3NTMzKQo+IC0JCXJldCA9IGFkdjc1MzNfYXR0YWNoX2RzaShhZHYp
Owo+IC0KPiAgCWlmIChhZHYtPmkyY19tYWluLT5pcnEpCj4gIAkJcmVnbWFwX3dyaXRlKGFkdi0+
cmVnbWFwLCBBRFY3NTExX1JFR19JTlRfRU5BQkxFKDApLAo+ICAJCQkgICAgIEFEVjc1MTFfSU5U
MF9IUEQpOwo+IEBAIC0xMjIyLDggKzEyMTksMTcgQEAgc3RhdGljIGludCBhZHY3NTExX3Byb2Jl
KHN0cnVjdCBpMmNfY2xpZW50ICppMmMsIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkICppZCkK
PiAgCWRybV9icmlkZ2VfYWRkKCZhZHY3NTExLT5icmlkZ2UpOwo+ICAKPiAgCWFkdjc1MTFfYXVk
aW9faW5pdChkZXYsIGFkdjc1MTEpOwo+ICsKPiArCWlmIChhZHY3NTExLT50eXBlID09IEFEVjc1
MzMpIHsKPiArCQlyZXQgPSBhZHY3NTMzX2F0dGFjaF9kc2koYWR2NzUxMSk7Cj4gKwkJaWYgKHJl
dCkKPiArCQkJZ290byBlcnJfcmVtb3ZlX2JyaWRnZTsKPiArCX0KPiArCj4gIAlyZXR1cm4gMDsK
PiAgCj4gK2Vycl9yZW1vdmVfYnJpZGdlOgo+ICsJZHJtX2JyaWRnZV9yZW1vdmUoJmFkdjc1MTEt
PmJyaWRnZSk7Cj4gIGVycl91bnJlZ2lzdGVyX2NlYzoKPiAgCWkyY191bnJlZ2lzdGVyX2Rldmlj
ZShhZHY3NTExLT5pMmNfY2VjKTsKPiAgCWlmIChhZHY3NTExLT5jZWNfY2xrKQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
