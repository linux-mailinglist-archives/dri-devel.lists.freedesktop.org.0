Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 462BAA6610
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 11:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111A1890BB;
	Tue,  3 Sep 2019 09:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978F9890BB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 09:53:02 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t50so17940656edd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 02:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=QH3zas9HekoxItC8a0sqoNmu7OEYWxpvM00NIb/DwNg=;
 b=NFkcB01QcWXKrjJB/lExLJw2KajDBPJMHy0SpkTEMGBMoJM7gVJLgRIplJBTWQ7Qpw
 ShVdTdpDR6gn2czBRQvts+JjO+CEppbJKmGGYynsdPpHKnHpoi2aqVog8nmx4olyoUrU
 eKKRjKgkV4paBc1byiDG2UYcaJsfPkNeB8cds6GMishVA0xWJP/9JAUthr+Gf9GC0sSn
 atMAJKGBK/UH9GUwPTBNGl71bX4enKO4uo3jBef3F7ApylSFkDT+Px2Stb7H8ekgk6wt
 llsQgKyBe7kvffumtprn+fqD37rHaJ/086HgZ2MNJLKviusiJD5qAu79WqsNcpsbBMPE
 y4WA==
X-Gm-Message-State: APjAAAUCz8ukqsgQwnsV2hrvUeLnxPSxdorNh9tcDgvCiCMgtXyauapZ
 HH9ELjkN6W1M7WcCMoL8O4ayqLRvWQJVDg==
X-Google-Smtp-Source: APXvYqyTRL3MX/KBX2ZjnpiDcXmeCHGwZYbsTUEE3g+uBtTv/HWP91ikDKbNtgw/migHDlbLwO5LSA==
X-Received: by 2002:a17:906:30d9:: with SMTP id
 b25mr26768516ejb.55.1567504381147; 
 Tue, 03 Sep 2019 02:53:01 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id p5sm3414731edr.72.2019.09.03.02.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 02:53:00 -0700 (PDT)
Date: Tue, 3 Sep 2019 11:52:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Heinrich Fink <heinrich.fink@daqri.com>
Subject: Re: [PATCH v2] drm: Add high-precision time to vblank trace event
Message-ID: <20190903095258.GS2112@phenom.ffwll.local>
References: <20190814171518.GL7444@phenom.ffwll.local>
 <20190902142412.27846-1-heinrich.fink@daqri.com>
 <20190902142412.27846-2-heinrich.fink@daqri.com>
 <20190903074644.GI2112@phenom.ffwll.local>
 <CAB6MLDY3q_w2Gv+x3mjriFjGvg0BuJk3w-1pJ8xfEg_3m+q90w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB6MLDY3q_w2Gv+x3mjriFjGvg0BuJk3w-1pJ8xfEg_3m+q90w@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QH3zas9HekoxItC8a0sqoNmu7OEYWxpvM00NIb/DwNg=;
 b=O5hmTFU/n+0729RmN0jtId1Qalvs2XpKkrL1M+Ij/YRQdzqvDdbf1WTH010cH04yJy
 flfgl4lz/zQCzUCpOlkBJL/wV//xQnhjoMscRjCD48dar5ZQdDZDWwZ0tH+iGIiyJnU6
 NGcen8h/2dgigOg5ICM/f1Fh9KY0vzNtOtN/s=
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
Cc: Keith Packard <keithp@keithp.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMTE6MTk6MTlBTSArMDIwMCwgSGVpbnJpY2ggRmluayB3
cm90ZToKPiBPbiBUdWUsIDMgU2VwIDIwMTkgYXQgMDk6NDYsIERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBTZXAgMDIsIDIwMTkgYXQgMDQ6MjQ6
MTJQTSArMDIwMCwgSGVpbnJpY2ggRmluayB3cm90ZToKPiA+ID4gU3RvcmUgdGhlIHRpbWVzdGFt
cCBvZiB0aGUgY3VycmVudCB2YmxhbmsgaW4gdGhlIG5ldyBmaWVsZCAndGltZScgb2YgdGhlCj4g
PiA+IHZibGFuayB0cmFjZSBldmVudC4gSWYgdGhlIHRpbWVzdGFtcCBpcyBjYWxjdWxhdGVkIGJ5
IGEgZHJpdmVyIHRoYXQKPiA+ID4gc3VwcG9ydHMgaGlnaC1wcmVjaXNpb24gdmJsYW5rIHRpbWlu
Zywgc2V0IHRoZSBmaWVsZCAnaGlnaC1wcmVjJyB0bwo+ID4gPiAndHJ1ZScuCj4gPiA+Cj4gPiA+
IFVzZXIgc3BhY2UgY2FuIG5vdyBhY2Nlc3MgYWN0dWFsIGhhcmR3YXJlIHZibGFuayB0aW1lcyB2
aWEgdGhlIHRyYWNpbmcKPiA+ID4gaW5mcmFzdHJ1Y3R1cmUuIFRyYWNpbmcgYXBwbGljYXRpb25z
IChzdWNoIGFzIEdQVVZpcywgc2VlIFswXSBmb3IKPiA+ID4gcmVsYXRlZCBkaXNjdXNzaW9uKSwg
Y2FuIHVzZSB0aGUgbmV3bHkgYWRkZWQgaW5mb3JtYXRpb24gdG8gY29uZHVjdCBhCj4gPiA+IG1v
cmUgYWNjdXJhdGUgYW5hbHlzaXMgb2YgZGlzcGxheSB0aW1pbmcuCj4gPiA+Cj4gPiA+IHYyIEZp
eCBhdXRob3IgbmFtZSAobWlzc2luZyBsYXN0IG5hbWUpCj4gPiA+Cj4gPiA+IFswXSBodHRwczov
L2dpdGh1Yi5jb20vbWlrZXNhcnQvZ3B1dmlzL2lzc3Vlcy8zMAo+ID4gPgo+ID4gPiBSZXZpZXdl
ZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogSGVpbnJpY2ggRmluayA8aGVpbnJpY2guZmlua0BkYXFyaS5jb20+Cj4gPgo+ID4g
QXBwbGllZCwgdGhhbmtzLgo+IAo+IHRoYW5rcyEgT25lIHF1ZXN0aW9uOiBBZnRlciBzZW5kaW5n
IHYyLCBJIGdvdCBhbiBlbWFpbCBmcm9tIHBhdGNod29yawo+IHBvaW50aW5nIGF0IHNvbWUgZmFp
bGVkIHN0eWxlIGNoZWNrcyAoQ0hFQ0s6UEFSRU5USEVTSVNfQUxJR05NRU5ULAo+IENIRUNLOkNP
TVBBUklTT05fVE9fTlVMTCkuIEp1c3Qgc28gSSBrbm93IGZvciB0aGUgZnV0dXJlLCBhcmUgdGhl
c2UKPiBjaGVja3MgbWFuZGF0b3J5IHRvIGJlIGFkZHJlc3NlZD8gSSBoYXZlbid0IGhhZCBhIGNo
YW5jZSB0byBhZGRyZXNzCj4gdGhlbSB5ZXQuIEZXSVcsIGxpbnV4LXRyZWUvc2NyaXB0cy9jaGVj
a3BhdGNoLnBsIGRpZCBub3QgY29tcGxhaW4uCgpJdCdzIHRoZSBzYW1lIHNjcmlwdCwgYnV0IEkg
dGhpbmsgQ0kgdXNlcyBzb21lIGRpZmZlcmVudCBvcHRpb25zL2ZsYWdzLiBJCmdlbmVyYWxseSBp
Z25vcmUgdGhlc2UsIGJ1dCBhbHNvIGdlbmVyYWxseSBnb29kIHRvIHN0aWNrIHRvIHRoZSBzdHls
ZS4KCiQgZGltIGNoZWNrcGF0Y2gKCmluIG91ciBtYWludGFpbmVyLXRvb2xzIHNob3VsZCBnaXZl
IHlvdSB0aGUgZHJtIGZsYXZvdXJlZCBjaGVja3BhdGNoLgotRGFuaWVsCgo+IAo+IC0gSGVpbnJp
Y2gKPiAKPiA+IC1EYW5pZWwKPiA+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV90cmFjZS5oICB8IDE0ICsrKysrKysrKystLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X3ZibGFuay5jIHwgIDMgKystCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX3RyYWNlLmggYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3RyYWNlLmgKPiA+ID4gaW5kZXgg
NDcxZWI5Mjc0NzRiLi4xMWM2ZGQ1NzdlOGUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fdHJhY2UuaAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3RyYWNlLmgK
PiA+ID4gQEAgLTEzLDE3ICsxMywyMyBAQCBzdHJ1Y3QgZHJtX2ZpbGU7Cj4gPiA+ICAjZGVmaW5l
IFRSQUNFX0lOQ0xVREVfRklMRSBkcm1fdHJhY2UKPiA+ID4KPiA+ID4gIFRSQUNFX0VWRU5UKGRy
bV92YmxhbmtfZXZlbnQsCj4gPiA+IC0gICAgICAgICBUUF9QUk9UTyhpbnQgY3J0YywgdW5zaWdu
ZWQgaW50IHNlcSksCj4gPiA+IC0gICAgICAgICBUUF9BUkdTKGNydGMsIHNlcSksCj4gPiA+ICsg
ICAgICAgICBUUF9QUk9UTyhpbnQgY3J0YywgdW5zaWduZWQgaW50IHNlcSwga3RpbWVfdCB0aW1l
LCBib29sIGhpZ2hfcHJlYyksCj4gPiA+ICsgICAgICAgICBUUF9BUkdTKGNydGMsIHNlcSwgdGlt
ZSwgaGlnaF9wcmVjKSwKPiA+ID4gICAgICAgICAgIFRQX1NUUlVDVF9fZW50cnkoCj4gPiA+ICAg
ICAgICAgICAgICAgICAgIF9fZmllbGQoaW50LCBjcnRjKQo+ID4gPiAgICAgICAgICAgICAgICAg
ICBfX2ZpZWxkKHVuc2lnbmVkIGludCwgc2VxKQo+ID4gPiArICAgICAgICAgICAgICAgICBfX2Zp
ZWxkKGt0aW1lX3QsIHRpbWUpCj4gPiA+ICsgICAgICAgICAgICAgICAgIF9fZmllbGQoYm9vbCwg
aGlnaF9wcmVjKQo+ID4gPiAgICAgICAgICAgICAgICAgICApLAo+ID4gPiAgICAgICAgICAgVFBf
ZmFzdF9hc3NpZ24oCj4gPiA+ICAgICAgICAgICAgICAgICAgIF9fZW50cnktPmNydGMgPSBjcnRj
Owo+ID4gPiAgICAgICAgICAgICAgICAgICBfX2VudHJ5LT5zZXEgPSBzZXE7Cj4gPiA+IC0gICAg
ICAgICAgICAgICAgICksCj4gPiA+IC0gICAgICAgICBUUF9wcmludGsoImNydGM9JWQsIHNlcT0l
dSIsIF9fZW50cnktPmNydGMsIF9fZW50cnktPnNlcSkKPiA+ID4gKyAgICAgICAgICAgICAgICAg
X19lbnRyeS0+dGltZSA9IHRpbWU7Cj4gPiA+ICsgICAgICAgICAgICAgICAgIF9fZW50cnktPmhp
Z2hfcHJlYyA9IGhpZ2hfcHJlYzsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICksCj4gPiA+
ICsgICAgICAgICBUUF9wcmludGsoImNydGM9JWQsIHNlcT0ldSwgdGltZT0lbGxkLCBoaWdoLXBy
ZWM9JXMiLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgX19lbnRyeS0+Y3J0YywgX19lbnRy
eS0+c2VxLCBfX2VudHJ5LT50aW1lLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgX19lbnRy
eS0+aGlnaF9wcmVjID8gInRydWUiIDogImZhbHNlIikKPiA+ID4gICk7Cj4gPiA+Cj4gPiA+ICBU
UkFDRV9FVkVOVChkcm1fdmJsYW5rX2V2ZW50X3F1ZXVlZCwKPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5j
Cj4gPiA+IGluZGV4IGZkMWZiYzc3ODcxZi4uYzk5ZmVkYTI1ZGVhIDEwMDY0NAo+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fdmJsYW5rLmMKPiA+ID4gQEAgLTE3MzEsNyArMTczMSw4IEBAIHN0YXRpYyB2b2lkIGRy
bV9oYW5kbGVfdmJsYW5rX2V2ZW50cyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBp
bnQgcGlwZSkKPiA+ID4gICAgICAgICAgICAgICBzZW5kX3ZibGFua19ldmVudChkZXYsIGUsIHNl
cSwgbm93KTsKPiA+ID4gICAgICAgfQo+ID4gPgo+ID4gPiAtICAgICB0cmFjZV9kcm1fdmJsYW5r
X2V2ZW50KHBpcGUsIHNlcSk7Cj4gPiA+ICsgICAgIHRyYWNlX2RybV92YmxhbmtfZXZlbnQocGlw
ZSwgc2VxLCBub3csCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZXYtPmRyaXZlci0+Z2V0
X3ZibGFua190aW1lc3RhbXAgIT0gTlVMTCk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICAvKioKPiA+
ID4gLS0KPiA+ID4gMi4yMy4wLnJjMQo+ID4gPgo+ID4KPiA+IC0tCj4gPiBEYW5pZWwgVmV0dGVy
Cj4gPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiA+IGh0dHA6Ly9ibG9n
LmZmd2xsLmNoCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
