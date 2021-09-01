Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28343FE19A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 19:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7025A6E239;
	Wed,  1 Sep 2021 17:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50216E23B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 17:57:52 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j4so683697lfg.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e56BZ5hXZwdZQAhiBk+g+d3p7hy50ZxnDyqlFRLPbEM=;
 b=RQ09MJkGQrhwqn/8fWS6q3ZRok81XPPuE9PHGsJAPyM9/fsl7dQy8cQDsJzGPFWqOI
 TW2C/QFJL9uWMi6kMns1ljR6PA1iLPxony2Q4uzq4iH0xlbwuya43BLSz2XR4OP2tRA5
 LX91IISfhrJsw0PoemGcrYNwtU7KOuq7Vkx+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e56BZ5hXZwdZQAhiBk+g+d3p7hy50ZxnDyqlFRLPbEM=;
 b=nW+mKdaSEpJlpf9MqrFVpbzrF0JE4xpBzpdiLDbo9eggqqumWiZKa903ELwztxNGRH
 /aA6tEKOeuATC7bLLJc41hh4DOC1YJ0d4Br8J3VdJTk4BTnJvXAN5Awp10f8LPYKNB95
 Z8DwG65F28ya5RT/CtCUbPk7Tzi7xDkDX8oJNkWoPgLVGRS3eEHwfyyJUgZly1hAdgtA
 sJcRxiV4wVGNX3iwjhb3kuVvNtCJ92RJZXuXFKO7HAHnm4G2lH+TFP9g4vHydJlyuLA8
 UcNKPh5NITEqAd13wtns3cinyCgGkd4sb7VAMxCHX2wKv7KYIARv6hWzqWeZqf43ITx0
 qGFg==
X-Gm-Message-State: AOAM533dJPGgBhOsh9Ey002NAsnyWWmX95Hf81SCQq5yELTE2K9nPpUv
 IdI1neF8kTgpqgtRH5fchWhX9NUSk/jv5WPC
X-Google-Smtp-Source: ABdhPJyxqA9gRqv0eayjya0lgn4QYNF8/MgO3Kn4VCWaa4VmCSms9EcziXDEvosgFxGrqkQKe3aOxw==
X-Received: by 2002:a05:6512:b27:: with SMTP id
 w39mr494082lfu.129.1630519070498; 
 Wed, 01 Sep 2021 10:57:50 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id m1sm18495lfr.35.2021.09.01.10.57.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 10:57:49 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id f2so496648ljn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 10:57:49 -0700 (PDT)
X-Received: by 2002:a2e:84c7:: with SMTP id q7mr737503ljh.61.1630519069193;
 Wed, 01 Sep 2021 10:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txeN-qCRJvYV552zdo2H9iVy1ruVrq=YdZBP5Dmpc3Jmg@mail.gmail.com>
In-Reply-To: <CAPM=9txeN-qCRJvYV552zdo2H9iVy1ruVrq=YdZBP5Dmpc3Jmg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 1 Sep 2021 10:57:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=whP_v5nrK9B5vefnZS6Xz3-vZDFxUvSmW8W82hhNh67sA@mail.gmail.com>
Message-ID: <CAHk-=whP_v5nrK9B5vefnZS6Xz3-vZDFxUvSmW8W82hhNh67sA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.15-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 30, 2021 at 10:53 PM Dave Airlie <airlied@gmail.com> wrote:
>
> There are a bunch of conflicts with your tree, but none of them seem
> too serious, but I might have missed something.

No worries. I enjoyed seeing the AMD code-names in the conflicts, they
are using positively kernel-level naming.

That said, I wonder why AMD people can't use consistent formatting,
mixing ALL-CAPS with underscores, spaces, whatever:

        /* Sienna_Cichlid */
        /* Yellow Carp */
        /* Navy_Flounder */
        /* DIMGREY_CAVEFISH */
        /* Aldebaran */
        /* CYAN_SKILLFISH */
        /* BEIGE_GOBY */

which shows a distinct lack of professionalism and caring in the silly naming.

             Linus
