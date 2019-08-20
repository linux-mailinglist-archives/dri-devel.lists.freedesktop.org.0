Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D967E961AF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 15:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3D46E7F1;
	Tue, 20 Aug 2019 13:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5506E7F1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:56:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b16so12512046wrq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 06:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wDIyrvQrJ7olDJx41Fmi3P0la+SkzTZEmDdMNDh+30I=;
 b=fcvqQ+2WJaORQiv8qgbQi4HBQ/GZ2pZI2HmRM5Hnj0jWvAQokatoc5fjiqg7tHuVRQ
 SlxUGr74VeGF0FghGmQAHxE7Bwr1MFxTbh+69351hj+9AUT7htj22yGatyRaUC41ty2z
 cOyB6h9vFfmsuKQQiA7KZPMiBMqX8oHSkomdDIUejXtZxTOMeM/OoG1hPrpKCm6PovD1
 kZeDIjmR/XpvVPl+/76yFC5kVybZy/4r4rSi6tBRcieYN9mb0NwGKgKx/M9Ajy80qlBC
 fRJsDYkFTKB94RC6bHPVEwZjQZLDinYpLL5y0LYXsAA9daYR9DIgE+5iAj9FgyT5g9eK
 TvCQ==
X-Gm-Message-State: APjAAAV7vW4cq+4WPBl43ACGeV5Bq+su8UgiNYirpm7IUFSuEKLoYjjO
 U01vC3t3ihR4nMpJ9Ti/s4/xtA==
X-Google-Smtp-Source: APXvYqzz1/Yz1/10NYh2GUB6nM4DQfiK8JY8XxzUwqSv7W5p2geXhM3XKJZmh4+lXcZIK+QpcDCQww==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr35734925wrs.88.1566309380044; 
 Tue, 20 Aug 2019 06:56:20 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a11sm18644102wrx.59.2019.08.20.06.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 06:56:19 -0700 (PDT)
Date: Tue, 20 Aug 2019 14:56:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190820135617.64urowbu2kwdynib@holly.lan>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
 <20190807201528.GO250418@google.com>
 <510f6d8a-71a0-fa6e-33ea-c4a4bfa96607@linaro.org>
 <20190816175317.GU250418@google.com>
 <20190819100241.5pctjxmsq6crlale@holly.lan>
 <20190819185049.GZ250418@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190819185049.GZ250418@google.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wDIyrvQrJ7olDJx41Fmi3P0la+SkzTZEmDdMNDh+30I=;
 b=gHpXzBj2HL/VekC+rb66mdgaCBKRClLKy21GikAy3/4y5NYI7osptw1VTKx7dbKmgm
 wTBMtuCGm6J3JkWDmtHxAjvJ7+An0qz0fmggqwT9d75Qt4eKVYsf+UZhGRDxXymwKaRl
 CgZPfsylKsFcoYik07XFEyQMFuZZlRWgVFhduIAoOAWgXMt4Jw41KIF6HD1vdy8kPdXB
 A65WjUhS70ecM65suXwwNrL2owGD4dozg0DmiHFH79YckQU9hhBJL4/kgV5YmxnDBdLI
 SMqg926sVYcMMFdKRJC6uN4odrvDKlRR6Kw5kZoypu/h2BlONSYPV1qtI7nEbBUf2aaw
 0Duw==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMTE6NTA6NDlBTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gSGkgRGFuaWVsLAo+IAo+IE9uIE1vbiwgQXVnIDE5LCAyMDE5IGF0IDExOjAy
OjQxQU0gKzAxMDAsIERhbmllbCBUaG9tcHNvbiB3cm90ZToKPiA+IE9uIEZyaSwgQXVnIDE2LCAy
MDE5IGF0IDEwOjUzOjE3QU0gLTA3MDAsIE1hdHRoaWFzIEthZWhsY2tlIHdyb3RlOgo+ID4gPiBP
biBGcmksIEF1ZyAxNiwgMjAxOSBhdCAwNDo1NDoxOFBNICswMTAwLCBEYW5pZWwgVGhvbXBzb24g
d3JvdGU6Cj4gPiA+ID4gT24gMDcvMDgvMjAxOSAyMToxNSwgTWF0dGhpYXMgS2FlaGxja2Ugd3Jv
dGU6Cj4gPiA+ID4gPiBPbiBUdWUsIEp1bCAwOSwgMjAxOSBhdCAxMjowMDowNVBNIC0wNzAwLCBN
YXR0aGlhcyBLYWVobGNrZSB3cm90ZToKPiA+ID4gPiA+ID4gQmFja2xpZ2h0IGJyaWdodG5lc3Mg
Y3VydmVzIGNhbiBoYXZlIGRpZmZlcmVudCBzaGFwZXMuIFRoZSB0d28gbWFpbgo+ID4gPiA+ID4g
PiB0eXBlcyBhcmUgbGluZWFyIGFuZCBub24tbGluZWFyIGN1cnZlcy4gVGhlIGh1bWFuIGV5ZSBk
b2Vzbid0Cj4gPiA+ID4gPiA+IHBlcmNlaXZlIGxpbmVhcmx5IGluY3JlYXNpbmcvZGVjcmVhc2lu
ZyBicmlnaHRuZXNzIGFzIGxpbmVhciAoc2VlCj4gPiA+ID4gPiA+IGFsc28gODhiYTk1YmVkYjc5
ICJiYWNrbGlnaHQ6IHB3bV9ibDogQ29tcHV0ZSBicmlnaHRuZXNzIG9mIExFRAo+ID4gPiA+ID4g
PiBsaW5lYXJseSB0byBodW1hbiBleWUiKSwgaGVuY2UgbWFueSBiYWNrbGlnaHRzIHVzZSBub24t
bGluZWFyIChvZnRlbgo+ID4gPiA+ID4gPiBsb2dhcml0aG1pYykgYnJpZ2h0bmVzcyBjdXJ2ZXMu
IFRoZSB0eXBlIG9mIGN1cnZlIGN1cnJlbnRseSBpcyBvcGFxdWUKPiA+ID4gPiA+ID4gdG8gdXNl
cnNwYWNlLCBzbyB1c2Vyc3BhY2Ugb2Z0ZW4gdXNlcyBtb3JlIG9yIGxlc3MgcmVsaWFibGUgaGV1
cmlzdGljcwo+ID4gPiA+ID4gPiAobGlrZSB0aGUgbnVtYmVyIG9mIGJyaWdodG5lc3MgbGV2ZWxz
KSB0byBkZWNpZGUgd2hldGhlciB0byB0cmVhdCBhCj4gPiA+ID4gPiA+IGJhY2tsaWdodCBkZXZp
Y2UgYXMgbGluZWFyIG9yIG5vbi1saW5lYXIuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBFeHBv
cnQgdGhlIHR5cGUgb2YgdGhlIGJyaWdodG5lc3MgY3VydmUgdmlhIHRoZSBuZXcgc3lzZnMgYXR0
cmlidXRlCj4gPiA+ID4gPiA+ICdzY2FsZScuIFRoZSB2YWx1ZSBvZiB0aGUgYXR0cmlidXRlIGNh
biBiZSAnbGluZWFyJywgJ25vbi1saW5lYXInIG9yCj4gPiA+ID4gPiA+ICd1bmtub3duJy4gRm9y
IGRldmljZXMgdGhhdCBkb24ndCBwcm92aWRlIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzY2FsZQo+
ID4gPiA+ID4gPiBvZiB0aGVpciBicmlnaHRuZXNzIGN1cnZlIHRoZSB2YWx1ZSBvZiB0aGUgJ3Nj
YWxlJyBhdHRyaWJ1dGUgaXMgJ3Vua25vd24nLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+Cj4gPiA+ID4g
PiAKPiA+ID4gPiA+IERhbmllbCAoZXQgYWwpOiBkbyB5b3UgaGF2ZSBhbnkgbW9yZSBjb21tZW50
cyBvbiB0aGlzIHBhdGNoL3NlcmllcyBvcgo+ID4gPiA+ID4gaXMgaXQgcmVhZHkgdG8gbGFuZD8K
PiA+ID4gPiAKPiA+ID4gPiBJIGRlY2lkZWQgdG8gbGVhdmUgaXQgZm9yIGEgbG9uZyB3aGlsZSBm
b3Igb3RoZXJzIHRvIHJldmlldyBzaW5jZSBJJ20gc3RpbGwKPiA+ID4gPiBhIHRpbnkgYml0IHVu
ZWFzeSBhYm91dCB0aGUgbGluZWFyL25vbi1saW5lYXIgdGVybWlub2xvZ3kuCj4gPiA+ID4gCj4g
PiA+ID4gSG93ZXZlciB0aGF0J3MgbXkgb25seSBjb25jZXJuLCBpdHMgZmFpcmx5IG1pbm9yIGFu
ZCBJJ3ZlIGRyYWdnZWQgYnkgZmVldAo+ID4gPiA+IGZvciBtb3JlIHRoZW4gbG9uZyBlbm91Z2gs
IHNvOgo+ID4gPiA+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNv
bkBsaW5hcm8ub3JnPgo+ID4gPiAKPiA+ID4gVGhhbmtzIQo+ID4gPiAKPiA+ID4gSWYgeW91IG9y
IHNvbWVvbmUgZWxzZSBoYXMgYW5vdGhlciBzdWdnZXN0aW9uIGZvciB0aGUgdGVybWlub2xvZ3kg
dGhhdAo+ID4gPiB3ZSBjYW4gYWxsIGFncmVlIG9uIEknbSBoYXBweSB0byBjaGFuZ2UgaXQuCj4g
PiAKPiA+IEFzIHlvdSB3aWxsIHNlZSBpbiBteSByZXBseSB0byBVd2UuIFRoZSB0ZXJtIEkgdGVu
ZCB0byBhZG9wdCB3aGVuIEkgd2FudAo+ID4gdG8gYmUgcHJlY2lzZSBhYm91dCB1c2Vyc3BhY2Ug
YmVoYXZpb3VyIGlzICJwZXJjZXB0dWFsIiAoZS5nLiB0aGF0IGEKPiA+IGJhY2tsaWdodCBjYW4g
YmUgbWFwcGVkIGRpcmVjdGx5IHRvIGEgc2xpZGVyIGFuZCBpdCB3aWxsIGZlZWwgcmlnaHQpLgo+
ID4gCj4gPiBIb3dldmVyIHRoYXQgcmFpc2VzIGl0cyBvd24gY29uY2VybnM6IG1vc3RseSBhYm91
dCB3aGF0IGlzIHBlcmNlcHR1YWwKPiA+IGVub3VnaC4KPiA+IAo+ID4gQ2xlYXIgdGhlIGF1dG9t
YXRpYyBicmlnaHRuZXNzIGN1cnZlIHN1cHBvcnQgaW4gdGhlIFBXTSBkcml2ZXIgaXMKPiA+IHBl
cmNlcHR1YWwuCj4gPiAKPiA+IFRvIGJlIGhvbmVzdCBJIHN1c3BlY3QgdGhhdCBpbiBtb3N0IGNh
c2VzIGEgdHJ1ZSBsb2dhcml0aG1pYyBjdXJ2ZSAoZ2l2ZW4gYQo+ID4gc2FuZSBleHBvbmVudCkg
d291bGQgYmUgcGVyY2VwdHVhbCBlbm91Z2guIEluIG90aGVyIHdvcmRzIGl0IHdpbGwgZmVlbAo+
ID4gY29tZm9ydGFibGUgd2l0aCBhIGRpcmVjdCBtYXBwZWQgc2xpZGVyIGFuZCB1c2luZyBpdCBm
b3IgYW5pbWF0aW9uCj4gPiB3b24ndCBiZSB0b28gYmFkLgo+ID4gCj4gPiBIb3dldmVyIHdoZW4g
d2UgZ2V0IHJpZ2h0IGRvd24gdG8gaXQgKnRoYXQqIGlzIHRoZSBpbmZvcm1hdGlvbiB0aGF0IGlz
Cj4gPiBhY3R1YWxseSBtb3N0IHVzZWZ1bCB0byB1c2Vyc3BhY2U6IGV4cGxpY2l0IGNvbmZpcm1h
dGlvbiB0aGF0IHRoZSBzY2FsZQo+ID4gY2FuIGJlIG1hcHBlZCBkaXJlY3RseSB0byBhIHNsaWRl
ci4gSSB0aGluayBpdCBhbHNvIGFsaWduZWQgYmV0dGVyIHdpdGgKPiA+IFV3ZSdzIGZlZWRiYWNr
IChlLmcuIHRvIHN0YXJ0IHdvcmtpbmcgdG93YXJkcyBoYXZpbmcgYSBwcmVmZXJyZWQgc2NhbGUp
Lgo+IAo+IElJVUMgdGhlIGNvbmNsdXNpb24gaXMgdGhhdCB0aGVyZSBpcyBubyBuZWVkIGZvciBh
IHN0cmluZyBhdHRyaWJ1dGUKPiBiZWNhdXNlIHdlIG9ubHkgbmVlZCB0byBkaXN0aW5ndWlzaCBi
ZXR3ZWVuICdwZXJjZXB0dWFsJyBhbmQKPiAnbm9uLXBlcmNlcHR1YWwnLiBJZiB0aGF0IGlzIGNv
cnJlY3QsIGRvIHlvdSBoYXZlIGFueSBwcmVmZXJlbmNlIGZvcgo+IHRoZSBhdHRyaWJ1dGUgbmFt
ZSAoJ3BlcmNlcHR1YWxfc2NhbGUnLCAncGVyY2VwdHVhbCcsIC4uLik/CgpNb3JlIGEgc3VtbWFy
eSB0aGFuIGEgY29uY2x1c2lvbiEgVGhlcmUgaXMgYSByZWFzb24gSSBoYXZlIGxlZnQgYSBiaXQg
b3IKc3BhY2UgZm9yIG90aGVycyB0byBjb21tZW50IG9uIHRoaXMgb3ZlciB0aGUgbGFzdCBtb250
aCAoYW5kIGEgYml0KS4KClRvIGJlIGNsZWFyIG15IFJldmlld2VkLWJ5OiBtZWFucyB0aGF0IEkg
YmVsaWV2ZSB0aGF0IHRoZSBrZXJuZWwgaXMgYmV0dGVyCndpdGggIm5vbi1saW5lYXIvbGluZWFy
L3Vua25vd24iIHRoYW4gd2l0aG91dCBpdCBhbmQgdGhhdCBJIGFtIGNvbWZvcnRhYmxlCnRoZSBB
UEkgaXNuJ3QgbGlrZWx5IHRvIGJlIGEgbWlsbHN0b25lIGZvciB1cy4KCkxlZSwgSmluZ29vOiBF
aXRoZXIgb2YgeW91IGNhcmUgdG8gb2ZmZXIgJDAuMDIKCgpEYW5pZWwuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
