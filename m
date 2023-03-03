Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A7A6A9AE2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 16:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826A610E6C6;
	Fri,  3 Mar 2023 15:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD7010E6C6;
 Fri,  3 Mar 2023 15:43:31 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id t22so2061900oiw.12;
 Fri, 03 Mar 2023 07:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677858210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQxH8ZWizGhpLpVMGBCg+glmrgZwdkg8RYT2oJUwuiw=;
 b=SIS1TIhc+zb2C/l6aPGRZ4hDRWoIWQFGxXdRmasAggox5NmdQ65LymIRkCBSqUqdkF
 LVf/hMHn+k1O1PcYaoU6HAsadpLfo/q1/zD455OpSnrEwIBuoZg0G8xC2rryAFF1H0ZS
 29ExCFQgTjQOIEqe/PC9dS6IF7EtXC1q/QCT9XnBsq2qTZ0hxQ4GOZhUTKZdNbuTqW/b
 wvQDiL8qf+8yv1Emg2y1wneFOItSOsVs0R3B9jpmhOOFzWtuv3muaV23xHXbGuI7CvTl
 ZxDw7LuNWt/LK3M58w6ACdzYekyUtu3zxIQsQ5b3u6bEHyIngPRgMu2vlJ+JbMl7lmE/
 F4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677858210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TQxH8ZWizGhpLpVMGBCg+glmrgZwdkg8RYT2oJUwuiw=;
 b=5cT6LtrCrshr5i9urK1EOJObS874/nsuDOtResBrMVp7AMumj0gEYV01FbSPfSo15L
 5GbhZmDtfbos/SOvlTYOxtPrJwMzkSPjNbzXvOWyeQjv81HegtIZ8A0xo+SOVJgFgNzW
 3SQ33aZ9uGpmYORQgbDFxZ+Ewr5bx6Oy8Gd74oAQQxmaNJIAw0EpFCCy7UEUmnxP3TAI
 S3mjHD6XZhBQg+eEzFbnRKAgItpir5MFxdpS2qwPkBlPtlSJ4SBPaIMykuSJqOhhBO1E
 eIxPCuZ9fn1qAnq7tYj6RzveoIGVsksf3U5Q0O6hXq/wmSRmlba2kdIHv1LNZfzCyuX2
 j+tg==
X-Gm-Message-State: AO0yUKUvZSrdqHS8OhKVTN5+J7P9UYOYDXSnI5qGGtHHGOQLJ1ENNh95
 QLy+x/v/eZwE+eVlMUZm7T6VFJ6uiq8zNzzPO+s=
X-Google-Smtp-Source: AK7set8WYj13njQ4eDzBoQOY2+mFeBIknWmbCTDY5/hj5Jb/TlKVYgvOi3ICKaHC5TUQE9KdMML0MYqsYHIsEMqs3jI=
X-Received: by 2002:a05:6808:b21:b0:37f:b1ac:6b90 with SMTP id
 t1-20020a0568080b2100b0037fb1ac6b90mr671799oij.0.1677858210555; Fri, 03 Mar
 2023 07:43:30 -0800 (PST)
MIME-Version: 1.0
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-16-robdclark@gmail.com>
 <ZAFnqbycMleLmRe9@intel.com>
 <3bded9d7-9796-4a9b-7c11-aac994d4fdc6@linux.intel.com>
 <CAF6AEGs6QYTESuwB8E9cTbv9LqQX16tz6-geeu9BCyFos9=sOA@mail.gmail.com>
 <ZAILc/fxzBqLv1OF@intel.com> <ZAIQDBD+HPbQA5sr@intel.com>
In-Reply-To: <ZAIQDBD+HPbQA5sr@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Mar 2023 07:43:19 -0800
Message-ID: <CAF6AEGuvrZs6+9c+bUPaUpZx85Xa-R-oDjFNbC8XRbMd7rvGpA@mail.gmail.com>
Subject: Re: [PATCH v9 15/15] drm/i915: Add deadline based boost support
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Matt Turner <mattst88@gmail.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 3, 2023 at 7:20 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Mar 03, 2023 at 05:00:03PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Fri, Mar 03, 2023 at 06:48:43AM -0800, Rob Clark wrote:
> > > On Fri, Mar 3, 2023 at 1:58 AM Tvrtko Ursulin
> > > <tvrtko.ursulin@linux.intel.com> wrote:
> > > >
> > > >
> > > > On 03/03/2023 03:21, Rodrigo Vivi wrote:
> > > > > On Thu, Mar 02, 2023 at 03:53:37PM -0800, Rob Clark wrote:
> > > > >> From: Rob Clark <robdclark@chromium.org>
> > > > >>
> > > > >
> > > > > missing some wording here...
> > > > >
> > > > >> v2: rebase
> > > > >>
> > > > >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > >> ---
> > > > >>   drivers/gpu/drm/i915/i915_request.c | 20 ++++++++++++++++++++
> > > > >>   1 file changed, 20 insertions(+)
> > > > >>
> > > > >> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/d=
rm/i915/i915_request.c
> > > > >> index 7503dcb9043b..44491e7e214c 100644
> > > > >> --- a/drivers/gpu/drm/i915/i915_request.c
> > > > >> +++ b/drivers/gpu/drm/i915/i915_request.c
> > > > >> @@ -97,6 +97,25 @@ static bool i915_fence_enable_signaling(struc=
t dma_fence *fence)
> > > > >>      return i915_request_enable_breadcrumb(to_request(fence));
> > > > >>   }
> > > > >>
> > > > >> +static void i915_fence_set_deadline(struct dma_fence *fence, kt=
ime_t deadline)
> > > > >> +{
> > > > >> +    struct i915_request *rq =3D to_request(fence);
> > > > >> +
> > > > >> +    if (i915_request_completed(rq))
> > > > >> +            return;
> > > > >> +
> > > > >> +    if (i915_request_started(rq))
> > > > >> +            return;
> > > > >
> > > > > why do we skip the boost if already started?
> > > > > don't we want to boost the freq anyway?
> > > >
> > > > I'd wager Rob is just copying the current i915 wait boost logic.
> > >
> > > Yup, and probably incorrectly.. Matt reported fewer boosts/sec
> > > compared to your RFC, this could be the bug
> >
> > I don't think i915 calls drm_atomic_helper_wait_for_fences()
> > so that could explain something.
>
> Oh, I guess this wasn't even supposed to take over the current
> display boost stuff since you didn't remove the old one.

Right, I didn't try to replace the current thing.. but hopefully at
least make it possible for i915 to use more of the atomic helpers in
the future

BR,
-R

> The current one just boosts after a missed vblank. The deadline
> could use your timer approach I suppose and boost already a bit
> earlier in the hopes of not missing the vblank.
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
