Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EFC50D0E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 15:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647D089A1F;
	Mon, 24 Jun 2019 13:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8739789612
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 13:59:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n9so14098585wru.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 06:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=HZydg61kd/5ZMS5RbhbADXYMXbV4sPeJO33INEjYDBA=;
 b=G2qDjbvtd4snyiMb8FyUuy/K5cS4aDQfEhWzECi5QT4kzCYxBU4L6hl9pMfVho57uh
 DshlsH9pnkPJNuYPXmNlL50vUh+XAIZou/2ZAJmXlQgVuIFK16IRCFt8zipdMKQNFoU0
 vrFuRjP/YhVFwupvgMPh+/2r8tW7QMo+FgisBe7n/BGlkxthGVEGtg8la8LA8UVm1kXf
 bWgUVbYLwmRPgArn26/WE15M7SgDPoEZwuNch4PLueO30Q/gBFhpw1IqqcEz7kiDdtya
 u1ZyyZZfmLdK6zUz8BkUAdjvhhwwX/617SrSzcPt+hUyxZx39xFHsF/3ez37U82F2ZAZ
 muOw==
X-Gm-Message-State: APjAAAXLO09RyufzQ/bmqFZudyyoyulnpQsZPAke7+AqTuN/WpPouOQE
 JUPJ0abpHRpyUDd8e6C8XoAuxQ==
X-Google-Smtp-Source: APXvYqyXl+oaJqy9dGnCwOyjNy47toUpLXcA2A7g32WAeammFUBUsdmAZWtzNQCfsd+Y2HZBQlSpLg==
X-Received: by 2002:adf:e2c7:: with SMTP id d7mr53801722wrj.272.1561384766167; 
 Mon, 24 Jun 2019 06:59:26 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id r4sm9285460wrv.34.2019.06.24.06.59.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 06:59:25 -0700 (PDT)
Date: Mon, 24 Jun 2019 14:59:23 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Brian Dodge <bdodge09@gmail.com>
Subject: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
Message-ID: <20190624135923.ej6o2oooncocjwyn@holly.lan>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd>
 <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
 <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
 <20190621221325.GA2343@amd>
 <20190624102405.gg2lnlw6wmfvjrxu@holly.lan>
 <9d590b7b-5477-249e-a482-1fc17d7a106f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d590b7b-5477-249e-a482-1fc17d7a106f@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=HZydg61kd/5ZMS5RbhbADXYMXbV4sPeJO33INEjYDBA=;
 b=cCn/f5WcbbLk18YiGYwGIt8mW7tsHJa6PwLBSZV9msR7EdDeabmbI8VfaREJiu6RVv
 GVP/y61EwmE4mAeQWElaSCBxcJwkJaYuASeFL0ZU001nLQZveinpCXX0KQB1NK63NOez
 KQk0I+BEK7epCJBbxY3uCLtC7T8rScva2GxHkYz86EdtrhNUuQWid0MjfLE17/fXM//1
 bre8itTEokJn39L306+8TEsR52h/mWEgO3Q64yiWrystgcP+ARYQHDL6JPEHCq7yamEc
 EjHkDyyLwUhpMlTnyebsq4Mz9xRaf9HkvF0hOaz1Jr3+SqZGbMRTeZTGkqg3vwu+3m70
 Lvwg==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, Pavel Machek <pavel@ucw.cz>,
 Peter Bacon <pbacon@psemi.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDc6Mjk6MjBBTSAtMDQwMCwgQnJpYW4gRG9kZ2Ugd3Jv
dGU6Cj4gVGhpcyBzdXJlIGRpZCBmYWxsIHRocm91Z2ggdGhlIGNyYWNrcy4KPiAKPiBJIGNvbmZp
cm1lZCB3aXRoIHRoZSB2ZW5kb3IgdGhhdCB0aGVyZSBhcmUgbm8gZXhpc3RpbmcgZW1iZWRkZWQg
RFRTIHdpdGggdGhlCj4gd3JvbmcgbmFtZShzKSBpbiB0aGVtIGJlZm9yZSBzdWJtaXR0aW5nIHRo
aXMgcGF0Y2guCj4gCj4gVGhlIG5ldyBvd25lciBvZiB0aGlzIGNoaXAgZmFtaWx5LCBwU2VtaSwg
anVzdCB3YW50ZWQgbWUgdG8gd3JhcCB0aGluZ3MgdXAKPiBhbmQgc3VwcG9ydCBhbGwgb2YgdGhl
cmUgY2hpcHMgKDMpIGluIGEgc2luZ2xlIGRyaXZlciBhbmQgdGhhdCB3YXMgdGhlCj4gZXh0ZW50
IG9mIHRoZSB3b3JrIGZvciBtZS7CoCBTaW5jZSB0aGVuIHRoZSBtYW5hZ2VyIG9mIHRoZSBwcm9n
cmFtIHRoZXJlIGhhcwo+IGFsc28gY2hhbmdlZC7CoCBJIGFzc3VtZSB0aGV5J2Qgc3RpbGwgd2Fu
dCB0aGVzZSBjaGFuZ2VzIGluIGZvciBjb21wbGV0ZW5lc3MuCj4gCj4gQUZBSUssIHRoZXJlIHdl
cmUganVzdCBzb21lIHF1aWJibGVzIGFib3V0IHRoZSBjb3B5cmlnaHQgZGF0ZSByYW5nZS7CoCBD
YW4KPiB5b3UgcGxlYXNlIGhlbHAgbWUgcHVzaCB0aGVzZSBwYXRjaGVzIGluPyBJdCdsbCB0YWtl
IG1lIHNvbWUgdGltZSB0byBnZXQKPiBiYWNrIGluIHRvIHdoZXJlIEkgbGVmdCB0aGluZ3PCoCBz
aW5jZSBpdHMgYmVlbiBzbyBsb25nLsKgIEkga25vdyBpdHMgYSBiaXQKPiBtZXNzeSBidXQgdGhl
IERUUyBhbmQgZHJpdmVyIGNoYW5nZXMgbmVlZCB0byBiZSB0b2dldGhlciB0byBtYWtlIHNlbnNl
IHNvIEkKPiBjb3VsZG4ndCByZWFsbHkgZG8gYW4gaW5jcmVtZW50YWwgcGF0Y2ggc2VxdWVuY2Uu
Cj4gCj4gV2hhdCBpcyB0aGUgbmV4dCBzdGVwPwoKVGhlIG5leHQgc3RlcCBpcyBnZXR0aW5nIHRo
ZSBjaGFuZ2VzIHRvIERUIGJpbmRpbmdzIGFncmVlZC4gVW50aWwgdGhhdApoYXBwZW5zIHRoZSBw
YXRjaHNldCBjYW5ub3QgbW92ZSBhbmQgcmlnaHQgbm93IG5vdyB0aGUgdGhyZWFkIGZvciB0aGF0
CnBhdGNoIGhhcyBmZWVkYmFjayB0aGF0IHdhcyBub3QgcmVwbGllcyB0bzoKaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDY3NTQ1MS8KClRoZSBleHBsYW5hdGlvbiBvZiB3aHkg
aXQgaXMgc2FmZSB0byBhY2NlcHQgdGhlIGNoYW5nZSB0byB0aGUgRFQKYmluZGluZ3MgcmVhbGx5
IHNob3VsZCBlbmQgdXAgaW4gdGhlIHBhdGNoIGRlc2NyaXB0aW9uIHJhdGhlciB0aGFuIHRoZQpt
YWlsIHRocmVhZC4gSXQgd291bGQgcHJvYmFibHkgYWxzbyBoZWxwIHRvIGhhdmUgYSBsaW5rIHRv
Cmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzkvMjUvNzI2IHdoZXJlIGl0IGxvb2tzIGxpa2Ug
YXJjIHZlcnN1cwphcmN0aWMgd2FzIHByZXZpb3VzbHkgZGlzY3Vzc2VkLgoKVGhlIGZvbGxvd2lu
ZyBtaWdodCBhbHNvIGJlIGNvbnZlbmllbnQgZm9yIHlvdToKCiAgQSBxdWljayB3ZWIgc2VhcmNo
IGZvciAiYXJjLGFyYzJjMDYwOCIgc3VnZ2VzdHMgdGhhdCB0aGUgb25seSBwdWJsaWMKICB1c2Vy
IGlzIHRoZSBTYW1zdW5nIENocm9tZWJvb2sgUGx1cyBhbmQgaXQgaXMgbGlrZWx5IHRoYXQgdGhp
cyBkZXZpY2UKICB3aWxsIHJlbWFpbiBvbiB0aGUgdjQuNCBrZXJuZWwuIEZvciB0aGlzIHJlYXNv
biB3ZSBkbyBub3QgcHJvdmlkZQogIGFueSBkZXByZWNhdGVkIGZhbGxiYWNrIG5hbWVzIGJhc2Vk
IG9uICJhcmMiLgoKCkRhbmllbC4KCj4gCj4gQnJpYW4KPiAKPiBPbiA2LzI0LzE5IDY6MjQgQU0s
IERhbmllbCBUaG9tcHNvbiB3cm90ZToKPiA+IE9uIFNhdCwgSnVuIDIyLCAyMDE5IGF0IDEyOjEz
OjI1QU0gKzAyMDAsIFBhdmVsIE1hY2hlayB3cm90ZToKPiA+ID4gSGkhCj4gPiA+IAo+ID4gPiA+
IFtTb3JyeSB0byB0aG9zZSByZWNlaXZpbmcgdGhpcyB0d2ljZS4uLiBoYWQgdG8gZGlnIHRoaXMg
b3V0IGZyb20gdGhlCj4gPiA+ID4gYXJjaGl2ZXMgYW5kIHNlbnQgaXQgdG8gdGhlIGxpc3RzIGZy
b20gdGhlIHdyb25nIG1haWxlcl0KPiA+ID4gPiAKPiA+ID4gPiBPbiAyNy8xMS8yMDE4IDAwOjQ0
LCBCcmlhbiBEb2RnZSB3cm90ZToKPiA+ID4gPiA+IFRoYW5rIHlvdSBQYXZlbCwgdGhhdCBpcyBh
IGdvb2QgcG9pbnQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoZSBjaGlwIHZlbmRvciBoYXMgaW5k
aWNhdGVkIHRoYXQgdGhlcmUgaXMgbm8gcmVhc29uIHRvIG1haW50YWluIHRoZQo+ID4gPiA+ID4g
b2xkL2ltcHJvcGVyIHByZWZpeCBhbmQgd2lzaGVzIHRvIGdvIGZvcndhcmQgKG9ubHkpIHdpdGgg
dGhlICJhcmN0aWMiCj4gPiA+ID4gPiBwcmVmaXggYW5kIGFueSBleGlzdGluZyBkdHMgZmlsZXMg
YXJlIG9yIHdpbGwgYmUgdXBkYXRlZC4KPiA+ID4gPiBMb29rcyBsaWtlIHRoaXMgcGF0Y2ggc2Vy
aWVzIGhhcyBmYWxsZW4gaW50byB0aGUgY3JhY2tzIGEgbGl0dGxlLgo+ID4gPiA+IAo+ID4gPiA+
IEkgdGhpbmsgSSBhc3N1bWVkIHRoaXMgaW5mbyB3b3VsZCBlbmQgaW4gdGhlIGRlc2NyaXB0aW9u
IG9mIHBhdGNoIHYyIDEvMyAoaW4KPiA+ID4gPiBvcmRlciB0byBhbnN3ZXIgUm9iJ3MgZmVlZGJh
Y2spIGFuZCBJIHNhdCBhbmQgd2FpdGVkIGZvciBhIHJlc3Bpbi4gT24gdGhlCj4gPiA+ID4gb3Ro
ZXIgaGFuZC4uLiBJIGRpZG4ndCBhY3R1YWxseSBzYXkgdGhhdCBleHBsaWNpdGx5IGFueXdoZXJl
ISBTby4uLiBJJ2QKPiA+ID4gPiByZWNvbW1lbmQgYSByZXNwaW4gcGVyaGFwcyB3aXRoIGEgc21h
bGwgYml0IG9mIHRleHQgZXhwbGFpbmluZyBob3cgdGhlCj4gPiA+ID4gdmVuZG9yIGNhbiBzdGF0
ZSB0aGF0IGFueSBleGlzdGluZyBkdHMgZmlsZXMgd2lsbCBiZSB1cGRhdGVkLiBUaGlzIGlzIGEK
PiA+ID4gPiBwZXJpcGhlcmFsIGRldmljZSBzbyB0aGVzZSBzdHJpbmdzIGFyZSBwcm9iYWJseSBl
bWJlZGRlZCBpbnRvIE9FTQo+ID4gPiA+IGRldmljZXRyZWVzIHJhdGhlciB0aGFuIGV4Y2x1c2l2
ZWx5IHVuZGVyIHRoZSBjb250cm9sIG9mIHRoZSB2ZW5kb3IuCj4gPiA+IFNvIGluIG5leHQgZW1h
aWwgeW91IGdpdmUgZ29vZCByZWFzb24gbm90IHRvIGFwcGx5IHRoaXMgOi0pLgo+ID4gQWZyYWlk
IHNvLi4uIGl0IHdhcyBvbiBwYWdlIDIgb2YgbXkgZ29vZ2xlIHNlYXJjaCBzbyBJIGRpZCBhIHF1
aWNrCj4gPiBzZWFyY2gsIHNlbnQgdGhlIGZpcnN0IG1haWwgYW5kIHRoZW4gd2VudCBiYWNrIHRv
IG15IHdlYiBicm93c2VyLgo+ID4gCj4gPiBJdCB3YXMgYXQgdGhhdCBtb21lbnQgdGhhdCBJIGRl
Y2lkZWQgYSBxdWljayBzZWFyY2ggd2Fzbid0IGVub3VnaCBhbmQKPiA+IGRlY2lkZWQgdG8gZ290
IGEgbGl0dGxlIGRlZXBlciEKPiA+IAo+ID4gCj4gPiBEYW5pZWwuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
