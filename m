Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE336AAF564
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 10:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BEF10E1E5;
	Thu,  8 May 2025 08:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPTAro04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7327910E1E5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746692358; x=1778228358;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2xNax2J4+nAASCdA1MqY9GPbWKMDyOOiS1aYTzdLIB8=;
 b=JPTAro04EgvTo3cy6zXnwtM9lWWjrsxiAAXPlbvJa7ckF05faevUHosj
 B7SEQTcOIZxPMEAeip97Reihx1sMPti2/BeJYDfo6M8ss7dCNF3dPJqSo
 DG00FGly8idflltdv84OSw2FxecXnykJ0XsSAIZG3w5Uz81TdUWyzSA6+
 6HS8ucs8iJua+8n8pGp744HDrRJzVeTTyvW+vdC8HERRqrtJKxQiDF8AC
 Jm3Ju0WKhSMwbezI9Si4ibY33USdBu2jPpOOsMRXlKT/QxnVNsyX3Ex7Y
 9qQ4jaAsdCL3HjA4Z408ygEqgNlJ+KsTamzY3xNYuDe+J0O8O6ujTZxBa Q==;
X-CSE-ConnectionGUID: 64ITU60cRcyt7vW88r7N8Q==
X-CSE-MsgGUID: WhmaACE0R86q4p7xmCUAFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47562082"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="47562082"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 01:19:12 -0700
X-CSE-ConnectionGUID: YoUYGevsSkWBR1THiPiWhA==
X-CSE-MsgGUID: psdPB6TVRiijWwhiBcengQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="159534086"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.176])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 01:19:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, mario.limonciello@amd.com,
 harry.wentland@amd.com, Wayne Lin <Wayne.Lin@amd.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/dp: Fix Write_Status_Update_Request AUX request format
In-Reply-To: <20250427095053.875064-1-Wayne.Lin@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250427095053.875064-1-Wayne.Lin@amd.com>
Date: Thu, 08 May 2025 11:19:08 +0300
Message-ID: <877c2rv7k3.fsf@intel.com>
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

On Sun, 27 Apr 2025, Wayne Lin <Wayne.Lin@amd.com> wrote:
> +			/*
> +			 * When I2C write firstly get defer and get ack after
> +			 * retries by wirte_status_update, we have to return
> +			 * all data bytes get transferred instead of 0.
> +			 */

My brain gives me syntax and parse error here. ;)

BR,
Jani.

-- 
Jani Nikula, Intel
