Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B17B4EE73
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 20:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450BF6E910;
	Fri, 21 Jun 2019 18:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6546E90E;
 Fri, 21 Jun 2019 18:12:36 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x4so7443828wrt.6;
 Fri, 21 Jun 2019 11:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nllmu6gOWtwwcwoqjgWDFDPgYF6ZJnhDbkkuvCS+YSo=;
 b=g/HIRYhSoBzZkh3KVGW9bydzM/3Y/kb4dFi6USOkOYiwfcahQ5PWOywCvZ0+VHXf8Y
 JsZo2T4yXnajc1qZ6nOULgABjwrNBKxCKtZpKxu0kRTOnvbPCsFbEhUdH3AT+TEFSvtY
 LEhOKirkoRvu0iQdl36ZQfvoomxyVucvw9ZXVNOPXcUKAOI/oC96TeSe6gPzxkSN1NTj
 OyaAh5q+jvzZEfhJ2o6RyISgLwZObofqZlT1H/lbWrnJovp/rTmzwLT6GsA0h09sWTWN
 otEL0J9L5Meupq08Z62weNnHbxwfwOuSdZ9a4P5L3wgYthmIFY4izQVRTD60CygowEq7
 ujlw==
X-Gm-Message-State: APjAAAVEWHY0+SOBgLJvX42bs+523w2Sc8VM44/7Mog314XLFKO7CvRf
 K4TPci5DgpXrsqUMWkrR2nwZhVhk
X-Google-Smtp-Source: APXvYqyNfWUf+GkgCh4ENW0xosMUYbxInA4KKgnTvibeHQL2Bq4S/t48D2nGg9zCr+ECG80ds15UyQ==
X-Received: by 2002:adf:f1d1:: with SMTP id z17mr42179778wro.190.1561140755600; 
 Fri, 21 Jun 2019 11:12:35 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id u25sm3073216wmc.3.2019.06.21.11.12.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 11:12:34 -0700 (PDT)
Date: Fri, 21 Jun 2019 19:10:26 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH] drm/nouveau: fix bogus GPL-2 license header
Message-ID: <20190621181026.GG21486@arch-x1c3>
References: <20190620001343.11046-1-imirkin@alum.mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620001343.11046-1-imirkin@alum.mit.edu>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nllmu6gOWtwwcwoqjgWDFDPgYF6ZJnhDbkkuvCS+YSo=;
 b=VyZC/Vx7vu2LOOKJMi+VQm84aK0czB0xc7sDlTr9BcApWR8VmtSnfvCG2EGC+UhfYo
 UAHznRPN5vA5aSLnajeTfgbXXh0Hn0chSh/NLXvzaUdjETpd0U2jp/FYaj6cBN4fgzGE
 yW1xNtGRs8rGUjvPpgS4KrA2mvdxczoKRHHkwmoKe0TBsHcYR2AYJycdGTYpuBdTH+nt
 6fXVZ9E2CIcIJLzBYHqMfI1zwcxUC2+NbEii3imNFcvf3F1/4kyQCB5Wi43/W7S0z3NG
 tcIwPuLrjBr7X9PbsUabbQ02Np5HNwTwIYwP2Hw9ICprG/tmZ/bri4GjgPAXa28laLOF
 wTHw==
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
Cc: nouveau@lists.freedesktop.org, bskeggs@redhat.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNi8xOSwgSWxpYSBNaXJraW4gd3JvdGU6Cj4gVGhlIGJ1bGsgU1BEWCBhZGRpdGlv
biBtYWRlIGFsbCB0aGVzZSBmaWxlcyBpbnRvIEdQTC0yLjAgbGljZW5zZWQgZmlsZXMuCj4gSG93
ZXZlciB0aGUgcmVtYWluZGVyIG9mIHRoZSBwcm9qZWN0IGlzIE1JVC1saWNlbnNlZCwgdGhlc2Ug
ZmlsZXMKPiAocHJpbWFyaWx5IGhlYWRlciBmaWxlcykgd2VyZSBzaW1wbHkgbWlzc2luZyB0aGUg
Ym9pbGVyIHBsYXRlIGFuZCBnb3QKPiBjYXVnaHQgdXAgaW4gdGhlIGdsb2JhbCB1cGRhdGUuCj4g
Cj4gRml4ZXM6IGIyNDQxMzE4MGY1IChMaWNlbnNlIGNsZWFudXA6IGFkZCBTUERYIEdQTC0yLjAg
bGljZW5zZSBpZGVudGlmaWVyIHRvIGZpbGVzIHdpdGggbm8gbGljZW5zZSkKPiBTaWduZWQtb2Zm
LWJ5OiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+Cj4gLS0tCj4gCj4gQmVuLCB5
b3UgZGlkIGxpa2UgOTkuNyUgb2YgdGhpcyB3b3JrLCBzbyB1bHRpbWF0ZWx5IHlvdXIgY2FsbC4g
UHJldHR5Cj4gbXVjaCBhbGwgb2YgdGhlc2Ugd2VyZSBzcGxpdCBvdXQgZnJvbSBvdGhlciBNSVQt
bGljZW5zZWQgZmlsZXMsIGFuZCBtb3N0Cj4gYXJlIGhlYWRlciBmaWxlcyBhbnl3YXlzLgo+IApB
bGwgb2YgbXkgZ2xvcmlvdXMgMjMgcGF0Y2hlcyB0byBub3V2ZWF1IGFyZSBtZWFudCB0byBiZSB1
bmRlciBNSVQuCkFja2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNv
bT4KCj4gQW5vdGhlciBjaGFuZ2UgbWlnaHQgYmUgdG8gYWRkIHRoZSBTUERYIGlkZW50aWZpZXIg
dG8gZmlsZXMgKndpdGgqCj4gdGhlIE1JVCBib2lsZXJwbGF0ZSwgYnV0IEkgZGlkbid0IHdhbnQg
dG8gZG8gdG9vIG11Y2ggaGVyZS4KPiAKTm8gb2JqZWN0aW9ucyBvbiBteSBlbmQgOi0pCgotRW1p
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
