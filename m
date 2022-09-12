Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9345B5697
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 10:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8EA10E2E7;
	Mon, 12 Sep 2022 08:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24C110E2E7;
 Mon, 12 Sep 2022 08:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662972532; x=1694508532;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RV/Z6Nez+AtXKAso4KztacVTIqbsyJux7G8i/ZB6gXA=;
 b=EApozQQnS6cAQ52AAWG02/0azbftvNWQo5630N8L5GiO95oxOdYNLhgm
 vGmY+egR5mjqD0dJIh+oPhntinT2VL85leBawgwKo7QecJCo3JT3GiiSO
 f0stLAv4fyXCmrIhDd00oibukrCOJI0f+RCmOMIzmhUgCOhTr299bB2hX
 GCJOYTIwTC0Fj2cCizYT9oVOXM1ynaTykP83ckFRu8zZJnO6Zxi05PSi0
 ICmnMnTfTU+oMgEPGaPlBAergfjA6f9qffPxab6WIzTlwOZpEBHfzthLt
 iClR2EqsD83Sd31bjYiBB2sf4FWbCZI/qLNtL6kSWuf6PrpPMQPJROheZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="298616830"
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="298616830"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 01:48:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="678001102"
Received: from abijaz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.58.140])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 01:48:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/4] Add DP MST DSC support to i915
In-Reply-To: <87v8q08q6w.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220905085744.29637-1-stanislav.lisovskiy@intel.com>
 <87v8q08q6w.fsf@intel.com>
Date: Mon, 12 Sep 2022 11:48:44 +0300
Message-ID: <87wna9566r.fsf@intel.com>
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
Cc: manasi.d.navare@intel.com, vinod.govindapillai@intel.com,
 dri-devel@lists.freedesktop.org, Stanislav.Lisovskiy@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Sep 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> We'll need to have a clean baseline to apply the patches on, i.e.
> drm-misc-next pull request to drm-next, and drm-next backmerge to
> drm-intel-next.

Stan, this is now done, drm-intel-next has the baseline for your
changes.

Please re-send the series, Cc: dri-devel, and please do get the drm-misc
maintainer ack on the first patch before merging.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
