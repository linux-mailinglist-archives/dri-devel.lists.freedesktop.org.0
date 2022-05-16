Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74395527FD3
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 10:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A154610EE5B;
	Mon, 16 May 2022 08:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A9610EEB4;
 Mon, 16 May 2022 08:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652690354; x=1684226354;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=w0Y3dh4DnD67DzeqDXg5GGyNrfbAwvw8hnIdVvy8VZk=;
 b=DHUPEQONjn+10NlLVPfaENynJeNJequ4Amxcw1g/0mLJBKIWQfaQQouc
 CATWOU6KMGA2YBDlJ/BXvM/g9JSacylqYkPWTKOEuRWgNvRA4kVuuScLN
 bgYni4AWSDzKzfDVb5bKUfDXt+TQ1bIuE93nDTbYeujw4NqWof4PE5M86
 pdRo4ubCGpyyXN3rIrp4qOaFwZCxCPSrsHjOBXSQ/4scsgco7RqfXgRlq
 EEmrqJmGYPrMxGh106Vdc4aFTwHQXNe8BXeZ34sStn0Gna1TLDECaQN/M
 bBPSYn5UNe3NZAaSiN92ERab0d0hGN7Er8/SmpzyUU1TDetGdyzTSJDEM Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="270470112"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="270470112"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 01:39:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="568223604"
Received: from jrozansk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.130.253])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 01:39:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: Re: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
 drm
In-Reply-To: <642bd366-7918-0f0f-a6fb-e6422eb7501d@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-4-bhanuprakash.modem@intel.com>
 <DM6PR11MB31778321FCA58010AE44D867BAFC9@DM6PR11MB3177.namprd11.prod.outlook.com>
 <29f40e83-a9a8-c0ac-1702-f9d0bf0f8861@intel.com>
 <8a9ba046-5e2c-442f-aec2-f1683097d100@amd.com>
 <576d5993-8108-218e-45a0-bab1ae4ca84b@intel.com>
 <b87db6af-a2a0-8fba-b204-140db03ab79b@amd.com>
 <642bd366-7918-0f0f-a6fb-e6422eb7501d@amd.com>
Date: Mon, 16 May 2022 11:39:03 +0300
Message-ID: <87mtfhhnx4.fsf@intel.com>
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 02 May 2022, Harry Wentland <harry.wentland@amd.com> wrote:
> Both the kernel and IGT series look good to me.
>
> I recommend you merge the entire kernel set as one into drm-next. We
> can pull it into amd-staging-drm-next so as not to break our CI once
> the IGT patches land.

Can we read that as an ack to merge via drm-misc-next? :)

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
