Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F1241E604
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 04:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA11F6E4C7;
	Fri,  1 Oct 2021 02:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 45081 seconds by postgrey-1.36 at gabe;
 Fri, 01 Oct 2021 02:34:07 UTC
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FEF6E4C7;
 Fri,  1 Oct 2021 02:34:07 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 1912Xm2A011895;
 Fri, 1 Oct 2021 11:33:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1912Xm2A011895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1633055628;
 bh=jp1gszKRynAEW3NTt0Yi1MVdwVlsDuFC+9KQNXhPqUg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0NWwGmW/80rLewKIAKrRISoOF3ipenbsSiPuryilQs7WbS6UX4N7LiH7FsucfWKBn
 9/K92fQnBsEHBq0E78l0Ivk1/M1tHgdErTGgxzO0x7bQ+5Q5PSGXUoKv7GiqtQqm++
 0tpiMiRf8/TFwmOtfuIlXlOSxMeIQDj+xQCfHGB/87QSojkfFuStInTf25x+pkYaYE
 UE/hMSBWfwxmZaWwpzfzZSA1MZLsJy/IvNvI6vHpEpgzwDoHrtkM2jC+S7mZRigSTT
 XwyObv9dSXUfM7Cfe0Dx66A2bao/+81u5C+4uevCHGNOZwvcxuOvgBqm+f3S0ZjTvA
 /HZ5wQ4Tvg41g==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id
 d4-20020a17090ad98400b0019ece228690so8168249pjv.5; 
 Thu, 30 Sep 2021 19:33:48 -0700 (PDT)
X-Gm-Message-State: AOAM532UsWCzLwf5Trzan4mMjbmbGylnVR1ulVqgm8OxdLBQBcp53XVm
 vqKPB/Vu5TQxIjjnOx8qje9AjShKIko3OCsrvxI=
X-Google-Smtp-Source: ABdhPJxw7rJlpmbKggWoGPJNqrd2QF0QIQpXR7QTtVnzshii0nSr40jcq6Groocde8upZQ/I0MW9jYypXseEMz7DWi4=
X-Received: by 2002:a17:90b:1d0f:: with SMTP id
 on15mr8403278pjb.77.1633055627838; 
 Thu, 30 Sep 2021 19:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210929183357.1490204-1-lucas.demarchi@intel.com>
 <20210929183357.1490204-4-lucas.demarchi@intel.com>
 <CAK7LNAQ765CBjg83Kpt8XdOjqPw8Xuv--_bcTvd3udZ=tsgMdA@mail.gmail.com>
 <20210930155547.rtz6pdae42gqvm6p@ldmartin-desk2>
In-Reply-To: <20210930155547.rtz6pdae42gqvm6p@ldmartin-desk2>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 Oct 2021 11:33:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS7sa6BdSjOZYUrTT3FaL_krD7JN8Cn_w7iLPfLAudUJA@mail.gmail.com>
Message-ID: <CAK7LNAS7sa6BdSjOZYUrTT3FaL_krD7JN8Cn_w7iLPfLAudUJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] Move IS_CONFIG_NONZERO() to kconfig.h
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Fri, Oct 1, 2021 at 12:55 AM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Thu, Sep 30, 2021 at 11:01:36PM +0900, Masahiro Yamada wrote:
> >On Thu, Sep 30, 2021 at 3:34 AM Lucas De Marchi
> ><lucas.demarchi@intel.com> wrote:
> >>
> >> The check for config value doesn't really belong to i915_utils.h - we
> >> are trying to eliminate that utils helper and share them when possible
> >> with other drivers and subsystems.
> >>
> >> Rationale for having such macro is in commit
> >> babaab2f4738 ("drm/i915: Encapsulate kconfig constant values inside boolean predicates")
> >> whereas later it is improved to not break the build if used with
> >> undefined configs. The caveat is detailed in the documentation: unlike
> >> IS_ENABLED(): it's not preprocessor-only logic so can't be used for
> >> things like `#if IS_CONFIG_NONZERO(...)`
> >>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >
> >
> >Hypothetical "it would be nice to have ..." is really unneeded.
> >
> >       if (context && CONFIG_DRM_I915_FENCE_TIMEOUT > 0)
> >                     return
> >msecs_to_jiffies_timeout(CONFIG_DRM_I915_FENCE_TIMEOUT);
> >
> >
> >is enough, and much cleaner.
> >
> >
> >
> >This warning is shown only when a constant is used
> >together with '&&'.
> >
> >Most of IS_ACTIVE can go away.
> >
> >Given that, there are not many places where the IS_ACTIVE macro
> >is useful, even in the i915 driver.
> >
> >For a few sources of the warnings,
> >replacing it with  != 0 or > 0 is just fine.
>
> humn... maybe. Let me do a conversion in that direction and see what is
> the outcome.
>
> My original intention was to make IS_ENABLED() even uglier to cover the
> int case, but after some tries it seems impossible to do on preprocessor
> context, so I thought maybe it would be ok as a separate one.
>
> >
> >Of course, such an ugly macro is not worth being moved to <linux/kconfig.h>
>
> if we don't handle the undefined case and only worry about encapsulating
> it inside a boolean predicate, the macro would be very simple. Would
> that be worth having in kconfig.h maybe?


I do not think so.

#define IS_CONFIG_NONZERO(config) ((config) != 0)

seems like a stupid macro.


What is bad about writing the direct code?

     if (x && CONFIG_FOO > 0)
                   ....





>
>
> thanks
> Lucas De Marchi



-- 
Best Regards
Masahiro Yamada
