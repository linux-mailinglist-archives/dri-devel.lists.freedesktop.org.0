Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B234CA3CD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 12:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D536E10E381;
	Wed,  2 Mar 2022 11:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D8E10E381
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646220844; x=1677756844;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=y0e0DF3MspqEl8ha55uPDWvf5C90XzgSbIFCc/ooqro=;
 b=OfrlGP9NtmVpc2vQ0hsi7qDWibcLg1dZfJud2LobU7t3XeMj3QiFwiG+
 a4E0aZBZDN+wPb4+OH6oVfR2HPGHhk5IHR2syXeH6UZFzPKv0+R1fQ/Cg
 dPxmbmp+gH4F9NmBzd+YG3tYZKa6NiK17qr6O97ssJSg+fir7FgBrqjbl
 Gyr2Dqm8vCQEoDjvWZToAoM5Iz6zBYpexVvtQa6LYYkBxp7kfPT0KAgZ5
 kRlkj0RyunL7DShR/QoxqrlpyF/U0P3Oq6PYMW0PlyppS021aTJKa4EFa
 aVslp0SORq39BYbz9dwLEKrF2Bm4V/q8HpBQNCVlAKgXZmFKPR7cGUbH8 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="250954538"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="250954538"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 03:34:03 -0800
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="510975615"
Received: from ijpoole-mobl.ger.corp.intel.com (HELO localhost) ([10.252.1.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 03:33:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: CA+G9fYu4PPE6_91mzor0bW7RSzBDNJ3xqqgeeK-jR1jokmhYOQ@mail.gmail.com,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: MSM8960: gpu/drm/dp/drm_dp.c:59:27: warning: array subscript 10
 is outside, array bounds of 'const u8[6]'
In-Reply-To: <8e13f51a-845b-1fdf-11ea-6053f7d8df9e@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <8e13f51a-845b-1fdf-11ea-6053f7d8df9e@gmail.com>
Date: Wed, 02 Mar 2022 13:33:56 +0200
Message-ID: <87ee3k6123.fsf@intel.com>
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
Cc: sfr@canb.auug.org.au, tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 dianders@chromium.org, lkft-triage@lists.linaro.org, airlied@redhat.com,
 Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 01 Mar 2022, Rudraksha Gupta <guptarud@gmail.com> wrote:
> Hi all,
>
>
> I am getting this warning when compiling the kernel for the MSM8960 with=
=20
> this defconfig:=20
> https://raw.githubusercontent.com/apq8064-mainline/linux/qcom-apq8064-nex=
t/arch/arm/configs/qcom_apq8064_defconfig
>
>
> Warning:
>
> ../drivers/gpu/drm/dp/drm_dp.c: In function=20
> 'drm_dp_get_adjust_request_post_cursor':
> ../drivers/gpu/drm/dp/drm_dp.c:59:27: warning: array subscript 10 is=20
> outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'}=20
> [-Warray-bounds]
>  =C2=A0=C2=A0 59 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=
 link_status[r - DP_LANE0_1_STATUS];
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~~~~~~~~~~~^~~~~~~~~~~~=
~~~~~~~~~~~
> ../drivers/gpu/drm/dp/drm_dp.c:210:51: note: while referencing 'link_stat=
us'
>  =C2=A0 210 | u8 drm_dp_get_adjust_request_post_cursor(const u8=20
> link_status[DP_LINK_STATUS_SIZE],
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>

Please see https://lore.kernel.org/r/20220225035610.2552144-3-keescook@chro=
mium.org

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
