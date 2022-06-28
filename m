Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA155E559
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 16:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9193910EB50;
	Tue, 28 Jun 2022 14:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A1810E515
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656426837; x=1687962837;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/UN3QDg13Wd+WWcDZrJ+yY+W+Wvp07576Pl/ooZL99s=;
 b=LFVwMWXNLiTWVoadq85V19VltSwDVUIkMcL0Vyj2GBx0yaLW5Tkl4/bn
 r0/Dp9j117cv7ct0w/3KYMTERCNT580WdFQkfC31tW1lEJokVeBHwr/hp
 eYEMmun/9msuFUc4rQE+v0t5EzUgcQpdEGhW00uLZkSzjBz2632fihxEN
 NM3yzfoq04J0dcS4E8OqEk1eczTdyV43AlQJs5GGXodXU+uMxWI+ogM+g
 EFN9Tv/sALbN1kdkKxJYqFgd4cII6XJtFEL3o3Ta2oTIyao3oQEpJkAhw
 6QG0r3xoWuLOhvCsCsSKYPAPmhXCwyttSHqAfDOp6EPJKDLD+VYYu7aLa g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="282491798"
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; d="scan'208";a="282491798"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 07:33:56 -0700
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; d="scan'208";a="836696161"
Received: from mwardyn-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.49.11])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 07:33:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, Kevin Brace <kevinbrace@gmx.com>
Subject: Re: [PATCH 04/28] drm/via: Add via_drv.h
In-Reply-To: <YrawYNw2KOu3yoWl@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220624202633.3978-1-kevinbrace@gmx.com>
 <20220624202633.3978-5-kevinbrace@gmx.com> <YrawYNw2KOu3yoWl@ravnborg.org>
Date: Tue, 28 Jun 2022 17:33:51 +0300
Message-ID: <878rpgrh68.fsf@intel.com>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Jun 2022, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Kevin,
>
> A few nitpicks in the following.
>
> 	Sam
>
> On Fri, Jun 24, 2022 at 03:26:09PM -0500, Kevin Brace wrote:
>> +typedef struct _via_lvds_info {
>> +	u32 x;
>> +	u32 y;
>> +} via_lvds_info;
> Make this look like:
> typedef struct via_lvds_info {
>      u32 x;
>      u32 y;
> };
>
> This follows the normal linux way, and there is only one user anyway.

The normal linux way would be to *not* use typedefs in the first
place. ;)

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
