Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBFDDE747
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 10:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9BA89C1F;
	Mon, 21 Oct 2019 08:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9305489C1F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 08:58:49 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t84so10353568oih.10
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 01:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vHm5aiCWjBZcDp2Bwl98Azy6P0t6W/KZgM3mvJs8JD4=;
 b=JEyOTNMeh6C+9SFMOjKOmhzmvfXm7jj7HBTbpsOHNZGwX9hHlTdKyCR/tKf1WNSEmJ
 gbzhxRyzoTp3kMQ5qBSgtszGnYBU8rWkJ9U9VDD6deMASZck6vXAco5VdFgrA/GGDUCL
 JinLtiWv9/z/e0HIgB1/3NJ17/D8sqrNA3Rmcz8yDL0MOzrx6XtDWb+xjTDJjfZozxP6
 SDLXsYFb7OBZO+FhpqiOb4RPEwM1lhVtjb5mbFucj8zPdhhDrwLh41Eq+sLuU4LyDDB5
 eQFJn0ffM6K9+jld+vS54TVxpP9CbrTSspoay9+Vz8fLYL56GgHW6m1JZv8FFKji2Fbf
 PyCw==
X-Gm-Message-State: APjAAAWn1OWNGf35pNbbR7VV+P5459rhsNvNveAzCZishDaeT5KYKjH+
 8SQWwAW1zrJ5sNgEEHYFZl/5NL9meH22J19Rwkc=
X-Google-Smtp-Source: APXvYqyXTokJWyBMaZ88VOmxihiwckill/n3woDR/VvkpjBpxZoQqjk2dhcSLUIPO7UaBfRoPXVw4wI5oluDYGAEBbM=
X-Received: by 2002:aca:4bd2:: with SMTP id
 y201mr18811305oia.102.1571648328675; 
 Mon, 21 Oct 2019 01:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
 <20191016085548.105703-8-jacopo+renesas@jmondi.org>
In-Reply-To: <20191016085548.105703-8-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Oct 2019 10:58:37 +0200
Message-ID: <CAMuHMdW-JYTRAi86NF4sFq-qSqrYkK9HTteRbRC8QUKjeKs+9Q@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] arm64: dts: renesas: Add CMM units to Gen3 SoCs
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
Cc: Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMTA6NTUgQU0gSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVu
ZXNhc0BqbW9uZGkub3JnPiB3cm90ZToKPiBBZGQgQ01NIHVuaXRzIHRvIFJlbmVzYXMgUi1DYXIg
R2VuMyBTb0MgdGhhdCBzdXBwb3J0IGl0LCBhbmQgcmVmZXJlbmNlIHRoZW0KPiBmcm9tIHRoZSBE
aXNwbGF5IFVuaXQgdGhleSBhcmUgY29ubmVjdGVkIHRvLgo+Cj4gU29ydCB0aGUgJ3ZzcHMnLCAn
cmVuZXNhcyxjbW0nIGFuZCAnc3RhdHVzJyBwcm9wZXJ0aWVzIGluIHRoZSBEVSB1bml0Cj4gY29u
c2lzdGVudGx5IGluIGFsbCB0aGUgaW52b2x2ZWQgRFRTLgo+Cj4gUmV2aWV3ZWQtYnk6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBSZXZpZXdl
ZC1ieTogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJk
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25k
aS5vcmc+CgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGds
aWRlci5iZT4KaS5lLiB3aWxsIHF1ZXVlIGluIHJlbmVzYXMtZGV2ZWwgZm9yIHY1LjUuCgpHcntv
ZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
