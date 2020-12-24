Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC992E2909
	for <lists+dri-devel@lfdr.de>; Thu, 24 Dec 2020 23:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C067A89BF5;
	Thu, 24 Dec 2020 22:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70F689BF5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 22:28:26 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id x20so7079481lfe.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 14:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WVgMIe6f2x4NkzIsowkEU5VbeVfG+KlVYzro8vABtIM=;
 b=NdHD/MMFyljQPE+PPWLewgCWLzpbm6c4NlPaMatyjNaGyF2AEH8Su97p86MebNW14h
 ydm4/y81NkkFvapcqo1DICsysejvjE3Ao+251ZzZnPUmsaqTy5kp+HdKJQe0oJGCkU/l
 HI0AEMLAxASH3RBX4w2TuPqez8l8rlA55cgF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WVgMIe6f2x4NkzIsowkEU5VbeVfG+KlVYzro8vABtIM=;
 b=fw+oP1ATzmea6Z9FS8RxFqYXgS+LgblzDkjrbSdggXEqLbhPw0y7HggkCyHKvTjXKP
 VwpuBlBRuu8zJIjEkLfvsW61uzsT+g1qfVeTgnBMNUzvw2tsGJgfegnxGrCVGz2f69lD
 88xOgWNdj+WZzXik0/PqlfeneAGU+pvVFhF+N8G52XOx/rLfRTbo+LbXrVg5em1py52T
 tUHyzVqy5fJkOh01J7AcANtVkni5qm2RKu5bvHYnvcCumYbTj3tl0t62Jfi3pgaBOMC+
 rzDELJ/H1E6shovNl3zk5dGdtf/B63dJ7T9Tn+2rwiLlHw34lAe1hZjOwrlbIvSx3ncw
 q+rg==
X-Gm-Message-State: AOAM533WeFuxEXM8jlOJP7H3RR9gDrldUgsOrU4DsW63X2C1/cHLa6Nv
 XWqY3eAFY2coOvMSO7zqKlUJi5+vSZ50EQ==
X-Google-Smtp-Source: ABdhPJyONBOkQARBQNAwAg2h3sRsREPXoM8SeqQGQ+iBs9SyiiR72EHLShN8AZB7s+ayq56YpmsHEQ==
X-Received: by 2002:a05:6512:30a:: with SMTP id
 t10mr12779624lfp.124.1608848904743; 
 Thu, 24 Dec 2020 14:28:24 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id j2sm3778854lfe.213.2020.12.24.14.28.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Dec 2020 14:28:24 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id x20so7079386lfe.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 14:28:23 -0800 (PST)
X-Received: by 2002:a05:6512:3048:: with SMTP id
 b8mr13773066lfb.421.1608848903361; 
 Thu, 24 Dec 2020 14:28:23 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twrkJdUqTLXXsNygtzkrc4P2iyw4kwU1T83D4_+-gdpDA@mail.gmail.com>
In-Reply-To: <CAPM=9twrkJdUqTLXXsNygtzkrc4P2iyw4kwU1T83D4_+-gdpDA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Dec 2020 14:28:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=whf+kw=YSDbmvgiSvNL9ckHc8EpkTgZzMXu-bMw941GYQ@mail.gmail.com>
Message-ID: <CAHk-=whf+kw=YSDbmvgiSvNL9ckHc8EpkTgZzMXu-bMw941GYQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.11-rc1
To: Dave Airlie <airlied@gmail.com>, Josip Pavic <Josip.Pavic@amd.com>, 
 Bindu Ramamurthy <bindu.r@amd.com>, Alex Deucher <alexander.deucher@amd.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 23, 2020 at 6:29 PM Dave Airlie <airlied@gmail.com> wrote:
>
> Xmas eve pull request present. Just some fixes that trickled in this
> past week. Mostly amdgpu fixes, with a dma-buf/mips build fix and some
> misc komeda fixes.

Well, I already pulled and pushed out my merge, but only noticed
afterwards that clang complains about this, and I think it's a real
bug:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_mpc.c:475:6: warning:
     variable 'val' is used uninitialized whenever 'if' condition is
false [-Wsometimes-uninitialized]

and it sure is true: the code literally does

        uint32_t val;

        if (opp_id < MAX_OPP && REG(MUX[opp_id]))
                REG_GET(MUX[opp_id], MPC_OUT_MUX, &val);

        return val;

so clearly 'val' isn't initialized if that if-statement isn't true.

I assume 'opp_id' is always presumed to be valid, but that code really
is disgusting.

Just make it return 0 (or whatever) for invalid, possibly together
with a WARN_ON_ONCE(). Ok?

             Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
