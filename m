Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E38262FF8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 16:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDD76E2EF;
	Wed,  9 Sep 2020 14:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ADF6E2EF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 14:47:11 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200909144709euoutp02c746db7bcce3f2713164b44f683941fe~zJN5PXhRI0245002450euoutp02e
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 14:47:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200909144709euoutp02c746db7bcce3f2713164b44f683941fe~zJN5PXhRI0245002450euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599662829;
 bh=6pD2jBm6l4NY8TMCPp0T0+uNfiB/x7JVe6XpoPosFww=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=BuxEfST+qLsO9tmEutNhTyMAYfDoAvIhSxqMz1iIzjcsvAYHquxwAjp5Nx0RfR6O2
 vdWeV4s5vOi3ip2KDkNeI8g0fcpTRwr3E4Ru/9KkixMyZiq2fanivX2pvscArzZVNG
 dA1bxbYpY2UaAbxLWKe+bT77EmwxN9ATHj42t0Nc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200909144709eucas1p2b4703806571a6b7d4677bb44b1129e64~zJN4vjCO_0720307203eucas1p2H;
 Wed,  9 Sep 2020 14:47:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 54.DC.05997.DEAE85F5; Wed,  9
 Sep 2020 15:47:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200909144708eucas1p22c7a9c941f4656ff4efc94e1d156a9a6~zJN4U79yv0034700347eucas1p20;
 Wed,  9 Sep 2020 14:47:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200909144708eusmtrp1cea369908fda34b63479819aba3041e8~zJN4UJEpe1317213172eusmtrp1G;
 Wed,  9 Sep 2020 14:47:08 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-0e-5f58eaed414a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B1.1E.06017.CEAE85F5; Wed,  9
 Sep 2020 15:47:08 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200909144707eusmtip2e63e94961e81d7208ff2d3503e173a61~zJN3U6Wu32459124591eusmtip2b;
 Wed,  9 Sep 2020 14:47:07 +0000 (GMT)
Subject: Re: [PATCH RFC v6 1/6] dt-bindings: exynos-bus: Add documentation
 for interconnect properties
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh@kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <e6e369fb-ccf2-09ed-ad6a-680e67198359@samsung.com>
Date: Wed, 9 Sep 2020 16:47:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b711257d-c34b-b609-3ada-312871967b98@linaro.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+XYuO462jsvyRcVqSRelqRnxSSXdqFH/BFmElLb04Cy3YnPV
 Qsgww3uW1dastAso01iuMjXtDy9ZWq60THJmmCWO7KaRdtE6nkX+93ue93n5nhc+hpD3Un5M
 ki6F0+vUyQpaQlY9GHcuHXbvjAt7NyjDfZczEK602Cn8cnSQwsVN7RR+/u0Tjc31Dhqf6Ssg
 sdN5U4wdb7so3Fl7kcYjeU0IW5z3RfhGU68Y9xwvo/FkXbUYWwqH6DWsymHLolWurjpa1ZfT
 IlLdun5MlX/bhlQjjsCtdIxkVQKXnHSI04dG7ZFoskq6xQc/zj8y5rKhNFTpn428GGCXg9v6
 gs5GEkbOliEo63lDCWIUQXHveY8YQdD4I1/0b6Wr87VnUIqg3fLYI74g6HCWUnxqFquB8bu5
 NM8+7BZ4erWO4EMEe4KAvKFyxA9oNhzymvOnWMpGQeOp72Q2YhiSDYJPmTLens3GwoPWflKI
 eMOjCwNT7PU3/sE5QfBMsL7waqBYJPBcSL9TNPUWsMcZ+DqY4am9AZ5VnqUEngXulttigQOg
 rTCXFBbSEeTe6xELogBBX0sJElIrwdX+g+bbEewSsNeGCvZauDlZI+JtYGXQPewtlJDBmSoz
 IdhSyDwpF9JB8NNm9tTxg5yBSbIAKazTTrNOO8c67Rzr/3dLEGlDvpzRoE3kDMt03GGlQa01
 GHWJyvgDWgf6++naJlpGq1Htr70NiGWQYoY0s3dnnJxSHzKYtA0IGELhI133pC1WLk1Qm45y
 +gNxemMyZ2hA/gyp8JVGXB3aLWcT1Sncfo47yOn/TUWMl18aOrlZMVY+HjLvpbmgvzzkdGi8
 O/LStYhXqLk4ZsG9U67mnMiNHa31mmjb5J6IYP/UfXuv0DUVWWAPiMRPF7a+XRRo3JXU+RAb
 w7aj8ni8WnK+7VxK5jufinNVmqIVnz9bTcbu0NjCCeX76E39QWEzg43KbYuHTXNSf5dutK6P
 3mFXkAaNOjyY0BvUfwBBw3q3cAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRmVeSWpSXmKPExsVy+t/xe7pvXkXEG2zu1re4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbbHp8jdXi8q45bBafe48wWsw4v4/J
 Yu2Ru+wWtxtXsFn837OD3WLG5JdsDgIem1Z1snncubaHzeN+93Emj81L6j36tqxi9Pi8SS6A
 LUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvo3PB
 DfaCd4oVP+6sYmxg3CjdxcjJISFgInHt8j1WEFtIYCmjRP+E8C5GDqC4lMT8FiWIEmGJP9e6
 2LoYuYBK3jNKPDn0lw0kISyQIbFs3wtGEFtEwFviwqI9zCBFzAItzBJfJ81gguj4zyTR0PIW
 bAObgKFE79E+sA5eATuJw/3fWUC2sQioSLzv4AMJiwrESZzpecEGUSIocXLmExYQmxOo/M35
 f8wgNrOAusSfeZegbHGJW0/mM0HY8hLNW2czT2AUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3
 PbfYSK84Mbe4NC9dLzk/dxMjMKq3Hfu5ZQdj17vgQ4wCHIxKPLwddyPihVgTy4orcw8xSnAw
 K4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RTot4nMUqLJ+cCEk1cSb2hqaG5haWhubG5sZqEk
 ztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgbHZKfJ1pMsdHmPmi1Mju2In5gtEaGjr/3TT+HH7
 WPAD9tOvvXef2/dz4Trpd8u32K5esXSmZ/ncKo61qrc2FPOaTj37WuPFm1/r5VdMzVNsm3j1
 nHl6mOZlL++nu3lvTzfeov13xvzLt1kSP/JWeRQw+7MbfA7gf/G4lXVm+bGdh1KYzObEPPZS
 YinOSDTUYi4qTgQABaXelwADAAA=
X-CMS-MailID: 20200909144708eucas1p22c7a9c941f4656ff4efc94e1d156a9a6
X-Msg-Generator: CA
X-RootMTR: 20200702163748eucas1p2cf7eab70bc072dea9a95183018b38ad3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200702163748eucas1p2cf7eab70bc072dea9a95183018b38ad3
References: <20200702163724.2218-1-s.nawrocki@samsung.com>
 <CGME20200702163748eucas1p2cf7eab70bc072dea9a95183018b38ad3@eucas1p2.samsung.com>
 <20200702163724.2218-2-s.nawrocki@samsung.com>
 <20200709210448.GA876103@bogus>
 <65af1a5c-8f8a-ef65-07f8-e0b3d04c336c@samsung.com>
 <35d9d396-b553-a815-1f3b-1af4dc37a2ca@samsung.com>
 <b711257d-c34b-b609-3ada-312871967b98@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, krzk@kernel.org, linux-kernel@vger.kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VvcmdpLAoKT24gMDkuMDkuMjAyMCAxMTowNywgR2VvcmdpIERqYWtvdiB3cm90ZToKPiBP
biA4LzI4LzIwIDE3OjQ5LCBTeWx3ZXN0ZXIgTmF3cm9ja2kgd3JvdGU6Cj4+IE9uIDMwLjA3LjIw
MjAgMTQ6MjgsIFN5bHdlc3RlciBOYXdyb2NraSB3cm90ZToKPj4+IE9uIDA5LjA3LjIwMjAgMjM6
MDQsIFJvYiBIZXJyaW5nIHdyb3RlOgo+Pj4+IE9uIFRodSwgSnVsIDAyLCAyMDIwIGF0IDA2OjM3
OjE5UE0gKzAyMDAsIFN5bHdlc3RlciBOYXdyb2NraSB3cm90ZToKPj4+Pj4gQWRkIGRvY3VtZW50
YXRpb24gZm9yIG5ldyBvcHRpb25hbCBwcm9wZXJ0aWVzIGluIHRoZSBleHlub3MgYnVzIG5vZGVz
Ogo+Pj4+PiBzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQsICNpbnRlcmNvbm5lY3QtY2VsbHMs
IGJ1cy13aWR0aC4KPj4+Pj4gVGhlc2UgcHJvcGVydGllcyBhbGxvdyB0byBzcGVjaWZ5IHRoZSBT
b0MgaW50ZXJjb25uZWN0IHN0cnVjdHVyZSB3aGljaAo+Pj4+PiB0aGVuIGFsbG93cyB0aGUgaW50
ZXJjb25uZWN0IGNvbnN1bWVyIGRldmljZXMgdG8gcmVxdWVzdCBzcGVjaWZpYwo+Pj4+PiBiYW5k
d2lkdGggcmVxdWlyZW1lbnRzLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndp
Z2/FhCA8YS5zd2lnb25Ac2Ftc3VuZy5jb20+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFN5bHdlc3Rl
ciBOYXdyb2NraSA8cy5uYXdyb2NraUBzYW1zdW5nLmNvbT4KPj4KPj4+Pj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RldmZyZXEvZXh5bm9zLWJ1cy50eHQKPj4+Pj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RldmZyZXEvZXh5bm9zLWJ1
cy50eHQKCj4+Pj4+ICtPcHRpb25hbCBwcm9wZXJ0aWVzIGZvciBpbnRlcmNvbm5lY3QgZnVuY3Rp
b25hbGl0eSAoUW9TIGZyZXF1ZW5jeSBjb25zdHJhaW50cyk6Cj4+Pj4+ICstIHNhbXN1bmcsaW50
ZXJjb25uZWN0LXBhcmVudDogcGhhbmRsZSB0byB0aGUgcGFyZW50IGludGVyY29ubmVjdCBub2Rl
OyBmb3IKPj4+Pj4gKyAgcGFzc2l2ZSBkZXZpY2VzIHNob3VsZCBwb2ludCB0byBzYW1lIG5vZGUg
YXMgdGhlIGV4eW5vcyxwYXJlbnQtYnVzIHByb3BlcnR5Lgo+Pgo+Pj4+IEFkZGluZyB2ZW5kb3Ig
c3BlY2lmaWMgcHJvcGVydGllcyBmb3IgYSBjb21tb24gYmluZGluZyBkZWZlYXRzIHRoZSAKPj4+
PiBwb2ludC4KPj4KPj4gQWN0dWFsbHkgd2UgY291bGQgZG8gd2l0aG91dCBhbnkgbmV3IHByb3Bl
cnR5IGlmIHdlIHVzZWQgZXhpc3RpbmcgaW50ZXJjb25uZWN0Cj4+IGNvbnN1bWVycyBiaW5kaW5n
IHRvIHNwZWNpZnkgbGlua2luZyBiZXR3ZWVuIHRoZSBwcm92aWRlciBub2Rlcy4gSSB0aGluayB0
aG9zZQo+PiBleHlub3MtYnVzIG5vZGVzIGNvdWxkIHdlbGwgYmUgY29uc2lkZXJlZCBib3RoIHRo
ZSBpbnRlcmNvbm5lY3QgcHJvdmlkZXJzIAo+PiBhbmQgY29uc3VtZXJzLiBUaGUgZXhhbXBsZSB3
b3VsZCB0aGVuIGJlIHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgCj4+ICh5ZXMsIEkga25vdyB0
aGUgYnVzIG5vZGUgbmFtaW5nIG5lZWRzIHRvIGJlIGZpeGVkKToKPj4KPj4gCXNvYyB7Cj4+IAkJ
YnVzX2RtYzogYnVzX2RtYyB7Cj4+IAkJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3MtYnVz
IjsKPj4gCQkJLyogLi4uICovCj4+IAkJCXNhbXN1bmcsZGF0YS1jbG9jay1yYXRpbyA9IDw0PjsK
Pj4gCQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKPj4gCQl9Owo+Pgo+PiAJCWJ1c19sZWZ0
YnVzOiBidXNfbGVmdGJ1cyB7Cj4+IAkJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3MtYnVz
IjsKPj4gCQkJLyogLi4uICovCj4+IAkJCWludGVyY29ubmVjdHMgPSA8JmJ1c19sZWZ0YnVzICZi
dXNfZG1jPjsKPj4gCQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKPj4gCQl9Owo+Pgo+PiAJ
CWJ1c19kaXNwbGF5OiBidXNfZGlzcGxheSB7Cj4+IAkJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxl
eHlub3MtYnVzIjsKPj4gCQkJLyogLi4uICovCj4+IAkJCWludGVyY29ubmVjdHMgPSA8JmJ1c19k
aXNwbGF5ICZidXNfbGVmdGJ1cz47Cj4gCj4gSG1tLCBidXNfZGlzcGxheSBiZWluZyBhIGNvbnN1
bWVyIG9mIGl0c2VsZiBpcyBhIGJpdCBvZGQ/IERpZCB5b3UgbWVhbjoKPiAgCQkJaW50ZXJjb25u
ZWN0cyA9IDwmYnVzX2RtYyAmYnVzX2xlZnRidXM+OwoKTWlnaHQgYmUsIGJ1dCB3ZSB3b3VsZCBu
ZWVkIHRvIHN3YXAgdGhlIHBoYW5kbGVzIHNvIDxzb3VyY2UsIGRlc3RpbmF0aW9uPgpvcmRlciBp
cyBtYWludGFpbmVkLCBpLmUuIGludGVyY29ubmVjdHMgPSA8JmJ1c19sZWZ0YnVzICZidXNfZG1j
PjsKCk15IGludGVudGlvbiBoZXJlIHdhcyB0byBkZXNjcmliZSB0aGUgJ2J1c19kaXNwbGF5IC0+
IGJ1c19sZWZ0YnVzJyBwYXJ0IApvZiBkYXRhIHBhdGggJ2J1c19kaXNwbGF5IC0+IGJ1c19sZWZ0
YnVzIC0+IGJ1c19kbWMnLCBidXNfZGlzcGxheSBpcwpyZWFsbHkgYSBjb25zdW1lciBvZiAnYnVz
X2xlZnRidXMgLT4gYnVzX2RtYycgcGF0aC4KCkknbSBub3Qgc3VyZSBpZiBpdCBpcyBhbGxvd2Vk
IHRvIHNwZWNpZnkgb25seSBzaW5nbGUgcGhhbmRsZSAoYW5kIAppbnRlcmNvbm5lY3QgcHJvdmlk
ZXIgc3BlY2lmaWVyKSBpbiB0aGUgaW50ZXJjb25uZWN0IHByb3BlcnR5LCB0aGF0IHdvdWxkCmJl
IG5lZWRlZCBmb3IgdGhlIGJ1c19sZWZ0YnVzIG5vZGUgdG8gZGVmaW5lIGJ1c19kbWMgYXMgdGhl
IGludGVyY29ubmVjdCAKZGVzdGluYXRpb24gcG9ydC4gVGhlcmUgc2VlbXMgdG8gYmUgc3VjaCBh
IHVzZSBjYXNlIGluIGFyY2gvYXJtNjQvYm9vdC8KZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0
c2kuIAoKPj4gCQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKPj4gCQl9Owo+Pgo+Pgo+PiAJ
CSZtaXhlciB7Cj4+IAkJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3M0MjEyLW1peGVyIjsK
Pj4gCQkJaW50ZXJjb25uZWN0cyA9IDwmYnVzX2Rpc3BsYXkgJmJ1c19kbWM+Owo+PiAJCQkvKiAu
Li4gKi8KPj4gCQl9Owo+PiAJfTsKPj4KPj4gV2hhdCBkbyB5b3UgdGhpbmssIEdlb3JnaSwgUm9i
Pwo+IAo+IEkgY2FuJ3QgdW5kZXJzdGFuZCB0aGUgYWJvdmUgZXhhbXBsZSB3aXRoIGJ1c19kaXNw
bGF5IGJlaW5nIGl0J3Mgb3duIGNvbnN1bWVyLgo+IFRoaXMgc2VlbXMgc3RyYW5nZSB0byBtZS4g
Q291bGQgeW91IHBsZWFzZSBjbGFyaWZ5IGl0PwoKPiBPdGhlcndpc2UgdGhlIGludGVyY29ubmVj
dCBjb25zdW1lciBEVCBiaW5kaW5ncyBhcmUgYWxyZWFkeSB3ZWxsIGVzdGFibGlzaGVkCj4gYW5k
IGkgZG9uJ3Qgc2VlIGFueXRoaW5nIHByZXZlbnRpbmcgYSBub2RlIHRvIGJlIGJvdGggY29uc3Vt
ZXIgYW5kIHByb3ZpZGVyLgo+IFNvIHRoaXMgc2hvdWxkIGJlIG9rYXkgaW4gZ2VuZXJhbC4KClRo
YW5rcywgYmVsb3cgaXMgYW4gdXBkYXRlZCBleGFtcGxlIGFjY29yZGluZyB0byB5b3VyIHN1Z2dl
c3Rpb25zLiAKRG9lcyBpdCBsb29rIGJldHRlciBub3c/CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS04PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzb2MgewoJYnVzX2RtYzogYnVz
X2RtYyB7CgkJY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vcy1idXMiOwoJCS8qIC4uLiAqLwoJ
CXNhbXN1bmcsZGF0YS1jbG9jay1yYXRpbyA9IDw0PjsKCQkjaW50ZXJjb25uZWN0LWNlbGxzID0g
PDA+OwoJfTsKCglidXNfbGVmdGJ1czogYnVzX2xlZnRidXMgewoJCWNvbXBhdGlibGUgPSAic2Ft
c3VuZyxleHlub3MtYnVzIjsKCQkvKiAuLi4gKi8KCQlpbnRlcmNvbm5lY3RzID0gPCZidXNfZG1j
PjsKCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+OwoJfTsKCglidXNfZGlzcGxheTogYnVzX2Rp
c3BsYXkgewoJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3MtYnVzIjsKCQkvKiAuLi4gKi8K
CQlpbnRlcmNvbm5lY3RzID0gPCZidXNfbGVmdGJ1cyAmYnVzX2RtYz47CgkJI2ludGVyY29ubmVj
dC1jZWxscyA9IDwwPjsKCX07CgoJJm1peGVyIHsKCQljb21wYXRpYmxlID0gInNhbXN1bmcsZXh5
bm9zNDIxMi1taXhlciI7CgkJaW50ZXJjb25uZWN0cyA9IDwmYnVzX2Rpc3BsYXkgJmJ1c19kbWM+
OwoJCS8qIC4uLiAqLwoJfTsKfTsKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tODwtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCi0tIApSZWdhcmRzLApTeWx3ZXN0ZXIKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
