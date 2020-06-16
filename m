Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E31FC73E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FF66EA8B;
	Wed, 17 Jun 2020 07:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB53B6E8F1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 15:30:47 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 2F8D88123;
 Tue, 16 Jun 2020 15:31:37 +0000 (UTC)
Date: Tue, 16 Jun 2020 08:30:42 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
Message-ID: <20200616153042.GZ37466@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
 <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
 <20200603140639.GG37466@atomide.com>
 <47e286dd-f87a-4440-5bde-1f7b53e8b672@ti.com>
 <20200609151943.GL37466@atomide.com>
 <9ed70121-2a53-d2b3-051a-88eb83e6c53f@ti.com>
 <d03dd04f-6f2c-25ba-fe1f-d5fc0dfb5c68@ti.com>
 <592501c9-2d94-b266-ae76-e383d3bffa29@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <592501c9-2d94-b266-ae76-e383d3bffa29@ti.com>
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPiBbMjAwNjE2IDEzOjAyXToK
PiBPbiAxMS8wNi8yMDIwIDE3OjAwLCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90ZToKPiA+IEkgdGhp
bmssIHN1c3BlbmQgbWlnaHQgYmUgZml4ZWQgaWYgYWxsIGRldmljZXMsIHdoaWNoIGFyZSBub3cg
Y2hpbGQgb2YgdGktc3lzYywgd2lsbCBkbwo+ID4gcG1fcnVudGltZV9mb3JjZV94eHgoKSBjYWxs
cyBhdCBub2lycSBzdXNwZW5kIHN0YWdlIGJ5IGFkZGluZzoKPiA+IAo+ID4gIMKgwqDCoMKgU0VU
X05PSVJRX1NZU1RFTV9TTEVFUF9QTV9PUFMocG1fcnVudGltZV9mb3JjZV9zdXNwZW5kLAo+ID4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwbV9ydW50aW1lX2Zv
cmNlX3Jlc3VtZSkKPiA+IAo+ID4gQW0gSSBtaXNzaW5nIHNtdGg/Cj4gCj4gSXNuJ3QgdGhpcyBh
bG1vc3QgZXhhY3RseSB0aGUgc2FtZSBteSBwYXRjaCBkb2VzPyBJIGp1c3QgdXNlZCBzdXNwZW5k
X2xhdGUKPiBhbmQgcmVzdW1lX2Vhcmx5LiBJcyBub2lycSBwaGFzZSBiZXR0ZXIgdGhhbiBsYXRl
ICYgZWFybHk/CgpXZWxsIHVwIHRvIHlvdSBhcyBmYXIgYXMgSSdtIGNvbmNlcm5lZC4gVGhlIG5v
aXJxIHBoYXNlIGNvbWVzIHdpdGggc2VyaW91cwpsaW1pdGF0aW9ucywgZm9yIGxldCdzIHNheSBp
MmMgYnVzIHVzYWdlIGlmIG5lZWRlZC4gUHJvYmFibHkgYWxzbyBoYXJkZXIKdG8gZGVidWcgZm9y
IHN1c3BlbmQgYW5kIHJlc3VtZS4KClJlZ2FyZHMsCgpUb255Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
