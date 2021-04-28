Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD4C36CFFA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 02:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ADC6EA3B;
	Wed, 28 Apr 2021 00:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA076EA3B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 00:27:11 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id u20so70248192lja.13
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 17:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2a4y88/F8W7qUoEwL5UNyDw7aPSVIQ4F7yZZlcOOYM8=;
 b=HaEd5IVFmRBlWEGN2OKvouixEKl8O4cOmn9sjZ16iCZMBhMBTb/8hTEWv3vcfrg9V3
 GSTO7KXJTl0M/ClGPkiRNrjkMlcF25Pul2TK+um4uf/geHFKoZRmzaiA1kCZOJ1TWtGm
 VocidabqBjm2Tzgp2nKgm+xe/krglqpHpwy9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2a4y88/F8W7qUoEwL5UNyDw7aPSVIQ4F7yZZlcOOYM8=;
 b=XYY8ptdHhNBQUFPkGvIYXb7nikG9ZIY0y12pWdK3MnN/UwcPpK87BpTbdNCVzCR0Hg
 Tcl5xVbBHJiFWvKgQ05XUXgxj0yBfMbf30X2+TvGz6SYR1eQxQfgVv3BId59+cFEESpm
 wECoVwUw86naXvAlt2yEooPPY9L9CuH+OpTW5D62IfUhpo+dR2xmAi/62Z/veOGXcIXj
 S4dNFBilCuSYNLXoUagzeRAUmrUaD0tDbHHB3Ix3523AvXZwnzY0j+VpxwNxw1Ds0/g1
 WnXZNyjUMLhp6ZFb0BoGJG5b8S8KqL5MyOb0r3/1SFRBIyrUqdoJT+liIougcE53FTiK
 eNIw==
X-Gm-Message-State: AOAM53188HiHKA0WxRu+Dy3Y4zRM9CPY86Lvx15T0mGjAYwVUSvAsqXK
 9MxBNnLUaHi1OwaO+tXlmPUVKwBB4zvXRa32
X-Google-Smtp-Source: ABdhPJwWNQw6N80Pzbad2DF4Z0xv4ntDZAtnYCka8nMUc8C96NiU3p3KSY1lBkpR6YuLH3nURimf8w==
X-Received: by 2002:a2e:a71e:: with SMTP id s30mr17985868lje.137.1619569629836; 
 Tue, 27 Apr 2021 17:27:09 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id j16sm310636lfk.199.2021.04.27.17.27.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 17:27:09 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id j10so3243688lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 17:27:09 -0700 (PDT)
X-Received: by 2002:ac2:51ae:: with SMTP id f14mr13482160lfk.377.1619569629081; 
 Tue, 27 Apr 2021 17:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyKdGHyiRLDooKrMf=02GtNn8U4YfF4dJtXdabnVAGdXQ@mail.gmail.com>
 <CAHk-=whOOVBBuQceJ9D9uZrv-QOUWGMQ4aZe2K+2X24o7xA8cg@mail.gmail.com>
In-Reply-To: <CAHk-=whOOVBBuQceJ9D9uZrv-QOUWGMQ4aZe2K+2X24o7xA8cg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 27 Apr 2021 17:26:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=whZN6zfnOTYmrUvur-+Mw8UOBpQxuhCJQ-R7J9zwsGwBA@mail.gmail.com>
Message-ID: <CAHk-=whZN6zfnOTYmrUvur-+Mw8UOBpQxuhCJQ-R7J9zwsGwBA@mail.gmail.com>
Subject: Re: New warnings with gcc-11
To: Dave Airlie <airlied@gmail.com>, Jani Nikula <jani.nikula@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjcsIDIwMjEgYXQgNDo0MyBQTSBMaW51cyBUb3J2YWxkcwo8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gSSB0aGluayBJIHdpbGwgbWFrZSB0aGUg
YXJndW1lbnQgdHlwZSB0byBpbnRlbF9wcmludF93bV9sYXRlbmN5KCkgYmUKPiBqdXN0ICJjb25z
dCB1MTYgd21bXSIgZm9yIG5vdywganVzdCB0byBhdm9pZCBzZWVpbmcgYSB0b24gb2Ygc2lsbHkK
PiB3YXJuaW5ncy4KCkFmdGVyIGZpeGluZyB0aGUgdHJpdmlhbCBvbmVzLCB0aGlzIG9uZSByZW1h
aW5zOgoKICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmM6IEluIGZ1bmN0
aW9uCuKAmGludGVsX2RwX2NoZWNrX21zdF9zdGF0dXPigJk6CiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcC5jOjQ1NTQ6MjI6IHdhcm5pbmc6CuKAmGRybV9kcF9jaGFubmVs
X2VxX29r4oCZIHJlYWRpbmcgNiBieXRlcyBmcm9tIGEgcmVnaW9uIG9mIHNpemUgNApbLVdzdHJp
bmdvcC1vdmVycmVhZF0KICAgNDU1NCB8ICAgICAgICAgICAgICAgICAgICAgIWRybV9kcF9jaGFu
bmVsX2VxX29rKCZlc2lbMTBdLAppbnRlbF9kcC0+bGFuZV9jb3VudCkpIHsKICAgICAgICB8Cl5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmM6NDU1NDoyMjogbm90ZTogcmVmZXJl
bmNpbmcKYXJndW1lbnQgMSBvZiB0eXBlIOKAmGNvbnN0IHU4ICrigJkge2FrYSDigJhjb25zdCB1
bnNpZ25lZCBjaGFyICrigJl9CiAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYzozODoKICAuL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaDoxNDU5OjY6IG5vdGU6IGluIGEgY2FsbCB0byBmdW5jdGlvbgrigJhkcm1fZHBfY2hhbm5l
bF9lcV9va+KAmQogICAxNDU5IHwgYm9vbCBkcm1fZHBfY2hhbm5lbF9lcV9vayhjb25zdCB1OCBs
aW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSwKICAgICAgICB8ICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn4KCmFuZCBJJ20gbm90IGZpeGluZyB0aGF0IG9uZSwgYmVjYXVzZSBpdCBhY3R1
YWxseSBsb29rcyBsaWtlIGEgdmFsaWQKd2FybmluZywgYW5kIGRvZXNuJ3QgaGF2ZSBhbiBvYnZp
b3VzIGZpeC4KClRoYXQgImVzaVtdIiBhcnJheSBpcyAxNCBieXRlcyBpbiBzaXplIChEUF9EUFJY
X0VTSV9MRU4pLiBTbyB3aGVuIGl0CmRvZXMgdGhhdCAiJmVzaVsxMF0iIGFuZCBwYXNzZXMgaXQg
aW4gYXMgYW4gYXJndW1lbnQsIHRoZW4gb25seSA0CmJ5dGVzIHJlbWFpbiBvZiB0aGUgYXJyYXku
CgpBbmQgZHJtX2RwX2NoYW5uZWxfZXFfb2soKSBzdXBwb3NlZGx5IHRha2VzIGEgImNvbnN0IHU4
Cmxpbmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJWkVdIiwgd2hpY2ggaXMgNiBieXRlcy4KClRo
ZXJlIG1heSBiZSBzb21lIHJlYXNvbiB0aGlzIGlzIG9rLCBidXQgaXQgZG9lcyBsb29rIGEgYml0
IGZpc2h5LCBhbmQKdGhlIGNvbXBpbGVyIHdhcm5pbmcgaXMgYXBwcm9wcmlhdGUuCgogICAgICAg
ICAgICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
