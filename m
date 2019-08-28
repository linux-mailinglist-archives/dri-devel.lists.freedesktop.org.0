Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CACCB9FB1C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 09:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87A989C08;
	Wed, 28 Aug 2019 07:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBC589C08
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 07:05:29 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190828070527euoutp01837ca95c6c572010c1526e44a7cb8e49~-BE3LSt1-1429214292euoutp01R
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 07:05:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190828070527euoutp01837ca95c6c572010c1526e44a7cb8e49~-BE3LSt1-1429214292euoutp01R
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190828070526eucas1p12866871b88ee67f39c0608dc0787eb9e~-BE2kRYe41674316743eucas1p1q;
 Wed, 28 Aug 2019 07:05:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 08.F3.04309.6B7266D5; Wed, 28
 Aug 2019 08:05:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190828070526eucas1p1fccb58fbcc93f7200036fe5fb5ca704e~-BE114Juh1674516745eucas1p1g;
 Wed, 28 Aug 2019 07:05:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190828070525eusmtrp227e32f65b4011c51410f5f0ecd5cece0~-BE1npTIa0537705377eusmtrp2F;
 Wed, 28 Aug 2019 07:05:25 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-f8-5d6627b6d644
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 12.86.04166.5B7266D5; Wed, 28
 Aug 2019 08:05:25 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190828070524eusmtip19ce0d026fd8f0bef8d41b1dde5961759~-BE0xPIZn1305513055eusmtip1b;
 Wed, 28 Aug 2019 07:05:24 +0000 (GMT)
Subject: Re: [PATCH v2] drm/bridge: adv7511: Attach to DSI host at probe time
To: John Stultz <john.stultz@linaro.org>, Matt Redfearn
 <matt.redfearn@thinci.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <7b7736ed-6cf1-d7ab-ae03-83b70b351261@samsung.com>
Date: Wed, 28 Aug 2019 09:05:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLVtzQSgVL0B0M2RNB_U-TvNs7+C=k6VUk0VJywdgJbNFQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUgTcRjH/e3utttwei5jDxWFq+iNrKTiIIuiiKMXSuiPKKSWXWq5aVur
 LDBBC1tpOkHxJr6UlUmo5Jy5ImIDlzYlK8O0MRsWudKoOXP0snbeIv/7PC/f3/N8H34kpvhE
 zCMztWdYnVadpRLLcGtXsG+1ddmJ1LWOp0vp4r5uEf068FVMD/wYw2jXz9V095cBnL5a1iCh
 X9mqxbTNUyeiO2paRbS95DDdGGxHtLu1F9FBWw2+Vc58HbwsYcz5/TjTybnDVFRFMM9KX4qY
 d28ei5mOqRGC8VxzipiGigEx87S4HGfM5V6C8T9YuD/6kCz5OJuVeZbVrdlyVJbR3VSJ5bxV
 nh9rTMxHkwojkpJArYepll7CiGSkgmpEUFvnFwnBJILmEjcmBH4EZpsZNyJyRlJhIYX8XQT1
 H1wR+TgCrrlYwjfNofYB1xXLj4inDsCExYL4HowKYXDLO4DxBTG1An63vRXzLKe2QI/9O8Ez
 Ti2Fil/mGZ5LHYTvIw5C6ImD7qpRnGcplQL1hSYJzxi1CDrGqzGBlTA0WjtjAagyEv4MfsME
 ozuguqkgwnPA57RIBF4AoU5ewPMl8DQWYoK4CEF7a2dEsAkczn6Cd4aFt26xrRHS22D66jAh
 XCUGBsfjhB1iwGStxIS0HIquRE6dAJ7e9siDSrj9IiAuRSpuljNulhtulhvu/9w6hDchJWvQ
 a9JZfZKWPZeoV2v0Bm16Ylq25gEK/7/nf5yTD5Ht1zE7okikipYXxbKpCkJ9Vp+rsSMgMVW8
 3LsknJIfV+deYHXZR3SGLFZvR/NJXKWUX4waOayg0tVn2FMsm8Pq/lVFpHRePtq0J0Qne678
 zts4far85ohXnqzR3bhc/nD5+Fjfjvie4VYi5CgY3nk6UJJ3L7g9t6SQ8lkfTZke3a4Y5Wpd
 XRcPVWY3F6YZDLI2WdIXl+9kapLaN/Fxg+p+ypDRHfiM+WtiV7XMleiWpHjfP9m117Q71Mtp
 +xOu35FtXizNjCJVuD5DvW4lptOr/wLa8C3uewMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDIsWRmVeSWpSXmKPExsVy+t/xu7pb1dNiDb7P0rXoPXeSyeLK1/ds
 Fle/v2S2OPNb1+Lkm6ssFp0Tl7BbXN41h81i1/0FTBbb521gsjjUF22x4udWRou7G84yWvzc
 NY/Fgdfj/Y1Wdo/ZDRdZPHbOugtkdcxk9Tgx4RKTx51re9g8tn97wOpxv/s4k8eSaVfZPA70
 TmbxmD35EavH501yATxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYp
 qTmZZalF+nYJehknV01nLrgpXvFyhV4D4xehLkYODgkBE4lpWzi6GLk4hASWMkpM23GeqYuR
 EyguLrF7/ltmCFtY4s+1LjaIoteMEk/O/gNLCAv4Sny6vYsRxBYRCJF4fPo7C0gRs0Aji8TR
 9h52iI55TBKP7k9hB6liE9CU+Lv5JhuIzStgJ3Hq0CdWEJtFQFVi2p/ZYLaoQITE4R2zGCFq
 BCVOznzCAmJzCgRKLGyZBDaHWUBd4s+8S8wQtrzE9rdzoGxxiVtP5jNNYBSahaR9FpKWWUha
 ZiFpWcDIsopRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMw5rcd+7l5B+OljcGHGAU4GJV4eDv4
 U2OFWBPLiitzDzFKcDArifA+UgEK8aYkVlalFuXHF5XmpBYfYjQFem4is5Rocj4wHeWVxBua
 GppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamA01E+Mep+h4FUw0yr87rEQ
 x52OGfcTH4b9/LhxbcDup3eKV21T9D+1xWHbJqHlF1qbuJ68jrGLif5yr3h6nMP5RQ+LClO2
 GldOTNq94pJ0e82nzt9SjstvOCdnpXvk1bQHKBVkty76z5u3pDfxjnnFtnM3DpxaxJ+uoT7j
 zP2Uj6KHtpxbKnhHiaU4I9FQi7moOBEA18FlyQ8DAAA=
X-CMS-MailID: 20190828070526eucas1p1fccb58fbcc93f7200036fe5fb5ca704e
X-Msg-Generator: CA
X-RootMTR: 20190827200326epcas3p4628e49747ff7e20b5451cb6e33235dc6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190827200326epcas3p4628e49747ff7e20b5451cb6e33235dc6
References: <20190627151740.2277-1-matt.redfearn@thinci.com>
 <CALAqxLUsf4HJBcAcd+qzycFC3d8XbKk9HyQ7FfCrH8Ewc3mzvw@mail.gmail.com>
 <CGME20190827200326epcas3p4628e49747ff7e20b5451cb6e33235dc6@epcas3p4.samsung.com>
 <CALAqxLVtzQSgVL0B0M2RNB_U-TvNs7+C=k6VUk0VJywdgJbNFQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566975927;
 bh=+4QUB6YY3idoooDaRl8HVCPEO87XwDwtGkwseO7KXcs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=mMoCqm6LmkqsomnizrfLRbdCZJC3j4Jpp62WSVFWcxvcaWZvnusQpAmi4Lw8rTQfE
 CAdwC52DyVH/C346C6zgfrbFGQlitjgOOcOpmOXAbgRyYNeqwywAjihnOk7gAcdyhL
 LvyWHj4O2QOPeTWjTUWQxKKv1gsIKuLTF2zuuYuk=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Redfearn <matthew.redfearn@thinci.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcuMDguMjAxOSAyMjowMywgSm9obiBTdHVsdHogd3JvdGU6Cj4gT24gTW9uLCBBdWcgMTks
IDIwMTkgYXQgMzoyNyBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4gd3Jv
dGU6Cj4+IE9uIFRodSwgSnVuIDI3LCAyMDE5IGF0IDg6MTggQU0gTWF0dCBSZWRmZWFybiA8bWF0
dC5yZWRmZWFybkB0aGluY2kuY29tPiB3cm90ZToKPj4+IEluIGNvbnRyYXN0IHRvIGFsbCBvZiB0
aGUgRFNJIHBhbmVsIGRyaXZlcnMgaW4gZHJpdmVycy9ncHUvZHJtL3BhbmVsCj4+PiB3aGljaCBh
dHRhY2ggdG8gdGhlIERTSSBob3N0IHZpYSBtaXBpX2RzaV9hdHRhY2goKSBhdCBwcm9iZSB0aW1l
LCB0aGUKPj4+IEFEVjc1MzMgYnJpZGdlIGRldmljZSBkb2VzIG5vdC4gSW5zdGVhZCBpdCBkZWZl
cnMgdGhpcyB0byB0aGUgcG9pbnQgdGhhdAo+Pj4gdGhlIHVwc3RyZWFtIGRldmljZSBjb25uZWN0
cyB0byBpdHMgYnJpZGdlIHZpYSBkcm1fYnJpZGdlX2F0dGFjaCgpLgo+Pj4gVGhlIGdlbmVyaWMg
U3lub3BzeXMgTUlQSSBEU0kgaG9zdCBkcml2ZXIgZG9lcyBub3QgcmVnaXN0ZXIgaXQncyBvd24K
Pj4+IGRybV9icmlkZ2UgdW50aWwgdGhlIE1JUEkgRFNJIGhhcyBhdHRhY2hlZC4gQnV0IGl0IGRv
ZXMgbm90IGNhbGwKPj4+IGRybV9icmlkZ2VfYXR0YWNoKCkgb24gdGhlIGRvd25zdHJlYW0gZGV2
aWNlIHVudGlsIHRoZSB1cHN0cmVhbSBkZXZpY2UKPj4+IGhhcyBhdHRhY2hlZC4gVGhpcyBsZWFk
cyB0byBhIGNoaWNrZW4gYW5kIHRoZSBlZ2cgZmFpbHVyZSBhbmQgdGhlIERSTQo+Pj4gcGlwZWxp
bmUgZG9lcyBub3QgY29tcGxldGUuCj4+PiBTaW5jZSBhbGwgb3RoZXIgbWlwaV9kc2lfZGV2aWNl
IGRyaXZlcnMgY2FsbCBtaXBpX2RzaV9hdHRhY2goKSBpbgo+Pj4gcHJvYmUoKSwgbWFrZSB0aGUg
YWR2NzUzMyBtaXBpX2RzaV9kZXZpY2UgZG8gdGhlIHNhbWUuIFRoaXMgZW5zdXJlcyB0aGF0Cj4+
PiB0aGUgU3lub3BzeXMgTUlQSSBEU0kgaG9zdCByZWdpc3RlcnMgaXQncyBicmlkZ2Ugc3VjaCB0
aGF0IGl0IGlzCj4+PiBhdmFpbGFibGUgZm9yIHRoZSB1cHN0cmVhbSBkZXZpY2UgdG8gY29ubmVj
dCB0by4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJlZGZlYXJuIDxtYXR0LnJlZGZlYXJu
QHRoaW5jaS5jb20+Cj4+Pgo+Pj4gLS0tCj4+IEFzIGEgaGVhZHMgdXAsIEkganVzdCBkaWQgc29t
ZSB0ZXN0aW5nIG9uIGRybS1taXNjLW5leHQgYW5kIHRoaXMgcGF0Y2gKPj4gc2VlbXMgdG8gYmUg
YnJlYWtpbmcgdGhlIEhpS2V5IGJvYXJkLiAgT24gYm9vdHVwLCBJJ20gc2VlaW5nOgo+PiBbICAg
IDQuMjA5NjE1XSBhZHY3NTExIDItMDAzOTogMi0wMDM5IHN1cHBseSBhdmRkIG5vdCBmb3VuZCwg
dXNpbmcKPj4gZHVtbXkgcmVndWxhdG9yCj4+IFsgICAgNC4yMTcwNzVdIGFkdjc1MTEgMi0wMDM5
OiAyLTAwMzkgc3VwcGx5IGR2ZGQgbm90IGZvdW5kLCB1c2luZwo+PiBkdW1teSByZWd1bGF0b3IK
Pj4gWyAgICA0LjIyNDQ1M10gYWR2NzUxMSAyLTAwMzk6IDItMDAzOSBzdXBwbHkgcHZkZCBub3Qg
Zm91bmQsIHVzaW5nCj4+IGR1bW15IHJlZ3VsYXRvcgo+PiBbICAgIDQuMjMxODA0XSBhZHY3NTEx
IDItMDAzOTogMi0wMDM5IHN1cHBseSBhMnZkZCBub3QgZm91bmQsIHVzaW5nCj4+IGR1bW15IHJl
Z3VsYXRvcgo+PiBbICAgIDQuMjM5MjQyXSBhZHY3NTExIDItMDAzOTogMi0wMDM5IHN1cHBseSB2
M3AzIG5vdCBmb3VuZCwgdXNpbmcKPj4gZHVtbXkgcmVndWxhdG9yCj4+IFsgICAgNC4yNDY2MTVd
IGFkdjc1MTEgMi0wMDM5OiAyLTAwMzkgc3VwcGx5IHYxcDIgbm90IGZvdW5kLCB1c2luZwo+PiBk
dW1teSByZWd1bGF0b3IKPj4gWyAgICA0LjI3Mjk3MF0gYWR2NzUxMSAyLTAwMzk6IGZhaWxlZCB0
byBmaW5kIGRzaSBob3N0Cj4+Cj4+IG92ZXIgYW5kIG92ZXIuICBUaGUgZHVtbXkgcmVndWxhdG9y
IG1lc3NhZ2VzIGFyZSBub3JtYWwsIGJ1dCB1c3VhbGx5Cj4+IFsgICAgNC40NDQzMTVdIGtpcmlu
LWRybSBmNDEwMDAwMC5hZGU6IGJvdW5kIGY0MTA3ODAwLmRzaSAob3BzIGRzaV9vcHMpCj4+Cj4+
IFN0YXJ0cyB1cCByaWdodCBhZnRlcndhcmQuCj4gSGV5IE1hdHQsIEFuZHJ6ZWosCj4gICBJIGp1
c3Qgd2FudGVkIHRvIGZvbGxvdyB1cCBvbiB0aGlzIGFzIHRoaXMgcGF0Y2ggaXMgYnJlYWtpbmcg
YQo+IGNvdXBsZSBvZiBib2FyZHMuIEFueSBzZW5zZSBvZiB3aGF0IG1pZ2h0IGJlIG1pc3Npbmcs
IG9yIGlzIHRoaXMKPiBzb21ldGhpbmcgd2Ugc2hvdWxkIHJldmVydD8KPgo+IEknbSBoYXBweSB0
byB0ZXN0IGFueSBwYXRjaCBpZGVhcyB5b3UgaGF2ZS4KCgpJIGd1ZXNzIHRoaXMgaXMgY2lyY3Vs
YXIgZGVwZW5kZW5jeSBpc3N1ZToKCi0gYWR2IHdhaXRzIGZvciBkc2ktaG9zdCwgdGhlbiBpdCBj
cmVhdGVzIGRybV9icmlkZ2UsCgotIGRzaS1kcml2ZXIgd2FpdHMgZm9yIGRybV9icmlkZ2UsIHRo
ZW4gaXQgY3JlYXRlcyBkc2kgaG9zdC4KCgpUaGUgcGF0Y2ggaW50cm9kdWNlcyBwcm9wZXIgb3Jk
ZXI6CgotIDFzdCB3ZSBzaG91bGQgcmVnaXN0ZXIgZGV2aWNlcyBidXNlcywKCi0gdGhlbiB3ZSBz
aG91bGQgd2FpdCBmb3IgZHJtIGNvbXBvbmVudHMuCgoKU28gdGhlIGJlc3Qgc29sdXRpb24gd291
bGQgYmUgdG8gZml4IGY0MTA3ODAwLmRzaSBkcml2ZXIgLSBpdCBzaG91bGRuJ3QKbG9vayBmb3Ig
ZHJtX2JyaWRnZSBpbiBwcm9iZSwgaW5zdGVhZCBpdCBzaG91bGQgcmVnaXN0ZXIgZHNpX2hvc3Qs
IGFuZAppbiBkc2kgaG9zdCBhdHRhY2ggY2FsbGJhY2sgbG9vayBmb3IgZHJtX2JyaWRnZSwgdGhl
biBjYWxsIGNvbXBvbmVudF9hZGQKKGlmIGFsbCByZXF1aXJlZCByZXNvdXJjZXMgYXJlIGdhdGhl
cmVkKSwgc2VlCmR3X21pcGlfZHNpX3JvY2tjaGlwX2hvc3RfYXR0YWNoIGZvciBleGFtcGxlLgoK
ClJlZ2FyZHMKCkFuZHJ6ZWoKCgoKPgo+IHRoYW5rcwo+IC1qb2huCj4KPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
