Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3FF6031E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 11:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C26E6E457;
	Fri,  5 Jul 2019 09:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054A66E456
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 09:17:51 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z1so4521776wru.13
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 02:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=2BQU5HuFnP0d3lWqGYGOW/ACfCMa9W62+56jmnDR2Ec=;
 b=kTcy4uVRWlxcr0/43eHc5D6mvx7T7G+HjzEY15By5Yj9ozSYbCAI8iblnxKcoBzddg
 MXAy8tebuAkPeZUHQunt+NQQkaC6oQMnN6QUl1U0Hx6okkUbZ6RMEmHAFiLj5UE5C9Kx
 dZbponUvky8OIYfidO1jK2lAASGFBbSz/0shNSm9EpVFMdj0i0XuO9qYBbKo0/gviaAr
 6q+s/pqMiXhUG5FVEtrSgB/waNNV1unKLQG1XKjKf9uE96ttgfiO3hSphZIcIVRxX1uh
 9nmt5qtnNBUfLuRxDHHsFal48BCSPzQFw01eOkbDK1KeD1bc9c6PZalPk8fHR11kH85y
 j8bQ==
X-Gm-Message-State: APjAAAXz8Dx2Bs0v38ersMZXZTebssxIdOYqCozDyzVGb1mQfQge69cS
 0YXaOB8YjWT2w527KZ+l0A4=
X-Google-Smtp-Source: APXvYqzavioS9vgKks058HUrVRwdqmGNg1XGLTOjPoHomuULXb8ErsyJjDdw1fpLiOCLyMjFKt3L6w==
X-Received: by 2002:a5d:430c:: with SMTP id h12mr3044901wrq.163.1562318269729; 
 Fri, 05 Jul 2019 02:17:49 -0700 (PDT)
Received: from Timur-XPS (catv-80-99-228-232.catv.broadband.hu.
 [80.99.228.232])
 by smtp.gmail.com with ESMTPSA id g8sm5483204wmf.17.2019.07.05.02.17.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 02:17:49 -0700 (PDT)
Message-ID: <e119b38bdb0859c3eb826af30487ac01278f59fd.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 05 Jul 2019 11:17:47 +0200
In-Reply-To: <eee4eea0-ad27-9d05-192d-c1207da5d0bc@daenzer.net>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
 <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
 <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
 <f986d6687e2b1f1fc8a93f86cbc8fd1ab971663a.camel@gmail.com>
 <d1dfe289-8501-8848-6324-c43d6e66a77f@daenzer.net>
 <4ee5439cb01e355436d618f5d6f2e109410dc35e.camel@gmail.com>
 <eee4eea0-ad27-9d05-192d-c1207da5d0bc@daenzer.net>
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Jul 2019 09:30:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=2BQU5HuFnP0d3lWqGYGOW/ACfCMa9W62+56jmnDR2Ec=;
 b=ui5Luk929E9iKJxglEa/ruEnaVrn3ZWjJWzACnAZ0SgZx/GwuujGDpWbg8Lpbbnu/V
 jSvkL3n4pDpD74XFMsHq/JkDlQ21ST2DyYD34EQC6SuliXuasSP0YCIZFMJYe1GGZG7x
 VB1yoCPFzcXQIapUAv383T4aKgZXF2dztdH9sJDrQ441HhKeLzn2lAeax75/XxrfJRKy
 UJRFB32PEzyr9V+3JihQ3+fsXpryv0uOR0SPKCG4+ZWxHbMvmpyNh552u6EwIyECHoqR
 pEkKDXxNgcGmm9dFgHD7GL0rGdKWgTK8ZVM6pjTSv1KQrdvBMqUUoFeR+cZX7Jks+P9U
 BePw==
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gPiBDYW4geW91IHBvaW50IG1lIHRvIHRoZSBwbGFjZSB3aGVyZSBhbWRncHUgZGVjaWRlcyB0
aGUgUENJZSBsaW5rCj4gPiBzcGVlZD8KPiA+IEknZCBsaWtlIHRvIHRyeSB0byB0d2VhayBpdCBh
IGxpdHRsZSBiaXQgdG8gc2VlIGlmIHRoYXQgaGVscHMgYXQKPiA+IGFsbC4KPiAKPiBJJ20gbm90
IHN1cmUgb2ZmaGFuZCwgQWxleCBvciBhbnlvbmU/CgpUaHVzIGZhciwgSSBzdGFydGVkIGJ5IGxv
b2tpbmcgYXQgaG93IHRoZSBwcF9kcG1fcGNpZSBzeXNmcyBpbnRlcmZhY2UKd29ya3MsIGFuZCBm
b3VuZCBzbXU3X2h3bWdyIHdoaWNoIHNlZW1zIHRvIGJlIHRoZSBvbmx5IGh3bWdyIHRoYXQKYWN0
dWFsbHkgb3V0cHV0cyBhbnl0aGluZyBvbiBQUF9QQ0lFOgpodHRwczovL2dpdGh1Yi5jb20vdG9y
dmFsZHMvbGludXgvYmxvYi9hMmQ2MzVkZWNiZmE5YzFlNGFlMTVjYjA1YjY4YjI1NTlmN2Y4Mjdj
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3IuYyNMNDQ2MgoK
SG93ZXZlciwgaXRzIG91dHB1dCBpcyBkZWZpbml0ZWx5IGluY29ycmVjdC4gSXQgdGVsbHMgbWUg
dGhhdCB0aGUKc3VwcG9ydGVkIFBDSWUgbW9kZXMgYXJlOgpjYXQgL3N5cy9jbGFzcy9kcm0vY2Fy
ZDEvZGV2aWNlL3BwX2RwbV9wY2llIAowOiAyLjVHVC9zLCB4OCAKMTogOC4wR1QvcywgeDE2CgpJ
dCBhbGxvd3MgbWUgdG8gY2hhbmdlIGJldHdlZW4gdGhlc2UgdHdvIG1vZGVzLCBidXQgdGhlIGNo
YW5nZSBkb2Vzbid0CnNlZW0gdG8gaGF2ZSBhbnkgYWN0dWFsIGVmZmVjdCBvbiB0aGUgdHJhbnNm
ZXIgc3BlZWRzLgoKTmVpdGhlciBvZiB0aG9zZSBtb2RlcyBhY3R1YWxseSBtYWtlcyBzZW5zZS4g
QW1kZ3B1IGRvZXNuJ3Qgc2VlbSB0byBiZQphd2FyZSBvZiB0aGUgZmFjdCB0aGF0IGl0IHJ1bnMg
b24gYSB4NCBsaW5rLiBJbiBmYWN0LCB0aGUKc211N19nZXRfY3VycmVudF9wY2llX2xhbmVfbnVt
YmVyIGZ1bmN0aW9uIGV2ZW4gaGFzIGFuIGFzc2VydGlvbjoKUFBfQVNTRVJUX1dJVEhfQ09ERSgo
NyA+PSBsaW5rX3dpZHRoKSwKCk9uIHRoZSBvdGhlciBoYW5kOgpjYXQgL3N5cy9jbGFzcy9kcm0v
Y2FyZDEvZGV2aWNlL2N1cnJlbnRfbGlua193aWR0aAo0CgpTbyBJIGRvbid0IHVuZGVyc3RhbmQg
aG93IGl0IGNhbiBldmVuIHdvcmsgd2l0aCBQQ0llIHg0LCB3aHkgZG9lc24ndAp0aGF0IGFzc2Vy
dGlvbiBnZXQgdHJpZ2dlcmVkIG9uIG15IHN5c3RlbT8KCj4gPiBPdXQgb2YgY3VyaW9zaXR5LCBp
cyB0aGVyZSBhIHBlcmZvcm1hY2UgZGVjcmVhc2Ugd2l0aCBzbWFsbAo+ID4gdHJhbnNmZXJzCj4g
PiBvbiBhICJub3JtYWwiIFBDSWUgcG9ydCB0b28sIG9yIGlzIHRoaXMgc3BlY2lmaWMgdG8gVEIz
Pwo+IAo+IEl0J3Mgbm90IFRCMyBzcGVjaWZpYy4gV2l0aCBhICJub3JtYWwiIDggR1QvcyB4MTYg
cG9ydCwgSSBnZXQgYmV0d2Vlbgo+IH4yNTYgTUIvcyBmb3IgNCBLQiB0cmFuc2ZlcnMgYW5kIH4x
MiBHQi9zIGZvciA0IE1CIHRyYW5zZmVycyAoZXZlbgo+IGxhcmdlciB0cmFuc2ZlcnMgc2VlbSBz
bGlnaHRseSBzbG93ZXIgYWdhaW4pLiBUaGlzIGFsc28gbG9va3MKPiBjb25zaXN0ZW50Cj4gd2l0
aCB5b3VyIG1lYXN1cmVtZW50cyBpbiB0aGF0IHRoZSBwcmFjdGljYWwgbGltaXQgc2VlbXMgdG8g
YmUgYXJvdW5kCj4gNzUlIG9mIHRoZSB0aGVvcmV0aWNhbCBiYW5kd2lkdGguCgpTb3VuZHMgbGlr
ZSB5b3VyIGlkZWEgdG8gdHJ5IHRvIG9wdGltaXplIG1lc2EgdG8gdXNlIGxhcmdlciB0cmFuc2Zl
cnMKaXMgYSBnb29kIGlkZWEsIHRoZW4uCgpCZXN0IHJlZ2FyZHMsClRpbQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
