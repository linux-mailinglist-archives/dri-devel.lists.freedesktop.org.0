Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 241EB14B2D9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 11:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EAE6ED9B;
	Tue, 28 Jan 2020 10:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008E16ED9B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 10:39:44 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200128103942euoutp0235393f099008f5972ba5b18a63ef73e2~uBsnDTLSe0859508595euoutp02H
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 10:39:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200128103942euoutp0235393f099008f5972ba5b18a63ef73e2~uBsnDTLSe0859508595euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1580207982;
 bh=tLFoHIPgSkkwaC9523JIOG9Zwm6yzcE+AZf3R0LyCrs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=HIvZ4SLHTtLOG8ipcJqDUqUzSpMpVB003TivvcKc2bC0Gy3RRANj+l0CpXTHaPf1U
 y1tTT4IMytkCs/Th+OcAJ98mWj9lofW5/el7ACWaOTvKbA1uxeXvkj1Lbrj4SVBCQP
 TtBfZw11BABJZLUI3GSHpvnAHAiV+1WMVDoakql8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200128103942eucas1p2974e6cb55c10fe63f749c16f75622db6~uBsm9gPnS1611516115eucas1p2j;
 Tue, 28 Jan 2020 10:39:42 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 67.CF.60698.E6F003E5; Tue, 28
 Jan 2020 10:39:42 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200128103942eucas1p17b65ba90e69efb4707273dc8a738e53d~uBsmgamJG1052910529eucas1p1c;
 Tue, 28 Jan 2020 10:39:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200128103942eusmtrp1d76a05ce18770e11b25873b26bf0b200~uBsmf1i0R0068000680eusmtrp1E;
 Tue, 28 Jan 2020 10:39:42 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-60-5e300f6e653b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id FE.89.07950.E6F003E5; Tue, 28
 Jan 2020 10:39:42 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200128103941eusmtip1af49ed1d07126a66c366f4d3d2bdd6f3~uBsmMas0B2822028220eusmtip1d;
 Tue, 28 Jan 2020 10:39:41 +0000 (GMT)
Subject: Re: Interfacing mipi-lvds bridge with rk3399
To: =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>,
 "hjc@rock-chips.com" <hjc@rock-chips.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <da4df90b-e0eb-4257-29a0-c16381db885d@samsung.com>
Date: Tue, 28 Jan 2020 11:39:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2bf23a36-1b6c-c793-20f9-39aec71afc63@nextfour.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djP87p5/AZxBisva1tc+fqezWLupFqL
 Tw/+M1u8OjWHyYHF4373cSaPzUvqPVb+aGHx+DtrP0sASxSXTUpqTmZZapG+XQJXxuLmPvaC
 Q0IV3Ru2szUwfuPrYuTkkBAwkdhx5SlLFyMXh5DACkaJ05NWM0I4Xxgl+s7eZgepEhL4zChx
 tiUapmPbpXOMEPHljBI3n9hANLxllLjfe4cZJCEsYCrxqKuLDcQWEciRuHW4EWwFs8A0Rond
 lzeAFbEJaEr83XwTrIhXwE5i9+btYDaLgKrEwXl3mEBsUYEIiSdXHrNC1AhKnJz5hAXE5hRw
 kNjyohksziwgL9G8dTYzhC0ucevJfCaQZRIC/ewS12Z1AyU4gBwXiW2H7SE+EJZ4dXwLO4Qt
 I3F6cg8LhF0vcX9FCzNEbwejxNYNO5khEtYSd879YgOZwwx09Ppd+hBhR4kL684wQoznk7jx
 VhDiBD6JSdumQ23llehoE4KoVpS4f3Yr1EBxiaUXvrJNYFSaheSxWUiemYXkmVkIexcwsqxi
 FE8tLc5NTy02zkst1ytOzC0uzUvXS87P3cQITCun/x3/uoNx35+kQ4wCHIxKPLwSl/XihFgT
 y4orcw8xSnAwK4nwdjIZxAnxpiRWVqUW5ccXleakFh9ilOZgURLnNV70MlZIID2xJDU7NbUg
 tQgmy8TBKdXAuHzOl11qRQyzjVaUyCyLP+fx0yrFxpQtXKdkluEm4TDXe0XP1Vjyndw1alsY
 DrPWJO1fY79R+fkSXmWNHS2mAqf+dhQtlNX4f016a0pm9cSI3ez3xIu33UhXinum2CGfN/mO
 aMXD15lSqq/KdfUnqM37tk/HcuqSnV6GZ7boMl7usGy9POOAEktxRqKhFnNRcSIA3hYDFCcD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7p5/AZxBoc/8lpc+fqezWLupFqL
 Tw/+M1u8OjWHyYHF4373cSaPzUvqPVb+aGHx+DtrP0sAS5SeTVF+aUmqQkZ+cYmtUrShhZGe
 oaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexuLmPvaCQ0IV3Ru2szUwfuPrYuTkkBAw
 kdh26RxjFyMXh5DAUkaJtad3sEAkxCV2z3/LDGELS/y51sUGUfSaUWLHrn42kISwgKnEo64u
 MFtEIEfi3ppJYM3MAtMYJR6cEQWxhQQmM0o0zDIEsdkENCX+br4JVs8rYCexe/N2MJtFQFXi
 4Lw7TCC2qECExNvfN1khagQlTs58AjaTU8BBYsuLZlaI+eoSf+ZdYoaw5SWat86GssUlbj2Z
 zzSBUWgWkvZZSFpmIWmZhaRlASPLKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMBY2nbs55Yd
 jF3vgg8xCnAwKvHwSlzWixNiTSwrrsw9xCjBwawkwtvJZBAnxJuSWFmVWpQfX1Sak1p8iNEU
 6LmJzFKiyfnAOM8riTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cAY
 IXv5vd+Hl0wX3Fadfy6u6+VTdXN3mqlel+A7zwT+hLMKEselQ3tLDb9MCcowKE4qaigVPLw7
 7sWZHe8X8ubNsFlhkBCp7Hu+UezXy7Ohnx97ffqiNe3ScqVZJrd2Fc+QDJc34wi9luYs+FZP
 Ycvqsr/JpockN9W/KzsXuPmwy07tpPtbDK4qsRRnJBpqMRcVJwIAlJLGD7sCAAA=
X-CMS-MailID: 20200128103942eucas1p17b65ba90e69efb4707273dc8a738e53d
X-Msg-Generator: CA
X-RootMTR: 20200128083655eucas1p2665cc13d4794ce4796c91f7146dd4dc4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200128083655eucas1p2665cc13d4794ce4796c91f7146dd4dc4
References: <CGME20200128083655eucas1p2665cc13d4794ce4796c91f7146dd4dc4@eucas1p2.samsung.com>
 <2bf23a36-1b6c-c793-20f9-39aec71afc63@nextfour.com>
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
Cc: "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcuMDEuMjAyMCAxNzoxOCwgTWlrYSBQZW50dGlsw6Qgd3JvdGU6Cj4gSGksCj4KPiBXZSBh
cmUgZGV2ZWxvcGluZyBhIGN1c3RvbSBib2FyZCwgaW4gd2hpY2ggd2UgYXJlIHVzaW5nIHRoZSBy
azMzOTkgc29jLiAKPiBXZSBoYXZlIExWRFMgZGlzcGxheXMsIGFuZCB1c2UgVEkgU042NWRzaTg0
IGJyaWRnZSBhcyBhIG1pcGktbHZkcyBicmlkZ2UuCj4gVGhlIGJyaWRnZSBkZW1hbmRzIHRoZSBE
U0kgZGF0YSBsYW5lcyBiZSBpbiBMUC0xMSBzdGF0ZSAoc3RvcCBzdGF0ZSkuIFdlIAo+IGRldmVs
b3BlZCBzdXBwb3J0IGZvciB0aGUgYnJpZGdlIGFzIGEgRFJNIGJyaWRnZSBtb2R1bGUuIEl0IGdl
dHMgY2FsbGVkIAo+IGluIHRoZSBwbGFjZXMgd2Ugd2FudCwgYnV0IHRoZSBwcm9ibGVtIGlzIHRo
ZSBkYXRhIGxhbmVzLCBubyBpbiBMUC0xMS4gCj4gSW5zdGVhZCwgdGhleSBzZWVtIHRvIGJlIGxv
d2lzaCwgdW50aWwgZGF0YSBzdGFydHMgKHRoZXkgc2VlbSB0byB2aXNpdCAKPiBMUC0xMSBhIGEg
c2hvcnQgdGltZSwgbGlrZSA1bXMgYmVmb3JlIGRhdGEgc3RyZWFtLiBUaGlzIGlzIG5vdCBlbm91
Z2ggCj4gYW5kIG5vdCB1bmRlciBvdXIgY29udHJvbC4gV2Ugd291bGQgbGlrZSB0byBkZW1hbmQg
dGhlIG1pcGkgZGhweSBpbnRvIAo+IExQLTExIChvciBtYWtlIHN1cmUgaXQgc3RheXMgdGhlcmUg
ZnJvbSBwb3dlcnVwL3Jlc2V0KS4gQW5kIGFmdGVyIAo+IGNvbmZpZ3VyaW5nIGJyaWRnZSwgbGV0
IHRoZSBkYXRhIGxlYXZlIExQLTExLgo+Cj4gRG9jdW1lbnRhdGlvbiBzdGF0ZXMgdGhhdCB0aGUg
ZGF0YSBzaG91bGQgYmUgTFAtMTEgdXBvbiBwaHkgcmVzZXQuIEhvdyAKPiBjb21lIGl0IGlzIG5v
dD8gQW5kLCB3aGlsZSBib290aW5nLCB3ZSBzZSBhIGNvdXBsZSBvZiBzZXQgbW9kZSBjYWxscywg
Cj4gZHVyaW5nIHdoaWNoIHRoZSBwaHkgaXMgY29uZmlndXJlZC4gRHVyaW5nIHRoZSBwaHkgaW5p
dCwgdGhlcmUncyBjb2RlIHRvIAo+IHdhaXQgZm9yIHRoZSBwaHkgZW50ZXIgc3RvcCBzdGF0ZS4g
Rmlyc3QgdGltZSB0aGUgcGh5IHN0YXR1cyBzYXlzIGl0IGhhcyAKPiBlbnRlcmVkIHN0b3Agc3Rh
dGUuIEJ1dCBzZWNvbmQgdGltZSB0aGUgd2FpdCB0aW1lb3V0cyAoYWZ0ZXIgMTBtcyBvciAKPiBz
bykuIFdpdGggb3NjaWxsb3Njb3BlIGFueXRoaW5nIGxpa2UgTFAtMTEgaXNuJ3Qgb2JzZXJ2ZWQu
Cj4KPiBIYXMgc29tZW9uZSBzdWNjZXNzZnVsbHkgaW50ZWdyYXRlZCBTTjY1ZHNpOHggd2l0aCBy
azMzOTkgPyBEb2VzIHNvbWVvbmUgCj4gaGF2ZSBpbmZvcm1hdGlvbiBvbiBob3d0byBjb21tYW5k
IHRoZSBwaHkgd3J0IHN0b3Agc3RhdGVzIGFuZCBob3cgaXQgCj4gc2hvdWxkIGJlaGF2ZT8KCgpJ
IGFtIG5vdCBmYW1pbGlhciBuZWl0aGVyIHdpdGggcmszMzk5LCBuZWl0aGVyIHNuNjVkc2k4NCBz
byBJIGNhbm5vdAp0ZWxsIGFib3V0IHRoZXNlIGNoaXBzLAoKYnV0IGdlbmVyYWxseSBwb3dlci1v
biBvbiBtaXBpIHNvdXJjZSAocmszMzk5IG9yIGV4dGVybmFsIG1pcGkgcGh5KQpzaG91bGQgZHJp
dmUgTFAtMTEgc3RhdGUuCgpTbyBJIHdvdWxkIGxvb2sgaW50byByazMzODktbWlwaSBkcml2ZXIs
IG1pcGktcGh5IGNvZGUgKGVzcGVjaWFsbHkgaWYKdGhlcmUgaXMgZXh0ZXJuYWwgcGh5KSwgbWF5
YmUgcmVndWxhdG9ycyBwb3dlcmluZyBkaXNwbGF5IHBpcGVsaW5lLAptYXliZSBzb21lIGdwaW9z
LCB2b2x0YWdlIGxldmVsIHNoaWZ0ZXJzLCBwb3dlciBkb21haW5zLCBTb0NzIGV4dGVybmFsCmlu
dGVyZmFjZXMgaXNvbGF0aW9uIGNvbmZpZ3VyYXRpb24gPz8/CgpBZGRpdGlvbmFsbHkgeW91IHNo
b3VsZCBzdHVkeSBhbGwgd2lyZXMgb24gYm9hcmQncyBzY2hlbWF0aWNzIHJlZ2FyZGluZwpkaXNw
bGF5IHBpcGVsaW5lLgoKV2l0aG91dCB0aGUgY29kZSBvciBkb2N1bWVudGF0aW9uIGlzIGhhcmQg
dG8gc2F5IG1vcmUgd2hhdCBpcyBnb2luZyBvbiBoZXJlLgoKClJlZ2FyZHMKCkFuZHJ6ZWoKCgo+
Cj4gVGhhbmtzIGluIGFkdmFuY2UsCj4gTWlrYSBQZW50dGlsw6QKPiBOZXh0Zm91cgo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
cHJvdGVjdDIuZmlyZWV5ZS5jb20vdXJsP2s9YzUyYmRmODQtOThmODg2M2EtYzUyYTU0Y2ItMGNj
NDdhMzFiYTgyLWQ4YTBlODdjZGU5OWE2MjImdT1odHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
