Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080E79738B6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 15:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2463F10E7EB;
	Tue, 10 Sep 2024 13:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iwV2qZmF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7444410E7C6;
 Tue, 10 Sep 2024 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725975368; x=1757511368;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=bWD+o8KR69qXBUVSFXEAR0R1mo4D5zSs0Cl53nCCUp4=;
 b=iwV2qZmFBcdBj2dZ4BS9veSSEQWNhQB04k+P+/3XzNAQ1F1WRjLBr88g
 z0qafE3Hi0yPeK43KbB/6hj8lanuUoCdlpmlIkVPtm9Ap2/5HjtrWu3dS
 SY0rVfOR4RRJak9KmdTCwMOI/EEsh0S9IG2FCt0PhRfOjB/AL1fQK7bFB
 fHYMxJSN53s60TgSjxmZwLmkKSB+EBUjjzfmWcB7Qnp2obKhlvc6Q2VYE
 RfWZ7kJ9+PHB1wjHGk5uOkVWf9iYA0nE0GYXdaqYl//J8FtQH31Efv6Op
 0ji/Vx3FY9AHZRjQz81tFeLM/qxnVICS/vjojuZ2H1lcWlLyzx/3zjF7q Q==;
X-CSE-ConnectionGUID: d1xTW1EJRaSLBcg/AG7uAQ==
X-CSE-MsgGUID: ifbWFApLQ8qgIEiHwIDnsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28501156"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="28501156"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:36:07 -0700
X-CSE-ConnectionGUID: ZbmI76sOT6q2eUd+7Tv9gA==
X-CSE-MsgGUID: GamQzzQKQ8isLVFasF1m1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="71624320"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:36:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/8] drm: renesas: rcar-du: annotate rcar_cmm_read()
 with __maybe_unused
In-Reply-To: <CAMuHMdWJDKO-0o9GiGzuZ=yuYpZ1myB+A00zYwNj=+6baAq3Rw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <f2b721e28b9ee2711d7848abf1774ecb8ce8e5e2.1725962479.git.jani.nikula@intel.com>
 <CAMuHMdWJDKO-0o9GiGzuZ=yuYpZ1myB+A00zYwNj=+6baAq3Rw@mail.gmail.com>
Date: Tue, 10 Sep 2024 16:36:01 +0300
Message-ID: <87jzfjk4vy.fsf@intel.com>
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

On Tue, 10 Sep 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Jani,
>
> On Tue, Sep 10, 2024 at 12:06=E2=80=AFPM Jani Nikula <jani.nikula@intel.c=
om> wrote:
>> Building with clang and and W=3D1 leads to warning about unused
>> rcar_cmm_read(). Fix by annotating it with __maybe_unused.
>>
>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>> inline functions for W=3D1 build").
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Thanks for your patch!
>
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
>> @@ -32,7 +32,7 @@ struct rcar_cmm {
>>         } lut;
>>  };
>>
>> -static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
>> +static inline __maybe_unused int rcar_cmm_read(struct rcar_cmm *rcmm, u=
32 reg)
>>  {
>>         return ioread32(rcmm->base + reg);
>>  }
>
> This function was never used. Why not remove it instead?

Can do if that's what the maintainers desire. It's just that sometimes
it's better to have the implementation reviewed and ready waiting for
the users than requiring the first user to add the implementation. I
opted for __maybe_unused across the series.

BR,
Jani.

>
> Gr{oetje,eeting}s,
>
>                         Geert

--=20
Jani Nikula, Intel
