Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4F7A9C25C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545AC10E8DB;
	Fri, 25 Apr 2025 08:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DYi5IM0B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E8A10E8DB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745571326; x=1777107326;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TBT+E29zDkTQjatUup1fCppdtl5cDQY487OPnz7bNyA=;
 b=DYi5IM0Brxyw2EBJYzwv5II66UqXUBHZh6wL3TYm0cPag6YcIMFINVQf
 TwD+j/SgS9FBT2yLvQI5MuFAJ6xpndMLDGs+McUYUh5NTqVenNKhLydBM
 Jq3iEh+w9Nq5pvT1Nz3k95CogWvJQMv+zrmwLg5lmww6RVrnNVNV+teq2
 zf6BPPsZEQ9rxojcegQHWvNLofwXc5s5exBV3gaRo4MhclDhK2oNqLZaU
 3DNi2kAqwiogKDd4I6Q3YfLtjCTd1QcEeRVII9M1G6sUEnk8iJgdHYq/9
 vyTWcTZuriN1M5HU9KCxU53A9ZOzYptE9Ar3PUg5HLrz8rlQE75m82yBu Q==;
X-CSE-ConnectionGUID: y8ldNRQ+QUaOJ4RKOoZ3uQ==
X-CSE-MsgGUID: IWzKo1fcRVav6kIuCTFemg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47112258"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47112258"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:55:26 -0700
X-CSE-ConnectionGUID: dTZO0n3lRDq5xrDOw//EQw==
X-CSE-MsgGUID: b2tGcxX/ShSDgtNrMaj9NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="133772670"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.83])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:55:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zijun Hu <zijun_hu@icloud.com>, Antonino Daplas <adaplas@gmail.com>,
 Helge Deller <deller@gmx.de>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Zijun Hu
 <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH] fbdev/nvidiafb: Correct const string length in
 nvidiafb_setup()
In-Reply-To: <20250407-fix_nvidia-v1-1-843f8d031c7d@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250407-fix_nvidia-v1-1-843f8d031c7d@quicinc.com>
Date: Fri, 25 Apr 2025 11:55:20 +0300
Message-ID: <87o6wky613.fsf@intel.com>
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

On Mon, 07 Apr 2025, Zijun Hu <zijun_hu@icloud.com> wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
>
> The actual length of const string "noaccel" is 7, but the strncmp()
> branch in nvidiafb_setup() wrongly hard codes it as 6.
>
> Fix by using actual length 7 as argument of the strncmp().
>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/video/fbdev/nvidia/nvidia.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
> index 8900f181f1952acd2acc16a6ab49a5a42ec056ac..cfaf9454014d8161bedc3598fb68855e04ea9408 100644
> --- a/drivers/video/fbdev/nvidia/nvidia.c
> +++ b/drivers/video/fbdev/nvidia/nvidia.c
> @@ -1484,7 +1484,7 @@ static int nvidiafb_setup(char *options)
>  			flatpanel = 1;
>  		} else if (!strncmp(this_opt, "hwcur", 5)) {
>  			hwcur = 1;
> -		} else if (!strncmp(this_opt, "noaccel", 6)) {
> +		} else if (!strncmp(this_opt, "noaccel", 7)) {
>  			noaccel = 1;
>  		} else if (!strncmp(this_opt, "noscale", 7)) {
>  			noscale = 1;

A further cleanup could be to replace all of the strncmp's with
str_has_prefix(this_opt, "...") to avoid this class of errors
altogether. It also returns the length of the prefix on match, and that
can be used to drop more magic numbers.

BR,
Jani.

>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250407-fix_nvidia-a9d72c98a808
>
> Best regards,

-- 
Jani Nikula, Intel
