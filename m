Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCC9122D70
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 14:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4ECD6E9E5;
	Tue, 17 Dec 2019 13:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4646E9E5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 13:51:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z3so3848557wru.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 05:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=UpDwTP6xUYOJn/p4VO1T9tIwMyJ+3s44ALkmuaBYU3U=;
 b=guHBR27yvZI1WGUgGNV0FTbLksEs26VjD6okj2KrEUZ7Ia9/PrXNaZQYES9kx2u57m
 oVvQTfRwGfahNrqlqQBPDj+2O2vZZNokYrE/qiQnQkopHSabr32d+bsO5z+DnsUOdIxI
 hIGI4d4ordTo242Ptbjn4jXZv42nuGRgWDqBW1Dl4/AerEzcjhNjT01J78z299Lq3xz8
 3W+IguJOnYqVJpr8AFwmLUoh22IRK2t6d2f5eBSCw33X9fQFT2oi44TUaaNtoMkfE18H
 itAbZTJ38FVK5VxN7K+nXcf1UH6RI2VMB7XSMWy/HDHJRC/wMzvzy6qPjYwn290DwdaS
 Rciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=UpDwTP6xUYOJn/p4VO1T9tIwMyJ+3s44ALkmuaBYU3U=;
 b=s6hImaDX2g0xgk+gzbQD3eBF8AbEzLFt6DjqUN2DgDIaTVTpEU6lSsPqpnw+xUyLgl
 +wnWHKHC22DbAdk0++UxFx+7zUdXSrtjz7xRilRh6TSrv8AOlEILQzQuqt+GVIl+a4Vz
 ESaTvABD6vVk0HpzpITWte72027F7t/KQEdgJaUtrlgkRxDWujaGwIi87fXyYmFN7y63
 6MT7rxbXWuUf2VYYqE7yynWNpJ6cqUsIHRbgvWUvaMro+tP4GtZhE8jj6gdm7mGDRFRI
 CCQQV4bJudCm81hTZa1xOHdOSH78JzsVsvKxmYEFi3aJXLom4hic8DZiMfWBpjscL5c+
 yStw==
X-Gm-Message-State: APjAAAWN9IIcl1VsLBUOeSXONQX0XgdoBbTfDX5gsT4REk/RLN4u/F0Z
 Lu4hbNk12tUHbaN5/JgM0gY5/A==
X-Google-Smtp-Source: APXvYqzWqTHQ/8Hj1jyKQHKlahN+h3FSMhKarcDhsgeUhMP0afvTz0/tlTOqBvWUYAzzGTWaWT4WIg==
X-Received: by 2002:a05:6000:12c9:: with SMTP id
 l9mr39105103wrx.304.1576590700711; 
 Tue, 17 Dec 2019 05:51:40 -0800 (PST)
Received: from dell ([2.27.35.132])
 by smtp.gmail.com with ESMTPSA id n189sm3191999wme.33.2019.12.17.05.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 05:51:40 -0800 (PST)
Date: Tue, 17 Dec 2019 13:51:40 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 2/3] mfd: intel_soc_pmic: Rename pwm_backlight pwm-lookup
 to pwm_pmic_backlight
Message-ID: <20191217135140.GL18955@dell>
References: <20191212084546.GA3468@dell>
 <d22e9a04-da09-0f41-a78e-ac17a947650a@redhat.com>
 <20191212155209.GC3468@dell>
 <4d07445d-98b1-f23c-0aac-07709b45df78@redhat.com>
 <20191213082734.GE3468@dell>
 <d648794d-4c76-cfa1-dcbd-16c34d409c51@redhat.com>
 <20191216093016.GE3648@dell>
 <fc3c29da-528d-a6b6-d13b-92e6469eadea@redhat.com>
 <20191217081127.GI18955@dell> <87immfyth2.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87immfyth2.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-acpi@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNyBEZWMgMjAxOSwgSmFuaSBOaWt1bGEgd3JvdGU6Cgo+IE9uIFR1ZSwgMTcgRGVj
IDIwMTksIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gT24gTW9u
LCAxNiBEZWMgMjAxOSwgSGFucyBkZSBHb2VkZSB3cm90ZToKPiA+Cj4gPj4gSGksCj4gPj4gCj4g
Pj4gRG9pbmcgaW1tdXRhYmxlIGJyYW5jaGVzIGFzc3VtZXMgdGhhdCB0aGVyZSBpcyBhIGJhc2Ug
cG9pbnQsCj4gPj4gZS5nLiA1LjUtcmMxIHdoZXJlIHRoZSBpbW11dGFibGUgYnJhbmNoIGNhbiB0
aGVuIGJlIGJhc2VkIG9uIGFuZAo+ID4+IHRoYXQgdGhlIGJyYW5jaCBjYW4gdGhlbiBiZSBtZXJn
ZWQgd2l0aG91dCBpc3N1ZXMgaW50byBib3RoIHN1YnN5c3RlbXMuCj4gPj4gCj4gPj4gZHJtIGlz
IGNvbnN0YW50bHkgZXZvbHZpbmcgdG8gZGVhbCB3aXRoIGFuZCBtb3N0bHkgY2F0Y2ggdXAgd2l0
aCBuZXcKPiA+PiBoYXJkd2FyZSBhcyBib3RoIEdQVXMgYW5kIGRpc3BsYXktcGlwZWxpbmVzIGFy
ZSBldm9sdmluZyBxdWl0ZSByYXBpZGx5Cj4gPj4gYXRtIGRybS1pbnRlbC1uZXh0IGhhcyBhYm91
dCA0MDAgY29tbWl0cyBvbiB0b3Agb2YgNS41LXJjMSBzbyBmb3IgYW4KPiA+PiBpbW11dGFibGUg
YnJhbmNoIEkgY2FuIGVpdGhlciBiYXNlIGl0IG9uIGRybS1pbnRlbC1uZXh0IHdoaWNoCj4gPj4g
dmlvbGF0ZXMgeW91ciByZXF1ZXN0IGZvciBhIGNsZWFuIG1pbmltYWwgYnJhbmNoIHRvIG1lcmdl
OyBvciBJIGNhbgo+ID4+IGJhc2UgaXQgb24gNS41LXJjMSB3aGljaCBsZWFkcyB0byBhIGJpZyBj
aGFuY2Ugb2YgcHJvYmxlbXMgd2hlbgo+ID4+IG1lcmdpbmcgaXQgZ2l2ZW4gdG8gbGFyZ2UgYW1v
dW50IG9mIGNodXJuIGluIGRybS1pbnRlbC1uZXh0Lgo+ID4KPiA+IFRoaXMgaXMgYSAqc2xpZ2h0
bHkqIG1vcmUgY29tcGVsbGluZyByZWFzb24gdGhhbiB0aGUgb25lcyB5b3UndmUKPiA+IHByZXZp
b3VzbHkgcHJvdmlkZWQuCj4gPgo+ID4+IFNvIGluc3RlYWQgb2YgdGhlIG5vcm1hbCBjYXNlIG9m
IDIgc3Vic3lzdGVtcyBzZWVpbmcgc29tZSBjaGFuZ2VzCj4gPj4gb24gYm90aCBzaWRlIHRoZSBj
YXNlIHdlIGhhdmUgaGVyZSBpcyBhIHBhcnQgb2YgYSBmaWxlIHdoaWNoIGhhcwo+ID4+IG5vdCBj
aGFuZ2VkIHNpbmNlIDIwMTUtMDYtMjYgaW4gb25lIHN1YnN5cyAoYW5kIGNoYW5naW5nIG9ubHkK
PiA+PiBhIHNpbmdsZSBsaW5lIHRoZXJlISkgYW5kIE9UT0ggd2UgaGF2ZSBiaWdnZXIgY2hhbmdl
cyB0byBhIHN1YnN5cwo+ID4+IHdoaWNoIHNlZSA0MDAgcGF0Y2hlcyBsYW5kIGluIHRoZSBmaXJz
dCB3ZWVrIHNpbmNlIHJjMSAuCj4gPgo+ID4gVGhpcyBpcyBub3QuCj4gPgo+ID4+IEkgaG9wZSB0
aGF0IHlvdSBhZ3JlZSB0aGF0IGluIHRoaXMgY2FzZSBnaXZlbiB0aGUgbGFyZ2UgYW1vdW50IG9m
Cj4gPj4gY2h1cm4gaW4gZHJtLWludGVsLW5leHQgaXQgbWFrZXMgc2luY2UgdG8ganVzdCBzdHJh
aWdodCBmb3J3YXJkCj4gPj4gYXBwbHkgdGhlc2UgcGF0Y2hlcyBvbiB0b3Agb2YgZHJtLWludGVs
LW5leHQuCj4gPgo+ID4gSSBoYXZlIEFja2VkIHRoaXMgcGF0Y2gsIGJ1dCByZW1lbWJlciAqdGhp
cyogaXMgdGhlIGV4Y2VwdGlvbiByYXRoZXIKPiA+IHRoYW4gdGhlIHJ1bGUuICBJZi93aGVuIHdl
IGhhdmUgYSBjYXNlIHdoZXJlIGEgY29udHJpYnV0b3Igd29ya3MKPiA+IGNyb3NzLXN1YnN5c3Rl
bSB3aXRoIERSTSBhbmQgdGhlIGNvZGUvZmlsZSBhZGFwdGVkIGlzIGxpdmUgKG1vcmUKPiA+IGxp
a2VseSB0byBjaGFuZ2UpLCBJIHdpbGwgaGF2ZSB0byBpbnNpc3Qgb24gYW4gaW1tdXRhYmxlIGJy
YW5jaAo+ID4gc3RyYXRlZ3kuICBEUk0gd2lsbCBoYXZlIHRvIGRlYWwgd2l0aCB0aGF0IGFwcHJv
cHJpYXRlbHkuCj4gCj4gSGksIHRoYW5rcyBmb3IgdGhlIGFjayBhbmQgcmVhY2hpbmcgYW4gYWdy
ZWVtZW50IHdpdGggSGFucywgYW5kIHNvcnJ5Cj4gZm9yIG5vdCByZXNwb25kaW5nIGVhcmxpZXIu
Cj4gCj4gSXQncyBub3QgdW51c3VhbCBmb3IgdXMgdG8gaGF2ZSB0b3BpYyBicmFuY2hlcyBmb3Ig
Y3Jvc3Mtc3Vic3lzdGVtIG9yCj4gY3Jvc3MtZHJpdmVyIGNoYW5nZXMsIGFuZCBJIHRoaW5rIHVz
dWFsbHkgd2UgdHJ5IHRvIGJlIGFjY29tbW9kYXRpbmcgaW4KPiBtZXJnaW5nIHN0dWZmIHRocm91
Z2ggd2hpY2hldmVyIHRyZWUgaXQgbWFrZXMgbW9zdCBzZW5zZS4gSW4gZmFjdCBteSBhY2sKPiB0
byBkbyBqdXN0IHRoYXQgd2FzIG15IGZpcnN0IHJlc3BvbnNlIG9uIHRoaXMgc2VyaWVzIFsxXS4K
PiAKPiBTbyBJIGRvbid0IHJlYWxseSBrbm93IHdoeSB0aGUgZnVzcy4gV2UnbGwgYW55d2F5IGRl
YWwgd2l0aCBhbnkKPiBjcm9zcy1zdWJzeXN0ZW0gc2VyaWVzIG9uIGEgY2FzZSBieSBjYXNlIGJh
c2lzLCBkZXBlbmRpbmcgb24gd2hhdCBtYWtlcwo+IG1vc3Qgc2Vuc2UsIGFuZCB3aGF0IHN1aXRz
IGFsbCBtYWludGFpbmVycyBpbnZvbHZlZC4KClBlcmZlY3QuICBUaGFua3MgZm9yIHRoZSBjbGFy
aWZpY2F0aW9uLiAgSSBsb29rIGZvcndhcmQgdG8gd29ya2luZwp3aXRoIHlvdSBndXlzIGluIHRo
ZSBmdXR1cmUuCgpIYW5zIHdhcyBtYWtpbmcgdGhlIGNhc2UgdGhhdCB0aGlzIHdhcyBpbXByYWN0
aWNhbCBmb3IgRFJNLCBkdWUgdG8gdGhlCmFtb3VudCBvZiBjaHVybiB5b3UgZ3V5cyByZWNlaXZl
LCBoZW5jZSB0aGUgZGlzY3Vzc2lvbi4gIEknbSB2ZXJ5CnBsZWFzZWQgdGhhdCB0aGlzIGlzIG5v
dCB0aGUgY2FzZS4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRl
Y2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
