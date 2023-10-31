Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E014F7DC93D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 10:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F89010E43A;
	Tue, 31 Oct 2023 09:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A997B10E434;
 Tue, 31 Oct 2023 09:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698743740; x=1730279740;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ED3GzfIHErK/I+B8X1tndOEeLhvDPuWYEFZneR8tTPI=;
 b=GIgx5TsZfV9vX7RN1W9JXHflNgnJ380yUAIvN3A40VWVk07PbBgHwitc
 SkOAxZzY/myjR2GkON6SILqBkZA1KT/1XsSDlNZYZRhTAOI4mpHajpsY0
 DLcFXA173DJO49J/CdSWTEGD8bbsx2MLdvYUbirqn7I6XG5uwTuYeyTu7
 QAIbt3O3zPG1tv8Pvzlf9/cbVJh/geVmtZQeK/192cGVfWWq4+bAewfSf
 vHlrkcLekINyVNmZALCUNchX8gWLBA7lRRzIhWU3DBRBSooNXkBDTnCL+
 M1bG2w0/Jf5RKM+f7aQViVto0s/jLYOX2KLbze9/ERohligAt5LU2AHgR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1125003"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1125003"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 02:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="710361666"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="710361666"
Received: from moelschl-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.45])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 02:15:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/4] drm: Fix color LUT rounding
In-Reply-To: <20231013131402.24072-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
 <20231013131402.24072-2-ville.syrjala@linux.intel.com>
Date: Tue, 31 Oct 2023 11:15:35 +0200
Message-ID: <8734xr5f0o.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Oct 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> entrirely. But perhaps a better idea would be to follow the
> OpenGL int<->float conversion rules, in which case we get
> the following results:

Do you have a pointer to the rules handy, I couldn't find it. :(

Might also add the reference to the commit message and/or comment.

BR,
Jani.

-- 
Jani Nikula, Intel
