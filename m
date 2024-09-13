Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE92977ECF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 13:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49BA10ECED;
	Fri, 13 Sep 2024 11:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anzhaZUb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E4010ECEA;
 Fri, 13 Sep 2024 11:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726228033; x=1757764033;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9Kb5uQFj2rlWuIItuuA0YD6oucyhftnZoRXdtQ3VhFk=;
 b=anzhaZUbIHast6c1ZhqBy0dC3TSVt4j2DqsCwxYOw+KzVR3EWHhcE9N9
 ol6Pb91amemIZaSEeH6OC/iAXql/TgRJuBpg8Pjfl6v6/pQ+8ZI0OUMUm
 vuLaQcVbgKhid8swFXbICoHL2iOT29TjeJEIGMW0McBXlrcN3XSh/NGCi
 DP6d8NggbJ7cBVl/DhtbPtsaMIj+H75iOfZun/DtiXD6hVCb2rj0QiuIn
 SlIBjqRGoyzJylfoX8eTLiuAOr3809TD0KLbHzyueUX9jvKGJnSftzRoH
 SdoD9XKovbE1HRB70B795y3YaqZ5n9o1hXYH00sSLVagfLZMKyUDgL3j0 g==;
X-CSE-ConnectionGUID: 6FyUdglbS8+G8Qr7o5jKEw==
X-CSE-MsgGUID: M5sLBk5XR86vZbqw6e/eXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25251277"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="25251277"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:47:12 -0700
X-CSE-ConnectionGUID: aramv6uoRkexLjnYATkw7A==
X-CSE-MsgGUID: mVxZi3mdQfCEnKS6S/CKbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="67969687"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.64])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:47:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Matt Coster <Matt.Coster@imgtec.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Nathan
 Chancellor <nathan@kernel.org>, Frank Binns <Frank.Binns@imgtec.com>
Subject: Re: [PATCH 5/8] drm/imagination: annotate pvr_fw_version_packed()
 with __maybe_unused
In-Reply-To: <8c97287c-732d-475a-83d6-1c470ad68109@imgtec.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <190e4eefef6c5e62052a01af0084c69361e216ef.1725962479.git.jani.nikula@intel.com>
 <8c97287c-732d-475a-83d6-1c470ad68109@imgtec.com>
Date: Fri, 13 Sep 2024 14:47:05 +0300
Message-ID: <87bk0repxi.fsf@intel.com>
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

On Tue, 10 Sep 2024, Matt Coster <Matt.Coster@imgtec.com> wrote:
> On 10/09/2024 11:03, Jani Nikula wrote:
>> Building with clang and and W=1 leads to warning about unused
>> pvr_fw_version_packed(). Fix by annotating it with __maybe_unused.
>> 
>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>> inline functions for W=1 build").
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> I've been meaning to do something about this for a while, thanks!
>
> Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.

-- 
Jani Nikula, Intel
