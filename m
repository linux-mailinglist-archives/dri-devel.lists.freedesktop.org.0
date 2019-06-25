Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 400245589D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDCD6E20F;
	Tue, 25 Jun 2019 20:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1102D6E20F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:18:25 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 81so10035844pfy.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C3759lLg28N5SzA+DaR8TOro6guhAa3AkyxeMVNWlaA=;
 b=eehxBsPAmC7RbQu2OAQ+jLER6jWHkBskl+sIHCVPGkCAJBJ4jXWyosa2VlssF6pOoT
 74ANTWJraswosKPUeVvMh0WcBJ0GxGT2KWYyzkpFrrGOJjZBpGBLIhgidYuw3UQeQowT
 BRbbEIm4I9ErJCxOpqy/rPaH2MhsATxvA2pMsyIvgP+uofMflhGhOlVq8wHq/Z3sOXh1
 OgbptMxNwoV37vB7TP7MWBMm8gd7AXoDgSOGXi6PXZheEIaLnN6BaIzt1/pqTB05eMXp
 GEiRy6BerwEirn5U3GR8mxTq6UE8ZMvQBRVohI0wtjSOh4ecKGVruXhqFoAMVo4VyhFL
 qqbg==
X-Gm-Message-State: APjAAAXPEPSpg9y70cCyw7YqdQQhZ3KEC1WHsDveAjXKGCUxNdb7taNd
 erQOCDNc6QMlRqDmzJeU4EDHPQ==
X-Google-Smtp-Source: APXvYqwGPlu4RGTZXOO9Hg/R9LKbkgnouJNijjTn5OH6GixTNWAzeh5U8DZXqqavq0InyO3HJemICA==
X-Received: by 2002:a65:42cd:: with SMTP id l13mr39845860pgp.72.1561493904625; 
 Tue, 25 Jun 2019 13:18:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h62sm20824588pgc.54.2019.06.25.13.18.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Jun 2019 13:18:23 -0700 (PDT)
Date: Tue, 25 Jun 2019 13:18:22 -0700
From: Kees Cook <keescook@chromium.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
Message-ID: <201906251312.5059C51334@keescook>
References: <20190625160103.GA13133@embeddedor>
 <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
 <201906251029.08B862130@keescook>
 <9c0d4ed622d6b8e47e040d398f764d52a9ac396d.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c0d4ed622d6b8e47e040d398f764d52a9ac396d.camel@perches.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=C3759lLg28N5SzA+DaR8TOro6guhAa3AkyxeMVNWlaA=;
 b=DBNWTvbkUEl+Q82QyMlUAQZxbfMrPJ21nxvTJc4A4oyXIBct+mV2AWriOS8GrtDjct
 fQ/AWfICuixUtS077KPF0Fam3new/bWEO5cg2HUyNMzH2e6PhYunULc3SmTZ4/V38o+3
 AV5a0gsaJhdI4JNfpn96j+xOPq6/exWqVlEf4=
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
Cc: linux-fbdev@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6NDk6MDFBTSAtMDcwMCwgSm9lIFBlcmNoZXMgd3Jv
dGU6Cj4gT24gVHVlLCAyMDE5LTA2LTI1IGF0IDEwOjMxIC0wNzAwLCBLZWVzIENvb2sgd3JvdGU6
Cj4gPiBPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCAwOTo1MjoyM0FNIC0wNzAwLCBKb2UgUGVyY2hl
cyB3cm90ZToKPiA+ID4gT24gVHVlLCAyMDE5LTA2LTI1IGF0IDExOjAxIC0wNTAwLCBHdXN0YXZv
IEEuIFIuIFNpbHZhIHdyb3RlOgo+ID4gPiA+IEluIHByZXBhcmF0aW9uIHRvIGVuYWJsaW5nIC1X
aW1wbGljaXQtZmFsbHRocm91Z2gsIG1hcmsgc3dpdGNoCj4gPiA+ID4gY2FzZXMgd2hlcmUgd2Ug
YXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCj4gPiA+IFtdCj4gPiA+ID4gVGhpcyBwYXRj
aCBpcyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxlCj4gPiA+ID4gLVdpbXBs
aWNpdC1mYWxsdGhyb3VnaC4KPiA+ID4gCj4gPiA+IEp1c3QgZW5hYmxlIHRoZSB0aGluZyBhbHJl
YWR5Lgo+ID4gCj4gPiBMaW51cyBoYXMgYmVlbiBwcmV0dHkgY2xlYXIgYWJvdXQgbm90IHdhbnRp
bmcgd2FybmluZyBvcHRpb25zIGVuYWJsZWQKPiA+IHdpdGhvdXQgZmlyc3QgZml4aW5nIGFsbCB0
aGUgY2FzZXMgaXQgd2FybnMgYWJvdXQgZmlyc3QuCj4gCj4gSGV5IEtlZXMuCj4gCj4gSSBkb24n
dCByZWNhbGwgdGhhdCBwYXJ0aWN1bGFyIHRpZGJpdC4gIEdvdCBhIGxpbms/ICAKCkl0IHdhcyBz
cHJlYWQgb3V0IG92ZXIgdGhlIGRpc2N1c3Npb24gYXJvdW5kIHJlbW92aW5nIF9fZGVwcmVjYXRl
ZCwKYWJvdXQgZW5hYmxpbmcgLVd2bGEsIGFuZCBpbiBwZXJzb24gYXQgdGhlIGtlcm5lbCBzdW1t
aXQgd2hlbiBhc2tpbmcKd2hhdCBhcHByb2FjaCB0byB0YWtlIGZvciAtV2ltcGxpY2l0LWZhbGx0
aHJvdWdoLgoKLS0gCktlZXMgQ29vawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
