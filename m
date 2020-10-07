Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF87286F36
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 09:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B906EA39;
	Thu,  8 Oct 2020 07:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABC96E954
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 17:49:49 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id j13so3082107ilc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 10:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nJKk1hLd7KbKjZ00VmZ+hLnKCsK4KTZ8u5X+jlAR4/8=;
 b=fiNFvhC0EjVgl4an7ToE/0ySy/w4E+0JaskdSdW6m0Nlv+lH57csHVAXRBPDIlUx0c
 Ja7IPWM4uws9fR70U0A/S2LYStAHC2iEfJH+8lxqSb/pLf5B4qn2CgSz0HVTWgiNHnhc
 lA7+CcWN9OGG2zZXXpJDn+1dNWj/K3R2WcBnLfOxdm+2MiPmLpKrHFQsiIuE0MS+lKHG
 Nki+d1nxkU2Nbo1/+LbPlwQdRdeHLQAqkwaviefoiXTMstMuDJCmgj/kCItR7qIlHaYn
 nR3bTuv/mRuIxMG5HVMZRvkxKyNevr4lfdC9YsoiBFxx3cjqtIEhMG93CY6CqSd0O9jv
 IBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nJKk1hLd7KbKjZ00VmZ+hLnKCsK4KTZ8u5X+jlAR4/8=;
 b=Tq778VV/wABrH6W8IpbfAIskf308TVOk0DnmHZXHD571adyvvchLBfO0WoD8A3supP
 PKs1VnoBTsXbirHsyVIiXYSMmYvUCfogZSVOBvo5dtm7NWY3qaOEBmJNJEq0+5LdAtXg
 RLcflsm85OZ3093BoDEe83fMD5yi5Y9jTp/jja+9vQQ/jZd7sMB7BTmyD09fBVr5QS3G
 rHXsYZVwYQSAAQfKyNJY+Tv6uYkPcIbx3BDGSR+AgfvqRypvbr2nzB1sMB1QI1GalOON
 FnyTA0LUz0tjyxKDjQnyodwHOeUmkcUfhkQ30FENpeMltXsLLJ/c12aTGLzTtOXNp1Rd
 T4UQ==
X-Gm-Message-State: AOAM533S+QZ3sXAsHPfO36YAxcfx/zrhrVN2S08yydb6QRrFgafrCY2F
 xoghx7x8SxfqHSIXJuHpsobF2sG3yYGtldvwluc=
X-Google-Smtp-Source: ABdhPJx4hBU9oshybpAesDN7nAJJvTwASyZxpsLYRxIjEKstyiKTqDBC0hgHNOL2/vw/4v2pG2Oj72ecuhz6WaNkUUU=
X-Received: by 2002:a92:b30c:: with SMTP id p12mr3382233ilh.35.1602092988665; 
 Wed, 07 Oct 2020 10:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAAObsKCP+ve2ZdXQk62aTo70G9i9Vo17dh6k-fcY23NC=EYZxg@mail.gmail.com>
In-Reply-To: <CAAObsKCP+ve2ZdXQk62aTo70G9i9Vo17dh6k-fcY23NC=EYZxg@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 7 Oct 2020 19:49:37 +0200
Message-ID: <CAJiuCcf3YYvAjyPwn8XK-56_YJ4dxQFAUOpL0nEQ8fnED5u8rQ@mail.gmail.com>
Subject: Re: devfreq and panfrost on Allwinner H6
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailman-Approved-At: Thu, 08 Oct 2020 07:20:54 +0000
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
Cc: linux-sunxi <linux-sunxi@googlegroups.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9tZXUsCgpPbiBXZWQsIDcgT2N0IDIwMjAgYXQgMTA6NTgsIFRvbWV1IFZpem9zbyA8dG9t
ZXVAdG9tZXV2aXpvc28ubmV0PiB3cm90ZToKPgo+IEhpIENsw6ltZW50LAo+Cj4gSGF2ZSBqdXN0
IG5vdGljZWQgdGhhdCBteSBQaW5lIEg2NCBib2FyZCBoYW5ncyB3aGVuIEkgdHJ5IHRvIHNldCB0
aGUKPiBwZXJmb3JtYW5jZSBnb3Zlcm5vciBmb3IgdGhlIEdQVSBkZXZmcmVxLgo+Cj4gSXMgdGhp
cyBhIGtub3duIGJ1Zz8KWWVzIGl0IGlzLgoKSSB0cnkgdG8gc3VtbWFyaXplIGV2ZXJ5dGhpbmcg
aW4gdGhpcyBtZXNzYWdlOgpodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC84LzMvMTUzCgpDbGVt
ZW50Cgo+Cj4gVGhhbmtzLAo+Cj4gVG9tZXUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
