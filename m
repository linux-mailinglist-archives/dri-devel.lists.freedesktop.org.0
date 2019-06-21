Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F60E4E741
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 13:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693DB6E879;
	Fri, 21 Jun 2019 11:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6186E879
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:38:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190621113836euoutp01d186420ff931c9f776b91c54fea5063f~qM771a9-01628416284euoutp01D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:38:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190621113836euoutp01d186420ff931c9f776b91c54fea5063f~qM771a9-01628416284euoutp01D
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190621113835eucas1p2db04a6e3d276c69de6b748d6bce7b974~qM77fRZJQ0466604666eucas1p2j;
 Fri, 21 Jun 2019 11:38:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id EA.2F.04377.BB1CC0D5; Fri, 21
 Jun 2019 12:38:35 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190621113834eucas1p1ef78d2bdf1a2a47ebfaa35f6f01f0bd6~qM76qTP2f1120011200eucas1p1K;
 Fri, 21 Jun 2019 11:38:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190621113834eusmtrp26d85d232913e911675c32e88f2683bd4~qM76cRvHs2023820238eusmtrp2G;
 Fri, 21 Jun 2019 11:38:34 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-a9-5d0cc1bb8b12
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F1.6E.04146.AB1CC0D5; Fri, 21
 Jun 2019 12:38:34 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190621113834eusmtip2ce1bedd2f35f00d7d04f229296d8a84c~qM76HR9ns1652116521eusmtip2y;
 Fri, 21 Jun 2019 11:38:34 +0000 (GMT)
Subject: Re: [PATCH] efifb: BGRT: Add check for new BGRT status field
 rotation bits
To: Hans de Goede <hdegoede@redhat.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <82a83a92-a99f-520c-921f-3f7b57f5bebf@samsung.com>
Date: Fri, 21 Jun 2019 13:38:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3065d32f-add7-4e48-164b-c248cc116cea@redhat.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsWy7djPc7q7D/LEGuyZJGHx/8NuRosrX9+z
 Wbw5Pp3Jou3hLUaLE30fWC26Ft5gd2DzuHNtD5vH/e7jTB7v911l8/i8SS6AJYrLJiU1J7Ms
 tUjfLoEro20WS8ExgYptsz6wNjD283YxcnBICJhIdD/J62Lk4hASWMEocaPtHCOE84VRYu/j
 t1DOZ0aJ20tvMXcxcoJ1rPh7FyqxnFHi8ZH1TBDOW0aJDVta2UCqhAVCJfatPAJmiwioS0zt
 6GEDKWIGKTpx7BULSIJNwEpiYvsqRpBDeAXsJC7NDgQJswioSqzuX8UKYosKREjcP7YBzOYV
 EJQ4OfMJWCsnUPnkGTfA5jMLiEvcejKfCcKWl2jeOhvq0mXsEke/ckPYLhLTZkxngrCFJV4d
 38IOYctI/N85H+wBCYF1jBJ/O14wQzjbGSWWT/7HBlFlLXH4+EVWkEOZBTQl1u/Shwg7Svyf
 +JEZEpB8EjfeCkLcwCcxadt0qDCvREebEES1msSGZRvYYNZ27VzJPIFRaRaSz2Yh+WYWkm9m
 IexdwMiyilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzDZnP53/MsOxl1/kg4xCnAwKvHw
 HpjFHSvEmlhWXJl7iFGCg1lJhJcnhydWiDclsbIqtSg/vqg0J7X4EKM0B4uSOG81w4NoIYH0
 xJLU7NTUgtQimCwTB6dUA6PJht8tNZJ5wnsyWF9tqykUbq79Kn3EIeJn59LvHH8+1uu+2t/M
 dvnwNMlnSvcD4vamXt5+eMmHezXd286c8JVMuG1tY5ix4N8BgcKyjnaHkql1ebdjHnfwR5bP
 XMmyq1F6T3Dno/98nhxcly/xz0xiNNvH/Wtz+IrL2/nerlZYK//1VOL2gH4lluKMREMt5qLi
 RADlL8LMMgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xe7q7DvLEGnzZrGDx/8NuRosrX9+z
 Wbw5Pp3Jou3hLUaLE30fWC26Ft5gd2DzuHNtD5vH/e7jTB7v911l8/i8SS6AJUrPpii/tCRV
 ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvo20WS8ExgYptsz6w
 NjD283YxcnJICJhIrPh7l7GLkYtDSGApo8SHjt8sXYwcQAkZiePryyBqhCX+XOtiA7GFBF4z
 SnztUASxhQVCJe4/+sMEYosIqEtM7ehhA5nDLPCWUeLa129QDWeZJN5NswSx2QSsJCa2r2IE
 mc8rYCdxaXYgSJhFQFVidf8qVhBbVCBC4sz7FSwgNq+AoMTJmU/AbE6g8skzboCNZAba9Wfe
 JWYIW1zi1pP5TBC2vETz1tnMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy021CtOzC0u
 zUvXS87P3cQIjK1tx35u3sF4aWPwIUYBDkYlHt4Ds7hjhVgTy4orcw8xSnAwK4nw8uTwxArx
 piRWVqUW5ccXleakFh9iNAV6biKzlGhyPjDu80riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQn
 lqRmp6YWpBbB9DFxcEo1MCouNmnmWWzHO8HqkY/N1bPTP0VxdV4NN1nQaGScxucczMGy7b9K
 wOk3nnol5YZmmpPTGKsOyS3Ksu4U+vgiprFoWX/0oxgeh9/FP292PSxVbZPKd+PR7Z/m8yki
 4Nuv/roFnG/2NVdFnAv4USRouasqe719sNoVrsU8LZ2/lixWlrmvNOOkEktxRqKhFnNRcSIA
 0dqWSMMCAAA=
X-CMS-MailID: 20190621113834eucas1p1ef78d2bdf1a2a47ebfaa35f6f01f0bd6
X-Msg-Generator: CA
X-RootMTR: 20190611142502epcas2p35cbca6e4ef78d061a631012f0ca5d49a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190611142502epcas2p35cbca6e4ef78d061a631012f0ca5d49a
References: <20190529154635.2659-1-hdegoede@redhat.com>
 <CAKv+Gu8bLcDROFNFfqHaN1Z+EK5bnXMNDSJbBK-pCmq5XP_kBw@mail.gmail.com>
 <CAKv+Gu8w2Vj-AS-cfaB8cms+ZJ7qppS-Du_334_xm51rz0CYsA@mail.gmail.com>
 <CGME20190611142502epcas2p35cbca6e4ef78d061a631012f0ca5d49a@epcas2p3.samsung.com>
 <3065d32f-add7-4e48-164b-c248cc116cea@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561117116;
 bh=k4QCFgb0wAh369BYDvWvGGd1TbzGRKg0PrC3exSaCK4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=vI7n6hxP7UNeyiAW9WnOGPg87wPBUJyQzcJRt440kq+fISFgOZZVVOQurSBe+9xly
 8Haub+wbFNg3VqIrzHTuNBnzyVpm0CudU/4VxITH59Mwx0jLxyOj48Gz3SB8VjritD
 VddpsUjsoPDsfymPVpvgQUJQ07zQApdL2YVqrfqI=
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 Peter Jones <pjones@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTEvMTkgNDoyNCBQTSwgSGFucyBkZSBHb2VkZSB3cm90ZToKPiBIaSwKPiAKPiBPbiAx
MS0wNi0xOSAxNjowNCwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4+IE9uIE1vbiwgMTAgSnVuIDIw
MTkgYXQgMTc6MTIsIEFyZCBCaWVzaGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPiB3
cm90ZToKPj4+Cj4+PiBPbiBXZWQsIDI5IE1heSAyMDE5IGF0IDE3OjQ2LCBIYW5zIGRlIEdvZWRl
IDxoZGVnb2VkZUByZWRoYXQuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IFN0YXJ0aW5nIHdpdGggQUNQ
SSA2LjIgYml0cyAxIGFuZCAyIG9mIHRoZSBCR1JUIHN0YXR1cyBmaWVsZCBhcmUgbm8gbG9uZ2Vy
Cj4+Pj4gcmVzZXJ2ZWQuIFRoZXNlIGJpdHMgYXJlIG5vdyB1c2VkIHRvIGluZGljYXRlIGlmIHRo
ZSBpbWFnZSBuZWVkcyB0byBiZQo+Pj4+IHJvdGF0ZWQgYmVmb3JlIGJlaW5nIGRpc3BsYXllZC4K
Pj4+Pgo+Pj4+IFRoZSBlZmlmYiBjb2RlIGRvZXMgbm90IHN1cHBvcnQgcm90YXRpbmcgdGhlIGlt
YWdlIGJlZm9yZSBjb3B5aW5nIGl0IHRvCj4+Pj4gdGhlIHNjcmVlbi4KPj4+Pgo+Pj4+IFRoaXMg
Y29tbWl0IGFkZHMgYSBjaGVjayBmb3IgdGhlc2UgbmV3IGJpdHMgYW5kIGlmIHRoZXkgYXJlIHNl
dCBsZWF2ZXMgdGhlCj4+Pj4gZmIgY29udGVudHMgYXMgaXMgaW5zdGVhZCBvZiB0cnlpbmcgdG8g
dXNlIHRoZSB1bi1yb3RhdGVkIEJHUlQgaW1hZ2UuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBI
YW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+Pj4KPj4+IEFja2VkLWJ5OiBBcmQg
Qmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4KPj4+Cj4+Cj4+IEJUVyBzaG91
bGQgd2UgbWFrZSBzdXJlIHRoYXQgdGhpcyBwYXRjaCBhbmQgdGhlIGVmaS1iZ3J0IHBhdGNoIGdl
dAo+PiBtZXJnZWQgYXQgdGhlIHNhbWUgdGltZT8KPiAKPiBUaGUgMiBwYXRjaGVzIGFyZSByZWxh
dGVkIGJ1dCBtZXJnaW5nIHRoZW0gYXQgdGhlIHNhbWUgdGltZSBpcyBub3QKPiBuZWNlc3Nhcnku
Cj4gCj4+IEkgZ3Vlc3MgdGhlIG5ldCByZXN1bHQgaXMganVzdCB0aGF0IHdlIGdldAo+PiByaWQg
b2Ygc29tZSBlcnJvciBpbiB0aGUgbG9nLCBidXQgYSByb3RhdGVkIEJNUCB3aWxsIGJlIGlnbm9y
ZWQKPj4gb3RoZXJ3aXNlLgo+IAo+IFJpZ2h0LCB3b3JzZSBjYXNlIChpZiB0aGUgYm1wIGZpdHMg
cHJlLXJvdGF0aW9uKSBpdCB3aWxsIGJlIGRpc3BsYXllZAo+IHJvdGF0ZWQuIE5vdGUgb24gdGhl
IG9uZSBtYWNoaW5lIEknbSBhd2FyZSBvZiB3aGljaCB1c2VzIHRoZXNlIGJpdHMKPiB0aGUgYm1w
IGRvZXMgbm90IGZpdCBwcmUtcm90YXRpb24sIHNvIHdlIGVuZCB1cCB0cmlnZ2VyaW5nOgo+IAo+
IGVycm9yOgo+IMKgwqDCoMKgwqDCoMKgIG1lbXVubWFwKGJncnRfaW1hZ2UpOwo+IMKgwqDCoMKg
wqDCoMKgIHByX3dhcm4oImVmaWZiOiBJZ25vcmluZyBCR1JUOiB1bmV4cGVjdGVkIG9yIGludmFs
aWQgQk1QIGRhdGFcbiIpOwo+IH0KPiAKPiBXaGljaCB0aGlzIHBhdGNoIHJlcGxhY2VzIHdpdGgg
aGl0dGluZzoKPiAKPiDCoMKgwqDCoMKgwqDCoCBpZiAoYmdydF90YWIuc3RhdHVzICYgMHgwNikg
ewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl9pbmZvKCJlZmlmYjogQkdSVCBy
b3RhdGlvbiBiaXRzIHNldCwgbm90IHNob3dpbmcgYm9vdCBncmFwaGljc1xuIik7Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPiDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4g
SW5zdGVhZC4gU28gYXQgbGVhc3Qgb24gdGhlIG9uZSBtYWNoaW5lIEkga25vdyBvZiB0aGlzIGlz
IDk5JSBjb3NtZXRpYy4KPiAKPj4gT3IgaXMgaXQgcmVsZXZhbnQgZm9yIHVzZXJsYW5kIGluIHNv
bWUgb3RoZXIgd2F5Pwo+IAo+IE5vLgo+IAo+IFJlZ2FyZHMsCj4gCj4gSGFucwoKUGF0Y2ggcXVl
dWVkIGZvciB2NS4zLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmll
cmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
