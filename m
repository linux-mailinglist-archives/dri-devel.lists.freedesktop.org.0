Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4361236E27
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 10:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B9689804;
	Thu,  6 Jun 2019 08:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C01B897E4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 08:08:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190606080822euoutp01c236d13565783130529e7d232212d25b~ljZG5rKgF0569805698euoutp01a
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 08:08:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190606080822euoutp01c236d13565783130529e7d232212d25b~ljZG5rKgF0569805698euoutp01a
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190606080822eucas1p1432240c660a37266918c666787721582~ljZGPoVAq1908319083eucas1p1D;
 Thu,  6 Jun 2019 08:08:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 85.32.04298.5F9C8FC5; Thu,  6
 Jun 2019 09:08:21 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190606080821eucas1p2cbab58ec759edf9a4f8254fe46ee1289~ljZFSHpTj2100821008eucas1p2D;
 Thu,  6 Jun 2019 08:08:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190606080820eusmtrp22d482888c6fc3ed84794be49eb99e983~ljZFCjFib0559905599eusmtrp2M;
 Thu,  6 Jun 2019 08:08:20 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-38-5cf8c9f52db4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B9.A2.04140.4F9C8FC5; Thu,  6
 Jun 2019 09:08:20 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190606080819eusmtip2fc6bdfc496506998a20b632dad1af733~ljZD1KUff2890928909eusmtip2N;
 Thu,  6 Jun 2019 08:08:19 +0000 (GMT)
Subject: Re: [PATCH v3 03/15] drm/bridge: tc358767: Simplify polling in
 tc_link_training()
To: Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <3c50e3e2-9fb8-6962-9988-32d14aa429b0@samsung.com>
Date: Thu, 6 Jun 2019 10:08:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605070507.11417-4-andrew.smirnov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH/d3X7rTJdRoeLJRGBUn5iKAbmWQlXDJKCCpyUUuvVuqM3dQs
 KFHTaZaPsHC6jNDyEfnKcmJZU1oilqmVD0wRS6zMUlcaTXO7Sv73Oef7/Z1zvvCjcXkn6Uaf
 Vp/jNWpVlIKyJx6/nH2zydw6o/SZ1m9lk7U72CRjIskmacdJdqa7mWBfNJowtts8QbFD+l6M
 Tc8plrBdDYUUO/DxFcFWFvVROx24ruvXMG4obx7jDLoBCVegzSe5wasmjMuy+HCmnicYN1Xj
 zr3Oa8eCpUft/cL4qNNxvMbb/4T9qYm/KeTZWeZ8S/8rPBGNyDKQlAZmC3xLKcQykD0tZ0oR
 3BgdocRiGoEldX6xmELQmPmRXHrytjJHIgr3Ebz5k0WKxTiCwrJ5zOpyZpRw+0GKjV2YYJhM
 MthG4YwZg+edOTaBYjaApbaXsrKM8Yfu1q+4lQlmLTxK00usvJI5AoMvq0jR4wSt+SOElaUL
 /uKbFbY5OOMByXUFuMiu0DdSZEsEzLgEtB9yCfHuPTBW20GJ7AxfTI8kIq+GeUMRJvJlGCxN
 wcXHWgR1VQZcFLZDs+ntwhX0woYNUNngLbYDoKdxBrO2gXGEnnEn8QZHyH18CxfbMtCmykX3
 Ghhsr1sc6AolHWYqGyl0y5LplqXRLUuj+7/3DiLKkSsfK0RH8IKvmo/3ElTRQqw6wis0JroG
 Lfy0tjnTZD0yd540IoZGihUyqP6tlJOqOCEh2oiAxhUuMlX/tFIuC1MlXOA1Mcc1sVG8YESr
 aELhKrtoNxQiZyJU5/hInj/La5ZUjJa6JaIk+FmurmjSrT+TPlq461fc3PZ9CY4ebetKq70J
 y6FA9VhkWvj6wL0d4K7MbJvWtulqw0Pkx8I8mw/M7P4s7fmRfTc0K22YvfLhcFS8A2ac3SbU
 f08vnrAQfvtrvTYPB4zZPX32KeheS9hYZPm79w8P+sXpm+yCDCWXNvaVzbZ/DlIQwimVryeu
 EVT/AKvm/6xlAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xe7pfTv6IMTg3zdSiucPWoulQA6tF
 U8dbVosfVw6zWBzcc5zJ4srX92wWD+beZLLonLiE3eLyrjlsFnfvnWCxWD//FpsDt8flvl4m
 jwdT/zN57Jx1l91jdsdMVo/73ceZPPr/Gngcv7GdyePzJjmPc1PPMgVwRunZFOWXlqQqZOQX
 l9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlvP/TwlrwU6DiyO0TzA2M
 T3i7GDk5JARMJC6un8jexcjFISSwlFFi5/yvrBAJcYnd898yQ9jCEn+udbGB2EICrxkl2no0
 QGxhgRiJeWtamEBsEQE/ia55B5hABjELfGeSmLh8LwvE1KOMEhfOrmEEqWIT0JT4u/km2CRe
 ATuJKydfg21gEVCR2NI+lx3EFhWIkDjzfgULRI2gxMmZT8BsTqD6JdNWg21jFlCX+DPvEjOE
 LS/RvHU2lC0ucevJfKYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvpFSfmFpfmpesl
 5+duYgTG8LZjP7fsYOx6F3yIUYCDUYmHV2Lj9xgh1sSy4srcQ4wSHMxKIryJt7/ECPGmJFZW
 pRblxxeV5qQWH2I0BXpuIrOUaHI+ML3klcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1O
 TS1ILYLpY+LglGpgXFS/dINlzEXz47P/Wy2bGuG+5YTn2fAzr7Qrn3cwatfUPzuZ23HBuC5r
 0zzF1unbBfY1fglYOv1/8OS2YN1zlW4ebbM4BCYejlvoZrVz5efJl5RVVBg/6r1s2yrDsqdn
 d0tu9dt8nezAlOy2y+FTQywrz5lZ2oq8rW47u32OK2P4gb/8P8y/KrEUZyQaajEXFScCAKTo
 M9P3AgAA
X-CMS-MailID: 20190606080821eucas1p2cbab58ec759edf9a4f8254fe46ee1289
X-Msg-Generator: CA
X-RootMTR: 20190605070528epcas1p1d9b1d1b09ffaafa511936ed3ded29097
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190605070528epcas1p1d9b1d1b09ffaafa511936ed3ded29097
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
 <CGME20190605070528epcas1p1d9b1d1b09ffaafa511936ed3ded29097@epcas1p1.samsung.com>
 <20190605070507.11417-4-andrew.smirnov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559808503;
 bh=c/gerDQkcKR8doaPOF0H2AdLIDtd5igL1h7NJQn+Cg4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=JuqzY1c5ncxoHFrWEZGP41Ka6uDPwslGI3Wl10FncruPZThIErCR8D+wXCmrefd6r
 l8ANAV5b1oNcPryHuAJKKHFAksV9cd0oEsn48x10JiUiNziBDJEa64jNL1Zwkqe8Ls
 HJdSaFKb8JhBS2AhBAeHF0BnA1UkpSK2ja028/GM=
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUuMDYuMjAxOSAwOTowNCwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gUmVwbGFjZSBleHBs
aWNpdCBwb2xsaW5nIGluIHRjX2xpbmtfdHJhaW5pbmcoKSB3aXRoIGVxdWl2YWxlbnQgY2FsbCB0
bwo+IHRjX3BvbGxfdGltZW91dCgpIGZvciBzaW1wbGljaXR5LiBObyBmdW5jdGlvbmFsIGNoYW5n
ZSBpbnRlbmRlZCAobm90Cj4gaW5jbHVkaW5nIHNsaWdodGx5IGFsdGVyZWQgZGVidWcgb3V0cHV0
KS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBTbWlybm92IDxhbmRyZXcuc21pcm5vdkBnbWFp
bC5jb20+Cj4gQ2M6IEFyY2hpdCBUYW5lamEgPGFyY2hpdHRAY29kZWF1cm9yYS5vcmc+Cj4gQ2M6
IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gQ2M6IExhdXJlbnQgUGluY2hh
cnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogVG9taSBWYWxrZWlu
ZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPiBDYzogQW5kcmV5IEd1c2Frb3YgPGFuZHJleS5n
dXNha292QGNvZ2VudGVtYmVkZGVkLmNvbT4KPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBw
ZW5ndXRyb25peC5kZT4KPiBDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KPiBD
YzogQ2hyaXMgSGVhbHkgPGNwaGVhbHlAZ21haWwuY29tPgo+IENjOiBMdWNhcyBTdGFjaCA8bC5z
dGFjaEBwZW5ndXRyb25peC5kZT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDE1ICsrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGMzNTg3NjcuYwo+IGluZGV4IDVlMWU3M2E5MTY5Ni4uMTE1Y2ZmYzU1YTk2IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+IEBAIC03NDgsMjIgKzc0OCwxOSBAQCBzdGF0aWMgaW50
IHRjX3NldF92aWRlb19tb2RlKHN0cnVjdCB0Y19kYXRhICp0YywKPiAgCj4gIHN0YXRpYyBpbnQg
dGNfd2FpdF9saW5rX3RyYWluaW5nKHN0cnVjdCB0Y19kYXRhICp0YykKPiAgewo+IC0JdTMyIHRp
bWVvdXQgPSAxMDAwOwo+ICAJdTMyIHZhbHVlOwo+ICAJaW50IHJldDsKPiAgCj4gLQlkbyB7Cj4g
LQkJdWRlbGF5KDEpOwo+IC0JCXRjX3JlYWQoRFAwX0xUU1RBVCwgJnZhbHVlKTsKPiAtCX0gd2hp
bGUgKCghKHZhbHVlICYgTFRfTE9PUERPTkUpKSAmJiAoLS10aW1lb3V0KSk7Cj4gLQo+IC0JaWYg
KHRpbWVvdXQgPT0gMCkgewo+ICsJcmV0ID0gdGNfcG9sbF90aW1lb3V0KHRjLCBEUDBfTFRTVEFU
LCBMVF9MT09QRE9ORSwKPiArCQkJICAgICAgTFRfTE9PUERPTkUsIDEsIDEwMDApOwo+ICsJaWYg
KHJldCkgewo+ICAJCWRldl9lcnIodGMtPmRldiwgIkxpbmsgdHJhaW5pbmcgdGltZW91dCB3YWl0
aW5nIGZvciBMVF9MT09QRE9ORSFcbiIpOwo+IC0JCXJldHVybiAtRVRJTUVET1VUOwo+ICsJCXJl
dHVybiByZXQ7Cj4gIAl9CgoKSW5jb25zaXN0ZW50IGNvZGluZywgaW4gcHJldmlvdXMgcGF0Y2gg
eW91IGNoZWNrIChyZXQgPT0gLUVUSU1FRE9VVCkgYnV0Cm5vdCBoZXJlLiBUbyBzaW1wbGlmeSB0
aGUgY29kZSB5b3UgY2FuIGFzc3VtZSB0aGF0IHRjX3BvbGxfdGltZW91dCA8IDAsCm1lYW5zIHRp
bWVvdXQsIGluIHN1Y2ggY2FzZSBwbGVhc2UgYWRqdXN0IHByZXZpb3VzIHBhdGNoLgoKCkJlc2lk
ZSB0aGlzOgoKUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+
CgrCoC0tClJlZ2FyZHMKQW5kcnplagoKCj4gIAo+IC0JcmV0dXJuICh2YWx1ZSA+PiA4KSAmIDB4
NzsKPiArCXRjX3JlYWQoRFAwX0xUU1RBVCwgJnZhbHVlKTsKPiAgCj4gKwlyZXR1cm4gKHZhbHVl
ID4+IDgpICYgMHg3Owo+ICBlcnI6Cj4gIAlyZXR1cm4gcmV0Owo+ICB9CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
