Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9576E97673E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 13:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932B010EAFE;
	Thu, 12 Sep 2024 11:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5YbTiYF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEBD10EAFA;
 Thu, 12 Sep 2024 11:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726139723; x=1757675723;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gHD5g46iT9qrbaf0DhM5CxHitR3jq1iw59XRhkGp9QQ=;
 b=Z5YbTiYFrDLn7Enlwd9PV6Fv1JDG2MGJ8XVucAsFvB2ibem/riS238Qd
 XHo9Im1ROol4atn9bsrPIGEK1SG9HEFmylM+cGHAZT0dzgc3kU4rKfXEV
 Lv1+e1KlDmXc8PrGeuLiqP20ki6fyvu747rQXrezO66MVqN4tJJ/VsPwY
 hjeCKYmLOUgXe/8etlBsy5wawC/Jue/F0TVyo3UKNVF30gNsoPoOhTIr4
 6hT5p+S3kf6sgSXWXTz6pRjbLdRkqt4LBpmC0iigmpm8lF+SBz+dDxtXL
 0RzQV/8lNWHRMJ5HGXQSN0QwjJXBhtk7zIm+mAIMHzL+D5kZ45eaxc7BI g==;
X-CSE-ConnectionGUID: O3ZFRJ3uRnGDYCPfgIVRhA==
X-CSE-MsgGUID: uARQ3M9BTXaAIjvSwvKLhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25179660"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="25179660"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 04:15:22 -0700
X-CSE-ConnectionGUID: zzj36FCaRBONlMqt4IQ9VQ==
X-CSE-MsgGUID: 8c/MuCYZQeulXrM/EaEY5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="67916913"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 04:15:19 -0700
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
In-Reply-To: <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
 <878qvyjxpg.fsf@intel.com>
 <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr>
Date: Thu, 12 Sep 2024 14:15:17 +0300
Message-ID: <87ed5pgm2i.fsf@intel.com>
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

On Thu, 12 Sep 2024, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
> On 11/09/2024 12:23, Jani Nikula wrote:
>> On Tue, 10 Sep 2024, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>>> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
>>>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
>>>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>>>>> inline functions for W=1 build").

[snip]

>> GCC doesn't catch unused static inlines, while Clang does.
>
> It makes no sense to me that adding "inline" would prevent
> GCC from diagnosing the issue... GCC should simply ignore
> the "inline" keyword when definition is not in a header file
> (maybe they don't store "origin").

Please just read the commit message for the commit I reference above for
details. There's not much more I could say about it.

BR,
Jani.

-- 
Jani Nikula, Intel
