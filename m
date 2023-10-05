Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D34117BA561
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 18:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AE110E42D;
	Thu,  5 Oct 2023 16:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECF410E429
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 16:16:23 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-692779f583fso931379b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 09:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696522583; x=1697127383;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xpZu6lqlyEvAN7T4WQyZZbFvUnbP262xmkxGmbRAMgI=;
 b=R4aGLuFVebVY+lCBlJ+k0wRGf9TtF80WpFxII0nsVbe1M69zwkBEC+6IaEZqfNS61Q
 GnRhvmPEPdWBeLeL738JgsM1cZYycVzK26nT32E6y5ez0lhfppfijxAkRYh0jdz/dm5D
 7ygr4qt4A7vx45HaMaPKID2z9z9oNGNoOMSiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696522583; x=1697127383;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xpZu6lqlyEvAN7T4WQyZZbFvUnbP262xmkxGmbRAMgI=;
 b=Gnt8s7kUh3TLY/UG+89NO7ytvmS18AI0Hou7PnY2n7YB/Rf3/9brRloWX5YhUV2RKg
 PJ+jPTqxWDbs74abjwNyf0Qy5rwikZQk8hW76SYcNN1Go1nlkFZd1Gx8ApxvHFxHLWhI
 G3GCjZiBX7a57mdhqqYAbA+kekxuzw4uA1CQSAfKVsMt4LnZ/LwDnNiZt7jMI5tlWU1p
 MnoK6Dqc1zdi+H9+0RXD4hNAxUjRNYxMlkiSMM8rK81qSzEhXy1GAIO/vtc+qs1+nrme
 YkNr1iRPGm8GzcMVwhetpOqx2SnbHYdyvyKjJBt6BbTzLEW6YB2YEQMTLAQkuJTpxfmB
 YRDQ==
X-Gm-Message-State: AOJu0YwwlelHJ2glZ8rH2pLMdRJxd9My0QOeV/ST/kbMWsqk6FHiK2zx
 S+UIjZY7bS2AR8xAsJZsKX55qA==
X-Google-Smtp-Source: AGHT+IFXrkOsf8NbaVIJ+XbxUqZLmBzsbpEzEa+s/qtoOV9I4bEmWp8zGBhz1z3Jkv2V6R2XFzEStQ==
X-Received: by 2002:a05:6a20:9152:b0:14e:509:1d7b with SMTP id
 x18-20020a056a20915200b0014e05091d7bmr6301990pzc.8.1696522583218; 
 Thu, 05 Oct 2023 09:16:23 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 a26-20020a62e21a000000b00672ea40b8a9sm1612998pfi.170.2023.10.05.09.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 09:16:23 -0700 (PDT)
Date: Thu, 5 Oct 2023 09:16:21 -0700
From: Kees Cook <keescook@chromium.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 0/9] drm: Annotate structs with __counted_by
Message-ID: <202310050915.ABB0419C@keescook>
References: <20230922173110.work.084-kees@kernel.org>
 <169601600138.3014939.8511343741428844249.b4-ty@chromium.org>
 <83cd056c-52ae-01dd-7576-42d41da64c26@gmail.com>
 <CADnq5_Ma2CrLYggJHKFEObsNmUoqJwb2p1xai5DfL=m43U6zEA@mail.gmail.com>
 <202310020952.E7DE0948C0@keescook>
 <10644b5f-b0a7-85ef-0658-2353ee14df0d@gmail.com>
 <202310021107.9BB46FB8E@keescook>
 <0be2dfa4-b6c1-f62a-66e1-615da7aa3c76@amd.com>
 <202310021122.B6DA850FB0@keescook>
 <d58bbe17-efa7-4548-9c7d-bf0310d31ef5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d58bbe17-efa7-4548-9c7d-bf0310d31ef5@gmail.com>
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
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-hardening@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Yifan Zhang <yifan1.zhang@amd.com>, Xiaojian Du <Xiaojian.Du@amd.com>,
 Le Ma <le.ma@amd.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lang Yu <Lang.Yu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 John Harrison <john.c.harrison@intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 11:42:38AM +0200, Christian König wrote:
> Am 02.10.23 um 20:22 schrieb Kees Cook:
> > On Mon, Oct 02, 2023 at 08:11:41PM +0200, Christian König wrote:
> > > Am 02.10.23 um 20:08 schrieb Kees Cook:
> > > > On Mon, Oct 02, 2023 at 08:01:57PM +0200, Christian König wrote:
> > > > > Am 02.10.23 um 18:53 schrieb Kees Cook:
> > > > > > On Mon, Oct 02, 2023 at 11:06:19AM -0400, Alex Deucher wrote:
> > > > > > > On Mon, Oct 2, 2023 at 5:20 AM Christian König
> > > > > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > > > > > Am 29.09.23 um 21:33 schrieb Kees Cook:
> > > > > > > > > On Fri, 22 Sep 2023 10:32:05 -0700, Kees Cook wrote:
> > > > > > > > > > This is a batch of patches touching drm for preparing for the coming
> > > > > > > > > > implementation by GCC and Clang of the __counted_by attribute. Flexible
> > > > > > > > > > array members annotated with __counted_by can have their accesses
> > > > > > > > > > bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS (for array
> > > > > > > > > > indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family functions).
> > > > > > > > > > 
> > > > > > > > > > As found with Coccinelle[1], add __counted_by to structs that would
> > > > > > > > > > benefit from the annotation.
> > > > > > > > > > 
> > > > > > > > > > [...]
> > > > > > > > > Since this got Acks, I figure I should carry it in my tree. Let me know
> > > > > > > > > if this should go via drm instead.
> > > > > > > > > 
> > > > > > > > > Applied to for-next/hardening, thanks!
> > > > > > > > > 
> > > > > > > > > [1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table with __counted_by
> > > > > > > > >           https://git.kernel.org/kees/c/a6046ac659d6
> > > > > > > > STOP! In a follow up discussion Alex and I figured out that this won't work.
> > > > > > I'm so confused; from the discussion I saw that Alex said both instances
> > > > > > were false positives?
> > > > > > 
> > > > > > > > The value in the structure is byte swapped based on some firmware
> > > > > > > > endianness which not necessary matches the CPU endianness.
> > > > > > > SMU10 is APU only so the endianess of the SMU firmware and the CPU
> > > > > > > will always match.
> > > > > > Which I think is what is being said here?
> > > > > > 
> > > > > > > > Please revert that one from going upstream if it's already on it's way.
> > > > > > > > 
> > > > > > > > And because of those reasons I strongly think that patches like this
> > > > > > > > should go through the DRM tree :)
> > > > > > Sure, that's fine -- please let me know. It was others Acked/etc. Who
> > > > > > should carry these patches?
> > > > > Probably best if the relevant maintainer pick them up individually.
> > > > > 
> > > > > Some of those structures are filled in by firmware/hardware and only the
> > > > > maintainers can judge if that value actually matches what the compiler
> > > > > needs.
> > > > > 
> > > > > We have cases where individual bits are used as flags or when the size is
> > > > > byte swapped etc...
> > > > > 
> > > > > Even Alex and I didn't immediately say how and where that field is actually
> > > > > used and had to dig that up. That's where the confusion came from.
> > > > Okay, I've dropped them all from my tree. Several had Acks/Reviews, so
> > > > hopefully those can get picked up for the DRM tree?
> > > I will pick those up to go through drm-misc-next.
> > > 
> > > Going to ping maintainers once more when I'm not sure if stuff is correct or
> > > not.
> > Sounds great; thanks!
> 
> I wasn't 100% sure for the VC4 patch, but pushed the whole set to
> drm-misc-next anyway.
> 
> This also means that the patches are now auto merged into the drm-tip
> integration branch and should any build or unit test go boom we should
> notice immediately and can revert it pretty easily.

Thanks very much; I'll keep an eye out for any reports.

-- 
Kees Cook
