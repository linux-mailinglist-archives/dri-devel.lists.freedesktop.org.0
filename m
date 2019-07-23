Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A4271BDA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 17:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858566E2F2;
	Tue, 23 Jul 2019 15:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA1A6E2F2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 15:38:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190723153815euoutp017bfd51604c7d966076707dd8bb1c76f2~0E2U0gKmX1477714777euoutp01E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 15:38:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190723153815euoutp017bfd51604c7d966076707dd8bb1c76f2~0E2U0gKmX1477714777euoutp01E
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190723153815eucas1p20869e6ec0af05080bbd994a9b05de046~0E2UgeTqu2709827098eucas1p29;
 Tue, 23 Jul 2019 15:38:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 94.EE.04325.7E9273D5; Tue, 23
 Jul 2019 16:38:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190723153814eucas1p118ce10061c55ca4b9bf71c69b8430367~0E2Twm9u_3017730177eucas1p1h;
 Tue, 23 Jul 2019 15:38:14 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190723153814eusmtrp1ea731f0262c19150a1d3a7a930df52aa~0E2Tihy5c2369023690eusmtrp1q;
 Tue, 23 Jul 2019 15:38:14 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-eb-5d3729e77f68
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BF.F1.04140.6E9273D5; Tue, 23
 Jul 2019 16:38:14 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190723153814eusmtip2e135b2a37969fc61461c312583c20cae~0E2TF_Uaz0852608526eusmtip2i;
 Tue, 23 Jul 2019 15:38:14 +0000 (GMT)
Subject: Re: [PATCH 0/6] video: ssd1307fb: Support more displays
To: Marko Kohtala <marko.kohtala@okoko.fi>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <f0d8be30-4980-7e7c-dcbb-3bd7621cff08@samsung.com>
Date: Tue, 23 Jul 2019 17:38:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618074111.9309-1-marko.kohtala@okoko.fi>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKKsWRmVeSWpSXmKPExsWy7djP87rPNc1jDX7Ml7DoPXeSyeL/tonM
 FvOPnGO1uPL1PZvFib4PrBZLr19kslh9eAGLxf/PT1gtWvceYXfg9Fgzbw2jx95vC1g8Nq3q
 ZPPY/u0Bq8f97uNMHj+XLWXx+LxJzuPl3w/MARxRXDYpqTmZZalF+nYJXBkPZrczFvRwV+x7
 1MzWwPifo4uRk0NCwETi083XzF2MXBxCAisYJU6u/MYC4XxhlJiz+y4rhPOZUWJC931WmJav
 77azgdhCAssZJbrWyEAUvWWU2HVnMSNIQljAQeLsi21MILaIgJbEixdtYJOYBVYwSZztagTr
 ZhOwkpjYvgqsgVfATmLHiiYwm0VAVWLJrh9gNaICERL3j21ghagRlDg58wkLiM0pYC3xo6OJ
 HcRmFhCXuPVkPhOELS+x/e0csIckBK6xS0x9f4kd4mwXiVU7vjFB2MISr45vgYrLSJye3MMC
 0bCOUeJvxwuo7u2MEssn/2ODqLKWOHz8ItAZHEArNCXW79KHCDtKPGtbxQ4SlhDgk7jxVhDi
 CD6JSdumM0OEeSU62oQgqtUkNizbwAaztmvnSuYJjEqzkLw2C8k7s5C8Mwth7wJGllWM4qml
 xbnpqcXGeanlesWJucWleel6yfm5mxiBiev0v+NfdzDu+5N0iFGAg1GJh7eCyTxWiDWxrLgy
 9xCjBAezkghvYINZrBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeaoYH0UIC6YklqdmpqQWpRTBZ
 Jg5OqQbGg7y7c7dIbuEP2OOTY6X/vDHb8KS/zktngxJHk42Ll38oOPPhcMpi/f3/NzbonJ1j
 U8/6a61JyKQQttfMSh8jfLwqq2uSz/RM2bZBaadHvssTN0u/rrnrdvy9djRmrdOGqv8Ty4Tj
 XA993a+QnNKz1Vl6i+kSgzW2/crL5/3h0qnM3NvCuKhCiaU4I9FQi7moOBEAYNZPulgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsVy+t/xe7rPNM1jDZ5tUrDoPXeSyeL/tonM
 FvOPnGO1uPL1PZvFib4PrBZLr19kslh9eAGLxf/PT1gtWvceYXfg9Fgzbw2jx95vC1g8Nq3q
 ZPPY/u0Bq8f97uNMHj+XLWXx+LxJzuPl3w/MARxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpG
 JpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehkPZrczFvRwV+x71MzWwPifo4uRk0NCwETi67vt
 bF2MXBxCAksZJTYcu8fYxcgBlJCROL6+DKJGWOLPtS6omteMEouXdrCCJIQFHCTOvtjGBGKL
 CGhJvHjRBhZnFljBJPFuuzCILSTQxyix5wjYMjYBK4mJ7asYQWxeATuJHSuawGwWAVWJJbt+
 sIHYogIREmfer2CBqBGUODnzCZjNKWAt8aOjiR1ivrrEn3mXmCFscYlbT+YzQdjyEtvfzmGe
 wCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZglG479nPLDsau
 d8GHGAU4GJV4eCuYzGOFWBPLiitzDzFKcDArifAGNpjFCvGmJFZWpRblxxeV5qQWH2I0BXpu
 IrOUaHI+MIHklcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgXCXN
 Xnj02CpjzXcaT3ca+n7hmyXKUCzqlt2n3pJQFNq+asZJJ+XD69027j+eJ/s8dHeSQrCmRyl/
 Yad19Q2mEyb707YZeN+Pf/lFsOe7asLdGeUl0+TW6Kh5Cy/aG3BpY+5mjqIHK/Z7WR16GlLz
 pe3ego5pH0OMCrilXNvrDdR3Tbdz+39HiaU4I9FQi7moOBEAmpnqkugCAAA=
X-CMS-MailID: 20190723153814eucas1p118ce10061c55ca4b9bf71c69b8430367
X-Msg-Generator: CA
X-RootMTR: 20190618074155epcas1p3fcfe7cf1058162c11e4b1780987ca394
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190618074155epcas1p3fcfe7cf1058162c11e4b1780987ca394
References: <CGME20190618074155epcas1p3fcfe7cf1058162c11e4b1780987ca394@epcas1p3.samsung.com>
 <20190618074111.9309-1-marko.kohtala@okoko.fi>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563896296;
 bh=VjovTDiMt97xdGE3WlxPMJBYNl8cS2ld4czh4ywLQes=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Fw/By5gb+Pvx3XHO0t9yo5Gd9XnioBXd+skD+fbX575MrlfciU1Vn4L34odu/7W9u
 3+tLaEhTYxWs1njR95YvklWDgFCZX35Ysq7XaeRvMs+gqlYuSHAKVSjipWM3NE19o9
 SXiqyNcREoSv+V6QFbfboXP6tC/CRdnZSwwTcDgo=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org,
 =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTgvMTkgOTo0MSBBTSwgTWFya28gS29odGFsYSB3cm90ZToKPiBUaGUga2VybmVsIGRy
aXZlciBmb3Igc3NkMTMwN2ZiIGRpZCBub3QgYWxsb3cgZm9yIGFsbCBwcm9wZXIKPiBpbml0aWFs
aXphdGlvbiBmb3IgYSBEZW5zaXRyb24gMTI4eDM2IGRpc3BsYXkuIFRoZSB0cmVuZCBpbiB0aGUg
ZHJpdmVyCj4gaGFzIGJlZW4gdG8gYWRkIGRldmljZXRyZWUgcHJvcGVydGllcyBmb3IgdGhlIGNv
bnRyb2xsZXIgaW5pdGlhbGl6YXRpb24KPiBhbmQgdGhlc2UgcGF0Y2hlcyBjb250aW51ZSBvbiB0
aGF0IHRyZW5kLgo+IAo+IFRoZXJlIGFsc28gd2VyZSBzb21lIHNwYXJzZSBhbmQgQ29jY2luZWxs
ZSBlcnJvcnMuCj4gCj4gQSBzbWFsbCBidWcgY2F1c2luZyBzY3JvbGxpbmcgb24gZGlzcGxheSB1
cGRhdGVzIHdpdGggbm9uemVybyBwYWdlX29mZnNldAo+IHdhcyBhIGJpdCBzdXJwcmlzaW5nLiBJ
dCB3b3VsZCBzZWVtIHRoZSBkcml2ZXIgaGFzIG9ubHkgYmVlbiB1c2VkIHdpdGgKPiBwYWdlX29m
ZnNldCBzZXQgdG8gemVyby4gQnVnIGhhcyBiZWVuIHRoZXJlIHNpbmNlIGNvbW1pdAo+IDMwMWJj
MDY3NWI2NzdhOTg0NzUxODcwNTBkNTZjZDJiMzlmZjBhY2YgKCJ2aWRlbzogc3NkMTMwN2ZiOiBN
YWtlIHVzZSBvZgo+IGhvcml6b250YWwgYWRkcmVzc2luZyBtb2RlIikuCj4gCj4gTWFya28gS29o
dGFsYSAoNik6Cj4gICB2aWRlbzogc3NkMTMwN2ZiOiBVc2Ugc2NyZWVuX2J1ZmZlciBpbnN0ZWFk
IG9mIHNjcmVlbl9iYXNlCj4gICB2aWRlbzogc3NkMTMwN2ZiOiBSZW1vdmUgdW5uZWVkZWQgc2Vt
aWNvbG9ucwo+ICAgdmlkZW86IHNzZDEzMDdmYjogU3RhcnQgcGFnZSByYW5nZSBhdCBwYWdlX29m
ZnNldAo+ICAgdmlkZW86IHNzZDEzMDdmYjogSGFuZGxlIHdpZHRoIGFuZCBoZWlnaHQgdGhhdCBh
cmUgbm90IG11bHRpcGxlIG9mIDgKPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBzc2QxMzA3ZmI6
IEFkZCBpbml0aWFsaXphdGlvbiBwcm9wZXJ0aWVzCj4gICB2aWRlbzogc3NkMTMwN2ZiOiBBZGQg
ZGV2aWNldHJlZSBjb25maWd1cmF0aW9uIG9mIGRpc3BsYXkgc2V0dXAKPiAKPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zc2QxMzA3ZmIudHh0IHwgIDEwICsrCj4gIGRyaXZlcnMv
dmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMgICAgICAgICAgICAgICB8IDEzMCArKysrKysrKysrKyst
LS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMDEgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25z
KC0pClBhdGNoIHNlcmllcyBxdWV1ZWQgZm9yIHY1LjQsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywK
LS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5k
ClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
