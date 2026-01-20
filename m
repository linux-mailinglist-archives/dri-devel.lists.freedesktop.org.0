Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOHwMX2qb2lUEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:17:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6BE473CD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7F310E0A2;
	Tue, 20 Jan 2026 13:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YniZtlPz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A8210E0A2;
 Tue, 20 Jan 2026 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768916977; x=1800452977;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DvSXOwho82C6rShrPrjspQULjsPGHUWAwm0qWIl180E=;
 b=YniZtlPzaZ2XG10g/XuHcumgfQKWux7mrndrppE5FPdU7uIpxhg+oyYU
 H2wgXqoxjHDwhn0D2j8XdCDq2trYIG97WN/ck8KNCzFft0KynhmC2NM/V
 kfwIBOMOgjQ58F6vE9u0IFzhNx7TQ0SicT7lk2oBqOICu3wDSEr307Whh
 z5aT5TQ0awx6/5z1mYZBKbpTvy/un409hr4G31ymFY20M2g9r3mc8DVyx
 L3vzjmSEPu5QM0RrW984X27GIRUOCVT1JnxNfjQqvI0WJLI8m7L+2PKaP
 zf8dZZzgF8rYxiceSkm/eQ10VVj8juyUEfmRM+ZZMhM4KM4aWXAaGe/tu g==;
X-CSE-ConnectionGUID: Ejt+I9sxRPOIpUbJOYG0qg==
X-CSE-MsgGUID: T/QNl2TKSZWmVWBoq+nuew==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70177783"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70177783"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 05:49:37 -0800
X-CSE-ConnectionGUID: UuzNvBg0TRKmIW4SSMPD2A==
X-CSE-MsgGUID: iPEejFCuTZK1vFgJ4qnb3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="210596557"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.250])
 ([10.245.244.250])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 05:49:35 -0800
Message-ID: <f1886515-d90b-47cc-9c6c-b6d7eec6b488@linux.intel.com>
Date: Tue, 20 Jan 2026 14:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm, drm/xe: Fix xe SVM configs
To: intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Dafna Hirschfeld <dafna.hirschfeld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
References: <20260120113322.97654-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260120113322.97654-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linux.intel.com:mid,lists.freedesktop.org:email,intel.com:email,intel.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 5E6BE473CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 1/20/26 12:33, Thomas Hellström wrote:
> The first patch fixes the problem of xe userptr not being enabled if
> CONFIG_DEVICE_PRIVATE is missing.
>
> Second patch explicitly selects CONFIG_DEVICE_PRIVATE if DRM_XE_GPUSVM
> is enabled, which is probably what most distros want. This patch is
> not Fixes: tags since some configurations may actively exclude
> CONFIG_DEVICE_PRIVATE and it's undesirable if a stable update breaks
> those.

Hmm. Need to take also CONFIG_ZONE_DEVICE into account. Will respin.

>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: dri-devel@lists.freedesktop.org
>
> Thomas Hellström (2):
>    drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE
>    drm/xe: Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected
>
>   drivers/gpu/drm/Kconfig    | 2 +-
>   drivers/gpu/drm/xe/Kconfig | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
