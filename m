Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6A87AB7E3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0D710E6CF;
	Fri, 22 Sep 2023 17:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C0910E6AF;
 Fri, 22 Sep 2023 17:42:03 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1dc619817a2so1261503fac.3; 
 Fri, 22 Sep 2023 10:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695404522; x=1696009322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XekgGSaX3ptkpR/7Vl4AaE79EkIJG3ApSeSAmfaaNYY=;
 b=GtbuBROBMrN4y5T0lVffBwfY0eQYi8A5i7rrvYOv5WeG8sScYHFL4KTL4jQKkC67hY
 bMRbbmgIObg0NDeMkXKPHcvC4TTC1xHsQ85O4nzSQqqLG9FvUbcYDg0/epQomaqvYPWZ
 CskjkaBPd6K0Mhc/pXtpCnuINjfIWsXBAwAjzsHkVr5FhQuMQyuooALmQZweObY4aw9L
 6qDfiGhecnWwfmEp7PKp8wKSXZx7EyNh3JHjkdNLrMFOqKgJ5FmdT8/WCI/XpTbGU/Hw
 2MpaSEdrlf9n6D77/Lx6FOxMmh5jxUtoUp4FY8C+at1FrGU0Uh7HWgHf7FKWXz2d6MX/
 9xmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695404522; x=1696009322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XekgGSaX3ptkpR/7Vl4AaE79EkIJG3ApSeSAmfaaNYY=;
 b=B6ejQilBZIr1o6BkC81qLrtZFc0DvvA69eNjB/fHPmbX6CTQcWgw4QTRKEwnugmz3a
 WXuBEq9TQGjXK+MwTzRGItRQxENzxQCe/1NNIvAtRkwahNtlC274seX0fssXFC4TEVhm
 btFX/h/Q7ysDBH1fqPnmkOAmfBf7s9cVQY94AYBJF0bd7oNfUWu2TZhFvgb33Wa1JoWQ
 v7xUmLGeioFkwUc0/jaC9KPbZjLnZHZ1etdCZOdfx9U7KDkCtelR/3K7ojV8QKGEIkmB
 JhpgnSUlov8jfQt9w5X8rkhALhjsJ+WnXSNOYNEdGVbBiHoeeWchdhlKA72p9AInuC/L
 LXog==
X-Gm-Message-State: AOJu0YyF/jBDrax5xx+on202aMI1RXUu2PSVYsdwVVPg1FHJI7Le8/4t
 8vSmNLsCmZ/WUbQ7aVN19jWelER6REO11+9494E=
X-Google-Smtp-Source: AGHT+IG39K8OoDMaCogRuGeRtHy4kPLjYTbpmj4vuvYl6iT+u3RXeJQ2kVCIXH4X5mx+L+1FvNpYYUZbI2a21sY0YAA=
X-Received: by 2002:a05:6870:f689:b0:1d5:b9e1:d35e with SMTP id
 el9-20020a056870f68900b001d5b9e1d35emr103462oab.41.1695404522615; Fri, 22 Sep
 2023 10:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230922173110.work.084-kees@kernel.org>
 <20230922173216.3823169-1-keescook@chromium.org>
In-Reply-To: <20230922173216.3823169-1-keescook@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 22 Sep 2023 13:41:51 -0400
Message-ID: <CADnq5_P2p3bmczci=pU+pG6f9+hqn=-xp1EynP2345CJZRW08w@mail.gmail.com>
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

On Fri, Sep 22, 2023 at 1:32=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
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
> As found with Coccinelle[1], add __counted_by for struct smu10_voltage_de=
pendency_table.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Xiaojian Du <Xiaojian.Du@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h b/drive=
rs/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> index 808e0ecbe1f0..42adc2a3dcbc 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> @@ -192,7 +192,7 @@ struct smu10_clock_voltage_dependency_record {
>
>  struct smu10_voltage_dependency_table {
>         uint32_t count;
> -       struct smu10_clock_voltage_dependency_record entries[];
> +       struct smu10_clock_voltage_dependency_record entries[] __counted_=
by(count);
>  };
>
>  struct smu10_clock_voltage_information {
> --
> 2.34.1
>
