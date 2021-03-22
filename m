Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE99B343C21
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 09:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B24889CFA;
	Mon, 22 Mar 2021 08:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDBE89CFA;
 Mon, 22 Mar 2021 08:54:41 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id f11so3599754vkl.9;
 Mon, 22 Mar 2021 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VOcZJkNZ8NCA/PnW+vfnFCQHFn7zKVKMkSSKxNtxtjg=;
 b=gLWna3OMTzAZBTh+IwGcg8KKsDrKoNxnvhtEbCXJo0A4HkavOQg7tMnk3ajXVM4UKX
 xewQ0hbw0ZknxuUm1emRZSrtFPSHOq+Fh8Pldv8KeL1F8g5DgeNt7lXQpYH8N3sudkwd
 osCghNZRenRAN7j7I67/ama6eFLyEKVY3snLpyDijS1FUvMZU43+BKVRpKOCdLptGE+7
 43BqkbyD1wyfQM2SIRICrIyi+VXC/a6vSTbCAWedP2wdtbwsBrqwM7+4+XHADzAiObyx
 RS8JdSCvLWlQrdR3QflWoRLOryk5JjTEejOH66yernNhPJTBv2j2//qK+RpfMXKASAa0
 Is7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VOcZJkNZ8NCA/PnW+vfnFCQHFn7zKVKMkSSKxNtxtjg=;
 b=lmFPBZOEpiAp6w6YoZeadMqY9ZudV2L8mUXKeIlQ0jsisukq2+llPSMNK02Qp8sEuJ
 /YkQE5KgXHX/hDLwK9tNzSL9bekOsOGxIxSe7CWQriydEyqMStIZvddc2cMY4kyRPP1J
 vIjzzBysnE5/t0vsnjYjwvDlK+LSHJ78+SCphjr6cwHU+FELrWnrl1ir/1Ovbt6iI++J
 vgSELsquTPWDvFppYstoBDgtN+dZ/N+nKj9lPrhG+haAxm9EJp65vavqbjXTWwCIla2f
 WiatbQ2jghoryokoGiAeWgQ2jjpKOjIXhuSDDfmNBHnXSpoMeEkAHhkbDIXQXSbliZBE
 yqWg==
X-Gm-Message-State: AOAM531O4uUaaNdFVWHeGIpjS9oEKu3fIHLzgahS0A0kdjP9mr1bKhxp
 cEDRiIdyAI1qZF5r3ey/jvv94ANrc1APcPQwNXTRyaxo
X-Google-Smtp-Source: ABdhPJxJaA8S3pSaIpr9SAk9H2qRTwAhPRzmwhjUkUATKK7H02rvcvNignImU7TU+noBDPoxXBlgTcZOmuD9n/3VCKs=
X-Received: by 2002:a1f:dd44:: with SMTP id u65mr7561760vkg.12.1616403280826; 
 Mon, 22 Mar 2021 01:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210319190607.2903545-1-l.stach@pengutronix.de>
 <CAH9NwWdOSiWTNpyzxXHasjcNrhOtK3Su66kaQsGA_kz7AUp53A@mail.gmail.com>
 <CAKMK7uH-X6KzxfrMLgzhhYdoceLgygtKvzZWbFt+ZztY_BCC5A@mail.gmail.com>
In-Reply-To: <CAKMK7uH-X6KzxfrMLgzhhYdoceLgygtKvzZWbFt+ZztY_BCC5A@mail.gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 22 Mar 2021 09:54:29 +0100
Message-ID: <CAH9NwWeYO_WsYTtsri6E5dRfWYhD0FrUohK99jx_gZHVHJRukA@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add Vivante TS modifiers
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 patchwork-lst@pengutronix.de,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gU2EuLCAyMC4gTcOkcnogMjAyMSB1bSAyMDoxMSBVaHIgc2NocmllYiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+Ogo+Cj4gT24gU2F0LCBNYXIgMjAsIDIwMjEgYXQgMTA6MjggQU0g
Q2hyaXN0aWFuIEdtZWluZXIKPiA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPiB3cm90ZToK
PiA+Cj4gPiBIaSBMdWNhcwo+ID4KPiA+IEFtIEZyLiwgMTkuIE3DpHJ6IDIwMjEgdW0gMjA6MDYg
VWhyIHNjaHJpZWIgTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Ogo+ID4gPgo+
ID4gPiBWaXZhbnRlIFRTICh0aWxlLXN0YXR1cykgYnVmZmVyIG1vZGlmaWVycy4gVGhleSBjYW4g
YmUgY29tYmluZWQgd2l0aCBhbGwgb2YKPiA+ID4gdGhlIFZpdmFudGUgY29sb3IgYnVmZmVyIHRp
bGluZyBtb2RpZmllcnMsIHNvIHRoZXkgYXJlIGtpbmQgb2YgYSBtb2RpZmllcgo+ID4gPiBtb2Rp
Zmllci4gSWYgYSBUUyBtb2RpZmllciBpcyBwcmVzZW50IHdlIGhhdmUgYSBhZGRpdGlvbmFsIHBs
YW5lIGZvciB0aGUKPiA+ID4gVFMgYnVmZmVyIGFuZCB0aGUgbW9kaWZpZXIgZGVmaW5lcyB0aGUg
bGF5b3V0IG9mIHRoaXMgVFMgYnVmZmVyLgo+ID4gPgo+ID4KPiA+IEkgYW0gdW5zdXJlIHdoeSB5
b3Ugd2FudCB0byBoYXZlIHRoZSBUUyBtb2RpZmllcnMgaW4gZHJtX2ZvdXJjYy5oLiBDYW4KPiA+
IHlvdSBzaGFyZSBzb21lIGluc2lnaHQgb24gdGhpcz8KPgo+IEl0J3MgdGhlIG9mZmljaWFsIHJl
Z2lzdHJ5IGZvciBkcm1fZm91cmNjIGNvZGVzIGFuZCBkcm0gbW9kaWZpZXJzLgo+IFdoZXRoZXIg
dGhlIGtlcm5lbCBldmVyIHVzZXMgaXQgb3Igbm90IGRvZXNuJ3QgbWF0dGVyLgoKRmFpciBwb2lu
dC4uIGJ1dCBJIGRvIG5vdCBzZWUgYW55IHVzYWdlIG9mIHRoZXNlIFRTIG1vZGlmaWVycyBpbiBt
ZXNhCi0gdGhhdCdzIHdoeSBJIGFtIGFza2luZy4KCi0tIApncmVldHMKLS0KQ2hyaXN0aWFuIEdt
ZWluZXIsIE1TYwoKaHR0cHM6Ly9jaHJpc3RpYW4tZ21laW5lci5pbmZvL3ByaXZhY3lwb2xpY3kK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
