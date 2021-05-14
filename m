Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB7380F2A
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 19:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9A96F3D1;
	Fri, 14 May 2021 17:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1906F3D1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 17:42:32 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id h4so44220856lfv.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 10:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z2BEVo2gdHA+YW84az98d4ViUxW08aEVoJlhBhP4mlQ=;
 b=ZmQiX2I9H1fZGUevqtQOOCJrEct1Nk5Lsk0QNLPmgB0qYmECyy1vwXWs/SJ4QQ1mvl
 9MozrFx+5stjBtCmEl91KHahpHkbkXMUkih+tdMrftMjO0ydkUu/vUYOjTMep8R+KE6m
 19GI97rUr53bJd2vYavJ2+viPG2eU2bACdn54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z2BEVo2gdHA+YW84az98d4ViUxW08aEVoJlhBhP4mlQ=;
 b=s//exC4Uu/8ajs21/iUfg/W/XqJPKNiTlb5iqH+xAa9GCDohVUcTmifF19f32UAOFL
 RkjQbb1PTErW4EZSdR+jwrGlno5Nqf2YxMnQBuPyq8m5Z0Um7c10Zefy2SErITDRbkTL
 ZptIVi9PBu+UzWleuHO9xOgdhqMzqLPUHwVu3IFEnSWgrz6qVq9XQswvhOeGWQt/Btto
 Yslc6a3W/erzgNaQT2eFpz94RAzAfq5ChchFyGL5CQjZAkGFNE9TVson4ipn69pIGfpv
 KTngGJ2rCDa4w0cXZ7FqbH7c611FSLq1ZM411hAmA9iwtV/ZVcGwTrBMlDyt6Oxjp0Xb
 CQ2Q==
X-Gm-Message-State: AOAM5313+lmhi11zsyvgc4Phkodvs37WTO+kCtq+QORE4AnNo30QtrvJ
 HzHhHj4Nk2depZIwiY1PXVXeP0ufyV8bJHdWSa0=
X-Google-Smtp-Source: ABdhPJzmnW4/oacUNmt1FsxjN5/YbjhXw5UhQ/CgcnczPCuHnQDxY7Ye2MZOB7NeKwGy77Z2feE+xg==
X-Received: by 2002:a05:6512:ad2:: with SMTP id
 n18mr22847965lfu.608.1621014151118; 
 Fri, 14 May 2021 10:42:31 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id c14sm846780lfb.129.2021.05.14.10.42.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 10:42:30 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id j10so44128304lfb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 10:42:30 -0700 (PDT)
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr299593lfp.201.1621014150212; 
 Fri, 14 May 2021 10:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyXjogjugi55XdAQd-ucMCk=ohDXS+vqdiaMk_aCL6aHQ@mail.gmail.com>
In-Reply-To: <CAPM=9tyXjogjugi55XdAQd-ucMCk=ohDXS+vqdiaMk_aCL6aHQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 May 2021 10:42:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wge8rgL-VUHZpWFg_cTFkp1D_AZJTRzV86jod4NSJsppw@mail.gmail.com>
Message-ID: <CAHk-=wge8rgL-VUHZpWFg_cTFkp1D_AZJTRzV86jod4NSJsppw@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.13-rc2
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 13, 2021 at 7:34 PM Dave Airlie <airlied@gmail.com> wrote:
>
> Just realised I got the tag header wrong, these are the rc2 fixes.

Heh. The tag message also says:

> vc4:
> - drop an used function

which just makes me think you may have started drinking early ;)

I fixed it up. Sk=C3=A5l!

                 Linus
