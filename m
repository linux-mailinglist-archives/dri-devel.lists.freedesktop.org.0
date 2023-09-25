Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 832157AD9E0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2EA10E258;
	Mon, 25 Sep 2023 14:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618BE10E267;
 Mon, 25 Sep 2023 14:14:40 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6bc9c01e154so3968990a34.0; 
 Mon, 25 Sep 2023 07:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695651279; x=1696256079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJfyUt1ShfjZl6t8cnVtNZYV0Rqi3aBl3H7mr80x/Gw=;
 b=HbzGOfmX5V1PBc3LDrc9JaBREVN9OzGh5a1IDxjZRN5HXsye60PbL4CAOGB6Hhi11D
 PCkkL7uU6Lb6147bHKsl0VjRNQkXxIu212M9wcoyVQU2N2hSsJu5pUWs0NY5FoI/w87B
 Y8FZW1g++9NqIMsmQaazeX+724ZGMAUn4RzP6Kt8u8JzCL7km/oNp4vWvGbHIyYU3+Hy
 KHRtgeJZG8EwW3p0V3ZxBc0atoZznTlPhDt3/5tAnc21fqpL+SMXT30BSDnKCNNNJT6N
 pdq2Tv8dsvUS4ab8k9FIsSrvjVQergCgaT8z1q4kk98bzN/0Pm8AcXjTp862g3ET2UJc
 NXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695651279; x=1696256079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MJfyUt1ShfjZl6t8cnVtNZYV0Rqi3aBl3H7mr80x/Gw=;
 b=jJVH16tGg3zGV/up7voeA/Rbj50Hr0o2yYY/bbwW04HwhaI9XvF1VCG/PIEz4er7fF
 qbV5ukAwwIyyhDjuGSLrnP2llS1MybcXmdQwqUuBh2tk9d6nhA5kGm80Fcc7rQC7R6JT
 Y/DIYPfWdC5Pn28WDXvGa4t0O9lFF6QZdsyLGwTPmQn4qya4AFGJAxaGRLWRIP+cRKJd
 ZaIlMclcWhgPKmC12Q3bJKW+SBnsUABoVGpALQMH5adQgA5IEL3LYo/sge5qJPLsQ5TH
 8T6vCau+r/Z4ZdIzSb+ZbOlEs0YfIAMM9LkfKlG29xuAZgsQ/+0mxVI/0GgUsA/MldRc
 w4iQ==
X-Gm-Message-State: AOJu0YxW5ZkMp2oUKdmJSVNIMTAiPnWvFiXwjohDvZGcOiOHJbrar2rV
 rTkU7/ch1A0TXvky9NuDEpnYikn4nz9olQZPtog=
X-Google-Smtp-Source: AGHT+IGzozeIAKQxxu15vnXC4O0U2/wFx2Ttdhu1Ykj7GBRveGIst2ctDf9dvYvaREsBKdttLh7p7tRIuZBiTVLnOX8=
X-Received: by 2002:a05:6871:c10:b0:1dc:dcf9:18d8 with SMTP id
 ve16-20020a0568710c1000b001dcdcf918d8mr4061353oab.24.1695651279489; Mon, 25
 Sep 2023 07:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230922173110.work.084-kees@kernel.org>
 <20230922173216.3823169-1-keescook@chromium.org>
 <CADnq5_P2p3bmczci=pU+pG6f9+hqn=-xp1EynP2345CJZRW08w@mail.gmail.com>
 <2635922e-f52a-4e91-40c6-4f1358972786@amd.com>
 <CADnq5_P1tg2-rWUmsRAy3aPJLT7ZmaZORMSOrPa6t6oSc5xS3g@mail.gmail.com>
In-Reply-To: <CADnq5_P1tg2-rWUmsRAy3aPJLT7ZmaZORMSOrPa6t6oSc5xS3g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Sep 2023 10:14:28 -0400
Message-ID: <CADnq5_P3xDDi-MS2PkAA7paAOQ3f7DQ8+sL6W7O5HcWTFQ0BSg@mail.gmail.com>
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

On Mon, Sep 25, 2023 at 10:07=E2=80=AFAM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> On Mon, Sep 25, 2023 at 2:30=E2=80=AFAM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 22.09.23 um 19:41 schrieb Alex Deucher:
> > > On Fri, Sep 22, 2023 at 1:32=E2=80=AFPM Kees Cook <keescook@chromium.=
org> wrote:
> > >> Prepare for the coming implementation by GCC and Clang of the __coun=
ted_by
> > >> attribute. Flexible array members annotated with __counted_by can ha=
ve
> > >> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_=
BOUNDS
> > >> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-fa=
mily
> > >> functions).
> > >>
> > >> As found with Coccinelle[1], add __counted_by for struct smu10_volta=
ge_dependency_table.
> > >>
> > >> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examp=
les/counted_by.cocci
> > >>
> > >> Cc: Evan Quan <evan.quan@amd.com>
> > >> Cc: Alex Deucher <alexander.deucher@amd.com>
> > >> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > >> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > >> Cc: David Airlie <airlied@gmail.com>
> > >> Cc: Daniel Vetter <daniel@ffwll.ch>
> > >> Cc: Xiaojian Du <Xiaojian.Du@amd.com>
> > >> Cc: Huang Rui <ray.huang@amd.com>
> > >> Cc: Kevin Wang <kevin1.wang@amd.com>
> > >> Cc: amd-gfx@lists.freedesktop.org
> > >> Cc: dri-devel@lists.freedesktop.org
> > >> Signed-off-by: Kees Cook <keescook@chromium.org>
> > > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > Mhm, I'm not sure if this is a good idea. That is a structure filled in
> > by the firmware, isn't it?
> >
> > That would imply that we might need to byte swap count before it is
> > checkable.
>
> True. Good point.  Same for the other amdgpu patch.

Actually the other patch is fine.  That's just a local structure.

Alex

>
> Alex
>
> >
> > Regards,
> > Christian.
> >
> > >
> > >> ---
> > >>   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h b/=
drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > >> index 808e0ecbe1f0..42adc2a3dcbc 100644
> > >> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > >> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > >> @@ -192,7 +192,7 @@ struct smu10_clock_voltage_dependency_record {
> > >>
> > >>   struct smu10_voltage_dependency_table {
> > >>          uint32_t count;
> > >> -       struct smu10_clock_voltage_dependency_record entries[];
> > >> +       struct smu10_clock_voltage_dependency_record entries[] __cou=
nted_by(count);
> > >>   };
> > >>
> > >>   struct smu10_clock_voltage_information {
> > >> --
> > >> 2.34.1
> > >>
> >
