Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07A27A453D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 10:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D4510E224;
	Mon, 18 Sep 2023 08:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBE810E224
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695027458; x=1726563458;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HeFp7tILd3nxt9A1X2feyEpN3APhXPS4vq/kQkpBxPg=;
 b=YCIYknpCE2wod6/MSYNgDTQVn78byEvgaxDDQPT1zLTBBo7cigcIhoLS
 7GBkvS65sL5KAk9Xj1Ap26fMd3OMY/diTm0r0Feb86hYhdOmuMZXYkF5z
 DAD+J+DFRG1t2jrs24x8w65SYOhS4wmFJYIjDCLLeaCvZgItYq7cVRInc
 F8W1OD9xQb1vErsJTRviXz3aWZFsCk2009krvpMB+E+BK0hJlQWLJUEJc
 dPlUCsYZ5yRqGt7sRb//xMEhEetp0DddvohKIZF5/hjWv+twSSETN/Qb6
 eXgTQwdAjSaMNelYxwAKTTe6PcdsJZnjxcYz0yHhFAhZDTqSKKSvPF/JA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="376916429"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="376916429"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 01:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="811280109"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="811280109"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 01:55:42 -0700
Date: Mon, 18 Sep 2023 11:55:38 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH for-next v2 02/10] PM: Update EXPORT_*_DEV_PM_OPS() to
 EXPORT_*_RUNTIME_PM_OPS()
Message-ID: <ZQgQilY20yEUPtt3@black.fi.intel.com>
References: <20230918080951.3615-1-raag.jadav@intel.com>
 <20230918080951.3615-3-raag.jadav@intel.com>
 <a31817a460f8ee66c9d460e97aeea62b2bcfbc51.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a31817a460f8ee66c9d460e97aeea62b2bcfbc51.camel@crapouillou.net>
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
Cc: jean-baptiste.maneyrol@tdk.com, len.brown@intel.com,
 laurentiu.palcu@oss.nxp.com, rafael@kernel.org, linux-iio@vger.kernel.org,
 patches@opensource.cirrus.com, linux-pm@vger.kernel.org, lee@kernel.org,
 mallikarjunappa.sangannavar@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, james.schulman@cirrus.com, rmfrfs@gmail.com,
 rf@opensource.cirrus.com, bala.senthil@intel.com, pavel@ucw.cz,
 Jonathan.Cameron@huawei.com, andriy.shevchenko@linux.intel.com,
 david.rhodes@cirrus.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 18, 2023 at 10:20:29AM +0200, Paul Cercueil wrote:
> Le lundi 18 septembre 2023 à 13:39 +0530, Raag Jadav a écrit :
> > Rename EXPORT_*_DEV_PM_OPS() macros to EXPORT_*_RUNTIME_PM_OPS()
> > and while at it, move them to pm_runtime.h.
> > This is done in conjunction with the introduction of
> > EXPORT_*_SIMPLE_PM_OPS() set of macros, to make things less
> > confusing.
> > This makes both _RUNTIME_ and _SIMPLE_ variants of export macros more
> > distinguishable and self explanatory.
> 
> Well I don't really agree with this one. The EXPORT_*_DEV_PM_OPS() can
> be used with any callback you need, not just the typical runtime-PM
> callbacks. They are generic PM macros.

I agree on the usage part. But with the introduction of export macros for
_SIMPLE_ variants, current naming scheme would make things unnecessarily
confusing to the users in my opinion.

Perhaps we can have it simplified some other way?

Raag
