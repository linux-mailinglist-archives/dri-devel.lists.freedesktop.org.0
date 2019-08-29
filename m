Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D522A1F0E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 17:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7E86E10B;
	Thu, 29 Aug 2019 15:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1611C6E10B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 15:26:57 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7B4A2342E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 15:26:56 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id c189so1728772qkg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 08:26:56 -0700 (PDT)
X-Gm-Message-State: APjAAAXUAyKB+0jKvIrDC6OLSkKzNfKFv+abxgTQhFdjlJJRjXM66p7X
 YfQV3vUbrpgpQ0nSAX+UueMipQEb+Vw8Y828wg==
X-Google-Smtp-Source: APXvYqwpfIKijR3krvhxBbOcuXprzAlMFrP7pRI7j1UXKERObZYR+sKPh8ZKFsOblUy4X3oiWnIbSfzV1lql8lzhaiI=
X-Received: by 2002:a37:4941:: with SMTP id w62mr9319300qka.119.1567092415814; 
 Thu, 29 Aug 2019 08:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 29 Aug 2019 10:26:43 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+5FMHK4W4UQU24g+rm3CLjnhRcB29skygRB++GaJyM0A@mail.gmail.com>
Message-ID: <CAL_Jsq+5FMHK4W4UQU24g+rm3CLjnhRcB29skygRB++GaJyM0A@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add dual-LVDS panel support to EK874
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567092416;
 bh=L+4ClaRi9fsykE32xB4xhDmYla9Xiavn1wqCMCMursM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YQI2zazxcGJYwGnMOBrNMMxEPo5oFzhrDk9+MilWCL+KAoP8rKKDgHfufr1foeqeP
 QSCFvW+tV30oJMZ4OWJ7859VnJK4QUc5OXu2QgkA43Vr9CRTGzKR4KESa6U1OeOAye
 5Sy2mg+SEmmRG4WYyimWY/ci+PiF1Z0X6j6cZpLI=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, ebiharaml@si-linux.co.jp,
 devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 xu_shunji@hoperun.com, Biju Das <biju.das@bp.renesas.com>,
 Simon Horman <horms@verge.net.au>, Sean Paul <sean@poorly.run>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTozNiBQTSBGYWJyaXppbyBDYXN0cm8KPGZhYnJpemlv
LmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6Cj4KPiBEZWFyIEFsbCwKPgo+IHRoaXMgc2Vy
aWVzIGFkZHMgc3VwcG9ydCBmb3IgZHVhbC1MVkRTIHBhbmVsIElESy0yMTIxV1IKPiBmcm9tIEFk
dmFudGVjaDoKPiBodHRwczovL2J1eS5hZHZhbnRlY2guZXUvRGlzcGxheXMvRW1iZWRkZWQtTENE
LUtpdHMtSGlnaC1CcmlnaHRuZXNzL21vZGVsLUlESy0yMTIxV1ItSzJGSEEyRS5odG0KPgo+IFYz
IGFwcHJvYWNoZXMgdGhlIHByb2JsZW0gaW4gYSBjb21wbGV0ZWx5IGRpZmZlcmVudCB3YXksIHdl
IG5vdwo+IGhhdmUgdHdvIG5ldyBwcm9wZXJ0aWVzIHRvIG1hcmsgdGhlIHBvcnRzIGluIHRoZSBE
VCBhcyByZWNlaXZpbmcKPiBldmVuIHBpeGVscyBhbmQgb2RkIHBpeGVsczogZHVhbC1sdmRzLWV2
ZW4tcGl4ZWxzIGFuZCBkdWFsLWx2ZHMtb2RkLXBpeGVscywKPiB3aGljaCBtZWFucyBkZXZpY2Ug
ZHJpdmVycyBzaG91bGQgbm90IHVzZSBicmlkZ2Ugc3BlY2lmaWMgb3IgcGFuZWwKPiBzcGVjaWZp
YyBkdWFsX2xpbmsgZmxhZ3MuIEFsc28sIGluIHRoaXMgY2FzZSB0aGUgRFQgZGVzY3JpYmVzIHRo
ZQo+IGNvbm5lY3Rpb24gZnVsbHkuCj4KPiBJbiBvcmRlciBmb3IgdGhlIHNvbHV0aW9uIHRvIGJl
IGdlbmVyaWMsIEkgaGF2ZSBleHBvcnRlZCBhIG5ldyBoZWxwZXIKPiAoZHJtX29mX2x2ZHNfZ2V0
X2R1YWxfbGlua19jb25maWd1cmF0aW9uKSB0byB3YWxrIHRoZSBkZXZpY2UgdHJlZSwKPiBhbmQg
ZmlndXJlIG91dCBpZiB0aGUgY29ubmVjdGlvbiBpcyBkdWFsLUxWRFMuIFRoZSBzYW1lIGhlbHBl
ciBnaXZlcwo+IGluZm9ybWF0aW9uIGFib3V0IHRoZSBjb25maWd1cmF0aW9uIG9mIHRoZSBjb25u
ZWN0aW9uLiBJZiBQeCBpcyBjb25uZWN0ZWQKPiB0byBhIHBvcnQgZXhwZWN0aW5nIGV2ZW4gcGl4
ZWxzIGFuZCBQeSBpcyBjb25uZWN0ZWQgdG8gYSBwb3J0IGV4cGVjdGluZwo+IG9kZCBwaXhlbHMs
IHRoZW4gdGhlIGhlbHBlciByZXR1cm5zIERSTV9MVkRTX0RVQUxfTElOS19FVkVOX09ERF9QSVhF
TFMKPiAobGlrZSBpbiB0aGUgZXhhbXBsZSBiZWxvdyksIG90aGVyd2lzZSBpdCByZXR1cm5zCj4g
RFJNX0xWRFNfRFVBTF9MSU5LX09ERF9FVkVOX1BJWEVMUy4KPgo+Cj4gIC0tLS0tLS0tICAgICAg
ICAgICAgZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzICAtLS0tLS0tLQo+IHwgICAgICAgIHwtLS0tICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tLS18ICAgICAgICB8Cj4gfCAgICAgICAgfCBQeCB8LS0t
LS0tLS0tLS0tLS0tLS0tLS0tLT58IFBuIHwgICAgICAgIHwKPiB8ICAgICAgICB8LS0tLSAgICAg
ICAgICAgICAgICAgICAgICAgICAtLS0tfCAgICAgICAgfAo+IHwgU09VUkNFIHwgICAgICAgICAg
IGR1YWwtbHZkcy1vZGQtcGl4ZWxzICB8ICBTSU5LICB8Cj4gfCAgICAgICAgfC0tLS0gICAgICAg
ICAgICAgICAgICAgICAgICAgLS0tLXwgICAgICAgIHwKPiB8ICAgICAgICB8IFB5IHwtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tPnwgUG0gfCAgICAgICAgfAo+IHwgICAgICAgIHwtLS0tICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tLS18ICAgICAgICB8Cj4gIC0tLS0tLS0tICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLS0tLS0tLQo+Cj4gVGhlIGRldmljZSBkcml2ZXIgZm9yIHRo
ZSBlbmNvZGVyIHRoZW4gd2lsbCB3b3JrIG91dCBpZiB3aXRoIHRoZSBjdXJyZW50Cj4gd2lyaW5n
IHRoZSBwaXhlbHMgbmVlZCBzd2FwcGluZyBvciBub3QuCj4KPiBUaGUgc2FtZSBzb2x1dGlvbiB3
b3JrcyBmb3IgYm90aCBwYW5lbHMgYW5kIGJyaWRnZXMuCj4KPiBTaW5jZSB0aGUgRFQgZGVzY3Jp
YmVzIHRoZSBjb25uZWN0aW9uIGZ1bGx5LCBkcml2ZXIKPiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtbHZkcy5jIHdvcmtzIG91dC1vZi10aGUtYm94LCBubyBjaGFuZ2VzCj4gcmVxdWlyZWQs
IGhvd2V2ZXIsIHRoaXMgaW1wbGVtZW50YXRpb24gb3BlbnMgdXAgYSBwcm9ibGVtIHdpdGggdGhl
Cj4gZHQtYmluZGluZ3MuCj4gRHJpdmVyIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRz
LmMgY2FuIHN0aWxsIGJlIHBsZWFzZWQgYnkKPiBhIHBvcnQgbm9kZSwgYnV0IGFsc28gYnkgYSBw
b3J0cyBub2RlLgo+IEkgaGF2ZSBjcmVhdGVkIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2J1cy10aW1pbmdzL2x2ZHMueWFtbAo+IHdpdGggdGhlIGlkZWEgb2YgaW5j
bHVkaW5nIGl0IGZyb20gcGFuZWxzIGFuZCBicmlkZ2VzIGR0LWJpbmRpbmdzCj4gc3VwcG9ydGlu
ZyBkdWFsLUxWRFMgKGFuZCBvZiBjb3Vyc2UgdGhlIGR0LWJpbmRpbmdzIGZvciB0aGUgc3BlY2lm
aWMKPiBkZXZpY2VzIHNob3VsZCBzYXkgd2hpY2ggcG9ydCBzaG91bGQgYmUgbWFya2VkIGFzIHdo
YXQpLCBidXQgZmlsZQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL2x2ZHMueWFtbCBmb3JtYWxseQo+IHJlcXVpcmVzIHByb3BlcnR5ICJwb3J0Iiwgd2hp
bGUgd2l0aCB0aGlzIGltcGxlbWVudGF0aW9uIGl0IHNob3VsZCByZXF1aXJlCj4gT25lT2YgInBv
cnQiIGFuZCAicG9ydHMiLCBhbmQgdW5mb3J0dW5hdGVseSBJIGNhbid0IHNlZW0gdG8gZmluZCBh
IG5lYXQgd2F5Cj4gYXJvdWQgdGhhdCwgb3RoZXIgdGhhbiBjcmVhdGluZyBhIG5ldyBjb21wYXRp
YmxlIHN0cmluZwoKSnVzdCBhZGQgJ3BvcnRzJyBhbmQgZHJvcCAncG9ydCcgZnJvbSBiZWluZyBy
ZXF1aXJlZCBpbiB0aGUgY29tbW9uCmJpbmRpbmcuIFRoZW4gaXQgaXMgdXAgdG8gdGhlIHBhbmVs
IHNwZWNpZmljIGJpbmRpbmdzIHRvIGRlZmluZSB3aGljaApvbmUgaXMgcmVxdWlyZWQuIE9yIHdl
IGp1c3QgbGVhdmUgaXQgdG8gYWxsb3cgZWl0aGVyIGZvcm0gd2hpY2ggdGhlCmdyYXBoIGNvZGUg
Y2FuIGhhbmRsZS4KCldlIGNvdWxkIGhhdmUgdGhpcyBpbiB0aGUgY29tbW9uIGJpbmRpbmc6Cgpv
bmVPZjoKIC0gcmVxdWlyZWQ6IFtwb3J0c10KIC0gcmVxdWlyZWQ6IFtwb3J0XQoKUm9iCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
