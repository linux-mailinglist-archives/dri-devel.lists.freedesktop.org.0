Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD47A1D464D
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDED6EBE3;
	Fri, 15 May 2020 06:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5B46EA43
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:01:46 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id b11so2075064vsa.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nXDn4QWCaIWKPTVQ+V9U2J2otyg+sxzenoKUS4npgT8=;
 b=icuwocrG4eY808Ue42+lzBwkJ9nJXDxAJKr7UkYnb5/u5K+1SB7Lapk4GxTJg6Bqij
 Y65sAAY/uQIEEKIiZfDsrPzRykXf5dAx2XZnSpJE/8KhYL1lgcj543oXuGwiAZsnOFR7
 F9G5E7mXtfaMUr0s5dxuwsyIEZxFXRAq+iGDW/gl8krLpTld62TNFCplZi9rKkYWCG0w
 S52+hh2G4gG5zUsrORIqD11wWFI39sxuJy65e/pVQSeUhZs0n6SZS9YM5lpWgX0NDiyz
 9FC7uapADA8qyhuVgzJqGsOfIuEZCReeMblws2OgMV5deIYxlLbMQIfAT+TDuzX5pKyy
 oClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nXDn4QWCaIWKPTVQ+V9U2J2otyg+sxzenoKUS4npgT8=;
 b=ufSWqo0DNY0mk8/W52mS7C9Ac2Dt6Zd+ZHad+Xwb+d0HNSj5ZemkcyL0RHcdTVG8fG
 R8NLGDyGrKuNQmjJ8gbLIzmcaiETiyeQAiGlaCXPneVLpVJFiuI8B4j1i0CIgX+uzcp7
 tPpjgFILwH2O9AILjv63jgVRH5W1Jre2pWwRx6zFEVZsCfJUYvfSXH1u4dw6OYoxQRV9
 526HN/I9DQBenNVnrkxMILlHMkG9Awi8Wp9ZjKmDypIYTzbaENwY8m9h/62syaNM6Jqq
 ybmk/WR+r+BH72FhmAnu8TVj83iuPuiuiTrs5drjV/GCXshGpt7JqpNCskDgWDMdSk+H
 qiHA==
X-Gm-Message-State: AGi0Pub6o9NROxDFIjO1Sq1MQmvphN8+8DYFO0UxlaICqS6a903GFWp1
 Ja01/zDGZ8gkxfaF5/5aTUvHcPw5uRqixn6J/A==
X-Google-Smtp-Source: APiQypLGZRu7/Mgtc+qC5sBisKFm/NNy170UPO2OCaAfxlwXythgTL9/rurxkE6uygyLXZW0gFj2ilRBeqbiGPon2bY=
X-Received: by 2002:a67:8d0a:: with SMTP id p10mr22142135vsd.45.1589378504886; 
 Wed, 13 May 2020 07:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
 <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
 <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
 <CADnq5_PwY5czTPepDwzc5qoMJ3cKc4Mui=uN=k1EOtmOD42Log@mail.gmail.com>
 <CAKMK7uG3R4uve41MkkcFSiDJ+p=MwW81gcFW7NFENjKbdDUZ+g@mail.gmail.com>
 <CADnq5_NFDjOzgnjHOHEcjacd2dX1kA1QEzHp8=NweZg_b-82-A@mail.gmail.com>
 <CAKMK7uHv_Hj8BB8t_i=EXx1C4WXw1PnmxuTyNfrA=b5eQMaSLg@mail.gmail.com>
 <CALjTZvZNb-KbdZwM3kLU4yK8zH+NSh35k=iBtfGJMF1xyjpSFg@mail.gmail.com>
 <69696543-7c0e-604d-ed29-721b1b99d44e@daenzer.net>
 <CALjTZvYsNsW9ytGpbUKv1uf9r6DJkAbQzyDbx7Ru+fCP34w4kQ@mail.gmail.com>
 <2612115a-eaa0-9bf9-1227-adbf7f75e1e7@daenzer.net>
 <CALjTZvbM=8h9g+T8+nx8mjuvv_etGAo7DJO5nCKAkg2bUNA+6g@mail.gmail.com>
 <ed0215b7-16f5-133d-70ab-96c4387ca14a@xenosoft.de>
In-Reply-To: <ed0215b7-16f5-133d-70ab-96c4387ca14a@xenosoft.de>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Wed, 13 May 2020 15:01:33 +0100
Message-ID: <CALjTZvZ++MHUQTTmCSvvcGacecBsKZm_QRvfTL5LV04Y-peR0w@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Karoly Balogh \(Charlie/SGR\)" <charlie@scenergy.dfmk.hu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 May 2020 at 14:44, Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>
> OpenGL version string: 1.5 Mesa 7.6
> OpenGL version string: 1.3 Mesa 7.2
>
> Screenshots:
>
> - http://www.supertuxkart.de/stk07ubuntu910ppc.png
> - http://www.supertuxkart.de/opensuse111-stk073.jpg

Those are *extremely old* (and I mean over ten years old) kernels and
userspaces. Of course old UMS distros will work fine. Try installing
the current Debian powerpc (on the G4) and ppc64 (on the G5) ports and
force-enable AGP on the Radeon kernel driver (radeon.agpmode=0),
you'll understand what we mean by "unstable". ;)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
