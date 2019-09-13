Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 687A9B19E6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 10:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433E86EEDD;
	Fri, 13 Sep 2019 08:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9986EEDD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 08:47:21 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190913084720euoutp018e483dd75b45bc8bb45c7c3494ce7a88~D8yYmuFNK2267622676euoutp01h
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 08:47:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190913084720euoutp018e483dd75b45bc8bb45c7c3494ce7a88~D8yYmuFNK2267622676euoutp01h
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190913084719eucas1p13dd58e4dc9a40d174f07f71221dfcdce~D8yX10TT02512225122eucas1p1X;
 Fri, 13 Sep 2019 08:47:19 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 1A.5A.04374.7975B7D5; Fri, 13
 Sep 2019 09:47:19 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190913084718eucas1p1ddebd180b28385b21873144dfdaccc57~D8yW_3pEY2930829308eucas1p1x;
 Fri, 13 Sep 2019 08:47:18 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190913084718eusmtrp1f4c3830eba1d66ec5047d67dfa572e37~D8yWwLvQY2570325703eusmtrp1d;
 Fri, 13 Sep 2019 08:47:18 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-90-5d7b579784a9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 7F.C4.04117.6975B7D5; Fri, 13
 Sep 2019 09:47:18 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190913084717eusmtip20eec82ae46ffc257da69575ea68a8e64~D8yWEbZkx1334313343eusmtip2x;
 Fri, 13 Sep 2019 08:47:17 +0000 (GMT)
Subject: Re: [RFC][PATCH] drm: kirin: Fix dsi probe/attach logic
To: Matt Redfearn <matt.redfearn@thinci.com>, John Stultz
 <john.stultz@linaro.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <084ab580-8ba8-b018-bc7a-bd705027f200@samsung.com>
Date: Fri, 13 Sep 2019 10:47:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <00e4f553-a02c-6d98-a0e8-28c0183a3c8c@thinci.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUyMcRz3u+flnuLscZW+81Jzw+YlMWY/I6PZPH+0+MOWoXHxuKIu7lF6
 +cOZkJRdarUu9CLrZJTO9TZZLqSpSNIbLmlUSpZKt0ru8dT03+ft+/t+P9uPIZQT1CImRHuG
 12nVoSramSx5YX/tlR4QG7j+fLoLTmqoleGfplyE340M0rj5dy+B68a9cG1/M4mvJOfJcVPF
 DRpX2LJl2HrtIP6WM0Zgk92C8MeieoTtFbdIbB68QOKu3nxqB8sNtl6Uc5n6RpIrN36Uc19u
 PnTQ+AyKe2l4K+M+vH9Mc6WjnRRnu1oj4/LSmmmuKimF5DJTuijuV7HHXsUB523H+NCQSF7n
 vf2Ic3BGx8lTdSuj7rUMU3r03CMBOTHAboK+4Rw6ATkzStaEYOynRSaRYQTW8VYkkV8IEpsK
 qJkRU1wxJRn5CPqtX6fJAILHcVNITLmwO+B7aY/DYBhXdh80564XMwT7hoRno3ZCzNDsKpg0
 t9EiVrDboeplGRLzJLsC+n7MFWU3dj8MdVZTUmQB1GZ0kyJ2csTbC9PkIiZYT7hgySQk7A7t
 3Vn/KgB7nwFzvG366l1gGOuaxi7QV/NILuEl8ColkZTwObCZ4ghpOB6BpaickIytUF3T+K8M
 4Ti6sMJbknfCVP4DuSgDOx9aBxZIN8yH6yXphCQrIP6SUkovA1u9ZfpBd7jzZoQ2IJVxVjPj
 rDbGWW2M//dmI7IAufMRQpiGFzZq+bPrBHWYEKHVrDsaHlaMHH/y1Z+akTL0ZCLIilgGqeYp
 8NqYQCWljhSiw6wIGELlqvDrjw5UKo6po2N4XfhhXUQoL1jRYoZUuSti53QeVLIa9Rn+JM+f
 4nUzroxxWqRHS0/7MLoPvkUdoT3LnPSu5s8hR5PCTzQlxCgrrVnLKw8N4OTbZX/ycs43rqmT
 +0Jdakt9g5uNb+OFu0JVPmP03NNjCBqqrmp72rFtSsNvXv1Jm1puqEYL9ZsKQwIiorMrCY8t
 9ZfTT+/2Y1LGXcfmePofzymftEeaffwLoko1KlIIVm9YTegE9V+4sB/sjwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsVy+t/xe7rTwqtjDW7uFbPoPXeSyeLDikWM
 Fle+vmezuPr9JbPFmd+6FiffXGWx6Jy4hN3i8q45bBa77i9gsjjUF23xfOEPZosVP7cyWtzd
 cJbR4ueueSwWm983s1g8ermc1UHA4/2NVnaP2Q0XWTx2zrrL7vF47kYgt2Mmq8eJCZeYPO5c
 28Pmsf3bA1aP+93HmTyWTLvK5nGgdzKLx+zJj1g9Pm+SC+CN0rMpyi8tSVXIyC8usVWKNrQw
 0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MuYeTu74IxaxerrX1gbGI/KdTFyckgI
 mEisaNnE2sXIxSEksJRRYsfNu0wQCXGJ3fPfMkPYwhJ/rnWxQRS9ZpS4dGwbWJGwgIPE6+0v
 WEFsEYEQiRk9T8EmMQtcYpGY8fwpVMdmVomtS2aAjWIT0JT4u/kmG4jNK2AnceDEDsYuRg4O
 FgFViVfvuEHCogIREod3zGKEKBGUODnzCQuIzQlUfmv9NHYQm1lAXeLPvEvMELa8RPPW2VC2
 uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kRmBq2
 Hfu5BejUd8GHGAU4GJV4eC10qmKFWBPLiitzDzFKcDArifD6vKmMFeJNSaysSi3Kjy8qzUkt
 PsRoCvTbRGYp0eR8YNrKK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TB
 KdXAyFI87+Gur7fLt06x1bWrWnji0dccxnLxl5cPl/hXrU68/K3l1DON9ZPlfqhM/3BkQ5R5
 LceSV+c6mHb2MjsK75z/9ybn9PvnLh9ctNVkgVWfD8OyC78us9zT5L50WHcHT5DxPh3GA3c9
 Sz9/Ul4X+bukLSv2hsrnEypXFNUlwx8unrQgPvu35CclluKMREMt5qLiRABEaVwuIwMAAA==
X-CMS-MailID: 20190913084718eucas1p1ddebd180b28385b21873144dfdaccc57
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
 <16c9066b-091f-6d0e-23f1-2c1f83a7da1b@samsung.com>
 <00e4f553-a02c-6d98-a0e8-28c0183a3c8c@thinci.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568364440;
 bh=pHzQlbDo1C4cXmBS7A3CPSHtIvcSShpbfes0/svvBAk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=IQZ3Bhb7LDMPNUMHIk2lfvY63nLiQDJln2N9hGBybTPIBWde9NjzU6YpQ0Op/ygi8
 c/fJq43NH5m6fF8+104+Sn1qlBuqYw8ZZnLTvITUu0O1AVsVb1js8mgUZ3evk0g86I
 G5Og1+b5SKTebiE50AvNsmaPTRgl9pHrkAdUzdTU=
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
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIuMDkuMjAxOSAxNjoxOCwgTWF0dCBSZWRmZWFybiB3cm90ZToKPgo+IE9uIDEyLzA5LzIw
MTkgMTQ6MjEsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4+IE9uIDEyLjA5LjIwMTkgMDQ6MzgsIEpv
aG4gU3R1bHR6IHdyb3RlOgo+Pj4gT24gV2VkLCBTZXAgNCwgMjAxOSBhdCAzOjI2IEFNIEFuZHJ6
ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Pj4+IE9uIDAzLjA5LjIwMTkg
MTg6MTgsIEpvaG4gU3R1bHR6IHdyb3RlOgo+Pj4+PiBPbiBNb24sIFNlcCAyLCAyMDE5IGF0IDY6
MjIgQU0gQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4+Pj4+PiBP
biAzMC4wOC4yMDE5IDE5OjAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4+Pj4+Pj4gT24gVGh1LCBBdWcg
MjksIDIwMTkgYXQgMTE6NTIgUE0gQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4g
d3JvdGU6Cj4+Pj4+Pj4+IE9mIGNvdXJzZSBpdCBzZWVtcyB5b3UgaGF2ZSBkaWZmZXJlbnQgb3Bp
bmlvbiB3aGF0IGlzIHRoZSByaWdodCB0aGluZyBpbgo+Pj4+Pj4+PiB0aGlzIGNhc2UsIHNvIGlm
IHlvdSBjb252aW5jZSB1cyB0aGF0IHlvdXIgYXBwcm9hY2ggaXMgYmV0dGVyIG9uZSBjYW4KPj4+
Pj4+Pj4gcmV2ZXJ0IHRoZSBwYXRjaC4KPj4+Pj4+PiBJIGd1ZXNzIG15IHN0cm9uZ2VzdCAvIG1v
c3QgaW1tZWRpYXRlIG9waW5pb24gaXMgdG8gbm90IGJyZWFrIG90aGVyCj4+Pj4+Pj4gZXhpc3Rp
bmcgYWR2NzV4eCBicmlkZ2UgdXNlcnMuCj4+Pj4+PiBJdCBpcyBwaXR5IHRoYXQgYnJlYWthZ2Ug
aGFwcGVuZWQsIGFuZCBuZXh0IHRpbWUgd2Ugc2hvdWxkIGJlIG1vcmUKPj4+Pj4+IHN0cmljdCBh
Ym91dCB0ZXN0aW5nIG90aGVyIHBsYXRmb3JtcywgYmVmb3JlIHBhdGNoIGFjY2VwdGFuY2UuCj4+
Pj4+Pgo+Pj4+Pj4gQnV0IHJldmVydGluZyBpdCBub3cgd2lsbCBicmVhayBhbHNvIHBsYXRmb3Jt
IHdoaWNoIGRlcGVuZCBvbiBpdC4KPj4+Pj4gSSdtIHJlYWxseSBvZiBubyBvcGluaW9uIG9mIHdo
aWNoIGFwcHJvYWNoIGlzIGJldHRlciBoZXJlLCBidXQgSSB3aWxsCj4+Pj4+IHNheSB0aGF0IHdo
ZW4gYSBwYXRjaCBicmVha3MgcHJldmlvdXNseSB3b3JraW5nIGJvYXJkcywgdGhhdCdzIGEKPj4+
Pj4gcmVncmVzc2lvbiBhbmQganVzdGlmeWluZyB0aGF0IHNvbWUgb3RoZXIgYm9hcmQgaXMgbm93
IGVuYWJsZWQgdGhhdAo+Pj4+PiB3b3VsZCBiZSBicm9rZW4gYnkgdGhlIHJldmVydCAob2YgYSBw
YXRjaCB0aGF0IGlzIG5vdCB5ZXQgdXBzdHJlYW0pCj4+Pj4+IGlzbid0IHJlYWxseSBhIHN0cm9u
ZyBhcmd1bWVudC4KPj4+Pj4KPj4+Pj4gSSdtIGhhcHB5IHRvIHdvcmsgd2l0aCBmb2xrcyB0byB0
cnkgdG8gZml4dXAgdGhlIGtpcmluIGRyaXZlciBpZiB0aGlzCj4+Pj4+IHBhdGNoIHJlYWxseSBp
cyB0aGUgcmlnaHQgYXBwcm9hY2gsIGJ1dCB3ZSBuZWVkIHNvbWVvbmUgdG8gZG8gdGhlIHNhbWUK
Pj4+Pj4gZm9yIHRoZSBkYjQxMGMsIGFuZCBJIGRvbid0IHRoaW5rIGl0cyBmYWlyIHRvIGp1c3Qg
ZHVtcCB0aGF0IHdvcmsgb250bwo+Pj4+PiBmb2xrcyB1bmRlciB0aGUgdGhyZWF0IG9mIHRoZSBi
b2FyZCBicmVha2luZy4KPj4+PiBUaGVzZSBkcml2ZXJzIHNob3VsZCBiZSBmaXhlZCBhbnl3YXkg
LSBhc3N1bXB0aW9uIHRoYXQKPj4+PiBkcm1fYnJpZGdlL2RybV9wYW5lbCB3aWxsIGJlIHJlZ2lz
dGVyZWQgYmVmb3JlIHRoZSBidXMgaXQgaXMgYXR0YWNoZWQgdG8KPj4+PiBpcyBqdXN0IGluY29y
cmVjdC4KPj4+Pgo+Pj4+IFNvIGluc3RlYWQgb2YgcmV2ZXJ0aW5nLCBmaXhpbmcgYW5kIHRoZW4g
cmUtYXBwbHlpbmcgdGhlIHBhdGNoIEkgaGF2ZQo+Pj4+IGdlbnRseSBwcm9wb3NlZCBzaG9ydGVy
IHBhdGguIElmIHlvdSBwcmVmZXIgbG9uZyBwYXRoIHdlIGNhbiB0cnkgdG8gZ28KPj4+PiB0aGlz
IHdheS4KPj4+Pgo+Pj4+IE1hdHQsIGlzIHRoZSBwdXJlIHJldmVydCBPSyBmb3IgeW91IG9yIGlz
IGl0IHBvc3NpYmxlIHRvIHByZXBhcmUgc29tZQo+Pj4+IHdvcmthcm91bmQgYWxsb3dpbmcgY29v
cGVyYXRpb24gd2l0aCBib3RoIGFwcHJvYWNoZXM/Cj4+PiBSb2IvQW5kcnplajogV2hhdCdzIHRo
ZSBjYWxsIGhlcmU/Cj4+Pgo+Pj4gU2hvdWxkIEkgcmVzdWJtaXQgdGhlIGtpcmluIGZpeCBmb3Ig
dGhlIGFkdjc1MTEgcmVncmVzc2lvbiBoZXJlPwo+Pj4gT3IgZG8gd2UgcmV2ZXJ0IHRoZSBhZHY3
NTExIHBhdGNoPyBJIGJlbGlldmUgZGI0MTBjIHN0aWxsIG5lZWRzIGEgZml4Lgo+Pj4KPj4+IEkn
ZCBqdXN0IGxpa2UgdG8ga2VlcCB0aGUgSGlLZXkgYm9hcmQgZnJvbSBicmVha2luZywgc28gbGV0
IG1lIGtub3cgc28KPj4+IEkgY2FuIGdldCB0aGUgZml4IHN1Ym1pdHRlZCBpZiBuZWVkZWQuCj4+
Cj4+IFNpbmNlIHRoZXJlIGlzIG5vIHJlc3BvbnNlIGZyb20gTWF0dCwgd2UgY2FuIHBlcmZvcm0g
cmV2ZXJ0LCBzaW5jZSB0aGVyZQo+PiBhcmUgbm8gb3RoZXIgaWRlYXMuIEkgd2lsbCBhcHBseSBp
dCB0b21vcnJvdywgaWYgdGhlcmUgYXJlIG5vIG9iamVjdGlvbnMuCj4gSGksCj4KPiBTb3JyeSAt
IHllYWggSSB0aGluayByZXZlcnRpbmcgaXMgcHJvYmFibHkgYmVzdCBhdCB0aGlzIHBvaW50IHRv
IGF2b2lkIAo+IGJyZWFraW5nIGluLXRyZWUgcGxhdGZvcm1zLgo+IEl0J3MgYSBzaGFtZSB0aG91
Z2ggdGhhdCB0aGVyZSBpcyBhIGJ1aWx0LWluIGluY29tcGF0aWJpbGl0eSB3aXRoaW4gdGhlIAo+
IHRyZWUgYmV0d2VlbiBkcml2ZXJzLgoKClF1aXRlIGNvbW1vbiBpbiBkZXZlbG9wbWVudCAtIHNv
bWUgaXNzdWVzIGJlY29tZXMgdmlzaWJsZSBhZnRlciBzb21lIHRpbWUuCgo+IFRoZSB3YXkgdGhh
dCB0aGUgZ2VuZXJpYyBTeW5vcHN5cyBEU0kgaG9zdCBkcml2ZXIgCj4gcHJvYmVzIGlzIGN1cnJl
bnRseSBpbmNvbXBhdGlibGUgd2l0aCB0aGUgQURWNzUzMyAoaGVuY2UgdGhlIHBhdGNoKSwgCj4g
b3RoZXIgRFNJIGhvc3QgZHJpdmVycyBhcmUgbm93IGNvbXBhdGlibGUgd2l0aCB0aGUgQURWNzUz
MyBidXQgYnJlYWsgCj4gd2hlbiB3ZSBjaGFuZ2UgaXQgdG8gcHJvYmUgaW4gYSBzaW1pbGFyIHdh
eSB0byBwYW5lbCBkcml2ZXJzLgoKCjEuIFRoZSBiZWhhdmlvciBzaG91bGQgYmUgY29uc2lzdGVu
dCBiZXR3ZWVuIGFsbCBob3N0cy9kZXZpY2UgZHJpdmVycy4KCjIuIERTSSBjb250cm9sbGVkIGRl
dmljZXMgY2FuIGV4cG9zZSBkcm0gb2JqZWN0cyAoZHJtX2JyaWRnZS9kcm1fcGFuZWwpCm9ubHkg
d2hlbiB0aGV5IGNhbiBwcm9iZSwgaWUgRFNJIGJ1cyB0aGV5IHNpdCBvbiBtdXN0IGJlIGNyZWF0
ZWQgMXN0LgoKMSBhbmQgMiBlbmZvcmNlcyBwb2xpY3kgdGhhdCBhbGwgaG9zdCBkcml2ZXJzIHNo
b3VsZCAxc3QgY3JlYXRlIGNvbnRyb2wKYnVzIChEU0kgaW4gdGhpcyBjYXNlKSB0aGVuIGxvb2sg
Zm9yIGhpZ2hlciBsZXZlbCBvYmplY3RzCihkcm1fYnJpZGdlL2RybV9wYW5lbCkuCgpBcyBhIGNv
bnNlcXVlbmNlIGFsbCBicmlkZ2VzIGFuZCBwYW5lbHMgc2hvdWxkIDFzdCBnYXRoZXIgdGhlIHJl
c291cmNlcwp0aGV5IGRlcGVuZHMgb24sIGFuZCB0aGVuIHRoZXkgY2FuIGV4cG9zZSBoaWdoZXIg
bGV2ZWwgb2JqZWN0cy4KCgo+Cj4+IEFuZCBmb3IgdGhlIGZ1dHVyZTogSSBndWVzcyBpdCBpcyBu
b3QgcG9zc2libGUgdG8gbWFrZSBhZHYgd29yayB3aXRoIG9sZAo+PiBhbmQgbmV3IGFwcHJvYWNo
LCBidXQgc2ltcGxlIHdvcmthcm91bmQgZm9yIGFkdiBjb3VsZCBiZSBhZGRlZCBsYXRlcjoKPj4K
Pj4gaWYgKHNvdXJjZSBpcyBtc20gb3Iga2lyaW4pCj4+Cj4+ICDCoMKgwqAgZG9fdGhlX29sZF93
YXkKPj4KPj4gZWxzZQo+Pgo+PiAgwqDCoMKgIGRvX2NvcnJlY3RseS4KPiBNYXliZSB0aGlzIHdv
dWxkIHdvcmssIGJ1dCBob3cgZG8gd2Uga25vdyB0aGF0IHRoZSBsaXN0ICJtc20gb3Iga2lyaW4i
IAo+IGlzIGV4aGF1c3RpdmUgdG8gY29wZSB3aXRoIGFsbCBwbGF0Zm9ybXM/CgoKQnkgY2hlY2tp
bmcgZHRzL2NvbmZpZyBmaWxlcy4KCgo+IEl0IHNlZW1zIHRvIG1lIHRoZSBidWlsdCBpbiAKPiBp
bmNvbXBhdGliaWxpdHkgYmV0d2VlbiBEU0kgaG9zdHMgbmVlZHMgdG8gYmUgcmVzb2x2ZWQgcmVh
bGx5IHJhdGhlciAKPiB0aGFuIHRyeWluZyB0byB3b3JrIGFyb3VuZCBpdCBpbiB0aGUgQURWNzUz
MyBkcml2ZXIgKGFuZCBhbnkgb3RoZXIgRFNJIAo+IGJ1cyBkZXZpY2UgdGhhdCBmYWxscyBpbnRv
IHRoaXMgdHJhcCkuCgoKSWYgeW91IGtub3cgaG93LCBwbGVhc2UgZGVzY3JpYmUuIEF0bSB0aGUg
b25seSByZWFsIHNvbHV0aW9uIEkgc2VlIGlzCmV4cGxpY2l0IHdvcmthcm91bmQgdG8gYWxsb3cg
bmV3IGFkdjc1MTEsIHRoZW4gZml4aW5nIGNvbnRyb2xsZXJzLAp0b2dldGhlciB3aXRoIHdvcmth
cm91bmQtcmVtb3ZhbC4KCk9LLCBpdCBjb3VsZCBiZSBwb3NzaWJsZSB0byBjaGFuZ2UgbXNtLCBr
aXJpbiBhbmQgYWR2IGluIG9uZSBwYXRjaCwKaG93ZXZlciBJIGFtIG5vdCBzdXJlIGlmIHRoaXMg
aXMgdGhlIGJlc3Qgc29sdXRpb24uCgoKUmVnYXJkcwoKQW5kcnplagoKCj4KPiBBbnl3YXksIG15
IHBsYXRmb3JtIGlzIG91dCBvZiB0cmVlIHNvIGJldHRlciB0byByZXZlcnQgbXkgcGF0Y2ggYW5k
IGtlZXAgCj4gdGhlIGluLXRyZWUgcGxhdGZvcm1zIHdvcmtpbmcuCj4KPiBUaGFua3MgZXZlcnlv
bmUuCj4gTWF0dAo+Cj4+Cj4+IEFuZCByZW1vdmUgaXQgYWZ0ZXIgZml4aW5nIGJvdGggZHNpIG1h
c3RlcnMuCj4+Cj4+Cj4+IFJlZ2FyZHMKPj4KPj4gQW5kcnplago+Pgo+Pgo+Pj4gdGhhbmtzCj4+
PiAtam9obgo+Pj4KPj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
