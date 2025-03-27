Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCF2A731D3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 13:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C3210E31A;
	Thu, 27 Mar 2025 12:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfVJ6vTs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F4D10E31A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 12:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743077126; x=1774613126;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Q6fch+EhQlC0zvrbXFqCs27rgLnaij0KpF5jZcCQ26A=;
 b=JfVJ6vTs8ceej5koZljM4JNAifXTejzSJxw8wjIEYlimAO/Eu96D9924
 kpr+SeViSuJ3lKXQL+dHbE3XyVFIODIgJ0GFHxhBHJxvfxt8uHWrr5ANs
 Ukg0z/fcH+K6sKqdol8gfb13vUTSWZIH2ttRMPJNj255FzF9dZF24UpU9
 qF44G/0XDVjkWO1NmzpkL4b3mWBpsgMUQ/OJI3M9wtKFlBVyxJGOkqw+o
 TMhGj3pk92dg7c4uBzPryrK7NQZx+zs/oPbFKqo+7SZRNNB2G/4HQF38C
 GeFYKvK1WWDB0MaUlHGgo9hehi15U9gzxbhM0Rk4FSZotzhp9b4XgxqhX g==;
X-CSE-ConnectionGUID: 8dPWUosZQl2soJfXgCl5zQ==
X-CSE-MsgGUID: urbtjF27RFSU2saKWFpGHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55405099"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="55405099"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 05:05:26 -0700
X-CSE-ConnectionGUID: zsjvQxW8S/6EpEIcpXifZQ==
X-CSE-MsgGUID: +VLjFLDMRUq7l+RtSNRoQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="125337195"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 05:05:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm: Remove redundant statement in
 drm_crtc_helper_set_mode()
In-Reply-To: <CAAhV-H6AecMYG0t-Ldxy68fm-_Wk4VjcdFfc-s6xwEeddUn-Ew@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241111132149.1113736-1-chenhuacai@loongson.cn>
 <87o72lde9r.fsf@intel.com>
 <CAAhV-H6-yB5d8gXEH9TPHuzx0BJT+g8OCUmwTfSTTtqxfmcHDA@mail.gmail.com>
 <CAAhV-H7m0+-bHp0z0V+uySvBfPym4nMBCCTc5V80mYTfXjpuFA@mail.gmail.com>
 <CAAhV-H6AecMYG0t-Ldxy68fm-_Wk4VjcdFfc-s6xwEeddUn-Ew@mail.gmail.com>
Date: Thu, 27 Mar 2025 14:05:20 +0200
Message-ID: <871pui65mn.fsf@intel.com>
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

On Wed, 26 Mar 2025, Huacai Chen <chenhuacai@kernel.org> wrote:
> Hi, Dave,
>
> Gentle ping, can this patch be merged into 6.15?

Pushed to drm-misc-next.

BR,
Jani.


>
> Huacai
>
> On Mon, Jan 13, 2025 at 10:13=E2=80=AFPM Huacai Chen <chenhuacai@kernel.o=
rg> wrote:
>>
>> Hi, Dave,
>>
>> Gentle ping, can this patch be merged into 6.14?
>>
>> Huacai
>>
>> On Mon, Nov 25, 2024 at 2:00=E2=80=AFPM Huacai Chen <chenhuacai@kernel.o=
rg> wrote:
>> >
>> > On Mon, Nov 11, 2024 at 10:41=E2=80=AFPM Jani Nikula
>> > <jani.nikula@linux.intel.com> wrote:
>> > >
>> > > On Mon, 11 Nov 2024, Huacai Chen <chenhuacai@loongson.cn> wrote:
>> > > > Commit dbbfaf5f2641a ("drm: Remove bridge support from legacy help=
ers")
>> > > > removes the drm_bridge_mode_fixup() call in drm_crtc_helper_set_mo=
de(),
>> > > > which makes the subsequent "encoder_funcs =3D encoder->helper_priv=
ate" be
>> > > > redundant, so remove it.
>> > > >
>> > > > Cc: stable@vger.kernel.org
>> > > > Fixes: dbbfaf5f2641a ("drm: Remove bridge support from legacy help=
ers")
>> > >
>> > > IMO not necessary because nothing's broken, it's just redundant.
>> > Maintainer is free to keep or remove the Cc and Fixes tag. :)
>> >
>> > Huacai
>> >
>> > >
>> > > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>> > >
>> > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> > > > ---
>> > > >  drivers/gpu/drm/drm_crtc_helper.c | 1 -
>> > > >  1 file changed, 1 deletion(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/d=
rm_crtc_helper.c
>> > > > index 0955f1c385dd..39497493f74c 100644
>> > > > --- a/drivers/gpu/drm/drm_crtc_helper.c
>> > > > +++ b/drivers/gpu/drm/drm_crtc_helper.c
>> > > > @@ -334,7 +334,6 @@ bool drm_crtc_helper_set_mode(struct drm_crtc =
*crtc,
>> > > >               if (!encoder_funcs)
>> > > >                       continue;
>> > > >
>> > > > -             encoder_funcs =3D encoder->helper_private;
>> > > >               if (encoder_funcs->mode_fixup) {
>> > > >                       if (!(ret =3D encoder_funcs->mode_fixup(enco=
der, mode,
>> > > >                                                             adjust=
ed_mode))) {
>> > >
>> > > --
>> > > Jani Nikula, Intel

--=20
Jani Nikula, Intel
