Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3120E7C49
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 23:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4FF6E04B;
	Mon, 28 Oct 2019 22:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D40C6E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 22:26:40 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id b16so8057819otk.9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 15:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rjaKLyekYNHPXZ7Zh1mNGLtxL0unaQdEBwCVJlgaZ8w=;
 b=iBGpOojz7TFXjrmjT/ORR9Z7R5B9kyTv20miMJkfPodflaFRPE+KPN8Rj4bZpHXpbS
 WTHdAzhEvbZ/UkS0UYHgDJeiFgchAyeQwe/5lIzJo78czRMyoRrbhuvoqGf/wbCdy1Lp
 swnKhTxqc040mgYlb5Vj9vAe7NEClXt5XtaViuT/E0TcJZgvk2QC/CuwsCuWU8nR4FgM
 rsJ/gEYnOfd9/Lf3+7TZxCplVVbwmA9jNZMUEoXD0cOxy9Z0MqcA9t5cCGHZ4SN83007
 iLEVm3D5IChAyW2yaOe8MHanbI75PEZ7WI+oTHLjiQ/JG8eFHZR/VMm0Oq7wdqUHSujW
 49Xw==
X-Gm-Message-State: APjAAAWUaZZdNn0c5PSkLPWGSuAVnDDVHLYjwtg/WRm5CJmr8acdeQZj
 52G8WIItyDn59qdOjZvIVhpYOUFWbIy3rouTfi+gMw==
X-Google-Smtp-Source: APXvYqwaeIGafbzLyvtKwrzN2AssHSZQ3DHbhJ57doQ/HodEQyYbtIaq12npBm2CtcZ4G7Pyz3slNCD8r9A/pLQfEJo=
X-Received: by 2002:a05:6830:ca:: with SMTP id
 x10mr14637591oto.221.1572301599265; 
 Mon, 28 Oct 2019 15:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191025234834.28214-1-john.stultz@linaro.org>
 <20191025234834.28214-2-john.stultz@linaro.org>
 <20191028191231.GJ125958@google.com>
 <CALAqxLVEwTjNe6y9xLLv9ib8qnp6hFXsT+XS2bJT0jRTzZVdsg@mail.gmail.com>
In-Reply-To: <CALAqxLVEwTjNe6y9xLLv9ib8qnp6hFXsT+XS2bJT0jRTzZVdsg@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 28 Oct 2019 15:26:28 -0700
Message-ID: <CALAqxLWp3F-_uKrtW06CApyqajL-DK0Rujku8YjHe8QEUcXU6w@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/2] mm: cma: Export cma symbols for cma heap as a
 module
To: Sandeep Patil <sspatil@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rjaKLyekYNHPXZ7Zh1mNGLtxL0unaQdEBwCVJlgaZ8w=;
 b=mFJrUbF9SJh4NwZ1grLzSIg8GB0cbVWo9erluO3H5ch6mTmkstZOZ//IrIeSyR9Yva
 vU5niR2ibGiMQyhT+KkdFZvWX/mcM4xaO+XVsGVzQZCHWUbQfZE5HgjqO48jxtJ+VWwV
 xeJClmrCQwM+LyV9CTe+zH7j7599bBsEgjW1a9z5eb/xgM/hObBqRsD2bpPqEw0TjQNe
 GQA/U9GsYTCE1jZUpWCEwYZKYxVRF4mi8w14jGNPY9NDWDhWwewcuVBhnPS6miSsi152
 CJIPUCT5+JFktOIsaA3gYoq/HtHT60fsnjwzxHTfmiEYUxQdL+zTybLZ4n2L9/C+tWrb
 /Ouw==
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
Cc: Alistair Strachan <astrachan@google.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Yue Hu <huyue2@yulong.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Andrew F . Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMTowMyBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIE9jdCAyOCwgMjAxOSBhdCAxMjoxMiBQTSA8
c3NwYXRpbEBnb29nbGUuY29tPiB3cm90ZToKPiA+IE9uIEZyaSwgT2N0IDI1LCAyMDE5IGF0IDEx
OjQ4OjMzUE0gKzAwMDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gPiAtLS0gYS9rZXJuZWwvZG1h
L2NvbnRpZ3VvdXMuYwo+ID4gPiArKysgYi9rZXJuZWwvZG1hL2NvbnRpZ3VvdXMuYwo+ID4gPiBA
QCAtMzEsNiArMzEsNyBAQAo+ID4gPiAgI2VuZGlmCj4gPiA+Cj4gPiA+ICBzdHJ1Y3QgY21hICpk
bWFfY29udGlndW91c19kZWZhdWx0X2FyZWE7Cj4gPiA+ICtFWFBPUlRfU1lNQk9MKGRtYV9jb250
aWd1b3VzX2RlZmF1bHRfYXJlYSk7Cj4gPgo+ID4gSSBkaWRuJ3QgbmVlZCB0byBkbyB0aGlzIGZv
ciB0aGUgKG91dC1vZi10cmVlKSBpb24gY21hIGhlYXAgWzFdLgo+ID4gQW55IHJlYXNvbiB3aHkg
eW91IGhhZCB0bz8KPgo+IEl0cyBsaWtlbHkgZHVlIHRvIHRoZSBjaGFuZ2VzIEkgbWFkZSBpbiB0
aGUgc2VwYXJhdGUKPiBub24tZGVmYXVsdC1DTUEtcmVnaW9uIHBhdGNoIHNldC4gRWFybGllciBJ
IGhhZCBnb3R0ZW4gYXdheSB3aXRoIGp1c3QKPiB5b3VyIGNoYW5nZSwgYnV0IGluIHRlc3Rpbmcg
YmVmb3JlIEkgc2VudCB0aGlzIHNlcmllcywgSSBoaXQgdGhlIGJ1aWxkCj4gZXJyb3IgYW5kIHF1
aWNrbHkgYWRkZWQgdGhlIGV4cG9ydCBiZWZvcmUgc2VuZGluZy4KCkFuZCBqdXN0IHRvIGNsYXJp
ZnkgdGhpcyBwb2ludCwgSSB3YXMgbWlzdGFrZW4gYW5kIGl0IHdhc24ndCB0aGUKbm9uLWRlZmF1
bHQtQ01BLXJlZ2lvbiBwYXRjaCBzZXQsIGJ1dCB0aGUgZmFjdCB0aGF0IEknbSB1c2luZwpkZXZf
Z2V0X2NtYV9hcmVhKE5VTEwpIHRvIGdldCB0aGUgZGVmYXVsdCBDTUEgYXJlYSB0byByZWdpc3Rl
ciwgcmF0aGVyCnRoZW4gdHJ5aW5nIHRvIHJlZ2lzdGVyIGV2ZXJ5IENNQSBhcmVhIHZpYSBjbWFf
Zm9yX2VhY2hfYXJlYSgpIGFzIGlzCmRvbmUgaW4gSU9OLiAgSSBhY3R1YWxseSBjb3VsZCBwcm9i
YWJseSBkcm9wIHRoZSBjbWFfZm9yX2VhY2hfYXJlYQpleHBvcnQgZm9yIHRoZSBkbWFidWYgaGVh
cHMgdXNhZ2UuCgp0aGFua3MKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
