Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A21EE7D1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AD26E821;
	Mon,  4 Nov 2019 19:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CB96E821
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 19:00:21 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id v186so15120304oie.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 11:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ksr/h9CCVfqZZQjRKQaKSNEP4lA439YVqkZQJ3uCxu4=;
 b=P5izEsG0mU3Vs6wITXVkQKK2OOCiLIFb0hnwqIE0wSb6nEEAp7B/DP3oHuEx5kM9Wn
 VMid6A2eIepE7K2KRTl4rk0Z+bqJFDMxSPW0kONmaihxyR4UcQ+OOQ0ZBwEVOLKOC6aH
 Qq/IrQQTq+8x+vuT852x8m2KQGtrxtec9V7TQqtrsoMYwOATnmHl3k5/Z85d6tG7A+jc
 eSTORMOxhwmQNnAGn0jMugRzgZy9ADKgY6rsqdsTIO/qs2ZALlaNHwniSH9OjNZR7SrV
 882ZB8s3tJOha4vB+y3WNBNOU8Bs+BbRCIg+VHlbu3VCK/CBg8ONQl53z7pjW6CPgstA
 KWFA==
X-Gm-Message-State: APjAAAUGexo2SqKi2XBpsiWmWaervSHbUWcSsrC6lSOZjN4/HzqU4YsB
 ScdfiW9L/WroLVnq1N67G1c64kE7OfgIV0glEa3zAg==
X-Google-Smtp-Source: APXvYqx9RH4q18tPgDzGIegAC/ekwamy9juTr/AzqXzj083HVVgnfDpFlteVk7Iw0sWNnT/Cj5W81rCPE1MlbyKHkRE=
X-Received: by 2002:aca:1210:: with SMTP id 16mr489352ois.128.1572894020603;
 Mon, 04 Nov 2019 11:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20191025234834.28214-1-john.stultz@linaro.org>
 <20191025234834.28214-3-john.stultz@linaro.org>
 <20191104102445.GE10326@phenom.ffwll.local>
In-Reply-To: <20191104102445.GE10326@phenom.ffwll.local>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 4 Nov 2019 11:00:08 -0800
Message-ID: <CALAqxLXq=4dw=WfJZhXh=Ft3SHK1QUJZRt+rwy4ZuKTbjZUEpQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/2] dma-buf: heaps: Allow system & cma heaps to be
 configured as a modules
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ksr/h9CCVfqZZQjRKQaKSNEP4lA439YVqkZQJ3uCxu4=;
 b=CkMQKmnOy6i1xFV6dMi8Bspp2+SiqjFCPxIRLAHuZecPhMXOwhJ0ejY623f5E2L3n8
 BjP9BeUUlCqWt2o6uBCqmUg2OQ38lNyqN7+o7tRZbrWJDjzFnfedi5+KAsRIakiIYnxS
 MFP+ZnbOqfvvJhOCHS8mHURidBYca+h47mZLk0d/OQVIGJk9dPEc8ryZ6XWdeVXza8bw
 W/gF61xyTqrCzN4Nnr6/QQDt2PqWxlGtnCImJjErygRstjnpOeT0/y8S1KCkvMYKejoP
 ErUpYl/s8Fwd7vKYzpdkexc+TxgX1fMlNd2vs7wICk2khqMalQuMN7qYcNgsYQZzfH4s
 sSoA==
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
Cc: Sandeep Patil <sspatil@google.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Yue Hu <huyue2@yulong.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgNCwgMjAxOSBhdCAyOjI0IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTE6NDg6MzRQTSArMDAwMCwg
Sm9obiBTdHVsdHogd3JvdGU6Cj4gPiBBbGxvdyBsb2FkaW5nIHN5c3RlbSBhbmQgY21hIGhlYXAg
YXMgYSBtb2R1bGUgaW5zdGVhZCBvZiBqdXN0IGFzCj4gPiBhIHN0YXRpY2FsbHkgYnVpbHQgaW4g
aGVhcC4KPiA+Cj4gPiBTaW5jZSB0aGVyZSBpc24ndCBhIGdvb2QgbWVjaGFuaXNtIGZvciBkbWFi
dWYgbGlmZXRpbWUgdHJhY2tpbmcKPiA+IGl0IGlzbid0IHNhZmUgdG8gYWxsb3cgdGhlIGhlYXAg
ZHJpdmVycyB0byBiZSB1bmxvYWRlZCwgc28gdGhlc2UKPiA+IGRyaXZlcnMgZG8gbm90IGltcGxl
bWVudCBhbnkgbW9kdWxlIHVubG9hZGluZyBmdW5jdGlvbmFsaXR5IGFuZAo+ID4gd2lsbCBzaG93
IHVwIGluIGxzbW9kIGFzICJbcGVybWFuZW50XSIuCj4KPiBkbWEtYnVmIGl0c2VsZiBoYXMgYWxs
IHRoZSB0cnlfbW9kdWxlX2dldCB3ZSdsbCBuZWVkIC4uLiB3aHkgaXMgdGhpcyBub3QKPiBwb3Nz
aWJsZT8KCkxldCBtZSBsb29rIGludG8gdGhhdC4gIFRoYW5rcyBmb3IgdGhlIHBvaW50ZXIuCgp0
aGFua3MKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
