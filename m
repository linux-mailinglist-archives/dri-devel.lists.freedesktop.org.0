Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EBB3BB70
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 19:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C1A8915B;
	Mon, 10 Jun 2019 17:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4D78915B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 17:54:32 +0000 (UTC)
Received: by mail-it1-x141.google.com with SMTP id j194so485696ite.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 10:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v6FdiQZHp5OZPrOVykBTb9nULiN8hA8zSaPlurn9O8U=;
 b=JJBnA9jt9JEg9+MZgWEZ3NOSzU1A34rOZbBv1e0qAdXM6djgT52wma76tGwNVIjfmF
 M9R55Ed2D8tssyu03WJc2hxZtG50hdFQowOGkXdQQ58o44/4FHWCFi3ERvD6+dF0biG+
 wBitUBxi81rNjLd/XjOudA7KtQvHdtT3CCt7pFK9D/T4t/VIhz0H3uA0cpNlfEvjnhUY
 06dtPEukoXZwoq2MIVFc0BPR0Wbj6icb0H6Tqs9ZqfqtPR2rrQhee5ilP/U0WjhKhQTJ
 fVCqfEprUTJy1tgr2ZWy2YQeE0qXMCNCCXSF70SIz37Y1iIijPS0RQQQaAxzbv8u3xVZ
 X/DQ==
X-Gm-Message-State: APjAAAUWtf7ILypbizlfCPPqiVVrNBqpJkOXV28NsSEV0ys2fAHXJ57O
 vqp8rg5uiWoNMI5MDcmEzEMifN/ocso=
X-Google-Smtp-Source: APXvYqwnkmuceaRacjCs2WEG8I2BzNJBeZQ0AMuyf4qhP5PQL+K6iocztJAwUm3FDgIVU7XLTRV9Og==
X-Received: by 2002:a05:660c:b0f:: with SMTP id
 f15mr11711863itk.111.1560189272074; 
 Mon, 10 Jun 2019 10:54:32 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50])
 by smtp.gmail.com with ESMTPSA id z138sm86725itc.36.2019.06.10.10.54.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 10:54:31 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id s7so7578529iob.11
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 10:54:31 -0700 (PDT)
X-Received: by 2002:a6b:b642:: with SMTP id g63mr8423074iof.142.1560189271084; 
 Mon, 10 Jun 2019 10:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAK4VdL03VzCyGfmMNoTL6EsDdrprv0Arhp+mueFRWKxJhzA_vg@mail.gmail.com>
 <CAD=FV=UmTK6GFMMqjeO7E4bMO6GGy=fF7PmMiKC+8TwNtRrZ=w@mail.gmail.com>
In-Reply-To: <CAD=FV=UmTK6GFMMqjeO7E4bMO6GGy=fF7PmMiKC+8TwNtRrZ=w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Jun 2019 10:54:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XEA7oc6HGy96H7efZyMHoJPJOYa4DMWBBfJGcOWQjY3g@mail.gmail.com>
Message-ID: <CAD=FV=XEA7oc6HGy96H7efZyMHoJPJOYa4DMWBBfJGcOWQjY3g@mail.gmail.com>
Subject: Re: Pine64+ sun4i-drm Attempting to unwedge stuck i2c bus
To: Erico Nunes <nunes.erico@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=v6FdiQZHp5OZPrOVykBTb9nULiN8hA8zSaPlurn9O8U=;
 b=Lr8wwSu+qAeAD+2Qgg71Gq0sDH4r/dUpDsNlphB2Bj6ROTvuU8jIqyHZ9lhg4KxXWO
 415FUZ7m64B/Z6T6/kqOSXJ/4GhMmknoP4pEf2jHBYKPa4FiisdN4bgHZfC9cZBdERXJ
 jk61VO2M43KZvtCihsxTeenTcIqSd5v+AD1OE=
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
Cc: Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBNb24sIEp1biAxMCwgMjAxOSBhdCAxMDozMiBBTSBEb3VnIEFuZGVyc29uIDxkaWFu
ZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBNb24sIEp1biAxMCwgMjAx
OSBhdCAxMDoyOCBBTSBFcmljbyBOdW5lcyA8bnVuZXMuZXJpY29AZ21haWwuY29tPiB3cm90ZToK
PiA+Cj4gPiBIaSwKPiA+Cj4gPiB1cGRhdGluZyBteSBQaW5lNjQrIHRvIHRoZSBsYXRlc3QgZHJt
LW1pc2MtbmV4dCB0b2RheSAoNDI3MjMxYmM2ZDUpCj4gPiBzdGFydGVkIGdpdmluZyBtZSB0aGUg
QlVHIGFuZCBPb3BzIGJlbG93LiBJdCdzIGNvbnNpc3RlbnRseQo+ID4gcmVwcm9kdWNlYWJsZS4g
V2l0aG91dCBLQVNBTiBJIHN0aWxsIGdldCB0aGUgT29wcy4KPiA+IEkgd2FzIGFibGUgdG8gYmlz
ZWN0IGl0IHRvIFs1MGY5NDk1ZWZlMzA4ZWIyNWZkOTIxZWE3YzhjODE0M2RkZWVhZTMwXQo+ID4g
ZHJtL2JyaWRnZS9zeW5vcHN5czogZHctaGRtaTogQWRkICJ1bndlZGdlIiBmb3IgZGRjIGJ1cyAu
Cj4gPiBSZWFkaW5nIHRoZSBjb21tZW50cyBvbiB0aGF0IHBhdGNoIEknbSBub3Qgc3VyZSB3aHkg
aXQgaXMgZXZlbiB0cnlpbmcKPiA+IHRvIHJ1biB0aGlzICJ1bndlZGdlIiBoYW5kbGVyIG9uIHRo
ZSBQaW5lNjQrLgo+ID4KPiA+IEFueSBjbHVlPwo+Cj4gSSBzZWUgdGhlIGJ1Zy4gIFBhdGNoIGNv
bWluZyByaWdodCB1cC4gIFNvcnJ5LgoKQnJlYWRjcnVtYnM6IGh0dHBzOi8vbGttbC5rZXJuZWwu
b3JnL3IvMjAxOTA2MTAxNzUyMzQuMTk2ODQ0LTEtZGlhbmRlcnNAY2hyb21pdW0ub3JnCgotRG91
ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
