Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA388C046
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 12:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130C710E698;
	Tue, 26 Mar 2024 11:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1PnaFtx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B775E10E698
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711451499; x=1742987499;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Z0JLXA4J7uejSkKWnDgQeSOwo9gRJK0R56JL/rujEWk=;
 b=C1PnaFtxRlAEZ1sZqdPhKy/Z+puasBHKmWFQexR2vulY10+jIXA1SNui
 8Ls5ZR99rQSkzZzvpivbbAe4gCphbD9D/4a5KS8KNawxn8kfG1rOp+G4T
 J+wzlpQIbUKZZAhs53XD8+lt46yz+EiPq8apDZ9ltDhT/BypTp9LNfSZV
 nJtCF266paGtuH7QQm/VQi0ytiWTP9k5vOHLWA9o620G0bk4e8lMrK4De
 Bzf14FEPPU5rJ7eYQeAivExMcEHYmKkvjVrJ8aOm/0miRsYRuse5VQ8Ap
 z66zAPsJESFcXCX4TwlcJvZDVzWMtt7xbDKR/64K4TpxbV6fbFTVCI7u7 w==;
X-CSE-ConnectionGUID: cB0rKmILTHCLTGV/KWWTHg==
X-CSE-MsgGUID: XAf+Ee0tSkCa7slzge2HNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6389421"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6389421"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 04:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="15848632"
Received: from eldobson-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.55.140])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 04:11:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 00/12] drm/display: Convert helpers Kconfig symbols to
 depends on
In-Reply-To: <20240325-humongous-hyena-of-sufficiency-15e291@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
 <87v85aield.fsf@intel.com>
 <20240325-humongous-hyena-of-sufficiency-15e291@houat>
Date: Tue, 26 Mar 2024 13:11:33 +0200
Message-ID: <87wmppgsd6.fsf@intel.com>
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

On Mon, 25 Mar 2024, Maxime Ripard <mripard@kernel.org> wrote:
> Yeah, I got bitten by that when rebasing my HDMI series. Maybe we could
> enable them all by default to prevent any issue when bisecting?

Someone's going to grumble about default y, too, but agreed. I saw you
already sent the patches.

BR,
Jani.


-- 
Jani Nikula, Intel
