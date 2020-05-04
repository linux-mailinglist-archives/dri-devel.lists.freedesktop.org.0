Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EC71C3353
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 09:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2509589F2D;
	Mon,  4 May 2020 07:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92AC89F2D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 07:10:25 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x18so19585490wrq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PG6BwDAPcL8wb4HpwlS4YSmvTNTE6ibzVKQn+MZi8Es=;
 b=LkM38JAq4noGtfOnmF87UfUXUnx6MfQgOywDyS/n35EYboeqiGo2aRfDc8mXTnwM5w
 CPXlcI8M5+UniPHP9U8mAy6J6HNBwBJBxlJUZ70R0THyb75LvqPSiTOxHAEq+XclvRZ+
 Cs4PSD7jw3rXiWEvuQicaqtfskfu/SsE8N//AJugm+JvRey12eitbIz3Vbw0QSYHHO33
 738FUZBMV0R+7+ccdZClm7k0b5FVLgHBo2QbawaJeeDYBCyb1od0JYkd9NxKojoufQiU
 Qyx56CKXSBdBgNIZdHSrW77VUg5t4F4oI5lrot6S6VGQll+BGG9+x7cvPpn4scU/0aj/
 Vr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PG6BwDAPcL8wb4HpwlS4YSmvTNTE6ibzVKQn+MZi8Es=;
 b=gVXmL7L3+EDJUQ8rs1Z6k3iO6l736o6KnQLjiUgFEdHjzhQg4ekwbN0Uhdv/CFrCAR
 HnAuITmmfFO4cTCUBJ7GxBS3HFXdgKOi+Y7DgluY2596GsuifXoDEmYWStMc9WyJ+TtP
 GJKKZ+Qijcr7cvTn7WHLlBben7c85Qf3mCBbXbGP93aG0Zb6OTIZ9q9QnGqXimPZNI9G
 m7WIVYNalMEJVg5VT60YL9ZzYHp5beNqmw+BQLIquL6H9pJAcmPxGtkgHFbLBOX+iodd
 R5/C2uDzGcXEYqKXCjghmrrEav1otT6O4usO7+DS/+w87YzLJa26eyhddNfxfs2QTVYK
 /n4g==
X-Gm-Message-State: AGi0PuakBogNuxNzk5SJ+L3woGqhBkhbuaAT/+S5LiMfwJ4zaDYrCZf/
 8rYUZVY+gu+ooUp98RXC5vUgAQ==
X-Google-Smtp-Source: APiQypJJ8tWv285WswOjJBC9z1LmXOMpX5hXpKi/l41oV/Xikfp3MSONQbmU+rPwn7cBbxCVScdgeQ==
X-Received: by 2002:adf:f5c4:: with SMTP id k4mr17360658wrp.294.1588576224290; 
 Mon, 04 May 2020 00:10:24 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id l15sm11423844wmi.48.2020.05.04.00.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 00:10:23 -0700 (PDT)
Date: Mon, 4 May 2020 08:10:21 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
Message-ID: <20200504071021.GC298816@dell>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-2-noralf@tronnes.org>
 <20200430083219.GC3118@dell>
 <0fbc4eb5-cb39-5974-85bb-9f13278ecab4@tronnes.org>
 <20200430101529.GB298816@dell>
 <20200430140242.GF10381@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430140242.GF10381@phenom.ffwll.local>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAzMCBBcHIgMjAyMCwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gVGh1LCBBcHIg
MzAsIDIwMjAgYXQgMTE6MTU6MjlBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gVGh1
LCAzMCBBcHIgMjAyMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+ID4gCj4gPiA+IAo+ID4gPiAK
PiA+ID4gRGVuIDMwLjA0LjIwMjAgMTAuMzIsIHNrcmV2IExlZSBKb25lczoKPiA+ID4gPiBPbiBX
ZWQsIDI5IEFwciAyMDIwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4+
IEFkZCBhIHdheSB0byBsb29rdXAgYSBiYWNrbGlnaHQgZGV2aWNlIGJhc2VkIG9uIGl0cyBuYW1l
Lgo+ID4gPiA+PiBXaWxsIGJlIHVzZWQgYnkgYSBVU0IgZGlzcGxheSBnYWRnZXQgZ2V0dGluZyB0
aGUgbmFtZSBmcm9tIGNvbmZpZ2ZzLgo+ID4gPiA+Pgo+ID4gPiA+PiBDYzogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+ID4gPj4gQ2M6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVs
LnRob21wc29uQGxpbmFyby5vcmc+Cj4gPiA+ID4+IENjOiBKaW5nb28gSGFuIDxqaW5nb29oYW4x
QGdtYWlsLmNvbT4KPiA+ID4gPj4gU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3Jh
bGZAdHJvbm5lcy5vcmc+Cj4gPiA+ID4+IC0tLQo+ID4gPiA+PiAgZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvYmFja2xpZ2h0LmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiA+ID4gPj4gIGlu
Y2x1ZGUvbGludXgvYmFja2xpZ2h0LmggICAgICAgICAgIHwgIDEgKwo+ID4gPiA+PiAgMiBmaWxl
cyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4gPiA+ID4gCj4gPiA+ID4gT25jZSByZXZpZXdl
ZCwgY2FuIHRoaXMgcGF0Y2ggYmUgYXBwbGllZCBvbiBpdHMgb3duPwo+ID4gPiA+IAo+ID4gPiAK
PiA+ID4gSWYgeW91IGNhbiBhcHBseSBpdCBmb3IgNS44LCB0aGVuIHdlJ3JlIGdvb2QuIERSTSBo
YXMgY3V0b2ZmIGF0IC1yYzUgYW5kCj4gPiA+IHRoZSBkcml2ZXIgd29uJ3QgYmUgcmVhZHkgZm9y
IHRoYXQuIFRoaXMgcGF0Y2ggaGFzIHRoaXMgZGVwZW5kZW5jeQo+ID4gPiBjaGFpbjogdXNiIC0+
IGRybSAtPiBiYWNrbGlnaHQuIFNvIGlmIHlvdSBjYW4gYXBwbHkgaXQgZm9yIDUuOCwgdGhpbmdz
Cj4gPiA+IGdldHMgZWFzaWVyLgo+ID4gPiAKPiA+ID4gPiBNeSBndWVzcyBpcyB0aGF0IGl0IGNh
bid0LCBhcyB0aGUgb3RoZXIgcGF0Y2hlcyBpbiB0aGlzIHNldCBkZXBlbmQgb24KPiA+ID4gPiBp
dCwgcmlnaHQ/ICBJZiB0aGlzIGFzc3VtcHRpb24gaXMgdHJ1ZSwgeW91IG5lZWQgdG8gc2VuZCBt
ZSB0aGUgcmVzdAo+ID4gPiA+IG9mIHRoZSBzZXQuCj4gPiA+ID4gCj4gPiA+ID4gRllJOiBJdCdz
IG5vcm1hbGx5IGJldHRlciB0byBzZW5kIHRoZSB3aG9sZSBzZXQgdG8gZXZlcnlvbmUsIGFzIGl0
Cj4gPiA+ID4gcHJvdmlkZXMgdmlzaWJpbGl0eSBvbiBjdXJyZW50IHJldmlldyAob3IgbGFjayB0
aGVyZSBvZikgc3RhdHVzIG9mIHRoZQo+ID4gPiA+IG90aGVyIHBhdGNoZXMgYW5kIGFsbG93cyBl
YWNoIG9mIHRoZSBtYWludGFpbmVycyB0byBkaXNjdXNzIHBvc3NpYmxlCj4gPiA+ID4gbWVyZ2Ug
c3RyYXRlZ2llcy4KPiAKPiBVbmZvcnR1bmF0ZWx5IHRoaXMgZG9lc24ndCBob2xkIHVuaXZlcnNh
bGx5LCBzaW5jZSBvbmNlIHlvdSBjYyB0b28gbWFueQo+IHBlb3BsZSBzbXRwIHNlcnZlcnMgc3Rh
cnQgdGhyb3dpbmcgeW91ciBtYWlscyBhd2F5LiBHZW5lcmFsbHkgb25seSBoYXBwZW5zCj4gZm9y
IGJpZ2dlciByZWZhY3RvcmluZ3MsIHNvIHByZXR0eSBtdWNoIGFueW9uZSB3b3JraW5nIGNyb3Nz
LXRyZWUgZG9lc24ndAo+IGRvIHRoaXMgYmVjYXVzZSBpdCBkb2Vzbid0IHdvcmsuCgpJIGhhdmVu
J3QgZXhwZXJpZW5jZWQgaXNzdWVzIHdpdGggU01UUCBzZXJ2ZXJzLiAgQWx0aG91Z2ggSSBhbSBh
d2FyZQpvZiBhIGZldyBtYWlsaW5nIGxpc3RzIHRoYXQgYXJlIGNvbmZpZ3VyZWQgdG8gcmVxdWly
ZSBtb2RlcmF0b3IKaW50ZXJ2ZW50aW9uIGlmIHRoZSByZWNpcGllbnQgbGlzdCByZWFjaGVzIGEg
Z2l2ZW4gbGVuZ3RoLgoKPiA+ID4gZHJpLWRldmVsIGlzIHRoZSBNTCBmb3IgYmFja2xpZ2h0IHNv
IEkgYXNzdW1lZCB5b3UgZ290IHRoZSBmdWxsIHNldC4KPiA+IAo+ID4gZHJpLWRldmVsIGlzbid0
IHRoZSBNTCBmb3IgQmFja2xpZ2h0LiAgSXQncyBhbiBpbnRlcmVzdGVkIHBhcnR5Lgo+ID4gCj4g
PiBJIGNlcnRhaW5seSBoYXZlIG5vIGludGVudGlvbiBvZiBzdWJzY3JpYmluZyB0byBpdC4KPiAK
PiBkcmktZGV2ZWwgaXMgb24gbG9yZSBzbyB0aGF0IHlvdSBjYW4gZ3JhYiBtaXNzaW5nIHBhdGNo
ZXMuIE5vIG5lZWQgdG8KPiBzdWJzY3JpYmUuIEkndmUgb25seSBtYW5nZWQgdG8gZ2V0IHRoaXMg
c29ydGVkIHJlY2VudGx5IChsYXN0IGF1dHVtbiBvcgo+IHNvKSwgYnV0IGl0J3MgZmluYWxseSBk
b25lLgoKVGhpcyBpcyBoZWxwZnVsLiAgVGhhbmtzIGZvciBkb2luZyB0aGUgd29yayByZXF1aXJl
ZCB0byBtYWtlIHRoaXMKaGFwcGVuLiAgSXQncyBzdGlsbCBpbmZpbml0ZWx5IG1vcmUgY29udmVu
aWVudCB0byBoYXZlIHRoZSBmdWxsIHNldAppbiBteSBpbmJveCBhdmFpbGFibGUgZm9yIHJldmll
dy4gIEFzIHNvbWVvbmUgd2hvIHdvcmtzIGNyb3NzLQpzdWJzeXN0ZW0gYSBsb3QsIEkgY2FuIHRl
bGwgeW91IHRoYXQgaXQgd29ya3Mgd2VsbCBpbiB0aGUgdmFzdAptYWpvcml0eSBvZiBjYXNlcy4K
Ck1heWJlIGp1c3QgYWRkIHRoZSBsaXN0ZWQgKGluICdNQUlOVEFJTkVSUycpIG1haW50YWluZXJz
IGFuZCBwb3NzaWJseQp0aGUgcmV2aWV3ZXJzLiAgT2J2aW91c2x5IGFsbCBvZiB0aGUgc2Vjb25k
YXJ5IGludGVyZXN0ZWQgcGFydGllcyB0aGF0CmdldF9tYWludGFpbmVyLnBsIHJlY29tbWVuZHMg
c2hvdWxkIGJlIG9taXR0ZWQuCgo+ID4gPiBJIGhhdmUgaGFkIHRyb3VibGUgaW4gdGhlIHBhc3Qg
d2l0aCBteSBlbWFpbCBwcm92aWRlciBkcm9wcGluZyBwYXJ0cyBvZgo+ID4gPiBhIHNlcmllcyB3
aGVuIEkgaGFkIHRvIG1hbnkgcmVjaXBpZW50cy4KPiA+IAo+ID4gV2l0aG91dCB2aXNpYmlsaXR5
IGludG8gdGhlIG90aGVyIHBhdGNoZXMgaW4gdGhlIHNldCwgdGhpbmdzIGJlY29tZQo+ID4gbW9y
ZSBkaWZmaWN1bHQuICBNYXliZSB1c2UgYSBkaWZmZXJlbnQvYmV0dGVyIGVtYWlsIHByb3ZpZGVy
LgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExl
YWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxv
dyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
