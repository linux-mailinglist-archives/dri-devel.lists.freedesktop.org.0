Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC0C182C33
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 10:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990066E101;
	Thu, 12 Mar 2020 09:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9416E101
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 09:17:43 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200312091741euoutp019998b2e699fa6e38150c604d9a986003~7g9j3Ro302031320313euoutp01I
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 09:17:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200312091741euoutp019998b2e699fa6e38150c604d9a986003~7g9j3Ro302031320313euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584004661;
 bh=EgS01AJXAw4endn2MFPkJtrJ+FnKs9oauKWXYk0E9U8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=TCk4G8fVttCATPlya7mZuH1Dfed1Dm6UoYfskeAXkQPANOVTLRs+CxQ/wKcSbaD3L
 1fGziPs+9lP4tabTuo353s1RTNzoYE/zmaPv2602/ziojTXx7F/Ovz4YSPQB3zTxnU
 VNM1x0yWaLOHLWpahCxIA1lc7+gdWIyQx8oRZjHM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200312091741eucas1p15a6dae6117ac10c11c0b3738443f7a37~7g9jo2vB_1355513555eucas1p1q;
 Thu, 12 Mar 2020 09:17:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E6.FE.60698.53EF96E5; Thu, 12
 Mar 2020 09:17:41 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200312091741eucas1p118c87eb8c223a5ab31e9db488f84779c~7g9jVhzAP1341313413eucas1p1v;
 Thu, 12 Mar 2020 09:17:41 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200312091741eusmtrp141683eb301109c34e832289bf0ad5233~7g9jUvkSI3209432094eusmtrp1U;
 Thu, 12 Mar 2020 09:17:41 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-04-5e69fe35a71b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id ED.28.08375.53EF96E5; Thu, 12
 Mar 2020 09:17:41 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200312091740eusmtip1e3dbb8be0b0654dc26f698eb262acdb3~7g9ioN8F20994209942eusmtip1d;
 Thu, 12 Mar 2020 09:17:40 +0000 (GMT)
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Split bind() into probe()
 and real bind()
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <78cf2af3-3fbe-c381-b96d-fb14d959f6e8@samsung.com>
Date: Thu, 12 Mar 2020 10:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310103427.26048-1-m.szyprowski@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeXfOtrPR5Hg0fNRMGwTd1MSMQxcr6sMhIcQPEZWXlYcp6ZRN
 nRresGxpmTlKd1QqcbXEsryVQsuGecEroaCiGWjRMjO8haLW5pnkt9/z/p/n/zx/eAmM+iz0
 IGJVSaxapYiTi6R4U/tyn2/QemzEweYKOX2vfwTRr0trhfTg4qyIrijOoIf+WDHatGAQ010/
 h3D69v0qMT335S9Gl/abBfSLtnExbSm8RJfqraKTMmZ2+KaYaebGxUyZziBkOos+CZiJgg4B
 U1+Vxaxx73GmsKEaMa139TgzX7czVHpReiyajYtNYdX+wVHSmKWWeUFiHZm6pnuAZaNJWT6S
 EEAegtapGVE+khIUaUJgLuFwvlhAYBjrcyjzCCZXirDNEYN51CE8Q/CyZlXIFzMIPuimbQpB
 uJCXYdiA2d9dyTIEo+3fNnwxcl0A32vmkN1KRO6FtfoRkZ1lZDCYKnLFdsbJ3fDbko/beTt5
 AR6+WUd8jzN0GaY23iW2fuu7no1+jPSG3MYyjGc3GJ16JLAvAzKHgLxZ+92ErTgDPeVhfAQX
 +NHRIOZ5B3Tr7+A8Z8GE6QbGz+oQNL5qdmQ+CmN9KxvJMNvRtS3+vOUp+DWdyaMTDM848xc4
 QXFTiWOpDHR5FO+xCyZ6Gx1+bmAcWBQVITm3JRe3JQu3JQv3f+1jhFcjNzZZE69kNYEqVuun
 UcRrklVKv6sJ8XXI9uu61zsW3yLz6hULIgkk3yYrmo+JoISKFE1avAUBgcldZZHeyghKFq1I
 S2fVCZHq5DhWY0GeBC53kwVWWsMpUqlIYq+xbCKr3lQFhMQjG+UEK2Pblr8+9xnkhg7vGS/G
 nUpvaRs6loyU5HyYiftYub9ca+w+kuxnrQ0QaLVYRroqQ18WqsurAtNpycCKU/H0gbnI66Er
 ZizavaWntWHCd66z3yuz4Fx3b7WxPlXZHhX+VBlwfFWJvEJ8gkI8Kaq+wD1ssVmPnTWeeLIm
 xzUxioB9mFqj+AcjJbeacQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsVy+t/xu7qm/zLjDObv4bboP3+T0WLjjPWs
 Fle+vmezmDup1uLq95fMFiu+zGS3OPnmKotF58Ql7BafHvxntphxfh+Txdojd9ktDvVFW8yY
 /JLNgdfj/Y1Wdo+ds+6ye8zumMnqcWLCJSaP+93HmTw2L6n3+DtrP4tH35ZVjB4HeiezeHze
 JBfAFaVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX
 8W3XZ6aCTQIVfzumMjcwPubtYuTkkBAwkZi57xZbFyMXh5DAUkaJSwufsUMkxCV2z3/LDGEL
 S/y51gVV9JpR4sPS04wgCWGBGIk1e16AJUQEZjNKrDuwih3EYRZoYJY41fOfGaJlIqPEzfOn
 weayCWhK/N18kw3E5hWwk1gxtxksziKgKvHhUBcLiC0qECHxeGI7I0SNoMTJmU/A4pxA9S/3
 ngGrZxZQl/gz7xIzhC0v0bx1NpQtLnHryXymCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem
 5xYb6hUn5haX5qXrJefnbmIExvi2Yz8372C8tDH4EKMAB6MSD++EzxlxQqyJZcWVuYcYJTiY
 lUR44+XT44R4UxIrq1KL8uOLSnNSiw8xmgI9N5FZSjQ5H5h+8kriDU0NzS0sDc2NzY3NLJTE
 eTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MEZMK+au0FvdtXmBZdjSznfS0xSk3L5W/o/aH/N5
 UddNy8XvbN4WPUpZc6dpteb7yxPYddXvxwc+Tf+lLZbr32tp0h7UNPnz6rafk6cpmcTxpzIp
 Xd3Ovse554XkqfY5B1l2GNsvnfbDaIWuffyUx2/XnHk1ybTu3KKVe/MnFxR8/f126TM+6XtK
 LMUZiYZazEXFiQAPfudBBwMAAA==
X-CMS-MailID: 20200312091741eucas1p118c87eb8c223a5ab31e9db488f84779c
X-Msg-Generator: CA
X-RootMTR: 20200310104049eucas1p107e1ec61456fce4c830d3232a400b32f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200310104049eucas1p107e1ec61456fce4c830d3232a400b32f
References: <CGME20200310104049eucas1p107e1ec61456fce4c830d3232a400b32f@eucas1p1.samsung.com>
 <20200310103427.26048-1-m.szyprowski@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Jingoo Han <jingoohan1@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAuMDMuMjAyMCAxMTozNCwgTWFyZWsgU3p5cHJvd3NraSB3cm90ZToKPiBBbmFsb2dpeF9k
cCBkcml2ZXIgYWNxdWlyZXMgYWxsIGl0cyByZXNvdXJjZXMgaW4gdGhlIC0+YmluZCgpIGNhbGxi
YWNrLAo+IHdoYXQgaXMgYSBiaXQgYWdhaW5zdCB0aGUgY29tcG9uZW50IGRyaXZlciBiYXNlZCBh
cHByb2FjaCwgd2hlcmUgdGhlCj4gZHJpdmVyIGluaXRpYWxpemF0aW9uIGlzIHNwbGl0IGludG8g
YSBwcm9iZSgpLCB3aGVyZSBhbGwgcmVzb3VyY2VzIGFyZQo+IGdhdGhlcmVkLCBhbmQgYSBiaW5k
KCksIHdoZXJlIGFsbCBvYmplY3RzIGFyZSBjcmVhdGVkIGFuZCBhIGNvbXBvdW5kCj4gZHJpdmVy
IGlzIGluaXRpYWxpemVkLgo+Cj4gRXh0cmFjdCBhbGwgdGhlIHJlc291cmNlIHJlbGF0ZWQgb3Bl
cmF0aW9ucyB0byBhbmFsb2dpeF9kcF9wcm9iZSgpIGFuZAo+IGFuYWxvZ2l4X2RwX3JlbW92ZSgp
LCB0aGVuIGNhbGwgdGhlbSBiZWZvcmUvYWZ0ZXIgcmVnaXN0cmF0aW9uIG9mIHRoZQo+IGRldmlj
ZSBjb21wb25lbnRzIGZyb20gdGhlIG1haW4gRXh5bm9zIERQIGFuZCBSb2NrY2hpcCBEUCBkcml2
ZXJzLiBBbHNvCj4gbW92ZSB0aGUgcGxhdF9kYXRhIGluaXRpYWxpemF0aW9uIHRvIHRoZSBwcm9i
ZSgpIHRvIG1ha2UgaXQgYXZhaWxhYmxlIGZvcgo+IHRoZSBhbmFsb2dpeF9kcF9wcm9iZSgpIGZ1
bmN0aW9uLgo+Cj4gVGhpcyBmaXhlcyB0aGUgbXVsdGlwbGUgY2FsbHMgdG8gdGhlIGJpbmQoKSBv
ZiB0aGUgRFJNIGNvbXBvdW5kIGRyaXZlcgo+IHdoZW4gdGhlIERQIFBIWSBkcml2ZXIgaXMgbm90
IHlldCBsb2FkZWQvcHJvYmVkOgo+Cj4gW2RybV0gRXh5bm9zIERSTTogdXNpbmcgMTQ0MDAwMDAu
ZmltZCBkZXZpY2UgZm9yIERNQSBtYXBwaW5nIG9wZXJhdGlvbnMKPiBleHlub3MtZHJtIGV4eW5v
cy1kcm06IGJvdW5kIDE0NDAwMDAwLmZpbWQgKG9wcyBmaW1kX2NvbXBvbmVudF9vcHMgW2V4eW5v
c2RybV0pCj4gZXh5bm9zLWRybSBleHlub3MtZHJtOiBib3VuZCAxNDQ1MDAwMC5taXhlciAob3Bz
IG1peGVyX2NvbXBvbmVudF9vcHMgW2V4eW5vc2RybV0pCj4gZXh5bm9zLWRwIDE0NWIwMDAwLmRw
LWNvbnRyb2xsZXI6IG5vIERQIHBoeSBjb25maWd1cmVkCj4gZXh5bm9zLWRybSBleHlub3MtZHJt
OiBmYWlsZWQgdG8gYmluZCAxNDViMDAwMC5kcC1jb250cm9sbGVyIChvcHMgZXh5bm9zX2RwX29w
cyBbZXh5bm9zZHJtXSk6IC01MTcKPiBleHlub3MtZHJtIGV4eW5vcy1kcm06IG1hc3RlciBiaW5k
IGZhaWxlZDogLTUxNwo+IC4uLgo+IFtkcm1dIEV4eW5vcyBEUk06IHVzaW5nIDE0NDAwMDAwLmZp
bWQgZGV2aWNlIGZvciBETUEgbWFwcGluZyBvcGVyYXRpb25zCj4gZXh5bm9zLWRybSBleHlub3Mt
ZHJtOiBib3VuZCAxNDQwMDAwMC5maW1kIChvcHMgaGRtaV9lbmFibGUgW2V4eW5vc2RybV0pCj4g
ZXh5bm9zLWRybSBleHlub3MtZHJtOiBib3VuZCAxNDQ1MDAwMC5taXhlciAob3BzIGhkbWlfZW5h
YmxlIFtleHlub3Nkcm1dKQo+IGV4eW5vcy1kcm0gZXh5bm9zLWRybTogYm91bmQgMTQ1YjAwMDAu
ZHAtY29udHJvbGxlciAob3BzIGhkbWlfZW5hYmxlIFtleHlub3Nkcm1dKQo+IGV4eW5vcy1kcm0g
ZXh5bm9zLWRybTogYm91bmQgMTQ1MzAwMDAuaGRtaSAob3BzIGhkbWlfZW5hYmxlIFtleHlub3Nk
cm1dKQo+IFtkcm1dIFN1cHBvcnRzIHZibGFuayB0aW1lc3RhbXAgY2FjaGluZyBSZXYgMiAoMjEu
MTAuMjAxMykuCj4gQ29uc29sZTogc3dpdGNoaW5nIHRvIGNvbG91ciBmcmFtZSBidWZmZXIgZGV2
aWNlIDE3MHg0OAo+IGV4eW5vcy1kcm0gZXh5bm9zLWRybTogZmIwOiBleHlub3Nkcm1mYiBmcmFt
ZSBidWZmZXIgZGV2aWNlCj4gW2RybV0gSW5pdGlhbGl6ZWQgZXh5bm9zIDEuMS4wIDIwMTgwMzMw
IGZvciBleHlub3MtZHJtIG9uIG1pbm9yIDEKPiAuLi4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVr
IFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KCgpSZXZpZXdlZC1ieTogQW5k
cnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpBbmRyemVqCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
