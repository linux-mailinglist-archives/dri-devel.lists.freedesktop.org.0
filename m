Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B579D36A53
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 05:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBDD890EE;
	Thu,  6 Jun 2019 03:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91FB890EE;
 Thu,  6 Jun 2019 03:05:31 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f10so797263wmb.1;
 Wed, 05 Jun 2019 20:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OrPIqJeTLR5CnvaUgzpp3HOM8VtidHWcFhpTKo7tnR0=;
 b=omC93/LLLmc/B0hkDRCA9exFzULbArqaCkSU1ZMnlDNdwNVPiZt/AYq/b1Ct48YUdl
 LfU6s8zn54B8Klt/maRPJJP6rFE2HMqlV5fcT40zKSI+olMLFiAldDdt5q3K7rvQ/r2U
 sF8wxOfOn2IG3eHrGdP40c2qGsdu7HKyA1mi0VhxjSAf6DvasBitaKjOyNQ4B6FQkor+
 sBQ1+XUoVzCkAwKRK605SdZHBzPH1lgq8a5MA2T0VKgbpB0+N6bwsAiaNGeHjZN5X9n9
 iVZwKb3eKBslQU4y38+UOPvg0/v/uftYkAVK/G65IbsYJhjU2zLsHJFtn/0DlotlzZJx
 jtnQ==
X-Gm-Message-State: APjAAAVesaF65kFJhlf4SrebvgCAPjNWkbDF5Lvq7cRnB8svkzvLWbkf
 M1aipO4FeB+I+E55ePZdWSHQW/dGy9uysLKpZB9yx3pWtus=
X-Google-Smtp-Source: APXvYqyA/P75QecxsoSAd9qDgC79Mg5Gy7MkYazqMymGyzFr6m/q94j1X7i3IlGEc19X9B0UnqOICWVt1sQESrtUeqI=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr13377023wmk.127.1559790330537; 
 Wed, 05 Jun 2019 20:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190605191157.3134-1-alexander.deucher@amd.com>
 <CAPM=9twLRm41uHjsYn8KG-fsCrG=cdpQ8Jh1VJ1kBcFs2FFWYA@mail.gmail.com>
In-Reply-To: <CAPM=9twLRm41uHjsYn8KG-fsCrG=cdpQ8Jh1VJ1kBcFs2FFWYA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 5 Jun 2019 23:05:18 -0400
Message-ID: <CADnq5_PdnFMjA4RqJgC6jo=Zc__t=z3deNYebbcvngc8UmV39Q@mail.gmail.com>
Subject: Re: [pull] amdgpu, ttm drm-next-5.3
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OrPIqJeTLR5CnvaUgzpp3HOM8VtidHWcFhpTKo7tnR0=;
 b=fDEkF+gh3PVcm3b/npXzP+IZmM7v9VgXHtsrX5IlhCm20G8SrRN1HbNjkNrjUNDNnY
 1LdBWnmeEozFKldTKHltGG/O0MgNJw/nzzcGblq/HcXFMHi1lJm6fdjb3VuZUfm6/sCp
 vFpF2oPpIWL7U0gMEbiOK0l9tyRX4PrWEh5yGpmhc5AzecZ2i6EnZ5Rkc3ru1VGeMMVr
 /lzlwKGUPU9fe+BB+1V+sfIPPHERcGZ3YWbiaxydqKdogN8yGKiFaYFR4QITVoMbSgN6
 //BFq2SXAOx1hecvycUrwpdHUlfRFtR6GZjyVrxANhGhsN0GbWV/V1PRwuYXIeT0HQBy
 IqPA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gNSwgMjAxOSBhdCAxMDozNCBQTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCA2IEp1biAyMDE5IGF0IDA1OjEyLCBBbGV4IERldWNo
ZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgRGF2ZSwgRGFuaWVs
LAo+ID4KPiA+IE1vcmUgbmV3IHN0dWZmIGZvciA1LjM6Cj4gPgo+ID4gYW1kZ3B1Ogo+ID4gLSBS
ZXZlcnQgdGltZWxpbmUgc3VwcG9ydCB1bnRpbCBLSFIgaXMgcmVhZHkKPiA+IC0gVmFyaW91cyBk
cml2ZXIgcmVsb2FkIGZpeGVzCj4gPiAtIFJlZmFjdG9yIGNsb2NrIGhhbmRsaW5nIGluIERDCj4g
PiAtIEF1eCBmaXhlcyBmb3IgREMKPiA+IC0gQmFuZHdpZHRoIGNhbGN1bGF0aW9uIHVwZGF0ZXMg
Zm9yIERDCj4gPiAtIEZpeCBkb2N1bWVudGF0aW9uIGR1ZSB0byBmaWxlIHJlbmFtZQo+ID4gLSBS
QVMgZml4Cj4gPiAtIEZpeCByYWNlIGluIGxhdGVfaW5pdAo+ID4KPiA+IHR0bToKPiA+IC0gQWxs
b3cgZm9yIGJldHRlciBmb3J3YXJkIHByb2dyZXNzIHdoZW4gdGhlcmUgaXMgaGVhdnkgbWVtb3J5
IGNvbnRlbnRpb24KPgo+IGRpbTogMTM3YTdkYTkyNTU3ICgiUmV2ZXJ0ICJkcm0vYW1kZ3B1OiBh
ZGQgRFJJVkVSX1NZTkNPQkpfVElNRUxJTkUgdG8KPiBhbWRncHUiIik6IG1hbmRhdG9yeSByZXZp
ZXcgbWlzc2luZy4KPiBkaW06IGNmMjViNjQ0NDM3NiAoImdwdTogYW1kZ3B1OiBmaXggYnJva2Vu
IGFtZGdwdV9kbWFfYnVmLmMKPiByZWZlcmVuY2VzIik6IFNIQTEgaW4gZml4ZXMgbGluZSBub3Qg
Zm91bmQ6Cj4gZGltOiAgICAgOTg4MDc2Y2Q4YzVjICgiZHJtL2FtZGdwdTogcmVuYW1lIGFtZGdw
dV9wcmltZS5bY2hdIGludG8KPiBhbWRncHVfZG1hX2J1Zi5bY2hdIikKPgo+IFRoZSBmaXJzdCBJ
J20gbm90IHdvcnJpZWQgYWJvdXQsIGJ1dCB0aGUgZml4ZXMgbGluZSBzaG91bGQgYmUgZml4ZWQK
PiBiZWZvcmUgSSBjYW4gcHVsbCB0aGlzLgo+IDJmYmQ2Zjk0YWNjZGJiMjIzYWNjY2FkYTY4OTQw
YjUwYjBjNjY4ZDkgaXMgdGhlIHVwc3RyZWFtIGNvbW1pdCBpbiBteSB0cmVlLgoKV2VpcmQuICBk
aW0gZGlkbid0IGNvbXBsYWluIHdoZW4gSSByYW4gaXQuICBJIGd1ZXNzIHRoZSBvbGQgY29tbWl0
CmhhcHBlbmVkIHRvIGJlIGluIG15IHJlcG8uICBJJ2xsIGZpeCBpdCB1cC4KCkFsZXgKCj4KPiBE
YXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
