Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7A7A49926
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D0010E293;
	Fri, 28 Feb 2025 12:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBh8kvP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E17610E29A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740745538; x=1772281538;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XqM5WqihnbemKDDciIHF4nQMqthqgTkWOa0BRrNtGzY=;
 b=CBh8kvP+hvkb1/8WDpFp6tHffhLCoBucu1HTnLuajNg+AKk9iYZsv9y2
 fYaULizb54flibejOFwncMq2TzOIhbhYPdMQkv68kpxvvcEXrWJ+zgfxX
 ywQohxofl7iBUjPkRUqC782ikt9iBqqIFVsd0HdOeNPNojuf0m6HjTAnj
 DK6t7BmvwDzSjUQXhAMkQT3bfhyo4hzCfWO6G+r8mfJj7+nJSylaoGnUQ
 syL2gFtIyCr+W31SJio0mA4EJ4EM/YjG1fgbDPmZ07sqjdVv2O5a4Vt3Q
 PivZWGDKFlpVfzOmfOBWWvIwEPRxQFqR1iyEygqqcNjbSZ7E8qCVZG+GA w==;
X-CSE-ConnectionGUID: CIp4xccEQp+fbCRFrwv53A==
X-CSE-MsgGUID: DuZ3YhBdQWeeQJjfLoCBZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53082764"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="53082764"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 04:25:38 -0800
X-CSE-ConnectionGUID: +vEAD0khTHaoviOwOBaRTA==
X-CSE-MsgGUID: NHIA2YbBRnSkulEVCiO8IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="122337530"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 04:25:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tnzQo-0000000FwW8-3xEu; Fri, 28 Feb 2025 14:25:30 +0200
Date: Fri, 28 Feb 2025 14:25:30 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: kernel test robot <lkp@intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>,
 Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z8GrOhRRsCvD_UtB@smile.fi.intel.com>
References: <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
 <202502280028.1Y9QMcR0-lkp@intel.com>
 <PN3PR01MB9597926E81D2787F2210B84CB8CD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597926E81D2787F2210B84CB8CD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Feb 27, 2025 at 05:28:33PM +0000, Aditya Garg wrote:
> > On 27 Feb 2025, at 10:24 PM, kernel test robot <lkp@intel.com> wrote:
> > ﻿Hi Aditya,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on linus/master]
> > [also build test WARNING on v6.14-rc4 next-20250227]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> 
> A version 7 of this patch has already been submitted, not sure why kernel test robot tested version 4

Because you are too fast to send a new versions. Whenever patch appears in ML
it is seconds/minutes to trigger a bot build, which takes hours. I recommend
spend more time on thinking and discussing, than issuing versions like from
a machine gun.

-- 
With Best Regards,
Andy Shevchenko


