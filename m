Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E057ADE12
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 19:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248F010E2C4;
	Mon, 25 Sep 2023 17:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BADA10E2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 17:52:35 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-690d2441b95so5180953b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 10:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695664354; x=1696269154;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YKkjlOQ/GPkFrKX9bDbfTnpErQ+3hoiSxDUiC5xM1v4=;
 b=Zx9EOJoFakMF01iDmiiBJU3OKNrHMNZc6sdu4a0rP1ezIwvbox1l8o7h+tO9gyJ51E
 UtN50x6uW7ap6dfZHIuWMSEM6bVyzEYHOGx6HD84u8ASZe02aX/MqHkddM1Qe+5qYZVD
 7hrd6RQq3npCI+u6eDBFZ4UvASsEDSxjwGAKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695664354; x=1696269154;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YKkjlOQ/GPkFrKX9bDbfTnpErQ+3hoiSxDUiC5xM1v4=;
 b=PybAeG4Pa00YgfyLIKxldAkS0sISS1lJA2ekDV9tdXSNqYzFCpn2Z9+y0FSl6xs5pg
 oK2/VyBZc/81ttZHigb4PLhho0hhW/KbfEI4/WPuqY7lNvxJ3jecusUE3UiCih/4lD4u
 m16WSFRYfUV3IY+/QsDnkwBN1OpHXnlsvsrq8freeTIwfsviSLQLqI4dhTn8iU4vmHO0
 /3go+whI44LQfFsPnukRd/FsaNJ8XEjv5cgD8DM/6Vzo6T60LsPx1gwU7Sx6vLNiraWR
 hbPIYxZPttSpRsJfhN+hnrBATeriZcvwrJ6+vare3bsywvwDHoBiqvppG4KpSPsj7EUj
 pyuA==
X-Gm-Message-State: AOJu0YxsKouoYVc1Nig5EWBuEb1stMvged7H8DHE2AxCeSPxgAb7LkKS
 tdKCHr3wMQQh90uksQ+qHBpXtQ==
X-Google-Smtp-Source: AGHT+IGbOeCWSbVNrAKbhj9D9vKUNI/wwQgYtn6Pn0L0F9XDlvUNhyZJFZGUIjA69DGrRpph9k1vJQ==
X-Received: by 2002:a05:6a20:3ca6:b0:13e:90aa:8c8b with SMTP id
 b38-20020a056a203ca600b0013e90aa8c8bmr576006pzj.4.1695664354536; 
 Mon, 25 Sep 2023 10:52:34 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 h19-20020a633853000000b0057c3b21c01dsm6967245pgn.49.2023.09.25.10.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 10:52:33 -0700 (PDT)
Date: Mon, 25 Sep 2023 10:52:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/9] drm/amd/pm: Annotate struct
 smu10_voltage_dependency_table with __counted_by
Message-ID: <202309251051.EE3ECE7B@keescook>
References: <20230922173110.work.084-kees@kernel.org>
 <20230922173216.3823169-1-keescook@chromium.org>
 <CADnq5_P2p3bmczci=pU+pG6f9+hqn=-xp1EynP2345CJZRW08w@mail.gmail.com>
 <2635922e-f52a-4e91-40c6-4f1358972786@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2635922e-f52a-4e91-40c6-4f1358972786@amd.com>
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
 Nathan Chancellor <nathan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>, Xiaojian Du <Xiaojian.Du@amd.com>,
 Le Ma <le.ma@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Hawking Zhang <Hawking.Zhang@amd.com>, Melissa Wen <mwen@igalia.com>,
 Nirmoy Das <nirmoy.das@intel.com>, freedreno@lists.freedesktop.org,
 John Harrison <john.c.harrison@intel.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 08:30:30AM +0200, Christian König wrote:
> Am 22.09.23 um 19:41 schrieb Alex Deucher:
> > On Fri, Sep 22, 2023 at 1:32 PM Kees Cook <keescook@chromium.org> wrote:
> > > Prepare for the coming implementation by GCC and Clang of the __counted_by
> > > attribute. Flexible array members annotated with __counted_by can have
> > > their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> > > (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> > > functions).
> > > 
> > > As found with Coccinelle[1], add __counted_by for struct smu10_voltage_dependency_table.
> > > 
> > > [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> > > 
> > > Cc: Evan Quan <evan.quan@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: "Christian König" <christian.koenig@amd.com>
> > > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Xiaojian Du <Xiaojian.Du@amd.com>
> > > Cc: Huang Rui <ray.huang@amd.com>
> > > Cc: Kevin Wang <kevin1.wang@amd.com>
> > > Cc: amd-gfx@lists.freedesktop.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> 
> Mhm, I'm not sure if this is a good idea. That is a structure filled in by
> the firmware, isn't it?
> 
> That would imply that we might need to byte swap count before it is
> checkable.

The script found this instance because of this:

static int smu10_get_clock_voltage_dependency_table(struct pp_hwmgr *hwmgr,
                        struct smu10_voltage_dependency_table **pptable,
                        uint32_t num_entry, const DpmClock_t *pclk_dependency_table)
{
        uint32_t i;
        struct smu10_voltage_dependency_table *ptable;

        ptable = kzalloc(struct_size(ptable, entries, num_entry), GFP_KERNEL);
        if (NULL == ptable)
                return -ENOMEM;

        ptable->count = num_entry;

So the implication is that it's native byte order... but you tell me! I
certainly don't want this annotation if it's going to break stuff. :)

-- 
Kees Cook
