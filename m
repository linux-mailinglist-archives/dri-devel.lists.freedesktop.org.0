Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A1DB0EA6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 14:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C045C6ECF7;
	Thu, 12 Sep 2019 12:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E886ECF7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 12:11:43 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD4AC33A;
 Thu, 12 Sep 2019 14:11:40 +0200 (CEST)
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <a9cc2193-0a18-0490-c273-c64bd70992f5@ideasonboard.com>
 <CAMuHMdVYqx_znkMbwCVyA6WH8-0uOotL3wXCTkvyXG1=i9W-ng@mail.gmail.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <b0b689e6-2f99-049f-23a7-213678d6a7a6@ideasonboard.com>
Date: Thu, 12 Sep 2019 13:11:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVYqx_znkMbwCVyA6WH8-0uOotL3wXCTkvyXG1=i9W-ng@mail.gmail.com>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568290301;
 bh=NOv4MyRD/H4sN33iCT3cWaXxofQTNOSbcc5mu90xRJ4=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=V3K7kyI+B8VIXUeBNONAh5xlpsnF22g3XbXJ2RLNyU58NmUmY2KkyNiCIO4jHepad
 ObfbkW0mrY7QBlxGkxM5zLpivD5h3NECfvONQQOb2Xu1UbW4NAMguOSWw3eVJLpg9p
 3I4zFBb1Fgj9P5M7fOgO7BPFwOugJ9oOS9/LUom0=
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMDkvMjAxOSAxMzowMywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIEtpZXJh
biwKPiAKPiBPbiBUaHUsIFNlcCAxMiwgMjAxOSBhdCAxMjoyNiBQTSBLaWVyYW4gQmluZ2hhbQo+
IDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+PiAocHVs
bGluZyBpbiArR2VlcnQgZm9yIGhpcyBvcGluaW9uIG9uIGNvbXBhdGlibGUgc3RyaW5nIHVzYWdl
cykKPj4KPj4gT24gMTIvMDkvMjAxOSAxMTowMCwgU2VyZ2VpIFNodHlseW92IHdyb3RlOj4gSGVs
bG8hCj4+PiBPbiAxMS4wOS4yMDE5IDIyOjI1LCBLaWVyYW4gQmluZ2hhbSB3cm90ZToKPj4+PiBB
ZGQgZGlyZWN0IHN1cHBvcnQgZm9yIHRoZSByOGE3Nzk4MCAoVjNIKS4KPj4+Pgo+Pj4+IFRoZSBW
M0ggc2hhcmVzIGEgY29tbW9uLCBjb21wYXRpYmxlIGNvbmZpZ3VyYXRpb24gd2l0aCB0aGUgcjhh
Nzc5NzAKPj4+PiAoVjNNKSBzbyB0aGF0IGRldmljZSBpbmZvIHN0cnVjdHVyZSBpcyByZXVzZWQu
Cj4+Pgo+Pj4gICAgRG8gd2UgcmVhbGx5IG5lZWQgdG8gYWRkIHlldCBhbm90aGVyIGNvbXBhdGli
bGUgaW4gdGhpcyBjYXNlPwo+Pj4gSSBqdXN0IGFkZGVkIHI4YTc3OTcwIHRvIHRoZSBjb21wYXRp
YmxlIHByb3AgaW4gdGhlIHI4YTc3OTgwIERULiBUaGF0J3Mgd2h5Cj4+PiBhIHBhdGNoIGxpa2Ug
dGhpcyBvbmUgZGlkbid0IGdldCBwb3N0ZWQgYnkgbWUuCj4+Cj4+IEl0J3Mgbm90IGp1c3QgYWJv
dXQgdGhlIGNvbXBhdGlibGUgc3RyaW5nIGZvciBtZSBoZXJlLAo+Pgo+PiBUaGVyZSBpcyBubyBp
bmRpY2F0aW9uIGluIHRoZSBkcml2ZXIgdGhhdCBpdCBzdXBwb3J0cyB0aGUgcjhhNzc5ODAsIGFu
ZAo+PiBubyBjb21tZW50IGluIHRoZSBkcml2ZXIgdG8gZXhwbGFpbiB0aGF0IHRoZSByOGE3Nzk4
MCBpcyBzaGFyZWQgYnkgdGhlCj4+IHI4YTc3OTcwLgo+Pgo+PiBUaGlzIHBhdGNoIG1ha2VzIHRo
YXQgZXhwbGljaXQgYXQgdGhlIGRyaXZlci4KPj4KPj4gQWxzbyAtIEkgYW0gY29uc2lkZXJpbmcg
c2VuZGluZyBhIHBhdGNoICh0aGF0IEkndmUgYWxyZWFkeSBjcmVhdGVkCj4+IGFueXdheSkgdG8g
cmVtb3ZlIHRoZSByOGE3Nzk3MCByZWZlcmVuY2UgZnJvbSB0aGUKPj4KPj4gICBhcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5ODAuZHRzaSBmaWxlLgo+Pgo+PiBUaGlzIGlzIHRoZSAq
b25seSogbm9uIHI4YTc3OTgwIHJlZmVyZW5jZSBpbiB0aGlzIGZpbGUsIHNvIGl0IHNlZW1zIHZl
cnkKPj4gb3V0IG9mIHBsYWNlLgo+IAo+IEFncmVlZC4KPiAKPj4gSW4gZmFjdCBtb3JlIHNvIHRo
YW4gdGhhdCAtIGV4Y2VwdCBmb3IgYSBzZWVtaW5nbHkgZ2xhcmluZyB0eXBvLCB0aGF0Cj4+IEkn
bGwgaW52ZXN0aWdhdGUgYW5kIHNlbmQgYSBwYXRjaCBmb3IgbmV4dCwgdGhpcyBpcyB0aGUgKm9u
bHkqIGNyb3NzLXNvYwo+PiBjb21wYXRpYmxlIHJlZmVyZW5jZToKPj4KPj4gIyEvYmluL3NoCj4+
Cj4+IGZpbGVzPXI4YTc3Ki5kdHNpCj4+Cj4+IGZvciBmIGluICRmaWxlczsKPj4gZG8KPj4gICAg
ICAgICBzb2M9YGJhc2VuYW1lICRmIC5kdHNpIHwgc2VkICdzLy0uKi8vJ2AKPj4gICAgICAgICBl
Y2hvICJGOiAkZiBzb2M6ICRzb2MiOwo+Pgo+PiAgICAgICAgICMgRmluZCBhbGwgcmVmZXJlbmNl
cyB0byBhbGwgc29jcywgdGhlbiBoaWRlICd0aGlzJyBzb2MKPj4gICAgICAgICBncmVwIHI4YTc3
ICRmIHwgZ3JlcCAtdiAkc29jCj4gCj4gVGhpcyBoaWRlcyB0aGUgY29tcGxldGUgbGluZS4gIFNv
IHlvdSBiZXR0ZXIgdXNlIGUuZy4KPiAKPiAgICAgc2VkIC1lICJzLyRzb2Mvc29jL2lnIiAkZiB8
IGdyZXAgLWkgcjhhCgpBaGEgeWVzLCBleGNlbGxlbnQgcG9pbnQhIChJJ20gZ2xhZCBJIHBvc3Rl
ZCBteSB3b3JraW5nKQoKPiAKPiBpbnN0ZWFkLiAgTm8gbmV3IG9mZmVuZGVycywgdGhvdWdoLgoK
UGhldywgSSBzdGlsbCBnb3QgdGhlIHJpZ2h0IGFuc3dlciA6LUQKCi0tCktpZXJhbgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
