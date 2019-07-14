Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C14568126
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2019 22:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1831E8945A;
	Sun, 14 Jul 2019 20:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322818945A
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2019 20:22:28 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id h10so14080752ljg.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2019 13:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tCJwfseONs3kj8QnI6Gdnu0Uip4gTAtT1YqSeyCJrVc=;
 b=nmYekoRF/yHOHREia1dZMHrgUr/ZTsgJ0Stocf9fh3lgNw+iXq6za3dNo4IhOsNnIO
 ZDsfhZXRfBkqBYtQDhfjtsyVMvOzBk9hcMCg+UqIwbyx5aJrVmFo3bl0m6KcCIegCn6g
 KAL+re2oNj1qfnSRdTv0wUMhpzKhDaNhfapNAQPCuSrkTRyFRC/Hu/Ky9Z8n7FQhlvzW
 TA3rhaBHm5pZ/2ZrcENKw7dAHP9llI5lrrYjG5TM7QvkrkBEFW+7Da4W0BHdvrxqE+zM
 rLyNjYED0/Oz3AU231Io4wIMfxvqxo34PWqCtYiQQVrJX2aPN/331aXtKO17aE8fNE19
 MZ6w==
X-Gm-Message-State: APjAAAWDPo5x9bFyOxjxug7XHVWwsFR+IhWkmIPwFanBudba8q6w0E8i
 P3lY82yIbC1fytKdIeE4R7XWmJrWOK1ROAWChSAsulvX
X-Google-Smtp-Source: APXvYqz3nop5qNspbeLa3sOEavBbE39NfaBTWwncs0P+MZoPAo3J62vOrULwuIUxtm05i5XbucxMpTiNMEn2HkF+jLo=
X-Received: by 2002:a2e:9951:: with SMTP id r17mr11589009ljj.125.1563135746409; 
 Sun, 14 Jul 2019 13:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <bug-109206-502@http.bugs.freedesktop.org/>
 <bug-109206-502-B1M85pbBco@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109206-502-B1M85pbBco@http.bugs.freedesktop.org/>
From: Mihai <xanto@egaming.ro>
Date: Sun, 14 Jul 2019 23:21:50 +0300
Message-ID: <CAPib=sNPVU29vuCVWekxXwkc48LnVSODW5Ho1zknNcQX-xeuvA@mail.gmail.com>
Subject: Re: [Bug 109206] Kernel 4.20 amdgpu fails to load firmware on Ryzen
 2500U
To: bugzilla-daemon@freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=egaming.ro; s=msecurizat;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tCJwfseONs3kj8QnI6Gdnu0Uip4gTAtT1YqSeyCJrVc=;
 b=KZeVlxAGWf8cLhRDklXom0yMNwHDKGCFo+ZmEAjFea4YBRuj9bkscRqDzRA2gd1E/z
 8LemAE+m0f82SwmMUIICk40erLhh244SBCtgQTT+In07gSPmOMRldlVLt408mcJ1wdJq
 G5oP5k5AcvsqwtoQYM6uYQtOkIVPPE7Rvif64=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1451998132=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1451998132==
Content-Type: multipart/alternative; boundary="000000000000e695c2058da9e65f"

--000000000000e695c2058da9e65f
Content-Type: text/plain; charset="UTF-8"

I am seeing reports with old BIOS, such as F.19.
I have a 15-cp0001na
https://support.hp.com/ie-en/drivers/selfservice/hp-envy-15-cp0000-x360-convertible-pc/20270303/model/23086446
Latest available is F.42 Rev.A
I am wondering if by any chance would be a match to other models also.

--000000000000e695c2058da9e65f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>I am seeing reports with old BIOS, suc=
h as F.19.<br></div><div>I have a 15-cp0001na <a href=3D"https://support.hp=
.com/ie-en/drivers/selfservice/hp-envy-15-cp0000-x360-convertible-pc/202703=
03/model/23086446">https://support.hp.com/ie-en/drivers/selfservice/hp-envy=
-15-cp0000-x360-convertible-pc/20270303/model/23086446</a></div><div>Latest=
 available is F.42 Rev.A</div><div>I am wondering if by any chance would be=
 a match to other models also.<br></div></div>

--000000000000e695c2058da9e65f--

--===============1451998132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1451998132==--
