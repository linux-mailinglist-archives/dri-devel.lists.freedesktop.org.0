Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3660C5F82D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 14:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD94B6E33D;
	Thu,  4 Jul 2019 12:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A116B6E33D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 12:33:40 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190704123339euoutp02c5a7cf6436099102a14fe055c382b76b~uNEtlUHyV1753717537euoutp02L
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 12:33:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190704123339euoutp02c5a7cf6436099102a14fe055c382b76b~uNEtlUHyV1753717537euoutp02L
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190704123338eucas1p10d40920fbdb0b1427562f7df660946c3~uNEs9Mane2422424224eucas1p1O;
 Thu,  4 Jul 2019 12:33:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 12.0F.04377.222FD1D5; Thu,  4
 Jul 2019 13:33:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190704123337eucas1p1514a97326732843cca28573659266158~uNEsNoJmH2133121331eucas1p1c;
 Thu,  4 Jul 2019 12:33:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190704123337eusmtrp1e0080ccb381db80ebe5f8beaca270666~uNEr-Y2G91415714157eusmtrp1B;
 Thu,  4 Jul 2019 12:33:37 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-60-5d1df222b385
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7E.28.04146.122FD1D5; Thu,  4
 Jul 2019 13:33:37 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190704123337eusmtip2c0b915691796defb198fd7bfae90e363~uNErkqYkS1170411704eusmtip2E;
 Thu,  4 Jul 2019 12:33:36 +0000 (GMT)
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: correct dsi mode_flags
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Rob Clark <robdclark@gmail.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <dcb2b28d-38d9-255d-e91f-05e6e713aee0@samsung.com>
Date: Thu, 4 Jul 2019 14:33:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAOCk7Nq91abTQ02dUNY=8_mgY_kuwU4MFxdO71AjWz1nwUkBGA@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEKsWRmVeSWpSXmKPExsWy7djPc7pKn2RjDS418Fn0njvJZPF/20Rm
 iytf37NZtC3/xmzROXEJu8XE/WfZLS7vmsNmce3nY2aL5wt/MFvc3XCW0YHLY3bDRRaPvd8W
 sHjsnHWX3WN2x0xWj+3fHrB63O8+zuTxeZNcAHsUl01Kak5mWWqRvl0CV0brjilsBRO4KiZe
 2c7cwPiHvYuRk0NCwERi1dEdjF2MXBxCAisYJSYv+s8C4XxhlLjW28AO4XxmlFi15TNcy+Vz
 PawgtpDAckaJlceDIYreMkqc+n+cDSQhLOApsebaMkYQW0TAR2Ld/mXMIDazwBUmiaX3bEFs
 NgFNib+bb4LV8wrYSXTsmsACYrMIqEh8WrAerFdUIELi8pZdjBA1ghInZz4Bq+EUCJRou78C
 aqa8RPPW2VC2uMStJ/OZQA6SELjELrHiQjsLxNUuEn1XHrJC2MISr45vgfpGRuL05B6omnqJ
 +ytamCGaOxgltm7YyQyRsJY4fPwiUDMH0AZNifW79EFMCQFHiZfT/SFMPokbbwUhTuCTmLRt
 OjNEmFeio00IYoaixP2zW6HmiUssvfCVbQKj0iwkj81C8swsJM/MQli7gJFlFaN4amlxbnpq
 sVFearlecWJucWleul5yfu4mRmDKOv3v+JcdjLv+JB1iFOBgVOLhfbBFJlaINbGsuDL3EKME
 B7OSCO/330Ah3pTEyqrUovz4otKc1OJDjNIcLErivNUMD6KFBNITS1KzU1MLUotgskwcnFIN
 jF6ar5X7L+vI3krJCJEvefCvR3T7b77k0IPVp35u2/j35LJJfw2U5Zof3pf55f9u9t540T8O
 q07cW75K4+Gc45veHPP9NsFuoWHXotWvvC2tSzjtEjichPOVb53R6Hpwfv2CpTMff/7X831G
 V7WhXGgvy8qAW5EHWNeWbBERMFbjWMBcrLAuIlSJpTgj0VCLuag4EQCHbv8iVQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRmVeSWpSXmKPExsVy+t/xe7qKn2RjDXZ0S1v0njvJZPF/20Rm
 iytf37NZtC3/xmzROXEJu8XE/WfZLS7vmsNmce3nY2aL5wt/MFvc3XCW0YHLY3bDRRaPvd8W
 sHjsnHWX3WN2x0xWj+3fHrB63O8+zuTxeZNcAHuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
 iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXkbrjilsBRO4KiZe2c7cwPiHvYuRk0NCwETi8rke
 1i5GLg4hgaWMEpc+fYBKiEvsnv+WGcIWlvhzrYsNoug1o0TvzStgRcICnhJrri1jBLFFBHwk
 1u1fxgxSxCxwjUni3/yPTCAJIYEJzBLflyaA2GwCmhJ/N99kA7F5BewkOnZNYAGxWQRUJD4t
 WA82SFQgQqKvbTZUjaDEyZlPwGo4BQIl2u6vALuIWUBd4s+8S1C2vETz1tlQtrjErSfzmSYw
 Cs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERip24793LyD8dLG
 4EOMAhyMSjy8D7bIxAqxJpYVV+YeYpTgYFYS4f3+GyjEm5JYWZValB9fVJqTWnyI0RTouYnM
 UqLJ+cAkklcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgbGhcqVn
 7nWXCQYsgiVz1rqrmXzOy0y7vV+z/7XWQaml8dmp999nmW2uDWdkizWKN6w0Mj1kdF0xQ8rh
 cONJla8GkUYTGphM73hp3WStXVTibZcV3Nk8L49lwauzRg+5dcJSevf8cL4jeXf7Qtn/+rWc
 92773GLXFvdYUfEm9ILk59rv8gePKrEUZyQaajEXFScCAHzz3sfqAgAA
X-CMS-MailID: 20190704123337eucas1p1514a97326732843cca28573659266158
X-Msg-Generator: CA
X-RootMTR: 20190702172346epcas1p29ebecfac70d87abb5379f00cdd1a913a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190702172346epcas1p29ebecfac70d87abb5379f00cdd1a913a
References: <20190702154419.20812-1-robdclark@gmail.com>
 <20190702154419.20812-4-robdclark@gmail.com>
 <CAOCk7NrXko8xR1Ovg6HrP2ZpS83mjZoOWdae-mq_QJMRzeENLQ@mail.gmail.com>
 <CAF6AEGsUve1NnzF2kEeW0jwgXnxZTgFaHbq-c-+CKru1jS9tWg@mail.gmail.com>
 <CGME20190702172346epcas1p29ebecfac70d87abb5379f00cdd1a913a@epcas1p2.samsung.com>
 <CAOCk7Nq91abTQ02dUNY=8_mgY_kuwU4MFxdO71AjWz1nwUkBGA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562243619;
 bh=mYLCby5nlISaQhXXuJdUjXravGum4plveihG8QiRIG4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=imINaO/461IxCKbNTOJOzm9Xdv5whpFZyVnsuC1B0lK+MvJrA25yW1SfP78VtQRtv
 Nyf6m0/jwJYZjiSjN//7HUT/aXGHPzt97tvaxPTYjNO8XYayzuP+jco9tfJL0dGEVP
 8Cjw3n13J/Te9elmM7ZIsT9nN/Kpcz7yky7chRPg=
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDIuMDcuMjAxOSAxOToyMywgSmVmZnJleSBIdWdvIHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDIs
IDIwMTkgYXQgMTE6MTIgQU0gUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPiB3cm90ZToK
Pj4gT24gVHVlLCBKdWwgMiwgMjAxOSBhdCAxMDowOSBBTSBKZWZmcmV5IEh1Z28gPGplZmZyZXku
bC5odWdvQGdtYWlsLmNvbT4gd3JvdGU6Cj4+PiBPbiBUdWUsIEp1bCAyLCAyMDE5IGF0IDk6NDYg
QU0gUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPiB3cm90ZToKPj4+PiAtICAgICAgIGRz
aS0+bW9kZV9mbGFncyA9IE1JUElfRFNJX01PREVfVklERU8gfCBNSVBJX0RTSV9NT0RFX1ZJREVP
X1NZTkNfUFVMU0UgfAo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgTUlQSV9EU0lfTU9E
RV9FT1RfUEFDS0VUIHwgTUlQSV9EU0lfTU9ERV9WSURFT19IU0U7Cj4+Pj4gKyAgICAgICBkc2kt
Pm1vZGVfZmxhZ3MgPSBNSVBJX0RTSV9NT0RFX1ZJREVPOwo+Pj4gRGlkIHlvdSBjaGVjayB0aGlz
IGFnYWluc3QgdGhlIGRhdGFzaGVldD8gIFBlciBteSByZWFkaW5nLCBFT1RfUEFDS0VUCj4+PiBh
bmQgVklERU9fSFNFIGFwcGVhciB2YWxpZC4gIEkgZG9uJ3Qga25vdyBhYm91dCBWSURFT19TWU5D
X1BVTFNFLgo+PiBUaGUgRU9UIGZsYXQgaXMgYmFkbHkgbmFtZWQ6Cj4+Cj4+IC8qIGRpc2FibGUg
RW9UIHBhY2tldHMgaW4gSFMgbW9kZSAqLwo+PiAjZGVmaW5lIE1JUElfRFNJX01PREVfRU9UX1BB
Q0tFVCAgICBCSVQoOSkKPj4KPj4gSSBjYW4gZG91YmxlIGNoZWNrIG91dCBIU0UsIGJ1dCB0aGlz
IHdhcyBvbmUgb2YgdGhlIHNldHRpbmcKPj4gZGlmZmVyZW5jZXMgYmV0d2VlbiBib290bG9hZGVy
IGFuZCBrZXJuZWwKPiBBaCB5ZWFoLCB5b3UgYXJlIHJpZ2h0LiAgTXkgZXllcyBhcHBhcmVudGx5
IHNraXBwZWQgb3ZlciB0aGUgImRpc2FibGUiLgo+Cj4gSWYgdGhlIGJvb3Rsb2FkZXIgaXMgbm90
IHNldHRpbmcgdGhlIEhTRSwgdGhlbiBJIGNhbid0IHRoaW5rIG9mIGEKPiByZWFzb24gd2h5IHdl
IHdvdWxkIGJlIGhhdmluZyBhbiBpc3N1ZSBhbHNvIG5vdCBzZXR0aW5nIGl0Lgo+Cj4gU2VlbXMg
Z29vZCB0byBtZQo+Cj4gUmV2aWV3ZWQtYnk6IEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1Z29A
Z21haWwuY29tPgo+Cj4KWWVzLCB0aGUgZmxhZ3MgcmVxdWlyZSBjbGVhbnVwLgoKUmV2aWV3ZWQt
Ynk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJlZ2FyZHMKQW5k
cnplagoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
