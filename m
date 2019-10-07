Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A390CEACC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812706E62E;
	Mon,  7 Oct 2019 17:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C346E62E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:40:54 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id m7so14624057lji.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 10:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FuxSFcg2OuQS3YtCmLJpooP5dbRHQdaDiCcnNR2ObKE=;
 b=fQJXHA7M21QPcgB5HCbPMnsrBBK3bqfQqaWRE7BesM5SM9tJA3Qh1YonnbKnFw9mhB
 BbazU56Vo3nqvjfqacxildoMUnZdCmFoEqKRDrMJUWnsecVCVW9HCSn5wc1qqDQBodiZ
 sNwQ9zDX4DvxVc7hGtT8TJJn6X3kqEk4jUlMXmhJp/o6I7TXgMiV/9uoeo83kfH+Pg0Y
 HLFUW917EdF/M2WlcJpZLf3TcLG0hXhI4mGevjC1Vfdai/q61z6afXIQd0M4HJ6YFKyq
 woE0eaA9ceTCTbaHh2q4dSbLEQUxquO1yNqteuK2WVg43jFLvlrkh2R6BMyqXh08okPN
 bR5w==
X-Gm-Message-State: APjAAAUqHTPnggB/WJP9Za4aj3Y2tkysY9BibRo6vrVg0ZcFggucDknd
 E3jl5HkyuJr2+rLXlxKtDU3CUjExc/3rFLueXSL+2jU0v9k=
X-Google-Smtp-Source: APXvYqwbp23/w1OwPWlFe4JQXwsY1Ks1AIk4dzEV/8gyZQsc9eyqJX0KNUmFXtgX7hBYQMP9UVlCE+G4rWLTus7ZNaE=
X-Received: by 2002:a2e:810e:: with SMTP id d14mr19627364ljg.160.1570470052967; 
 Mon, 07 Oct 2019 10:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <87y2xzqimw.fsf@keithp.com>
 <CAPj87rM5f1v9ETPJ3KhA7gQKKQoxhqbUx3at5Xi75+5nFQ79Sg@mail.gmail.com>
In-Reply-To: <CAPj87rM5f1v9ETPJ3KhA7gQKKQoxhqbUx3at5Xi75+5nFQ79Sg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 7 Oct 2019 18:40:38 +0100
Message-ID: <CAPj87rMpSnzOjgk2whjNEi__SY+Jnvv+JjPL6AR7LV+uBy=8Zg@mail.gmail.com>
Subject: Re: liboutput: thoughts about shared library on top of DRM/KMS
To: Keith Packard <keithp@keithp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FuxSFcg2OuQS3YtCmLJpooP5dbRHQdaDiCcnNR2ObKE=;
 b=oPX3SSX+ew7irNhYRzlpITEJ4u2+/2RAgOa5zO55N7H9OyQa1cq2fadLu3j8VlFDBs
 BpHi2A3iC4/hrV7qfRWEwqoTNd6cewOXLYPLQ7pX6LT7otoOYlagE92tddSbdha3UFgC
 MUMoDq9i3TnPGOuReCmBjs6v4a5OheS04mpC7Twz5EIieUhqonQ1vd3GPYSGRVdNzYuG
 xnhNXibfCQR6tMYd7eoNgh/aWUkIdu2SkjmtySYpkWhePTzseXyVPari0rFttIGIOLPJ
 JfSFxhCuqXJA/Ogyl3CLTah6f+cPoTC1Jv5HHs9R495f3OjVUoXF3vhqLbMBFTzgtqWv
 j9Kg==
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBNb24sIDcgT2N0IDIwMTkgYXQgMTg6MzUsIERhbmllbCBTdG9uZSA8ZGFuaWVsQGZv
b2lzaGJhci5vcmc+IHdyb3RlOgo+IFRoZXJlIGFyZSBkZWZpbml0ZWx5IGEgZmV3IGFubm95aW5n
IHByb2JsZW1zIHdoaWNoIHdlIHNob3VsZCBoYXZlCj4gY29tbW9uIHJlc29sdXRpb24gZm9yLiBJ
J20gdGhpbmtpbmcgb2Y6Cj4gICAtIFsuLi5dCgpPaCwgYW5kIGFkZCBiYWNrbGlnaHQgaGFuZGxp
bmcgdG8gdGhhdCBsaXN0LgoKQ2hlZXJzLApEYW5pZWwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
