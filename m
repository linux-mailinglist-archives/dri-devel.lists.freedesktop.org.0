Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C64C94EC03
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 13:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2817310E1B3;
	Mon, 12 Aug 2024 11:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYb55aVT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB2710E1B3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 11:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723463082; x=1754999082;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=iqmqAABPhvhclmXQZD6sbYrM09qgi0uBVGW2VYgt+xk=;
 b=FYb55aVTUqJ0CrZ7EUdn29trb2BG4NFjV4k1VsuTrwA0a6zQMLfyjicU
 a77nrfosTIhFKBmMh/KN86huV646K+Cwu3YbzHr4ke8jrCsqhE3HD9xA4
 /vL+xDkzGQCD7xlsOv1NbeDGg99uT9TMBzDZ8RZrOF1foNj2twF0PX5GJ
 Ep12qNDJlqjIqrIeFeEb32zayPD4sEnahwGXsW+uIJbrLIaXHiPhInZiN
 QyTtkXqyWXHDvSrPhCY6ysYRLgI8PkY1zqKtsxgBUvtspZfEExESEqdLU
 Llz6kvzZwL2I42ApYbi5cULVof6GHCN1x/nwWyMhVVX73BOG4vM+e8bg2 A==;
X-CSE-ConnectionGUID: R16GzadBTeuc56gqiIcMqA==
X-CSE-MsgGUID: BsNDrrDfSMatyQz6+Wf3LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32718867"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32718867"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 04:44:42 -0700
X-CSE-ConnectionGUID: wwwJTLo2TISOiuQwUtUgcA==
X-CSE-MsgGUID: W3ikqlRCQjirFdTdyFE9HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="58188100"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.117])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 04:44:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher
 <alexander.deucher@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v2] drm/edid: add CTA Video Format Data Block support
In-Reply-To: <d08af207-22f9-478d-bb17-28029338263c@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240731214941.257975-1-hamza.mahfooz@amd.com>
 <87sevowv97.fsf@intel.com> <97fc4462-b1b7-4fff-9901-15c8db56fc21@amd.com>
 <d08af207-22f9-478d-bb17-28029338263c@amd.com>
Date: Mon, 12 Aug 2024 14:44:34 +0300
Message-ID: <87zfpi0xul.fsf@intel.com>
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

On Mon, 12 Aug 2024, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> Ping?

Sorry, got the spec, but it's a bit involved, and I haven't had the
time yet.

BR,
Jani.



-- 
Jani Nikula, Intel
