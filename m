Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FD0C2ABA3
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 10:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A96110E395;
	Mon,  3 Nov 2025 09:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWllfpT5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E7E10E392;
 Mon,  3 Nov 2025 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762162098; x=1793698098;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=za0LOi3Akcq+0nd65VdUYxnjTaEVvELc9+WsBRzSsqs=;
 b=QWllfpT5ogCXZw6Mm+WR0icqSQXXy/e5T32JvoLSdgADqdY+iamdvP5k
 jqbFaHuxR9Miv6om9U2/vvBQ58cHhvvIy1zGqo2bLWQyfljcuVMBw2Ov6
 hrChN8n423BQSSZSkLC5DJy0Ji2ofmluBUsTTLWO2YtY4pkVEpySZrce0
 PCVME0WNCF96LqY04Ik/f8vfUzOxAaqw7D++bi/hzNMdyQOTOUr3xueRd
 YXHaJGRpoUaNH64P3tXdCz0ug+OxpuasjkeT7jcU2qmqeBXc2IeZTcpaV
 5SRICQyeLpF0B6mFtxk5WLf7bJZMCc90PYgcAgX5p2NAKoJSAMjssKnq1 A==;
X-CSE-ConnectionGUID: aGCUt8FjRcO7Ak/b82YfmQ==
X-CSE-MsgGUID: B3KTJUbaRpqgAF8wtnEj6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="89695596"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="89695596"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 01:28:17 -0800
X-CSE-ConnectionGUID: AyOge3HCReCyj2yLTfwB8g==
X-CSE-MsgGUID: fQ9GZaJQTtOAic0Zt8TyNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="191152064"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.127])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 01:28:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, Maxime
 Ripard <mripard@kernel.org>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 0/4] drm: replace drm_print.h includes from headers
 with a forward declaration
In-Reply-To: <9c67c29b-06e9-469b-9273-eaac368632d6@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1761734313.git.jani.nikula@intel.com>
 <41bb4163-8f5b-47c5-8121-7010147bc5e6@suse.de>
 <b8cc203c44518822197023c2dbf4a21aad681a4c@intel.com>
 <c4e3b172-3df8-4d1b-a1b0-51cacae56f0c@suse.de>
 <18ad4c11261b85614f7e3a2aabe611f2ecbf16a5@intel.com>
 <9c67c29b-06e9-469b-9273-eaac368632d6@suse.de>
Date: Mon, 03 Nov 2025 11:28:12 +0200
Message-ID: <7656e7f21176f08859d1489e398350bca972de2c@intel.com>
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

On Sun, 02 Nov 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 31.10.25 um 11:01 schrieb Jani Nikula:
>> On Thu, 30 Oct 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Am 30.10.25 um 10:31 schrieb Jani Nikula:
>>>> Considering that this touches a lot of drivers, albeit just the include
>>>> lists and thus highly unlikely to cause functional changes or hard
>>>> conflicts, can I go ahead and merge this to drm-misc-next?
>>> Of course, go ahead.
>> Done, thanks again!
>
> Looks like fallout from this series:

Thanks for the report, the fix is at [1]. I was missing a few configs in
my build tests.

BR,
Jani.


[1] https://lore.kernel.org/r/59277a2dd7939ef5fe6e8fc61311873775141ef8.1762=
161597.git.jani.nikula@intel.com


>
>
>  =C2=A0 CC [M]=C2=A0 drivers/gpu/drm/rockchip/rockchip_drm_vop2.o
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function=20
> 'vop2_convert_format':
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:215:17: error:=20
> implicit declaration of function 'DRM_ERROR'; did you mean 'SO_ERROR'?=20
> [-Wimplicit-function-declaration]
>  =C2=A0 215 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0DRM_ERROR("unsupported format[%08x]\n", format);
>  =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^~~~~~~~~
>  =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0SO_ERROR
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function=20
> 'rockchip_vop2_mod_supported':
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:395:33: error:=20
> implicit declaration of function 'drm_dbg_kms'=20
> [-Wimplicit-function-declaration]
>  =C2=A0 395 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dbg_kms(vop2=
->drm,
>  =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~=
~~~~~
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function=20
> 'vop2_setup_scale':
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:602:25: error:=20
> implicit declaration of function 'drm_dbg'; did you mean 'dev_dbg'?=20
> [-Wimplicit-function-declaration]
>  =C2=A0 602 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dbg(vop2->drm, "%s dst_w[%d] should=20
> align as 2 pixel\n",
>  =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~
>  =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function=20
> 'vop2_core_clks_prepare_enable':
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:763:17: error:=20
> implicit declaration of function 'drm_err'; did you mean 'pr_err'?=20
> [-Wimplicit-function-declaration]
>  =C2=A0 763 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0drm_err(vop2->drm, "failed to enable hclk -=20
> %d\n", ret);
>  =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^~~~~~~
>  =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0pr_err
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function=20
> 'vop2_crtc_atomic_disable':
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:967:17: error:=20
> implicit declaration of function 'drm_info'; did you mean 'pr_info'?=20
> [-Wimplicit-function-declaration]
>  =C2=A0 967 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0drm_info(vop2->drm, "wait for vp%d dsp_hold=20
> timeout\n", vp->id);
>  =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^~~~~~~~
>  =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0pr_info
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function=20
> 'vop2_crtc_atomic_enable':
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1758:41: error:=20
> implicit declaration of function 'drm_warn'; did you mean 'dev_warn'?=20
> [-Wimplicit-function-declaration]
>  =C2=A01758 | =C2=A0drm_warn(vop2->drm,
>  =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~
>  =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0dev_warn
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function=20
> 'rk3576_vp_isr':
> linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2198:17: error:=20
> implicit declaration of function 'drm_err_ratelimited'; did you mean=20
> 'pr_err_ratelimited'? [-Wimplicit-function-declaration]
>  =C2=A02198 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0drm_err_ratelimited(vop2->drm, "POST_BUF_EMPTY=20
> irq err at vp%d\n", vp->id);
>  =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~
>  =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0pr_err_ratelimited
>
>
> Best regards
> Thomas
>
>>
>> BR,
>> Jani.
>>
>>

--=20
Jani Nikula, Intel
