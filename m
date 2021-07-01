Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E03B968D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 21:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CF86EB90;
	Thu,  1 Jul 2021 19:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835136EB90
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 19:28:18 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id q23so8528016oiw.11
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jul 2021 12:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a3Bue/DZ+vkXeTcotzSVhPxUCkp0cbyG+4vLQI2c4Y8=;
 b=hd+gPTW7db1T8Fu2WYC6zO/Zsa0g4YG3KuzgA6Bm58grB/TYQptVE6FTjosnfwJicc
 Neh+ApdNbld6KPRUdXv9KhjJJq7c4zpOH8u+AAi/hxBgK/bz2YohQY67Q7gIQRqKHxZs
 +lJPiqiPnkrPktsQ6zIqlaeAC3Sdoq/VuFtj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a3Bue/DZ+vkXeTcotzSVhPxUCkp0cbyG+4vLQI2c4Y8=;
 b=HZ/036vjeOFH28T36hBj7jZjXlEQYEvJPD/khv4WSuDM8j8mlCx6xX6PTQijL7gJ3Y
 HOtQAeWqS+O2Qd5f6TQqu6Vp/Yi+3+HHJSjuFhMhZTgkYcxURUXuMUTS21s8wdA/aKIc
 Ngxyuc4Cu+xTUpa3Xz8NOxFdQvDFv9bJNOof5YrjzKjH5GKUyLUcTSCUfTDhxk7NQpvF
 6iY2MHQNg/2+fk9/FondnZgPXxIKuNqVgjrOIPX3SPy2VSAuytT6GfRFiZNPlcec4svf
 hnMuA0EfkDoJH3JoYfYOT1+cHvciS3bLXkxl4sowLZCPCVM1YfYIvYZy3/iwg2udKbtI
 zHaQ==
X-Gm-Message-State: AOAM530adUSqc39oEZNMyV4budH8Zk3jCZ+Z2/qZgelsSTivbrkvKar1
 diAIObl1w680i172IgzkFr7se+3JH+SRk8JIxH4++Q==
X-Google-Smtp-Source: ABdhPJxg6QcAgEw6OQEAW3XANr7wHMHFdW/FllLMAuU6+ZN56sY0gx253K9IyDq8iNXrUTNCBpfvZh+bZjwHGiJ8oIo=
X-Received: by 2002:aca:1a0c:: with SMTP id a12mr8580379oia.14.1625167697996; 
 Thu, 01 Jul 2021 12:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
 <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
 <05e1d462-57ae-888a-888c-3ad486150821@intel.com>
 <20210701111410.3fc6551e@eldfell>
 <050296b9-8958-353a-9f76-699bfbafa1c1@free.fr>
In-Reply-To: <050296b9-8958-353a-9f76-699bfbafa1c1@free.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 1 Jul 2021 21:28:06 +0200
Message-ID: <CAKMK7uH1svoSEGa=sv+BsU4_BMou2sEJQWddQgy1XDMYtz7-Dw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 47/47] drm/i915/guc: Unblock GuC submission on
 Gen11+
To: Martin Peres <martin.peres@free.fr>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 1, 2021 at 8:27 PM Martin Peres <martin.peres@free.fr> wrote:
>
> On 01/07/2021 11:14, Pekka Paalanen wrote:
> > On Wed, 30 Jun 2021 11:58:25 -0700
> > John Harrison <john.c.harrison@intel.com> wrote:
> >
> >> On 6/30/2021 01:22, Martin Peres wrote:
> >>> On 24/06/2021 10:05, Matthew Brost wrote:
> >>>> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >>>>
> >>>> Unblock GuC submission on Gen11+ platforms.
> >>>>
> >>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>>> ---
> >>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  1 +
> >>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 ++++++++
> >>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h |  3 +--
> >>>>    drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 14 +++++++++-----
> >>>>    4 files changed, 19 insertions(+), 7 deletions(-)
> >>>>
> >
> > ...
> >
> >>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> >>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> >>>> index 7a69c3c027e9..61be0aa81492 100644
> >>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> >>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> >>>> @@ -34,8 +34,15 @@ static void uc_expand_default_options(struct
> >>>> intel_uc *uc)
> >>>>            return;
> >>>>        }
> >>>>    -    /* Default: enable HuC authentication only */
> >>>> -    i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
> >>>> +    /* Intermediate platforms are HuC authentication only */
> >>>> +    if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
> >>>> +        drm_dbg(&i915->drm, "Disabling GuC only due to old
> >>>> platform\n");
> >>>
> >>> This comment does not seem accurate, given that DG1 is barely out, and
> >>> ADL is not out yet. How about:
> >>>
> >>> "Disabling GuC on untested platforms"?
> >>>
> >> Just because something is not in the shops yet does not mean it is new.
> >> Technology is always obsolete by the time it goes on sale.
> >
> > That is a very good reason to not use terminology like "new", "old",
> > "current", "modern" etc. at all.
> >
> > End users like me definitely do not share your interpretation of "old".
>
> Yep, old and new is relative. In the end, what matters is the validation
> effort, which is why I was proposing "untested platforms".
>
> Also, remember that you are not writing these messages for Intel
> engineers, but instead are writing for Linux *users*.

It's drm_dbg. Users don't read this stuff, at least not users with no
clue what the driver does and stuff like that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
