Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB70623197C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 08:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A3F6E446;
	Wed, 29 Jul 2020 06:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6F76E446
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 06:24:01 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c2so10695971edx.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 23:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jh7E06sJIRlKW1gLV22fm4X2RbVtDyXde+O80IiWPrk=;
 b=ep5c3y6xb2eqMfTOIIWPwxUJiMzfKxYdnuBpDiPbCh3yjRj6nv3RhqTO8x5ygYKTn0
 rn/WC9tC+N1EDUGK3BQftPTPgQi0DexTo6MiCIuipsCLFsm3SzHCyDw51lIJO1Y5a4CY
 vCqB9r+i19hPWgxaN85qpxKNHApfRZHD+dcXs4yZHzV2e1it+/9IYR8Gx+BuIexY/07r
 EFx1x3Da9/ft8l9DyrNEp+RMsSI/01dU4JdjQ3T23R/NAJjQnz7y2eTsAkJB1LNqbkdp
 hD3/MErYRyPD+oHuDNYS+Zer/pezt5wsRT3Uin6ImwoqcpEDHaTTUbipqqXMhENt1IJm
 Axbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jh7E06sJIRlKW1gLV22fm4X2RbVtDyXde+O80IiWPrk=;
 b=lLExtUb/wFM7LVIDQrqiLAcq100QbmLeViNrrR7QEOzMPLC9XEFAsq2bnjzPUc89i5
 JGsVvn+sdezD8kuh8iieAZSXkFnqct2zBlGVh98PdnBoqikqHYk6Vp/3wivGy9BREXzM
 ubxyBIVPKjnG0TpslQFQgBSGZEqr6zLqsIT0GCK3M6CLguAI6zHgP7vvZBcvF4Q8H8Do
 MqgUCTJSxenJKKa06KoB5yJn+RNHcH7tQs4gnLf33u5gBY4w1DTUHdwFcLkkZAf1rBlr
 ZDI01uC/Tfdnk/0bVMO++Lcr37z+4B+PBIJb+9FpGM4gwaQiZEitdD4NE8ZDtC9/5nkh
 q8/Q==
X-Gm-Message-State: AOAM531n0l+LCt2Sb/MHQ+ftH3jdvgMwSFP2RQIqN9CG4K+xdjzb+bn7
 ihKXMMULkEd4++1IUdph4nbnIQG22QBlSoIG3Jg=
X-Google-Smtp-Source: ABdhPJycC8guEDCHEseuMd6pEj7od2Bz+XuKKvVRwj0h8Hq2LfLwdmHf60s4MS/DSH2RYMsy0uVbqhXpDN40Smet2S8=
X-Received: by 2002:a50:fc84:: with SMTP id f4mr23092008edq.220.1596003840554; 
 Tue, 28 Jul 2020 23:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200723151710.3591-1-christian.koenig@amd.com>
 <20200723151710.3591-2-christian.koenig@amd.com>
 <0f69b57b-407a-8c23-04e2-280436e6c368@suse.de>
 <CAPM=9tzxbuRreP36053dfKXwm0AppDKp+y55JEJ6bt=YE5WRLg@mail.gmail.com>
In-Reply-To: <CAPM=9tzxbuRreP36053dfKXwm0AppDKp+y55JEJ6bt=YE5WRLg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 29 Jul 2020 16:23:48 +1000
Message-ID: <CAPM=9tz=0a0J4N=FAd5vN1M7yTszDy7D9qvZCc-m6szZAi9M=w@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/ttm: initialize the system domain with defaults
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyOSBKdWwgMjAyMCBhdCAxNjoyMSwgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwu
Y29tPiB3cm90ZToKPgo+IE9uIEZyaSwgMjQgSnVsIDIwMjAgYXQgMTY6NDMsIFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToKPiA+Cj4gPgo+ID4KPiA+IEFtIDIz
LjA3LjIwIHVtIDE3OjE3IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPiA+ID4gSW5zdGVhZCBv
ZiByZXBlYXRpbmcgdGhhdCBpbiBlYWNoIGRyaXZlci4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4KPiA+IFJl
dmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPgo+IEkn
bSBub3Qgc3VyZSB3aGF0IGhhcHBlbmVkIGJ1dCB0aGUgcGF0Y2h3b3JrIGNvcGllcyBvZiB0aGlz
IHNlcmllcyBhcmUKPiBtYW5nbGVkIGJhZGx5LCBJIGV4cGVjdCBBTUQgZW1haWwgd2l0aCB0aGUg
Y3JhcHB5IGhlYWRlcnMgb3Igc29tZXRoaW5nCj4gZ290IGluIHRoZXJlIHNvbWV3aGVyZS4KPgo+
IENhbiB3ZSBnZXQgdGhlbSBpbiBkcm0tbWlzYy1uZXh0IGF0IHNvbWUgcG9pbnQgc28gSSBjYW4g
Y2xlYW5seSBsb29rIGF0IHRoZW0uCgpPaCBpdCBsb29rcyBsaWtlIHRoZXkgYXJlIHRoZXJlIGFs
cmVhZHksIEknbSBub3Qgc3VyZSB3aHkgSSdtIGhhdmluZwp0cm91YmxlIGFwcGx5aW5nIHRoZSBu
ZXh0IHNldC4gd2lsbCBkaWcgYSBiaXQgbW9yZS4KCkRhdmUuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
