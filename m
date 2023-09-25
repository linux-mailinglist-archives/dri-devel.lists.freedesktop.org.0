Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF437ADE04
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 19:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5905D10E2BA;
	Mon, 25 Sep 2023 17:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43E510E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 17:50:04 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1d651ab1d77so4652645fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 10:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695664204; x=1696269004;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LrNZUYK9GVon3CstC3PAw8y74HnTAoBSBfYauDl4OzM=;
 b=UObhHPgR2L04POINaxBQMaW/6y+Gwt2fRE8Q5AKWh0mBM4mkgx3NEroLSbHtvX6f/O
 v0rI2XjI/kEFlxVduBTRexEbUMObOpVoNXE+G7pqxfotoJO3VP/fy8rqotmR7VrJxKef
 44kIBtWWxEXHs8yQjcrbgUoz6Pldb9Apdv4Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695664204; x=1696269004;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LrNZUYK9GVon3CstC3PAw8y74HnTAoBSBfYauDl4OzM=;
 b=JFk71UFsL5BGAzrGSxui/mKmd1Jcrvw3BfGNcBu46nQqxPcoMluCyCp5V8Sn0uajST
 jmzVOfWDjgZ8uL6qv/YURNAeMOEl4ds8KAY80fsDCTjKCpiHelI/kKZPmLwPicpuwjMK
 3H6feLvVgrXwXAcZLnATwYkekv2BpwkfVe1FIMIov2k6TQf/OCTiF4a6/TEVSkRNv+A7
 fShpisUsB/EKwSvKIQyyF6RC2n3K36ttT5QEPEU5ZCITVQJ+IyXzEjVlW1MK1nCmzgJ3
 fLiJvOLVic4DaExkYriDTatmPcvkq6Gilo+eKy2qV2u9qp8NwMij/rxNUKeh9BRg/wi8
 lYLQ==
X-Gm-Message-State: AOJu0YxtWUoPCWcLrH6SnlgJ+Ly1azYuArESYwkRgjw9x68uWUHVDGN4
 Pihj4aZn9vMSpSRTlaFX6jJYmw==
X-Google-Smtp-Source: AGHT+IEnVXJWnUtJ+JjUoJ2wutCIFPzVwQv9Kt/j17reyYiG5PztEKwn4JCr3bhZYPWh/NJDzvVOfA==
X-Received: by 2002:a05:6870:3323:b0:1d5:5a83:22b7 with SMTP id
 x35-20020a056870332300b001d55a8322b7mr9920226oae.51.1695664203813; 
 Mon, 25 Sep 2023 10:50:03 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 p19-20020a639513000000b00578afd8e012sm7498975pgd.92.2023.09.25.10.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 10:50:03 -0700 (PDT)
Date: Mon, 25 Sep 2023 10:50:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH 3/9] drm/i915/selftests: Annotate struct perf_series with
 __counted_by
Message-ID: <202309251043.2D1F7D08@keescook>
References: <20230922173110.work.084-kees@kernel.org>
 <20230922173216.3823169-3-keescook@chromium.org>
 <b668d521-c8fd-1207-0a65-e1200e7ebb2c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b668d521-c8fd-1207-0a65-e1200e7ebb2c@intel.com>
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, Emma Anholt <emma@anholt.net>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Prike Liang <Prike.Liang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Nathan Chancellor <nathan@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-hardening@vger.kernel.org,
 Lijo Lazar <lijo.lazar@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Kevin Wang <kevin1.wang@amd.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Melissa Wen <mwen@igalia.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Le Ma <le.ma@amd.com>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 John Harrison <john.c.harrison@intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 12:08:36PM +0200, Andrzej Hajda wrote:
> 
> 
> On 22.09.2023 19:32, Kees Cook wrote:
> > Prepare for the coming implementation by GCC and Clang of the __counted_by
> > attribute. Flexible array members annotated with __counted_by can have
> > their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> > (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> > functions).
> > 
> > As found with Coccinelle[1], add __counted_by for struct perf_series.
> > 
> > [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> > 
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: John Harrison <john.c.harrison@Intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> I am surprised this is the only finding in i915, I would expected more.

I'm sure there are more, but it's likely my Coccinelle pattern didn't
catch it. There are many many flexible arrays in drm. :)

$ grep -nRH '\[\];$' drivers/gpu/drm include/uapi/drm | grep -v :extern | wc -l
122

If anyone has some patterns I can add to the Coccinelle script, I can
take another pass at it.

> Anyway:
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thank you!

-Kees

-- 
Kees Cook
