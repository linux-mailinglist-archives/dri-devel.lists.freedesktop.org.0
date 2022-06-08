Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C251D5428B3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBE910EA1E;
	Wed,  8 Jun 2022 07:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B4810EAF8;
 Wed,  8 Jun 2022 07:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654675103; x=1686211103;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=MeOTcz6iIXfAzDKM0e6D2di0B3Ii2Uw7f+6UCR21Gfw=;
 b=PPpYMxE30SGEUn2zS39EBD4C6c+/wErcFmvqel5d6iyswgVkIR0U+x6b
 6D488TaSmzPmj+O8dSP/X/SlZ/nGjI+k3vu7odg1GhWRbnim1mv0OjK1c
 YBqBU6FopVZVcGOFR+ayx8sJrq40UMKJaTOnjEDD6AaRW3SPedtuR4oWc
 /hGodYyL4mvEw7S0al3kMpS4hGH3FP5c/UmWoxNjclhe/8vCksQAanpRU
 0MBVVWhN1YFXFsxBLOxL00Fns17/pIVTw2t5eYeeZ/viuYXTJXn40W/kj
 bTi+GHQAsvL4SQB+/fOrRhwAyI/utmI19/JiwP31H6hxuzqAGBYqlrWn8 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="256635334"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="256635334"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:58:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="636662192"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:58:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for
 waitboost
In-Reply-To: <2fc2a62f-4146-c738-3c68-ca70c64e8c29@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220515060506.22084-1-vinay.belgaumkar@intel.com>
 <874k1pj4bi.fsf@intel.com>
 <2f66b35c-e7a1-fb48-e490-566b05f9a03b@intel.com>
 <2fc2a62f-4146-c738-3c68-ca70c64e8c29@intel.com>
Date: Wed, 08 Jun 2022 10:58:16 +0300
Message-ID: <871qvzpox3.fsf@intel.com>
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

On Tue, 07 Jun 2022, John Harrison <john.c.harrison@intel.com> wrote:
> Oops. Just saw your follow up message. No worries!

Again, sorry for the noise, and for wasting your time!

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
