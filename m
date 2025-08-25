Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFD3B336C7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EF010E10A;
	Mon, 25 Aug 2025 06:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F592vUhF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281E310E10A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 06:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756104775; x=1787640775;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Pw4R0JRwOlo69W0fOMxFrongozeKctpnEVzcC+YMLEE=;
 b=F592vUhFwlY5EG1tN/I4UW8wCo1ikRA6cGbC6uKBRKpp0ruk9gkaGZ2b
 NDP9LKlc672jPaih8XGv38wPOVEueiXH7aKU1DbRc89Zc+1zklnfN9F1D
 YcnPFdZ/jfrf+qUzlPa85OzUFZrHEH+vPRJAkflzXkTYkGnjmre43J9pH
 3Vlzz0b3iu1iP59pSPUap5U2gmQls5LO5yUAum9ibfWnttStnUgsV+TjP
 P+Fi1UgHG/NLPEPiF6oHjsNuiYomTZKuYmFN/Ny8Ol/o7+yWbwZbXJnlj
 ylw6q1vNbY5h4pcrriBQeRYuFlggiTkXxCtib1niuTUDaR88VCdxNKxRU A==;
X-CSE-ConnectionGUID: iiSS+o9MTgu2uCQk42BsEw==
X-CSE-MsgGUID: qu2A1FM7RNab+Gc5FzVaBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69682425"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="69682425"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 23:52:55 -0700
X-CSE-ConnectionGUID: F/CmuwEbRs2WnANUvpaGiQ==
X-CSE-MsgGUID: KM07or7OT3yxCBhxmAkgpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="169147423"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.15])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 23:52:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>, Sidhartha Kumar
 <sidhartha.kumar@oracle.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH v2 0/6] DRM IDR to Xarray conversions
In-Reply-To: <aKiEUlldVf2YazK9@casper.infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250821145429.305526-1-sidhartha.kumar@oracle.com>
 <f69669c873dbb99c239e9f2ddf154e983baa61e3@intel.com>
 <e80a3fd9-56ca-40c5-8ac8-237ce14cc79f@oracle.com>
 <aKiEUlldVf2YazK9@casper.infradead.org>
Date: Mon, 25 Aug 2025 09:52:48 +0300
Message-ID: <586cd833db27544321eb9521720803e148519557@intel.com>
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

On Fri, 22 Aug 2025, Matthew Wilcox <willy@infradead.org> wrote:
> On Fri, Aug 22, 2025 at 10:36:24AM -0400, Sidhartha Kumar wrote:
>> On 8/22/25 8:33 AM, Jani Nikula wrote:
>> > It would be great if the commit messages mentioned whether the
>> > identifiers are expected to remain the same in the conversion.
>> 
>> By identifiers do you mean if the name of the previous idr variable is the
>> same as the XArray variable that is introduced? Sure I can add that in a v3.
>
> I think Jani means that the actual numbers assigned should remain the
> saame after the conversion.

Yes. Do they?

BR,
Jani.


-- 
Jani Nikula, Intel
