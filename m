Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA12E875393
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 16:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD621137EC;
	Thu,  7 Mar 2024 15:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJnNILwI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C79F1137EC;
 Thu,  7 Mar 2024 15:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709826205; x=1741362205;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=2HqPzFpX0OzMuloy5wGh5XEs20Wq1eE9eX8QjALBGis=;
 b=FJnNILwIDi/eYSlZqRnO8+j6/uZ594ctwixe6LFEfU5hRmB1gWVNYTzs
 X1XIB2ZnI/YsPxH3Bqpor4rbGQsgkn9vPooiqeoUd5+gEDILvPaLnTKpT
 GSaXszmPmYA/eBepn9yO81IjQ9aiwQjxYvZiu0GoUk0kQdt42LhS3RBea
 5/r7ym52knoF2WpMFK8ebPLaxoqnIviG5L+j2sCCNFb/hCy/zcJ7QmVCx
 Xs+FOL2AOOSbNyVjhwuKwEK60K/0BTi8xZ3mYXy0EDPlVAE71RQf9mO1n
 92jUc31jrAIXXMyqDVvmQl/syP2DtxfGzA2jzAbjv/2B3vGFX1iYn6zGM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="7442134"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="7442134"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 07:43:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="47625653"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 07:43:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David
 Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Masahiro Yamada
 <masahiroy@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 22/22] drm: ensure drm headers are self-contained and
 pass kernel-doc
In-Reply-To: <CAMuHMdV+54MEdrgYr+4cXnd4oN9i3_cxrpLRhJVzuJuRoUs3Qw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula@intel.com>
 <202403071317.uoW18ZR3-lkp@intel.com> <878r2uxwha.fsf@intel.com>
 <CAMuHMdV+54MEdrgYr+4cXnd4oN9i3_cxrpLRhJVzuJuRoUs3Qw@mail.gmail.com>
Date: Thu, 07 Mar 2024 17:43:16 +0200
Message-ID: <877cievyi3.fsf@intel.com>
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

On Thu, 07 Mar 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Jani,
>
> On Thu, Mar 7, 2024 at 9:44=E2=80=AFAM Jani Nikula <jani.nikula@intel.com=
> wrote:
>> On Thu, 07 Mar 2024, kernel test robot <lkp@intel.com> wrote:
>> > kernel test robot noticed the following build errors:
>>
>> So I'm trying to make include/drm/ttm/ttm_caching.h self-contained by
>> including <linux/pgtable.h> with [1], but it fails like below.
>>
>> Cc: Thomas and Geert, better ideas for the include there? Looks like
>> include/asm-generic/pgtable-nop4d.h isn't self-contained on m68k.
>
> I have sent a fix
>
> https://lore.kernel.org/r/ba359be013f379ff10f3afcea13e2f78dd9717be.170980=
4021.git.geert@linux-m68k.org

Thanks! I've picked this up as part of my series, and will include it
with the other remaining patches when I post a v2, aiming to merge all
of them via drm-misc-next.

BR,
Jani.

>
> Gr{oetje,eeting}s,
>
>                         Geert

--=20
Jani Nikula, Intel
