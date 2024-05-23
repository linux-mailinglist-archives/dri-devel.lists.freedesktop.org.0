Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3348CD315
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 15:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87B110E604;
	Thu, 23 May 2024 13:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TbCgUTo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888BF10E5A9;
 Thu, 23 May 2024 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716469296; x=1748005296;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=YU1eMOQnQRxm5I/RuAMauYfwdnrzT9WMuumUW9BoYIo=;
 b=TbCgUTo/hFqX2Pso70Xqj0BmIf/yrsUdAlTbVv1OIzNU4or3sqi6be8e
 7sFfsX7m0xhKRS8Jr6GmIjGlBfh2d7n0sgtzPy9cSjBRikkjGTAI2fy0O
 1miUtXoOo0A4WF56j6UtWGL7Wej/gZpTMxylHJfRz7tUa+tOs0exheDIH
 jU+SIfudTsDasKxSO1Jnp1JyT40XvGnVsuJUIEwnRVMgY53lfAo/2yy5d
 HFutRVQPLXRalHQOvLyFuntS0PTSyD0LpaOAavkddXKB5L0ZWqzzwpNcQ
 6J3sWLoHTJiHk4kUAi/6jvkRyNVH3EUdgLjk6Jew83Tm0dBhckxLvaulv Q==;
X-CSE-ConnectionGUID: 0p7vi8DWROeHcwju04C0Zg==
X-CSE-MsgGUID: JKzUnCzLRb2/1sx6FaEehA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="23393870"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="23393870"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:01:26 -0700
X-CSE-ConnectionGUID: NyWIvjEIREWR++c9XhDcYg==
X-CSE-MsgGUID: CNGwPIEJQJynh5+mfp0LMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="56890382"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:01:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [RESEND 0/6] drm, nouveau/radeon/amdpgu: edid_blob_ptr cleanups
In-Reply-To: <CADnq5_N75R4G-w=TXz0-kPNseomSK+s4OB8OMyng_tAeGkU+=g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1715353572.git.jani.nikula@intel.com>
 <CADnq5_OMOuz_T-OUZ4jVELEAL1FfFdqoFukKdvZA0eSoPQExLg@mail.gmail.com>
 <87seylewf5.fsf@intel.com>
 <CADnq5_N75R4G-w=TXz0-kPNseomSK+s4OB8OMyng_tAeGkU+=g@mail.gmail.com>
Date: Thu, 23 May 2024 16:00:59 +0300
Message-ID: <878r00ptro.fsf@intel.com>
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

On Mon, 13 May 2024, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Mon, May 13, 2024 at 8:20=E2=80=AFAM Jani Nikula <jani.nikula@intel.co=
m> wrote:
>>
>> On Fri, 10 May 2024, Alex Deucher <alexdeucher@gmail.com> wrote:
>> > On Fri, May 10, 2024 at 11:17=E2=80=AFAM Jani Nikula <jani.nikula@inte=
l.com> wrote:
>> > Series is:
>> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>
>> Thanks, do you want to pick these up via your tree? And do you expect a
>> proper R-b before merging?
>
> Feel free to take them via drm-misc if you'd prefer to land the whole
> set together, otherwise, I can pick up the radeon/amdgpu patches.

Thanks, merged everything to drm-misc-next.

BR,
Jani.

--=20
Jani Nikula, Intel
