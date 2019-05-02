Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E431281F
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FF3895EE;
	Fri,  3 May 2019 06:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453AC898BE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 22:19:10 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id s11so3642421otp.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 15:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mnj3Uke0KloAEOsTiIbmZBqGYce/+URqkMO16U3JMXw=;
 b=ZHndIb2VY6xDBETRa557ngTxDY5jTmL+t3U8T5Ik0JwpoWBQXWgE3KJzK57Ob/E16w
 30yn/KgJz4QTAO/CfCwoUaOgv0sX0fQPpCHkbAg+sUn030ak2v6x0Y5525KBP9sr9vwX
 lhdrhAgjc13K/7AiPTl0T8L4XRbZILptCjKJqIrn1lz2Wf4wAD1tR5WqsajcBLic4WKp
 912Od0nAJHRZ01j4iapU9W/N/RGJxVaRKnD4gHcn3bM2PjZiOEpRQWwOzwqCe/ACCL+l
 zjEUYdPvkHGJFhINGgxT4up/BBIkvVopLVXh+/uLCypl2c3dNpawCCYJwdiCZ0H5hPvT
 GwCw==
X-Gm-Message-State: APjAAAV281y5X7wFnFak/H6mO6UoANvi1NqrNLo8g64a2a+3jqM1E62c
 MoT5aUbjF6imJv8sf5djxlkZlPVVmVZ0N0YL1d1X1g==
X-Google-Smtp-Source: APXvYqwcjRBb2JeB8eZoU+PdYvYaU9cVqb5rUhu1+k8ip9Ck7TiSLo4x9b7b37O6OLS1pTeF0OBAy6vTn1RHloKABIA=
X-Received: by 2002:a9d:6008:: with SMTP id h8mr4415680otj.55.1556835549653;
 Thu, 02 May 2019 15:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190502180346.4769-1-john.stultz@linaro.org>
 <CAOvepGk_0UTnXztVgXh6qYGBF_3aQFBqs4HUpwhmfMV0G8TMNQ@mail.gmail.com>
 <CALAqxLXQV4jJpcV5VgECXQR5rw288v7LvBjEvzKm5eJb7oqPjA@mail.gmail.com>
 <CALQgHdmcPgGrW+0TfH6V3UGPwkf5i6SBsDPbag-4zNpvxJ+qAg@mail.gmail.com>
In-Reply-To: <CALQgHdmcPgGrW+0TfH6V3UGPwkf5i6SBsDPbag-4zNpvxJ+qAg@mail.gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 2 May 2019 15:19:00 -0700
Message-ID: <CAJs_Fx6ZjeVKL2pSs7TKO3DAxg0-O7KPzwc_y6jk-rm6A9CgGg@mail.gmail.com>
Subject: Re: [RFC][PATCH 0/3] mesa: Initial build fixups for AOSP/master
To: Dan Willemsen <dwillemsen@google.com>
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Mnj3Uke0KloAEOsTiIbmZBqGYce/+URqkMO16U3JMXw=;
 b=CMr/fOb7LQl0OomubvR80v3Xo4ImSZMaceSN1bL7RwrLcLYWiX0d71kPcIxhHcuqVY
 NtUOw3gOIiE8gCQ4wr1mXgXBrPMoxkEtmO/mOkEl45K77cSjr07n1vN4nKZYuCdW/fKx
 Z7kGn5f+BIUrXiuep7Ul8pXB4Kj7k+Bs5EUv0=
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Greg Hartman <ghartman@google.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCAyOjU3IFBNIERhbiBXaWxsZW1zZW4gPGR3aWxsZW1zZW5A
Z29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1heSAyLCAyMDE5IGF0IDE6NTIgUE0gSm9o
biBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IFdlIG5lZWQg
c29sdXRpb25zIGZvciB0aGUgeGdldHRleHQgYW5kIHRoZSBweXRob24tbWFrbyB1c2FnZS4KPgo+
ICBBbmRyb2lkIGRvZXNuJ3Qgc3VwcG9ydCB0cmFuc2xhdGlvbnMgYXQgdGhpcyBsZXZlbCwgc28g
eW91IG1heSBiZQo+IGFibGUgdG8ganVzdCBza2lwIHhnZXR0ZXh0IGFsdG9nZXRoZXIuCj4KCmZy
b20gcXVpY2sgbG9vaywgZ2V0dGV4dCBpcyBqdXN0IG5lZWRlZCBmb3IgZG9jcyBidWlsZCAod2hp
Y2ggSSBndWVzcwphbmRyb2lkIGRvZXNuJ3QgZG8pIGFuZCBkcmljb25mIChub3Qgc3VwcG9ydGVk
IG9uIGFuZHJvaWQgYWZhaXUsCmFsdGhvdWdoIGl0IGNvdWxkIGJlIG5pY2UgaWYgdGhlcmUgd2Fz
IGEgd2F5IHRvIHN1cHBvcnQgc29tZXRoaW5nIGxpa2UKZHJpY29uZiBvbiBhbmRyb2lkLCBidXQg
SSBndWVzcyBhIGRpZmZlcmVudCB0b3BpY1sxXSkuLiBzbyB5ZWFoLApwcm9iYWJseSBub3QgbmVl
ZGVkCgpbMV0gYW5kIG1heWJlIG5vdCBuZWVkZWQgZm9yIGRyaWNvbmYgaXRzZWxmIGJ1dCBqdXN0
IGZvcgppbmZyYXN0cnVjdHVyZSBmb3IgZHJpY29uZiBndWkgdG9vbCwgd2hpY2ggcHJvYmFibHkg
ZG9lc24ndCBtYWtlIHNlbnNlCm9uIGFuZHJvaWQuLiBvbmx5IHVzZS1jYXNlIHdoZXJlIEkgdGhp
bmsgaXQgY291bGQgbWFrZSBzZW5zZSBpcwpzd2l0Y2hlcyB0byBlbmFibGUgd29ya2Fyb3VuZHMg
Zm9yIGJ1Z2d5IGFwcHMsIGllLiBhbGxvd2luZwpidWdneS9pbmNvcnJlY3QgZ2xzbC4uIG1heWJl
IHRoYXQganVzdCBpc24ndCBhcyBtdWNoIGEgcHJvYmxlbSBvbgphbmRyb2lkPwoKQlIsCi1SCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
