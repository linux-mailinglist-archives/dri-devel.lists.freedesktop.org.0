Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F342B47E
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B498D89994;
	Mon, 27 May 2019 12:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B4789994;
 Mon, 27 May 2019 12:11:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d18so16711447wrs.5;
 Mon, 27 May 2019 05:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=U85gtuKEsPf2IgIImaQzhsBvJ2CPnfFClfgG6ixiyC8=;
 b=MSA6CxHJYNk1PmUDQ4MHMot0C6g6Mj/mnEw6hpk6e/hZcuBFYEhVn86Nb1RaJ8wrDK
 kE8eemE99kpkhOCQEux6wyGBQcqTmduw0joKx6R+sb6O6rmIj7DS2Kr9URUjDb4CtRBu
 mTeCYfyS28RDQC1Vd2KktnwqWMCctxEKTBQUvvvvN9ZCV/rCz7WrCREXlg+QhPuHkExS
 i0HRtUwAj7dqTNgzinuvSYJztyILaNoatThq0fZRlZkxcN7ZVIrlW2VMy2Bs7x4jzxXh
 x6a3kBker7TFpWgxLQ/Maga3Qggp81PD33g8l05vbZJJ2yZbXPhztVzhujyj64/vcUjY
 Celw==
X-Gm-Message-State: APjAAAXDAUwC5FyUjBmhwQU2jtZtEblG7TNdpVYyv9YUTOWd+u3zqMH5
 K8pqxb3vMmtaKJ+74SX4ZmdaCScV
X-Google-Smtp-Source: APXvYqwxpBZM0nsppLu6h2NTsRvvYGuOnWWcEIaMD9n16dBDOJl3qqoDGuxeqVwv7pDjU7WekSdTRQ==
X-Received: by 2002:adf:8bc5:: with SMTP id w5mr32063696wra.132.1558959100839; 
 Mon, 27 May 2019 05:11:40 -0700 (PDT)
Received: from arch-x1c3 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net.
 [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s62sm21998134wmf.24.2019.05.27.05.11.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 27 May 2019 05:11:40 -0700 (PDT)
Date: Mon, 27 May 2019 13:10:15 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: christian.koenig@amd.com
Subject: Re: [PATCH 13/13] drm: allow render capable master with DRM_AUTH
 ioctls
Message-ID: <20190527121015.GC15067@arch-x1c3>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190527081741.14235-13-emil.l.velikov@gmail.com>
 <fe26eded-51b0-9b8f-47c6-22cff6383c60@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe26eded-51b0-9b8f-47c6-22cff6383c60@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=U85gtuKEsPf2IgIImaQzhsBvJ2CPnfFClfgG6ixiyC8=;
 b=Ktvyr0v/5gJYEDchTRSUUufG2DNKcDM0xBzj3B1zFcR2bkSeNSqqKl9cbz1UaU4Nui
 W9A7yPTGWlinPV3K08z1KZjn1fY2GsvVSdCgUeod2VxG9oUXX0XKcH30aUfr3qrdCj1R
 i4szwGy952E6t6v6rkm+k7Px5PwO4ryujXENlda5XDibwvp+detSST1gL/3jsKMJQW+z
 l4QfMFGKVR2BFDrs5YycnHhKV1FOTzwQn0p/ifisNczppdh+IDuJbRTduscB17eFix7Z
 c9TwOpgqk0U6IqLCg52QO/QOXUhR8r2JilMR+KpHmCsw77mikf/sSklI84pl9YPjdlzO
 O8gA==
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yNywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAyNy4wNS4xOSB1bSAx
MDoxNyBzY2hyaWViIEVtaWwgVmVsaWtvdjoKPiA+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52
ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPiAKPiA+IFRoZXJlIGFyZSBjYXNlcyAoaW4gbWVzYSBh
bmQgYXBwbGljYXRpb25zKSB3aGVyZSBvbmUgd291bGQgb3BlbiB0aGUKPiA+IHByaW1hcnkgbm9k
ZSB3aXRob3V0IHByb3Blcmx5IGF1dGhlbnRpY2F0aW5nIHRoZSBjbGllbnQuCj4gPiAKPiA+IFNv
bWV0aW1lcyB3ZSBkb24ndCBjaGVjayBpZiB0aGUgYXV0aGVudGljYXRpb24gc3VjY2VlZHMsIGJ1
dCB0aGVyZSdzCj4gPiBhbHNvIGNhc2VzIHdlIHNpbXBseSBmb3JnZXQgdG8gZG8gaXQuCj4gPiAK
PiA+IFRoZSBmb3JtZXIgd2FzIGEgY2FzZSBmb3IgTWVzYSB3aGVyZSBpdCBkaWQgbm90IG5vdCBj
aGVjayB0aGUgcmV0dXJuCj4gPiB2YWx1ZSBvZiBkcm1HZXRNYWdpYygpIFsxXS4gVGhhdCB3YXMg
Zml4ZWQgcmVjZW50bHkgYWx0aG91Z2gsIHRoZXJlJ3MKPiA+IHRoZSBxdWVzdGlvbiBvZiBvbGRl
ciBkcml2ZXJzIG9yIG90aGVyIGFwcHMgdGhhdCBleGJpYml0IHRoaXMgYmVoYXZpb3VyLgo+ID4g
Cj4gPiBXaGlsZSBvbWl0dGluZyB0aGUgY2FsbCByZXN1bHRzIGluIGlzc3VlcyBhcyBzZWVuIGlu
IFsyXSBhbmQgWzNdLgo+ID4gCj4gPiBJbiB0aGUgbGlidmEgY2FzZSwgbGlidmEgaXRzZWxmIGRv
ZXNuJ3QgYXV0aGVudGljYXRlIHRoZSBEUk0gY2xpZW50IGFuZAo+ID4gdGhlIHZhR2V0RGlzcGxh
eURSTSBkb2N1bWVudGF0aW9uIGRvZXNuJ3QgbWVudGlvbiBpZiB0aGUgYXBwIHNob3VsZAo+ID4g
ZWl0aGVyLgo+ID4gCj4gPiBBcyBvZiB0b2RheSwgdGhlIG9mZmljaWFsIHZhaW5mbyB1dGlsaXR5
IGRvZXNuJ3QgYXV0aGVudGljYXRlLgo+ID4gCj4gPiBUbyB3b3JrYXJvdW5kIGlzc3VlcyBsaWtl
IHRoZXNlLCBzb21lIHVzZXJzIHJlc29ydCB0byBydW5uaW5nIHRoZWlyIGFwcHMKPiA+IHVuZGVy
IHN1ZG8uIFdoaWNoIGFkbWl0dGVkbHkgaXNuJ3QgYWx3YXlzIGEgZ29vZCBpZGVhLgo+ID4gCj4g
PiBTaW5jZSBhbnkgRFJJVkVSX1JFTkRFUiBkcml2ZXIgaGFzIHN1ZmZpY2llbnQgaXNvbGF0aW9u
IGJldHdlZW4gY2xpZW50cywKPiA+IHdlIGNhbiB1c2UgdGhhdCwgZm9yIHVuYXV0aGVudGljYXRl
ZCBbcHJpbWFyeSBub2RlXSBpb2N0bHMgdGhhdCByZXF1aXJlCj4gPiBEUk1fQVVUSC4gQnV0IG9u
bHkgaWYgdGhlIHJlc3BlY3RpdmUgaW9jdGwgaXMgdGFnZ2VkIGFzIERSTV9SRU5ERVJfQUxMT1cu
Cj4gPiAKPiA+IHYyOgo+ID4gLSBSZXdvcmsvc2ltcGxpZnkgaWYgY2hlY2sgKERhbmllbCBWKQo+
ID4gLSBBZGQgZXhhbXBsZXMgdG8gY29tbWl0IG1lc3NhZ2VzLCBlbGFib3JhdGUuIChEYW5pZWwg
VikKPiA+IAo+ID4gdjM6Cj4gPiAtIFVzZSBzaW5nbGUgdW5saWtlbHkgKERhbmllbCBWKQo+ID4g
Cj4gPiB2NDoKPiA+IC0gUGF0Y2ggd2FzIHJldmVydGVkIGJlY2F1c2UgaXQgYnJva2UgQU1ER1BV
LCBhcHBseSBhZ2Fpbi4gVGhlIEFNREdQVQo+ID4gaXNzdWUgaXMgZml4ZWQgd2l0aCBlYXJsaWVy
IHBhdGNoLgo+IAo+IEFzIGZhciBhcyBJIGNhbiBzZWUgdGhpcyBvbmx5IGFmZmVjdHMgdGhlIGZv
bGxvd2luZyB0d28gSU9DVExzIGFmdGVyCj4gcmVtb3ZpbmcgRFJNX0FVVEggZnJvbSB0aGUgRFJN
X1JFTkRFUl9BTExPVyBJT0NUTHM6Cj4gPiBEUk1fSU9DVExfREVGKERSTV9JT0NUTF9QUklNRV9I
QU5ETEVfVE9fRkQsCj4gPiBkcm1fcHJpbWVfaGFuZGxlX3RvX2ZkX2lvY3RsLCBEUk1fQVVUSHxE
Uk1fVU5MT0NLRUR8RFJNX1JFTkRFUl9BTExPVyksCj4gPiDCoMKgwqDCoMKgwqDCoCBEUk1fSU9D
VExfREVGKERSTV9JT0NUTF9QUklNRV9GRF9UT19IQU5ETEUsCj4gPiBkcm1fcHJpbWVfZmRfdG9f
aGFuZGxlX2lvY3RsLCBEUk1fQVVUSHxEUk1fVU5MT0NLRUR8RFJNX1JFTkRFUl9BTExPVykKPiAK
PiBTbyBJIHRoaW5rIGl0IHdvdWxkIGJlIHNpbXBsZXIgdG8ganVzdCByZW1vdmUgRFJNX0FVVEgg
ZnJvbSB0aG9zZSB0d28KPiBpbnN0ZWFkIG9mIGFsbG93aW5nIGl0IGZvciBldmVyeWJvZHkuCj4g
CklmIEkgdW5kZXJzdGFuZCB5b3UgY29ycmVjdGx5IHRoaXMgd2lsbCByZW1vdmUgRFJNX0FVVEgg
YWxzbyBmb3IgZHJpdmVycwp3aGljaCBleHBvc2Ugb25seSBhIHByaW1hcnkgbm9kZS4gSSdtIG5v
dCBzdXJlIGlmIHRoYXQgaXMgYSBnb29kIGlkZWEuCgpUaGF0IHNhaWQsIGlmIG90aGVycyBhcmUg
T0sgd2l0aCB0aGUgaWRlYSBJIHdpbGwgcHJlcGFyZSBhIHBhdGNoLgoKVGhhbmtzCkVtaWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
