Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 879F0BFAD5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 23:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F282E6EE0C;
	Thu, 26 Sep 2019 21:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAAA6EE0C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 21:08:50 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q5so187887pfg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 14:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=64FsXztamILPIXBz8vnJFTeQvvjQM5nsSnyBK9zQNDE=;
 b=SlEds2wL8MsNWFw0cLaH73rRv0DDlpD5mWC6YUQfBO8oh4/2NpEACufKArJAJAuuv7
 5Gy5GOCze+TzICQ4vkZf+VhTgfqLD0GdOdUFoN8uCLn9dJxl+qB3Bah8JDkrRJuxOKHH
 2SOiTjWMLnQDxt6k3ENSaJjxEuVtSibsEOKfqHGLxN869Pdb1MsQrJP+AF28XTqo1XjL
 dly9q1RZ617AtGOjKTKUl4r4/zQXaER8HszslTPBX9N14CzXSXMt4DDymIJ4Ec738O8M
 Ln4ex4EIoq5msoqX1q4P5BPgjdgfp9sT6CYbphO5co/HpdaGwpzonyqYOGYoQdPS57nL
 McTw==
X-Gm-Message-State: APjAAAX8fYeDO09jR1De4o3IEVobO4kytUHLH00oZAIohMlHetvtmgVT
 CdeiJObOZ7jacOBIDnAcy9jx3g==
X-Google-Smtp-Source: APXvYqyaILWTkOAOkVKUYUi6ZlBPL4LdbBfWbfkBjK3kyAgmLwz9VTCcpRbN9MZPBQkdiTqonemB4A==
X-Received: by 2002:a63:2aca:: with SMTP id q193mr5417034pgq.156.1569532129545; 
 Thu, 26 Sep 2019 14:08:49 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id g24sm6141171pgn.90.2019.09.26.14.08.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 26 Sep 2019 14:08:48 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RESEND] drm/meson: vclk: use the correct G12A frac max
 value
In-Reply-To: <20190828132311.23881-1-narmstrong@baylibre.com>
References: <20190828132311.23881-1-narmstrong@baylibre.com>
Date: Thu, 26 Sep 2019 14:08:48 -0700
Message-ID: <7hr242kbof.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=64FsXztamILPIXBz8vnJFTeQvvjQM5nsSnyBK9zQNDE=;
 b=k0/9eds+hd+BC79ShHCoMv49nic1Fp/kisQ0HqSB6g8SATniIReUW0nkEZQucE8+ys
 XQFTYS6R6oBJ/u+XIcl5aeONKAdNI+5EjOFF3U4iCNvmeZ4WouwX83itdH2emjOW3qax
 gyvrGOlcwY8LCHMB3a43ud46l9YyZsB6/dJ5pQmv78bIiv7OPJhqEVpwHJsGQw9gN3Ez
 rdnBuYu2A1gVvxYg6gdoh0I4W9c9wnzK4OjrlTT3twucSMbdRPTAtarOL4zTWydNdB+y
 vXD+8LfJy+AASglrdLg80MFsw6vZqrU3G9wW4xDnL9rO8QtDmxociGbah4vAsLUaI/VK
 lgHQ==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IFdoZW4g
Y2FsY3VsYXRpbmcgdGhlIEhETUkgUExMIHNldHRpbmdzIGZvciBhIERNVCBtb2RlIFBIWSBmcmVx
dWVuY3ksCj4gdXNlIHRoZSBjb3JyZWN0IG1heCBmcmFjdGlvbmFsIFBMTCB2YWx1ZSBmb3IgRzEy
QSBWUFUuCj4KPiBXaXRoIHRoaXMgZml4LCB3ZSBjYW4gZmluYWxseSBzZXR1cCB0aGUgMTAyNHg3
NjgtNjAgbW9kZS4KPgo+IEZpeGVzOiAyMDJiOTgwOGY4ZWQgKCJkcm0vbWVzb246IEFkZCBHMTJB
IFZpZGVvIENsb2NrIHNldHVwIikKPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+CgpSZXZpZXdlZC1ieTogS2V2aW4gSGlsbWFuIDxraGlsbWFu
QGJheWxpYnJlLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
