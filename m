Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CA3E04AC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 15:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB526E491;
	Tue, 22 Oct 2019 13:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE5D6E491
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 13:14:54 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id f5so5345124lfp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 06:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lsjeBlDKGblR7xMBmYyh3WGty8u/I0DgLI36ERDLWx8=;
 b=luWhPUdrh0EsAbnzpp8CegR2FMcGoysvENTsWNFIEotCBCy+5csJV7iZ/Kmt9sJX4h
 uVhIumHwaquGfmJu9c5anep1H5jyjfZQwRZD+eHliwjoANrclF9FuoX8eLH4owtIK8LA
 88TsT/y1f+lMkhaFipSgSN6AykmmQTvsG40d+sDxFNOcdyS/IJY2+tPu4HHUvhN/Zbs0
 LjS40xYkNo7Ur9+1f6kb1g871HCpPVNEv0T6cst2N+guZnot3UpqE+G/20kEwh0q1Qkx
 ePtxk8rfdxtKpF53+WlJJrVihhBxmm8W1E+uNOdRxB/Q0tJwNRdnVvmX14DUPRGpbVSq
 BfjA==
X-Gm-Message-State: APjAAAWLyh8l81g+hAadrBQy4N7hKMRa87FQ8bTryU3qtEbzmxChFa0s
 JeK//UgAeLPypM+0QFdrY2/P865B42saoAWN6tZrx7Y2OZQ=
X-Google-Smtp-Source: APXvYqz/PN7xETNRve2RNnrVzRrsaaT9i8evjZ7UDGX5LP2z6tTTepFxAN+Av6xoGXU04kwC5O2kiV0SfkYF/UGjA7I=
X-Received: by 2002:a19:f609:: with SMTP id x9mr10845814lfe.169.1571750092244; 
 Tue, 22 Oct 2019 06:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191011143009.17503-1-rohan.garg@collabora.com>
 <20191014085938.GH11828@phenom.ffwll.local> <3179240.fNvyFBsHMD@saphira>
 <20191022093052.GE11828@phenom.ffwll.local>
In-Reply-To: <20191022093052.GE11828@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 22 Oct 2019 15:14:39 +0200
Message-ID: <CAPj87rOyhVSpROfd=2jgCK98jpyF1=M0+C6BFCcLnWpefYic=w@mail.gmail.com>
Subject: Re: [PATCH v4] drm/ioctl: Add a ioctl to label GEM objects
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lsjeBlDKGblR7xMBmYyh3WGty8u/I0DgLI36ERDLWx8=;
 b=oomA3+CumIKKXVfwCxw5ZwFFYzYmHClG/38LrnWLKggMXloZQRJV7ZgAmxfg6eaQAM
 kgN6Bt8QbciB9ISzabPtUyfkoffoJ7k/8EpfPtEyn7ZEV7zzy/gdF4Q1O98gZlzt5DqL
 s3PF8q3V7HX/t13n/oNHuM3AU5hP3LDWNzBuERL4MEQZz56vg7IZgTomF7Izh51Tp4pc
 i7UwTPC9rvP4yrn1t9UceWX63RuUlPsyIMIrgKUX5L0uwdS+3Y81NCy3n64yNuwUFC7P
 N3yUV4eqwlW9S98NeUOf3losV4AXSyGJBsqcvxjqps5Uzv1s/CyQVZd4+2GK7mY5vmkB
 pAJA==
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
Cc: Rohan Garg <rohan.garg@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5LAoKT24gVHVlLCAyMiBPY3QgMjAxOSBhdCAxMTozMCwgRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPiB3cm90ZToKPiBPbiBUdWUsIE9jdCAyMiwgMjAxOSBhdCAxMDo1ODowMkFNICsw
MjAwLCBSb2hhbiBHYXJnIHdyb3RlOgo+ID4gVGhpcyBhcHByb2FjaCBhbHNvIGZ1dHVyZSBwcm9v
ZidzIHVzIHRvIGJlIGFibGUgdG8gbGFiZWwgYW55IGhhbmRsZXMsIG5vdCBqdXN0Cj4gPiBHRU0g
aGFuZGxlLgo+Cj4gSSBkb24ndCBleHBlY3Qgd2UnbGwgZXZlciBtZXJnZSBhbnkgbm9uLWdlbSBk
cml2ZXJzIGluIHRoZSBmdXR1cmUgYW55bW9yZS4KPiBIZW5jZSB0aGlzIHJlYWxseSBvbmx5IG1h
a2VzIHNlbnNlIGlmIHZtd2dmeCB3YW50cyBpdCwgdGhhdCdzIHRoZSBvbmx5Cj4gdXNlLWNhc2Ug
Zm9yIHRoaXMgZ2VuZXJpYy1pc20gaGVyZS4gSWYgdm13Z2Z4IGRvZXNuJ3QgaGF2ZSBhIHVzZSBv
ciBqdW1wCj4gb24gYm9hcmQgd2l0aCB0aGlzLCBpbW8gYmV0dGVyIHRvIGp1c3QgbWFrZSB0aGlz
IHNwZWNpZmljIHRvIGdlbSBhbmQgYmUKPiBkb25lLgoKVk13YXJlIHdlcmUgdGhlIGV4YWN0IHBl
b3BsZSB3aG8gYXNrZWQgaXQgZm9yIHRvIGJlIGhhbmRsZS1hZ25vc3RpYwphbmQgbm90IEdFTS1z
cGVjaWZpYyAuLi4KCkdpdmVuIHRoYXQgd2UgYWxyZWFkeSBoYXZlIGhhbmRsZS1hZ25vc3RpYyBj
YWxscyBsaWtlIEZCcyBpbgpwYXJ0aWN1bGFyLCBJIHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGhh
dmUgdGhpcyBvbmUganVzdCBmb2xsb3cgdGhhdC4KSXQncyBub3QgbXVjaCBjb2RlIGFuZCBkb2Vz
bid0IHJlYWxseSBpbXBseSBhbnkgaGVhdnkgY2hhbmdlIGZvciB0aGUKcmVzdCBvZiBEUk0uCgpD
aGVlcnMsCkRhbmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
