Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 121672D023C
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 10:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811A76E094;
	Sun,  6 Dec 2020 09:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093746E062;
 Sun,  6 Dec 2020 09:22:23 +0000 (UTC)
IronPort-SDR: secZH/3dxZE9CqxAl5efFyCT4F6QGIlCpHiMrGpEH0HhF28U0GLvvJZnpvSBhQOsimBiLU3YBd
 Q3Ab25hhEblA==
X-IronPort-AV: E=McAfee;i="6000,8403,9826"; a="171001254"
X-IronPort-AV: E=Sophos;i="5.78,397,1599548400"; d="scan'208";a="171001254"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2020 01:22:22 -0800
IronPort-SDR: GLMFGOP4zkEd4JJAi2cUEp7+Dfyksrlz5wNrGdnBQOlB9PEzGOdgSX3LCnTkh7w1mCk5aAaowv
 UOAC6i02QpXQ==
X-IronPort-AV: E=Sophos;i="5.78,397,1599548400"; d="scan'208";a="362704480"
Received: from bmaguire-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.87.137])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2020 01:22:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: Re: [ANNOUNCE] upcoming mandated dim upgrade due to drm-intel branch
 change
In-Reply-To: <87sg8qkgge.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87sg8qkgge.fsf@intel.com>
Date: Sun, 06 Dec 2020 11:22:15 +0200
Message-ID: <87czznb86w.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Nov 2020, Jani Nikula <jani.nikula@intel.com> wrote:
> TL;DR:
> - On 2020-12-05, drm-intel-next-queued will be decommissioned
> - drm-intel committers need to start using drm-intel-next instead
> - Everyone needs to upgrade dim *after* the change

This has now been done. Please update dim, and start using
drm-intel-next for applying i915 patches. Thank you.

BR,
Jani.


> Full story:
>
> For historical reasons, we've had separate drm-intel-next-queued
> ("dinq") and drm-intel-next ("din") branches for development and pull
> requests, respectively. This split has not been necessary for a while
> now, so we'll finally remove dinq, and start applying patches directly
> to drm-intel-next.
>
> We'll make the switch on 2020-12-05.
>
> This change requires a flag-day change in dim, i.e. everyone will need
> to upgrade dim *after* the switch. (The details of the flag-day change
> are covered in [1].)
>
> All the current dinq related commands and aliases (such as 'dim conq',
> 'dim aq', and 'dim pq') will continue to work, except they'll operate on
> drm-intel-next.
>
>
> BR,
> Jani.
>
>
> [1] http://marc.info/?i=20201113095658.16655-1-jani.nikula@intel.com

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
