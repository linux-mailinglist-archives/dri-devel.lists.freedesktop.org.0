Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 643D04ED8F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 19:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5FF6E8FC;
	Fri, 21 Jun 2019 17:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D706E8FC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 17:06:18 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v24so6561184ljg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 10:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LYRX0+hETX8ncJ2+pB80INUIG2Op14XGJcOM1tOsCBU=;
 b=nu6X53Flac4W+8SHFbz23Be8dz3cyJ0Sujbgu01vRvN/tdymCiJDRPb7cXwbPllufI
 anAn/jmVIWyaB1XFpu4tHpd7qCPHJX8sfRLGOjbQVgjeQVuRSY0P22innLAjBVJaiUbp
 VPPQCZ7ji3mWIwny1iMpSg/pKm62HxpHvC5cvpz/cgZ3voLdpWv4OvQJyg3Dzld8577B
 /AqpYYIMsunFGnQlJ/wYmSx73tArPntLkgZRJMAo+4Dz6xZMsQBxCfAxiBT9EiYDkcO/
 cm7SBgtkhgnu58OI1Vz8qMpn3TO6S1+NKZznDGNSUciI1Q0JBAtSZg/fNrPR6h77SRFw
 NEig==
X-Gm-Message-State: APjAAAWsjSOENZ0/WUeRLbtNH5PcQgIpDBpZZdIDcLAODLTwnrSUGVr3
 AnohZW9QjMx8GtXs00KSOVMdRo88/NBDiukEd1joUA==
X-Google-Smtp-Source: APXvYqzMzl+aXLfwSw8Fl2npMtKUHjd+jXSZkKwopZdBhUWEFJP4bR5enT/w3S8BaoiPjdhr36aETqfSBNuNK4ATrnw=
X-Received: by 2002:a2e:9155:: with SMTP id q21mr42291452ljg.198.1561136777139; 
 Fri, 21 Jun 2019 10:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyM7BRfAwruJ4QsY_gMCGVHxS=ag7cNA1H304zcnAFK+A@mail.gmail.com>
 <CAHk-=wifNAnkd+bXfoNWXO1K5NQ8Tr+Hc13SgaBXU3RoQB7Pwg@mail.gmail.com>
In-Reply-To: <CAHk-=wifNAnkd+bXfoNWXO1K5NQ8Tr+Hc13SgaBXU3RoQB7Pwg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 21 Jun 2019 18:05:16 +0100
Message-ID: <CAPj87rP451duPWi4TQjcqzbyVKYp_v7=ibwR=2UnQyWttLDWNg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.2-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LYRX0+hETX8ncJ2+pB80INUIG2Op14XGJcOM1tOsCBU=;
 b=RPOmrzbYIkxhHBNXP6hYEbvyMQml0Y3hh4xmc8G7oTAv5T1DIzP/7cPFLOvh9lMyv5
 x/RQY5nguAoz824A6EmRb3LkiiqK2EzUS/Vy6jkDD0RCnxXaFP0Qca1lM5eV9k41Fh7p
 I3STnOs7Zz2zCgu304OEn03qpSF3ZMORLLHY/1biWZ35MUHK0vaVebOv9sqXBjg+1Key
 FDT4tSMLVxknKnvq9DkyJP8OnBREdyGYw9n8UCA0SJwVwcp+0u1hmIOsmJ8cSPgjPDAk
 aNwk0arivdbfRGgxeCsvMqvT+0KKfK68fF1PVNI1rAnNaR2EfTv333CiyFWR6VXQQKPu
 WSxA==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIDIxIEp1biAyMDE5IGF0IDE3OjU4LCBMaW51cyBUb3J2YWxkcwo8dG9ydmFs
ZHNAbGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+IE9uIFRodSwgSnVuIDIwLCAyMDE5IGF0
IDk6MjEgUE0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBK
dXN0IGNhdGNoaW5nIHVwIG9uIHRoZSB3ZWVrIHNpbmNlIGJhY2sgZnJvbSBob2xpZGF5cywgZXZl
cnl0aGluZwo+ID4gc2VlbXMgcXVpdGUgc2FuZS4KPgo+IC4uIHdlbGwsIGV4Y2VwdCBmb3IgYW5v
bmdpdC5mcmVlZGVza3RvcC5vcmcgaXRzZWxmLCB3aGljaCBzZWVtcyB2ZXJ5Cj4gc2ljayBpbmRl
ZWQuCj4KPiBEb2VzIGl0IHdvcmsgZm9yIHlvdT8gSSdtIGdldHRpbmcgYSBjb25uZWN0aW9uIHJl
c2V0LCBubyBkYXRhLgoKSXQgaXMgcXVpdGUgc2ljayBpbmRlZWQ7IGl0J3MgZmFsbGVuIGRvd24g
YW4gTkZTIGhvbGUgYW5kIGlzIGJlaW5nCnJlc3RhcnRlZC4gU2hvdWxkIGJlIGJhY2sgaW4gYSBm
ZXcgbWludXRlcy4KCkNoZWVycywKRGFuaWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
