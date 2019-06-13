Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 049EB44DCD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 22:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A6E892D4;
	Thu, 13 Jun 2019 20:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DEE892CB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:50:19 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id l125so324483vsl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cHWysB/jHtnOrr6FV5hr+dNnXp1M6Ks26rI+1BDvzTY=;
 b=GlBkPtpseqcRNM8YHtzS9BJB/3n8Fx+oXWgPYY7cT5iwB3mQoTgAR70NVXi0em9lQD
 DK8QiUHmNphWtJ0Fd50RBKshETtAZGEpmCV3ZBmR+tG0fGEnNT4OfcFnQIWgLjQGUXJL
 uzwCgU+gK0mXa/fTfwkAhn31S56zsLiRDfs0YjpwRmlRgOxmRWn7/DaiCitjAbHeKbS2
 /EPMPILyQkkL2j7TSNRjEJURdsvoRWQWy+EYFl0zRBZI748ECmnEsvutJPuoX2mutLA3
 20+EXWjEcOU5BuX82LNYfVDFLt6oUMrC9mH0NDm/AGzdDjxUprtESd/vfXJnoxD3KOEZ
 8jxg==
X-Gm-Message-State: APjAAAUsQ3AAnPqrs+HVonY0d73m5pzfitLI8IoKurPbqucM+FSAyDqf
 OZLcn7Z8HwtJtAJZB5R+5Pu1VNcYi65Vp8w7+s1PIw==
X-Google-Smtp-Source: APXvYqyxW4oWXHnQSQVdB4KZO7je6r0VKz0Ag3aK7Qp7NyWu1upUqXLN8pdjDzWPwvsOcCybbVu+WMyWVgNhK6Tk9Js=
X-Received: by 2002:a67:7a09:: with SMTP id v9mr16707518vsc.43.1560459018585; 
 Thu, 13 Jun 2019 13:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
In-Reply-To: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
From: Sean Paul <sean@poorly.run>
Date: Thu, 13 Jun 2019 16:49:43 -0400
Message-ID: <CAMavQKLFSqb7nW1UsxutbGMQ9AM_ZXTVhrdzPsN3rJXLTnyGkQ@mail.gmail.com>
Subject: Re: Cleanup of -Wunused-const-variable in
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
To: Nathan Huckleberry <nhuck@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=cHWysB/jHtnOrr6FV5hr+dNnXp1M6Ks26rI+1BDvzTY=;
 b=NrkIHzxgwj712cqcmd4BWBogyg4KotNOn/xwJu4T4SJYa0aT06jZvV8tc0ubk35DGJ
 qkQ8F8BPbny84JMnl43hOf6hmviKQu5prWSr0pUE1lNR/k9KO9ZcMnCqWC2bdyf6n1ay
 Gyx/El3pEfvNT8Ar4ISdJZUL12VUpPvPEkxKv2Y4aL4BZC/d0Hpwa8kt4gSCNJD7sEhO
 OX7gQfhbqU4U0ja/6RQXALJbVbsdWjlap1t0MyjjhzSZPotS8oDzFoVuAwrCMCg9t18o
 ieUVvgeFjphrFLsTcaSlbt5XsJ+RGN+5UGR2YmWs1+9lCv7J8UMN2kblv0dBhENd17vn
 Wz2w==
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
Cc: Dave Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux@googlegroups.com, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgNDoxMyBQTSBOYXRoYW4gSHVja2xlYmVycnkgPG5odWNr
QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gSGV5IGFsbCwKPgo+IEknbSBsb29raW5nIGludG8gY2xl
YW5pbmcgdXAgaWdub3JlZCB3YXJuaW5ncyBpbiB0aGUga2VybmVsIHNvIHdlIGNhbgo+IHJlbW92
ZSBjb21waWxlciBmbGFncyB0byBpZ25vcmUgd2FybmluZ3MuCj4KPiBUaGVyZSBhcmUgc2V2ZXJh
bCB1bnVzZWQgdmFyaWFibGVzIGluIGRwdV9mb3JtYXRzLmMKPiAoJ2RwdV9mb3JtYXRfbWFwX3Rp
bGUnLCAnZHB1X2Zvcm1hdF9tYXBfcDAxMCcsCj4gJ2RwdV9mb3JtYXRfbWFwX3AwMTBfdWJ3Yycs
ICdkcHVfZm9ybWF0X21hcF90cDEwX3Vid2MnKS4KPiBUaGV5IGxvb2sgbGlrZSBtb2RpZmllcnMg
dGhhdCB3ZXJlIG5ldmVyIGltcGxlbWVudGVkLiBJJ2QgbGlrZSB0bwo+IHJlbW92ZSB0aGVzZSB2
YXJpYWJsZXMgaWYgdGhlcmUgYXJlIG5vIHBsYW5zIG1vdmluZyBmb3J3YXJkIHRvCj4gaW1wbGVt
ZW50IHRoZW0uIE90aGVyd2lzZSBJJ2xsIGp1c3QgbGVhdmUgdGhlbS4KCldlIGNhbiBwcm9iYWJs
eSByZW1vdmUgdGhlbSBmb3Igbm93IGFuZCBpZiBzb21lb25lIHdhbnRzIHRvIGFkZApzdXBwb3J0
LCB0aGV5IGNhbiBkcmVkZ2UgdGhlbSBiYWNrIHVwLgoKU2VhbgoKCj4KPiBodHRwczovL2dpdGh1
Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy81MjgKPgo+IFRoYW5rcywKPiBOYXRo
YW4gSHVja2xlYmVycnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
