Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D132B5CF5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 11:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC4A6E197;
	Tue, 17 Nov 2020 10:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1156E190
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 10:34:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d12so22593597wrr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 02:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Sud3D2o5i/2sKQgZl/D7nnujJzuFFholMZb2B2KvWWM=;
 b=RGpqDPpFmT5G7SLxjr4yX6NK5dr/9nYyj3C/p65ke0uLMsIvEFmNrGtPWv2NsIy/C6
 w+6xb49utWRuAe6ghTEpCM3mkh7TE5ACOZsfVXBs/7BiQaajfy6AH2pM3NaodxjAz/D8
 TLYtR4aFmK4BA0wi6T9Hll8ND398GpXmmf+ELBDpJMFadc3cA5XzP85KJ02gFlHN+kBu
 0zwN1K4sUPMNGrfseUYM7M45k/OLSxKV93SRm93IYBV+Vpw9R3mFoiEt18aJn1WMnRDy
 C9KUGjjgC7h+UprkQvyVJCwkQi6Q1w6pYwArQWRadqDn19nESVxmJMemdcX9wLXxkM0i
 tQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Sud3D2o5i/2sKQgZl/D7nnujJzuFFholMZb2B2KvWWM=;
 b=HsTNq4k9NZ+mIosfzNvVNBCzLiclx9h8UScj42zh6sHV22aE2HTWLeeNiGj+sNZk1P
 1YfLTH15iB39lEhd44A8qLXfpCcwo+IhgpDyvr0UuGyeUZ5doM3SV89EJVTVTwnhNO/2
 KsreG/T+RxkY3dlMLqCO/GTamaLQNjk3B45O/e/XvrDZxY2MhSHlBE7GZpI19b89FzO9
 bMVm+DaZW/0s9WoLdg4qKJInh3+OvHuhifVqGmnTVPSpo6w296sOWdFjVHICIG38UcR8
 8dmx+7Si8wtptprWd4hI63km+Tka85LxBl6GYkMT8HGlKevVn07RGKuVzSr6jI8v7ZD5
 chZQ==
X-Gm-Message-State: AOAM530WRb9/208VC+LqSX2c6spW6xkBTEWlDdc6VlNRi4cRJn46/BAa
 uvS4uR7ijtKgHZXBvjW/Ob6Adg==
X-Google-Smtp-Source: ABdhPJxtIQ23iZHX7uQawoEIGGH345+Ol3HRW/RC+sRVxjokZR9d24k5wZsq7t1rf1Uq/aibvoAMeA==
X-Received: by 2002:a5d:4388:: with SMTP id i8mr24032522wrq.262.1605609246430; 
 Tue, 17 Nov 2020 02:34:06 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id j71sm3094716wmj.10.2020.11.17.02.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 02:34:05 -0800 (PST)
Date: Tue, 17 Nov 2020 10:34:04 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 02/30] include: drm: drm_atomic: Artificially use 'crtc'
 to avoid 'not used' warning
Message-ID: <20201117103404.GF1869941@dell>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-3-lee.jones@linaro.org>
 <20201112202516.GA3340631@ravnborg.org>
 <20201113204959.GW401619@phenom.ffwll.local>
 <CAF2Aj3j6+fEFS66qg-a-0Z1XtNQ7EAEnu4ECZ9gLiH7buH=PLw@mail.gmail.com>
 <CAKMK7uEQwFLj+D4LfdQNfb+cQZCH34HZU7oJh8r=mjozuKmZGQ@mail.gmail.com>
 <CAF2Aj3jRFM95R7VaV_4Chi3Tr3ja31EjdVTeHeDkUWETweqCGA@mail.gmail.com>
 <20201117100509.GJ401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117100509.GJ401619@phenom.ffwll.local>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuaWVsLAoKRm9yIHNvbWUgcmVhc29uLCB5b3UncmUgbm90IGFwcGVhcmluZyBpbiB0aGUgcmVj
aXBlbnRzIGxpc3Qgd2hlbiBJCnJlcGx5IHRvIGFsbC4gIFlvdSdyZSBub3QgaW4gdGhlIE1haWwt
Rm9sbG93dXAtVG8gaGVhZGVyLiAgQW55IGlkZWEKd2h5IHRoaXMgbWlnaHQgYmU/CgpBbnl3YXks
IHBsZWFzZSBzZWUgYmVsb3c6CgpPbiBUdWUsIDE3IE5vdiAyMDIwLCBEYW5pZWwgVmV0dGVyIHdy
b3RlOgo+IE9uIEZyaSwgTm92IDEzLCAyMDIwIGF0IDEwOjAxOjU3UE0gKzAwMDAsIExlZSBKb25l
cyB3cm90ZToKPiA+IE9uIEZyaSwgMTMgTm92IDIwMjAsIDIxOjMxIERhbmllbCBWZXR0ZXIsIDxk
YW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4gCj4gPiA+IE9uIEZyaSwgTm92IDEzLCAyMDIwIGF0
IDk6NTMgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+ID4K
PiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gT24gRnJpLCAxMyBOb3YgMjAyMCwgMjA6NTAgRGFuaWVs
IFZldHRlciwgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPiA+ID4+Cj4gPiA+ID4+IE9uIFRo
dSwgTm92IDEyLCAyMDIwIGF0IDA5OjI1OjE2UE0gKzAxMDAsIFNhbSBSYXZuYm9yZyB3cm90ZToK
PiA+ID4gPj4gPiBIaSBMZWUsCj4gPiA+ID4+ID4KPiA+ID4gPj4gPiBPbiBUaHUsIE5vdiAxMiwg
MjAyMCBhdCAwNzowMDoxMVBNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiA+ID4+ID4gPiBU
aGUgcHJlY2VkZW50IGhhcyBhbHJlYWR5IGJlZW4gc2V0IGJ5IG90aGVyIG1hY3JvcyBpbiB0aGUg
c2FtZSBmaWxlLgo+ID4gPiA+PiA+ID4KPiA+ID4gPj4gPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcg
Vz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+ID4gPiA+PiA+ID4KPiA+ID4gPj4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5jOjU1OjE5OiB3YXJuaW5nOiB2YXJpYWJsZSDi
gJhjcnRj4oCZCj4gPiA+IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFi
bGVdCj4gPiA+ID4+ID4gPiAgNTUgfCBzdHJ1Y3QgZHJtX2NydGMgKmNydGM7Cj4gPiA+ID4+ID4g
PiAgfCBefn5+Cj4gPiA+ID4+ID4gPgo+ID4gPiA+PiA+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiA+ID4+ID4gPiBDYzogTWF4
aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+ID4gPiA+PiA+ID4gQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4gPiA+PiA+ID4gQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gPj4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+Cj4gPiA+ID4+ID4gPiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21h
aWwuY29tPgo+ID4gPiA+PiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiA+ID4gPj4gPiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5v
cmc+Cj4gPiA+ID4+ID4KPiA+ID4gPj4gPiBBbHNvIGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dC4K
PiA+ID4gPj4gPiBUaGlzIHdhcyB0aGUgbGFzdCBwYXRjaCBmcm9tIHRoaXMgYmF0Y2ggSSB3aWxs
IHByb2Nlc3MuCj4gPiA+ID4+ID4gVGhlIG90aGVycyBhcmUgbGVmdCBmb3IgdGhlIG1haW50YWlu
ZXJzIHRvIHBpY2sgdXAuCj4gPiA+ID4+Cj4gPiA+ID4+IGJ0dyBmb3IgcGF0Y2hlcyB0aGF0IG1h
aW50YWluZXJzIGRvbid0IHBpY2sgdXAsIHRoZSB1c3VhbCBwcm9jZXNzIGlzCj4gPiA+IHRoYXQK
PiA+ID4gPj4gd2UgZ2l2ZSB0aGVtIDIgd2Vla3MsIHRoZW4ganVzdCBtYXNzIGFwcGx5LiBOb3cg
eW91J3JlIHByb2R1Y2luZyBhIGxvdAo+ID4gPiBvZgo+ID4gPiA+PiBwYXRjaGVzLCB0b28gbXVj
aCBmb3IgbWUgdG8ga2VlcCB0cmFjaywgc28gcGxlYXNlIGp1c3QgcGluZyBtZSB3aXRoIGEKPiA+
ID4gPj4gcmVzZW5kIGZvciB0aG9zZSB0aGF0IGV4cGlyZWQgYW5kIEknbGwgZ28gdGhyb3VnaCBh
bmQgcGljayB0aGVtIGFsbCB1cC4KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gVGhhdCdzIGdyZWF0
IERhbmllbC4gVGhhbmtzIGZvciB5b3VyIHN1cHBvcnQuCj4gPiA+ID4KPiA+ID4gPiBJIGNhbiBk
byBvbmUgYmV0dGVyIHRoYW4gdGhhdC4KPiA+ID4gPgo+ID4gPiA+IFdvdWxkIGEgcHVsbC1yZXF1
ZXN0IHN1aXQgeW91Pwo+ID4gPgo+ID4gPiBXZSBoYXZlIGEgZmV3IHRyZWVzIGdvaW5nIG9uLCBh
bmQgeW91ciBwYXRjaGVzIGFyZSBsYW5kaW5nIHRocm91Z2ggYWxsCj4gPiA+IGtpbmRzIG9mIHRo
ZW0uIFNvIHRoaXMgbWlnaHQgYmUgbW9yZSBjb29yZGluYXRpb24gcGFpbi4gSWYgeW91IGNhbgo+
ID4gPiBleGNsdWRlIHBhdGNoZXMgZm9yIHRoZSBzZXBhcmF0ZWx5IGFuZCB1c3VhbGx5IGZhaXJs
eSB3ZWxsIG1haW50YWluZWQKPiA+ID4gZHJpdmVycyBvdXQgb2YgdGhlIHB1bGwgaXQgc2hvdWxk
IHdvcmsgKGRybS9hbWQsIGRybS9yYWRlb24sIGRybS9pOTE1LAo+ID4gPiBkcm0vbm91dmVhdSwg
ZHJtL21zbSBhbmQgZHJtL29tYXBkcm0gcHJvYmFibHkgdGhlIHVzdWFsIG9uZXMpLgo+ID4gPgo+
ID4gPiBPciB5b3UganVzdCBzZW5kIHRoZSBuZXh0IHBpbGUgYW5kIHdlJ2xsIHNlZS4KPiA+ID4K
PiA+ID4gQWxzbyBJIGd1ZXNzIEkgY2FuJ3QgcmVhbGx5IGludGVyZXN0IHlvdSBpbiBjb21taXQg
cmlnaHRzIHNvIHRoaXMKPiA+ID4gcGF0Y2ggYm9tYnMgZ2V0IG9mZiBteSBiYWNrIGFnYWluPyA6
LSkKPiA+ID4KPiA+IAo+ID4gV2hhdCBkb2VzIHRoYXQgbWVhbj8gTWVyZ2UgbXkgb3duIHBhdGNo
ZXM/Cj4gPiAKPiA+IE5vdCBzdXJlIGhvdyB0aGF0IHdvcmtzIHdpdGggeW91ciBncm91cCBtYWlu
dGVuYW5jZSBzZXR1cC4KPiA+IAo+ID4gSXMgaXQganVzdCBhIGBnaXQgcHVzaGA/Cj4gCj4gSXQn
cyBhIGJ1bmNoIG9mIHNjcmlwdGluZyBhbmQgc2V0dXAsIG1pZ2h0IG5vdCBiZSB3b3J0aCBpdCBm
b3IganVzdCBvbmUKPiBvZi4gUGx1cyB3ZSBzdGlsbCB0YWtlIHB1bGwgcmVxdWVzdHMgZnJvbSBz
dWJtYWludGFpbmVycyBzbyBpdCdzIGFsbCBqdXN0Cj4gaWYgeW91IGZlZWwgbGlrZSBpdC4gU29t
ZSBkb2NzIGlmIHlvdSdyZSBjdXJpb3VzOgo+IAo+IGh0dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNr
dG9wLm9yZy9tYWludGFpbmVyLXRvb2xzL2dldHRpbmctc3RhcnRlZC5odG1sCgpBcyAqZnVuKiBh
cyB0aGF0IGxvb2tzLCBJIHRoaW5rIEknbGwgZ2l2ZSBpdCBhIG1pc3MsIHRoYW5rcy4gOikKClNv
IGZvciB0aGUgZmluYWwgbWVyZ2Ugb2YgdGhlIG5vbi1SYWRlb24gc2V0IFswXSB0byBkYXRlIChB
bGV4IGp1c3QKcHVsbGVkIGluIGFsbCBvZiB0aGUgb3V0c3RhbmRpbmcgUmFkZW9uIHBhdGNoZXMp
LCB3ZSBoYXZlIGEgZmV3Cm9wdGlvbnM6CgogMS4gVGFrZSB0aGVtIGRpcmVjdGx5IGZyb20gdGhl
IG1vc3QgcmVjZW50IHNldCBbMF0KIDIuIEkgY2FuIHJlYmFzZSBhbmQgcmVzdWJtaXQgYWdhaW4g
aW4gYSBmZXcgZGF5cwogMy4gSSBjYW4gc3VibWl0IGEgUFIKCldoYXRldmVyIHdvcmtzIGZvciB5
b3UuCgpbMF0gIltQQVRDSCB2MiAwMC80Ml0gUmlkIFc9MSB3YXJuaW5ncyBmcm9tIEdQVSAobm9u
LVJhZGVvbikiCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVh
ZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
