Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1DFA8054
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 12:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE3789320;
	Wed,  4 Sep 2019 10:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3AC89320
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 10:26:11 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190904102609euoutp0100bb9e49e0ff62cbe923f01d3f9a01e1~BNVF11kRs0148501485euoutp01L
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 10:26:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190904102609euoutp0100bb9e49e0ff62cbe923f01d3f9a01e1~BNVF11kRs0148501485euoutp01L
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190904102608eucas1p26201f187c81e621bb239fdfc6975b740~BNVFMh-UM0216002160eucas1p2h;
 Wed,  4 Sep 2019 10:26:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 85.0A.04469.0419F6D5; Wed,  4
 Sep 2019 11:26:08 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190904102607eucas1p1f227d880687febaa347642cc7196083b~BNVEcd5fY1509215092eucas1p1J;
 Wed,  4 Sep 2019 10:26:07 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190904102607eusmtrp2de533ad9b5d54e6c7821d3f067d488c7~BNVEOQo6Z3178231782eusmtrp2d;
 Wed,  4 Sep 2019 10:26:07 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-12-5d6f9140dcab
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 43.CF.04166.F319F6D5; Wed,  4
 Sep 2019 11:26:07 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190904102606eusmtip1eff3d45eba0d2fc67cb415a471045578~BNVDcPR-K1439914399eusmtip1Q;
 Wed,  4 Sep 2019 10:26:06 +0000 (GMT)
Subject: Re: [RFC][PATCH] drm: kirin: Fix dsi probe/attach logic
To: John Stultz <john.stultz@linaro.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <9d31af23-8a65-d8e8-b73d-b2eb815fcd6f@samsung.com>
Date: Wed, 4 Sep 2019 12:26:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLU5Ov+__b5gxnuMxQP1RLjndXkB4jAiGgmb-OMdaKePug@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjtdx/b1Zpep+JHidlI0sAX9LhkhVHCLSIqMiKRXHlTy03bVXv4
 R/awLDMyw3S6fDRTisxpthyjxJEm2kPz1QtnamW1RpqVPVyb18j/znfO+X7nO/CjcOkEOZdK
 UKZwKqU8USZyJu40TzwODM9Nig65+cmDyXncijFd41YR0/19BGfafwUyrZ+6CeZMrlbMPDMU
 ixhDfynGNJ2PYt6V/cCZqol6xLyueYSYCcMVgqmzniCYNyOVZLgra+3LFLNFGR0E26B+LWYH
 NTr7mFVIsg8vdGLsqx6jiNV/M5Nsf3YLxmrzu0VsY04ewRblvSHZsVqfzZKdzitjucSENE4V
 vDrGOb4x/zJKrnI5pNFn4xmoYvZZ5EQBvQRsza0iB5bSVQjuF/ifRc52/BXB2HAbKQxjCLQ1
 GuzfRu2xYUIQKhFc1f0UC4MFgc7yFTlc7nQ4fNS/Jx3Yg/aHMm035jDhdBcB5zLLxQ5BRAfA
 n7rnU+ESejU0ltdPLRP0QmhUT07FedI7YNRsIgWPG7QWDhEO7ERvAaP5J+7AOD0f9JbiaewF
 L4ZKpsKArqDg7Y1eQrh7HVgGe6Y7uMOHlttiAXuDraFkmj8K/VUncWE5C0F9TQMuCGFgaumw
 X0HZEwLgliFYoNeArbJa7KCBdoE+i5twgwtcvHMZF2gJZJ2SCu4F0P+ofvpBL6h4Oi66gGTq
 Gc3UM9qoZ7RR/88tRcR15MWl8oo4jg9VcgeDeLmCT1XGBe1JUtQi+4dsm2wZvYvGO3c3IZpC
 sjmSu5uU0VJSnsYfVjQhoHCZhyTSmBgtlcTKDx/hVEm7VKmJHN+E5lGEzEuSPsscJaXj5Cnc
 fo5L5lT/VIxympuB/Hon222r7g3pJk9kSq55HjQr/FYs3cj2FFAas5Ve5rTehvl+9g5Zu24k
 99T7EusTb+PSrl0x6coOl8D8gXcxEb8HFvkc8N0wuu/W3m3pYabyzxpTpP/y079PvhRnI9et
 o2Fr2YjSave4OdgeXyUT++XBSPR45GJjyqWcM3m27fxxGcHHy0MX4ype/hegPJzGjAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42I5/e/4XV37ifmxBstmSln0njvJZHHl63s2
 i6vfXzJbnPmta3HyzVUWi86JS9gtLu+aw2ax6/4CJotDfdEWzxf+YLZY8XMro8XdDWcZLX7u
 msdisfl9M4vFo5fLWR34Pd7faGX3mN1wkcVj56y77B6P524EcjtmsnqcmHCJyePOtT1sHtu/
 PWD1uN99nMljybSrbB4HeiezeMye/IjV4/MmuQDeKD2bovzSklSFjPziElulaEMLIz1DSws9
 IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MA9OmMxas4KuYu72buYFxKXcXIyeHhICJxKbG
 pyxdjFwcQgJLGSW6lzWzQyTEJXbPf8sMYQtL/LnWxQZR9JpR4t23nYwgCWEBB4nX21+wgtgi
 AhoSC5dcZQIpYha4xiLxbfIcRoiOc8wSU7fuAqtiE9CU+Lv5JhuIzStgJ3Fg0VawSSwCKhIH
 Zv1jArFFBSIkDu+YxQhRIyhxcuYTFhCbUyBQYs+DX2AnMQuoS/yZdwnKlpfY/nYOlC0ucevJ
 fKYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgQmhW3Hfm7e
 wXhpY/AhRgEORiUe3h1+ebFCrIllxZW5hxglOJiVRHhD9+TECvGmJFZWpRblxxeV5qQWH2I0
 BXpuIrOUaHI+MGHllcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpg
 NPHifix/ii/T4arDq73RKucczrGG/4sKfqfoYWp/cUUVV0Gh7rX0qa+v8lf/dqq+mBwts/jg
 XYXquWmrDuW/5bBw4HwnLbJho6et1lbm4h4XXWXRFW4eDit3lOuJ8ez232jZdIPd4fDuXQ3m
 KTrvRdbcUmzhbGbrzfOSqNIR/+DcsG/ajO1KLMUZiYZazEXFiQDjsvijIAMAAA==
X-CMS-MailID: 20190904102607eucas1p1f227d880687febaa347642cc7196083b
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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1567592769;
 bh=Coo8VjC8BbJP4Jab5IDQtcqQAThWSz0wl/NUTOmecc0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ILAbGWDA1nYrDgITbctBMbm85L5uvkp8KQsyWHX5ME58TgvDU7bAs1Cy4Mi2MtAav
 BACT9yPgkv7g8kj5KrTUeGGeC3KMP/eRHO0PowvyU6i7pube4s6Bgf8uBq+Z7KI4By
 WeifUFD6L4cZ/a3PAIO/bHn6sRQBInT2ePneBwGI=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
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

T24gMDMuMDkuMjAxOSAxODoxOCwgSm9obiBTdHVsdHogd3JvdGU6Cj4gT24gTW9uLCBTZXAgMiwg
MjAxOSBhdCA2OjIyIEFNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+IHdyb3Rl
Ogo+PiBPbiAzMC4wOC4yMDE5IDE5OjAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4+PiBPbiBUaHUsIEF1
ZyAyOSwgMjAxOSBhdCAxMTo1MiBQTSBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29t
PiB3cm90ZToKPj4+PiBPZiBjb3Vyc2UgaXQgc2VlbXMgeW91IGhhdmUgZGlmZmVyZW50IG9waW5p
b24gd2hhdCBpcyB0aGUgcmlnaHQgdGhpbmcgaW4KPj4+PiB0aGlzIGNhc2UsIHNvIGlmIHlvdSBj
b252aW5jZSB1cyB0aGF0IHlvdXIgYXBwcm9hY2ggaXMgYmV0dGVyIG9uZSBjYW4KPj4+PiByZXZl
cnQgdGhlIHBhdGNoLgo+Pj4gSSBndWVzcyBteSBzdHJvbmdlc3QgLyBtb3N0IGltbWVkaWF0ZSBv
cGluaW9uIGlzIHRvIG5vdCBicmVhayBvdGhlcgo+Pj4gZXhpc3RpbmcgYWR2NzV4eCBicmlkZ2Ug
dXNlcnMuCj4+Cj4+IEl0IGlzIHBpdHkgdGhhdCBicmVha2FnZSBoYXBwZW5lZCwgYW5kIG5leHQg
dGltZSB3ZSBzaG91bGQgYmUgbW9yZQo+PiBzdHJpY3QgYWJvdXQgdGVzdGluZyBvdGhlciBwbGF0
Zm9ybXMsIGJlZm9yZSBwYXRjaCBhY2NlcHRhbmNlLgo+Pgo+PiBCdXQgcmV2ZXJ0aW5nIGl0IG5v
dyB3aWxsIGJyZWFrIGFsc28gcGxhdGZvcm0gd2hpY2ggZGVwZW5kIG9uIGl0Lgo+IEknbSByZWFs
bHkgb2Ygbm8gb3BpbmlvbiBvZiB3aGljaCBhcHByb2FjaCBpcyBiZXR0ZXIgaGVyZSwgYnV0IEkg
d2lsbAo+IHNheSB0aGF0IHdoZW4gYSBwYXRjaCBicmVha3MgcHJldmlvdXNseSB3b3JraW5nIGJv
YXJkcywgdGhhdCdzIGEKPiByZWdyZXNzaW9uIGFuZCBqdXN0aWZ5aW5nIHRoYXQgc29tZSBvdGhl
ciBib2FyZCBpcyBub3cgZW5hYmxlZCB0aGF0Cj4gd291bGQgYmUgYnJva2VuIGJ5IHRoZSByZXZl
cnQgKG9mIGEgcGF0Y2ggdGhhdCBpcyBub3QgeWV0IHVwc3RyZWFtKQo+IGlzbid0IHJlYWxseSBh
IHN0cm9uZyBhcmd1bWVudC4KPgo+IEknbSBoYXBweSB0byB3b3JrIHdpdGggZm9sa3MgdG8gdHJ5
IHRvIGZpeHVwIHRoZSBraXJpbiBkcml2ZXIgaWYgdGhpcwo+IHBhdGNoIHJlYWxseSBpcyB0aGUg
cmlnaHQgYXBwcm9hY2gsIGJ1dCB3ZSBuZWVkIHNvbWVvbmUgdG8gZG8gdGhlIHNhbWUKPiBmb3Ig
dGhlIGRiNDEwYywgYW5kIEkgZG9uJ3QgdGhpbmsgaXRzIGZhaXIgdG8ganVzdCBkdW1wIHRoYXQg
d29yayBvbnRvCj4gZm9sa3MgdW5kZXIgdGhlIHRocmVhdCBvZiB0aGUgYm9hcmQgYnJlYWtpbmcu
CgoKVGhlc2UgZHJpdmVycyBzaG91bGQgYmUgZml4ZWQgYW55d2F5IC0gYXNzdW1wdGlvbiB0aGF0
CmRybV9icmlkZ2UvZHJtX3BhbmVsIHdpbGwgYmUgcmVnaXN0ZXJlZCBiZWZvcmUgdGhlIGJ1cyBp
dCBpcyBhdHRhY2hlZCB0bwppcyBqdXN0IGluY29ycmVjdC4KClNvIGluc3RlYWQgb2YgcmV2ZXJ0
aW5nLCBmaXhpbmcgYW5kIHRoZW4gcmUtYXBwbHlpbmcgdGhlIHBhdGNoIEkgaGF2ZQpnZW50bHkg
cHJvcG9zZWQgc2hvcnRlciBwYXRoLiBJZiB5b3UgcHJlZmVyIGxvbmcgcGF0aCB3ZSBjYW4gdHJ5
IHRvIGdvCnRoaXMgd2F5LgoKTWF0dCwgaXMgdGhlIHB1cmUgcmV2ZXJ0IE9LIGZvciB5b3Ugb3Ig
aXMgaXQgcG9zc2libGUgdG8gcHJlcGFyZSBzb21lCndvcmthcm91bmQgYWxsb3dpbmcgY29vcGVy
YXRpb24gd2l0aCBib3RoIGFwcHJvYWNoZXM/CgoKUmVnYXJkcwoKQW5kcnplagoKCj4KPiB0aGFu
a3MKPiAtam9obgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
