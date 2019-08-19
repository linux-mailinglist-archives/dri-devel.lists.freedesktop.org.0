Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 099E594D37
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 20:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81736E270;
	Mon, 19 Aug 2019 18:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB8A6E26D;
 Mon, 19 Aug 2019 18:48:45 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id 66so1860969vsz.8;
 Mon, 19 Aug 2019 11:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iMfkqSXJYdIVjen0IhmEsKNmmBOFP8OKL7r4/KZDxtg=;
 b=AnuIELJi+mqLSYBqnvByH6OwFjpykqicTFoIfavqr1IxlrIlQLVdkneFuHwosAwc8V
 2HMLM+aYsmwfeu5fWQnJP2/SYk3qS6O2Rm+x07a4B4bqPxzn7RWCzCQHG/fpIFKw9qtD
 /9p4gw/I3Owd1FBW32JttwH2JyuPR9tRWp27vAGN4X37iya+N60p1YoA31F3Sf3C79fx
 ELjjPwFVZLBwS4/j3uOO0alDS0ckTNDXkT7pQ91HR9LVz/ZZjaMZAkBa92/JBLIRwDyy
 LStkIuAplNvl4u+gmNRHRMJzmb7orU1+4dhEk1D23UXG53EbFxqyMLtbPaFfniM8APkV
 iiAA==
X-Gm-Message-State: APjAAAUWQNz1e7DF3DAYgI6/+7QmMwepPjFqPtOJF/4hlCn5hcpFFJeT
 iYxq0eDDyCH0fBbKyxCsbBzroLCeP6Mtq5eT1oE=
X-Google-Smtp-Source: APXvYqydK4ePaGcLT0hgy/Z1xOFgv99CMq2otPwkcIIwSU76H/3dbiRM/zt5rBTbWchHjmUEj0FeniEaYXmGVcXO4tc=
X-Received: by 2002:a67:fe4e:: with SMTP id m14mr14618182vsr.34.1566240524317; 
 Mon, 19 Aug 2019 11:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190819171900.4501-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190819171900.4501-1-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 19 Aug 2019 19:48:18 +0100
Message-ID: <CAM0jSHP6waSB3khXo8jtBabhkGZaUcBRDoOO0LyLbqcjQfUCXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Select DMABUF_SELFTESTS for the default i915.ko
 debug build
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iMfkqSXJYdIVjen0IhmEsKNmmBOFP8OKL7r4/KZDxtg=;
 b=HTxNlzOGZORvJ4xSLKHmKl6cN+lvVzREB7GZU2eBWrd0lzKmdfHogUCs4RIG61ColB
 wYQsuPr57MvasRNHZoIfxGP8xmylYyg3Cm00YqnliYisKqz2qfbnkyDVdnOk5QvL/Lfl
 OWg7OVwxmDmp3GE3BOq6SPFI7lIpOU41A0V2ezt9ejoXhTK53r4lMZnEI/jERy4ZNQUv
 gq6OEvdVwAECsjPK6so2B4ovwB8lGyXje7GnnxPpIRpW1PWYKRHvVcfb3YtBw/d/y/lc
 qtnN29ASFoN64vMsoJFXUC+AFaiDOIc7oD/rxGa3M4mMZr218CSZZyKcRwz1srkUQtVh
 w/7w==
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
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxOSBBdWcgMjAxOSBhdCAxODoxOSwgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+IHdyb3RlOgo+Cj4gSW5jbHVkZSB0aGUgRE1BQlVGX1NFTEZURVNUUyBhcyBw
YXJ0IG9mIHRoZSBzdGFuZGFyZCBidWlsZCBmb3IgSUdULCBzbwo+IHRoYXQgdGhleSBjYW4gYmUg
cnVuIGJ5IGlndC9kbWFidWYKPgo+IFRlc3RjYXNlOiBpZ3QvZG1hYnVmCj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IFRvbWkgU2Fy
dmVsYSA8dG9taS5wLnNhcnZlbGFAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogTWF0dGhldyBBdWxk
IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
