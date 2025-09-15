Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C17AB574D1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 11:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7B010E3C8;
	Mon, 15 Sep 2025 09:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbGODoVQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B96A10E3C8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 09:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757928282; x=1789464282;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tD5xMJ+HIB9BMTGKRYgtgKmgAivHmI8vVEM7EgWusqU=;
 b=JbGODoVQLOlcl7FZva2yFecbRudff+QrkKbSAiFpCRqFCobEUiaVWnAf
 s7H2/CkaHzFujZd6IGKZDqZUCERLkii06iOqroGdTA3yB6V/wYSmge3Yl
 PHxeILqkoX6CAIz+HT2kz/QaMcHIn2R1GqLDegMqx6j0l1OCO0KBfp7MW
 XooZq0+aZQpNALY4lCgIPMJBuC1M+D8zInxgxp+U5BocL647Pr8PLa8mf
 wQOdNXN0k71W95m6NzBykrdz6e5mlsnn8RVIwvf/YBI/5orEo84d5I51J
 61zkGoALiZ2nEgbEibJr8SK6tfcNSUL7mBZ4NglpSiuzFca7e+qVrE6+Y A==;
X-CSE-ConnectionGUID: pDm1pDbiQVGhB8y/mdRKOA==
X-CSE-MsgGUID: Ne681WmARp+RHhxSzLz47A==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60320276"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="60320276"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:24:40 -0700
X-CSE-ConnectionGUID: GQxe5/K+SeCo3qNtsD0WzQ==
X-CSE-MsgGUID: q83DL9VtQYGhMoFHIC4R7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="174500058"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:24:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Tiago Martins =?utf-8?Q?Ara=C3=BAjo?=
 <tiago.martins.araujo@gmail.com>
Cc: dri-devel@lists.freedesktop.org, simona@ffwll.ch
Subject: Re: DisplayID checksum validation blocking hardware capabilities -
 CSO T3 panel
In-Reply-To: <CAPM=9twtwNGjEXBv1Yj6vNLfEMPxuMgepOkhBKQYYtm0cmc45Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
 <CAPM=9twtwNGjEXBv1Yj6vNLfEMPxuMgepOkhBKQYYtm0cmc45Q@mail.gmail.com>
Date: Mon, 15 Sep 2025 12:24:34 +0300
Message-ID: <54375f5e6c5290aa218812c489ffe88e594217bd@intel.com>
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

On Mon, 15 Sep 2025, Dave Airlie <airlied@gmail.com> wrote:
>> Questions for Community
>> =======================
>>
>> This issue raises several questions about DisplayID validation approach:
>>
>> 1. Is this strict validation intentional for all hardware? What are the
>>    security or stability reasons for treating checksum errors as fatal?
>>
>> 2. Are minor checksum variations expected in real-world panels? Is this
>>    type of manufacturing variation common?
>>
>> 3. How should the kernel handle hardware with minor EDID/DisplayID issues?
>>    Are there existing mechanisms for such compatibility cases?
>>
>> 4. What would be the preferred approach for handling this type of
>>    compatibility issue? Are there existing precedents or guidelines?
>>
>> 5. Are other users experiencing similar DisplayID validation failures?
>>    Is this an isolated case or part of a broader pattern?
>
> There is code already to ignore EDID checksum for CEA extension
> blocks, look for EDID_BLOCK_CHECKSUM, it probably could be extended to
> cover displayid blocks,

IIRC we ignore CEA extension checksum errors because hubs that
incorrectly modified the display's EDID on the fly were so common.

Anyway, this is not just about EDID extension block checksums, it's also
about DisplayID structure checksum.

I'm not sure if the attached EDID is complete, but it's looking like
just about all the checksums in it are garbage.

> Otherwise I do wonder how common this is, and whether it should be
> quirk per panel or just always do it.

I think Jon Postel was wrong, and we should never have been liberal in
accepting garbage and pretending it was valid data. But with EDIDs, that
ship has sailed, and here we are.

Considering that a valid checksum isn't exactly a guarantee of valid
EDID data inside, I'm starting to lean towards just debug logging EDID
and DisplayID checksum errors, and using whatever data we can find
inside.


BR,
Jani.

-- 
Jani Nikula, Intel
