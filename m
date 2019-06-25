Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E4254CC6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 12:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682866E0D5;
	Tue, 25 Jun 2019 10:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4066E0D5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 10:54:25 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190625105424euoutp02f0459daef2d554eb35fb66c901d5fc0c~ra6fQo5hW2635326353euoutp02E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 10:54:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190625105424euoutp02f0459daef2d554eb35fb66c901d5fc0c~ra6fQo5hW2635326353euoutp02E
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190625105423eucas1p122dbc580064b4f1295cdf59127a8336d~ra6egbcMn2315623156eucas1p1l;
 Tue, 25 Jun 2019 10:54:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id BA.0E.04298.F5DF11D5; Tue, 25
 Jun 2019 11:54:23 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190625105422eucas1p20d6b3c7d7a126f42ed2bf50edc5d8e27~ra6dnn23C2324523245eucas1p2p;
 Tue, 25 Jun 2019 10:54:22 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190625105422eusmtrp2d04ca419ae199f5024586e6d392b3375~ra6dZh8sN3072330723eusmtrp2M;
 Tue, 25 Jun 2019 10:54:22 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-f0-5d11fd5f783a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 4C.92.04146.E5DF11D5; Tue, 25
 Jun 2019 11:54:22 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190625105421eusmtip11845686facffb1722de0b1b9665e6a35~ra6c5zGNE0279502795eusmtip1e;
 Tue, 25 Jun 2019 10:54:21 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: adv7511: Attach to DSI host at probe time
To: Matt Redfearn <matt.redfearn@thinci.com>, Archit Taneja
 <architt@codeaurora.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <3951d606-6bbd-8465-4a02-1e23964a548b@samsung.com>
Date: Tue, 25 Jun 2019 12:54:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190424132233.26435-1-matt.redfearn@thinci.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRj2O2dnOy6nn1Pxw0prEqaVlwg6IzGLfhyCcBRFFmbHPHmfsjlv
 SUpILU3RLC9z5MJEkfKaOk2LTFriJXXZDWUiUmGIpc6oUNt2lPz3vM/zvJcHXhIXfyA8yDh5
 KquQM4kSvpDX8fr32wORq84Rgc+XtlGFIwMYdUM9T1CNJQ8xar2jBKfemRf41OL7AkDdLnkk
 oIzdWj71pKaCT3WbdBjV+aAZo6aah0GoA12VO8ajjUWFGN27ouPRXZopAV2lriTozpVpgjYV
 GDC6qnSGoJdaPWX2F4TB0WxiXBqrCAi5LIytmhgHKY3ijDyDBssFaqd8YE8ieAi9meoX5AMh
 KYb1AC1X6PlcsQxQ0Y/KjWIJoD6TVrDZ0vTtJ2bFYlgH0N81f840D9DA4ymeVXCBJ9Fo24LN
 5AqLALpTetZqwqEeRwO9DTaBD33RatsnvhWLYAiaGNICK+bBPejPlyGbxw2eR8tdrYDzOKOB
 ylnbAnuL/1mDwcbj0At1zmtxDrujz7PVmHUZgmYB0vWsEfmAtBQn0E3TLi6BC5ozPN1IswOt
 d1VjHM5Bpvo8nOtVA9Te3IVzwhH0yjBmm4Nbjm7qDuDoY+hFzYyAG++IPs47cyc4orsd5ThH
 i5D6pphz70am4faNge6odtTMLwYSzZZgmi1hNFvCaP7v1QFeA3BnVcqkGFYZJGfT/ZVMklIl
 j/G/kpzUCizvNrhmWNQD83hUH4AkkDiIdP0wQkwwacrMpD6ASFziKqplLJQomsnMYhXJkQpV
 IqvsA9tJnsRddM1u+qIYxjCpbALLprCKTRUj7T1yQcK09OXC98OhtyZh3b1V+ZBZqJJ5hev9
 gr3vS1zKyzxXwuOlp87szchuDY+o3/eVyAlLD0738TYWH124vjbiUZ0VVSbrjSOdEstDs3Ky
 RlMGe+188u3OGQOHJHijjMnu8Z1UHTwNL/0KW3RQH09w3DkXL2652uImJaKl0rri/RKeMpYJ
 8sMVSuYfZzacCGoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRmVeSWpSXmKPExsVy+t/xu7pxfwVjDfZ1Clr0njvJZNHU8ZbV
 Yt3EhUwW/7dNZLa48vU9m8Wna92MFp0Tl7BbXN41h81i7eIZbBa77i9gstg+bwOTxd0NZxkd
 eDxmN1xk8bjc18vksffbAhaPnbPusnvM7pjJ6rH92wNWj/vdx5k8Zk9+xOrxeZNcAGeUnk1R
 fmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbsq5cYC9YJ
 VbQcn8XUwNjB38XIySEhYCKx/sVHpi5GLg4hgaWMEhPbjjBDJMQlds9/C2ULS/y51sUGUfSa
 UWLfp29MIAlhAS+JC5vfg3WLCPQxSnyefIkdxGEW2MUssbHhNytIlZDAREaJ+1fUQGw2AU2J
 v5tvsoHYvAJ2ElfPzGEEsVkEVCV+PTsDNlVUIEJi9q4GFogaQYmTM5+A2ZxA9btXHQerZxZQ
 l/gz7xIzhC0vsf3tHChbXOLWk/lMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy021CtO
 zC0uzUvXS87P3cQIjOltx35u3sF4aWPwIUYBDkYlHt4FRwRihVgTy4orcw8xSnAwK4nwLk0E
 CvGmJFZWpRblxxeV5qQWH2I0BXpuIrOUaHI+MN3klcQbmhqaW1gamhubG5tZKInzdggcjBES
 SE8sSc1OTS1ILYLpY+LglGpglPPexz1Hj80jObT9spaCyaYK/WehyQm1jTyXdn94928rT+os
 bgmla4HfdqVGdmYfXxqvmxNSoKqt4fr9dffRnxv3lm1+mLuH8Zdch9akiLVnni2VPqx+ZtNV
 uypvn+oL685ud6/rVVqRYS115/00/1v20rL2LrLpCgn2bwQfdodOv7vRcZG9EktxRqKhFnNR
 cSIAEJHvw/8CAAA=
X-CMS-MailID: 20190625105422eucas1p20d6b3c7d7a126f42ed2bf50edc5d8e27
X-Msg-Generator: CA
X-RootMTR: 20190424132254epcas1p4157791b8ce30297340d7053f59bc7f10
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190424132254epcas1p4157791b8ce30297340d7053f59bc7f10
References: <CGME20190424132254epcas1p4157791b8ce30297340d7053f59bc7f10@epcas1p4.samsung.com>
 <20190424132233.26435-1-matt.redfearn@thinci.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561460064;
 bh=R2A3RFHa8CFk8Ye6kdA1TIoqIG8QcKLFEzHo0ffgjPE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=M/Abjt7FzIoz2QXxtduPFBX6sxjwzrJnVR5HSYMKA2hPwwo+sGLXLPE6vB0kOfAlV
 SPwm/49ER1tnxL4pJuQgNCqg7RJcVsub9i+RcEHnegtdmBMmWd0W0TvtZZ/N/o9F6c
 o46q17noTtb2mCiTmUml2EIGi5aq7J7EZhMKUEC0=
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Redfearn <matthew.redfearn@thinci.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQuMDQuMjAxOSAxNToyMiwgTWF0dCBSZWRmZWFybiB3cm90ZToKPiBJbiBjb250cmFzdCB0
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
ZWQtb2ZmLWJ5OiBNYXR0IFJlZGZlYXJuIDxtYXR0LnJlZGZlYXJuQHRoaW5jaS5jb20+Cj4KPiAt
LS0KPgo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYyB8IDkg
KysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1
MTFfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYwo+
IGluZGV4IGU3ZGRkM2UzZGI5Li5lYTM2YWMzYTNkZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jCj4gQEAgLTg3NCw5ICs4NzQsNiBAQCBzdGF0
aWMgaW50IGFkdjc1MTFfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+
ICAJCQkJICZhZHY3NTExX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwo+ICAJZHJtX2Nvbm5lY3Rv
cl9hdHRhY2hfZW5jb2RlcigmYWR2LT5jb25uZWN0b3IsIGJyaWRnZS0+ZW5jb2Rlcik7Cj4gIAo+
IC0JaWYgKGFkdi0+dHlwZSA9PSBBRFY3NTMzKQo+IC0JCXJldCA9IGFkdjc1MzNfYXR0YWNoX2Rz
aShhZHYpOwo+IC0KPiAgCWlmIChhZHYtPmkyY19tYWluLT5pcnEpCj4gIAkJcmVnbWFwX3dyaXRl
KGFkdi0+cmVnbWFwLCBBRFY3NTExX1JFR19JTlRfRU5BQkxFKDApLAo+ICAJCQkgICAgIEFEVjc1
MTFfSU5UMF9IUEQpOwo+IEBAIC0xMjIyLDcgKzEyMTksMTEgQEAgc3RhdGljIGludCBhZHY3NTEx
X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMsIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lk
ICppZCkKPiAgCWRybV9icmlkZ2VfYWRkKCZhZHY3NTExLT5icmlkZ2UpOwo+ICAKPiAgCWFkdjc1
MTFfYXVkaW9faW5pdChkZXYsIGFkdjc1MTEpOwo+IC0JcmV0dXJuIDA7Cj4gKwo+ICsJaWYgKGFk
djc1MTEtPnR5cGUgPT0gQURWNzUzMykKPiArCQlyZXR1cm4gYWR2NzUzM19hdHRhY2hfZHNpKGFk
djc1MTEpOwo+ICsJZWxzZQo+ICsJCXJldHVybiAwOwoKCkl0IHNlZW1zIHRoYXQgb24gZmFpbHVy
ZSBvZiBhZHY3NTMzX2F0dGFjaF9kc2kgY2xlYW51cCBpcyBub3QgcGVyZm9ybWVkLgoKQmVzaWRl
IHRoaXMgY2hhbmdlIGxvb2tzIE9LLCBidXQgaXQgd291bGQgYmUgZ29vZCB0byB0ZXN0IGl0IG9u
CnBsYXRmb3JtcyB3aXRoIGFkdjc1MzMuCgoKUmVnYXJkcwoKQW5kcnplagoKCj4gIAo+ICBlcnJf
dW5yZWdpc3Rlcl9jZWM6Cj4gIAlpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoYWR2NzUxMS0+aTJjX2Nl
Yyk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
