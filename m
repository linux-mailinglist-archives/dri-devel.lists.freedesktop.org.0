Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD5186D333
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 20:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD33A10E47C;
	Thu, 29 Feb 2024 19:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mz2M0b/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D803110E3C2;
 Thu, 29 Feb 2024 19:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709235062; x=1740771062;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SIadQ76Bkf/4gXdty9ztsNJ8bc5efC1fQ2oaonBsXZA=;
 b=mz2M0b/wM3NDB76mkO8b4jXPox+bBck0c32irQgkDeqhDowM8lqOmj/W
 E2f+q+yoSKd3qxwFkM9lb0ZTMINg6/gILMTGEhoL93vAxRY5Qr0TVL2Ro
 UA9LsKx7oCOv2V/G3VfVeqV3gpeUn08/C1zu25AiemiQy+UoUvswYz76K
 OFv3YsUJDK0re7kyteZ+Lgp6JtS45CS7LSYTO/Vwe0eZPeI8FLYDjuqGs
 HyZNJKRxFcZG/69em6F0vUPi6xIv9nLuYYpjo5ditPD5JtBc483ZRPh+0
 EO0ou+wcr+V9o/CO8v/8fQtWZgmt9xEXhs9ULIVjl5nX/ZOeueYKl2rs0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="21192949"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="21192949"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 11:31:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8177957"
Received: from srailean-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.49.228])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 11:30:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v12 2/8] drm: Add Adaptive Sync SDP logging
In-Reply-To: <IA1PR11MB6348DD3317E4B9D860E426CCB25F2@IA1PR11MB6348.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240228143823.2762595-3-mitulkumar.ajitkumar.golani@intel.com>
 <87msrj8sjx.fsf@intel.com>
 <IA1PR11MB6348DD3317E4B9D860E426CCB25F2@IA1PR11MB6348.namprd11.prod.outlook.com>
Date: Thu, 29 Feb 2024 21:30:55 +0200
Message-ID: <877cin6pao.fsf@intel.com>
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

On Thu, 29 Feb 2024, "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com> wrote:
> Thought behind this was to use the function where it was defined. But
> no worries, I have split it with new patch series floated.

Please do not rush to send so many new versions! Let the review come to
a conclusion first.

BR,
Jani.


-- 
Jani Nikula, Intel
