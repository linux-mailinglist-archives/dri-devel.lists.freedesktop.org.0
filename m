Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98845350467
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 18:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C51189E39;
	Wed, 31 Mar 2021 16:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8968089E39;
 Wed, 31 Mar 2021 16:23:13 +0000 (UTC)
IronPort-SDR: QKg+cLdV0gUsewBmofMkRFnrRFQwP4pRIDmfEMRSvZYT/qacJdyaUOm7J7aNwUYIWoZrE6NSyu
 7q92c9opkz+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="188784590"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="188784590"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 09:23:10 -0700
IronPort-SDR: wVH/A0xE3uAr7fDTMQfJ/UZWQDcrRlh+3keSMqAYcDVx4v2B1Dhy6EzZCEnljP4DQfLzB9gfmy
 jpETtFLg4o7g==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="418747920"
Received: from ebilea-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.32.112])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 09:23:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/8] drm/edid: overhaul displayid iterator
In-Reply-To: <cover.1617024940.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1617024940.git.jani.nikula@intel.com>
Date: Wed, 31 Mar 2021 19:23:03 +0300
Message-ID: <87y2e3mgwo.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Mar 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> v2 of [1], addressing Ville's review comments, and adding a couple of
> extra patches on top.
>
> BR,
> Jani.
>
> [1] https://patchwork.freedesktop.org/series/87802/

Pushed to drm-misc-next, with Ville's review and Maxime's IRC nod of
approval. Thanks. :)

BR,
Jani.

>
>
> Jani Nikula (8):
>   drm/edid: make a number of functions, parameters and variables const
>   drm/displayid: add separate drm_displayid.c
>   drm/displayid: add new displayid section/block iterators
>   drm/edid: use the new displayid iterator for detailed modes
>   drm/edid: use the new displayid iterator for finding CEA extension
>   drm/edid: use the new displayid iterator for tile info
>   drm/displayid: allow data blocks with 0 payload length
>   drm/displayid: rename displayid_hdr to displayid_header
>
>  drivers/gpu/drm/Makefile        |   2 +-
>  drivers/gpu/drm/drm_displayid.c | 132 ++++++++++++++++++++++++
>  drivers/gpu/drm/drm_edid.c      | 171 +++++++-------------------------
>  include/drm/drm_displayid.h     |  30 ++++--
>  include/drm/drm_edid.h          |   3 +
>  5 files changed, 196 insertions(+), 142 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_displayid.c

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
