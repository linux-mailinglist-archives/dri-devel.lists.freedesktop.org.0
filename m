Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D38B0FB9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 15:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917956ED44;
	Thu, 12 Sep 2019 13:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EFB6ED44
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 13:21:29 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190912132127euoutp0187a178f5cfaebd0937cf6fc191468689~Ds4cEEFQz0200902009euoutp01h
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 13:21:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190912132127euoutp0187a178f5cfaebd0937cf6fc191468689~Ds4cEEFQz0200902009euoutp01h
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190912132126eucas1p19f372230cf5576d5286ddbaabc1bcb08~Ds4bVrYfa1903319033eucas1p1Y;
 Thu, 12 Sep 2019 13:21:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 31.D6.04469.6564A7D5; Thu, 12
 Sep 2019 14:21:26 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190912132126eucas1p1232a3be470d783e7676d22f462a252b4~Ds4aqa3mh1903319033eucas1p1X;
 Thu, 12 Sep 2019 13:21:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190912132126eusmtrp1be40c8b867e017da7064c56436d3967f~Ds4apTRSl1907619076eusmtrp19;
 Thu, 12 Sep 2019 13:21:26 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-8f-5d7a46561230
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7E.7F.04166.6564A7D5; Thu, 12
 Sep 2019 14:21:26 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190912132125eusmtip21addbf3b29cb6ac44ac21c0141b81adf~Ds4Z92MFT0734107341eusmtip2Z;
 Thu, 12 Sep 2019 13:21:25 +0000 (GMT)
Subject: Re: [RFC][PATCH] drm: kirin: Fix dsi probe/attach logic
To: John Stultz <john.stultz@linaro.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <16c9066b-091f-6d0e-23f1-2c1f83a7da1b@samsung.com>
Date: Thu, 12 Sep 2019 15:21:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLVP=x9+p9scGyfgFUMN2di+ngOz9-fWW=A1YCM4aN7JRA@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTut/vY1Zz9nBNPGoUjMSu16MEPCjGSukVQQUloYisvGumqTSsN
 cqWGPSxrlbRVmila2HPOVxYysym9rUWFsWUPe2JoVtOydr1J/vd93/nOd86Bw1HKASaI26jN
 EHRaTZqa9aZrb7sfRMQtyk6cUVEXTgrvt8vI16oyRJ7097DE8eMDRe4ORpD2zw6a7DtSLieP
 G0+xpNFZKiO2Qwmk++xPilS5rYi8vHIPEXfjGZpYenJp0vWhkonBfM+zfDlvNjyi+QbTSzn/
 +vRVDy04yfBtRR0yvvNpE8vXfXcxvPOAXcaXn3CwfHOhkebNxi6G77s2cYUi3nt+spC2cZug
 i4pe5516w90k29IesKO5xsEaUJ7ffsRxgGdD9Vu8H3lzSlyF4JblDC2Rbwh6a4tlEulDUGMz
 0yMdN9tiJL0SQYnF5DF5ecgXBGVfKRH74xj4VPeeEbEKT4Gz5Y7hIAr/osF6rhWJBRaHw2/L
 c1bEChwNpqa7cnEAjUPBdpsW5QC8BnpdLYxk8YP2k2+GdS+8Egp/F8lFTOFJkGs1UxIOhBdv
 SoZnAb7Iwa8nhn9Lx4KpZKnoAewPH+01cglPgDvGg7SEc8BZlUdJvQUIrFcaKKkwD1rsjxgx
 h/LsfLkxSpIXwJ/KS3Ip3heeffGTVvCFo7XFlCQroGCvUnKHgPOe9V9gIFQ87GeLkNo06jDT
 qGNMo44x/Z9biugLKFDI1KenCPqZWmF7pF6Trs/UpkRu2Jx+DXk+8s6Qvbce9XestyHMIbWP
 gkzPTlQymm36rHQbAo5SqxTLPmclKhXJmqxsQbc5SZeZJuhtKJij1YGKnWNcCUqcoskQNgnC
 FkE3UpVxXkEGlLQEvYqzupe5jK3Ls1tClo+lu8Pi57f2Fy9pG+taOC+g2hz/LqwtwJCvPKKa
 tqp0bblPpm980gu479LuORxsG1/avTVnddb1VRlB4y6dV8fiTp/644tvptY6V1jmHns7J6Zi
 luqYGu0ebO6crKpPHeoqWWsPH9NqHAg9FeUXGdKxS03rUzUzp1I6veYv1p68CY0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42I5/e/4Pd0wt6pYg2U7OCx6z51ksviwYhGj
 xZWv79ksrn5/yWxx5reuxck3V1ksOicuYbe4vGsOm8Wu+wuYLA71RVs8X/iD2WLFz62MFnc3
 nGW0+LlrHovF5vfNLBaPXi5ndRDweH+jld1jdsNFFo+ds+6yezyeuxHI7ZjJ6nFiwiUmjzvX
 9rB5bP/2gNXjfvdxJo8l066yeRzoncziMXvyI1aPz5vkAnij9GyK8ktLUhUy8otLbJWiDS2M
 9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DL2/tzDVHBStOLAlqtsDYwtgl2MHBwS
 AiYS+044dDFycQgJLGWUOH95AXMXIydQXFxi9/y3ULawxJ9rXWwQRa8ZJW48WskCkhAWcJB4
 vf0FK4gtIqAhsXDJVSaQImaBfywS01vmgHULCZxikdi+JwjEZhPQlPi7+SYbiM0rYCcxa88Z
 dpArWARUJQ4dA5spKhAhcXjHLEaIEkGJkzOfgMU5BQIlev9OYAexmQXUJf7Mu8QMYctLNG+d
 DWWLS9x6Mp9pAqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucWGesWJucWleel6yfm5mxiB
 iWHbsZ+bdzBe2hh8iFGAg1GJh9dCpypWiDWxrLgy9xCjBAezkgivz5vKWCHelMTKqtSi/Pii
 0pzU4kOMpkC/TWSWEk3OByatvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUw
 fUwcnFINjIxm5lPdq68xPLdSrKq3PX7cuOOPbkPJiTNJs7VZQhzei2Xm6ti3HCk49JZTwWXR
 di/edBEHBqkdG6b8mFv0dHGUpdfH4Mccb3li/JY2X4l2dJnTbv58zsalWQyJfk/89f1U3nyN
 3f3mNbPhnU/Nt2OYFI5s33nx8K0Hq3rX9skf9cuf2eMjoMRSnJFoqMVcVJwIAC2247giAwAA
X-CMS-MailID: 20190912132126eucas1p1232a3be470d783e7676d22f462a252b4
X-Msg-Generator: CA
X-RootMTR: 20190829173938epcas3p1276089cb3d6f9813840d1bb6cac8b1da
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190829173938epcas3p1276089cb3d6f9813840d1bb6cac8b1da
References: <20190829060550.62095-1-john.stultz@linaro.org>
 <CGME20190829173938epcas3p1276089cb3d6f9813840d1bb6cac8b1da@epcas3p1.samsung.com>
 <CAF6AEGvborwLmjfC6_vgZ-ZbfvF3HEFFyb_NHSLRoYWF35bw+g@mail.gmail.com>
 <ebdf3ff5-5a9b-718d-2832-f326138a5b2d@samsung.com>
 <CAF6AEGtkvRpXSoddjmxer2U6LxnV_SAe+jwE2Ct8B8dDpFy2mA@mail.gmail.com>
 <b925e340-4b6a-fbda-3d8d-5c27204d2814@samsung.com>
 <CALAqxLU5Ov+__b5gxnuMxQP1RLjndXkB4jAiGgmb-OMdaKePug@mail.gmail.com>
 <9d31af23-8a65-d8e8-b73d-b2eb815fcd6f@samsung.com>
 <CALAqxLVP=x9+p9scGyfgFUMN2di+ngOz9-fWW=A1YCM4aN7JRA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568294487;
 bh=tlEvquuIuW9HkzSFCWtP6aVz/Llz1jttyGDq549d7xE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=slhQrT9JoQ5IpckP1TdazKArL5nidnqsqTegr/1bsitNGcXxl8wvZSfbIIUBsHkCp
 w1kz+w0wQmnfCYuJLNRkLc1kMNErDPEOQnrKNW8erCRXPbql3HnG5y6w9T1nWAB3NO
 OvIimBz5AXCS4pISGN0SYKH2tLoTnhATA/Ll1bps=
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Matt Redfearn <matt.redfearn@thinci.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIuMDkuMjAxOSAwNDozOCwgSm9obiBTdHVsdHogd3JvdGU6Cj4gT24gV2VkLCBTZXAgNCwg
MjAxOSBhdCAzOjI2IEFNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+IHdyb3Rl
Ogo+PiBPbiAwMy4wOS4yMDE5IDE4OjE4LCBKb2huIFN0dWx0eiB3cm90ZToKPj4+IE9uIE1vbiwg
U2VwIDIsIDIwMTkgYXQgNjoyMiBBTSBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29t
PiB3cm90ZToKPj4+PiBPbiAzMC4wOC4yMDE5IDE5OjAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4+Pj4+
IE9uIFRodSwgQXVnIDI5LCAyMDE5IGF0IDExOjUyIFBNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFA
c2Ftc3VuZy5jb20+IHdyb3RlOgo+Pj4+Pj4gT2YgY291cnNlIGl0IHNlZW1zIHlvdSBoYXZlIGRp
ZmZlcmVudCBvcGluaW9uIHdoYXQgaXMgdGhlIHJpZ2h0IHRoaW5nIGluCj4+Pj4+PiB0aGlzIGNh
c2UsIHNvIGlmIHlvdSBjb252aW5jZSB1cyB0aGF0IHlvdXIgYXBwcm9hY2ggaXMgYmV0dGVyIG9u
ZSBjYW4KPj4+Pj4+IHJldmVydCB0aGUgcGF0Y2guCj4+Pj4+IEkgZ3Vlc3MgbXkgc3Ryb25nZXN0
IC8gbW9zdCBpbW1lZGlhdGUgb3BpbmlvbiBpcyB0byBub3QgYnJlYWsgb3RoZXIKPj4+Pj4gZXhp
c3RpbmcgYWR2NzV4eCBicmlkZ2UgdXNlcnMuCj4+Pj4gSXQgaXMgcGl0eSB0aGF0IGJyZWFrYWdl
IGhhcHBlbmVkLCBhbmQgbmV4dCB0aW1lIHdlIHNob3VsZCBiZSBtb3JlCj4+Pj4gc3RyaWN0IGFi
b3V0IHRlc3Rpbmcgb3RoZXIgcGxhdGZvcm1zLCBiZWZvcmUgcGF0Y2ggYWNjZXB0YW5jZS4KPj4+
Pgo+Pj4+IEJ1dCByZXZlcnRpbmcgaXQgbm93IHdpbGwgYnJlYWsgYWxzbyBwbGF0Zm9ybSB3aGlj
aCBkZXBlbmQgb24gaXQuCj4+PiBJJ20gcmVhbGx5IG9mIG5vIG9waW5pb24gb2Ygd2hpY2ggYXBw
cm9hY2ggaXMgYmV0dGVyIGhlcmUsIGJ1dCBJIHdpbGwKPj4+IHNheSB0aGF0IHdoZW4gYSBwYXRj
aCBicmVha3MgcHJldmlvdXNseSB3b3JraW5nIGJvYXJkcywgdGhhdCdzIGEKPj4+IHJlZ3Jlc3Np
b24gYW5kIGp1c3RpZnlpbmcgdGhhdCBzb21lIG90aGVyIGJvYXJkIGlzIG5vdyBlbmFibGVkIHRo
YXQKPj4+IHdvdWxkIGJlIGJyb2tlbiBieSB0aGUgcmV2ZXJ0IChvZiBhIHBhdGNoIHRoYXQgaXMg
bm90IHlldCB1cHN0cmVhbSkKPj4+IGlzbid0IHJlYWxseSBhIHN0cm9uZyBhcmd1bWVudC4KPj4+
Cj4+PiBJJ20gaGFwcHkgdG8gd29yayB3aXRoIGZvbGtzIHRvIHRyeSB0byBmaXh1cCB0aGUga2ly
aW4gZHJpdmVyIGlmIHRoaXMKPj4+IHBhdGNoIHJlYWxseSBpcyB0aGUgcmlnaHQgYXBwcm9hY2gs
IGJ1dCB3ZSBuZWVkIHNvbWVvbmUgdG8gZG8gdGhlIHNhbWUKPj4+IGZvciB0aGUgZGI0MTBjLCBh
bmQgSSBkb24ndCB0aGluayBpdHMgZmFpciB0byBqdXN0IGR1bXAgdGhhdCB3b3JrIG9udG8KPj4+
IGZvbGtzIHVuZGVyIHRoZSB0aHJlYXQgb2YgdGhlIGJvYXJkIGJyZWFraW5nLgo+Pgo+PiBUaGVz
ZSBkcml2ZXJzIHNob3VsZCBiZSBmaXhlZCBhbnl3YXkgLSBhc3N1bXB0aW9uIHRoYXQKPj4gZHJt
X2JyaWRnZS9kcm1fcGFuZWwgd2lsbCBiZSByZWdpc3RlcmVkIGJlZm9yZSB0aGUgYnVzIGl0IGlz
IGF0dGFjaGVkIHRvCj4+IGlzIGp1c3QgaW5jb3JyZWN0Lgo+Pgo+PiBTbyBpbnN0ZWFkIG9mIHJl
dmVydGluZywgZml4aW5nIGFuZCB0aGVuIHJlLWFwcGx5aW5nIHRoZSBwYXRjaCBJIGhhdmUKPj4g
Z2VudGx5IHByb3Bvc2VkIHNob3J0ZXIgcGF0aC4gSWYgeW91IHByZWZlciBsb25nIHBhdGggd2Ug
Y2FuIHRyeSB0byBnbwo+PiB0aGlzIHdheS4KPj4KPj4gTWF0dCwgaXMgdGhlIHB1cmUgcmV2ZXJ0
IE9LIGZvciB5b3Ugb3IgaXMgaXQgcG9zc2libGUgdG8gcHJlcGFyZSBzb21lCj4+IHdvcmthcm91
bmQgYWxsb3dpbmcgY29vcGVyYXRpb24gd2l0aCBib3RoIGFwcHJvYWNoZXM/Cj4gUm9iL0FuZHJ6
ZWo6IFdoYXQncyB0aGUgY2FsbCBoZXJlPwo+Cj4gU2hvdWxkIEkgcmVzdWJtaXQgdGhlIGtpcmlu
IGZpeCBmb3IgdGhlIGFkdjc1MTEgcmVncmVzc2lvbiBoZXJlPwo+IE9yIGRvIHdlIHJldmVydCB0
aGUgYWR2NzUxMSBwYXRjaD8gSSBiZWxpZXZlIGRiNDEwYyBzdGlsbCBuZWVkcyBhIGZpeC4KPgo+
IEknZCBqdXN0IGxpa2UgdG8ga2VlcCB0aGUgSGlLZXkgYm9hcmQgZnJvbSBicmVha2luZywgc28g
bGV0IG1lIGtub3cgc28KPiBJIGNhbiBnZXQgdGhlIGZpeCBzdWJtaXR0ZWQgaWYgbmVlZGVkLgoK
ClNpbmNlIHRoZXJlIGlzIG5vIHJlc3BvbnNlIGZyb20gTWF0dCwgd2UgY2FuIHBlcmZvcm0gcmV2
ZXJ0LCBzaW5jZSB0aGVyZQphcmUgbm8gb3RoZXIgaWRlYXMuIEkgd2lsbCBhcHBseSBpdCB0b21v
cnJvdywgaWYgdGhlcmUgYXJlIG5vIG9iamVjdGlvbnMuCgpBbmQgZm9yIHRoZSBmdXR1cmU6IEkg
Z3Vlc3MgaXQgaXMgbm90IHBvc3NpYmxlIHRvIG1ha2UgYWR2IHdvcmsgd2l0aCBvbGQKYW5kIG5l
dyBhcHByb2FjaCwgYnV0IHNpbXBsZSB3b3JrYXJvdW5kIGZvciBhZHYgY291bGQgYmUgYWRkZWQg
bGF0ZXI6CgppZiAoc291cmNlIGlzIG1zbSBvciBraXJpbikKCsKgwqDCoCBkb190aGVfb2xkX3dh
eQoKZWxzZQoKwqDCoMKgIGRvX2NvcnJlY3RseS4KCgpBbmQgcmVtb3ZlIGl0IGFmdGVyIGZpeGlu
ZyBib3RoIGRzaSBtYXN0ZXJzLgoKClJlZ2FyZHMKCkFuZHJ6ZWoKCgo+Cj4gdGhhbmtzCj4gLWpv
aG4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
