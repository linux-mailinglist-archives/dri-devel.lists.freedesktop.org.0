Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E323875A55
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 23:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C652310E7EA;
	Thu,  7 Mar 2024 22:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+S//Q6X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0699E10E7EA
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709850910; x=1741386910;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=z3yoOduU3u69M13DhP1GKdubXjf7I83rv5ToA3zA3Wc=;
 b=H+S//Q6XIK/2P4fX6D1kRvxv6NAZYT4iRkg/ZNTk9QOusVJLuAhBp1qO
 kbgkiVq5OY/vyfePKrSc1hX2uiXC2c7qCrz67bLC1UDEu6Fi/5eWvFShQ
 bTlDrXPM3DSC4Fasfo/JKzs8d/l00R+wH2eJXH+7fbQboJ2bT77lAom7l
 BEzSmjz/gt1irIaLX0YULdNCrfJq6uQzBy4w6Vw5HhBrIUBhwSCiyhQDh
 asSKJypvKL2wJ3452fmiSZ4N8azs+OWhFLG3WMOX1jaRhmrNcZ492dCTF
 aq2GAOdo0UVcSfnJKp1xQ7YYWYuxjSimO+vAmjVHXMonNi78ETDIFzLe5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4480792"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4480792"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 14:35:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10823801"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 14:35:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/6] drm/panel-edp: Fix AUO 0x405c panel naming and
 add a variant
In-Reply-To: <CAD=FV=UKWd743ZWOgkP4Sn_aq9ca97QygdEcS93=tcGa7r7s8g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-7-hsinyi@chromium.org>
 <CAD=FV=VvhKZHVzHQdOO=_p0E5m7ig1LY2s5MZRojRynKHbF1xw@mail.gmail.com>
 <87msraw4q6.fsf@intel.com>
 <CAJMQK-izRv18V1o7_Q23vWFXQsFgaR74xxZ4Vby0FVtNn21TMg@mail.gmail.com>
 <874jdhwzw4.fsf@intel.com>
 <CAD=FV=UKWd743ZWOgkP4Sn_aq9ca97QygdEcS93=tcGa7r7s8g@mail.gmail.com>
Date: Fri, 08 Mar 2024 00:35:01 +0200
Message-ID: <87sf11vffu.fsf@intel.com>
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

On Thu, 07 Mar 2024, Doug Anderson <dianders@chromium.org> wrote:
> On Thu, Mar 7, 2024 at 12:28=E2=80=AFPM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
>> If there's one thing that's for sure, EDIDs are full of stuff like this,
>> across the board.
>>
>> Ignoring the whitespace at the end seemed reasonable, initially, to me
>> too. But the question is, if we start catering for this, what else
>> should we cater for? Do we keep adding "reasonable" interpretations, or
>> just go by the spec?
>
> Personally, I don't really care a whole lot either way. If I had to
> make a judgement call I think it's a little cleaner the way Hsin-Yi
> has it where we ignore whitespace at the end. Given that Dmitry also
> suggested ignoring whitespace at the end [1] I guess I'd believe that
> he also feels it's a little cleaner that way. However, If the only way
> to get the patch series landed is to put the space at the end of the
> name in panel-edp.c then I'm OK with that.
>
> In terms of what else we should cater to, I guess we'd have to answer
> that question when it comes up, with a bias against adding more
> special case rules. _Hopefully_ it won't be common that we even need
> this code and it will be the exception rather than the rule that
> panels with incompatible timings have the same panel ID anyway...
>
> In any case, hopefully the above explains my opinion on this. If you
> feel strongly that we should remove the code handling whitespace at
> the end then so be it. If you're on the fence then I guess I'd say
> let's keep it...

No, I don't feel strongly, let's go with this. It's not like it's cast
in stone either.

BR,
Jani.


>
>
> [1] https://lore.kernel.org/lkml/CAA8EJpr7LHvqeGXhbFQ8KNn0LGDuv19cw0i04qV=
Uz51TJeSQrA@mail.gmail.com/

--=20
Jani Nikula, Intel
