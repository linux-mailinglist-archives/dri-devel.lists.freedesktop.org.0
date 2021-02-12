Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4367831A0FA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 15:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96386E5CF;
	Fri, 12 Feb 2021 14:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28E46E5C3;
 Fri, 12 Feb 2021 14:58:08 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id y35so2962789uad.5;
 Fri, 12 Feb 2021 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ollRFC1dRk48qyZB3r1X6Dwix3zEA2D3LO0PR6IcGC4=;
 b=YZMaNCx4/n8h6vPSwmyteuD5Hyt8l1HBpFGN7Z24Srp3DEE9rsng6immJjA7wVf8f8
 cJSnrG7TLWFBZnYI6fZz8I3aBixxCuQj/wkfxyCpb/0ocuw/9mn4+C4ZblbbfEeR63Qc
 7n0zkDRYH0LO1u2Q1R+UWY9olKKRtR487RG/cPJw4poziyClBCP949APU3sNMdraMRye
 U5/Duo4M/SsUi4Pjq12gkrpYmQ58+LoFIG/XnOtrgkm6RSkBVPussXqPIxeU1Qgt6xI8
 UfVlzDnQzdav97xlJDJ+sBabsoCv7QQ457CIu36HaREH3kAGEUP6JRplgKTdzbz7d5Pu
 fCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ollRFC1dRk48qyZB3r1X6Dwix3zEA2D3LO0PR6IcGC4=;
 b=EZZQw+yVO4UZ1CT0nz+w1FX3IKcxXcfGxpj07q6EbPXdsftqNeD+lNVmxkraHOiIky
 xUc8tX4LCYEV99WLQ+FdQDp/MLPMudsc11YW33ale9jUTJvJGjVqUmp+/5BWgCMUqyYs
 hc1VVlsiAjbjiqYd0Lvuhg8KIGkpgEylGyn5NBwnPcr0sZCrfYvRFobk9LgQcntO+fgQ
 NbBuyrFqNm5A+QvkKx6sQhFgPE2IsgLe/N6ckQhDxjVe8hKkHat4ILO1TunYxHy3sAOC
 Irj3IAavNbALcLHYtu0vRANghPqqpqkrgV/zUgI3o1HOjY6P0tEJq1mEx9RU/MgU+3Lz
 C/Qw==
X-Gm-Message-State: AOAM530WUB8WkouPdrlfaAWinqCFj9b6nNoLMnAYmmxY5X9gUJJR8mHh
 QMOd7tM57JE2GEdZhWEpvppRwpWWWlGHrpO92QkOg4CeU4k=
X-Google-Smtp-Source: ABdhPJw9VPvy2mmMl5sRZeUV2OsoIt9U0/s6Y5RROegQyAKwWEk6mLZP43nBIZVrxZEo8tpxZATgCNQNHEQX8bRFO4I=
X-Received: by 2002:ab0:2619:: with SMTP id c25mr1419958uao.46.1613141888061; 
 Fri, 12 Feb 2021 06:58:08 -0800 (PST)
MIME-Version: 1.0
References: <20210204121121.2660-1-chris@chris-wilson.co.uk>
 <20210204121121.2660-3-chris@chris-wilson.co.uk>
In-Reply-To: <20210204121121.2660-3-chris@chris-wilson.co.uk>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 12 Feb 2021 14:57:56 +0000
Message-ID: <CACvgo51auuU-AR5nPPo-7Q8Ho84cqOYXuTjgjGDzmPjXRtjZ0w@mail.gmail.com>
Subject: Re: [RFC 3/3] drm/i915/gt: Export device and per-process runtimes via
 procfs
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXMsCgpPbiBUaHUsIDQgRmViIDIwMjEgYXQgMTI6MTEsIENocmlzIFdpbHNvbiA8Y2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3cm90ZToKPgo+IFJlZ2lzdGVyIHdpdGggL3Byb2MvZ3B1
IHRvIHByb3ZpZGUgdGhlIGNsaWVudCBydW50aW1lcyBmb3IgZ2VuZXJpYwo+IHRvcC1saWtlIG92
ZXJ2aWV3LCBlLmcuIGdub21lLXN5c3RlbS1tb25pdG9yIGNhbiB1c2UgdGhpcyBpbmZvcm1hdGlv
biB0bwo+IHNob3cgdGhlIHBlci1wcm9jZXNzIG11bHRpLUdQVSB1c2FnZS4KPgpFeHBvc2luZyB0
aGlzIGluZm9ybWF0aW9uIHRvIHVzZXJzcGFjZSBzb3VuZHMgZ3JlYXQgSU1ITyBhbmQgbGlrZSB0
aGUKcHJvcG9zZWQgImNoYW5uZWxzIiBmb3IgdGhlIGRldmljZSBlbmdpbmVzLgpJZiBpdCB3ZXJl
IG1lLCBJIHdvdWxkIGhhdmUgdGhlIGNoYW5uZWwgbmFtZXMgYSkgZXhwb3NlZCB0byB1c2Vyc3Bh
Y2UKYW5kIGIpIGJlIGEgImZpeGVkIHNldCIuCgpXaGVyZWJ5IHdpdGggYSAiZml4ZWQgc2V0IiBJ
IG1lYW4sIHdlIHNob3VsZCBoYXZlIHRoZXNlIGFraW4gdG8gdGhlCktNUyBVQVBJIHByb3BlcnRp
ZXMsIHdoZXJlIHdlIGhhdmUgY29yZSBoZWxwZXJzIGV4cG9zaW5nIHByb3AgWC9ZIGFuZAp0aGVy
ZSBzaG91bGQgYmUgbm8gZHJpdmVyIHNwZWNpZmljIG9uZXMuClRoaXMgd291bGQgYWxsb3cgZm9y
IGNvbnNpc3RlbnQgYW5kIGRldGVybWluaXN0aWMgdXNlcnNwYWNlIGhhbmRsaW5nLApldmVuIGlm
IHNvbWUgaGFyZHdhcmUvZHJpdmVycyBkbyBub3QgaGF2ZSBhbGwgZW5naW5lcyAtIHNheSBubyBj
b3B5CmVuZ2luZS4KCgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndC9pbnRlbF9ndF9wcm9jLmMKPiBAQCAtMCwwICsxLDY2IEBACj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBNSVQKVGhhbmtzIGZvciBtYWtpbmcgdGhlc2UgYXZhaWxhYmxlIHVuZGVy
IE1JVC4KCj4gKy8qCj4gKyAqIENvcHlyaWdodCDCqSAyMDIwIEludGVsIENvcnBvcmF0aW9uCgpN
aWdodCB3YW50IHRvIG1ha2UgdGhpcyAyMDIxIGluIHRoZSBuZXh0IHJldmlzaW9uLgoKSFRICkVt
aWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
