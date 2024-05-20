Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84878C99E8
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 10:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE35A10E0D1;
	Mon, 20 May 2024 08:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2dVLog1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED9910E0D1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 08:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716194448; x=1747730448;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=ib4up5biJ9yf4E2dMluX5ULhfpfioZatI8DjMHoloqg=;
 b=Z2dVLog1HLB8R/E/p9fxPDYrZBwJ+ajnpaIkLdtIDz7gJyzce2pPz5et
 Geoo378dvfMp1TlZL5GIqjVMLL1l2DTeUcppUgdRKvS74/r64QuL38PtC
 vc90W322SLE56eAlYXqLsO3tOA7ju4t60mzxK5ENOzsL2ZZPvPabkObUM
 2++6r9qWZ1OVn+9Wt/UF+snKtT3g+rqQqaxEN32gDMc0YV42YIGv0a6Ah
 VDiXpprqhxhn3RBYCVnkYxgYNnX4X7T/KOJyHlRZHm7kVcESBlgfdoa+1
 glm5l8wvgNFVZtDZdYitLRkamTszDMsE8XilzJwpbe9RxADhIpYHjBvaR w==;
X-CSE-ConnectionGUID: QQ0xArOyRdypnnscQaihSA==
X-CSE-MsgGUID: 18TIyqvnSfils3Uj+3aJWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12158088"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="12158088"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 01:40:47 -0700
X-CSE-ConnectionGUID: RXJ//5FNQUi4RJZ18kcG3g==
X-CSE-MsgGUID: 6jXx3veLQxOyNFreuVrnkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="36873752"
Received: from unknown (HELO localhost) ([10.245.246.99])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 01:40:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sefa Eyeoglu <contact@scrumplex.net>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/edid: add non-desktop quirk to Bigscreen Beyond HMD
In-Reply-To: <0d800997f7dab23514160ed6a61e8778b7bee57e.camel@scrumplex.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240517105555.654262-1-contact@scrumplex.net>
 <20240517141049.896023-3-contact@scrumplex.net>
 <2d9d1985284b0255e7366ded97124b3590261a6e.camel@pengutronix.de>
 <0d800997f7dab23514160ed6a61e8778b7bee57e.camel@scrumplex.net>
Date: Mon, 20 May 2024 11:40:42 +0300
Message-ID: <87h6esvpth.fsf@intel.com>
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

On Fri, 17 May 2024, Sefa Eyeoglu <contact@scrumplex.net> wrote:
> On Fri, 2024-05-17 at 16:52 +0200, Philipp Zabel wrote:
>> On Fr, 2024-05-17 at 16:09 +0200, Sefa Eyeoglu wrote:
>> > The Bigscreen Beyond VR headset is a non-desktop output and should
>> > be
>> > marked as such using an EDID quirk.
>> >=20
>> > Closes https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/39
>>=20
>> From the EDID posted there, it looks like the quirk should not be
>> necessary?
>>=20
>> The quoted DisplayID extension block correctly marks this as an HMD:
>>=20
>> =C2=A0 "Display Product Primary Use Case: Head-mounted Virtual Reality
>> (VR) display"
>>=20
>> The update_displayid_info() function in drm_edid.c should use this
>> information to set the non_desktop flag already. Doesn't this work as
>> expected?
>>=20
>>=20
>> regards
>> Philipp
>
> I see.
>
> The only potential reason I can come up with is that the DisplayID
> block is incomplete.
>
> $ edid-decode --check
> Failures:
>
> Block 0, Base EDID:
>   Standard Timings: Missing preferred timing.
> EDID:
>   DisplayID: Missing DisplayID Product Identification Data Block.
>   DisplayID: Missing DisplayID Display Parameters Data Block.
>   DisplayID: Missing DisplayID Display Interface Features Data Block.
>
> EDID conformity: FAIL

I've commented on the bug, but I don't think these should matter. We
should be able to deduce the primary use from the DisplayID header.

BR,
Jani.



--=20
Jani Nikula, Intel
