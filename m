Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE1F51043
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 17:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D70489C80;
	Mon, 24 Jun 2019 15:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A8E89C80
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:28:00 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190624152758euoutp02a5780b11e050dd9429ed4cd070a765ba~rLAD9OByg0119301193euoutp02d
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:27:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190624152758euoutp02a5780b11e050dd9429ed4cd070a765ba~rLAD9OByg0119301193euoutp02d
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190624152757eucas1p150f35a7e5e83c5d6bdcf9e90160c9972~rLADUdpKF2418724187eucas1p1U;
 Mon, 24 Jun 2019 15:27:57 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B5.2D.04298.DFBE01D5; Mon, 24
 Jun 2019 16:27:57 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190624152757eucas1p14b3e9201cfa1e6c3c684f701c7e2a428~rLACi67LJ2603626036eucas1p1X;
 Mon, 24 Jun 2019 15:27:57 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190624152756eusmtrp22f3f3fc746ab79f0c401f5acf365e911~rLACUydH_2704627046eusmtrp2a;
 Mon, 24 Jun 2019 15:27:56 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-a1-5d10ebfda304
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 50.E9.04146.CFBE01D5; Mon, 24
 Jun 2019 16:27:56 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190624152756eusmtip15f72ec26d0366bf4f81db5983560f798~rLAB11zfb1046310463eusmtip16;
 Mon, 24 Jun 2019 15:27:56 +0000 (GMT)
Subject: Re: [PATCH 0/4] drm/bridge: dw-hdmi: Add support for HDR metadata
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <narmstrong@baylibre.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <37de5e40-38af-0bb5-88c0-dec1ad1c5d30@samsung.com>
Date: Mon, 24 Jun 2019 17:27:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190624111636.GB5737@pendragon.ideasonboard.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0yMcRz2vfe9u/eOy9cV95EmLmxMXcbsnZT8mL1jyPzBonHcK02XdlfH
 aSNWus6yOwxdjdbESXS703Hm105zckM/ZJEpaiW0piupJN29mf579jzP5/N5nu1DEdIGfiiV
 kpbBatKUqXKBmHQ+G3wVOfINJ0VXeBfQo04zQb/p7xHQjQNdBF3zvZGkB/Pu8Oh881Uh3XC/
 WEC3dj1GtPvMTnrQ/ZpHV+Yo4iczPU25QuZyRRZj+3yTzzz8WUIyRYZCPvPcVM9jWk57eMyI
 5THJPCk4RzI+++wEcaJ4pYpNTdGxGkXcHvGB2x9aUHrnnCOmOjPKRq9DjUhEAV4GbW15hBGJ
 KSm2IrhmKyP8ghT3IWgwhnCCD0G+94zw30Tt0CUBZ7qO4OeDaM7UjaC0r4P0C8F4AzgffOL7
 cQhWwWDxaaHfRGAvARcGmgLTArwQRhzvAliC4+Bj1RdkRBRF4vng6Fjnp6fjHdDnsiPOMg1q
 CtsD+0V4FRQ4fIH9BA6Hu93FBIdl8L79Cs9/C/APITiGL/G41OvA9u08n8PB8NVzZ7xNGIy6
 rox7jkOLNYfghg0IqmwughNi4Kmnju8PR4yFrryv4OjVUFPuJv004CBo6p7GZQiCs86LBEdL
 wHBKyrnnQsvLqvGFMiir7ReYkNwyoZllQhvLhDaW/3dLEFmOZGymVp3MapeksYejtEq1NjMt
 OWrfIbUdjb2a94+n9x7qr9/rRphC8imSkmqcJOUrdVq92o2AIuQhkjLlGCVRKfVHWc2h3ZrM
 VFbrRrMoUi6TZE1q3SnFycoM9iDLprOafyqPEoVmoxNvV6z2vIiZ//tReIQu8VblSVr1K3eL
 xmRev9/Xlp7gglJrUnFn4qa1W8PM23ZkxoaVipYXeTp0tQOGLzN6dcP1LnJL14rC+PbqjObY
 qfv0p445hjZHLravsc50HEXHpPryuc2K0aBdWeHrrRtt8xL0i3CEmtzuvdFsL9i2VBgrJ7UH
 lEsWERqt8i+MKHjKZgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRmVeSWpSXmKPExsVy+t/xu7p/XgvEGux/qGfxf9tEZosrX9+z
 WVz9/pLZ4uSbqywWP9u3MFl0TlzCbnF51xw2iwcv9zNaHOqLtvh56DyTxfoWfQduj/c3Wtk9
 5q2p9tjwaDWrx95vC1g8ZnfMZPU4MeESk8f97uNMHn9n7WfxONA7mcXj8ya5AK4oPZui/NKS
 VIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYx1d+4zFjxXqJhw
 cSJjA+N5qS5GTg4JAROJC79msHUxcnEICSxllLix5wQzREJcYvf8t1C2sMSfa11QRa8ZJd4c
 Ws8IkhAW8JLYtuchK4gtIpAisf/ORnaQImaBs8wSC66dYYXo2MIscehBI1gVm4CmxN/NN9lA
 bF4BO4l7W18ATeLgYBFQldj8zAUkLCoQITF7VwMLRImgxMmZT8BsTgF7id7Nn8HGMAuoS/yZ
 d4kZwpaX2P52DpQtLnHryXymCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX
 5qXrJefnbmIExvK2Yz8372C8tDH4EKMAB6MSD++CIwKxQqyJZcWVuYcYJTiYlUR4lyYChXhT
 EiurUovy44tKc1KLDzGaAv02kVlKNDkfmGbySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeW
 pGanphakFsH0MXFwSjUwctz1nth7v67plFPoy3mTpv4+L5lgXM8vdfDzB4dF/QvqOwsf8fzq
 e7/psevjsOP6PNZOJzdmnFtv4fw/2Pe1/rTe2tBKtpk77vbuVrxWLtVwQ7u/amlL4LJmubt3
 1h+J4dwd4LxaQ6kvSanSKbUsuGDjge8cDwrY1X9d3aecdjLl5aF7L5ojlViKMxINtZiLihMB
 schapvsCAAA=
X-CMS-MailID: 20190624152757eucas1p14b3e9201cfa1e6c3c684f701c7e2a428
X-Msg-Generator: CA
X-RootMTR: 20190624111911epcas2p399d792d3e4663e489270c76c2bed2a25
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190624111911epcas2p399d792d3e4663e489270c76c2bed2a25
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <085dc3be-20e5-b2fe-4c02-bf4a4d1473da@baylibre.com>
 <20190621090125.GX12905@phenom.ffwll.local>
 <20190623233017.GI6124@pendragon.ideasonboard.com>
 <58243243-fbd8-e67b-a050-baa9757be43e@baylibre.com>
 <CGME20190624111911epcas2p399d792d3e4663e489270c76c2bed2a25@epcas2p3.samsung.com>
 <20190624111636.GB5737@pendragon.ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561390078;
 bh=T6+kPVqLM5P3Wn9vishGMBbSKAuCBIcRIGEF2ERbMDY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=PJvAq5c2DqswWC7mQ0ILExCyXK/uuCc4sNjG4FFdJOBv9Ssec+i6SZ0ryuLJPJsw1
 aUTz2sTnlPtlV4p6z7xpb/N+ItGCrt6CWA8/3PzTUbDakvlRP94VqTi4e61KeDql9V
 yUGcwAxMI44zF/0E3/r7n2+5LIRbVQqBv0VGmPSY=
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wens@csie.org" <wens@csie.org>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQuMDYuMjAxOSAxMzoxNiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBOZWlsLAo+
Cj4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTA6MTk6MzRBTSArMDIwMCwgTmVpbCBBcm1zdHJv
bmcgd3JvdGU6Cj4+IEhpIERhbmllbCwgTGF1cmVudCwgQW5kcnplaiwKPj4KPj4gT24gMjQvMDYv
MjAxOSAwMTozMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPj4+IE9uIEZyaSwgSnVuIDIxLCAy
MDE5IGF0IDExOjAxOjI1QU0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4gT24gVGh1
LCBKdW4gMjAsIDIwMTkgYXQgMDQ6NDA6MTJQTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6
Cj4+Pj4+IEhpIEFuZHJ6ZWosCj4+Pj4+Cj4+Pj4+IEdlbnRsZSBwaW5nLCBjb3VsZCB5b3UgcmV2
aWV3IHRoZSBkdy1oZG1pIGNoYW5nZXMgaGVyZSA/Cj4+Pj4gYnR3IG5vdCBzdXJlIHlvdSBhYnNv
bHV0ZWx5IG5lZWQgcmV2aWV3IGZyb20gQW5kcnplaiwgd2UncmUgY3VycmVudGx5IGEKPj4+PiBi
aXQgdW5kZXJzdXBwbGllZCB3aXRoIGJyaWRnZSByZXZpZXdlcnMgSSB0aGluayAuLi4gQmV0dGVy
IHRvIHJhbXAgdXAKPj4+PiBtb3JlLgo+Pj4gSSB0cnkgdG8gcmV2aWV3IERSTSBicmlkZ2UgcGF0
Y2hlcyB3aGVuIHBvc3NpYmxlLCBidXQgZHctaGRtaSBpcyBhCj4+PiBzcGVjaWFsIGNhc2UuIEkg
d2FzIHRvbGQgYnkgdGhlIHN1cHBsaWVyIG9mIGFuIFNvQyBkYXRhc2hlZXQgdGhhdAo+Pj4gY29u
dGFpbnMgdGhlIEhETUkgZW5jb2RlciBJUCBjb3JlIGRvY3VtZW50YXRpb24gdGhhdCBTeW5vcHN5
cyByZXF1aXJlZAo+Pj4gdGhlbSB0byByb3V0ZSBhbGwgY29udHJpYnV0aW9ucyBtYWRlIGJhc2Vk
IG9uIHRoYXQgZG9jdW1lbnRhdGlvbiB0aHJvdWdoCj4+PiBTeW5vcHN5cycgaW50ZXJuYWwgbGVn
YWwgcmV2aWV3IGJlZm9yZSBwdWJsaXNoaW5nIHRoZW0uIEkgdGh1cyBkZWNpZGVkCj4+PiB0byBu
b3QgY29udHJpYnV0ZSB0byB0aGUgZHJpdmVyIGFueW1vcmUsIGF0IGxlYXN0IGZvciBhcmVhcyB0
aGF0IHJlcXVpcmUKPj4+IGFjY2VzcyB0byBkb2N1bWVudGF0aW9uLgo+PiBJJ2QgbGlrZSB0byBw
cm9wb3NlIG15c2VsZiBhcyBjby1tYWludGFpbmVyIG9mIHRoZSBEUk0gYnJpZGdlIHN1YnN5c3Rl
bSBpZgo+PiBldmVyeWJvZHkgYWdyZWVzLCBmb2xsb3dpbmcgdGhlIGV4Y2VsbGVudCB3b3JrIExh
dXJlbnQgYW5kIEFuZHJ6ZWogZGlkLgo+PiBJIGhhdmUgYSB2ZXJ5IGxpdHRsZSBrbm93bGVkZ2Ug
b2YgRFNJLCAmIG90aGVyIGJyaWRnZSBkcml2ZXJzLCBidXQgSSdsbCBkbwo+PiBteSBiZXN0Lgo+
Pgo+PiBGb3IgdGhlIGR3LWhkbWkgZHJpdmVyLCB3ZSBoYXZlIGEgYmlnIHJvYWRtYXAgaW5jbHVk
aW5nIDoKPj4gLSBIRFIgKHRoaXMgcGF0Y2hzZXQpCj4+IC0gSERDUCAxLzIKPj4gLSBZVVY0MjAs
IFlVVjQyMiwgWVVWNDQsIDEwYml0LzEyYml0LzE2Yml0IEhETUkgb3V0cHV0Cj4+IC0gRW5oYW5j
ZWQgYXVkaW8gc3VwcG9ydCBhbmQgRUxEIG5vdGlmaWNhdGlvbiB0byBBU29DCj4+IC4uLgo+IFlv
dSdyZSBtb3JlIHRoYW4gd2VsY29tZSBhcyBhIERSTSBicmlkZ2UgbWFpbnRhaW5lciwgZXNwZWNp
YWxseSBnaXZlbgo+IHRoYXQgeW91IGhhdmUganVzdCB2b2x1bnRlZXJlZCB0byBpbXBsZW1lbnQg
YnJpZGdlIHN0YXRlcyBhbmQgZm9ybWF0Cj4gbmVnb3RpYXRpb24sIHJpZ2h0ID8gOy0pCgoKVHdv
IChldmVuIHRocmVlKSBiaXJkcyB3aXRoIG9uZSBzdG9uZSA6KQoKCj4KPj4gSGF2aW5nIGEgbW9y
ZSBhY3RpdmUgbWFpbnRhaW5lci9yZXZpZXdlciB0ZWFtIHdvdWxkIGJlIG5lZWRlZCwgYXQgbGVh
c3QgZm9yCj4+IHRoZSBkdy1oZG1pIGJyaWRnZS4KPj4KPj4gSSdsbCBhbHNvIHByb3Bvc2UgSm9u
YXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPiBhcyByZXZpZXdlciBzaW5jZSBoZSBpcyB2ZXJ5
Cj4+IGFjdGl2ZSBmb3IgdGhlIG11bHRpbWVkaWEgc3VwcG9ydCBvbiBSb2NrQ2hpcCwgQWxsd2lu
bmVyIGFuZCBBbWxvZ2ljIFNvQ3MuCj4+IEknbGwgYWxzbyBwcm9wb3NlIEplcm5laiBTa3JhYmVj
QHNpb2wubmV0IDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4sIGlmIGhlIHdhbnRzLAo+PiBhcyBy
ZXZpZXdlciBzaW5jZSBoZSBpcyB2ZXJ5IGFjdGl2ZSBvbiB0aGUgQWxsd2lubmVyIFNvQ3Mgc2lk
ZS4KCgpXZWxjb21lIG9uIGJvYXJkLCBJIHdpbGwgd2FpdCBvbmUvdHdvIGRheXMgZm9yIHBvc3Np
YmxlIGNvbW1lbnRzLCB0aGVuIEkKd2lsbCBxdWV1ZSBNQUlOVEFJTkVSUyBwYXRjaC4KCgpSZWdh
cmRzCgpBbmRyemVqCgoKCj4+Cj4+Pj4+IE9uIDI2LzA1LzIwMTkgMjM6MTgsIEpvbmFzIEthcmxt
YW4gd3JvdGU6Cj4+Pj4+PiBBZGQgc3VwcG9ydCBmb3IgSERSIG1ldGFkYXRhIHVzaW5nIHRoZSBo
ZHJfb3V0cHV0X21ldGFkYXRhIGNvbm5lY3RvciBwcm9wZXJ0eSwKPj4+Pj4+IGNvbmZpZ3VyZSBE
eW5hbWljIFJhbmdlIGFuZCBNYXN0ZXJpbmcgSW5mb0ZyYW1lIGFjY29yZGluZ2x5Lgo+Pj4+Pj4K
Pj4+Pj4+IEEgZHJtX2luZm9mcmFtZSBmbGFnIGlzIGFkZGVkIHRvIGR3X2hkbWlfcGxhdF9kYXRh
IHRoYXQgcGxhdGZvcm0gZHJpdmVycwo+Pj4+Pj4gY2FuIHVzZSB0byBzaWduYWwgd2hlbiBEeW5h
bWljIFJhbmdlIGFuZCBNYXN0ZXJpbmcgaW5mb2ZyYW1lcyBpcyBzdXBwb3J0ZWQuCj4+Pj4+PiBU
aGlzIGZsYWcgaXMgbmVlZGVkIGJlY2F1c2UgQW1sb2dpYyBHWEJCIGFuZCBHWEwgcmVwb3J0IHNh
bWUgRFctSERNSSB2ZXJzaW9uLAo+Pj4+Pj4gYW5kIG9ubHkgR1hMIHN1cHBvcnQgRFJNIEluZm9G
cmFtZS4KPj4+Pj4+Cj4+Pj4+PiBUaGUgZmlyc3QgcGF0Y2ggYWRkIGZ1bmN0aW9uYWxpdHkgdG8g
Y29uZmlndXJlIERSTSBJbmZvRnJhbWUgYmFzZWQgb24gdGhlCj4+Pj4+PiBoZHJfb3V0cHV0X21l
dGFkYXRhIGNvbm5lY3RvciBwcm9wZXJ0eS4KPj4+Pj4+Cj4+Pj4+PiBUaGUgcmVtYWluaW5nIHBh
dGNoZXMgc2V0cyB0aGUgZHJtX2luZm9mcmFtZSBmbGFnIG9uIHNvbWUgU29DcyBzdXBwb3J0aW5n
Cj4+Pj4+PiBEeW5hbWljIFJhbmdlIGFuZCBNYXN0ZXJpbmcgSW5mb0ZyYW1lLgo+Pj4+Pj4KPj4+
Pj4+IE5vdGUgdGhhdCB0aGlzIHdhcyBiYXNlZCBvbiB0b3Agb2YgZHJtLW1pc2MtbmV4dCBhbmQg
TmVpbCBBcm1zdHJvbmcncwo+Pj4+Pj4gImRybS9tZXNvbjogQWRkIHN1cHBvcnQgZm9yIEhETUky
LjAgWVVWNDIwIDRrNjAiIHNlcmllcyBhdCBbMV0KPj4+Pj4+Cj4+Pj4+PiBbMV0gaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81ODcyNS8jcmV2Mgo+Pj4+Pj4KPj4+Pj4+
IEpvbmFzIEthcmxtYW4gKDQpOgo+Pj4+Pj4gICBkcm0vYnJpZGdlOiBkdy1oZG1pOiBBZGQgRHlu
YW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIEluZm9GcmFtZSBzdXBwb3J0Cj4+Pj4+PiAgIGRybS9y
b2NrY2hpcDogRW5hYmxlIERSTSBJbmZvRnJhbWUgc3VwcG9ydCBvbiBSSzMzMjggYW5kIFJLMzM5
OQo+Pj4+Pj4gICBkcm0vbWVzb246IEVuYWJsZSBEUk0gSW5mb0ZyYW1lIHN1cHBvcnQgb24gR1hM
LCBHWE0gYW5kIEcxMkEKPj4+Pj4+ICAgZHJtL3N1bjRpOiBFbmFibGUgRFJNIEluZm9GcmFtZSBz
dXBwb3J0IG9uIEg2Cj4+Pj4+Pgo+Pj4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jICAgfCAxMDkgKysrKysrKysrKysrKysrKysrKysKPj4+Pj4+ICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaCAgIHwgIDM3ICsrKysrKysKPj4+Pj4+
ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jICAgICAgIHwgICA1ICsKPj4+
Pj4+ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jIHwgICAyICsK
Pj4+Pj4+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jICAgICAgIHwgICAy
ICsKPj4+Pj4+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5oICAgICAgIHwg
ICAxICsKPj4+Pj4+ICBpbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAgICAgICAg
IHwgICAxICsKPj4+Pj4+ICA3IGZpbGVzIGNoYW5nZWQsIDE1NyBpbnNlcnRpb25zKCspCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
