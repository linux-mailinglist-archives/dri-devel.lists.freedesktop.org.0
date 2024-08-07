Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA3194A9C7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 16:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA4110E539;
	Wed,  7 Aug 2024 14:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWO1bh4D";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE6310E536;
 Wed,  7 Aug 2024 14:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723040196; x=1754576196;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZyF+qOvsFPL7h7JWPnO742b113SJvysD6Qwn+6M3Gyk=;
 b=DWO1bh4DzRXKYCyVG/IXAUhYTbPdZXX4Uvg6SwjGOZuqdI6FrkIYsIAC
 z3MPSF6FGtoB/c+EDiern+q4TVfRCZkVqCu8u9HSHo+HtMn0uGTmDQNSj
 Z9AvNxYby6N9qRK9aradrtX/uu8sZJEiPeao53BEVRh8CwKKbAfrQPh3Y
 Ynb0WzyeFL9PiRScC8Js+3HjooT9o8EPlYEBgFxkqozjEHiJf1Ez9Idlb
 0/ihucGCQzNVHoDp55nGISivklw1cIENyQZradR4U+o/EXv5iQQUMCFEV
 TUkh1apkdtN1ZgyUQKoXX/bzRF4eIUvtHxC/WeIbt9NPXRf/Nh6s2NIDr A==;
X-CSE-ConnectionGUID: Jv5BeYhkRRaEb3rQ1yD+WQ==
X-CSE-MsgGUID: IrOjlhRLQlSDckw5SGAsvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20990635"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="20990635"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 07:16:36 -0700
X-CSE-ConnectionGUID: t1us7xQTSYukxSwtGiIQ9g==
X-CSE-MsgGUID: QIb9XRKTT76Q1dANTfPOtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="56535269"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.8])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 07:16:34 -0700
Date: Wed, 7 Aug 2024 15:16:30 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/dg2: Enable Wa_14019159160 for DG2
Message-ID: <ZrOBvjetl9jK2NW5@ashyti-mobl2.lan>
References: <20240806005719.215874-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806005719.215874-1-John.C.Harrison@Intel.com>
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

Hi John,

On Mon, Aug 05, 2024 at 05:57:19PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The context switch hold out workaround also applies to DG2.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
