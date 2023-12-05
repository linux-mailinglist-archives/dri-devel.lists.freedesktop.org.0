Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B659B805744
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 15:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087AB10E2FF;
	Tue,  5 Dec 2023 14:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE08B10E2FF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 14:25:15 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-db538b07865so4206783276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 06:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701786315; x=1702391115; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+W9GvfVIuKUsjEASIHOqr78oXlhTeJ2aML+02C/3aT4=;
 b=BIlkyK/RfH7jGAZfNEcVq9NuUMYJCVQKdbO+EhJoPG+9BelHVus3ucS/h9IRXVz2LE
 smiLRfUq38SS7/HZ3Ia4maeEO+OI2ULML5oMbH0PYsOb0qXsi4XCBzP7bEpLbK4uGWBX
 ufruQAb3t1ygadmS9hkd2Mpzg+ruzNM23wkjgLv/O24DlU0iDESMgLYSxn5d6/9X678B
 hXjXts4jmZ5S1ko/ALrE4Cno9xq4FIQo8kPpzFfxmQ9zvpbqwi/zCpu6HpsxkWbbJXb7
 69/5HpJkiygGx6LAiSgHbDLIQVk2ufmmowGEK7649ml8dTVpQ9onQ0m5ojTODd8zNjXz
 VEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701786315; x=1702391115;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+W9GvfVIuKUsjEASIHOqr78oXlhTeJ2aML+02C/3aT4=;
 b=jyJ7ZqTuQG639DOuYNiQheh8dfhVv9vVUljIMFs7v5OJ33ivol6KT7wToA6M2rtW1M
 3YNFTjeaMsJqVSs63pSDZXaduCyT4Eqr0jy8Q8g+NoT1lO+gadz0PHJGKLYzDjlgUBvO
 wGPpTTEqmgabzkoLHmjErNohVOgaXVrsDlkhdDBo4TH/EAesqWaOvFhLALOY2lqJv6KE
 edqysrTExLp/41RNX4kk8+UGVb6GOIURU2+QuNloHITT8nQFm+CKylCoIgYS3MdZpQyz
 L7ZMmVtkIlUcrXTUKcTnLbFE7ASF4miwiGnlDYHUTbSQC7iUbZzSv3dQUNWT5FiwKlWI
 PFsw==
X-Gm-Message-State: AOJu0Yyk8KU8b31oh8QZ2E3g/7mnQ0MICjQZUqnalKhAmOMGHA1kPWPp
 NRpgqlcl2fSp972htuAFUGpbm6LzcMpbAI4m57EPmQ==
X-Google-Smtp-Source: AGHT+IF4VvVcRMjis2G1DxhlSfn/kdQgDHF7sG20cYmShITTCdVT9AyS9m/rcWd9SPQ4DLJpcU03oaFiGMVaS7VQOYs=
X-Received: by 2002:a25:8001:0:b0:db7:dacf:ed79 with SMTP id
 m1-20020a258001000000b00db7dacfed79mr4421218ybk.90.1701786314320; Tue, 05 Dec
 2023 06:25:14 -0800 (PST)
MIME-Version: 1.0
References: <20231129181219.1237887-1-jani.nikula@intel.com>
 <72248f22-6337-487a-9979-a0d79e37a9ed@amd.com> <874jh362ta.fsf@intel.com>
 <eba23oyf4i3j6sdyqljjtgaz27brz4dxfrbtoddestjxwp5lr5@qxfj2b6szigc>
In-Reply-To: <eba23oyf4i3j6sdyqljjtgaz27brz4dxfrbtoddestjxwp5lr5@qxfj2b6szigc>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 16:25:03 +0200
Message-ID: <CAA8EJppGizR7ZqY0ALtRHz0Jcm8wiFVQ0s__XENAtyGM48hunQ@mail.gmail.com>
Subject: Re: [RFC] drm: enable W=1 warnings by default across the subsystem
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Xinhui <Xinhui.Pan@amd.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Danilo Krummrich <dakr@redhat.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Nov 2023 at 11:18, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Thu, Nov 30, 2023 at 10:52:17AM +0200, Jani Nikula wrote:
> > On Wed, 29 Nov 2023, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> > > Cc: Nathan Chancellor <nathan@kernel.org>
> > >
> > > On 11/29/23 13:12, Jani Nikula wrote:
> > >> At least the i915 and amd drivers enable a bunch more compiler warnings
> > >> than the kernel defaults.
> > >>
> > >> Extend the W=1 warnings to the entire drm subsystem by default. Use the
> > >> copy-pasted warnings from scripts/Makefile.extrawarn with
> > >> s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it easier to compare and keep
> > >> up with them in the future.
> > >>
> > >> This is similar to the approach currently used in i915.
> > >>
> > >> Some of the -Wextra warnings do need to be disabled, just like in
> > >> Makefile.extrawarn, but take care to not disable them for W=2 or W=3
> > >> builds, depending on the warning.
> > >
> > > I think this should go in after drm-misc-next has a clean build (for
> > > COMPILE_TEST builds) with this patch applied. Otherwise, it will break a
> > > lot of build configs.
> >
> > Oh, I'm absolutely not suggesting this should be merged before known
> > warnings have been addressed one way or another. Either by fixing them
> > or by disabling said warning in driver local Makefiles, depending on the
> > case.
>
> I'm all for it, but yeah, we need some easy way to opt-in/opt-out. Some
> drivers are pretty much unmaintained now and are likely to never fix
> those warnings.

Then maybe they should have the same fate as other undermaintained
drivers: either they get fixed, or they get dropped?


-- 
With best wishes
Dmitry
