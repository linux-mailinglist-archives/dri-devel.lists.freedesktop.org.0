Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19AE95EE5E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 12:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B9E10E188;
	Mon, 26 Aug 2024 10:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGL3OamG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A0A10E187;
 Mon, 26 Aug 2024 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724667622; x=1756203622;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=WIRbzgRFzegd7jBvkQsNFq2d4n2EVHmRsEJmbaKa90I=;
 b=bGL3OamGAqFw5jpNaFceiYdMpsb0xUhb7E296fea99I04loUaHprYsLw
 JsuMaDfEeIhfrjKfO6np/nYYmJPzQv5ombljCPpWGCrLQHBR8UThl+Y/Z
 zfqdzjNzDGY1Fho0/a1er78bfeT+NGiKybyvk5AZMCp7u3kjlPHy6t6F7
 1cWW89he2jCYGQs8kYvsoYY47ov1ovHuFqSXPhli3mOhkx7coq9h7auCf
 i9L5+T9yWTrIpYAaZo9lYFbrt3dvE0sIcC1Dmrx2t7VJ8yqpBKRkbxk0Z
 CfGygx0NKFanCA7xY5RDTZjgtoBgozmFNCCBDTgrjcOj0M0dS0sF4Teqv w==;
X-CSE-ConnectionGUID: ajhPhSr+T/2fPtvhLdFFoQ==
X-CSE-MsgGUID: 4rZjgNLnTLygIdSIkgmMBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26845367"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="26845367"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 03:20:22 -0700
X-CSE-ConnectionGUID: sFLx+cFyRY2bEQziG9GNdg==
X-CSE-MsgGUID: xiEqFIx1Q6OX+68Hv62Vjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62984641"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.113])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 03:20:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/ttm: fix kernel-doc typo for @trylock_only
In-Reply-To: <704af387-a984-4fcb-866a-1e95a22e50b9@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240823141110.3431423-1-jani.nikula@intel.com>
 <704af387-a984-4fcb-866a-1e95a22e50b9@amd.com>
Date: Mon, 26 Aug 2024 13:20:07 +0300
Message-ID: <878qwj37s8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 23 Aug 2024, Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> Am 23.08.24 um 16:11 schrieb Jani Nikula:
>> s/tryock_only/trylock_only/
>>
>> Fixes: da966b82bf3d ("drm/ttm: Provide a generic LRU walker helper")
>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thanks, pushed this one patch to drm-misc-next.

BR,
Jani.

>
>> ---
>>   include/drm/ttm/ttm_bo.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> index d1a732d56259..7294dde240fb 100644
>> --- a/include/drm/ttm/ttm_bo.h
>> +++ b/include/drm/ttm/ttm_bo.h
>> @@ -222,7 +222,7 @@ struct ttm_lru_walk {
>>   	struct ttm_operation_ctx *ctx;
>>   	/** @ticket: The struct ww_acquire_ctx if any. */
>>   	struct ww_acquire_ctx *ticket;
>> -	/** @tryock_only: Only use trylock for locking. */
>> +	/** @trylock_only: Only use trylock for locking. */
>>   	bool trylock_only;
>>   };
>>=20=20=20
>

--=20
Jani Nikula, Intel
