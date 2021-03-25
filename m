Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CF334932F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 14:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41136ED72;
	Thu, 25 Mar 2021 13:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99EB6ED72;
 Thu, 25 Mar 2021 13:39:51 +0000 (UTC)
IronPort-SDR: OFrh5We+oz6872NA+b+DAIPn26ywenzUlFqRarIGIL+9NfyO/jQ5Sm66IRY081A2A57UKbCPY8
 luH3kZNjJRVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="211061043"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="211061043"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 06:39:51 -0700
IronPort-SDR: M6jD/5bc6IX7KBlya9a8mRZ6CjqRAwtvIAhRs1yDwc1Nb7cbYKCoJ1Km68RyI8og40b49ibj/7
 PkmM5ilyZSLQ==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="416009435"
Received: from jweber-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.244])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 06:39:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 0/2] HDCP 2.2 DP errata
In-Reply-To: <20210324113012.7564-1-anshuman.gupta@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210324113012.7564-1-anshuman.gupta@intel.com>
Date: Thu, 25 Mar 2021 15:39:45 +0200
Message-ID: <87im5f2vz2.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Mar 2021, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> HDCP DP 2.2 errata is part of HDCP DP 2.3 specs
> as well. 
>
> Anshuman Gupta (2):
>   drm/i915/hdcp: Add DP HDCP2.2 timeout to read entire msg
>   drm/hdcp: DP HDCP2.2 errata LC_Send_L_Prime=16
>
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 45 ++++++++++++++------
>  include/drm/drm_hdcp.h                       |  5 ++-
>  2 files changed, 36 insertions(+), 14 deletions(-)

Maarten, Maxime, Thomas -

Can I get an ack for merging this via drm-intel-next, please?

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
