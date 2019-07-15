Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 305ED69A05
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 19:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1653899EA;
	Mon, 15 Jul 2019 17:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70242899EA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 17:38:15 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id h28so11586193lfj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 10:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H6yNHPalLHo3z6IzaHCO2qZtNfkK2KJ2qqTjNmniu54=;
 b=pPxN8PenErB870wWoSHOCb2cZxzYQSOhQ1xyjPq5DhK3cBTy2V/Blm8nlS00Txp5oQ
 PRVjqdV7Ss2RZcppvMSJjevbxZ0QZEuG5zabNqW5xezOgEFEm7de5YNKfUCM8WQwPmu2
 GMc4JsGX0iClxs86FZvbWnkBtNcsx5LI2nW/Yb8CLmL0oiw+jQo0sEHyuRZ4zbI1kj9n
 tVZCEtS5rUGyxV3HNubKc625/dM/W6V/gWFcOQjPE+0eTR+t0t54r47p130Q7Ls7NUyG
 VCZZ6QM8QyC4S/4KAom+9fBUHRZr8VduKDruBfKSlS+ik5LNprLzhxrmcLXVcnAf+eBt
 rRzA==
X-Gm-Message-State: APjAAAXXdUSJZ7NC48ogrPoJNLhCwiHMmalLF5RyfjOaAFHSM39r9BnU
 /D1LzJVCP9W6pBPSq0B+SyAca8Y65j0=
X-Google-Smtp-Source: APXvYqxBWxp3pNRCF9J0lWtZAN5aLKJZqwOHL7d+qbz+tjwVGYYDAy34RyO9AUQCRx30mBLHz0XEig==
X-Received: by 2002:ac2:59c9:: with SMTP id x9mr10442353lfn.52.1563212293598; 
 Mon, 15 Jul 2019 10:38:13 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id 25sm3244484ljn.62.2019.07.15.10.38.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 10:38:12 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 16so17108564ljv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 10:38:12 -0700 (PDT)
X-Received: by 2002:a2e:9192:: with SMTP id f18mr14594812ljg.52.1563212292312; 
 Mon, 15 Jul 2019 10:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9twvwhm318btWy_WkQxOcpRCzjpok52R8zPQxQrnQ8QzwQ@mail.gmail.com>
In-Reply-To: <CAPM=9twvwhm318btWy_WkQxOcpRCzjpok52R8zPQxQrnQ8QzwQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Jul 2019 10:37:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
Message-ID: <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
Subject: Re: drm pull for v5.3-rc1
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=H6yNHPalLHo3z6IzaHCO2qZtNfkK2KJ2qqTjNmniu54=;
 b=BMTEzJWxu5YNZrJEeeLrPq3cQEjHlHqr5u1wTXl6opOudhFi4mrDX8+E2dclQMKPL7
 VnVp9+95dZdzFQPT/3ycgygH4u55U41uLPhkUO4rag68ecl9FwOHBK5kttZVDCz/dO+V
 GjZwH8J5cuRxjRMcDIk3PXkECfVKdthlQme/A=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTI6MDggQU0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPiB3cm90ZToKPgo+IFZNd2FyZSBoYWQgc29tZSBtbSBoZWxwZXJzIGdvIGluIHZpYSBt
eSB0cmVlIChsb29raW5nIGJhY2sgSSdtIG5vdAo+IHN1cmUgVGhvbWFzIHJlYWxseSBzZWN1cmVk
IGVub3VnaCBhY2tzIG9uIHRoZXNlLCBidXQgSSdtIGdvaW5nIHdpdGggaXQKPiBmb3Igbm93IHVu
dGlsIEkgZ2V0IHB1c2ggYmFjaykuCgpZZWFoLCB0aGlzIGlzIHRoZSBraW5kIG9mIGNvbXBsZXRl
bHkgdW5hY2NlcHRhYmxlIHN0dWZmIHRoYXQgSSB3YXMKX2FmcmFpZF8gSSdkIGdldCBmcm9tIHRo
ZSBobW0gdHJlZSwgYnV0IGRpZG4ndC4KCkl0J3Mgbm90IGp1c3QgIm1tIGhlbHBlcnMiLiBJdCdz
IGNvcmUgY2hhbmdlcyBsaWtlIGNoYW5naW5nIGhvdwpkb19wYWdlX21rd3JpdGUoKSB3b3Jrcy4g
V2l0aCBub3QgYSBzaW5nbGUgYWNrIG9yIHJldmlldyBmcm9tIGFueSBvZgp0aGUgVk0gcGVvcGxl
LgoKTWF5YmUgdGhhdCBjb21taXQgaXMgZmluZS4gQnV0IHRoZXJlJ3MgYSB3aG9sZSBzbGV3IG9m
IHF1ZXN0aW9uYWJsZQpjb3JlIFZNIGNoYW5nZXMgdGhlcmUsIGFuZCBhYnNvbHV0ZWx5IG5vbmUg
b2YgdGhlbSBsb29rIG9idmlvdXMsIGFuZApub25lIG9mIHRoZW0gaGFjayBhY2tzIGZyb20gYW55
IG9mIHRoZSBWTSBwZW9wbGUuCgpUaGUgaG1tIHRyZWUgbG9va2VkIGxpa2UgZ29vZCBjbGVhbnVw
cyB0aGF0IGxhcmdlbHkgcmVtb3ZlZCBicm9rZW4gY29kZS4KClRoaXMgbG9va3MgbGlrZSBpdCAq
YWRkcyogYnJva2VuIGNvZGUsIG9yIGF0IGxlYXN0IGFkZHMgY29kZSB0aGF0IGhhZAphYnNvbHV0
ZWx5IG5vIHJlYWwgcmV2aWV3IG91dHNpZGUgb2Ygdm13YXJlLgoKSSdtIG5vdCBwdWxsaW5nIHRo
aXMuIFdoeSBkaWQgeW91IG1lcmdlIGl0IGludG8geW91ciB0cmVlLCB3aGVuCmFwcGFyZW50bHkg
eW91IHdlcmUgYXdhcmUgb2YgaG93IHF1ZXN0aW9uYWJsZSBpdCBpcyBqdWRnaW5nIGJ5IHRoZSBk
cm0KcHVsbCByZXF1ZXN0LgoKICAgICAgICAgICAgICAgICBMaW51cwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
