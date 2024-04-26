Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CCC8B314C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 09:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F8610FD14;
	Fri, 26 Apr 2024 07:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cW5BR3Pu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398F910FD14
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 07:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714116515; x=1745652515;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=LgLW+wWZSsAMa3NKLKxHluuN2jf1Ir4WoRwXG2o4cJ0=;
 b=cW5BR3Puw9yfuO/XlyA/+OseR4c1wooZfmvAkEq57DRTzOEGwmE+OCYn
 P/CgU6pxdztkjwnSA0PK/YYBV+bI6P85LyC13eZslsKHUTjYroH2QyxV/
 /b55pkP2m/pKl11pUwLDMbUzhKYlZirJhEDhzoqEiu20g/dXAayq13Ja3
 9IvIYNXbHYPsdfU8OoxYK3Jrr9aYnrqIG650atqn48eVcm6Edi91OWw5D
 FEtTUg+F7SJdcP6U5UFMZfW49wtkS68kGRgi5tVFcsFwgMW0Zn/OxPHdG
 NtDf4ozksbGZ1+5TS8kz7BXVbexG2f9uWL9Hg8zenwTXe2X2JcD2IzQni w==;
X-CSE-ConnectionGUID: UXXkepNdQMy9QVk6dau37Q==
X-CSE-MsgGUID: TG0xdv9lS1CDIKz8lgrBrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10005791"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="10005791"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 00:28:34 -0700
X-CSE-ConnectionGUID: HdqJrNQwTma+HJe+2rtppA==
X-CSE-MsgGUID: ROgZx4GKRE6VmmjwX/uiag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="29784266"
Received: from dgarbuz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.145])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 00:28:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard
 <mripard@kernel.org>, noralf@tronnes.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/print: drop include seq_file.h
In-Reply-To: <703d9f05-499f-41d5-a892-b5c2ee2ab814@tronnes.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240422121011.4133236-1-jani.nikula@intel.com>
 <20240422121011.4133236-2-jani.nikula@intel.com>
 <703d9f05-499f-41d5-a892-b5c2ee2ab814@tronnes.org>
Date: Fri, 26 Apr 2024 10:28:29 +0300
Message-ID: <87cyqc60rm.fsf@intel.com>
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

On Thu, 25 Apr 2024, Noralf Tr=C3=B8nnes <noralf@tronnes.org> wrote:
> On 4/22/24 14:10, Jani Nikula wrote:
>> Never include where a forward declaration will suffice.
>>=20
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Link: https://patchwork.freedesktop.org/patch/msgid/20240410141434.15790=
8-2-jani.nikula@intel.com
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  include/drm/drm_print.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>> index 561c3b96b6fd..089950ad8681 100644
>> --- a/include/drm/drm_print.h
>> +++ b/include/drm/drm_print.h
>> @@ -28,7 +28,6 @@
>>=20=20
>>  #include <linux/compiler.h>
>>  #include <linux/printk.h>
>> -#include <linux/seq_file.h>
>>  #include <linux/device.h>
>>  #include <linux/dynamic_debug.h>
>>=20=20
>> @@ -36,6 +35,7 @@
>>=20=20
>>  struct debugfs_regset32;
>>  struct drm_device;
>> +struct seq_file;
>>=20=20
>>  /* Do *not* use outside of drm_print.[ch]! */
>>  extern unsigned long __drm_debug;
>
> Looks like this broke komeda and omapdrm on arm:
>
> /home/notro/develop/dim-linux/src/drivers/gpu/drm/arm/display/komeda/kome=
da_pipeline.c:
> In function =E2=80=98komeda_pipeline_dump_register=E2=80=99:
> /home/notro/develop/dim-linux/src/drivers/gpu/drm/arm/display/komeda/kome=
da_pipeline.c:366:9:
> error: implicit declaration of function =E2=80=98seq_printf=E2=80=99; did=
 you mean
> =E2=80=98drm_printf=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>   366 |         seq_printf(sf, "\n=3D=3D=3D=3D=3D=3D=3D=3D Pipeline-%d =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n",
> pipe->id);
>       |         ^~~~~~~~~~
>       |         drm_printf
>
> /home/notro/develop/dim-linux/src/drivers/gpu/drm/omapdrm/omap_fb.c: In
> function =E2=80=98omap_framebuffer_describe=E2=80=99:
> /home/notro/develop/dim-linux/src/drivers/gpu/drm/omapdrm/omap_fb.c:325:9:
> error: implicit declaration of function =E2=80=98seq_printf=E2=80=99; did=
 you mean
> =E2=80=98drm_printf=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>   325 |         seq_printf(m, "fb: %dx%d@%4.4s\n", fb->width, fb->height,
>       |         ^~~~~~~~~~
>       |         drm_printf
>
> Noralf.

Sad trombone. I built on arm and arm64, with omap and komeda enabled,
but apparently still missed some options. Sorry. :(

Dave fixed these when pulling drm-misc-next, so a backmerge from
drm-next to drm-misc-next should handle it.

Sorry again,
Jani.



--=20
Jani Nikula, Intel
