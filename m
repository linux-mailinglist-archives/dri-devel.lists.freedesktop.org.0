Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676A4CB561
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62B86EAE6;
	Fri,  4 Oct 2019 07:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73DB89904
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 21:27:49 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id h195so298371pfe.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 14:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ff5/X8LijthYfBkRMosRh8V5DWdVMBmSJpWGhDefc4M=;
 b=BYfjt03IyqI1EvAns3klQeBVOzN8UNVObr2cpdRlT416VriWtwjVmviVjcXvJIeyiq
 uJYqmgnR0eUPAD8xzvyEnw72n4O4AG8m3BkYyhZnhEu78DjTnFjEa+xgBRX0dRJc7Tlg
 SApgYT3oD7noZ3TuKo9SQoZnVBUywNJ7INLFNfxRBHVAChBf/Gcy/4H7BxISwKsffTud
 T9LQkc2gkZJd4ikD6OK4SIt+7lMrfQ5OERbTgiHmEVz35xhNYZ00d4s80Z7Lo679ywh9
 0LxllPz+Z0MAmjeZIrHQzEDJAd+b3KcGjX8cCJMBI+eMUka4c9LMSLCR45FGEO6SyEEF
 jkSQ==
X-Gm-Message-State: APjAAAXDU26iQz9mXEoHpVLrECz4xAgSuQ94kbXfXhyg2ZgHVO4zcCsQ
 WY8lgrMdUq58ndNLBbsTwtxKHcpvSxjCsOwHWOY3AQ==
X-Google-Smtp-Source: APXvYqxNdOGB2WGWCnghLz9uwjolnJyOa8vlr+WnUyO0zmr1/ot3q/S+YF1u1IXNHz8osGDRHnZWrd80t7vHOCyQN88=
X-Received: by 2002:a17:90a:154f:: with SMTP id y15mr77517pja.73.1570051668780; 
 Wed, 02 Oct 2019 14:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120136.1777161-1-arnd@arndb.de>
 <20191002120136.1777161-5-arnd@arndb.de>
 <CAKwvOdmjM80XP7VH83iLn=8mz6W1+SbXST2FChEnH0LSRRm4pA@mail.gmail.com>
 <CADnq5_MyUp9OkqM+MUHZ8BpLEe5afBpAqOwQxDwAWgvVvqbpoQ@mail.gmail.com>
In-Reply-To: <CADnq5_MyUp9OkqM+MUHZ8BpLEe5afBpAqOwQxDwAWgvVvqbpoQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Oct 2019 14:27:37 -0700
Message-ID: <CAKwvOd=+VeD4xchCAyKeBtTD8+qwS6BTVgM=4ZDY1kBQJq3wMQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/amd/display: fix dcn21 Makefile for clang
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ff5/X8LijthYfBkRMosRh8V5DWdVMBmSJpWGhDefc4M=;
 b=Vb5V5wS0B2+OZP1hBBvp/X0BN8J2HU5kfLxwxgDecAUheVPlHvun2OYXtJRwp3FY64
 B/rNa+xoUubebYIt9wU6UtQvz74/wh9aaLvwc1qLfrA4CcdAcvlG/WnwhXR6tVf3o9Pq
 6+kyVsT0p3gDAYf45MjahfyuIfSGJTw8yfHpocnjbuDtgx5ctlNxMGLoYG0NXQm/HPkH
 bgEL6k2l8Alsn0ErHQURhPrnycDhI7j24owjoOxuvFkricWBTQuucujCDaRWvcogBUiu
 J1w4QRQDUslmdgTvSO+cKA2COYYX84VW86bw6Ncpr4pIp3Fyn+urmRyNQX4v3S1OSWf4
 QmxA==
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

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCAyOjI0IFBNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDIsIDIwMTkgYXQgNToxOSBQTSBOaWNr
IERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQWxl
eCwgZG8geW91IGtub3cgd2h5IHRoZSBBTURHUFUgZHJpdmVyIHVzZXMgYSBkaWZmZXJlbnQgc3Rh
Y2sKPiA+IGFsaWdubWVudCAoMTZCKSB0aGFuIHRoZSByZXN0IG9mIHRoZSB4ODYga2VybmVsPyAg
KHNlZQo+ID4gYXJjaC94ODYvTWFrZWZpbGUgd2hpY2ggdXNlcyA4QiBzdGFjayBhbGlnbm1lbnQp
Lgo+Cj4gTm90IHN1cmUuICBNYXliZSBIYXJyeSBjYW4gY29tbWVudC4gIEkgdGhpbmsgaXQgd2Fz
IGFkZGVkIGZvciB0aGUKPiBmbG9hdGluZyBwb2ludCBzdHVmZi4gIE5vdCBzdXJlIGlmIGl0J3Mg
c3RyaWN0bHkgcmVxdWlyZWQgb3Igbm90LgoKQ2FuIHlvdSBmaW5kIG91dCBmb3IgbWUgcGxlYXNl
IHdobyBrbm93cyBtb3JlIGFib3V0IHRoaXMgYW5kIHNldHVwIGEKY2hhdCB3aXRoIGFsbCBvZiB1
cz8gKEkgZG9uJ3Qgd2FudCB0byBkZXJpZGUgdGhpcyBwYXRjaCdzIHJldmlldwp0aHJlYWQsIHNv
IGxldCdzIHN0YXJ0IGEgbmV3IHRocmVhZCBvbmNlIHdlIGtub3cgbW9yZSkgV2UncmUgZmFjaW5n
CnNvbWUgaW50ZXJlc3RpbmcgcnVudGltZSBpc3N1ZXMgd2hlbiBidWlsdCB3aXRoIENsYW5nLgoK
LS0gClRoYW5rcywKfk5pY2sgRGVzYXVsbmllcnMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
