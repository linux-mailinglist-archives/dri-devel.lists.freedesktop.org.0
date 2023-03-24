Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4816C7BB2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 10:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A2310E171;
	Fri, 24 Mar 2023 09:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C2710E16E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 09:41:47 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 i3-20020a9d53c3000000b006a113dad81eso308265oth.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 02:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1679650907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=imCEf0eiVAunrGXQwrvLTIleJK4ABXMofTeDXcpOer8=;
 b=WVtoubhZVec70O+sKvrrUVZ53e0xSOeSbKlPVLHjSkoE5cvRGK+00/bcMND2F3wezI
 abaeGFZsddvAu0JiPGAKThDqiXcZnUVRO6NrcRyj2tvWesQIciutXd0F69L558LycT+H
 7aqZRC2OW3sR7XxRyjE5Z4DyBsuGtLiHjav5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679650907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=imCEf0eiVAunrGXQwrvLTIleJK4ABXMofTeDXcpOer8=;
 b=iO0i1gFnQKu6Wnr88D4xWEfN+dwyeEiMpI+mD1DInW1L1R4jW966uRd5io7XLeXp+l
 5qrrMOfXf2V9qnVPgVR9fn0Di0mF7m4VWD56Xl6Lzu8OxteW7ky55wUrTBl+NzmuavZM
 zIkIOMGfsYH7FXlcV08hvD6YaE+915Xmh+I4pHWqs52SZNvYeCmvAGos5BxfH8WE91Af
 SplCNLJQeu3hSvFS5avq/7jX8jyp+TdetNiHOWPM0AWcBDXWG+F1+z6WEQm4GB8+sQ4L
 cZL6uIUS/GTTIcypw/WuVZNuq5BFFTvFiPHFl8cXd931VAi/TXOQLz7idPKMfUMdnkbC
 yHjw==
X-Gm-Message-State: AO0yUKVLIzWfxbqrobtFTipzeEyXp+EaVzUel9LPWlkfCDLUVk4Gr/FR
 X5gagD5jvKXzUL8t6wVmHj8egp0iqjjGR9zyn1Gq8A==
X-Google-Smtp-Source: AK7set/mxAIsCSniMOJjqyg3fNkhUOhEt8h7I32a0B1lxBVVCccdwJ6tfHO02wgf60ABVSkL9rmZvnsaXRDaZz14DZQ=
X-Received: by 2002:a05:6830:2009:b0:69f:b:e44e with SMTP id
 e9-20020a056830200900b0069f000be44emr822364otp.6.1679650907153; Fri, 24 Mar
 2023 02:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
In-Reply-To: <20230320180501.GA598084@dev-arch.thelio-3990X>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 24 Mar 2023 10:41:36 +0100
Message-ID: <CAKMK7uEvAQ53iSdVesR1+vFm0X03dqZU_sRkuMv0FVvg_pCF4g@mail.gmail.com>
Subject: Re: Linux 6.3-rc3
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Mar 2023 at 19:05, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Sun, Mar 19, 2023 at 01:50:21PM -0700, Linus Torvalds wrote:
> > So rc3 is fairly big, but that's not hugely usual: it's when a lot of
> > the fixes tick up as it takes a while before people find and start
> > reporting issues.
>
> ...
>
> > Please test and report any issues you find,
>
> On the clang front, I am still seeing the following warning turned error
> for arm64 allmodconfig at least:
>
>   drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
>           if (syncpt_irq < 0)
>               ^~~~~~~~~~
>   drivers/gpu/host1x/dev.c:490:16: note: initialize the variable 'syncpt_irq' to silence this warning
>           int syncpt_irq;
>                         ^
>                          = 0
>   1 error generated.
>
> There is an obvious fix that has been available on the mailing list for
> some time:
>
> https://lore.kernel.org/20230127221418.2522612-1-arnd@kernel.org/
>
> It appears there was some sort of process snafu, since the fix never got
> applied to the drm tree before the main pull for 6.3 and I have not been
> able to get anyone to apply it to a tree targeting -rc releases.
>
> https://lore.kernel.org/Y%2FeULFO4jbivQ679@dev-arch.thelio-3990X/
> https://lore.kernel.org/67f9fe7f-392a-9acd-1a4d-0a43da634367@nvidia.com/
>
> If that does not come to you through other means before -rc4, could you
> just apply it directly so that I can stop applying it to our CI? :)

I'll include it in the next drm-fixes pull.
-Daniel

>
> Cheers,
> Nathan



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
