Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F387976CA7E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 12:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAB610E52E;
	Wed,  2 Aug 2023 10:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026F010E53C;
 Wed,  2 Aug 2023 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690970981; x=1722506981;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ONzB0seRRHiclo5dMgN21BC+phncruTYL7IKOB4VVg4=;
 b=cRJ/2i1a+iugEtu+11PNc5pYtyeGVB4jKQ2pqs4Piss+OL7MeZwdvT9a
 1GAwx60cVY7wqXOcQ5wpgwWOlF/p+i+3ZnksYh3M2vhRZWxQLFo2hnKfJ
 tx1YILpNVnLBFucITeWdbQgQybw52qAeUWFXd9wQxc5f6WFrGm3+Rn8Ij
 5BYYAi13qAcwR8yEQblx26rv62lkIZLh1OH3ZcdKc8P+IWcGdoVc0hY3j
 MKXF7ZPVIPrqaVKI5Un267lD/wkgUjN7ZmbRQKK5Ifeex7IZAZzVD45EX
 8ExzMr2YVRE79n+wg/EXzPTE0rtrYJ85qLpWPXUjhCl3ZDOMO96mFrjnM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="367003301"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="367003301"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 03:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="764167575"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="764167575"
Received: from osalyk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.215])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 03:09:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Ran Sun <sunran001@208suo.com>,
 alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu73_discrete.h
In-Reply-To: <2f4f53e2-b12b-c77c-e7cb-8c0436a209e5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230801100024.8215-1-sunran001@208suo.com>
 <ZMjposYeMFxU5nE9@debian.me> <87cz07vvwu.fsf@intel.com>
 <2f4f53e2-b12b-c77c-e7cb-8c0436a209e5@gmail.com>
Date: Wed, 02 Aug 2023 13:09:35 +0300
Message-ID: <87o7jpvjq8.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 02 Aug 2023, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> On 01/08/2023 18:34, Jani Nikula wrote:
>> On Tue, 01 Aug 2023, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>> And it is unfortunate that you and @208suo.com people doesn't reply to
>>> review comments (try searching lore.kernel.org)
>> 
>> Essentially a one-way firehose of patches pointed at our general
>> direction is not benefitial to the community. It's not participation,
>> it's not co-operation. If the review gets ignored, why should we invest
>> our time on *any* of the patches?
>> 
>> 
>
> Well, I guess this is the kind of "hey, some new orgs spam us tens
> of trivial patches, then we review them as usual, but people from
> that org are deaf in regards of our reviews (maybe deliberately?)".
> The exact same situation happened last year with @cdjrlc.com
> people, when they were notoriously known for spell-fixing and
> redundant word fixing patches. Many of these patches were correct,
> but some of them were not, triggering reviews requesting changes.
> Yet, they also ignore the reviews.

Since these emails, there have been 50+ more individual patches. :(

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
