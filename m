Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6798B60C8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 19:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4381E10FC0F;
	Mon, 29 Apr 2024 17:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ddKkDBI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBAA10FC0F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 17:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714413410; x=1745949410;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=x+KKUEupzRvgu/3039qLMVGZdpxM9pHGDnjCHOWV7oc=;
 b=ddKkDBI6e8NMfAFLs623p3bAiMIn6rareA/Nni/3+lvNtTunBDNtsjSd
 p+fSNp8WHMFDpr+/TBbDPRjPZ3vOolVX96hY8UaKQM4X9GiLEO9iN+9W7
 5+Q1+kaSF5TloPT9fU8NkDIHAf53JaH8HdV/PcENlxn1HxMUiy9yMdY7T
 QiO7YSgTJ8FR5Y4Z7H0q0L7Kodzz9T+qZv8QwFM6gkfKcXnB/hZvYwklM
 b0S6t4JLMJMBxnDg6JA9Z0VlLc1zxRYcGmu/4nqQsRCD81+gEyf6WKq+P
 LBqeNyGDlzWTZ2UjtdyvOsJdsCqiN9UuistbNGq09FHpr/RZqtCw/iOxX g==;
X-CSE-ConnectionGUID: op2nIF2aT06mkvetLIM0Iw==
X-CSE-MsgGUID: +lK5F04FQkKnhouO5WHEMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="21494753"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="21494753"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 10:56:49 -0700
X-CSE-ConnectionGUID: HdMlwrlPQp6JbzpHHXcctw==
X-CSE-MsgGUID: C0qXiHLuTTK8nnjBJiwYUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="63664665"
Received: from mziotti-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.252.49.213])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 10:56:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Helen Koike <helen.koike@collabora.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
In-Reply-To: <90390c46-27ee-4dd3-b250-3fa950960725@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <20240312-bizarre-rational-sawfish-ccee0a@houat>
 <2ddb4f5e-504e-4ce3-95d2-179dc7e6bf7b@ursulin.net>
 <90390c46-27ee-4dd3-b250-3fa950960725@collabora.com>
Date: Mon, 29 Apr 2024 20:56:43 +0300
Message-ID: <87sez42gtg.fsf@intel.com>
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

On Mon, 29 Apr 2024, Helen Koike <helen.koike@collabora.com> wrote:
> On 01/04/2024 13:49, Tvrtko Ursulin wrote:
>> No issues accessing the repo just a slight confusion and how to handle 
>> the workflow. More specifically, if I have a patch which wants to be 
>> merged to drm-misc-next, is the mailing list based worklflow still the 
>> way to go, or I should create a merge request, or I should apply for 
>> commit access via some new method other than adding permissions to my 
>> legacy fdo ssh account?
>
> I have this same question, I thought we would keep the workflow with dim 
> tool, but after I pointed drm-misc remote to gitlab, dim is not happy.
>
> If I don't point drm-misc to gitlab, dim say it is outdated (but I'm 
> using the last top of the tree of maintainer-tools).
>
> So I was wondering if dim requires changes or if the workflow changed.

The workflow has not changed, only the location of the repo.

I'm afraid there's insufficient info here to say what exactly is going
on though.

BR,
Jani.


-- 
Jani Nikula, Intel
