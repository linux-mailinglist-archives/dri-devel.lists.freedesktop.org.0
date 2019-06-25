Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFB0555EB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 19:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4916E165;
	Tue, 25 Jun 2019 17:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3317A6E165
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 17:31:28 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id n2so9280465pgp.11
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 10:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cyylc5vV7TsZGRDCyy7xYsgD/ATtR25Cso04lfIPhzc=;
 b=bXLhM/gIpOP5l5+2hPnNW+RfibK4yPvbqjfTedQbIuzyPjMLU9zqUuP0K8fGyUBalE
 OVIknjMiU4vNwG19yUWoIIXP2rmKsX8LSi7IAzJ8ksIgpbGHp3T4IQqQhCG5YMR5wCcD
 wVaPObDnarzHuQeMV/lhD3GbmdHJG9yeaYVC3+bmJGbzBirkiMuA0Mbbrrag0wf7bhii
 Q8TtJTXEEyxyQDTIA5CZqBQZIEIvwkomYC7sXra1RQ1r6sT3qaGW6SrqZH2UhSCSjXnQ
 k0BgO9yib/nj2vTWgO4Q9CIYwOT2s+Pryb/5ucCQnBfBVGFx6xFXmFsMA2aItphmKFGs
 kU2g==
X-Gm-Message-State: APjAAAU/OqApA4dmWjdihCaZs9M2Lwt+xVcg29Fs8pyAOQEogXegVF9D
 +EE1tAJjcT5S5tjunM7UEOdFMQ==
X-Google-Smtp-Source: APXvYqyKVQEdx2DSisDXree3EW2eyfv9LAskBegykfDifXWazmrgiKraekkPr5majzLrVW1Vhcny7w==
X-Received: by 2002:a63:7150:: with SMTP id b16mr1030790pgn.328.1561483887787; 
 Tue, 25 Jun 2019 10:31:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x8sm14704810pfa.46.2019.06.25.10.31.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Jun 2019 10:31:27 -0700 (PDT)
Date: Tue, 25 Jun 2019 10:31:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
Message-ID: <201906251029.08B862130@keescook>
References: <20190625160103.GA13133@embeddedor>
 <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cyylc5vV7TsZGRDCyy7xYsgD/ATtR25Cso04lfIPhzc=;
 b=Bw7MDNV5DpVOVq6ZsemLGJdp/8bE62eloGpw6B6Ewtu1fnalKbBFSV8P/w5xzliMo4
 G1lYQ8FEww9Lh5Frfvnb3KbqG/Hw17/Krc3kHt+w6sLrMmk7iIR1om9tYD+HjpqQsOTl
 epslcpbau6xLSLm3E3FOfJxAXpEON+d00o1CE=
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDk6NTI6MjNBTSAtMDcwMCwgSm9lIFBlcmNoZXMgd3Jv
dGU6Cj4gT24gVHVlLCAyMDE5LTA2LTI1IGF0IDExOjAxIC0wNTAwLCBHdXN0YXZvIEEuIFIuIFNp
bHZhIHdyb3RlOgo+ID4gSW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxs
dGhyb3VnaCwgbWFyayBzd2l0Y2gKPiA+IGNhc2VzIHdoZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8g
ZmFsbCB0aHJvdWdoLgo+IFtdCj4gPiBUaGlzIHBhdGNoIGlzIHBhcnQgb2YgdGhlIG9uZ29pbmcg
ZWZmb3J0cyB0byBlbmFibGUKPiA+IC1XaW1wbGljaXQtZmFsbHRocm91Z2guCj4gCj4gSnVzdCBl
bmFibGUgdGhlIHRoaW5nIGFscmVhZHkuCgpMaW51cyBoYXMgYmVlbiBwcmV0dHkgY2xlYXIgYWJv
dXQgbm90IHdhbnRpbmcgd2FybmluZyBvcHRpb25zIGVuYWJsZWQKd2l0aG91dCBmaXJzdCBmaXhp
bmcgYWxsIHRoZSBjYXNlcyBpdCB3YXJucyBhYm91dCBmaXJzdC4gSWYgdGhhdCdzCmNoYW5nZWQs
IHRoZW4gc3VyZSwgbGV0J3MgZG8gaXQ7IGJ1dCB3ZSB3ZW50IHRocm91Z2ggYSBsb3Qgb2YgY29v
cmRpbmF0aW9uCndpdGggc2ZyIGZvciBsaW51eC1uZXh0IG5hZy1tYWlsIGNvdmVyYWdlICh3aGVy
ZSBtYWludGFpbmVycyBhcmUgbm93CmZpeGluZyBpdCB0aGVtc2VsdmVzKSB3aGVuIHRoaXMgY2Ft
ZSB1cCBkdXJpbmcgdGhlIGxhc3Qga2VybmVsIHN1bW1pdCwKYW5kIHRoaXMgYXBwcm9hY2ggd2Fz
IHRoZSBhZ3JlZWQgc29sdXRpb24uCgotLSAKS2VlcyBDb29rCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
