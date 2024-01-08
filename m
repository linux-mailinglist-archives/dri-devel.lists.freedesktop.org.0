Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE53826F5B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 14:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C116510E235;
	Mon,  8 Jan 2024 13:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EAB10E21C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704719514; x=1736255514;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Ik7xv3d+PNprpKGihcwDB3fhMaZfQNecocge1RBjtFk=;
 b=Zvyo1ZxSsyGYVgc0c1i1iev6z6da3K6PHBg6vEVwu3kLAaddWBFLTlRY
 Dn1IaXdBsx2bod5wO4iregkpcdtpRplSIX368M2iecY7hTgidaY2UPGJU
 RVt1Q2plG6iU6N7hrkxenvVgQ44rbEpQwEerrqTXLjEoBFt+FZWtiyoZ5
 QWN7/rwffYsUknMSiSHYZ8SWEovquX1Yp8sx29k5fdWdodeYJkF3PKVpT
 KJ2iH7L+ng93vr+dtjb1Fql98udKkVHSmcCmpK+M+nyuQU2iiIeb+0q13
 m3ma1Pm7f7mjAiKvVQfT6YTgdImQHlM46w152vTtXTXPTJFuTgQRz5AP2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="11221974"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; d="scan'208";a="11221974"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 05:11:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; d="scan'208";a="23158682"
Received: from iboscu-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.36.120])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 05:11:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] drm: remove drm_connector_helper_get_modes_from_ddc()
In-Reply-To: <878d8a2d-ad29-4ef3-9ce5-4ce35284a586@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1704473654.git.jani.nikula@intel.com>
 <878d8a2d-ad29-4ef3-9ce5-4ce35284a586@suse.de>
Date: Mon, 08 Jan 2024 15:11:48 +0200
Message-ID: <878r50x94b.fsf@intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 08 Jan 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi,
>
> for the series:
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Thanks for cleaning up.

Thanks for the review, pushed to drm-misc-next.

BR,
Jani.


-- 
Jani Nikula, Intel
