Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5553797E61C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 08:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0B910E032;
	Mon, 23 Sep 2024 06:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4PIGv6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF9389D99;
 Mon, 23 Sep 2024 06:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727073531; x=1758609531;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kjHIinl4HqurhMpgWJRROF+5WBw8ydeWCDSQcXpsJIg=;
 b=k4PIGv6SwcGhuPAwGsoJPUHJzTozaLRV3A1qYEGDaZfSzRxwzYYseRY1
 ubgm44Mp+Ee1tn+YycTSemXI5l5C5Q5UQt3ev3L6TR/4G63/lZJwXo5ah
 svl4xAbK5H1YCPXfhFPSJQYwNKbUlppdVTtqBLH7U1V6WA3zdYlgGF9qh
 YDm+IiY7SQs+nh8citARRgXjF8hOHLIVvMpgJhkxCapcSlqmZNQrUFJJq
 wsFn8pOxsDd9zvU+hUQi/X65+ICXrglowQuKildqcA/rCo86okox/nQag
 vm1UfxUbJRdLUfBwEyslprp3WIORFKL83qEaJ9KPLrTTjWNScfV1qkJuK A==;
X-CSE-ConnectionGUID: HY+aZ03DTqKJ8dFt79BIFQ==
X-CSE-MsgGUID: Q78/Z6SqS6OSD8Sn6rz8Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36590265"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="36590265"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 23:38:50 -0700
X-CSE-ConnectionGUID: cvlIPSonTompqD9DMu4dpw==
X-CSE-MsgGUID: Xhq3ahHKSp++y3A07Vp1dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71277023"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 23:38:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, Rob
 Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
In-Reply-To: <n3w7pq364l5ugsnmenece73ke4f3msqmaqoxfrpnqssdo3znyc@psa4cbbmmbix>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
 <878qvyjxpg.fsf@intel.com>
 <n3w7pq364l5ugsnmenece73ke4f3msqmaqoxfrpnqssdo3znyc@psa4cbbmmbix>
Date: Mon, 23 Sep 2024 09:38:43 +0300
Message-ID: <871q1a98ng.fsf@intel.com>
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

On Sun, 22 Sep 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Wed, Sep 11, 2024 at 01:23:23PM GMT, Jani Nikula wrote:
>> Thanks, I'll change this to drop the function.
>
> Seeing no updated revisions here, I've posted a patch that drops the
> offending function. If I missed an update, please exuse me.

Thanks, I just didn't get around to it yet.

BR,
Jani.


-- 
Jani Nikula, Intel
