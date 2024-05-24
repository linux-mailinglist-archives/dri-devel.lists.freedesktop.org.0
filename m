Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243848CE2E6
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 11:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8733489190;
	Fri, 24 May 2024 09:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqmjQdFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B3A89289;
 Fri, 24 May 2024 09:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716541504; x=1748077504;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=QknNTek5hZ/unaPk2F7O7L5h7E+LUgaHwteegjzsQD8=;
 b=gqmjQdFeaDkLF+AbamwOsofyYMoQNlXfro/MZCUohP3jixgpWgp1X4Ea
 ey6Ba0j302dn36zzRxQEJu5Jbf+EY9uURSY2Or7Y+7b8XIClw2XY5gWhb
 LAxPNU8wWFGScSQGPs0vPAyYGF8S0a10hdL/q66OMYB7X0hTcqkSjFFsy
 NdJ3BT/UpZudApMPAr1IwOZQ7L2S/dE0EBOFdPSkZlKxF1bVhRlWwN9wl
 z9qysk0VZp531DBofKhD7J0jD7YqrX+mWST81MAi9Lpe1h2fc5BO4+Wbg
 HWyaMCPq3SAezTcjDy1dR/gmbeBCQ20k7R8q5v2VFfqqNK/3wBowCfnGz g==;
X-CSE-ConnectionGUID: ///fmO5jR9iJBayK+0Mkaw==
X-CSE-MsgGUID: BXYo/ilBSjqX0RCmE/LBJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16736924"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="16736924"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 02:05:03 -0700
X-CSE-ConnectionGUID: owI/ScNCSAe5LggpAUHqFQ==
X-CSE-MsgGUID: tjoMYhfrTG2Ja7PoLqmA8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34067922"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.108])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 02:04:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Philipp
 Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/4] drm/imx: fix -Wformat-truncation warning in
 imx_ldb_probe()
In-Reply-To: <Zk99m4i82XnQPeKQ@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1716479340.git.jani.nikula@intel.com>
 <c257c4174743f35bafee8492ec60e1d2734450cf.1716479340.git.jani.nikula@intel.com>
 <Zk99m4i82XnQPeKQ@intel.com>
Date: Fri, 24 May 2024 12:04:56 +0300
Message-ID: <87jzjjoa13.fsf@intel.com>
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

On Thu, 23 May 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, May 23, 2024 at 06:51:08PM +0300, Jani Nikula wrote:
>> Enabling -Wformat-truncation yields the following warning:
>>=20
>> ../drivers/gpu/drm/imx/ipuv3/imx-ldb.c: In function =E2=80=98imx_ldb_pro=
be=E2=80=99:
>> ../drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:57: error: =E2=80=98_sel=E2=
=80=99 directive output may be truncated writing 4 bytes into a region of s=
ize between 3 and 13 [-Werror=3Dformat-truncation=3D]
>>   658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i=
);
>>       |                                                         ^~~~
>> ../drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:17: note: =E2=80=98snprintf=
=E2=80=99 output between 8 and 18 bytes into a destination of size 16
>>   658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i=
);
>>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> If only the compiler could count to three...

I did not try, but apparently using %hhd would hide the issue too:

	snprintf(clkname, sizeof(clkname), "di%hhd_sel", i);

BR,
Jani.


>
>>=20
>> Silence the warning by checking the snprintf() return value.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>> ---
>>=20
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> ---
>>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/i=
puv3/imx-ldb.c
>> index 71d70194fcbd..46f779fe60ee 100644
>> --- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
>> +++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
>> @@ -654,8 +654,12 @@ static int imx_ldb_probe(struct platform_device *pd=
ev)
>>  	 */
>>  	for (i =3D 0; i < 4; i++) {
>>  		char clkname[16];
>> +		int len;
>> +
>> +		len =3D snprintf(clkname, sizeof(clkname), "di%d_sel", i);
>> +		if (len >=3D sizeof(clkname))
>> +			dev_err(dev, "clkname truncated\n");
>>=20=20
>> -		snprintf(clkname, sizeof(clkname), "di%d_sel", i);
>>  		imx_ldb->clk_sel[i] =3D devm_clk_get(imx_ldb->dev, clkname);
>>  		if (IS_ERR(imx_ldb->clk_sel[i])) {
>>  			ret =3D PTR_ERR(imx_ldb->clk_sel[i]);
>> --=20
>> 2.39.2

--=20
Jani Nikula, Intel
