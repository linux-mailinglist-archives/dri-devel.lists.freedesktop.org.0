Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120A1822B20
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AC610E30D;
	Wed,  3 Jan 2024 10:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFE210E30D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276844; x=1735812844;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=RhE9+ddq7espxYDtQJygiVnkj6Ol7E0W6F65UFpffb4=;
 b=PTXHWVnRYzfLu5OAKHbBBmlTcqj4zkB6z1ojBGLvJirSsDig8YkTFceh
 iJvLnzXMXd0ieRtaVGT1l7GIt3gbgi6X0CRh+sBrRZqjAZS6Wet8PD3ch
 NdKdhbXM98IecP9jAlXUTacqSmQOyZVuLZiOKd+fleNMSlFJepKbzlpxP
 QwOe792e5I0T4156KvLWTnChSxfrFP4o+gXMuUlmnQxJaVG0H4tr6m+yp
 rRM7ltgLX0afZFcPCogrEtoJYfyWEZKOST84K32x7o4mXoMJmPl2aFtbV
 VUtWS7FrbORcYPMM6NbFzvfKh4YujRh+yd2nC5bmC/BOQzSR/QXoI329X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="395865625"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="395865625"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:14:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="850396503"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="850396503"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:13:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, Andrzej
 Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 0/2] drm/bridge: start moving towards struct drm_edid
In-Reply-To: <87edfes07x.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1698312534.git.jani.nikula@intel.com>
 <87jzqksg8g.fsf@intel.com> <87frzytml3.fsf@intel.com>
 <dcad8756-c723-4dc9-91db-a386a1b2824a@linaro.org>
 <87msu2si7q.fsf@intel.com> <87edfes07x.fsf@intel.com>
Date: Wed, 03 Jan 2024 12:13:45 +0200
Message-ID: <87a5pm2086.fsf@intel.com>
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

On Fri, 22 Dec 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> Okay, I rebased and pushed [1]. Probably doesn't make sense to send a
> patch bomb like that right now...

And here are the patches:

https://patchwork.freedesktop.org/series/128149/

BR,
Jani.


>
> BR,
> Jani.
>
>
> [1] https://gitlab.freedesktop.org/jani/linux/-/commits/drm-edid-bridge

-- 
Jani Nikula, Intel
