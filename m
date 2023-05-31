Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716EF7185D4
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 17:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4B010E0A0;
	Wed, 31 May 2023 15:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF7010E0A0;
 Wed, 31 May 2023 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685545995; x=1717081995;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pkvIS56LJlTWTGyi2HnGWszdEfL1rhbN+Tmd0Oo4Aro=;
 b=bH9wsaX+u1liGUknPk6gnpF36qSEImrYnsIQAZ6otFAvqQ+GsumNo+AL
 1m4k6ovDBZ0ZSkNwq0/RZy5lcqrvRGOGGJmwKZHQ358flWIR69X4mMBx2
 e8oU3iN0uggcaqTyw5pTe45iquHWDaNN7B764qsnZo8YyUebYx5Ytbsi+
 RbyMRFBt9TkJwCZjegdUR8JWLBspdFQVL/wpxIZOcMSOrYSMRDbHhhK87
 fsv4mgeVTyuYvii+X06QpVnWH72LZpFXD6zC27vUqOg81Qjpjh9V72PQs
 LyQivcrMBmnf8eqRrRCC3VLfAUEQFwxr3DZbKOMfKG3xAARG30eq2UYOZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="421037581"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="421037581"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 08:12:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="684417433"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="684417433"
Received: from eladcoh1-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.46.230])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 08:12:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 00/13] drm/display & drm/i915: more struct drm_edid
 conversions
In-Reply-To: <cover.1685437500.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1685437500.git.jani.nikula@intel.com>
Date: Wed, 31 May 2023 18:12:41 +0300
Message-ID: <87wn0ofsba.fsf@intel.com>
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
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 May 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> Rebase of https://patchwork.freedesktop.org/series/116813/
>
> Move struct drm_edid conversions forward.
>
> There are still some drm_edid_raw() stragglers, but this nudges things
> forward nicely.
>
> Jani Nikula (13):
>   drm/edid: parse display info has_audio similar to is_hdmi
>   drm/display/dp_mst: drop has_audio from struct drm_dp_mst_port
>   drm/edid: add drm_edid_read_switcheroo()
>   drm/edid: make drm_edid_duplicate() safe to call with NULL parameter
>   drm/display/dp_mst: convert to struct drm_edid

Maarten, Maxime, Thomas, can I get an ack for merging the above commits
via drm-intel, please?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
