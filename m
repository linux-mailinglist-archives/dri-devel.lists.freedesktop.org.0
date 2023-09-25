Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 750877AD9C1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541B810E25A;
	Mon, 25 Sep 2023 14:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0120010E255;
 Mon, 25 Sep 2023 14:07:39 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1dcfe9cd337so1391449fac.2; 
 Mon, 25 Sep 2023 07:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695650859; x=1696255659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eOm71FSa/a54JWdPxFTdFQYbsSYB0XKCvLJel7l+Bek=;
 b=McjGwReCQ1nxjRLosXccjj55zfNgDMs/cRMW7pOy0VMWV571PF45AHcTkKsb+FzSkl
 RgSWzt4BQwteGgvZEyqqIMvOAbreWAIFowSAzlcT7ZTJVeaxMm82o1O5nauDiic9RCXj
 ORigul7MDLviLmkHSBSVK+GvCXDRinW2E7xapb4VReWpZgtOwV7x6etECiyUeHC/26Ao
 mRQEIYHtx++HeXso/h7bYQPXTupFTb/t8J8XxoQj9nrxwRKhVOauJ8AS0kNYJTzlhZWV
 984HNd3SKAjjkiYRrytHrThpCvq+d++WyN1fcfIK8tvB8eNcFUvcXuun2SeU9ruBiXMW
 7vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695650859; x=1696255659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eOm71FSa/a54JWdPxFTdFQYbsSYB0XKCvLJel7l+Bek=;
 b=pNX6UPoi41G7vmYk3X5IIZyohMw0bUXUq4Y+VZ9e4b9qCABAxTfaGUt7enK1LyYNzN
 vQR/0ECKDhF/zwk6DdM7PwikaBkqKWHS8UwRssm5uh3Vf7lr0SN8c0O+cRUeL9dlrIA4
 dLAD21T19AafV0Muymk/GmrIIFRMnK5LgZ3mesHEeEBg33cTdsy8XybThP5qqxsQ6Fii
 AW0uLQ4VBclJdHu0p663Hpk2fTE0cQS582Byz4XPiR16HcuO8wWkhBE7a7TAw9/r3bMn
 BDjpaYB5rtNM1fRpP/m4jtm/xjvn1oPeXHTfNLC0JlspvwPXqJnUWwvRzT4VCM0bLO70
 XLFg==
X-Gm-Message-State: AOJu0YwT5kLrqIb3e8zoyRE1Tntp7c4AG+2YsYrjgXh0NEuyBk3XMpb/
 X9nvPDJunkpJY2rWf0eHRCGRUXKazpQuc/Jskow=
X-Google-Smtp-Source: AGHT+IEAGihrK0Fxy+zmQS+jCavrD8i0S0F6RPaTyUWR0Tsr+swWkiWj17Z4gpkbPnpNw9W+uaTcvGPHY2GFxPPQ6jk=
X-Received: by 2002:a05:6870:b68b:b0:19e:fa1f:fc2f with SMTP id
 cy11-20020a056870b68b00b0019efa1ffc2fmr7668945oab.38.1695650859043; Mon, 25
 Sep 2023 07:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230922173110.work.084-kees@kernel.org>
 <20230922173216.3823169-1-keescook@chromium.org>
 <CADnq5_P2p3bmczci=pU+pG6f9+hqn=-xp1EynP2345CJZRW08w@mail.gmail.com>
 <2635922e-f52a-4e91-40c6-4f1358972786@amd.com>
In-Reply-To: <2635922e-f52a-4e91-40c6-4f1358972786@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Sep 2023 10:07:27 -0400
Message-ID: <CADnq5_P1tg2-rWUmsRAy3aPJLT7ZmaZORMSOrPa6t6oSc5xS3g@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/amd/pm: Annotate struct
 smu10_voltage_dependency_table with __counted_by
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Prike Liang <Prike.Liang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>, Evan Quan <evan.quan@amd.com>,
 Karol Herbst <kherbst@redhat.com>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Kees Cook <keescook@chromium.org>, Yifan Zhang <yifan1.zhang@amd.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Kevin Wang <kevin1.wang@amd.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>, Le Ma <le.ma@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>, Xiaojian Du <Xiaojian.Du@amd.com>,
 Lang Yu <Lang.Yu@amd.com>, Bjorn Andersson <andersson@kernel.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Hawking Zhang <Hawking.Zhang@amd.com>, Melissa Wen <mwen@igalia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, freedreno@lists.freedesktop.org,
 John Harrison <john.c.harrison@intel.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 2:30=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 22.09.23 um 19:41 schrieb Alex Deucher:
> > On Fri, Sep 22, 2023 at 1:32=E2=80=AFPM Kees Cook <keescook@chromium.or=
g> wrote:
> >> Prepare for the coming implementation by GCC and Clang of the __counte=
d_by
> >> attribute. Flexible array members annotated with __counted_by can have
> >> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BO=
UNDS
> >> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-fami=
ly
> >> functions).
> >>
> >> As found with Coccinelle[1], add __counted_by for struct smu10_voltage=
_dependency_table.
> >>
> >> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/example=
s/counted_by.cocci
> >>
> >> Cc: Evan Quan <evan.quan@amd.com>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: Xiaojian Du <Xiaojian.Du@amd.com>
> >> Cc: Huang Rui <ray.huang@amd.com>
> >> Cc: Kevin Wang <kevin1.wang@amd.com>
> >> Cc: amd-gfx@lists.freedesktop.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Signed-off-by: Kees Cook <keescook@chromium.org>
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
>
> Mhm, I'm not sure if this is a good idea. That is a structure filled in
> by the firmware, isn't it?
>
> That would imply that we might need to byte swap count before it is
> checkable.

True. Good point.  Same for the other amdgpu patch.

Alex

>
> Regards,
> Christian.
>
> >
> >> ---
> >>   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h b/dr=
ivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> >> index 808e0ecbe1f0..42adc2a3dcbc 100644
> >> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> >> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> >> @@ -192,7 +192,7 @@ struct smu10_clock_voltage_dependency_record {
> >>
> >>   struct smu10_voltage_dependency_table {
> >>          uint32_t count;
> >> -       struct smu10_clock_voltage_dependency_record entries[];
> >> +       struct smu10_clock_voltage_dependency_record entries[] __count=
ed_by(count);
> >>   };
> >>
> >>   struct smu10_clock_voltage_information {
> >> --
> >> 2.34.1
> >>
>
