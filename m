Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C487B5600
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 17:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CA710E2CF;
	Mon,  2 Oct 2023 15:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86AC88E26;
 Mon,  2 Oct 2023 15:06:31 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6bf58009a8dso9892354a34.1; 
 Mon, 02 Oct 2023 08:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696259191; x=1696863991; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c0wIcnLi0eW3KIpAYRJEn1N+1DF/SZtUbN/0mO//zy4=;
 b=I1ra9ji8G8Gw+IhCfKKz7yTW+qJiR4KI1kig0rnxcjQh4v5eh7Vblv4fX+cIknaLKq
 jgKUnfN0IJxk7ZvIRM1It+NOS6fjTrpseFqmwcCMO7G4nkZNzT46PAgINYQMqTlnhUZA
 ZZD0DUYcGChwdkESPP5SPjSc6zg7jmTnKOVTZzKFGibhCAmMQQbl3V+RcjlNltpD3dtv
 inVlg+OtOVbDt51Nc/zOZ30O6n2SdZuJsIXWZA1EuKBWJxoko20X69/y4jZO+DtV24VQ
 zUAlY0PD6ZolNUwfscrQ7xtVeaOnuudatuCG6nk0oibo+J2Cq2WCm0f4+QLD+SSC2lyn
 vZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696259191; x=1696863991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c0wIcnLi0eW3KIpAYRJEn1N+1DF/SZtUbN/0mO//zy4=;
 b=BxQb1xvb9kg/mpheLvvjSGdVPKaJ6njHE/bNcaAr5wYkKU1R1yccWMEVk1wfAwHwaJ
 i8QAhAWOiqtGSYf8017D83I57H4nE5iueStmF5axCiUuLsSlMPTI/Jbkbj/sMk1UUWVi
 RCl4GLlSZ1GhwAUmCrKxjA3dtAqeDzB5dYFM/Va/o4UM+nI7fQxzrcI5hNV/vv64Gsp0
 afVFc6+gwgsVvFe64HziU2bsuxb8R+K5apG9CFPYtW0UgEWj+d2dS9o3UNgmCTV4boz/
 c46Im0d9bC+by5BikFscPuvb1pUMPVTCnAmUjSe9JBssXAqLlpKeRA6iMEBJtHWFQ63g
 ZLKQ==
X-Gm-Message-State: AOJu0YxvoZauq8Ne8p+7Ze73kTeaMRPuJQtcUkQb8J+gPnIrNDMDbiAl
 LrULL5mE9ltbXGL85N2AydUnYZDnx+/cpgkE9Vg=
X-Google-Smtp-Source: AGHT+IEX1je+61h+JUKWDKJZA+eu4NOUlivFnUEzoxSozC/G9+CulawvWCmD9DLQxtVZD1wdvqrdGNPyL3ZP6lrp6ME=
X-Received: by 2002:a05:6870:a115:b0:1dd:7fa9:ed52 with SMTP id
 m21-20020a056870a11500b001dd7fa9ed52mr15044564oae.17.1696259190738; Mon, 02
 Oct 2023 08:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230922173110.work.084-kees@kernel.org>
 <169601600138.3014939.8511343741428844249.b4-ty@chromium.org>
 <83cd056c-52ae-01dd-7576-42d41da64c26@gmail.com>
In-Reply-To: <83cd056c-52ae-01dd-7576-42d41da64c26@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Oct 2023 11:06:19 -0400
Message-ID: <CADnq5_Ma2CrLYggJHKFEObsNmUoqJwb2p1xai5DfL=m43U6zEA@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm: Annotate structs with __counted_by
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Karol Herbst <kherbst@redhat.com>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Prike Liang <Prike.Liang@amd.com>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>, Emma Anholt <emma@anholt.net>,
 Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-hardening@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Kees Cook <keescook@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>, Le Ma <le.ma@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Yifan Zhang <yifan1.zhang@amd.com>, Xiaojian Du <Xiaojian.Du@amd.com>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Melissa Wen <mwen@igalia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <john.c.harrison@intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 2, 2023 at 5:20=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 29.09.23 um 21:33 schrieb Kees Cook:
> > On Fri, 22 Sep 2023 10:32:05 -0700, Kees Cook wrote:
> >> This is a batch of patches touching drm for preparing for the coming
> >> implementation by GCC and Clang of the __counted_by attribute. Flexibl=
e
> >> array members annotated with __counted_by can have their accesses
> >> bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS (for array
> >> indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family function=
s).
> >>
> >> As found with Coccinelle[1], add __counted_by to structs that would
> >> benefit from the annotation.
> >>
> >> [...]
> > Since this got Acks, I figure I should carry it in my tree. Let me know
> > if this should go via drm instead.
> >
> > Applied to for-next/hardening, thanks!
> >
> > [1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table with _=
_counted_by
> >        https://git.kernel.org/kees/c/a6046ac659d6
>
> STOP! In a follow up discussion Alex and I figured out that this won't wo=
rk.
>
> The value in the structure is byte swapped based on some firmware
> endianness which not necessary matches the CPU endianness.

SMU10 is APU only so the endianess of the SMU firmware and the CPU
will always match.

Alex

>
> Please revert that one from going upstream if it's already on it's way.
>
> And because of those reasons I strongly think that patches like this
> should go through the DRM tree :)
>
> Regards,
> Christian.
>
> > [2/9] drm/amdgpu/discovery: Annotate struct ip_hw_instance with __count=
ed_by
> >        https://git.kernel.org/kees/c/4df33089b46f
> > [3/9] drm/i915/selftests: Annotate struct perf_series with __counted_by
> >        https://git.kernel.org/kees/c/ffd3f823bdf6
> > [4/9] drm/msm/dpu: Annotate struct dpu_hw_intr with __counted_by
> >        https://git.kernel.org/kees/c/2de35a989b76
> > [5/9] drm/nouveau/pm: Annotate struct nvkm_perfdom with __counted_by
> >        https://git.kernel.org/kees/c/188aeb08bfaa
> > [6/9] drm/vc4: Annotate struct vc4_perfmon with __counted_by
> >        https://git.kernel.org/kees/c/59a54dc896c3
> > [7/9] drm/virtio: Annotate struct virtio_gpu_object_array with __counte=
d_by
> >        https://git.kernel.org/kees/c/5cd476de33af
> > [8/9] drm/vmwgfx: Annotate struct vmw_surface_dirty with __counted_by
> >        https://git.kernel.org/kees/c/b426f2e5356a
> > [9/9] drm/v3d: Annotate struct v3d_perfmon with __counted_by
> >        https://git.kernel.org/kees/c/dc662fa1b0e4
> >
> > Take care,
> >
>
