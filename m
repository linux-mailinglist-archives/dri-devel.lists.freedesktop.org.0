Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3132AF4C
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 09:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB84898A3;
	Mon, 27 May 2019 07:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D52898A7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 07:17:34 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p26so25263478edr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 00:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=QwuBQ1X+pSV3hALrqNIHUzC0vaq4QLHWjQ6iDVz7qqA=;
 b=Wut0xzzaRsdZiO3vrjPf6AyrJktE6+cDjoC96Ub1JcJEJSePyYd0BLPDBI0E9yV9h5
 vGvEL2WQFUU1Lh989ixJBuZWnq5cEkdQSXmL8VYO93yVHPlgcZ3OgE9Lm2n8aU43JGhU
 LnCbw+jPhPtH1x5mPM5tFNVhn/7G87IUC7Gp/Kb7pcXB/z1nI1AmWHxVMltdTFgzeR8c
 2vC5Ae8cxORc/EQGxULhH3gFIrwWCxBvKdE7KqSbP/jTHMla6E65jFRNe3Y3djpIZR7g
 YmNOZUudanZp33BsyXymWLtWauO6rWU31GtGBOBKbExwCEHpOjTG/6P/jmOzh+eo2pP9
 URmA==
X-Gm-Message-State: APjAAAXb1o0iCZDj4OKLscULWC1s7hXUVH0WbjsJJa7fuhAHiEPcK6Jq
 bdUvr/JxjzsLapKpub7Hx/ODsg==
X-Google-Smtp-Source: APXvYqyajJVzug0/cOZboL2gRmo5k48fYzLzelbPSB9nBVL3vfoMbrW3Svg7HlgWB+pN8HC2Ve1zaA==
X-Received: by 2002:a50:9765:: with SMTP id
 d34mr121806735edb.195.1558941452773; 
 Mon, 27 May 2019 00:17:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a17sm2992004edt.63.2019.05.27.00.17.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 May 2019 00:17:31 -0700 (PDT)
Date: Mon, 27 May 2019 09:17:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 00/33] fbcon notifier begone!
Message-ID: <20190527071729.GM21222@phenom.ffwll.local>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
 <20190525171928.GA13526@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190525171928.GA13526@ravnborg.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=QwuBQ1X+pSV3hALrqNIHUzC0vaq4QLHWjQ6iDVz7qqA=;
 b=jSNLMANJhUtiZO1sfreZI8f4UbUaZzz2BbU0j83vksvqO51XfHUOq995cZTVgnbJJ1
 ggiJyDzSHqG4bQyAFah7qIr4Z8QBj9pmHuHpFH9ad2uH5zJfglL1zkKXWW0pVwo0en9i
 km816R9F+OIYB4w5SBNI1vMIzhzODBDITe+xo=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBNYXkgMjUsIDIwMTkgYXQgMDc6MTk6MjhQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIERhbmllbC4KPiAKPiBHb29kIHdvcmssIG5pY2UgY2xlYW51cCBhbGwgb3Zlci4K
PiAKPiBBIGZldyBjb21tZW50cyB0byBhIGZldyBwYXRjaGVzIC0gbm90IHNvbWV0aGluZyB0aGF0
IHdhcnJhbnQgYQo+IG5ldyBzZXJpZXMgdG8gYmUgcG9zdGVkIGFzIGxvbmcgYXMgaXQgaXMgZml4
ZWQgYmVmb3JlIHRoZSBwYXRjaGVzIGFyZQo+IGFwcGxpZWQuCgpIbSB5ZWFoIGdvb2QgaWRlYSwg
SSdsbCBhZGQgdGhhdCB0byB0aGUgbmV4dCB2ZXJzaW9uLgoKPiA+IGJ0dyBmb3IgZnV0dXJlIHBs
YW5zOiBJIHRoaW5rIHRoaXMgaXMgdHJpY2t5IGVub3VnaCAoaXQncyBvbGQgY29kZSBhbmQgYWxs
Cj4gPiB0aGF0KSB0aGF0IHdlIHNob3VsZCBsZXQgdGhpcyBzb2FrIGZvciAyLTMga2VybmVsIHJl
bGVhc2VzLiBJIHRoaW5rIHRoZQo+ID4gZm9sbG93aW5nIHdvdWxkIGJlIG5pY2Ugc3Vic2VxdWVu
dCBjbGVhbnVwL2ZpeGVzOgo+ID4gCj4gPiAtIHB1c2ggdGhlIGNvbnNvbGUgbG9jayBjb21wbGV0
ZWx5IGZyb20gZmJtZW0uYyB0byBmYmNvbi5jLiBJIHRoaW5rIHdlJ3JlCj4gPiAgIG1vc3RseSB0
aGVyZSB3aXRoIHByZXAsIGJ1dCBuZWVkcyB0byBwb25kZXJpbmcgb2YgY29ybmVyIGNhc2VzLgo+
IEkgd29uZGVyIC0gc2hvdWxkIHRoaXMgY29kZSBjb25zaXN0ZW50bHkgdXNlIF9fYWNxdWlyZSgp
IGV0YyBzbyB3ZSBjb3VsZAo+IGdldCBhIGxpdHRsZSBzdGF0aWMgYW5hbHlzaXMgaGVscCBmb3Ig
dGhlIGxvY2tpbmc/Cj4gCj4gSSBoYXZlIG5vdCBwbGF5ZWQgd2l0aCB0aGlzIGZvciBzZXZlcmFs
IHllYXJzIGFuZCBJIGRvIG5vdCBrbm93IHRoZQo+IG1hdHVyaXR5IG9mIHRoaXMgdG9kYXkuCgpJ
bWUgdGhlc2Ugc3BhcnNlIGFubm90YXRpb25zIGFyZSBwcmV0dHkgdXNlbGVzcyBiZWNhdXNlIHRv
byBpbmZsZXhpYmxlLiBJCnRlbmQgdG8gdXNlIHJ1bnRpbWUgbG9ja2luZyBjaGVja3MgYmFzZWQg
b24gbG9ja2RlcC4gVGhvc2UgYXJlIG1vcmUKYWNjdXJhdGUsIGFuZCB3b3JrIGV2ZW4gd2hlbiB0
aGUgcGxhY2UgdGhlIGxvY2sgaXMgdGFrZW4gaXMgdmVyeSBmYXIgYXdheQpmcm9tIHdoZXJlIHlv
dSdyZSBjaGVja2luZywgd2l0aG91dCBoYXZpbmcgdG8gYW5ub2F0ZSBhbGwgZnVuY3Rpb25zIGlu
CmJldHdlZW4uIFdlIG5lZWQgdGhhdCBmb3Igc29tZXRoaW5nIGxpa2UgY29uc29sZV9sb2NrIHdo
aWNoIGlzIGEgdmVyeSBiaWcKbG9jay4gT25seSBkb3duc2lkZSBpcyB0aGF0IG9ubHkgcGF0aHMg
eW91IGhpdCBhdCBydW50aW1lIGFyZSBjaGVja2VkLgoKPiA+IC0gbW92ZSBmYmNvbi5jIGZyb20g
dXNpbmcgaW5kaWNlcyBmb3IgdHJhY2tpbmcgZmJfaW5mbyAoYW5kIGFjY2Vzc2luZwo+ID4gICBy
ZWdpc3RlcmVkX2ZicyB3aXRob3V0IHByb3BlciBsb2NraW5nIGFsbCB0aGUgdGltZSkgdG8gcmVh
bCBmYl9pbmZvCj4gPiAgIHBvaW50ZXJzIHdpdGggdGhlIHJpZ2h0IGFtb3VudCBvZiByZWZjb3Vu
dGluZy4gTW9zdGx5IG1vdGl2YXRlZCBieSB0aGUKPiA+ICAgZnVuIEkgaGFkIHRyeWluZyB0byBz
aW1wbGlmeSBmYmNvbl9leGl0KCkuCj4gPiAKPiA+IC0gbWFrZSBzdXJlIHRoYXQgZmJjb24gY2Fs
bCBsb2NrL3VubG9ja19mYiB3aGVuIGl0IGNhbGxzIGZibWVtLmMKPiA+ICAgZnVuY3Rpb25zLCBh
bmQgc3ByaW5rbGUgYXNzZXJ0X2xvY2tkZXBfaGVsZCBhcm91bmQgaW4gZmJtZW0uYy4gVGhpcwo+
ID4gICBuZWVkcyB0aGUgY29uc29sZV9sb2NrIGNsZWFudXBzIGZpcnN0Lgo+ID4gCj4gPiBCdXQg
SSB0aGluayB0aGF0J3MgbWF0ZXJpYWwgZm9yIG1heWJlIG5leHQgeWVhciBvciBzby4KPiBPciBt
YXliZSBhZnRlciBuZXh0IGtlcm5lbCByZWxlYXNlLgo+IENvdWxkIHdlIHB1dCB0aGlzIG5pY2Ug
cGxhbiBpbnRvIHRvZG8ucnN0IG9yIHNpbWlsYXIgc28gd2UgZG8gbm90IGhhdmUKPiB0byBodW50
IGl0IGRvd24gYnkgYXNraW5nIGdvb2dsZT8KPiAKPiBGb3IgdGhlIHdob2xlIHNlcmllcyB5b3Ug
Y2FuIGFkZCBteToKPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
Pgo+IAo+IFNvbWUgcGFydHMgYXJlIHJldmlld2VkIGFzICJ0aGlzIGxvb2tzIGVudGlyZWx5IGNv
cnJlY3QiLCBvdGhlciBwYXJ0cwo+IEkgd291bGQgY2xhaW0gdGhhdCBJIGFjdHVhbGx5IHVuZGVy
c3Rvb2QuCj4gQW5kIGFmdGVyIGhhdmluZyBzcGVuZCBzb21lIGhvdXJzIG9uIHRoaXMgYSByLWIg
c2VlbXMgaW4gb3JkZXIuCgpUaGFua3MsIERhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
