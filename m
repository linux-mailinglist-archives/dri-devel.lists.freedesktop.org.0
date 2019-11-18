Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 647881003DD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 12:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161DD6E05A;
	Mon, 18 Nov 2019 11:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054E06E05A;
 Mon, 18 Nov 2019 11:26:10 +0000 (UTC)
Received: from localhost (unknown [89.205.134.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F9052068D;
 Mon, 18 Nov 2019 11:26:09 +0000 (UTC)
Date: Mon, 18 Nov 2019 12:26:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 12/15] drm/tee_shm: Drop dma_buf_k(unmap) support
Message-ID: <20191118112607.GC156486@kroah.com>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-13-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118103536.17675-13-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574076370;
 bh=zPUp5FG3C11nvzPjf4ZC8KrGYAzq08zL4/qbQGmiyqw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WYXIApdMbYi5qPchcNkUhRwsYdjjGgwBBwmFCbFAwNi0hHH4qnS7Tx17pY/L9D1KQ
 jIN+isMiXRjQue/9nP2kO2gZdB/6GS3xFgTElTnOBvue/OKe18HoAE2o2BYXHUP4tU
 r3B99OAkWTWTCXgPII+YxboQ9Jbffr4QCMPfcgLE=
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, tee-dev@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
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
IC1EYW5pZWwKCkFja2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
