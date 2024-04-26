Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2968B3350
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 10:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A781B10EF5E;
	Fri, 26 Apr 2024 08:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aheYnQUY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D5C10EF5E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 08:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714121484; x=1745657484;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=npm2t8KBB2090WAny6EatmWbokdZZxyqK5vpDH22ecQ=;
 b=aheYnQUYd0go1802Sh2eU5PDIWenUcvyieRcbSkGWEJH0/nKswb2DqNF
 8svyQEQYWiUJ/ff8Dmoe2o3mPhcHWoP4XXe1YeJ633L9x23t/qBbjG5Vk
 5c+JUebpe80lDN/M5PxP9k6RGP740vWeBulsumb0qnm1HSry8O39M20vU
 08JaZ6XXYzLkF3HQ22EaZ52rwLYRLRILHVLpU0fXWyJspss5o/wmK8MLY
 R/W23JgYe1RSC4OEnjpxAc5+yM8vMy19/LKw1sYWFi1zpabWSTriB/0Oy
 mGEAp/iKEa7OC245pefBRjd1NKAl7mst0lWO42T/vcELsMfIEH6JP+rWO A==;
X-CSE-ConnectionGUID: krL2B6vxTP6OVnzM78qF4A==
X-CSE-MsgGUID: 8ry6SMF9RtGo+tby20cbSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10382104"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="10382104"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 01:51:24 -0700
X-CSE-ConnectionGUID: 07o6Rx04R9KuiOoigkNsHg==
X-CSE-MsgGUID: zpd0iFXvR/+pXVhI5u8XXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25445396"
Received: from dgarbuz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.145])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 01:51:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard
 <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, noralf@tronnes.org
Subject: Re: [PATCH 2/2] drm/print: drop include seq_file.h
In-Reply-To: <533e254d-9d4b-455c-80d6-bdbdb3942e91@tronnes.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240422121011.4133236-1-jani.nikula@intel.com>
 <20240422121011.4133236-2-jani.nikula@intel.com>
 <703d9f05-499f-41d5-a892-b5c2ee2ab814@tronnes.org>
 <87cyqc60rm.fsf@intel.com>
 <533e254d-9d4b-455c-80d6-bdbdb3942e91@tronnes.org>
Date: Fri, 26 Apr 2024 11:51:18 +0300
Message-ID: <87a5lg5wxl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 26 Apr 2024, Noralf Tr=C3=B8nnes <noralf@tronnes.org> wrote:
> I used the defconfigs from drm-tip:rerere-cache which caught this.

Odd. This is what my configs are based on too. I can only assume a 'make
olddefconfig' down the line has defaulted something to n at some point.

BR,
Jani.

--=20
Jani Nikula, Intel
