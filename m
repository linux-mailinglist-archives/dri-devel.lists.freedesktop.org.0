Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B653D43A
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jun 2022 03:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE67E10EDE3;
	Sat,  4 Jun 2022 01:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EAC10EDE5
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jun 2022 01:12:30 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id z197so3099284iof.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 18:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7HmAcc2+RoDxk7f9Rs3Ffi6CA3TIxfq1pKNEK2z9OK0=;
 b=mtr2P2+EYULhNxrqRuSgrTdWXC8avZSXIDKJS5U/NUBA+46r//VQkbLzDURVBtc2SY
 GU1DxLhVJN6/SBoZoeSiBQwek6QmHylcN1a674e0EawBKtASE5QzgsjLY1IgsEY5nIKe
 lQi7uT2zkasnDfog8B2hpkm3nnQ+Ocb4hTxCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7HmAcc2+RoDxk7f9Rs3Ffi6CA3TIxfq1pKNEK2z9OK0=;
 b=nt4lj2ynsxoYsSXwgwALijjsqmA0DSoqpLnBeQaIAiaF3YdmR9Oe68aZEilxcZTLi4
 KB4cBx4NtLHjmsPunOeJBZUfwTdLLvbjZvaYCFbRlwSo3qvuiyt5V350arf7MWRkmXoR
 7gE++22M3RLyu/Yu3nq0gUB1IM1250+d4U29s2aITmy8wOE3p0ZeFQjWh4stlru9eXiV
 ENqRdSlj3jed5dzzVO9sWWBCisW1dEk9eVMHKaZXV66ycI9P95m95YxlQohePPE1Tqbf
 Dp7WrixEqMagnsnDTKufgVJXLfQeMyl83uwzdU2t9AJScdrvWFkIV9QOJPWzrRMWs1FS
 TxIw==
X-Gm-Message-State: AOAM531JKUuKizJJq8ig/WjF+ONcPwsTskQz6P3OP921sd7jdcuKOKge
 n4SfcuB25e51xpW8mG8qvR1kuxw8JKPdXDPy+dNF2A==
X-Google-Smtp-Source: ABdhPJz78nI+FW/CTAVVqaxYOkz7qz3GR5ULi/3muQQSNvfryRhsl0pm7omddjpYTnsFAzY8ssAubxbDMwYzEhZLjFU=
X-Received: by 2002:a05:6638:411f:b0:32e:a114:54e with SMTP id
 ay31-20020a056638411f00b0032ea114054emr7095723jab.82.1654305149395; Fri, 03
 Jun 2022 18:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220603151600.19cfa617@canb.auug.org.au>
 <CAF6AEGtYS1LYowjf-OiN-C1+4JFTWwOOpP__4iDLo-dFy0t0Tg@mail.gmail.com>
 <20220604103757.29d0b048@canb.auug.org.au>
In-Reply-To: <20220604103757.29d0b048@canb.auug.org.au>
From: Rob Clark <robdclark@chromium.org>
Date: Fri, 3 Jun 2022 18:12:33 -0700
Message-ID: <CAJs_Fx6KMeKZhyFjfJgwDiJv5xHm-xxQ6YSMWNsaRZz=CQLrBQ@mail.gmail.com>
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
Cc: Haowen Bai <baihaowen@meizu.com>, Dave Airlie <airlied@linux.ie>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 3, 2022 at 5:38 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Rob,
>
> On Fri, 3 Jun 2022 07:58:14 -0700 Rob Clark <robdclark@gmail.com> wrote:
> >
> > will the truncated subject confuse the scripts that look for patches
> > to backport to stable, ie. do we *really* have to rewrite history to
> > fix this?
>
> I don't know what scripts are being used and what they expect, but our
> documentation says (Documentation/process/submitting-patches.rst):
>
>   If your patch fixes a bug in a specific commit, e.g. you found an issue using
>   ``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
>   the SHA-1 ID, and the one line summary.  Do not split the tag across multiple
>   lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
>   parsing scripts.
>
> But, that being said, doing the rewrite is up to the maintainer.  You
> could just look at this as a learning experience and do better in the
> future.

Ok, I'll leave it up to airlied

If you don't mind sharing, what is the script you use?  We could
perhaps add it to our WIP CI..  a script is much less likely to miss a
check than a human, so I'm a fan of automating these sorts of checks
whenever possible ;-)

BR,
-R

> BTW, my script reacted to the missing closing quotes and parentheses,
> which is more like to confuse any scripts that the actual truncation.
> --
> Cheers,
> Stephen Rothwell
