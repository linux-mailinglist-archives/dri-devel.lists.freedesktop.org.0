Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3772B29C
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 12:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AA289875;
	Mon, 27 May 2019 10:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8426289875
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 10:59:44 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190527105942euoutp02a82658fead32a4f9602075dbe29b9eed~ihR2Dkq5i1817318173euoutp02Y
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 10:59:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190527105942euoutp02a82658fead32a4f9602075dbe29b9eed~ihR2Dkq5i1817318173euoutp02Y
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190527105941eucas1p1a7d6c4eee1b1a4bc0d209195ba7c3c68~ihR1PIMxF0679606796eucas1p1b;
 Mon, 27 May 2019 10:59:41 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id BD.2D.04325.D13CBEC5; Mon, 27
 May 2019 11:59:41 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190527105941eucas1p12ed78aa5300b3c9275e33e67a4399fc7~ihR0d2C961963919639eucas1p1x;
 Mon, 27 May 2019 10:59:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190527105940eusmtrp1db8c587aca936b183bbeeab353dfbcd2~ihR0PsEKM2396923969eusmtrp1Q;
 Mon, 27 May 2019 10:59:40 +0000 (GMT)
X-AuditID: cbfec7f5-fbbf09c0000010e5-10-5cebc31db9f8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 12.96.04140.C13CBEC5; Mon, 27
 May 2019 11:59:40 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190527105940eusmtip23c0a8f60802c4d3b70ae41d6701100cb~ihRzvRTRR0654906549eusmtip2F;
 Mon, 27 May 2019 10:59:40 +0000 (GMT)
Subject: Re: [PATCH 24/33] Revert "backlight/fbcon: Add FB_EVENT_CONBLANK"
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <ee90a071-74b4-e9f0-03f9-2e959c333b1f@samsung.com>
Date: Mon, 27 May 2019 12:59:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHWOY97FqyJ6FU1SYTgegKxm2A+R+X6Vjs0_zn1QGN3KQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju2zk7O45NjtPyzbJiUOC9i9JJQyqDTkFk/eoi1dKTipva5jXJ
 NCTNS2hS4pRcBGkK09TUzak40xlqlplIZFpamRdm6Cq7aLqj5L/ney7v+z7wkZhkkO9EhkfG
 sMpImVxKCPG6jvleD+e2yaCdjQYXuntqSEA/+DCE0aXdWozut5gJespUwKOLcmt4dNlcoYAe
 trQjuvP2DJ9+rS8m6Eb9Jz7dq5cdEDFN3zU4o8nuxRidekjAPDR85THvBgwEM5xl4jHm5jcE
 Yyj5yWdmq7cE2pwV7g9h5eFxrNLL/6Iw7H2ZGYt+aJegudHJS0F5tpnIhgTKG1rT27FMJCQl
 VBkC7XiTYFmQUHMIjAYfTphFUNt9V7CaKNK24pxQiqBuckTAPaYRGNp/WF321DF4MTONL2MH
 yhUyFtOsCYwax6A79Qm2LBCUL+Sll6NlLKb8oaXnvhXj1HYw32mw4vXUaRjuqOJzHjt4Xjhm
 HWpDnYS01ArrHIxyhLdjJTwOb4X66WJrIaAsAigdrcS5uw9Da4FupYM9TJhqV/Bm6MrPxrmA
 FsHfjPGVdD2C0vwFgnP5QZvp1dIZ5NIKF6jUe3H0QZjM+WKlgbKFwWk77ghbuFNXgHG0GDJu
 Sjj3Dqh6VEWsrs3UPcZykVS9ppp6TR31mjrq/3s1CC9HjmysShHKqvZEsvGeKplCFRsZ6hkc
 pahGS/+ta8FkaUDNfy4ZEUUiqUgc3TsRJOHL4lSJCiMCEpM6iH1qlyhxiCzxKquMuqCMlbMq
 I9pE4lJHcdK6kXMSKlQWw0awbDSrXFV5pI1TCpJMNTfmeZTNtfSYvEM+Bwj6Liuc5bxBd+Tk
 fEg3fMVTGbW4wW9gI3E054z5mpt+W/nHZwPZFgfb8wF7jyTo3LXKIEV8ya/dnX3NoorW0RMR
 j04Fh9XsC05+KXI77jhvvFdwhHna3u/le0xo/iZMrg2IdkmypGXZy/uv36oJFP3OkuKqMNku
 V0ypkv0DQyS7tmsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsVy+t/xe7oyh1/HGFy7bGJx5s1ddouFD+8y
 Wyw/s47Z4srX92wWb45PZ7KYPWEzk8WKLzPZLe5/PcpocaLvA6vF5V1z2Cx273rKanF+V6ID
 j8febwtYPBb0nGf22DnrLrvH4j0vmTzuXNvD5nG/+ziTx/t9V9k89sz/werxeZNcAGeUnk1R
 fmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsa9Fe+ZCxYL
 VixoOsHUwDiRr4uRk0NCwERi9rqDLF2MXBxCAksZJZa8PwLkcAAlZCSOry+DqBGW+HOtiw2i
 5jWjxM9DC1hBEsICXhLnPrxlAbFFBLQkOv63gA1iFnjBLPHv7FtWiI7tTBIHTl5nB6liE7CS
 mNi+ihHE5hWwk9h/dh6YzSKgKvF+0g4wW1QgQuLM+xUsEDWCEidnPgGzOQUCJVoaVzOD2MwC
 6hJ/5l2CssUlbj2ZzwRhy0tsfzuHeQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrF
 ibnFpXnpesn5uZsYgfG87djPLUD3vQs+xCjAwajEw1tw/lWMEGtiWXFl7iFGCQ5mJRFe0y1A
 Id6UxMqq1KL8+KLSnNTiQ4ymQM9NZJYSTc4Hppq8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC
 6YklqdmpqQWpRTB9TBycUg2MDC015/zLzv2cH+XnKbpsKdOuZ/+l18XcvCZyc4r5kuYZcWJh
 FUVSd2dqZq3ecIf3kXVsf0RpUfbF1QuM1rG92vYi6tMpkSWNs0Le8ln5zQotb4orF2QpLeae
 +LX3YXiV9HJ7pfkff/i6GTFM611qJt7CNnF60yIuz+fPvTaaG7523Ce4u4VJiaU4I9FQi7mo
 OBEAdCV2KP0CAAA=
X-CMS-MailID: 20190527105941eucas1p12ed78aa5300b3c9275e33e67a4399fc7
X-Msg-Generator: CA
X-RootMTR: 20190524152910epcas2p30be74545e6e0570ea42cef8e0b5b7da4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190524152910epcas2p30be74545e6e0570ea42cef8e0b5b7da4
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
 <20190524085354.27411-25-daniel.vetter@ffwll.ch>
 <20190524131453.e6mefygqyg46jeuf@holly.lan>
 <CGME20190524152910epcas2p30be74545e6e0570ea42cef8e0b5b7da4@epcas2p3.samsung.com>
 <CAKMK7uHWOY97FqyJ6FU1SYTgegKxm2A+R+X6Vjs0_zn1QGN3KQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558954782;
 bh=vmoddjQAdwfgajrjwjND/Fdm1rXcy9qvQd8vjTNxPS4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=aBkH5UdgElHKDGMRk0CD0ZI+ILLNuxJNsZoFac21zBKRO5nVZFsQslA+XznbIsTtD
 rHJhEFU6wfx6MAFvfFK+ltS3oqIAlLa5m74JfQNlAITYxbRHFTLfaGTK0nR0fRi8no
 RoLqCeUl5cJtXTqiZKCgvLQ9QQBplhGItf9C2wuE=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Richard Purdie <rpurdie@rpsys.net>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDUvMjQvMTkgNToyOCBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBIaSBEYW5pZWwsCj4g
Cj4gT24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMzoxNCBQTSBEYW5pZWwgVGhvbXBzb24KPiA8ZGFu
aWVsLnRob21wc29uQGxpbmFyby5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBGcmksIE1heSAyNCwgMjAx
OSBhdCAxMDo1Mzo0NUFNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4gVGhpcyByZXZl
cnRzIGNvbW1pdCA5OTRlZmFjZGY5YTA4N2I1MmY3MWU2MjBiNThkZmE1MjZiMGNmOTI4Lgo+Pj4K
Pj4+IFRoZSBqdXN0aWZpY2F0aW9uIGlzIHRoYXQgaWYgaHcgYmxhbmtpbmcgZmFpbHMgKGkuZS4g
ZmJvcHMtPmZiX2JsYW5rKQo+Pj4gZmFpbHMsIHRoZW4gd2Ugc3RpbGwgd2FudCB0byBzaHV0IGRv
d24gdGhlIGJhY2tsaWdodC4gV2hpY2ggaXMgZXhhY3RseQo+Pj4gX25vdF8gd2hhdCBmYl9ibGFu
aygpIGRvZXMgYW5kIHNvIHJhdGhlciBpbmNvbnNpc3RlbnQgaWYgd2UgZW5kIHVwCj4+PiB3aXRo
IGRpZmZlcmVudCBiZWhhdmlvdXIgYmV0d2VlbiBmYmNvbiBhbmQgZGlyZWN0IGZiZGV2IHVzYWdl
LiBHaXZlbgo+Pj4gdGhhdCB0aGUgZW50aXJlIG5vdGlmaWVyIG1hemUgaXMgZ2V0dGluZyBpbiB0
aGUgd2F5IGFueXdheSBJIGZpZ3VyZWQKPj4+IGl0J3Mgc2ltcGxlc3QgdG8gcmV2ZXJ0IHRoaXMg
bm90IHdlbGwganVzdGlmaWVkIGNvbW1pdC4KPj4+Cj4+PiB2MjogQWRkIHN0YXRpYyBpbmxpbmUg
dG8gdGhlIGR1bW15IHZlcnNpb24uCj4+Pgo+Pj4gQ2M6IFJpY2hhcmQgUHVyZGllIDxycHVyZGll
QHJwc3lzLm5ldD4KPj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgo+Pj4gQ2M6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4+
PiBDYzogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPj4+IENj
OiBKaW5nb28gSGFuIDxqaW5nb29oYW4xQGdtYWlsLmNvbT4KPj4+IENjOiBCYXJ0bG9taWVqIFpv
bG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4+PiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPj4+IENjOiBIYW5zIGRlIEdvZWRlIDxoZGVn
b2VkZUByZWRoYXQuY29tPgo+Pj4gQ2M6IFlpc2hlbmcgWGllIDx5c3hpZUBmb3htYWlsLmNvbT4K
Pj4+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPj4KPj4gSGkgRGFuaWVsCj4+Cj4+
IFdoZW4gdGhpcyBnb2VzIHJvdW5kIGFnYWluIGNvdWxkIHlvdSBhZGQgbWUgdG8gdGhlIGNvdmVy
aW5nIGxldHRlcj8KPj4KPj4gSSBsb29rZWQgYXQgYWxsIHRocmVlIG9mIHRoZSBwYXRjaGVzIGFu
ZCBubyBvYmplY3Rpb25zIG9uIG15IHNpZGUgYnV0Cj4+IEknbSByZWx1Y3RhbnQgdG8gc2VuZCBv
dXQgYWNrcyBiZWNhdXNlIEknbSBub3Qgc3VyZSBJIHVuZGVyc3Rvb2QgdGhlCj4+IHdpZGVyIHBp
Y3R1cmUgd2VsbCBlbm91Z2guCj4gCj4gSXQncyBvbmUgb2YgdGhlc2UgcGF0Y2ggc2VyaWVzIHdp
dGggc29tZSBtYW55IGRpZmZlcmVudCBzdWJzeXN0ZW1zIGFuZAo+IHBlb3BsZSB5b3UgY2FuJ3Qg
Y2MgdGhlIGNvdmVyIHRvIGFsbCBvZiB0aGVtIG9yIG1haWxpbmcgbGlzdHMgc3RhcnQKPiByZWpl
Y3RpbmcgeW91IGJlY2F1c2UgdG9vIG1hbnkgcmVjaXBpZW50cy4gSSB0cmllZCB0byBzcGFtIHN1
ZmZpY2llbnQKPiBtYWlsbmcgbGlzdHMsIGJ1dCBJIGd1ZXNzIG5vdCBlbm91Z2guCgpCVFcgTm90
IGFsbCByZWxldmFudCBwYXRjaGVzIHdlcmUgcG9zdGVkIHRvIGxpbnV4LWZiZGV2IGFuZCBtZSAo
aS5lLgoiW1BBVENIIDA1LzMzXSBmYmRldi9zYTExMDBmYjogUmVtb3ZlIGRlYWQgY29kZSIpIC0g
SSBmb3VuZCB0aGVtIG9uCm90aGVyIG1haWxpbmcgbGlzdHMgYnV0IGl0IHJlcXVpcmVzIHNvbWUg
YWRkaXRpb25hbCB3b3JrIGZyb20gbWUgdG8KZmluZCAvIHByb2Nlc3MgdGhlbS4gSWYgcG9zc2li
bGUgcGxlYXNlIENjOiBsaW51eC1mYmRldiAmIG1lIG9uIGFsbApwYXRjaGVzIGluIHRoZSBwYXRj
aHNldC4gVGhhbmtzIQoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6
ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
