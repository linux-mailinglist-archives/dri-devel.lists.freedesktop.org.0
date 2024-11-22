Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D409D6034
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 15:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C839F10EBB1;
	Fri, 22 Nov 2024 14:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZpensGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4554D10EBAE;
 Fri, 22 Nov 2024 14:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732284829; x=1763820829;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ypl+SVm/vowo72kux/mF1Apop3W03Eh3zLxLFhXiyeI=;
 b=UZpensGRV8BAOoEXZPyne2wSRUQ6wGLcBafB/5piEZXrTrJAVx+OZbrX
 xHM9+Ob2IPsu5jxuGWH9c5auJ9+Q4VEvZjRTgB5PUQqBdS9RJ3zswDbKN
 U4DiNHcVjkqnJgxyT36LtzDX50SGrQM43CKrJlLWrtY66B6W+7cTwO5wW
 cMxuzWVosczHGZXo0prXBR9gCsuMZlPGIGKXayCaf2kMaPVn9CKeUjzKK
 TXW7ybD/+SCxM5gJdD0KrMjz9hlqgy/4dIEqgw/wT/nL0kbDW3EWuxm3r
 pB/jHlWM2rjV9IPH+HBa8Fvha2SZcYtObCGG4iqW6aZaV7dSn1mIkZyUZ g==;
X-CSE-ConnectionGUID: IFUEe7A6T0WkVo6E4Fq1CQ==
X-CSE-MsgGUID: L0ifrP5eSkGyFqjlIMFyXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="54945914"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="54945914"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:13:48 -0800
X-CSE-ConnectionGUID: frUTGn/+QE+IF4pFfk2OIg==
X-CSE-MsgGUID: nopFpGsqQhu9zNHu+omBLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="121539891"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.157])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:13:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Petr Vorel <pvorel@suse.cz>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dave Airlie
 <airlied@redhat.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
In-Reply-To: <CAF6AEGtXEcNijTqH+NZ5-8ZX2TnzsxACJQ9XXWC9zGTJGxNv=w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241120204125.52644-1-pvorel@suse.cz>
 <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik>
 <CAK7LNARc4Cp1a8G9p0KiCGyu0WL3BNEd0BY0COMPL4U8bLr8gA@mail.gmail.com>
 <87h67zzjdc.fsf@intel.com>
 <CAF6AEGtXEcNijTqH+NZ5-8ZX2TnzsxACJQ9XXWC9zGTJGxNv=w@mail.gmail.com>
Date: Fri, 22 Nov 2024 16:13:37 +0200
Message-ID: <878qtbz78u.fsf@intel.com>
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

On Fri, 22 Nov 2024, Rob Clark <robdclark@gmail.com> wrote:
> I may be biased here, but being able to generate code/tables/etc at
> build time is something that python is very useful for, and has been
> used to great effect in mesa.

Agreed. I look at the list of required dependencies, and none of the
alternatives seem more appropriate for the task. Not having to worry
about hostprogs build is a bonus.

BR,
Jani.


-- 
Jani Nikula, Intel
