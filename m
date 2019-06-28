Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C8C5A00C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 17:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EFC6E956;
	Fri, 28 Jun 2019 15:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02156E956
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 15:55:48 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id e5so13558345iok.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 08:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qvsku1LsJlCMNeTol53NqA/7OgT8tqKKHqYv+Wh37GE=;
 b=V+2KlzZ0uLdauIEiGkKYhCoLxoEPgzAOcnF20v7r9nACOKGMDSACpzCC6P4RYWycHZ
 pjigPmIEZiPSu4vir/OvMSb9HK5Y7ZfO1AkGiSDmx1N6v609lKu/7A4xM4hCAz8tsEWJ
 n2oxszkQgF2RloywSySUe6ZbkyEm2WxhCJvV8RUSPGb/IbwxOYikSmSZ991ii+XOE+Gw
 ZIuyG+pI0ByYHnoG0Wg/XZ9XlxXdQa7gbV3JWQoj07BINL4Ic/KVocnTZC/X7A39tQbM
 wrExbpLsPihXeco8MxqSiav6fmqttRTIcVqSRJN92CGQP23UY3ZpJbL8VEBatFDzDLSl
 PtLA==
X-Gm-Message-State: APjAAAWgqBVHMFqPlpiNwo5N8L26Zi7EDnUziui+8dWC9OQl6AKCJA7b
 fAIgtKuUwbQghZyMpADC+Ybzwse3UJU=
X-Google-Smtp-Source: APXvYqyMJwr0uO1E/mG/wt4AtmEBat0GTPktA9qTwpBwst2iMET3Vk8jvZ6F/fF+PpA2seHzKIWYlQ==
X-Received: by 2002:a5e:d612:: with SMTP id w18mr11283295iom.279.1561737347590; 
 Fri, 28 Jun 2019 08:55:47 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id z1sm2184019ioh.52.2019.06.28.08.55.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 08:55:45 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id w25so13515721ioc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 08:55:44 -0700 (PDT)
X-Received: by 2002:a5d:96d8:: with SMTP id r24mr1014520iol.269.1561737344434; 
 Fri, 28 Jun 2019 08:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190626130007.GE23428@ravnborg.org>
 <CAD=FV=U4UU8q+CS76uuuGUP=EVnE6+BTUf8U=j7uwfczNgkrZw@mail.gmail.com>
In-Reply-To: <CAD=FV=U4UU8q+CS76uuuGUP=EVnE6+BTUf8U=j7uwfczNgkrZw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 28 Jun 2019 08:55:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vi2C7s2oWBDD0n+HK=_SuBYhRM9saMK-y6Qa0+k-g17w@mail.gmail.com>
Message-ID: <CAD=FV=Vi2C7s2oWBDD0n+HK=_SuBYhRM9saMK-y6Qa0+k-g17w@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] drm/panel: simple: Add mode support to devicetree
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qvsku1LsJlCMNeTol53NqA/7OgT8tqKKHqYv+Wh37GE=;
 b=CzTrUukzMMeVRGwtHonyk2yl+qyq6WCscFXVn/MC+4gnXi3vA+3kMHy6iRQGqVZrU5
 w20Qcluka+u28ayDtwVRqBQcrYz+4pCRRXefNm0+pAj+0E4hSBY3IzGe9/jYZeN6+zm7
 0cy9PihW6uY+H+FazttpKeB7XOxwJRVWhPe0M=
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
 Brian Norris <briannorris@chromium.org>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Matthias Kaehlcke <mka@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCA3OjQxIEFNIERvdWcgQW5kZXJzb24gPGRpYW5k
ZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIFdlZCwgSnVuIDI2LCAyMDE5
IGF0IDY6MDAgQU0gU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90ZToKPiA+Cj4g
PiBIaSBEb3VnbGFzLgo+ID4KPiA+IE9uIE1vbiwgQXByIDAxLCAyMDE5IGF0IDEwOjE3OjE3QU0g
LTA3MDAsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiA+IEknbSByZXZpdmluZyBTZWFuIFBh
dWwncyBvbGQgcGF0Y2hzZXQgdG8gZ2V0IG1vZGUgc3VwcG9ydCBpbiBkZXZpY2UKPiA+ID4gdHJl
ZS4gIFRoZSBjb3ZlciBsZXR0ZXIgZm9yIGhpcyB2MyBpcyBhdDoKPiA+ID4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTgtRmVicnVhcnkvMTY1MTYy
Lmh0bWwKPiA+ID4KPiA+ID4gTm8gY29kZSBpcyBkaWZmZXJlbnQgYmV0d2VlbiB2NCBhbmQgdjUs
IGp1c3QgY29tbWl0IG1lc3NhZ2VzIGFuZCB0ZXh0Cj4gPiA+IGluIHRoZSBiaW5kaW5ncy4KPiA+
ID4KPiA+ID4gSSd2ZSBwdWxsZWQgdG9nZXRoZXIgdGhlIHBhdGNoZXMgdGhhdCBkaWRuJ3QgbGFu
ZCBpbiB2MywgYWRkcmVzc2VkCj4gPiA+IG91dHN0YW5kaW5nIGZlZWRiYWNrLCBhbmQgcmVwb3N0
ZWQuICBBdG9wIHRoZW0gSSd2ZSBhZGRlZCBwYXRjaGVzIGZvcgo+ID4gPiByazMyODgtdmV5cm9u
LWNocm9tZWJvb2sgKHVzZWQgZm9yIGphcSwgamVycnksIG1pZ2h0eSwgc3BlZWR5KSBhbmQKPiA+
ID4gcmszMjg4LXZlcnlvbi1taW5uaWUuCj4gPiA+Cj4gPiA+IFBsZWFzZSBsZXQgbWUga25vdyBo
b3cgdGhleSBsb29rLgo+ID4gPgo+ID4gPiBJbiBnZW5lcmFsIEkgaGF2ZSBhZGRlZCBwZW9wbGUg
dG8gdGhlIHdob2xlIHNlcmllcyB3aG8gSSB0aGluayB3b3VsZAo+ID4gPiBsaWtlIHRoZSB3aG9s
ZSBzZXJpZXMgYW5kIHRoZW4gbGV0IGdldF9tYWludGFpbmVyIHBpY2sgZXh0cmEgcGVvcGxlIGl0
Cj4gPiA+IHRoaW5rcyBhcmUgcmVsZXZhbnQgdG8gZWFjaCBpbmRpdmlkdWFsIHBhdGNoLiAgSWYg
SSBzZWUgeW91IHJlc3BvbmQgdG8KPiA+ID4gYW55IG9mIHRoZSBwYXRjaGVzIGluIHRoZSBzZXJp
ZXMsIHRob3VnaCwgSSdsbCBhZGQgeW91IHRvIHRoZSB3aG9sZQo+ID4gPiBzZXJpZXMgQ2MgbGlz
dCBuZXh0IHRpbWUuCj4gPiA+Cj4gPiA+IENoYW5nZXMgaW4gdjU6Cj4gPiA+IC0gUmVtb3ZlZCBi
aXQgYWJvdXQgT1MgbWF5IGlnbm9yZSAoUm9iL0V6ZXF1aWVsKQo+ID4gPiAtIEFkZGVkIEhlaWtv
J3MgVGVzdGVkLWJ5Cj4gPiA+IC0gSXQncyBub3QganVzdCBqZXJyeSwgaXQncyBtb3N0IHJrMzI4
OCBDaHJvbWVib29rcyAoSGVpa28pCj4gPgo+ID4gV2hhdCBhcmUgdGhlIHBsYW5zIHRvIG1vdmUg
Zm9yd2FyZCB3aXRoIHRoaXM/Cj4gPiBPciBkaWQgeW91IGRyb3AgdGhlIHdob2xlIGlkZWEgYWdh
aW4/Cj4KPiBBdCB0aGUgbW9tZW50IEknbSBibG9ja2VkIG9uIFRoaWVycnkgcmVzcG9uZGluZywg
ZWl0aGVyIHRha2luZyB0aGUKPiBwYXRjaCBvciB0ZWxsaW5nIG1lIHdoYXQgSSBuZWVkIHRvIGRv
IHRvIGZpeCBpdC4gIEkgc2F3IFNlYW4gUGF1bCBwaW5nCj4gVGhpZXJyeSBvbiBJUkMgb24gSnVu
ZSAzcmQgYW5kIGFzIGZhciBhcyBJIGNvdWxkIHRlbGwgdGhlcmUgd2FzIG5vCj4gcmVzcG9uc2Uu
Cj4KPiBodHRwczovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmNicmlsbC9kcmktbG9nLz9jaGFu
bmVsPWRyaS1kZXZlbCZoaWdobGlnaHRfbmFtZXM9JmRhdGU9MjAxOS0wNi0wMyZzaG93X2h0bWw9
dHJ1ZQo+Cj4gLi4uYW5kIGFzIHlvdSBjYW4gc2VlIEhlaWtvIHBpbmdlZCB0aGlzIHRocmVhZCBv
biBKdW5lIDE0dGguCj4KPiBUaGllcnJ5OiBjYW4geW91IGhlbHAgZ2l2ZSB1cyBzb21lIGRpcmVj
dGlvbj8gIEFyZSB5b3UgdW5pbnRlcmVzdGVkIGluCj4gcmV2aWV3aW5nIHRoZW0gYW5kIHdvdWxk
IHByZWZlciB0aGF0IEkgZmluZCBzb21lb25lIHRvIGxhbmQgdGhlbSBpbgo+IGRybS1taXNjIGRp
cmVjdGx5PwoKU2FtOiBPaCEgIEkgaGFkbid0IG5vdGljZWQgdGhhdCB5b3UndmUgYmVlbiBhZGRl
ZCBhcyBhIHBhbmVsCm1haW50YWluZXIgaW4gY29tbWl0IGVmMGRiOTRmOTRhMCAoIk1BSU5UQUlO
RVJTOiBBZGQgU2FtIGFzIHJldmlld2VyCmZvciBkcm0vcGFuZWwiKS4gIERvZXMgdGhhdCBtZWFu
IHlvdSBhcmUgYWJsZSB0byBwcm92aWRlIHNvbWUgYWR2aWNlCmZvciBob3cgdG8gbGFuZCB0aGlz
IHNlcmllcz8gIEFzIGZhciBhcyBJIGtub3cgZXZlcnl0aGluZyBpcyBpbiBvcmRlcgpmb3IgaXQg
dG8gbGFuZCwgYnV0IGlmIHlvdSBhcmUgYXdhcmUgb2Ygc29tZXRoaW5nIEkgbmVlZCB0byBkbyB0
byBzcGluCml0IHRoZW4gcGxlYXNlIGxldCBtZSBrbm93IQoKVGhhbmtzIQoKLURvdWcKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
