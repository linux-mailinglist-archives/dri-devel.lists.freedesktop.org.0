Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3E072DD6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 13:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294E36E4B7;
	Wed, 24 Jul 2019 11:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAFD6E4B7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:41:19 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id s49so12007832edb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 04:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=0qy1oCVonWDw3jFis98oNPvxEKXpIEOPhrRBVnSxhkI=;
 b=fTc28ru1xcJUBpdnjmmuyBRC4vikp4GYu8qhPXqQY0rV95dMWtsEatWANJdrKAEfqF
 6XCP7lEKvCi67CDOl2rfiBVLdTNLrjfTzIUBd/YtgMC7eWsST/PYGlw/grOIJM62V4OU
 iPRAaTNBYzX8wiENP7SCRx7M88/+h0ExsZJpyyklG9QcVxoUDCLYpWTo5x+nVA082l4w
 a7FcDd5Dr5uEn/EinAynk70Qf1X5cxf+8NuHLZYHqWJi1SL0bmtVGVl27OE9+jLd68P1
 nFzoj5AjQV+8NL9z6eSIoudoDTrrVIQIlA6u53K2LKZ40MW6lnJsmrKW5YonKXOSWUg8
 KHFg==
X-Gm-Message-State: APjAAAWiN8OsaZxq548vu0cpH1wT2y6BnI24HSOkedLQBf4sBgwhTwGC
 0/+CfbBvGJkx8u12IYBckbgnhIWBP74=
X-Google-Smtp-Source: APXvYqxUcWr477A+4RR3lTUZDO1+qnLnbS6ckD64HdB1l5ldVl7uCSQhj0RBJrw4+goBo8BJjk8g+w==
X-Received: by 2002:a17:907:217c:: with SMTP id
 rl28mr62328081ejb.131.1563968477883; 
 Wed, 24 Jul 2019 04:41:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id o21sm12282528edt.26.2019.07.24.04.41.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 04:41:16 -0700 (PDT)
Date: Wed, 24 Jul 2019 13:41:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 0/6] drm/tinydrm: Move mipi_dbi
Message-ID: <20190724114114.GX15868@phenom.ffwll.local>
References: <20190720134709.15186-1-noralf@tronnes.org>
 <877e8aeyg8.fsf@anholt.net>
 <20190723071037.GS15868@phenom.ffwll.local>
 <7de2c39b-20b6-b735-405c-bf89f58c2736@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7de2c39b-20b6-b735-405c-bf89f58c2736@tronnes.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=0qy1oCVonWDw3jFis98oNPvxEKXpIEOPhrRBVnSxhkI=;
 b=fEI9lj7uDEZN74GD3D07fe4rdL2VaO44UXDaxuzNfAeGcfhhHgkkBIwKK8eS6rxPwZ
 mxIXT9gDQXjwu353jIUgrVUIbixZUPreIUhmb2Vl0lUMpwZIZxkwpBCnQNj7mDd7Kl6M
 tIikTOAD5WrEx1ED4vjESImKmSm5Tsbvzmr5Y=
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
Cc: dri-devel@lists.freedesktop.org, david@lechnology.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDM6NDE6MTFQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IERlbiAyMy4wNy4yMDE5IDA5LjEwLCBza3JldiBEYW5pZWwgVmV0dGVyOgo+ID4g
T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMTE6MDY6MTVBTSAtMDcwMCwgRXJpYyBBbmhvbHQgd3Jv
dGU6Cj4gPj4gTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+IHdyaXRlczoKPiA+
Pgo+ID4+PiBUaGlzIHNlcmllcyB0aWNrcyBvZmYgdGhlIGxhc3QgdGlueWRybSB0b2RvIGVudHJ5
IGFuZCBtb3ZlcyBvdXQgbWlwaV9kYmkKPiA+Pj4gdG8gYmUgYSBjb3JlIGhlbHBlci4KPiA+Pj4K
PiA+Pj4gSXQgc3BsaXRzIHN0cnVjdCBtaXBpX2RiaSBpbnRvIGFuIGludGVyZmFjZSBwYXJ0IGFu
ZCBhIGRpc3BsYXkgcGlwZWxpbmUKPiA+Pj4gcGFydCAodXBsb2FkIGZyYW1lYnVmZmVyIG92ZXIg
U1BJKS4gSSBhbHNvIHRvb2sgdGhlIG9wcG9ydHVuaXR5IHRvCj4gPj4+IHJlbmFtZSB0aGUgYW1i
aWd1b3VzICdtaXBpJyB2YXJpYWJsZSBuYW1lIHRvICdkYmknLiBUaGlzIGxpbmVzIHVwIHdpdGgK
PiA+Pj4gdGhlIHVzZSBvZiB0aGUgJ2RzaScgdmFyaWFibGUgbmFtZSBpbiB0aGUgTUlQSSBEU0kg
aGVscGVyLgo+ID4+Pgo+ID4+PiBOb3RlOgo+ID4+PiBUaGlzIGRlcGVuZHMgb24gc2VyaWVzOiBk
cm0vdGlueWRybTogUmVtb3ZlIHRpbnlkcm0ua28KPiA+Pj4KPiA+Pj4gU2VyaWVzIGlzIGFsc28g
YXZhaWxhYmxlIGhlcmU6Cj4gPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9ub3Ryby9saW51eC90cmVl
L21vdmVfbWlwaV9kYmkKPiA+Pgo+ID4+IENvbmdyYXR1bGF0aW9ucyBvbiBtYWtpbmcgaXQgdG8g
dGhpcyBzdGFnZS4gIFRoaXMgbG9va3MgbGlrZSBhIGZpbmUKPiA+PiBjb25jbHVzaW9uIHRvIHRp
bnlkcm0uCj4gPj4KPiA+PiBBY2tlZC1ieTogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4K
PiA+IAo+ID4gWWVhaCBsZXQgbWUgaGVhcCBvbiB0aGUgY29uZ3JhdHMgdG9vLCB0aGlzIGhhcyBi
ZW4gYSBsb25nIGJ1dCByZWFsbHkKPiA+IGltcHJlc3NpdmUgam91cm5leSB0byB3YXRjaCEKPiAK
PiBMb29raW5nIGJhY2sgaXQncyBzdXByaXNpbmcgdG8gbWUgdGhhdCBJIGNvbnRpbnVlZCB0byB3
b3JrIG9uIHRoaXMuCj4gQWZ0ZXIgTGludXMgdG9vayBhIGR1bXAgb24gdGlueWRybSBJIHdhc24n
dCBtdWNoIGludGVyZXN0ZWQgaW4gZG9pbmcgYW55Cj4gZnVydGhlciB3b3JrIG9uIExpbnV4LCB0
aGVyZSBhcmUgbG90cyBvZiBvdGhlciBpbnRlcmVzdGluZyBwcm9qZWN0cyB0bwo+IHdvcmsgb24u
IFRoZW4geW91IGNjJ2VkIG1lIG9uIGEgcGF0Y2ggdGVsbGluZyBtZSB0aGF0IHNvbWVvbmUgd2Fz
IHVzaW5nCj4gdGhlIHNpbXBsZSBkaXNwbGF5IGhlbHBlciBJIG1hZGUsIGFuZCBiZWZvcmUgSSBr
bmV3IGl0IEkgd2FzIGtuZWUgZGVlcAo+IGluIHJlZmFjdG9yaW5nIHdvcmsuCgpIaXN0b3JpY2Fs
IGFzaWRlOiBUaGF0IGR1bXAgZnJvbSBMaW51cyB3YXMgb25lIG9mIHRoZSByZWFzb25zIHdlIGZp
bmFsbHkKZGVjaWRlZCB0byBlbmFjdCBhIGNvZGUgb2YgY29uZHVjdCBhbmQgZW5mb3JjZSBpdCBh
Z2FpbnN0IGV2ZXJ5b25lLiBXZQpqdXN0IGNhbid0IGFmZm9yZCB0byBsb3NlIGdyZWF0IHBlb3Bs
ZSBqdXN0IGJlY2F1c2Ugc29tZSBiaWcgZ3VucyBoYXZlIGEKaGFyZCB0aW1lIGNvbnRyb2xsaW5n
IHRoZWlyIHRlbXBlci4gQXNpZGUgZnJvbSBpdCdzIGp1c3QgbmljZXIgdG8gd29yawp0b2dldGhl
ciB3aXRoIHNvbWUgcmVzcGVjdC4KCj4gT25lIGJpZyB0YWtlIGF3YXkgZm9yIG1lIGhhcyBiZWVu
IGhvdyBtdWNoIGJldHRlciBteSBjb2RlIGJlY29tZXMgYWZ0ZXIKPiBnb2luZyB0aHJvdWdoIGEg
cmV2aWV3IHByb2Nlc3MuIFNvbWUgdGltZXMsIGxvb2tpbmcgYmFjaywgSSB3b25kZXIgLSBkaWQK
PiBJIGFjdHVhbGx5IHdyaXRlIHRoYXQgbmljZSBwaWVjZSBvZiBjb2RlPyBBbmQgdGhlIHJlYWwg
YW5zd2VyIEkgZ3Vlc3MgaXMKPiB0aGF0IEkgZGlkIHRoZSB0eXBpbmcgYW5kIG9mdGVuIGhhZCB0
aGUgaWRlYSwgYnV0IG1hbnkgdGltZXMgdGhlIGZsZXNoZWQKPiBvdXQgc29sdXRpb24gd2FzIG5v
dCBzb21ldGhpbmcgdGhhdCBJIGNhbWUgdXAgd2l0aC4KCkZvciBtZSBncmVhdCByZXZpZXcgKGJv
dGggZm9yIGFzIHJldmlld2VyIGFuZCBhcyBhdXRob3IpIGlzIHdoZW4gZXZlcnlvbmUKbGVhcm5z
IHNvbWV0aGluZy4gUGVyc29uYWxseSBJIGRlZmluaXRlbHkgbGVhcm5lZCBhIGxvdCBmcm9tIGFs
bCB0aGUgc21hbGwKZHJpdmVyIHdvcmsgdGhhdCdzIGJlZW4gZ29pbmcgb24gdGhlIHBhc3QgZmV3
IHllYXJzIC0gY29tcGxldGVseSBkaWZmZXJlbnQKd29ybGQgY29tcGFyZWQgdG8gZHJpdmVycyBt
ZWFyc3VyZWQgaW4gMTAwa2xvYyB1bml0cyA6LSkKCkNoZWVycywgRGFuaWVsCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
