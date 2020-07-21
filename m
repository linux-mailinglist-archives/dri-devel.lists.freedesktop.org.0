Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEB8228B8D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 23:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965C36E5A9;
	Tue, 21 Jul 2020 21:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0596E10C;
 Tue, 21 Jul 2020 21:42:42 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id n26so57085ejx.0;
 Tue, 21 Jul 2020 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Dyi1MVLFGf/8/KPaE1swyyeNErOrv2bGUWjTcVj8gxM=;
 b=vfHhkUH7uUqVuea2i7a2v8nm3GlQGvrejsVXk1dY+oTV5cGgIufTlcUh4U03yDRrO3
 3ZXPq4Kz7VxluI/vXrEjn4UOxXyeDw18jZS0yQLfsEyCCAiuGS09yjqLzQvJBo0gJjzD
 o9IFYUnweCqxm0XNV81CpeVFmCF1svsGMBkarpkK70EJKgJ1ohZtqMuFAyeMgNrM6j8L
 MY+Xde+v4jUiVgl27SGT20e/o7328q9sF+n94T5QfWFwKyoHltzu6agpEi5hm1pXHnph
 vAUoYRh2zp5yOEmbJdevHeUN0BLFZQLxBK1amF/HNbgoFB/AnU6n3ixeTu2aYpGx1bbJ
 scIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Dyi1MVLFGf/8/KPaE1swyyeNErOrv2bGUWjTcVj8gxM=;
 b=XZTGfDuARNC1ewpq6WOh4wgZ8iESyM4lA996uvHGaPUfN8yTjC2F7OcRFWHBVuHcTf
 Vzb72tKkTtlwiHIwAGcL+hVGDW855FTxkmvRxtUyrsQbG0KxvwhLgSdDoMVhXcjLLXAY
 XtgW1XbE0Jj6b1Okh+WEj2KxHBLkLdCurnR6yeQIpIONp90wMdmVjZy9tCaYOYrTK3DL
 5SuQn7vlRjBUdzqckIqGgMPGazLeGKug4XnJOUhrsMQ9OSux8tNigaFk0XJaTwvvyGym
 Mvx1LnvOfZh8BMUt1JfRHsAxFZEqn7jGf9fb/w84+cO8kBmxCbmAUtg1EVN+KfsXspXi
 uHtA==
X-Gm-Message-State: AOAM5321NiBRsuvWSwHr/bXQQjrvZw51XKwNBpDNIqqBBt1l+igNHWgC
 ngTKp5ox7tO1kITAW4XUkjsXdH4m+VbTxY71uv59lz88
X-Google-Smtp-Source: ABdhPJwxE240DtGwFEuhHkKMPvfhlukuGNteVSI0paUJJOmdu+Jb46VZVXI0n2iDUJjFfIzHzYH2PLSYSUaSvNNdruQ=
X-Received: by 2002:a17:906:f88a:: with SMTP id
 lg10mr26295104ejb.317.1595367760653; 
 Tue, 21 Jul 2020 14:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
 <20200721074157.GB3278063@phenom.ffwll.local>
 <3603bb71-318b-eb53-0532-9daab62dce86@amd.com>
 <57a5eb9d-b74f-8ce4-7199-94e911d9b68b@shipmail.org>
 <2ca2c004-1e11-87f5-4bd8-761e1b44d21f@amd.com>
 <74727f17-b3a5-ca12-6db6-e47543797b72@shipmail.org>
 <CAKMK7uFfMi5M5EkCeG6=tjuDANH4=gDLnFpxCYU-E-xyrxwYUg@mail.gmail.com>
 <ae4e4188-39e6-ec41-c11d-91e9211b4d3a@shipmail.org>
 <f8f73b9f-ce8d-ea02-7caa-d50b75b72809@amd.com>
In-Reply-To: <f8f73b9f-ce8d-ea02-7caa-d50b75b72809@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 22 Jul 2020 07:42:28 +1000
Message-ID: <CAPM=9tw7CBu7zm-N5JpjK_P49Td1E9REbBn=1KrK2nAVuX=xxg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Daniel Stone <daniels@collabora.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pgo+ID4+IFRoYXQncyBhbHNvIHdoeSBJJ20gbm90IHBvc2l0aXZlIG9uIHRoZSAibm8gaHcgcHJl
ZW1wdGlvbiwgb25seQo+ID4+IHNjaGVkdWxlciIgY2FzZTogWW91IHN0aWxsIGhhdmUgYSBkbWFf
ZmVuY2UgZm9yIHRoZSBiYXRjaCBpdHNlbGYsCj4gPj4gd2hpY2ggbWVhbnMgc3RpbGwgbm8gdXNl
cnNwYWNlIGNvbnRyb2xsZWQgc3luY2hyb25pemF0aW9uIG9yIG90aGVyCj4gPj4gZm9ybSBvZiBp
bmRlZmluaXRlIGJhdGNoZXMgYWxsb3dlZC4gU28gbm90IGdldHRpbmcgdXMgYW55IGNsb3NlciB0
bwo+ID4+IGVuYWJsaW5nIHRoZSBjb21wdXRlIHVzZSBjYXNlcyBwZW9wbGUgd2FudC4KPgo+IFdo
YXQgY29tcHV0ZSB1c2UgY2FzZSBhcmUgeW91IHRhbGtpbmcgYWJvdXQ/IEknbSBvbmx5IGF3YXJl
IGFib3V0IHRoZQo+IHdhaXQgYmVmb3JlIHNpZ25hbCBjYXNlIGZyb20gVnVsa2FuLCB0aGUgcGFn
ZSBmYXVsdCBjYXNlIGFuZCB0aGUgS0ZECj4gcHJlZW1wdGlvbiBmZW5jZSBjYXNlLgoKU28gc2xp
Z2h0IGFzaWRlLCBidXQgaXQgZG9lcyBhcHBlYXIgYXMgaWYgSW50ZWwncyBMZXZlbCAwIEFQSSBl
eHBvc2VzCnNvbWUgb2YgdGhlIHNhbWUgcHJvYmxlbXMgYXMgdnVsa2FuLgoKVGhleSBoYXZlIGZl
bmNlczoKIkEgZmVuY2UgY2Fubm90IGJlIHNoYXJlZCBhY3Jvc3MgcHJvY2Vzc2VzLiIKClRoZXkg
aGF2ZSBldmVudHMgKHVzZXJzcGFjZSBmZW5jZXMpIGxpa2UgVnVsa2FuIGJ1dCBzcGVjaWZ5Ogoi
U2lnbmFsZWQgZnJvbSB0aGUgaG9zdCwgYW5kIHdhaXRlZCB1cG9uIGZyb20gd2l0aGluIGEgZGV2
aWNl4oCZcyBjb21tYW5kIGxpc3QuIgoKIlRoZXJlIGFyZSBubyBwcm90ZWN0aW9ucyBhZ2FpbnN0
IGV2ZW50cyBjYXVzaW5nIGRlYWRsb2Nrcywgc3VjaCBhcwpjaXJjdWxhciB3YWl0cyBzY2VuYXJp
b3MuCgpUaGVzZSBwcm9ibGVtcyBhcmUgbGVmdCB0byB0aGUgYXBwbGljYXRpb24gdG8gYXZvaWQu
IgoKaHR0cHM6Ly9zcGVjLm9uZWFwaS5jb20vbGV2ZWwtemVyby9sYXRlc3QvY29yZS9QUk9HLmh0
bWwjc3luY2hyb25pemF0aW9uLXByaW1pdGl2ZXMKCkRhdmUuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
