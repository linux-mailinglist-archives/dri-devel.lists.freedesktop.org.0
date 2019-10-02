Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C2C9378
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 23:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B156489852;
	Wed,  2 Oct 2019 21:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5118689852;
 Wed,  2 Oct 2019 21:24:52 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y19so621154wrd.3;
 Wed, 02 Oct 2019 14:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A8w+FHe5743TtHJppD6AZXCm6HeNHuSZ/rMyNlKuO+I=;
 b=ifUWx0RJDIyYXW4FS8xu4Nvw2Ho4zD0xifBrvrbhneE3+jOyE/JxAwFI9zEjDeR2CG
 +XtYfm+1SBl8OspTMKdkNxEhi5Zf58lS3SglZv7UxWp1HP8DEog+/R8JpGcbbNm+phdq
 8gAE4hgfhERAsdSX9APoxLkW8vT22gxOHyXwjMx0/vJLvPXBXORLPK9kCpesdvYj0mV2
 qJ488GCZaRHesdvVwCm/tYiM3pNug7KKU0mFnRqr97xGeRa5UhP2TO0YnNMA5/IDYfDc
 Tr03pZKJ3QOfgjBYA/CL4pXurewsNMgnCu1bT4MT/KbyUGrAJsBX5Sd2xPMkQWAI0qUg
 v0qg==
X-Gm-Message-State: APjAAAWTgIxnX+4NlXvbhIEJd+5EuXQ0icDysbM8UVqGew1xh5MVrsXx
 hbmWh3y99FmmNmChB4BeJ5nePIpwqRITwNFdvSw=
X-Google-Smtp-Source: APXvYqwURm4pH78jPsrdQn+DZphGzmWgFOKtmQM5jeQCxCirfuJH7g/TlbaJQvO4fBWtdxeyzi7PwrH5nXwp/CAl4z8=
X-Received: by 2002:adf:f287:: with SMTP id k7mr4526852wro.206.1570051490794; 
 Wed, 02 Oct 2019 14:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120136.1777161-1-arnd@arndb.de>
 <20191002120136.1777161-5-arnd@arndb.de>
 <CAKwvOdmjM80XP7VH83iLn=8mz6W1+SbXST2FChEnH0LSRRm4pA@mail.gmail.com>
In-Reply-To: <CAKwvOdmjM80XP7VH83iLn=8mz6W1+SbXST2FChEnH0LSRRm4pA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Oct 2019 17:24:37 -0400
Message-ID: <CADnq5_MyUp9OkqM+MUHZ8BpLEe5afBpAqOwQxDwAWgvVvqbpoQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/amd/display: fix dcn21 Makefile for clang
To: Nick Desaulniers <ndesaulniers@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=A8w+FHe5743TtHJppD6AZXCm6HeNHuSZ/rMyNlKuO+I=;
 b=CWOsCp6RJXD5p63VAhR0/e8P4e16fm4w7VS+yzJkkbFkXb9HUBLq8eKopcqtC/YkfD
 sK6T9bTA7ZspZkR0XtuaCl9J2wpBdNcZZN9Wg8q9zGQK05aWY0+DmNZo9B5a4QVFV10g
 nbcBIOgOILYKWpb8umu36AazgoOTJSizgvatsXd+OvlCSU1ZjKDLtGYEZTU3czzmYMlH
 OtfNImw1iJK3z9mGecbMdqC+5eEyqIEIk7HZkzxwUK+kquDfBXhE2eNI6KAvJibVjNMz
 4DH4lZYz7TkY3NwARn61gA+Xj7IA7lu3j80mntK1f9iYThbSyfezx8GEy6mxNbvfqnBt
 5evg==
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
Cc: Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCA1OjE5IFBNIE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxu
aWVyc0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDIsIDIwMTkgYXQgNTowMyBB
TSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPiA+Cj4gPiBKdXN0IGxpa2Ug
YWxsIHRoZSBvdGhlciB2YXJpYW50cywgdGhpcyBvbmUgcGFzc2VzIGludmFsaWQKPiA+IGNvbXBp
bGUtdGltZSBvcHRpb25zIHdpdGggY2xhbmcgYWZ0ZXIgdGhlIG5ldyBjb2RlIGdvdAo+ID4gbWVy
Z2VkOgo+ID4KPiA+IGNsYW5nOiBlcnJvcjogdW5rbm93biBhcmd1bWVudDogJy1tcHJlZmVycmVk
LXN0YWNrLWJvdW5kYXJ5PTQnCj4gPiBzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI2NTogcmVjaXBl
IGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNu
MjEvZGNuMjFfcmVzb3VyY2UubycgZmFpbGVkCj4gPgo+ID4gVXNlIHRoZSBzYW1lIHZhcmlhbnQg
dGhhdCB3ZSBoYXZlIGZvciBkY24yMCB0byBmaXggY29tcGlsYXRpb24uCj4gPgo+ID4gRml4ZXM6
IGVjZWQ1MWY5YmFiYiAoImRybS9hbWQvZGlzcGxheTogQWRkIGh1YnAgYmxvY2sgZm9yIFJlbm9p
ciAodjIpIikKPiA+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
Cj4KPiBUaGFua3MgZm9yIHRoZSBwYXRjaCEKPiBSZXZpZXdlZC1ieTogTmljayBEZXNhdWxuaWVy
cyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+Cj4gVGVzdGVkLWJ5OiBOaWNrIERlc2F1bG5pZXJz
IDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4KPiAoVGhvdWdoIEkgdGhpbmsgaXQncyBhbHJlYWR5
IGJlZW4gbWVyZ2VkKQo+Cj4gQWxleCwgZG8geW91IGtub3cgd2h5IHRoZSBBTURHUFUgZHJpdmVy
IHVzZXMgYSBkaWZmZXJlbnQgc3RhY2sKPiBhbGlnbm1lbnQgKDE2QikgdGhhbiB0aGUgcmVzdCBv
ZiB0aGUgeDg2IGtlcm5lbD8gIChzZWUKPiBhcmNoL3g4Ni9NYWtlZmlsZSB3aGljaCB1c2VzIDhC
IHN0YWNrIGFsaWdubWVudCkuCgpOb3Qgc3VyZS4gIE1heWJlIEhhcnJ5IGNhbiBjb21tZW50LiAg
SSB0aGluayBpdCB3YXMgYWRkZWQgZm9yIHRoZQpmbG9hdGluZyBwb2ludCBzdHVmZi4gIE5vdCBz
dXJlIGlmIGl0J3Mgc3RyaWN0bHkgcmVxdWlyZWQgb3Igbm90LgoKQWxleAoKPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL01ha2VmaWxlIHwgMTIgKysr
KysrKysrKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIxL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL01h
a2VmaWxlCj4gPiBpbmRleCA4Y2Q5ZGU4YjFhN2EuLmVmNjczYmZmYzI0MSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9NYWtlZmlsZQo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL01ha2VmaWxlCj4gPiBAQCAt
Myw3ICszLDE3IEBACj4gPgo+ID4gIERDTjIxID0gZGNuMjFfaHVicC5vIGRjbjIxX2h1YmJ1Yi5v
IGRjbjIxX3Jlc291cmNlLm8KPiA+Cj4gPiAtQ0ZMQUdTXyQoQU1EREFMUEFUSCkvZGMvZGNuMjEv
ZGNuMjFfcmVzb3VyY2UubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgLW1wcmVmZXJyZWQtc3RhY2st
Ym91bmRhcnk9NAo+ID4gK2lmbmVxICgkKGNhbGwgY2Mtb3B0aW9uLCAtbXByZWZlcnJlZC1zdGFj
ay1ib3VuZGFyeT00KSwpCj4gPiArICAgICAgIGNjX3N0YWNrX2FsaWduIDo9IC1tcHJlZmVycmVk
LXN0YWNrLWJvdW5kYXJ5PTQKPiA+ICtlbHNlIGlmbmVxICgkKGNhbGwgY2Mtb3B0aW9uLCAtbXN0
YWNrLWFsaWdubWVudD0xNiksKQo+ID4gKyAgICAgICBjY19zdGFja19hbGlnbiA6PSAtbXN0YWNr
LWFsaWdubWVudD0xNgo+ID4gK2VuZGlmCj4gPiArCj4gPiArQ0ZMQUdTXyQoQU1EREFMUEFUSCkv
ZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgJChjY19zdGFj
a19hbGlnbikKPiA+ICsKPiA+ICtpZmRlZiBDT05GSUdfQ0NfSVNfQ0xBTkcKPiA+ICtDRkxBR1Nf
JChBTUREQUxQQVRIKS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5vICs9IC1tc3NlMgo+ID4gK2Vu
ZGlmCj4gPgo+ID4gIEFNRF9EQUxfRENOMjEgPSAkKGFkZHByZWZpeCAkKEFNRERBTFBBVEgpL2Rj
L2RjbjIxLywkKERDTjIxKSkKPiA+Cj4gPiAtLQo+ID4gMi4yMC4wCj4gPgo+ID4gLS0KPiA+IFlv
dSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhl
IEdvb2dsZSBHcm91cHMgIkNsYW5nIEJ1aWx0IExpbnV4IiBncm91cC4KPiA+IFRvIHVuc3Vic2Ny
aWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNl
bmQgYW4gZW1haWwgdG8gY2xhbmctYnVpbHQtbGludXgrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBz
LmNvbS4KPiA+IFRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6
Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2NsYW5nLWJ1aWx0LWxpbnV4LzIwMTkxMDAyMTIw
MTM2LjE3NzcxNjEtNS1hcm5kJTQwYXJuZGIuZGUuCj4KPgo+Cj4gLS0KPiBUaGFua3MsCj4gfk5p
Y2sgRGVzYXVsbmllcnMKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
