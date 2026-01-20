Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBZhMH2qb2lkEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:17:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A49473D1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E7D10E17C;
	Tue, 20 Jan 2026 12:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Asp45bzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EDD10E17C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768912854; x=1800448854;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vVoDdEvOlSZJQarcUNL7+wkn7+hKlcYxbqxME5y2nIY=;
 b=Asp45bzvUH/M36riI80BFLC0CPUVKXffBb1sszIFz1IYwJSznn876ge8
 fce3Aw3qs3qPqz9AKEEKyQaLXqTjAdsiEwYVXWUKjbIMbeCX0SMoK4mAS
 Iib6VFkSnLA8a24HlY0F0M3atadjzK4k+o+4vvBJigiQP/WSYV/7xX7i2
 sspttH8AUuG4lZowUOpkWCbhgRUHAq8nWR8O6ST0jlfcGq33JCOc5nM5T
 ROeIl9UH2NN8a0spPzlXXA7dy2+6+MWOz2FMu5oOM1kwRd8P0807TBEE5
 0Mn00p2P30T7S603Nj6kuScfCkjNeV3o64NHmBwXKuAXZQHNhhLzzxwRj g==;
X-CSE-ConnectionGUID: IDzQN/ekRU6ycCqKqvksPA==
X-CSE-MsgGUID: kGeFXpZ3Rr2MODZZqGEMmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69849709"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="69849709"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 04:40:53 -0800
X-CSE-ConnectionGUID: 1cYXlaCFQB2y+ZNCFtfUww==
X-CSE-MsgGUID: nVs+3q0+TH6z9aarXANL2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206160538"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 04:40:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Yan <andyshrk@163.com>
Cc: dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re:[PATCH] drm/rockchip: inno-hdmi: make inno_hdmi.h header
 self-contained
In-Reply-To: <7af9b305.5a33.19bda2f3aac.Coremail.andyshrk@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260107152704.2290146-1-jani.nikula@intel.com>
 <7af9b305.5a33.19bda2f3aac.Coremail.andyshrk@163.com>
Date: Tue, 20 Jan 2026 14:40:48 +0200
Message-ID: <11f92b4ef308880a68efa6f6b7ed6091286ef319@intel.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andyshrk@163.com,m:andy.yan@rock-chips.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[jani.nikula@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,intel.com:dkim,intel.com:mid,rock-chips.com:email]
X-Rspamd-Queue-Id: 78A49473D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026, "Andy Yan" <andyshrk@163.com> wrote:
> Hi,
>
> At 2026-01-07 23:27:04, "Jani Nikula" <jani.nikula@intel.com> wrote:
>>Include linux/types.h for u8.
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
>    Reviewed-by: Andy Yan <andy.yan@rock-chips.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.

>
>>---
>> include/drm/bridge/inno_hdmi.h | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>>diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
>>index 8b39655212e2..5bbcaeea94e2 100644
>>--- a/include/drm/bridge/inno_hdmi.h
>>+++ b/include/drm/bridge/inno_hdmi.h
>>@@ -6,6 +6,8 @@
>> #ifndef __INNO_HDMI__
>> #define __INNO_HDMI__
>> 
>>+#include <linux/types.h>
>>+
>> struct device;
>> struct drm_encoder;
>> struct drm_display_mode;
>>-- 
>>2.47.3

-- 
Jani Nikula, Intel
