Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB9167DC88
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 04:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF4310E3DA;
	Fri, 27 Jan 2023 03:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A0110E3DA;
 Fri, 27 Jan 2023 03:08:03 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-15eec491b40so4859527fac.12; 
 Thu, 26 Jan 2023 19:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eWVjgWC+CRaiVU6jf3be0WvlqWbyqa4cbGUte3LE0QY=;
 b=SvGlwWDC+KblJS2mqQCluTm269HgIQaXn+HLtXa7cMZkrTaP7lnJrOIR33mFaXXtH/
 8cL8KrnTBBZBGVXsgQ1DKAHWIM1+EKPpFW4p8IgxhR84Xbv3LigkPTByRA4kMaEdj6TU
 k7Kv1PNhnRA8GIoxbImSjJVcnIGMd9W4vnrh7KM6GtdcdB294Ly2ExbAI4DPIRsycidq
 ebpds6vqjuZg4C56lG2puV681tfO6LsMOE0MJ0KcEX5tTtzSLpp1IujIkVVhugeAFgp9
 cvAJNHs9DU6/eY5NWUZIL8O6Ph//ikJT+Lk7G/rojhpgq5p2I7AuJy6bEG+5t5c459tI
 xUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eWVjgWC+CRaiVU6jf3be0WvlqWbyqa4cbGUte3LE0QY=;
 b=dMK+hsGMAvzy9ekq78vJPdhI77WPr1zj//r+lx5OeiGb9eSstI7J7PrM8R4OymfsEz
 TYqCS++sY9EUopO6i7isxSFg3YFkbG825sO+0Wbolpmk4165xBhewJT+AY4iiw/rl+ZJ
 /CjmFeMdtoiuPU3Z6Zj89SpPkqctT2vudqE5Vl2ZcdHxfPtalOvh9AFVq3is+nHXjl5L
 h179Q0DSyX/oOoJxFX0k0lhW17ZT131eeeuBbst1+BnwUEUGSjylftTu8yNBbVBsMvmK
 4tzCw3m/uWRaXu958e2GMlCQgO3nBJr92OAdXZeCU0o8s4Vkefumbxsl+OydPzmrllOZ
 gtkQ==
X-Gm-Message-State: AFqh2kqQ1QGce/ajVEIkNGl9SV8mfn6DzxyZ7MfXc3wovIfs1zZW6oeK
 p6+LO+SSHDJrmosaueThX/OaEzJ+yBu/lokX704MXxup
X-Google-Smtp-Source: AMrXdXtwNNbWR+EBpOWIEthHcrNWHYhATjGinf4U7RAj7/ORzz2dj7jhO7LE+yBhT7G/zMVkJANBNpaCoJ1m0UeBexw=
X-Received: by 2002:a05:6870:44d0:b0:15b:96b8:e2be with SMTP id
 t16-20020a05687044d000b0015b96b8e2bemr2351141oai.38.1674788882705; Thu, 26
 Jan 2023 19:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20230123153745.3185032-1-robdclark@gmail.com>
 <20230125040403epcms1p1646e9668b87df3e9c344ad58d39b6eb6@epcms1p1>
 <CGME20230123153745epcas1p17e57cf83ed371e86258139473befc615@epcms1p3>
 <CAF6AEGud-ESF=VgcaSFzKsWas0H5eSXZDdZGcnd8Ju=pr-W2EQ@mail.gmail.com>
 <20230125054626epcms1p38d34dc65cbc9cb29dd707a4b2cac8fb4@epcms1p3>
In-Reply-To: <20230125054626epcms1p38d34dc65cbc9cb29dd707a4b2cac8fb4@epcms1p3>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 26 Jan 2023 19:08:01 -0800
Message-ID: <CAF6AEGvkepf4eLKqXYkadOvtu_7ehCzmgoiq3_s7qvJXi_n3sw@mail.gmail.com>
Subject: Re: Re: [PATCH] PM / devfreq: Fix build issues with devfreq disabled
To: myungjoo.ham@samsung.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 9:46 PM MyungJoo Ham <myungjoo.ham@samsung.com> wrote:
>
> >On Tue, Jan 24, 2023 at 8:04 PM MyungJoo Ham <myungjoo.ham@samsung.com> wrote:
> >>
> >> >Sender : Rob Clark <robdclark@gmail.com>
> >> >Date : 2023-01-24 00:37 (GMT+9)
> >> >Title : [PATCH] PM / devfreq: Fix build issues with devfreq disabled
> >> >
> >> >From: Rob Clark <robdclark@chromium.org>
> >> >
> >> >The existing no-op shims for when PM_DEVFREQ (or an individual governor)
> >> >only do half the job.  The governor specific config/tuning structs need
> >> >to be available to avoid compile errors in drivers using devfreq.
> >> >
> >> >Fixes: 6563f60f14cb ("drm/msm/gpu: Add devfreq tuning debugfs")
> >> >Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>
> >> Doesn't this imply that DRM_MSM should depend on PM_DEVFREQ ?
> >>
> >> It appears that gpu/drm/msm/DRM_MSM uses PM_DEVFREQ without actually
> >> declaring the dependency on PM_DEVFREQ.
> >> You cannot use SIMPLE_ONDEMAND without DEVFREQ.
> >
> >Possibly that would resolve some issues, and that might have been my
> >mistake in assuming that depending on SIMPLE_ONDEMAND implied a
> >dependency on DEFREQ (which seems like a reasonable assumption, IMHO)
> >
> >But AFAICT some kernel configs that could otherwise use DRM_MSM don't
> >support PM_DEVFREQ.. either way, lets solve this properly and remove
> >needless dependencies on devfreq.
> >
> >BR,
> >-R
>
> Ok. You are enabling struct and enum only and that looks harmless.
>
> PTAL, Chanwoo.
>
> Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>

Thanks, if possible, an ack to land this via msm-next would avoid
build break headaches with COMPILE_TEST=y and other more obscure
setups

BR,
-R
