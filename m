Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF0D4E2AD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 11:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4692D6E832;
	Fri, 21 Jun 2019 09:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113D96E832
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 09:10:02 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w13so9087102eds.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 02:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=PyedRPmpprwXb6dbdI/v7rjqMxJ7wsSTyQ3G8WcrcB4=;
 b=fQS/08JMInotZ23zZWrpoEDF9aor1bPjZXmZvP42O8o/PM2LV6ayC/dhDRXENUYbkT
 sjjKU1D5pKdxBrg1sa9H6HpHfElPkgeHwPI7aQj4mPNLJPgHoKwEW3QSHmkIclv8hCI9
 iZmYZq4Q5sXLiEdjA8vB/xCj/aygK50QmcBMGKtw6yATWSqorS1uRs5suuUlxSI3cg1U
 wVBR4OIqIi/XsDOlr6p423laEuaibmrs6KRE6Fm5oGUkeyWE2aYOmMnOi4tfGw+ZMc0t
 6LhuJPoBpNwHP2Yn8w7gmwKah2bBLGeK5+jp7aA0vinZR/mfNonApKm2ECps42oMPKZZ
 DzgA==
X-Gm-Message-State: APjAAAVUQpkxqT/334qVwe6eIa828A75D6HDK1NakyzYSi6K8SAyLCIZ
 lDYn4JkCxr6V5+801CmskUrywQ==
X-Google-Smtp-Source: APXvYqw+RO+3r3ERkAwjf7srHFowTzlGufzo7f3TxdyM1xPlqBeLMXvT7/VxzCmqiHDs/lS6slxw5Q==
X-Received: by 2002:a17:906:318e:: with SMTP id
 14mr16544480ejy.85.1561108200646; 
 Fri, 21 Jun 2019 02:10:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y42sm633224ede.86.2019.06.21.02.09.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 02:09:59 -0700 (PDT)
Date: Fri, 21 Jun 2019 11:09:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190621090953.GZ12905@phenom.ffwll.local>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PyedRPmpprwXb6dbdI/v7rjqMxJ7wsSTyQ3G8WcrcB4=;
 b=IgXzIAuwWMB1k0tpWfCE39E0ESxeyexDoFIB/DsKCDEbtrZCob0iZVOLvhFq9a7gtn
 Efi8xKjgH/uT+IaELLlpR+Z03vPzJVtpPxYhqsiZW+Brs7LF05XYTqpxB2jBJb/uOHgS
 3rEGMIQKgoWbma4fNPuH35izvc7HvWj6mFutA=
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
Cc: David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDc6MTI6MTRBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMjAuMDYuMTkgdW0gMTg6MzAgc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4g
PiBPbiAyMDE5LzA2LzE0LCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPiA+PiBBbSAxNC4wNi4x
OSB1bSAxNzo1MyBzY2hyaWViIEVtaWwgVmVsaWtvdjoKPiA+Pj4gT24gMjAxOS8wNi8xNCwgS29l
bmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gPj4+PiBBbSAxNC4wNi4xOSB1bSAxNDowOSBzY2hyaWVi
IEVtaWwgVmVsaWtvdjoKPiA+Pj4+PiBPbiAyMDE5LzA1LzI3LCBFbWlsIFZlbGlrb3Ygd3JvdGU6
Cj4gPj4+Pj4gW1NOSVBdCj4gPj4+Pj4gSGkgQ2hyaXN0aWFuLAo+ID4+Pj4+Cj4gPj4+Pj4KPiA+
Pj4+PiBJbiB0aGUgZm9sbG93aW5nLCBJIHdvdWxkIGxpa2UgdG8gc3VtbWFyaXNlIGFuZCBlbXBo
YXNpemUgdGhlIG5lZWQgZm9yCj4gPj4+Pj4gRFJNX0FVVEggcmVtb3ZhbC4gSSB3b3VsZCBraW5k
bHkgYXNrIHlvdSB0byBzcGVuZCBhIGNvdXBsZSBvZiBtaW51dGVzCj4gPj4+Pj4gZXh0cmEgcmVh
ZGluZyBpdC4KPiA+Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4gVG9kYXkgRFJNIGRyaXZlcnMqIGRvIG5v
dCBtYWtlIGFueSBkaXN0aW5jdGlvbiBiZXR3ZWVuIHByaW1hcnkgYW5kCj4gPj4+Pj4gcmVuZGVy
IG5vZGUgY2xpZW50cy4KPiA+Pj4+IFRoYXQgaXMgYWN0dWFsbHkgbm90IDEwMCUgY29ycmVjdC4g
V2UgaGF2ZSBhIHNwZWNpYWwgY2FzZSB3aGVyZSBhIERSTQo+ID4+Pj4gbWFzdGVyIGlzIGFsbG93
ZWQgdG8gY2hhbmdlIHRoZSBwcmlvcml0eSBvZiByZW5kZXIgbm9kZSBjbGllbnRzLgo+ID4+Pj4K
PiA+Pj4gQ2FuIHlvdSBwcm92aWRlIGEgbGluaz8gSSBjYW5ub3QgZmluZCB0aGF0IGNvZGUuCj4g
Pj4gU2VlIGFtZGdwdV9zY2hlZF9pb2N0bCgpLgo+ID4+Cj4gPj4+Pj4gVGh1cyBmb3IgYSByZW5k
ZXIgY2FwYWJsZSBkcml2ZXIsIGFueSBwcmVtaXNlIG9mCj4gPj4+Pj4gc2VwYXJhdGlvbiwgc2Vj
dXJpdHkgb3Igb3RoZXJ3aXNlIGltcG9zZWQgdmlhIERSTV9BVVRIIGlzIGEgZmFsbGFjeS4KPiA+
Pj4+IFllYWgsIHRoYXQncyB3aGF0IEkgYWdyZWUgb24uIEkganVzdCBkb24ndCB0aGluayB0aGF0
IHJlbW92aW5nIERSTV9BVVRICj4gPj4+PiBub3cgaXMgdGhlIHJpZ2h0IGRpcmVjdGlvbiB0byB0
YWtlLgo+ID4+Pj4KPiA+Pj4gQ291bGQgaGF2ZSBiZWVuIGNsZWFyZXIgLSBJJ20gdGFsa2luZyBh
Ym91dCBEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cKPiA+Pj4gaW9jdGxzLgo+ID4+Pgo+ID4+
PiBUaGF0IGFzaWRlLCBjYW4geW91IHByb3Bvc2UgYW4gYWx0ZXJuYXRpdmUgc29sdXRpb24gdGhh
dCBhZGRyZXNzZXMgdGhpcwo+ID4+PiBhbmQgdGhlIHNlY29uZCBwb2ludCBqdXN0IGJlbG93Pwo+
ID4+IEdpdmUgbWUgYSBmZXcgZGF5cyB0byB3b3JrIG9uIHRoaXMsIGl0J3MgYWxyZWFkeSBGcmlk
YXkgNnBtIGhlcmUuCj4gPj4KPiA+IEhpIENocmlzdGlhbiwKPiA+Cj4gPiBBbnkgcHJvZ3Jlc3M/
IEFzIG1lbnRpb25lZCBlYXJsaWVyLCBJJ20gT0sgd2l0aCB3cml0aW5nIHRoZSBwYXRjaGVzIGFs
dGhvdWdoCj4gPiBJIHdvdWxkIGxvdmUgdG8gaGVhciB5b3VyIHBsYW4uCj4gCj4gRmlyc3Qgb2Yg
YWxsIEkgdHJpZWQgdG8gZGlzYWJsZSBEUk0gYXV0aGVudGljYXRpb24gY29tcGxldGVseSB3aXRo
IGEgCj4ga2VybmVsIGNvbmZpZyBvcHRpb24uIFN1cnByaXNpbmdseSB0aGF0IGFjdHVhbGx5IHdv
cmtzIG91dCBvZiB0aGUgYm94IGF0IAo+IGxlYXN0IG9uIHRoZSBBTURHUFUgc3RhY2suCj4gCj4g
VGhpcyBlZmZlY3RpdmVseSBhbGxvd3MgdXMgdG8gZ2V0IHJpZCBvZiBEUkkyIGFuZCB0aGUgcmVs
YXRlZCBzZWN1cml0eSAKPiBwcm9ibGVtcy4gT25seSB0aGluZyBsZWZ0IGZvciB0aGF0IGlzIHRo
YXQgSSdtIGp1c3Qgbm90IHN1cmUgaG93IHRvIAo+IHNpZ25hbCB0aGlzIHRvIHVzZXJzcGFjZSBz
byB0aGF0IHRoZSBERFggd291bGRuJ3QgYWR2ZXJ0aXNlIERSSTIgYXQgYWxsIAo+IGFueSBtb3Jl
Lgo+IAo+IAo+IEFzIGEgbmV4dCBzdGVwIEkgbG9va2VkIGludG8gaWYgd2UgY2FuIGRpc2FibGUg
dGhlIGNvbW1hbmQgc3VibWlzc2lvbiAKPiBmb3IgRFJNIG1hc3Rlci4gVHVybmVkIG91dCB0aGF0
IHRoaXMgaXMgcmVsYXRpdmVseSBlYXN5IGFzIHdlbGwuCj4gCj4gQWxsIHdlIGhhdmUgdG8gZG8g
aXMgdG8gZml4IHRoZSBidWcgTWljaGVsIHBvaW50ZWQgb3V0IGFib3V0IEtNUyBoYW5kbGVzIAo+
IGZvciBkaXNwbGF5IGFuZCBsZXQgdGhlIEREWCB1c2UgYSByZW5kZXIgbm9kZSBpbnN0ZWFkIG9m
IHRoZSBEUk0gbWFzdGVyIAo+IGZvciBHbGFtb3IuIFN0aWxsIG5lZWQgdG8gc3luYyB1cCB3aXRo
IE1pY2hlbCBhbmQvb3IgTWFyZWsgd2hhdHMgdGhlIAo+IGJlc3Qgd2F5IG9mIGRvaW5nIHRoaXMu
Cj4gCj4gCj4gVGhlIGxhc3Qgc3RlcCAoYW5kIHRoYXQncyB3aGF0IEkgaGF2ZW4ndCB0cmllZCB5
ZXQpIHdvdWxkIGJlIHRvIGRpc2FibGUgCj4gRFJNIGF1dGhlbnRpY2F0aW9uIGZvciBOYXZpIGV2
ZW4gd2hlbiBpdCBpcyBzdGlsbCBjb21waWxlZCBpbnRvIHRoZSAKPiBrZXJuZWwuIEJ1dCB0aGF0
IGlzIG1vcmUgb3IgbGVzcyBqdXN0IGEgdHlwaW5nIGV4ZXJjaXNlLgoKU28ganVzdCB0byBnZXQg
dGhpcyBzdHJhaWdodCwgd2UncmUgbm93IGZ1bGwgb24gZW1icmFjaW5nIGEgc3Vic3lzdGVtCnNw
bGl0IGhlcmU6Ci0gYW1kZ3B1IHBsYW5zIHRvIGRpdGNoIGRyaTIvcmVuZGVyaW5nIG9uIHByaW1h
cnkgbm9kZXMKLSBidW5jaCBvZiBkcml2ZXJzIChJIHRoaW5rIG1vcmUgdGhhbiBpOTE1IGJ5IG5v
dykgbWVyZ2VkIHRoZSBEUk1fQVVUSAogIHJlbW92YWwKLSBvdGhlcnMgYXJlIGp1c3QgaGFuZ2lu
ZyBpbiB0aGVyZSBzb21laG93CgoiYmVzdCBvZiBib3RoXlcgd29ybGRzIiBmdHc/Ci1EYW5pZWwK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
