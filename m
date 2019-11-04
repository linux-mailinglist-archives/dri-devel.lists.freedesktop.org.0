Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A21DEE793
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 19:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C049F6E817;
	Mon,  4 Nov 2019 18:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780696E817
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 18:44:27 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id i185so15049981oif.9
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 10:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fIHHPzEIZlxZwO4uYb9AqkuWkKRYCxaoO1dAlVnypSo=;
 b=p8UMBm5K0Gl4DEtdn12D3H3sAwX7gNoPFNd4EgF1Q5KtehNz9xDMc3stHt30xrRELt
 p5WPjgryghbOFYuWjdA+t0U4xrSIPiTWY48Rzt6MHJd4aKU9ELCvgnqm3N15hQcURdfM
 jjrCnH9p3CGPFqXDtrEi8Kz6qgmQ5pDyFfnRztUEranB6gyIe46UqUHMnPJSrESFkiPp
 yAIOPqnoWGTOEzpSQDYL82I+MEN78fwNwGwwkPaXbkE6YQbNdk2GU3V4b1UAKmSpo51W
 /qGBaVEBLTlRCDgj0gn1RvUYCr5zvHrprahSwzjPN2jYzZvZVJFn0hzvXzZM6KJ2KCAM
 dybQ==
X-Gm-Message-State: APjAAAXwJ4i0RBEdPFkvt0RXquvF9+nZyi8jLqkpsnGE6NuH77cNzyom
 P6bu9FcINnjTwnQFyAwdTq6tnGDL72dwTvyMq77mBw==
X-Google-Smtp-Source: APXvYqwudkIT7BfyYubS2+BnLFVqC9kiJ2G6htJbTxypq0RyTqfsZr+adntbCigCob0HtC2BcOgG9Tp04w3kdvzLYpI=
X-Received: by 2002:aca:c64c:: with SMTP id w73mr398080oif.161.1572893066616; 
 Mon, 04 Nov 2019 10:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20191101214238.78015-1-john.stultz@linaro.org>
 <20191101214238.78015-2-john.stultz@linaro.org>
 <20191104102410.66wlyoln5ahlgkem@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191104102410.66wlyoln5ahlgkem@DESKTOP-E1NTVVP.localdomain>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 4 Nov 2019 10:44:15 -0800
Message-ID: <CALAqxLV7sB+gN1FNhhaiE9FXmaFv1TNsmKxD1Xctab6fTERA4w@mail.gmail.com>
Subject: Re: [PATCH v14 1/5] dma-buf: Add dma-buf heaps framework
To: Brian Starkey <Brian.Starkey@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fIHHPzEIZlxZwO4uYb9AqkuWkKRYCxaoO1dAlVnypSo=;
 b=y6LeMHRh2X/z21iqd/OGrTPukcGzBWE5r4FxdYdWoVA8CFVwZOIxhdvmEZSURcMzmx
 uc+M4VSP8ZS0sELWbzJA6eNK4donfuHDPCvgAA78pstFLaYRmvvjyzGW9J2MW5IThNXo
 bxjVViJM2JQT5/fW8dITPwhn3i0NmulLhCQM6/gIO52gi+35pkZZHIlYUwJTDkgxV7a7
 1YImDoOZXyRtPbgD0w5dTr9rdG4O3zVVfXBy5mzD0fmN28prQtOHIqx3tjus+0INvDao
 Lr020YlGcq7+M8B5ABg1Ob3hmMVVbItFKeFMhA/R6RaXqaucReeme2bYh34FtPUgiDE/
 WI+g==
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Sandeep Patil <sspatil@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 nd <nd@arm.com>, Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgNCwgMjAxOSBhdCAyOjI0IEFNIEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0YXJr
ZXlAYXJtLmNvbT4gd3JvdGU6Cj4gT24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDk6NDI6MzRQTSAr
MDAwMCwgSm9obiBTdHVsdHogd3JvdGU6Cj4gPiBGcm9tOiAiQW5kcmV3IEYuIERhdmlzIiA8YWZk
QHRpLmNvbT4KPiA+Cj4gPiBBZGRpdGlvbmFsbHkgc2hvdWxkIHRoZSBpbnRlcmZhY2UgZ3JvdyBp
biB0aGUgZnV0dXJlLCB3ZSBoYXZlIGEKPiA+IERNQV9IRUFQX0lPQ19HRVRfRkVBVFVSRVMgaW9j
dGwgd2hpY2ggY2FuIHJldHVybiBmdXR1cmUgZmVhdHVyZQo+ID4gZmxhZ3MuCj4KPiBUaGUgdXNl
cnNwYWNlIHBhdGNoIGRvZXNuJ3QgdXNlIHRoaXMgLSBhbmQgdGhlcmUncyBubyBpbmRpY2F0aW9u
IG9mCj4gd2hhdCBpdCdzIGludGVuZGVkIHRvIGFsbG93IGluIHRoZSBmdXR1cmUuIEkgbWlzc2Vk
IHRoZSBkaXNjdXNzaW9uCj4gYWJvdXQgaXQsIGRvIHlvdSBoYXZlIGEgbGluaz8KClllYS4gU29y
cnksIEl0IHdhcyBmZWVkYmFjayBJIGdvdCB2aWEgSVJDLiBJZiB5b3VyIGN1cmlvdXMgdGhlIGly
YyBsb2cKY2FuIGJlIGZvdW5kIGhlcmU6CiAgaHR0cHM6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3Jn
L35jYnJpbGwvZHJpLWxvZy8/Y2hhbm5lbD1kcmktZGV2ZWwmaGlnaGxpZ2h0X25hbWVzPSZkYXRl
PTIwMTktMTAtMzAmc2hvd19odG1sPXRydWUKCj4gVGhlIG5ldyB6ZXJvaW5nIHN0dWZmIGFsbCBs
b29rcyBnb29kIHRvIG1lIC0gc28gd3J0LiB0aGF0IHlvdSBjYW4gYWRkCj4gYmFjayBteSByLWI7
IHdvdWxkIHN0aWxsIGxpa2UgdG8gZ2V0IHNvbWUgY2xhcmlmaWNhdGlvbiBvbiB0aGUKPiBnZXRf
ZmVhdHVyZXMsIHRob3VnaC4KCkZyb20gRGFuaWVsJ3MgZmVlZGJhY2sgaXQgc291bmRzIGxpa2Ug
SSdsbCBkcm9wIHRoZSBlbXB0eSBnZXRfZmVhdHVyZXMKaW9jdGwgdGhlbi4KCj4gQ291cGxlIG9m
IHR5cG9zIGJlbG93LgoKQXBvbG9naWVzIGZvciBteSBiYWQgc3BlbGxpbmchIFRoYW5rcyBmb3Ig
dGhlIGNvbnRpbnVlZCBhdHRlbnRpb24gYW5kIHJldmlldyEKLWpvaG4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
