Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D586A3089E0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 16:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60FF6EB5E;
	Fri, 29 Jan 2021 15:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE926EB5E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 15:28:37 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id s18so10891544ljg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 07:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dtfVMRY7YjKUbE4dPaYGTkMMKpz18w0LMYB3F2xwZn4=;
 b=hNrM6oPcQqAxLV7dKfeqOmk0QeuSjZ+4PtxPH6w7CRfoxK+V/hqtpjFZ2AIePGnHNR
 dBKFHvpyKjvwxb0xH5u52jY4r7mR9yRGcG/ibJ1XPE1Eb75s+PqndvCH3WCXk3UjGLx0
 HZP+tswfA4iW1ENhXmIUFxw+CurcloeiNy7pVWUroFIZtiMBOkgpFMcnAKCRMidbqFqS
 OhbO7GP/RRmGu6zK5kBqj2DoXDhGt9JmbAskcgR+VAtPdSY+6rrRyIWP1ktUgr+aKIqN
 x5+X5RMjdOGwFMCRuX0mGc1wbboudaVKUX/aFqhROT6r1lIyPZSvpLURov/hN6+/hs2S
 pxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dtfVMRY7YjKUbE4dPaYGTkMMKpz18w0LMYB3F2xwZn4=;
 b=Xix5CU4TM8kdlJMCOhcVYLSgqFN4K4wjs0el+nF2AgcFizv+P2Whh2SeM5Muy8wHaQ
 6DIwjvLc+1cBV1We03FycCX02tj+sCUZA+0lrqaGG2QEmI6S+0eVPzA0MZwWOurLlQbe
 KCuZuLAtd7c4qE+v6d6MwAm/tyQ3Ilmffy3gqs7AJqbf8ybu9ra7qlKc0fW5QIoO5s/g
 KTpAzgCIBhiJyZ+wlV8+EWSTKUW07Mwg6nnWLVp+MyV9ufktc8C1/bnMCdmXMIL/aJUe
 wDOMaCGWmoMPLxoNLCzT8+0CRsv1QeLlQa5zxewrMsNMv17WIxfq3MAJeP/bzgG9IuKI
 crmg==
X-Gm-Message-State: AOAM5321r2pVGSiXq4zwlaIJhveTykOAz+RSXIxg7GanDgbOCHierGUC
 6Armbsd+xBU17nKGPY1riNtJI3fcYUw0McXAeU0=
X-Google-Smtp-Source: ABdhPJweXqDBNF+WcdoxU0JyuuD06tQTSB4a3mcpO3Y77WtI4sdUZ3Fsdd69pG06dcAIHjvgOcuTvHfldghxM8TiRMs=
X-Received: by 2002:a2e:3612:: with SMTP id d18mr2680701lja.211.1611934115538; 
 Fri, 29 Jan 2021 07:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20210129095604.32423-1-tzimmermann@suse.de>
 <20210129095604.32423-4-tzimmermann@suse.de>
 <CAMeQTsb7sdKGXhB+sFCZQHJ3g3bcZKTyMoz=8_V70jTNUa_A3w@mail.gmail.com>
 <35164db7-1f85-af46-9040-4d04b5777939@suse.de>
In-Reply-To: <35164db7-1f85-af46-9040-4d04b5777939@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 29 Jan 2021 16:28:24 +0100
Message-ID: <CAMeQTsa6N7hkV5RXZ7B8xmycBT-KH7q_PgoYV_xj3u3=ZP5jDw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/gma500: Drop DRM_GMA3600 config option
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gMjksIDIwMjEgYXQgNDoxMiBQTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaSBQYXRyaWsKPgo+IEFtIDI5LjAxLjIxIHVtIDE1
OjMzIHNjaHJpZWIgUGF0cmlrIEpha29ic3NvbjoKPiA+IE9uIEZyaSwgSmFuIDI5LCAyMDIxIGF0
IDEwOjU2IEFNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToK
PiA+Pgo+ID4+IFdpdGggc3VwcG9ydCBmb3IgdGhlIE1JRC1yZWxhdGVkIGNoaXBzIHJlbW92ZWQs
IG9ubHkgc3VwcG9ydCBmb3IKPiA+PiBkZXNrdG9wIGNoaXBzIGlzIGxlZnQgaW4gdGhlIGRyaXZl
ci4gU28ganVzdCBidWlsZCB0aGUgY29tcGxldGUKPiA+PiBkcml2ZXIgaWYgRFJNX0dNQTUwMCBo
YXMgYmVlbiBzZWxlY3RlZC4gQW55b25lIHdobyB3YW50cyB0byBlbmFibGUKPiA+PiB0aGUgUG91
bHNibyBjb2RlIHdvdWxkIHByb2JhYmx5IGFsc28gd2FudCB0aGUgQ2VkYXJ2aWV3IGNvZGUuCj4g
Pj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4KPiA+Cj4gPiBBcyBHTUE2MDAgaXMgc3RheWluZywgY2FuIHlvdSBwbGVhc2UgYWxzbyBt
ZXJnZSB0aGF0IGNvbmZpZz8KPgo+IEJ5ICdtZXJnZSB0aGF0IGNvbmZpZycsIHlvdSBtZWFuIHRv
IHJlbW92ZWQgQ09ORklHX0RSTV9HTUE2MDAgYW5kCj4gY29uZmlndXJlIGV2ZXJ5dGhpbmcgd2l0
aCBEUk1fR01BNTAwPwoKWWVzLiBObyBwb2ludCBpbiBrZWVwaW5nIGl0IGFyb3VuZCB3aGVuIGNv
bmZpZyBmb3IgR01BMzYwMCBnb2VzIGF3YXkuCgo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4K
PiA+Cj4gPiAtUGF0cmlrCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKPiA+Cj4KPiAtLQo+IFRob21hcyBaaW1tZXJtYW5uCj4gR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcgo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSAo+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQo+IChIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykKPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVy
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
