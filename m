Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A03B976A07
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6554310E96A;
	Thu, 12 Sep 2024 13:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZI1HYhHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7472A10E96A;
 Thu, 12 Sep 2024 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726146626; x=1757682626;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TVLhA7LnlVkRoXqIpAQ+mwwoaQA3+1+rsJdLWPQ4yR4=;
 b=ZI1HYhHQiVJi/cIvGluoW+Yvp0wkUiXdr3CYZIgEnHqE3aEkEeh5JNRY
 ehvqHkcBlxeXB9tQnnAb0dxzkHYgEAwcnQgjgAG8kTO1/Z2O8m1XhBIJQ
 OqeC9As4UaaP//JnD17/cMAIDYlDhxf7KR9TowuulZO2lMtv4LmCFTXcy
 UTSDwllfjBXwSTuz8kPLZxw0G0ST2OQIyiy2+v1lCsRRLYY28ow1G8qbq
 B6PizUbn+TazEprVFW1HWMK525Dp42FzE838K+yX0+CLbfSCVUlTPjOWQ
 VVtYDJGqffU9qYXLTK83qTJpJShwEMHIiiK8cb84NZor2PR/v+YmaK5mo w==;
X-CSE-ConnectionGUID: 343Eh74lQ/SGX1faAmqXgw==
X-CSE-MsgGUID: t0vhJsuhQAShItrvsOiIdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="27910904"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="27910904"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:10:25 -0700
X-CSE-ConnectionGUID: 1kCC6Z9dSk6N+vcnN/q3pA==
X-CSE-MsgGUID: aY32VBo9R/axqf7vITOzsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="72288265"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:10:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marc Gonzalez
 <mgonzalez@freebox.fr>
Cc: Arnaud Vrac <avrac@freebox.fr>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Nathan
 Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
In-Reply-To: <ki27iun7ar6nmwpkzykwjvkrn5jpadirbz6fy2c25akh2sbgpj@etbg4uo3hixr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
 <878qvyjxpg.fsf@intel.com>
 <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr>
 <87ed5pgm2i.fsf@intel.com>
 <c2ed3380-82c3-43a3-9c01-534b08333f95@freebox.fr>
 <uosenmxvixug7yfakpbynbltryvvxqc2hxtagby362c2lvps22@kce4vsbi7xql>
 <535df4a8-2d4b-4c52-851d-b4306a28b07f@freebox.fr>
 <ki27iun7ar6nmwpkzykwjvkrn5jpadirbz6fy2c25akh2sbgpj@etbg4uo3hixr>
Date: Thu, 12 Sep 2024 16:10:20 +0300
Message-ID: <87plp9f26b.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 12 Sep 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Thu, Sep 12, 2024 at 02:50:04PM GMT, Marc Gonzalez wrote:
>> On 12/09/2024 14:28, Dmitry Baryshkov wrote:
>> > On Thu, Sep 12, 2024 at 02:14:10PM GMT, Marc Gonzalez wrote:
>> >> On 12/09/2024 13:15, Jani Nikula wrote:
>> >>> On Thu, 12 Sep 2024, Marc Gonzalez wrote:
>> >>>> On 11/09/2024 12:23, Jani Nikula wrote:
>> >>>>> On Tue, 10 Sep 2024, Marc Gonzalez wrote:
>> >>>>>> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
>> >>>>>>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
>> >>>>>>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>> >>>>>>>> inline functions for W=1 build").
>> >>>
>> >>> [snip]
>> >>>
>> >>>>> GCC doesn't catch unused static inlines, while Clang does.
>> >>>>
>> >>>> It makes no sense to me that adding "inline" would prevent
>> >>>> GCC from diagnosing the issue... GCC should simply ignore
>> >>>> the "inline" keyword when definition is not in a header file
>> >>>> (maybe they don't store "origin").
>> >>>
>> >>> Please just read the commit message for the commit I reference above for
>> >>> details. There's not much more I could say about it.
>> >>
>> >> OK, I read 6863f5643dd7.
>> >>
>> >> My remark still stands.
>> >>
>> >> GCC's decision to not warn for unused static inline functions
>> >> in source files (not headers) is questionable at best.
>> > 
>> > What's the difference between source file and a header after the CPP
>> > run?
>> 
>> That question is moot, since the source file / header file
>> convention exists only _before_ the preprocessor runs.
>> 
>> If you meant to ask
>> "How is the implementation supposed to track the origin",
>> then I would hand wave and say "internal annotations".
>
> No, I asked what I meant. #include doesn't have any semantics. You can
> #include "source.c" in the same way. So asking the compiler to make a
> difference between source file and the header isn't going to work (Note,
> gcc has some notion of system header files and I think a pragma that
> changes the behaviour a bit, but we are not talking about such cases,
> are we?).

Just saying, this sub-thread might be more fruitful on some GCC bug or
list.

BR,
Jani.

-- 
Jani Nikula, Intel
