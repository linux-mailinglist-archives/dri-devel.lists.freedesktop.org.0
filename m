Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED5482699
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 23:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D682B6E162;
	Mon,  5 Aug 2019 21:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E62D6E162
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 21:10:41 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0E3320B1F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 21:10:40 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id y26so82451421qto.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 14:10:40 -0700 (PDT)
X-Gm-Message-State: APjAAAX7GbAIL/R3XYc2JGNuOFHk5c9lpt9xCnWU1NNL5DXhfZochYlG
 n8CEqjnu0SV5B/yTQ01uQEIz1G6p/dL3Ii6tYg==
X-Google-Smtp-Source: APXvYqxSQjxS8IOQprXQJxqRfjHW7fCdjL/oZSDlYGNvI4PBLqrk9CDWG5ZsdBVS6O3fHPeUkcY1k98yogInm910WSk=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr122430qth.136.1565039440034; 
 Mon, 05 Aug 2019 14:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190802195150.23207-1-robh@kernel.org>
 <104f5aea-5b9f-1ce9-8b36-c3b64daa6eda@collabora.com>
In-Reply-To: <104f5aea-5b9f-1ce9-8b36-c3b64daa6eda@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 Aug 2019 15:10:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLOtsGNROeesH9pY661NXknhrwsNMGDD9rJLh5XUoQC9Q@mail.gmail.com>
Message-ID: <CAL_JsqLOtsGNROeesH9pY661NXknhrwsNMGDD9rJLh5XUoQC9Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] drm/panfrost: Add heap and no execute buffer
 allocation
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565039440;
 bh=bFBVNZILdQlgYpHakwBsY+WMPd3J5WBMVeXe/qPXmQo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WpRxS9TsRrQALkohLY4iIEzXtWdF771GU+6paJGddvfJX2YB7Vfnjsoa3Ju+qUrkx
 SijAVvGdEUKgjeTFyKngY57AvF4M6NFnsPakOGRgbqI4xRB7Of+szjEkSyWwaEYErJ
 CLV0mHAIzqUGGYl2FxTVumK4FEe9DlLfoJvJTZNM=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgNSwgMjAxOSBhdCAxMDoxMCBBTSBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9z
b0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IE9uIDgvMi8xOSA5OjUxIFBNLCBSb2IgSGVycmlu
ZyB3cm90ZToKPiA+IFRoaXMgc2VyaWVzIGFkZHMgbmV3IEJPIGFsbG9jYXRpb24gZmxhZ3MgUEFO
RlJPU1RfQk9fSEVBUCBhbmQKPiA+IFBBTkZST1NUX0JPX05PRVhFQy4gVGhlIGhlYXAgYWxsb2Nh
dGlvbnMgYXJlIHBhZ2VkIGluIG9uIEdQVSBwYWdlIGZhdWx0cy4KPiA+Cj4gPiBUb21ldSByZXBv
cnRzIGhlIGhhcyB0ZXN0ZWQgdGhpcyBpbiB0aGUgcGFuZnJvc3QgQ0kuCj4KPiBBbGwgc2VlbXMg
dG8gYmUgd29ya2luZyBmaW5lOgo+Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3Rv
bWV1L21lc2EvcGlwZWxpbmVzLzUzNTkxCgpUaGFua3MgZm9yIHRlc3RpbmcuIElzIHRoYXQgYSBU
ZXN0ZWQtYnk/CgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
