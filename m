Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426BB7ADE20
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 19:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48B110E2C6;
	Mon, 25 Sep 2023 17:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF5A10E2C0;
 Mon, 25 Sep 2023 17:56:27 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1bba7717d3bso3845714fac.1; 
 Mon, 25 Sep 2023 10:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695664587; x=1696269387; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a1F9rg4X23ujFzzgF5l8L8aKk/znEnb8MB1jEXGz6ng=;
 b=j2z5q5BckrDbmoUOo5nYCB7I35nP3ucKlIXaalGileiGe6gpPplxWHRsvbV3OiLNxs
 4M5tr8annXnt6ADod2C2hNHf8ps6wA/7UD0PWA9ieJ4Rz2CCtKQ6zmFIeR/HmrgqUROf
 F5JBJxA8bAv6m0A+lmn/K66ZsB2x8nULnGpdPzGTJMgfJTrvcbsVVOdp+t8PaJoNfTvY
 ghHEuXOn3Oyel9c7y5Wlq1xtURr8z+mIs2a/sSnH6wjWo8hzMsTEGDAj+7Qiqbt0op0y
 dXdDz3xMmGu1Mz72A+E9mdb3nF6NMz82ApiiBOcSxyRP8wjKhWcoPjSn91aKvNaRbccZ
 hmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695664587; x=1696269387;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a1F9rg4X23ujFzzgF5l8L8aKk/znEnb8MB1jEXGz6ng=;
 b=tEzbJShwrtxfTkECV2hhxAmdsreUDuVdWrJHLebBfNDs6jsQ/xehg13L6OHejAaYYQ
 jkU0nbQ93oOpMHNaugReBVDOTbgjOs7PLWfADNWBVXB/kA7QPpS0C6j+XlDV/5gLCD3q
 UnLcVf91ZirraqxfgwdG4SndR1O6bEE5BA7D8Ssdye7VlawlrmJ4wsH/IP5qisk1Xfzc
 sua+xPvvnICE9hgwVsltyObMlKwbhqNnnOR9VxrwQKhQtxkUejPN2VoidLZwwR4XC94W
 OLASRDaJVJQ8oITKKKI3i4g0quNiTMbY4V+Qauo0caiFg5nCNbCa1swCS7dtGBRJ4iFZ
 nojQ==
X-Gm-Message-State: AOJu0YzmqFg0lxbRfe7t4WKi2irZgJwbh5OvUQESdEzmDQEVKtgSusgD
 poiPliBhmFeDvli8wBfcZHghbipM4sYV3q8Dh+g=
X-Google-Smtp-Source: AGHT+IHKGmpSNoLKRlPKgMz3PfLu9l0asTJ/KJeRR4YlCqKx/0xgmJzaJCWHK+NWln0berAZsxELHx2SNeMkUMNHpCU=
X-Received: by 2002:a05:6870:c227:b0:1db:3679:198a with SMTP id
 z39-20020a056870c22700b001db3679198amr8758871oae.24.1695664587047; Mon, 25
 Sep 2023 10:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230922173110.work.084-kees@kernel.org>
 <20230922173216.3823169-1-keescook@chromium.org>
 <CADnq5_P2p3bmczci=pU+pG6f9+hqn=-xp1EynP2345CJZRW08w@mail.gmail.com>
 <2635922e-f52a-4e91-40c6-4f1358972786@amd.com>
 <202309251051.EE3ECE7B@keescook>
In-Reply-To: <202309251051.EE3ECE7B@keescook>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Sep 2023 13:56:16 -0400
Message-ID: <CADnq5_PaXmFa6N_2-NRp7_2+m3TYt8s--4aYm1UTnQKXDUhwYw@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/amd/pm: Annotate struct
 smu10_voltage_dependency_table with __counted_by
To: Kees Cook <keescook@chromium.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Karol Herbst <kherbst@redhat.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Prike Liang <Prike.Liang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>, Evan Quan <evan.quan@amd.com>,
 Emma Anholt <emma@anholt.net>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <john.c.harrison@intel.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 1:52=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Mon, Sep 25, 2023 at 08:30:30AM +0200, Christian K=C3=B6nig wrote:
> > Am 22.09.23 um 19:41 schrieb Alex Deucher:
> > > On Fri, Sep 22, 2023 at 1:32=E2=80=AFPM Kees Cook <keescook@chromium.=
org> wrote:
> > > > Prepare for the coming implementation by GCC and Clang of the __cou=
nted_by
> > > > attribute. Flexible array members annotated with __counted_by can h=
ave
> > > > their accesses bounds-checked at run-time checking via CONFIG_UBSAN=
_BOUNDS
> > > > (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-f=
amily
> > > > functions).
> > > >
> > > > As found with Coccinelle[1], add __counted_by for struct smu10_volt=
age_dependency_table.
> > > >
> > > > [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/exam=
ples/counted_by.cocci
> > > >
> > > > Cc: Evan Quan <evan.quan@amd.com>
> > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > > > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > > > Cc: David Airlie <airlied@gmail.com>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Xiaojian Du <Xiaojian.Du@amd.com>
> > > > Cc: Huang Rui <ray.huang@amd.com>
> > > > Cc: Kevin Wang <kevin1.wang@amd.com>
> > > > Cc: amd-gfx@lists.freedesktop.org
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > Mhm, I'm not sure if this is a good idea. That is a structure filled in=
 by
> > the firmware, isn't it?
> >
> > That would imply that we might need to byte swap count before it is
> > checkable.
>
> The script found this instance because of this:
>
> static int smu10_get_clock_voltage_dependency_table(struct pp_hwmgr *hwmg=
r,
>                         struct smu10_voltage_dependency_table **pptable,
>                         uint32_t num_entry, const DpmClock_t *pclk_depend=
ency_table)
> {
>         uint32_t i;
>         struct smu10_voltage_dependency_table *ptable;
>
>         ptable =3D kzalloc(struct_size(ptable, entries, num_entry), GFP_K=
ERNEL);
>         if (NULL =3D=3D ptable)
>                 return -ENOMEM;
>
>         ptable->count =3D num_entry;
>
> So the implication is that it's native byte order... but you tell me! I
> certainly don't want this annotation if it's going to break stuff. :)

In this case, the code is for an integrated GPU in an x86 CPU so the
firmware and driver endianness match.  You wouldn't find a stand alone
dGPU that uses this structure.  In this case it's ok.  False alarm.

Alex
