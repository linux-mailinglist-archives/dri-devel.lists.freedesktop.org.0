Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60E5A4E2EA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 16:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F393710E610;
	Tue,  4 Mar 2025 15:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6tBUcRK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DBC10E610
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 15:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741101766; x=1772637766;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=+dAPuvvzkT/7liQQpyStWyWFx3lvMg5W0ztMqyxWWmg=;
 b=e6tBUcRKnFgQPXtjumnvq3TnNAXvn3mcPBH/Sfew9IucI6EAe+vyJThA
 cdoG8/FIzDKmHQFOSwlSWJwLLEr8i43YFi2jIIlNPxyq6fGHdNJEjAx/7
 QBoVYfJ9k1wEd9n/QnZPYwjVMEfmkDzPd4tIfco0u2lEAz4TpopNXWjCj
 aiPTlKDRO6eC8CXmTcVIH6cdqZ5YNFHum4Ug0q8O6vGwXvOPDzdWZoJUO
 C5KVfSWqibIrwC8I/ZKLPhWbDqnBJiOuTKW8IM1ADi1sDGtpSno1OYtfQ
 SPCh0/IBRlWLtzrgw2j5+5g5S9GFCUZmSfO9Dgk//Ny3dR6IBnftGdPbQ Q==;
X-CSE-ConnectionGUID: WHPMVWh8TTqn+uTOSy9JCQ==
X-CSE-MsgGUID: H85hxYisR0qTUCjqISyBgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41738248"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="41738248"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 07:22:45 -0800
X-CSE-ConnectionGUID: qXLQoZ6hQTGUg/NhszrptA==
X-CSE-MsgGUID: q8671CrASSiGtXIWFAnN1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122532571"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 07:22:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Aun-Ali Zaidi <admin@kodeit.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Atharva Tiwari
 <evepolonium@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>, Nathan Chancellor
 <nathan@kernel.org>
Subject: Re: [PATCH] drm/appletbdrm: Fix format specifier for size_t variables
In-Reply-To: <PN3PR01MB959766B5334E2D3B953ADE0EB8C82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250304-appletbdrm-fix-size_t-specifier-v1-1-94fe1d2c91f8@kernel.org>
 <PN3PR01MB959766B5334E2D3B953ADE0EB8C82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 04 Mar 2025 17:22:38 +0200
Message-ID: <877c54zupt.fsf@intel.com>
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

On Tue, 04 Mar 2025, Aditya Garg <gargaditya08@live.com> wrote:
>> On 4 Mar 2025, at 6:49=E2=80=AFPM, Nathan Chancellor <nathan@kernel.org>=
 wrote:
>>=20
>> =EF=BB=BFWhen building for a 32-bit platform, there are some warnings (o=
r errors
>> with CONFIG_WERROR=3Dy) due to an incorrect specifier for 'size_t'
>> variables, which is typedef'd as 'unsigned int' for these architectures:
>>=20
>>  drivers/gpu/drm/tiny/appletbdrm.c:171:17: error: format specifies type =
'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-W=
error,-Wformat]
>>    170 |                 drm_err(drm, "Actual size (%d) doesn't match ex=
pected size (%lu)\n",
>>        |                                                                =
             ~~~
>>        |                                                                =
             %zu
>>    171 |                         actual_size, size);
>>        |                                      ^~~~
>>  ...
>>  drivers/gpu/drm/tiny/appletbdrm.c:212:17: error: format specifies type =
'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-W=
error,-Wformat]
>>    211 |                 drm_err(drm, "Actual size (%d) doesn't match ex=
pected size (%lu)\n",
>>        |                                                                =
             ~~~
>>        |                                                                =
             %zu
>>    212 |                         actual_size, size);
>>        |                                      ^~~~
>>=20
>> Use '%zu' as suggested, clearing up the warnings.
>>=20
>> Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 M=
acs")
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>> ---
>> drivers/gpu/drm/tiny/appletbdrm.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> This went into my spam for some reason, but looks like Jani already infor=
med you about my Ack :)

Thanks for the patch and ack, pushed to drm-misc-next.

BR,
Jani.



--=20
Jani Nikula, Intel
