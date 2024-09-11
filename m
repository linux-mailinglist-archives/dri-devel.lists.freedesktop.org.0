Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E985974FA6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 12:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3967C10E749;
	Wed, 11 Sep 2024 10:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MdEdfs44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99EF10E749;
 Wed, 11 Sep 2024 10:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726050212; x=1757586212;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5K4tAcFBHvPTFN8Wakkvp/Wjtxx7ZDotyHbB7iJQI5E=;
 b=MdEdfs44InGSpskK7hkFDw3HvkRymI0F6yDIg03t6B1+2eE267Jt1Ev6
 rKg/izDhq5ObJsnbdvQVLvCtmL6kEv/ThZWzc8z0byYZGhoebw1V8hFuS
 liTexmSJpTloEViBPTQSnRVC39qsblh0FqmSvH9+9rtlcrz5WYxni4fqU
 CYxU5feW0IJGdBgZi52HHZ+0gJVKkdTdLc+3hQocmNLtYL9kazSI/w3gL
 RoBS1AmkEB0tvVlKo6iVcuUM/X+A7AdyQF8V38id7nOxeYN2Ay6cKn7tK
 Kt+S5csxXWNY1lbCASTQWbqR5VdhK0yEtJrGdoOLOYXYdavHrZhIj2i9P g==;
X-CSE-ConnectionGUID: as9V3/LhQwyAsFKbyVSYIA==
X-CSE-MsgGUID: QI7lxJ8eTMaFQBKsLhmXpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24986952"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="24986952"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 03:23:32 -0700
X-CSE-ConnectionGUID: CK2HXmxAT3KuAAFMtdSU6w==
X-CSE-MsgGUID: 2zqkdFhVQKGTCdjHtZvtsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="104781745"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 03:23:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Arnaud Vrac <avrac@freebox.fr>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, Rob
 Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
In-Reply-To: <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
Date: Wed, 11 Sep 2024 13:23:23 +0300
Message-ID: <878qvyjxpg.fsf@intel.com>
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

On Tue, 10 Sep 2024, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
>
>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
>>
>>> Building with clang and and W=1 leads to warning about unused
>>> pll_cmp_to_fdata(). Fix by annotating it with __maybe_unused.
>>>
>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>>> inline functions for W=1 build").
>>>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> I think this function can be dropped. Marc, your call, as an author of
>> the patch?
>
> ( Why is the patch prefixed "drm/msmi", is "msmi" a typo? )

Whoops, a typo.

>
> -> For the record, Arnaud is the driver's author.
>
> pll_cmp_to_fdata() was used in hdmi_8998_pll_recalc_rate()
> in a commented code block which was later removed.
>
> Thus, yes, it is safe to completely delete the unused function.
> I'm surprised gcc didn't catch that...

Thanks, I'll change this to drop the function.

GCC doesn't catch unused static inlines, while Clang does.

BR,
Jani.


>
> Regards
>
>
>>> ---
>>>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>>> index 0e3a2b16a2ce..c0bf1f35539e 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>>> @@ -153,7 +153,7 @@ static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
>>>  	return dividend - 1;
>>>  }
>>>  
>>> -static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
>>> +static inline __maybe_unused u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
>>>  {
>>>  	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
>>>  
>>> -- 
>>> 2.39.2
>
>

-- 
Jani Nikula, Intel
