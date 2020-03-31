Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E085198BAA
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 07:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850036E249;
	Tue, 31 Mar 2020 05:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACB46E249
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 05:25:57 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200331052555euoutp017f552eaac7958270862046846d9a4881~BTDn4fBri1521215212euoutp01B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 05:25:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200331052555euoutp017f552eaac7958270862046846d9a4881~BTDn4fBri1521215212euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585632355;
 bh=bxin13ZKuOM8u8O8i3qTxcRZcgLrefdmNLGj7iJHNdY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=kHHex9Xf3yjMXTEGVMqVtWhm1bOcMYTTTPDoAtX8eqeSpGELjfUvnuYo4nOQLikEH
 gzPDl9uSyMSPaYCwwaEVn37GzjP4d7k4xuCKLz+b90jCYPsvdJbm/jCdKxDyKFA9Z7
 IGIJA4hjo+GdBFeemud8CwWosA4NQQZrzJCcS+xY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200331052555eucas1p11806bcd25402c052d63b6bd00e87771d~BTDntTJcq2193321933eucas1p1W;
 Tue, 31 Mar 2020 05:25:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 3C.96.61286.364D28E5; Tue, 31
 Mar 2020 06:25:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200331052555eucas1p28e4c454f5fcd33457798f6d4b85220d1~BTDnVY7rC2534025340eucas1p2K;
 Tue, 31 Mar 2020 05:25:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200331052555eusmtrp1ba37869771f488e7696c1ccc827b8c1a~BTDnUsVzN0739607396eusmtrp18;
 Tue, 31 Mar 2020 05:25:55 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-ee-5e82d46348e1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D0.07.08375.264D28E5; Tue, 31
 Mar 2020 06:25:55 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200331052554eusmtip2467d68d39da6150963074cae38eafd67~BTDm1pL_L0092300923eusmtip2g;
 Tue, 31 Mar 2020 05:25:54 +0000 (GMT)
Subject: Re: [v4,1/3] drm/prime: use dma length macro when mapping sg
To: Alex Deucher <alexdeucher@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <3a0cb2bc-84be-6f9f-a0e8-ecb653026301@samsung.com>
Date: Tue, 31 Mar 2020 07:25:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_O6pwxJsYdfJO0xZtmER05GtO+2-4uHTeexKNeHyUq8_Q@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7djP87rJV5riDM63SFv0njvJZDHtzm5W
 izt/ZrFbrPt3k8WicWcfk8Xb+0CxK1/fs1lc3jWHzYHDo/XSXzaPnbPusnts//aA1eN+93Em
 j8+b5AJYo7hsUlJzMstSi/TtErgyDs7ayF6wQbhi8f9nzA2MR/i7GDk4JARMJO6v8eli5OIQ
 EljBKLG8/zELhPOFUWL1vW+sEM5nRoneXx+Yuxg5wTpe/13NBpFYzihx6Xw3lPOeUeLt7wXs
 IFXCAq4SO5taGUF2iAhoSKz/AraDWeAMk8S1Q5PBatgEDCW63naxgdi8AnYS02Y+BouzCKhK
 tDcuA7NFBWIkLh7uZ4WoEZQ4OfMJC4jNKRAo8fPLGrA4s4C8RPPW2cwQtrjErSfzmUCWSQhs
 Y5c492wmI8TZLhJ7/m5lgrCFJV4d38IOYctInJ7cwwLR0Mwo8fDcWnYIp4dR4nLTDKhua4k7
 536xgbzDLKApsX6XPkTYUeLZlZPMkJDkk7jxVhDiCD6JSdumQ4V5JTrahCCq1SRmHV8Ht/bg
 hUvMExiVZiF5bRaSd2YheWcWwt4FjCyrGMVTS4tz01OLDfNSy/WKE3OLS/PS9ZLzczcxAtPR
 6X/HP+1g/Hop6RCjAAejEg/vg6uNcUKsiWXFlbmHGCU4mJVEeNn8G+KEeFMSK6tSi/Lji0pz
 UosPMUpzsCiJ8xovehkrJJCeWJKanZpakFoEk2Xi4JRqYFy3L/HQrG2/psts9d1z0yCnojJv
 8id9z+jV/xdWvnf7c4P5v2fFsxcnX17cJvCpc0rBxe7nqTmvThjv+9zNWB1n/uXE/82hH3du
 ZLHhCfzHH1vV1tgkz8uZ/+HBGYl/3gbmi0STm+JObvmWfVoo8uWR9hPfk1YdtG2rniJydPK2
 1pne3T+reVyVWIozEg21mIuKEwE8FmXOQwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xe7rJV5riDK4/ZbToPXeSyWLand2s
 Fnf+zGK3WPfvJotF484+Jou394FiV76+Z7O4vGsOmwOHR+ulv2weO2fdZffY/u0Bq8f97uNM
 Hp83yQWwRunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunb
 JehlHJy1kb1gg3DF4v/PmBsYj/B3MXJySAiYSLz+u5qti5GLQ0hgKaPEl+Z7bBAJGYmT0xpY
 IWxhiT/XuqCK3jJKPDjzlQUkISzgKrGzqZWxi5GDQ0RAQ2L9Fx+QGmaBc0wS965tY4aayizx
 sm0H2FQ2AUOJrrddYDavgJ3EtJmP2UFsFgFVifbGZWC2qECMxM89XSwQNYISJ2c+AbM5BQIl
 fn5ZA3YRs4CZxLzND5khbHmJ5q2zoWxxiVtP5jNNYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0
 ODc9t9hQrzgxt7g0L10vOT93EyMwArcd+7l5B+OljcGHGAU4GJV4eB9cbYwTYk0sK67MPcQo
 wcGsJMLL5t8QJ8SbklhZlVqUH19UmpNafIjRFOi5icxSosn5wOSQVxJvaGpobmFpaG5sbmxm
 oSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBkTfUfX/TWvPoY6EfXvDy7/4Q5nrM8q7TDt4f
 OgedD3NyN+sE3H14V9hVNfvprINN1s6vjeaLTp9ic/RXrKbSV/twQZH6ekV11Y0/tN0VSwpZ
 JRMOF6ycc8F5uUXepMLut4euF4j8ytkvEH//g7av7tzIxILmEmY371mr/j2Tkr5tmLQhVsRc
 iaU4I9FQi7moOBEAjHl1W9YCAAA=
X-CMS-MailID: 20200331052555eucas1p28e4c454f5fcd33457798f6d4b85220d1
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
 <bba81019-d585-d950-ecd0-c0bf36a2f58d@samsung.com>
 <CADnq5_O6pwxJsYdfJO0xZtmER05GtO+2-4uHTeexKNeHyUq8_Q@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Shane Francis <bigbeeshane@gmail.com>, amd-gfx-request@lists.freedesktop.org,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleCwKCk9uIDIwMjAtMDMtMzAgMTU6MjMsIEFsZXggRGV1Y2hlciB3cm90ZToKPiBPbiBN
b24sIE1hciAzMCwgMjAyMCBhdCA0OjE4IEFNIE1hcmVrIFN6eXByb3dza2kKPiA8bS5zenlwcm93
c2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPj4gSGkKPj4KPj4gT24gMjAyMC0wMy0yNyAxMDoxMCwg
TWFyZWsgU3p5cHJvd3NraSB3cm90ZToKPj4+IEhpIENocmlzdGlhbiwKPj4+Cj4+PiBPbiAyMDIw
LTAzLTI3IDA5OjExLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IEFtIDI3LjAzLjIwIHVt
IDA4OjU0IHNjaHJpZWIgTWFyZWsgU3p5cHJvd3NraToKPj4+Pj4gT24gMjAyMC0wMy0yNSAxMDow
NywgU2hhbmUgRnJhbmNpcyB3cm90ZToKPj4+Pj4+IEFzIGRtYV9tYXBfc2cgY2FuIHJlb3JnYW5p
emUgc2NhdHRlci1nYXRoZXIgbGlzdHMgaW4gYQo+Pj4+Pj4gd2F5IHRoYXQgY2FuIGNhdXNlIHNv
bWUgbGF0ZXIgc2VnbWVudHMgdG8gYmUgZW1wdHkgd2Ugc2hvdWxkCj4+Pj4+PiBhbHdheXMgdXNl
IHRoZSBzZ19kbWFfbGVuIG1hY3JvIHRvIGZldGNoIHRoZSBhY3R1YWwgbGVuZ3RoLgo+Pj4+Pj4K
Pj4+Pj4+IFRoaXMgY291bGQgbm93IGJlIDAgYW5kIG5vdCBuZWVkIHRvIGJlIG1hcHBlZCB0byBh
IHBhZ2Ugb3IKPj4+Pj4+IGFkZHJlc3MgYXJyYXkKPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBTaGFuZSBGcmFuY2lzIDxiaWdiZWVzaGFuZUBnbWFpbC5jb20+Cj4+Pj4+PiBSZXZpZXdlZC1i
eTogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+Cj4+Pj4+IFRoaXMg
cGF0Y2ggbGFuZGVkIGluIGxpbnV4LW5leHQgMjAyMDAzMjYgYW5kIGl0IGNhdXNlcyBhIGtlcm5l
bAo+Pj4+PiBwYW5pYyBvbgo+Pj4+PiB2YXJpb3VzIEV4eW5vcyBTb0MgYmFzZWQgYm9hcmRzLgo+
Pj4+Pj4gLS0tCj4+Pj4+PiAgICAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgMiArLQo+
Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPj4+Pj4+IGluZGV4IDg2ZDliMGU0NWM4Yy4uMWRl
MmNkZTIyNzdjIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5j
Cj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPj4+Pj4+IEBAIC05Njcs
NyArOTY3LDcgQEAgaW50IGRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHN0cnVjdAo+
Pj4+Pj4gc2dfdGFibGUgKnNndCwgc3RydWN0IHBhZ2UgKipwYWdlcywKPj4+Pj4+ICAgICAgICAg
ICAgaW5kZXggPSAwOwo+Pj4+Pj4gICAgICAgICBmb3JfZWFjaF9zZyhzZ3QtPnNnbCwgc2csIHNn
dC0+bmVudHMsIGNvdW50KSB7Cj4+Pj4+PiAtICAgICAgICBsZW4gPSBzZy0+bGVuZ3RoOwo+Pj4+
Pj4gKyAgICAgICAgbGVuID0gc2dfZG1hX2xlbihzZyk7Cj4+Pj4+PiAgICAgICAgICAgICBwYWdl
ID0gc2dfcGFnZShzZyk7Cj4+Pj4+PiAgICAgICAgICAgICBhZGRyID0gc2dfZG1hX2FkZHJlc3Mo
c2cpOwo+Pj4+PiBTb3JyeSwgYnV0IHRoaXMgY29kZSBpcyB3cm9uZyA6KAo+Pj4+IFdlbGwgaXQg
aXMgYXQgbGVhc3QgYmV0dGVyIHRoYW4gYmVmb3JlIGJlY2F1c2UgaXQgbWFrZXMgbW9zdCBkcml2
ZXJzCj4+Pj4gd29yayBjb3JyZWN0bHkgYWdhaW4uCj4+PiBXZWxsLCBJJ20gbm90IHN1cmUgdGhh
dCBhIGhhbGYtYnJva2VuIGZpeCBzaG91bGQgYmUgY29uc2lkZXJlZCBhcyBhCj4+PiBmaXggOykK
Pj4+Cj4+PiBBbnl3YXksIEkganVzdCBnb3QgdGhlIGNvbW1lbnQgZnJvbSBTaGFuZSwgdGhhdCBt
eSBwYXRjaCBpcyBmaXhpbmcgdGhlCj4+PiBpc3N1ZXMgd2l0aCBhbWRncHUgYW5kIHJhZGVvbiwg
d2hpbGUgc3RpbGwgd29ya2luZyBmaW5lIGZvciBleHlub3MsIHNvCj4+PiBpdCBpcyBpbmRlZWQg
YSBwcm9wZXIgZml4Lgo+PiBUb2RheSBJJ3ZlIG5vdGljZWQgdGhhdCB0aGlzIHBhdGNoIHdlbnQg
dG8gZmluYWwgdjUuNiB3aXRob3V0IGV2ZW4gYSBkYXkKPj4gb2YgdGVzdGluZyBpbiBsaW51eC1u
ZXh0LCBzbyB2NS42IGlzIGJyb2tlbiBvbiBFeHlub3MgYW5kIHByb2JhYmx5IGEgZmV3Cj4+IG90
aGVyIEFSTSBhcmNocywgd2hpY2ggcmVseSBvbiB0aGUgZHJtX3ByaW1lX3NnX3RvX3BhZ2VfYWRk
cl9hcnJheXMKPj4gZnVuY3Rpb24uCj4gUGxlYXNlIGNvbW1pdCB5b3VyIHBhdGNoIGFuZCBjYyBz
dGFibGUuCgpJJ3ZlIGFscmVhZHkgZGlkIHRoYXQ6IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIw
LzMvMjcvNTU1CgpCZXN0IHJlZ2FyZHMKLS0gCk1hcmVrIFN6eXByb3dza2ksIFBoRApTYW1zdW5n
IFImRCBJbnN0aXR1dGUgUG9sYW5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
