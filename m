Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD5AFB65F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 18:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF746EDBB;
	Wed, 13 Nov 2019 17:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F79D6EDBB
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 17:25:21 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id f27so748359vkl.11
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 09:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TgXksbR1MWkoTp4wiUzJetzjSRWtk4RkU1XDhLlvJaI=;
 b=f2E4c8/v8MUx1SOw92+dz0AjR9kdgXzoSgAmaVTiQiWEiMV2Ze03HMAmAoQqHBSzw1
 gp+hLsG/Kg0XTERG4nQ39R9C8jzG7FSDNQSZBzQLJoco3b/h/ijwo+C9p54jZZa9xCe8
 akuKPZbWh7QMSOVtKd7g7ySXx/crQvnvE1lU4O4RXAnMWTeQmm0Z5AK8upXFII11yHr5
 +q0iHQ4eTdx+dd/4v4tITK7odGLK1CjAvwdVRXOznlFovsflggpFSsyxSOZVOtFAJPUu
 6SoSu0OTDG5PQ9tnbzv3mBmT+x91CCaEf9DWMdKu6T467hjBLmdM9dnH0m8nIVFCZjGO
 HHTQ==
X-Gm-Message-State: APjAAAUb0AR5KxGuYRLQWdY2WAbEh8btnCJ8o2uot+o2cBOyjBd7OccX
 9GLBcDXvX6Q3chGrc6H+clK2bELKtvOX+DEUvYk=
X-Google-Smtp-Source: APXvYqzjlrR05oLPoFVxguTHM4MbmWzrkRAtcvq5kxbJnWqabiv9Zl3pVFAX9X3CwdUXc3gzOdGuFQrCgEnIFrcxuLY=
X-Received: by 2002:a1f:a357:: with SMTP id m84mr2315357vke.55.1573665920336; 
 Wed, 13 Nov 2019 09:25:20 -0800 (PST)
MIME-Version: 1.0
References: <536af56f-924d-f089-a2d8-180f4dee1613@pr.hu>
 <CAKb7UvhZ9VR_X5Nqv01EDvnWF2RXXt5fCdYEa5KUy8owKh4CwQ@mail.gmail.com>
 <35cdaafe-461e-56ec-d3d3-47fdd6468251@pr.hu>
 <CAKb7Uvh2L0oHMwNss-h1BFXGYeEXOUDLHB9TnaNEm4-oNhjMRw@mail.gmail.com>
 <6af6c1c5-0b99-e034-8a9c-83d4e1171115@pr.hu>
 <d2788b17-3179-ef9d-419a-635e784c6297@pr.hu>
 <CAKb7UvikHeUOj06oqBYnq2==KJ-CGDyZjHsbtbZtA+3r9jK68A@mail.gmail.com>
 <dc03de55-d6df-5804-675f-48f93dc2dfd9@pr.hu>
In-Reply-To: <dc03de55-d6df-5804-675f-48f93dc2dfd9@pr.hu>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 13 Nov 2019 12:25:09 -0500
Message-ID: <CAKb7UvjGD7Az_jAh5Qn8LaesjVrxpZk67d79aTZHb3_uZ0BEnA@mail.gmail.com>
Subject: Re: UDL device cannot get its own screen
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
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
Cc: xorg@lists.x.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMTE6NTkgQU0gQsO2c3rDtnJtw6lueWkgWm9sdMOhbiA8
emJvc3pvckBwci5odT4gd3JvdGU6Cj4KPiAyMDE5LiAxMS4gMTIuIDE3OjQxIGtlbHRlesOpc3Nl
bCwgSWxpYSBNaXJraW4gw61ydGE6Cj4gPiBPbiBUdWUsIE5vdiAxMiwgMjAxOSBhdCA5OjIzIEFN
IELDtnN6w7ZybcOpbnlpIFpvbHTDoW4gPHpib3N6b3JAcHIuaHU+IHdyb3RlOgo+ID4+IEJ1dCBu
bywgYWxsIEdQVSBkZXZpY2VzIChub3cgb25seSBvbmUsIHRoZSBVREwgZGV2aWNlKSBoYXZlIHNj
cmVlbiAwCj4gPj4gKGEuay5hLiBESVNQTEFZPTowLjApIHNldCB3aGVuIEF1dG9CaW5kR1BVIGlz
IHRydWU6Cj4gPj4KPiA+PiBbICAyNDQ0LjU3Nl0geGY4NkF1dG9Db25maWdPdXRwdXREZXZpY2Vz
OiB4Zjg2TnVtU2NyZWVucyAyIHhmODZOdW1HUFVTY3JlZW5zIDEKPiA+PiBbICAyNDQ0LjU3Nl0g
eGY4NkF1dG9Db25maWdPdXRwdXREZXZpY2VzOiBHUFUgIzAgZHJpdmVyICdtb2Rlc2V0dGluZycg
J21vZGVzZXQnIHNjcm5JbmRleAo+ID4+IDI1NiBvcmlnSW5kZXggMjU3IHBTY3JlZW4tPm15TnVt
IDI1NiBjb25mU2NyZWVuLT5zY3JlZW5udW0gMAo+ID4+IGNvbmZTY3JlZW4tPmRldmljZS0+aWRl
bnRpZmllciAnSW50ZWwwJwo+ID4+ICAgIGNvbmZTY3JlZW4tPmRldmljZS0+c2NyZWVuIDAgY29u
ZlNjcmVlbi0+ZGV2aWNlLT5teVNjcmVlblNlY3Rpb24tPnNjcmVlbm51bSAwCj4gPj4gY29uZlNj
cmVlbi0+ZGV2aWNlLT5teVNjcmVlblNlY3Rpb24tPmRldmljZS0+c2NyZWVuIDAKPiA+Pgo+ID4+
IFNvbWVob3csIE9wdGlvbiAiRGV2aWNlIiBzaG91bGQgZW5zdXJlIHRoYXQgdGhlIFVETCBkZXZp
Y2UgaXMgYWN0dWFsbHkKPiA+PiB0cmVhdGVkIGFzIGEgZnJhbWVidWZmZXIgdGhhdCBjYW4gYmUg
cmVuZGVyZWQgaW50byAoaS5lLiB0byBiZSBtb2Rlc2V0KDIpCj4gPj4gaW5zdGVhZCBvZiBtb2Rl
c2V0KEduKSkgYW5kIGl0IHNob3VsZCBiZSB3b2tlbiB1cCBhdXRvbWF0aWNhbGx5Lgo+ID4+Cj4g
Pj4gVGhpcyBpcyB3aGF0IEF1dG9CaW5kR1BVIGlzIHN1cHBvc2VkIHRvIGRvLCBpc24ndCBpdD8K
PiA+Pgo+ID4+IEJ1dCBpbnN0ZWFkIG9mIGFzc2lnbmluZyB0byBzY3JlZW4gMCwgaXQgc2hvdWxk
IGJlIGFzc2lnbmVkIHRvIHdoYXRldmVyCj4gPj4gc2NyZWVuIG51bWJlciBpdCBpcyBjb25maWd1
cmVkIGFzLgo+ID4+Cj4gPj4gSSBrbm93IGl0J3Mgbm90IGEgY29tbW9uIHVzZSBjYXNlIG5vd2Fk
YXlzLCBidXQgSSByZWFsbHkgd2FudCBzZXBhcmF0ZQo+ID4+IGZ1bGxzY3JlZW4gYXBwcyBvbiB0
aGVpciBpbmRlcGVuZGVudCBzY3JlZW5zLCBpbmNsdWRpbmcgYSBzdGFuZGFsb25lIFVETAo+ID4+
IGRldmljZSwgaW5zdGVhZCBvZiBoYXZpbmcgdGhlIGxhdHRlcnMgYXMgYSBYaW5lcmFtYSBleHRl
bnNpb24gdG8gc29tZQo+ID4+IG90aGVyIGRldmljZS4KPiA+Cj4gPiBJZiB5b3Ugc2VlIGEgIkci
LCB0aGF0IG1lYW5zIGl0J3MgYmVpbmcgdHJlYXRlZCBhcyBhIEdQVSBkZXZpY2UsIHdoaWNoCj4g
PiBpcyAqbm90KiB3aGF0IHlvdSB3YW50IGlmIHlvdSB3YW50IHNlcGFyYXRlIHNjcmVlbnMuIFlv
dSBuZWVkIHRvIHRyeQo+ID4gdG8gY29udmluY2UgdGhpbmdzIHRvICpub3QqIHNldCB0aGUgZGV2
aWNlcyB1cCBhcyBHUFUgZGV2aWNlcywgYnV0Cj4gPiBpbnN0ZWFkIHB1dCBlYWNoIGRldmljZSAo
YW5kIGVhY2ggb25lIG9mIGl0cyBoZWFkcywgdmlhIFphcGhvZEhlYWRzKQo+ID4gbm8gYSBzZXBh
cmF0ZSBkZXZpY2UsIHdoaWNoIGluIHR1cm4gd2lsbCBoYXZlIGEgc2VwYXJhdGUgc2NyZWVuLgo+
Cj4gSSBjcmVhdGVkIGEgbWVyZ2UgcmVxdWVzdCB0aGF0IGZpbmFsbHkgbWFkZSBpdCBwb3NzaWJs
ZSB3aGF0IEkgd2FudGVkLgo+Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcv
eHNlcnZlci9tZXJnZV9yZXF1ZXN0cy8zMzQKPgo+IE5vdywgbm8gbWF0dGVyIGlmIEkgdXNlIHRo
ZSBpbnRlbCBvciBtb2Rlc2V0dGluZyBkcml2ZXJzIGZvciB0aGUKPiBEZXZpY2Ugc2VjdGlvbnMg
dXNpbmcgdGhlIEludGVsIGhlYWRzLCBvciBBdXRvQmluZEdQVSBzZXQgdG8gdHJ1ZSBvcgo+IGZh
bHNlLCB0aGUgVURMIGRldmljZSBpcyBjb3JyZWN0bHkgbWF0Y2hlZCB3aXRoIGl0cyBPcHRpb24g
Imttc2RldiIKPiBzZXR0aW5nIHRvIHRoZSBwbGFmb3JtIGRldmljZSdzIGRldmljZSBwYXRoLgo+
Cj4gVGhpcyBwYXRjaCBzZWVtcyB0byBiZSBhIHNsaWdodCBsYXllcmluZyB2aW9sYXRpb24sIGJ1
dCBzaW5jZSB0aGUKPiBtb2Rlc2V0dGluZyBkcml2ZXIgaXMgYnVpbHQgaW50byB0aGUgWG9yZyBz
ZXJ2ZXIgc291cmNlcywgdGhlIHBhdGNoCj4gbWF5IGdldCBhd2F5IHdpdGggaXQuCgpIYXZlIHlv
dSBsb29rZWQgYXQgc2V0dGluZyBBdXRvQWRkR1BVIHRvIGZhbHNlPyBBdXRvQmluZEdQVSBpcyB0
b28KbGF0ZSAtLSB0aGF0J3Mgd2hlbiB5b3UgYWxyZWFkeSBoYXZlIGEgR1BVLCB3aGV0aGVyIHRv
IGJpbmQgaXQgdG8gdGhlCnByaW1hcnkgZGV2aWNlICgvc2NyZWVuL3doYXRldmVyKS4gWW91IG5l
ZWQgdG8gbm90IGhhdmUgYSBHUFUgaW4gdGhlCmZpcnN0IHBsYWNlLgoKICAtaWxpYQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
