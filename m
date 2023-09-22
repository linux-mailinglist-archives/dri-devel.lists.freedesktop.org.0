Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00FF7AB7F4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CB010E6D6;
	Fri, 22 Sep 2023 17:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8030310E07E;
 Fri, 22 Sep 2023 17:42:32 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-57b7256ebfeso595495eaf.3; 
 Fri, 22 Sep 2023 10:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695404551; x=1696009351; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O1mscbgmaMFCH+sggQx7YqczyCptW8ney4CIT5DP64U=;
 b=Nid5vX/6+tGpA85yEA4giXMXpAAyiQ9SCc/aGnTuavVEatDoooale0DpPI8vn2QyMZ
 3bVD5bQP5jjIRxmvFw5wwVN5AR5X6TsaWz3eEK8jijpxbFDENic6Q8R2U6g6XKtRqWNo
 OqGym2tinP7O0b6ckGdUdyy1IfkR2pZ+DmgYPwE+aToUwjM3onB/S6SJlyNvC92lqg5V
 flhx7LCNBxa5mIIdr/+/3KigZWxO/C1uWGE6ZvyronhsDqBcMPFdrlguzJo+CHKQWU0X
 U0RZ/+1tlcQLadn+L8Qw4bKtkC+bUVJe5RlImq2L2DY/mzYzXe7tDk6Xmw7lofC9l6Ah
 SQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695404551; x=1696009351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O1mscbgmaMFCH+sggQx7YqczyCptW8ney4CIT5DP64U=;
 b=klHgi3N5rc4l6h8fM33YjTkprLcNigl81AEHIEBx5klRKQ5jWUdWwC7eaRt5Lm+yqV
 qgwSOAj8t07g4ajFfaEsIKGq5MYbdrvpRD45HpTo8NRT3zm1V06XHs/l7+cIRM/mlmgU
 SzKIGx6NmGQZalbd2U6N89GNjXNqjCNmQShsRSYglGBsda6gh7P2xUd1vDAjBUzC/lDX
 IeMA/f2tb992zTSIwEWJnNuYc7kbcGD3f/FRCaXrXyBWK7W3+BcxeAp4jqi0rsyFnmGv
 WMStiZOYIytn7lFg+nkaZqp01P55PQp44RR0M5UHFOiPTGp7pMu0gsovNeStZq02bxPI
 geNw==
X-Gm-Message-State: AOJu0Yx8LtOgiMdVMRqi+ejEj3vo+Xd+3fy1rdOfDI1xS1wIGJD03pfr
 3To0tYaVRhL6vHcUwwbjh4TAgwxT+E7VA8Qf7h4=
X-Google-Smtp-Source: AGHT+IFPsM3Hdk+pcYqT5bpsUWbwTA0MpnAJeoAQZ6o66BtolUGO//OpOOgoyvfV1ya4MzJTleibWsMBwKq26jjzaO8=
X-Received: by 2002:a05:6870:2383:b0:1dc:33a:40d8 with SMTP id
 e3-20020a056870238300b001dc033a40d8mr162032oap.4.1695404551639; Fri, 22 Sep
 2023 10:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230922173110.work.084-kees@kernel.org>
 <20230922173216.3823169-2-keescook@chromium.org>
In-Reply-To: <20230922173216.3823169-2-keescook@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 22 Sep 2023 13:42:20 -0400
Message-ID: <CADnq5_OV7L4_z5mhAq8x8nV4+yp_wGhyVeg1MrKAVoSbMVV1uw@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/amdgpu/discovery: Annotate struct ip_hw_instance
 with __counted_by
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

On Fri, Sep 22, 2023 at 1:33=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct ip_hw_instance.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.c
> index d1bc7b212520..be4c97a3d7bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -662,7 +662,7 @@ struct ip_hw_instance {
>         u8  harvest;
>
>         int num_base_addresses;
> -       u32 base_addr[];
> +       u32 base_addr[] __counted_by(num_base_addresses);
>  };
>
>  struct ip_hw_id {
> --
> 2.34.1
>
