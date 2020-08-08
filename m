Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852E23F6E9
	for <lists+dri-devel@lfdr.de>; Sat,  8 Aug 2020 10:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5326E14F;
	Sat,  8 Aug 2020 08:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCE06E14F
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 08:10:33 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 646CD20028;
 Sat,  8 Aug 2020 10:10:25 +0200 (CEST)
Date: Sat, 8 Aug 2020 10:10:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH V2] drm: Remove unnecessary drm_panel_attach and
 drm_panel_detach
Message-ID: <20200808081024.GA1716759@ravnborg.org>
References: <20200801120216.8488-1-bernard@vivo.com>
 <20200802070743.GA822300@ravnborg.org>
 <f1fbc362695af155a30627ef69b375e8a3daaa55.camel@perches.com>
 <20200802084411.GA908790@ravnborg.org>
 <9e13761020750b1ce2f1fabee23ef6e2a2942882.camel@perches.com>
 <20200802173413.GA343746@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802173413.GA343746@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=IJv9LcIfAAAA:8 a=klGKM5VlYPBqXGvcqpQA:9
 a=QEXdDO2ut3YA:10 a=cmr4hm9N53k6aw-X_--Q:22
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
Cc: opensource.kernel@vivo.com, Stefan Mavrodiev <stefan@olimex.com>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Chiras <robert.chiras@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9lLgoKT24gU3VuLCBBdWcgMDIsIDIwMjAgYXQgMDc6MzQ6MTNQTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IEhpIEpvZS4KPiAKPiBPbiBTdW4sIEF1ZyAwMiwgMjAyMCBhdCAwOTo0
Mzo1OUFNIC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiA+IFRoZXNlIGZ1bmN0aW9ucyBhcmUg
bm93IGVtcHR5IGFuZCBubyBsb25nZXIKPiA+IHVzZWZ1bCBzbyByZW1vdmUgdGhlIGZ1bmN0aW9u
cyBhbmQgdGhlaXIgdXNlcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSm9lIFBlcmNoZXMgPGpv
ZUBwZXJjaGVzLmNvbT4KPiA+IC0tLQo+ID4gCj4gPiA+ID4gSXQncyB0b28gdGVkaW91cyB0byBi
cmVhayBhcGFydCBpbnRvIG11bHRpcGxlIHBhdGNoZXMuCj4gPiA+ID4gRG9uZSB3aXRoIGNvY2Np
bmVsbGUgYW5kIHR5cGluZy4KPiA+ID4gPiAKPiA+ID4gPiBDb21waWxlZCBhbGx5ZXNjb25maWcg
eDg2LTY0IG9ubHkuCj4gPiAKPiA+IFYyOiBSZW1vdmVkIDMgYWRkaXRpb25hbCBsaW5lcwo+ID4g
Cj4gPiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jOjM5MDoyNzogd2FybmluZzog
dW51c2VkIHZhcmlhYmxlIOKAmHByaXbigJkgWy1XdW51c2VkLXZhcmlhYmxlXQo+ID4gZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RwaS5jOjQ1OjIxOiB3YXJuaW5nOiB1bnVzZWQg
dmFyaWFibGUg4oCYY3R44oCZIFstV3VudXNlZC12YXJpYWJsZV0KPiA+IGRyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW40aV9sdmRzLmM6NTc6MjE6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhs
dmRz4oCZIFstV3VudXNlZC12YXJpYWJsZV0KPiAKPiBUaGFua3MsIGJldHRlciBub3cuCj4gCj4g
SSBoYWQgdG8gZml4IGEgZmV3IHdhcm5pbmdzIGFuZCBhIGJ1aWxkIGVycm9yIHRvIGdldCBpdCBn
b2luZyBvbgo+IGRybS1taXNjLW5leHQuIEkgd2lsbCBrZWVwIGl0IGxvY2FsbHkganVzdCB0byBs
ZXQgYW55b25lIHNwZWFrIHVwLgo+IEkgeW91IGRvIG5vdCBzZWUgYW55IG1haWwgZnJvbSBtZSB1
bnRpbCBmcmlkYXkgdGhhdCBpdCBpcyBhcHBsaWVkIHBsZWFzZQo+IHBpbmcgbWUuClRoYW5rcywg
Tm93IGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dC4gV2lsbCBzaG93IHVwIGluIC1uZXh0IHNvbWV0
aW1lcyBhZnRlciB0aGUKY3VycmVudCBtZXJnZSB3aW5kb3cgY2xvc2VzLgoKCVNhbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
