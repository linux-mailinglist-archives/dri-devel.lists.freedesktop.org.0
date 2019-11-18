Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03201101AE2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BD96EB76;
	Tue, 19 Nov 2019 08:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EE489740
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:02:34 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id i26so13614840lfl.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 04:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9zemU0Ret8hy73TuASMPdNzZzCjITdClWv1i4Z7fGh8=;
 b=C3PAaxgfrKBrW568pDFXyeyGrKYyQlFazzCe4Xa1uISJwxwlkrrkVqoiVveqCYCpe+
 R91FihZnaGYSZJjpph7eeHejat5vpqGTHCUfUoNpY07mM7zWUXkUoCI/qTbppRV2DOXC
 oBijPEvKQBkdZ+IHpyV1JKr4DtoCfvUewMWQN/qD4W5BjcfUzcefrqiD/VxF5Os6rYaS
 nUw7M3xgT9zN/UGkLKhfaAMNn/cOc3OyAAyUZy43RcPnu7Zvl95v3YrsK3ZLUzF5tMyr
 v8Pg29cf+mUDyeU2Kak4/ctuejGuuXTrZrtBUN82jqQGvYxb28HEDCdBCm+Fq2p4y137
 jclQ==
X-Gm-Message-State: APjAAAXJpceeNPMBaC8mzrPVQ1kvrGcjsOTF+bx6Tn0MypBqzdEex2xO
 6FndlCwKbjmOEG8P5oZWR/X1cg==
X-Google-Smtp-Source: APXvYqyUEv8dyYpl2Gdm4JIZ6XKFL+s2//7LyWv6qU0qfhlsxxj40NBWfsMTGqlqft6/fQUxx1Iukg==
X-Received: by 2002:ac2:5c4e:: with SMTP id s14mr20516359lfp.23.1574078551394; 
 Mon, 18 Nov 2019 04:02:31 -0800 (PST)
Received: from jax (h-249-223.A175.priv.bahnhof.se. [98.128.249.223])
 by smtp.gmail.com with ESMTPSA id q20sm8500681ljg.104.2019.11.18.04.02.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Nov 2019 04:02:30 -0800 (PST)
Date: Mon, 18 Nov 2019 13:02:28 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 12/15] drm/tee_shm: Drop dma_buf_k(unmap) support
Message-ID: <20191118120227.GA25677@jax>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-13-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118103536.17675-13-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9zemU0Ret8hy73TuASMPdNzZzCjITdClWv1i4Z7fGh8=;
 b=OhMUMSWA889W5wvOc/J6XRdF0ZzWI4eQ7m+jVmcdiyT1aVWDJo1wiXarH+V0+J042v
 IteeAo0TdSUmw0t4FMTt6qw/je/LY7CXNw64GxzzcY0uIwMIpabYc39G2DKSKmwTKdJo
 c2mW1joJgzZO0mcsfd3qTyATNJ4L4L66LpBI9u5fq2e3E2D/eYqXa6jk3hF3rJYHvm0B
 dfHFbvfBlHwpuDWAqLbgSNGFclkmIZx1A8CrPNDmZ6hW0MIZSktFHJIqSdn3i23OilbT
 RCdtl2ba1w7iLnsI41Wvru79zKVZLmg5q+tbPN6S4WBg8wvfkU4X/2sN3NgfxTt4y+dH
 itWA==
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, tee-dev@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTE6MzU6MzNBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGVyZSdzIG5vIGluLXRyZWUgdXNlcnMgYW55bW9yZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogQXJuZCBC
ZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4KPiBDYzogSmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVy
QGxpbmFyby5vcmc+Cj4gQ2M6IHRlZS1kZXZAbGlzdHMubGluYXJvLm9yZwo+IC0tCj4gQWNrIGZv
ciBtZXJnaW5nIHRoaXMgdGhyb3VnaCBkcm0gdHJlZXMgdmVyeSBtdWNoIGFwcHJlY2lhdGVkLgo+
IC1EYW5pZWwKCkFja2VkLWJ5OiBKZW5zIFdpa2xhbmRlciA8amVucy53aWtsYW5kZXJAbGluYXJv
Lm9yZz4KCkNoZWVycywKSmVucwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
