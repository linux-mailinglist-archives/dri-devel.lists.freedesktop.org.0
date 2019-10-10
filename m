Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF57D2B9A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A4B6EB43;
	Thu, 10 Oct 2019 13:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433E26EB43
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 13:43:00 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id h33so5478581edh.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 06:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=GPnYYEMDEckNQ7Y2v4w4269XrW+ClomGd+q8hjmA410=;
 b=X671/S3zD596RoaxUhZBqmR7XLP2D6l8xZRXSOuJRRDKfljeTzHh1d3SfprseJ3xht
 uKpwt/Y+4CFDMwbfRf3ZL6Sl+Lm520ROffhwuIqeyfDgSodaH2pMc0tZC/RjYbo1Vkp9
 +gScY1pKfNK6PR5oGxgcOlBCFacuruX+pO13BUZGz9WU2yYMvaiMwht1dFRT/Uz0iEJH
 aFJ42XrnY8t/FSlns1a+sqgzloLUSIk+6uBxmolHNmULy+4K5YPVEixKkQ/x+j53lXDe
 P2iyI5YrMIMBsccFiDlJqVoZa2swOHNcBIdjmzHYHQQZRb5gugxhSXBQTcNGSfmjeL68
 d7wg==
X-Gm-Message-State: APjAAAU6XrqJKC+M+VPftFmZmZ3dVVU3bU9ztknxBRY3iTdplTqTWKrX
 nzZoIC1ruUzQOxnpcEWOowJCaQ==
X-Google-Smtp-Source: APXvYqyLv5+m4so686rx25yTmfpciTgt3QHLTGnCQV+UW7pTAp6o54ge8Cm4OQYM05h34gAbbi2/Dw==
X-Received: by 2002:a17:906:364f:: with SMTP id
 r15mr8368184ejb.194.1570714978810; 
 Thu, 10 Oct 2019 06:42:58 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z24sm689693ejw.57.2019.10.10.06.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 06:42:54 -0700 (PDT)
Date: Thu, 10 Oct 2019 15:42:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qiang Yu <yuq825@gmail.com>
Subject: Re: [PATCH 1/6] drm/gem: refine drm_gem_objects_lookup
Message-ID: <20191010134251.GX16989@phenom.ffwll.local>
References: <20190926141046.30758-1-yuq825@gmail.com>
 <20190926141046.30758-3-yuq825@gmail.com>
 <CAL_JsqJOP90jmeDDCsf3tNs6Q13U4GSUsToHsggT3js3=+R94w@mail.gmail.com>
 <CAKGbVbs7ZN=gTkRhY0YqMfUd1=_Rux3WjsDcxbKA9SUaH5F-iw@mail.gmail.com>
 <20191009145748.GC16989@phenom.ffwll.local>
 <CAKGbVbubcSaR0kqj4Ak4Bqs=adtZRZs9XirsBXOxGDYatGdXfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKGbVbubcSaR0kqj4Ak4Bqs=adtZRZs9XirsBXOxGDYatGdXfg@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=GPnYYEMDEckNQ7Y2v4w4269XrW+ClomGd+q8hjmA410=;
 b=khpjdfQG3Tz/X8QjdXDHPt6vLngU0P9aP6xUdqmfrhRNGS5OBOmCbziONPmuDuy6Wo
 UbCefF7mjF0e8O6c1upaYqRhvemI4wguvo2GT8zjTs4OUzlyqOHsbaa0sV81J5SG77v6
 bdCpggJA2LD8fq9jGj29v76rfi5ILhh86MdiU=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, lima@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMTA6MDI6MzFBTSArMDgwMCwgUWlhbmcgWXUgd3JvdGU6
Cj4gT24gV2VkLCBPY3QgOSwgMjAxOSBhdCAxMDo1NyBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgU2VwIDI3LCAyMDE5IGF0IDA4OjA5OjUy
QU0gKzA4MDAsIFFpYW5nIFl1IHdyb3RlOgo+ID4gPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAx
MTowMSBQTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4g
PiA+IE9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDk6MTIgQU0gUWlhbmcgWXUgPHl1cTgyNUBnbWFp
bC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IERvIG5vdCB1c2UgdXNlciBzcGFjZSBi
byBoYW5kbGVzIGRpcmVjdGx5IGFuZCBsZWZ0IHRoZSB1c2VyCj4gPiA+ID4gPiB0byBrZXJuZWwg
Y29weSB3b3JrIHRvIGRyaXZlcnMgY2FsbGluZyB0aGlzIGZ1bmN0aW9uLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IFRoaXMgaXMgZm9yIGRyaXZlciBsaWtlIGxpbWEgd2hpY2ggZG9lcyBub3QgcGFzcyBn
ZW0gYm8KPiA+ID4gPiA+IGhhbmRsZXMgY29udGlub3VzbHkgaW4gYW4gYXJyYXkgaW4gaW9jdGwg
YXJndW1lbnQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+Cj4gPiA+ID4gPiBDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3Jh
LmNvbT4KPiA+ID4gPiA+IENjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+
ID4gPiA+ID4gQ2M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJv
cmEuY29tPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5j
b20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAg
ICAgICAgICAgICAgfCAyOCArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gPiAgZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgMjMgKysrKysrKysrKysrKysr
KystLS0KPiA+ID4gPgo+ID4gPiA+IFBsZWFzZSBrZWVwIHRoZSBjdXJyZW50IHZhcmlhbnQuIFdo
aWxlIG9ubHkgcGFuZnJvc3QgaXMgY29udmVydGVkIEFUTSwKPiA+ID4gPiB2YzQgYW5kIHYzZCB3
aWxsIHVzZSB0aGlzIHRvby4KPiA+ID4gPgo+ID4gPiA+ID4gIGluY2x1ZGUvZHJtL2RybV9nZW0u
aCAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAy
OSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtLmMKPiA+ID4gPiA+IGluZGV4IDY4NTRmNTg2N2Q1MS4uOWY3M2U1ZjNiNTNmIDEwMDY0NAo+
ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwo+ID4gPiA+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwo+ID4gPiA+ID4gQEAgLTY3OSwxMSArNjc5LDExIEBA
IHN0YXRpYyBpbnQgb2JqZWN0c19sb29rdXAoc3RydWN0IGRybV9maWxlICpmaWxwLCB1MzIgKmhh
bmRsZSwgaW50IGNvdW50LAo+ID4gPiA+ID4gIC8qKgo+ID4gPiA+ID4gICAqIGRybV9nZW1fb2Jq
ZWN0c19sb29rdXAgLSBsb29rIHVwIEdFTSBvYmplY3RzIGZyb20gYW4gYXJyYXkgb2YgaGFuZGxl
cwo+ID4gPiA+ID4gICAqIEBmaWxwOiBEUk0gZmlsZSBwcml2YXRlIGRhdGUKPiA+ID4gPiA+IC0g
KiBAYm9faGFuZGxlczogdXNlciBwb2ludGVyIHRvIGFycmF5IG9mIHVzZXJzcGFjZSBoYW5kbGUK
PiA+ID4gPiA+ICsgKiBAYm9faGFuZGxlczogYXJyYXkgb2YgR0VNIG9iamVjdCBoYW5kbGVzCj4g
PiA+ID4gPiAgICogQGNvdW50OiBzaXplIG9mIGhhbmRsZSBhcnJheQo+ID4gPiA+ID4gICAqIEBv
YmpzX291dDogcmV0dXJuZWQgcG9pbnRlciB0byBhcnJheSBvZiBkcm1fZ2VtX29iamVjdCBwb2lu
dGVycwo+ID4gPiA+ID4gICAqCj4gPiA+ID4gPiAtICogVGFrZXMgYW4gYXJyYXkgb2YgdXNlcnNw
YWNlIGhhbmRsZXMgYW5kIHJldHVybnMgYSBuZXdseSBhbGxvY2F0ZWQgYXJyYXkgb2YKPiA+ID4g
PiA+ICsgKiBUYWtlcyBhbiBhcnJheSBvZiBHRU0gb2JqZWN0IGhhbmRsZXMgYW5kIHJldHVybnMg
YSBuZXdseSBhbGxvY2F0ZWQgYXJyYXkgb2YKPiA+ID4gPiA+ICAgKiBHRU0gb2JqZWN0cy4KPiA+
ID4gPiA+ICAgKgo+ID4gPiA+ID4gICAqIEZvciBhIHNpbmdsZSBoYW5kbGUgbG9va3VwLCB1c2Ug
ZHJtX2dlbV9vYmplY3RfbG9va3VwKCkuCj4gPiA+ID4gPiBAQCAtNjk1LDExICs2OTUsMTAgQEAg
c3RhdGljIGludCBvYmplY3RzX2xvb2t1cChzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHAsIHUzMiAqaGFu
ZGxlLCBpbnQgY291bnQsCj4gPiA+ID4gPiAgICogZmFpbHVyZS4gMCBpcyByZXR1cm5lZCBvbiBz
dWNjZXNzLgo+ID4gPiA+ID4gICAqCj4gPiA+ID4gPiAgICovCj4gPiA+ID4gPiAtaW50IGRybV9n
ZW1fb2JqZWN0c19sb29rdXAoc3RydWN0IGRybV9maWxlICpmaWxwLCB2b2lkIF9fdXNlciAqYm9f
aGFuZGxlcywKPiA+ID4gPiA+ICtpbnQgZHJtX2dlbV9vYmplY3RzX2xvb2t1cChzdHJ1Y3QgZHJt
X2ZpbGUgKmZpbHAsIHUzMiAqYm9faGFuZGxlcywKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCBjb3VudCwgc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqKm9ianNfb3V0KQo+
ID4gPiA+Cj4gPiA+ID4gRWl0aGVyIHNwbGl0IGludG8gZHJtX2dlbV9vYmplY3RzX2xvb2t1cCgp
IGFuZCBhCj4gPiA+ID4gZHJtX2dlbV9vYmplY3RzX2xvb2t1cF91c2VyKCkgd2l0aCB0aGUgbGF0
dGVyIGNhbGxpbmcgdGhlIGZvcm1lciBvcgo+ID4gPiA+IGp1c3QgbWFrZSB0aGUgaGVscGVyIHRh
a2UgYm90aCBhIHVzZXIgYW5kIHUzMiogcHRyIHdpdGggdGhlCj4gPiA+ID4gZXhwZWN0YXRpb24g
dGhhdCBvbmx5IG9uZSBvZiB0aGVtIGlzIG5vbi1OVUxMLgo+ID4gPiA+Cj4gPiA+IE9LLCBJIHBy
ZWZlciB0aGUgZmlyc3Qgd2F5LCB3aWxsIHNlbmQgdjIgZm9yIGl0Lgo+ID4KPiA+IE5vdGUgdGhh
dCBob3BlZnVsbHkgc29vbiAoQ2hyaXN0aWFuIEvDtm5pZyBpcyB3b3JraW5nIG9uIGl0KSB3ZSds
bCBoYXZlCj4gPiB3d19tdXRleCBsb2NraW5nIGhlbHBlcnMsIHdoaWNoIHdpbGwgaW50cm9kdWNl
IGEgZHJtX2dlbV9vcGVyYXRpb25fY3R4Lgo+ID4gT25jZSB3ZSBoYXZlIHRoYXQgSSB0aGluayB3
ZSBjYW4gdW5pZnkgYSBsb3Qgb2YgdGhlc2UgaGVscGVycyAoR2VyZAo+ID4gSG9mZm1hbm4gaGFz
IGxvb2tlZCBpbnRvIGl0KSBhbGwgd2hpbGUgbWFraW5nIHRoZW0gbW9yZSBmbGV4aWJsZSAoaS5l
LiBub3QKPiA+IG9ubHkgd29ya3Mgd2l0aCBhcnJheXMpLiBTbyBtaWdodCBiZSB3b3J0aCB0byBj
b29yZGluYXRlIGEgYml0IGhlcmUsIGFuZAo+ID4gbWF5YmUgaG9sZCBvZmYgb24ganVzdCB0aGlz
IHBhcnQgZm9yIGxpbWEgZm9yIGEgYml0Lgo+IAo+IEkgZG9uJ3Qga25vdyB0aGUgY29udGV4dCBv
ZiB0aGVzZSB3b3Jrcywgc28gSSB0aGluayBJJ2QgYmV0dGVyIHdhaXQgc29tZSB0aW1lCj4gZm9y
IHRoZSBuZXcgaW50ZXJmYWNlIGFuZCBzZW5kIHRoZSByZXN0IG9mIGxpbWEgcGF0Y2hlcyBhcyB2
NC4KClllYWggSSB0aGluayB3aXRoIHRoZSBuZXcgc3R1ZmYgd2UgbWlnaHQgYmUgYWJsZSB0byBh
dm9pZCB0aGUKa3ZtYWxsb2NfYXJyYXksIHRoYXQncyBub3QgcmVhbGx5IGEgZ3JlYXQgaWRlYSB0
byBwbHVnIGludG8gYSBmYXN0cGF0aApsaWtlIGV4ZWNidWYuIFRoZSBvdGhlciBwYXRjaGVzIGNh
biBpbW8gc3RpbGwgZ28gYWhlYWQsIEkgZG9uJ3Qgd2FudCB0bwpob2xkIHVwIGV2ZXJ5dGhpbmcg
Oi0pCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
