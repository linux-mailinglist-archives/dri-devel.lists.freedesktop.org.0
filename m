Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A48F53CBE0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 16:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EB011231E;
	Fri,  3 Jun 2022 14:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D825811231E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 14:58:13 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id x17so10736372wrg.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/R/4ToixurdvYBbWBR8c1EK1LIIPY8prRBRCCAJql14=;
 b=L89/jjviPQbdDtiZaCn6CI2qnSZbvNAjCSTKxAXOYk0u+j4nl+51icI4jgGLXmEunr
 mU9ErCTPBea39/n0UZdGXHlkC28VQs7BJVKWNUROGluAz0M9NhW65LfVv66HpWp55viK
 SQP+z2shn97ZcZggMVy476j+O4xufb6UqE6E8O1Q5p7I6l4GhK94680PbODhY6lBNlP4
 4WTsOIN9CJfYf/Mn3GT6HAMIS3/tF/kYTKphowxHKV87r/2pX+kyOyLyRzfYe0n2fw0p
 rNyVeDaBeHfGMmfXFBFji9ePerTaWaRoAnXCSQYBRM1bDQrh3Tg6SOHGP6PcQ5ILeiYr
 B6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/R/4ToixurdvYBbWBR8c1EK1LIIPY8prRBRCCAJql14=;
 b=igHaq0DMJR1Jeggrg4wK174N//pz0JwqcRruzsTQAj8AG7cBnuZA82FYzKZ60Jx3sh
 ROrixycLwgvAAVKZhOZ2rJRpnOoi/1j9Z/qQ1DXcrL9NWikasndhSUXKXtLZ3t1qsdhV
 pCEhWweYENwj0qf1PIvPXe7/Y7JLw1wVP5bHy0fhtL9EjzxGnFvHMHs+PVuyrkx1b90W
 CUBio5zfVQx8BQBQ/R6UmQUyq6oGjd8mR0eSseU8fW4NmrN4SqJKPUobqEcqOnh8JFIy
 44AkKxpwdQHjlAjQPrJuQq+9aoQS5xYODCjMoVfZmwgSi9NVBbuZbVXgFg88mNdFVQeU
 ZLYw==
X-Gm-Message-State: AOAM532/7j6cJnLgXOyxTOWKDHmr3y0Qj8q4BFm5YZInZAlbC4wdfg9g
 qTpQwN1w7dxhBIKS+0zRYEhSWlihufAWZrAWJ1A=
X-Google-Smtp-Source: ABdhPJwLkLEf+cqEIWjgsz9My/14MKmdEsJ2CQwAp3vAoyWObhmuS6Arp6/K91rdmeLKIRwQ8ndqit+2uQwKakVcnu0=
X-Received: by 2002:a5d:68d2:0:b0:210:31cc:64a6 with SMTP id
 p18-20020a5d68d2000000b0021031cc64a6mr8289615wrw.679.1654268292227; Fri, 03
 Jun 2022 07:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220603151600.19cfa617@canb.auug.org.au>
In-Reply-To: <20220603151600.19cfa617@canb.auug.org.au>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Jun 2022 07:58:14 -0700
Message-ID: <CAF6AEGtYS1LYowjf-OiN-C1+4JFTWwOOpP__4iDLo-dFy0t0Tg@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Rob Clark <robdclark@chromium.org>, Haowen Bai <baihaowen@meizu.com>,
 Dave Airlie <airlied@linux.ie>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 2, 2022 at 10:16 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   8caad14e7224 ("drm/msm/dpu: Fix pointer dereferenced before checking")
>
> Fixes tag
>
>   Fixes: d7d0e73f7de33 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Fixes tags should not be truncated or split across more than 1 line.   So:
>
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")

Hmm, checkpatch seems to not catch this (unless it was a recent
addition that landed after what msm-fixes is based on.

will the truncated subject confuse the scripts that look for patches
to backport to stable, ie. do we *really* have to rewrite history to
fix this?

BR,
-R
