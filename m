Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CFD16005F
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 21:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8876E229;
	Sat, 15 Feb 2020 20:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEC76E229
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 20:08:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 151F520021;
 Sat, 15 Feb 2020 21:08:28 +0100 (CET)
Date: Sat, 15 Feb 2020 21:08:27 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v1 1/1] drm: drop unused drm_display_mode.private
Message-ID: <20200215200827.GA9276@ravnborg.org>
References: <20200215183503.GA17310@ravnborg.org>
 <CAKMK7uFp5AzCxSeRg=ZibVnD0e8EhrsxYnuLeicUgp3gCr3Lpg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFp5AzCxSeRg=ZibVnD0e8EhrsxYnuLeicUgp3gCr3Lpg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=HutBqA2vcjdX221E25oA:9 a=CjuIK1q_8ugA:10
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
Cc: Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

> > I also checked private_flags - it is used in a few modules.
> > And it looked legit.
> >
> Iirc i915 used this, before we went full overdrive with entire atomic
> state structure subclassing :-)

$ git grep -l private_flags
gma500/psb_intel_drv.h
i915/display/intel_display.c
i915/display/intel_display_types.h
i915/display/intel_tv.c
i915/display/vlv_dsi.c
i915/i915_irq.c
msm/disp/dpu1/dpu_encoder.c
msm/disp/dpu1/dpu_trace.h <= false hit

i915 still has a few uses of private_flags.
Likewise msm and gma500

Looks doable to address this, but not on my TODO list.

	Sam

> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks - applied.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
