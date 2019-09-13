Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 747E9B2304
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 17:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCC66F3E8;
	Fri, 13 Sep 2019 15:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219BD6F3E6;
 Fri, 13 Sep 2019 15:09:34 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id b123so18824169vsb.5;
 Fri, 13 Sep 2019 08:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pIMiAKhzqydevxJ4SfxaOnAOQBbzxpXSTX/hNzVTWH8=;
 b=ERgJ9yK9DFvEYIu7VqfCHLQBJDwO7S0fonYgDkSiVPp8bBu/WQnMNyxGpwrY2bh13W
 q9OKVoHmLFS9h8VRc6jt1TFxx3f8LvDNlh0PiIGk307YzFE7uoOOsP1/Cl0OhFEM5Evz
 RF5sofUXKzUmOGBab5SGPMftpLMTkzE5yhQPt8COojWL/97ZSnX3LCinP/nrL8YlfmZU
 iLMeI2rYRboHdhno1hLNzRfWHK9CMyseZ8Nu+vsAzFzGLujXL7WP4oCF4yOlOs/GJ7Eo
 Yzh9aL+yVJHLEblGn83PB69bMbPytIgVDCDFovrsK17VJkGyGkkuqdh0aj+ywHJftV57
 m8fA==
X-Gm-Message-State: APjAAAUQ1BCcZdyD/lX94jnzipdXJclyEfPwDLRcZj1ALLjkHvULK1ay
 2j+GdwkFxDgLQhV+x/vX5RzFuruaFOZdzciz6TlBuQ==
X-Google-Smtp-Source: APXvYqylu2hrm9+jShjlZBaJJtsqTtMpCZ46oIHdTl6adXUbUxfPuEUiLtfCfDfh1ckXZtmG7LMM+KfUH5p8IZnGJJ4=
X-Received: by 2002:a05:6102:195:: with SMTP id
 r21mr21052393vsq.210.1568387373173; 
 Fri, 13 Sep 2019 08:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190913130559.669563815@linuxfoundation.org>
 <20190913130606.981926197@linuxfoundation.org>
 <CAKb7UviY0sjFUc6QqjU4eKxm2b-osKoJNO2CSP9HmQ5AdORgkw@mail.gmail.com>
 <20190913144627.GH1546@sasha-vm> <20190913145456.GA456842@kroah.com>
 <20190913150111.GI1546@sasha-vm>
In-Reply-To: <20190913150111.GI1546@sasha-vm>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 13 Sep 2019 11:09:22 -0400
Message-ID: <CAKb7Uvj31ZuxB6S4EH8WBRsa2mDScpZN=dRjHScZmN94ajD0EA@mail.gmail.com>
Subject: Re: [PATCH 4.19 092/190] drm/nouveau: Dont WARN_ON VCPI allocation
 failures
To: Sasha Levin <sashal@kernel.org>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, "# 3.9+" <stable@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTE6MDEgQU0gU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgU2VwIDEzLCAyMDE5IGF0IDAzOjU0OjU2UE0gKzAx
MDAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQg
MTA6NDY6MjdBTSAtMDQwMCwgU2FzaGEgTGV2aW4gd3JvdGU6Cj4gPj4gT24gRnJpLCBTZXAgMTMs
IDIwMTkgYXQgMDk6MzM6MzZBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3JvdGU6Cj4gPj4gPiBIaSBH
cmVnLAo+ID4+ID4KPiA+PiA+IFRoaXMgZmVlbHMgbGlrZSBpdCdzIG1pc3NpbmcgYSBGcm9tOiBs
aW5lLgo+ID4+ID4KPiA+PiA+IGNvbW1pdCBiNTEzYTE4Y2YxZDcwNWJkMDRlZmQ5MWM0MTdlNzll
NDkzOGJlMDkzCj4gPj4gPiBBdXRob3I6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4g
Pj4gPiBEYXRlOiAgIE1vbiBKYW4gMjggMTY6MDM6NTAgMjAxOSAtMDUwMAo+ID4+ID4KPiA+PiA+
ICAgIGRybS9ub3V2ZWF1OiBEb24ndCBXQVJOX09OIFZDUEkgYWxsb2NhdGlvbiBmYWlsdXJlcwo+
ID4+ID4KPiA+PiA+IElzIHRoaXMgYW4gYXJ0aWZhY3Qgb2YgeW91ciBub3RpZmljYXRpb24tb2Yt
cGF0Y2hlcyBwcm9jZXNzIGFuZCBJCj4gPj4gPiBuZXZlciBub3RpY2VkIGJlZm9yZSwgb3Igd2Fz
IHRoZSBwYXRjaCBpbmdlc3RlZCBpbmNvcnJlY3RseT8KPiA+Pgo+ID4+IEl0IHdhcyBhbHdheXMg
bGlrZSB0aGlzIGZvciBwYXRjaGVzIHRoYXQgY2FtZSB0aHJvdWdoIG1lLiBHcmVnJ3Mgc2NyaXB0
Cj4gPj4gZ2VuZXJhdGVzIGFuIGV4cGxpY2l0ICJGcm9tOiIgbGluZSBpbiB0aGUgcGF0Y2gsIGJ1
dCBJIG5ldmVyIHNhdyB0aGUKPiA+PiB2YWx1ZSBpbiB0aGF0IHNpbmNlIGdpdCBkb2VzIHRoZSBy
aWdodCB0aGluZyBieSBsb29raW5nIGF0IHRoZSAiRnJvbToiCj4gPj4gbGluZSBpbiB0aGUgbWFp
bCBoZWFkZXIuCj4gPj4KPiA+PiBUaGUgcmlnaHQgdGhpbmcgaXMgYmVpbmcgZG9uZSBpbiBzdGFi
bGUtcmMgYW5kIGZvciB0aGUgcmVsZWFzZXMuIEZvcgo+ID4+IHlvdXIgZXhhbXBsZSBoZXJlLCB0
aGlzIGlzIGhvdyBpdCBsb29rcyBsaWtlIGluIHRoZSBzdGFibGUtcmMgdHJlZToKPiA+Pgo+ID4+
IGNvbW1pdCBiZGNjODg1YmU2ODI4OWEzN2QwZDA2M2NkOTQzOTBkYTgxZmQ4MTc4Cj4gPj4gQXV0
aG9yOiAgICAgTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+PiBBdXRob3JEYXRlOiBN
b24gSmFuIDI4IDE2OjAzOjUwIDIwMTkgLTA1MDAKPiA+PiBDb21taXQ6ICAgICBHcmVnIEtyb2Fo
LUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+ID4+IENvbW1pdERhdGU6IEZy
aSBTZXAgMTMgMTQ6MDU6MjkgMjAxOSArMDEwMAo+ID4+Cj4gPj4gICAgZHJtL25vdXZlYXU6IERv
bid0IFdBUk5fT04gVkNQSSBhbGxvY2F0aW9uIGZhaWx1cmVzCj4gPgo+ID5ZZWFoLCB3ZSBzaG91
bGQgZml4IHlvdXIgc2NyaXB0cyB0byBwdXQgdGhlIGV4cGxpY2l0IEZyb206IGxpbmUgaW4gaGVy
ZQo+ID5hcyB3ZSBhcmUgZGVhbGluZyB3aXRoIHBhdGNoZXMgaW4gdGhpcyBmb3JtYXQgYW5kIGl0
IGNhdXNlcyBjb25mdXNpb24gYXQKPiA+dGltZXMgKGxpa2Ugbm93LikgIEl0J3Mgbm90IHRoZSBm
aXJzdCB0aW1lIGFuZCB0aGF0J3Mgd2h5IEkgYWRkZWQgdGhvc2UKPiA+bGluZXMgdG8gdGhlIHBh
dGNoZXMuCj4KPiBIZWgsIGRpZG4ndCB0aGluayBhbnlvbmUgY2FyZWQgYWJvdXQgdGhpcyBzY2Vu
YXJpbyBmb3IgdGhlIHN0YWJsZS1yYwo+IHBhdGNoZXMuCj4KPiBJJ2xsIGdvIGFkZCBpdC4KPgo+
IEJ1dC4uLiB3aHkgZG8geW91IGFjdHVhbGx5IGNhcmU/CgpKdXN0IGEgaHlnaWVuZSB0aGluZy4g
RXZlcnlvbmUgZWxzZSBzZW5kcyBwYXRjaGVzIHRoZSBub3JtYWwgd2F5LCB3aXRoCmFjY3VyYXRl
IGF0dHJpYnV0aW9uLiBXaHkgc2hvdWxkIHN0YWJsZSBiZSBkaWZmZXJlbnQ/CgooSSB3YXMgc3Vy
cHJpc2VkIHRvIHNlZSBHcmVnIGNvbnRyaWJ1dGluZyB0byBub3V2ZWF1IHdoZW4gSSBmaXJzdCBz
YXcKdGhlIHBhdGNoLiBCdXQgdGhlbiByZWFsaXplZCBpdCB3YXMgdGhlIHN0YWJsZSBpbmdlc3Rp
b24Kbm90aWZpY2F0aW9uLikKCiAgLWlsaWEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
