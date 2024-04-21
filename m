Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC13E8ABE52
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 03:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFD010FDD2;
	Sun, 21 Apr 2024 01:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UZhxndhy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCD210FDD2;
 Sun, 21 Apr 2024 01:36:06 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3c749aa444fso1264324b6e.0; 
 Sat, 20 Apr 2024 18:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713663365; x=1714268165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FvPFBsNaoZ1H9tXzQ7l5Efl5qiniTP5oTQ2Kk1YN9Z4=;
 b=UZhxndhyAcPYDxPPAkBCHT2UPKO0VCj/EWNV+OzO+tbnqJJqqs1aKraz+F20j/LhsY
 It2JmSnfdFib26fBUrZRPy8AsS0ZskRq3WyFP1Ev3OEVZiKg0MyFc49njidVKGkYjyUp
 3fQTwUiH5wntQQGURzuM3b5SSIn+wPl2NTD+0oO/aKVASQzynIVRgwFCRoNClCf/6jKQ
 FUjN8Rb5h/IlkxDdHmRdS4eCizvJAb3wW7TDeNZdfnXzgLqYN6w1YhtqLkJ+wd4JpA45
 SXKKJpY8InPWZKCgpdhabUI+9LQJYfsuc1uKpfGhyZoUNNzJB5hwja8rY9JObWhGE7U9
 8uoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713663365; x=1714268165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FvPFBsNaoZ1H9tXzQ7l5Efl5qiniTP5oTQ2Kk1YN9Z4=;
 b=jGgTvfzLaksMc5uDuUExn68+XrRwaKzXkD8m7IOp6k+clQ7nO4RvrESkO09c+Ya62N
 2ENG+LfoZvYG0zaNrAQ6hf+hnpEXpHuQm3lj+z7xEs82tVRXqEzN3JkMYBh3vz5s9x8i
 hlsjEgZ+ImFBc1beG3K6PicSf4WgHY26MJ9oeD25HQxcv/EMi3iVdLBMsly9nekfQV6J
 GgG5zbySmirKfvdcYT14hE/nnDBIf9WViiUxwnkJKGNn7F10MMwpV9iBplrTzFMMcMVL
 ubrUzsrmfyH5Nm4TDD2OK67MzBHFyT7nixSHuwZnCcRcu2FSpq9moYvXIbF8+nPmWxsY
 NDaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu0OtCNrM7/fRs1tfusz4G6s9NxlVy0y6/e09rwuLfKHGXBCS4H1u9UKXSjKzjeGXZBhzpgq6XqYHSQCCM7VEv08U3ieTSZy3zzil0L8AerOJ6vKCwm8cy0drVfNed4bT01ncM/kttfnjHokpckg==
X-Gm-Message-State: AOJu0YxTVBtLzlM4uht3eUVv9WZH5aoxqbLvz+XKWUCN4QU1mJaP8aRA
 Zy0fveNsXZXU+ggPTXVbrWh2rgnKh75s2bBLg632jZafOBcckh53aeb+CiJRLPWzlkUJxnQcET9
 Cj/kBacJ2JwEms13terF7GWmR3n0=
X-Google-Smtp-Source: AGHT+IFkyNsm4CrTyqXtqeNnnXaWtM3d85vgw+7Flih8SIL+lQ+nvAR4sw2pWcV0cfw8r5+XjtFntMOiXCgwJhS8K+c=
X-Received: by 2002:a05:6808:1a8f:b0:3c6:f7b1:b228 with SMTP id
 bm15-20020a0568081a8f00b003c6f7b1b228mr5853968oib.31.1713663365360; Sat, 20
 Apr 2024 18:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
 <20240420184929.97854-1-jppaulo11@usp.br>
In-Reply-To: <20240420184929.97854-1-jppaulo11@usp.br>
From: Tales <tales.aparecida@gmail.com>
Date: Sat, 20 Apr 2024 22:36:58 -0300
Message-ID: <CAGVoLp5W0DT-RZbUvjoh6+=oNAi6A9V3P2syBMMVPXtiUY9K0A@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/amd/display: Update Display Core unit tests
To: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
Cc: rodrigo.siqueira@amd.com, airlied@gmail.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, corbet@lwn.net, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 Xinhui.Pan@amd.com, paulormm@ime.usp.br, airlied@linux.ie, 
 amd-gfx@lists.freedesktop.org, andrealmeid@riseup.net, davidgow@google.com, 
 dlatypov@google.com, dri-devel@lists.freedesktop.org, harry.wentland@amd.com, 
 hersenxs.wu@amd.com, isabbasso@riseup.net, javierm@redhat.com, 
 kunit-dev@googlegroups.com, magalilemes00@gmail.com, mairacanal@riseup.net, 
 mwen@igalia.com, nicholas.choi@amd.com, sunpeng.li@amd.com, 
 twoerner@gmail.com, linux-doc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em s=C3=A1b., 20 de abr. de 2024 =C3=A0s 15:50, Joao Paulo Pereira da Silva
<jppaulo11@usp.br> escreveu:
>
> Hey, I'm interested in contributing for display tests from this patch-set=
.
> I've noticed potential updates related to both refactoring and optimizati=
on.
> This patch-set applies these suggestions.
>

Hi,

It's great to see this moving forward!

Overall the suggested changes make sense to me, and honestly I already don'=
t
remember the discussions that went behind some of them. The only thing that
I would like to raise for you, and anyone else reviewing this, is that
apparently
there are now stronger feeling towards the "preferred way"[1] to handle tes=
ts in
static functions, using EXPORT_SYMBOL_IF_KUNIT (or EXPORT_SYMBOL_FOR_TESTS_=
ONLY
in the case of DRM), so they might be more adequate to work on
refactoring this code.

[1]: https://lore.kernel.org/all/5z66ivuhfrzrnuzt6lwjfm5fuozxlgqsco3qb5rfzy=
f6mil5ms@2svqtlcncyjj/

Kind regards,
Tales

>
> [WHY]
>
> 1.      The single test suite in the file
>         test/kunit/dc/dml/calcs/bw_fixed_test.c, which tests some static
>         functions defined in the dc/basics/bpw_fixed.c, is not being run.
>         According to kunit documentation
>         (https://www.kernel.org/doc/html/latest/dev-tools/kunit/usage.htm=
l#testing-static-functions),
>         there are two strategies for testing
>         static functions, but none of them seem to be configured. Additio=
nally,
>         it appears that the Config DCE_KUNIT_TEST should be associated wi=
th this
>         test, since it was introduced in the same patch of the test
>         (https://lore.kernel.org/amd-gfx/20240222155811.44096-3-Rodrigo.S=
iqueira@amd.com/),
>         but it is not being used anywhere in the display driver.
>
> 2.      Also, according to the documentation, "The display/tests folder r=
eplicates
>         the folder hierarchy of the display folder". However, note that t=
his test file
>         (test/kunit/dc/dml/calcs/bw_fixed_test.c) has a conflicting path =
with the file
>         that is being tested (dc/basics/bw_fixed.c).
>
> 3.      Config Names and Helps are a bit misleading and don't follow a st=
rict
>         pattern. For example, the config DML_KUNIT_TEST indicates that it=
 is used
>         to activate tests for the Display Core Engine, but instead activa=
tes tests
>         for the Display Core Next. Also, note the different name patterns=
 in
>         DML_KUNIT_TEST and AMD_DC_BASICS_KUNIT_TEST.
>
> 4.      The test suite dcn21_update_bw_bounding_box_test_suite configures=
 an init
>         function that doesn't need to be executed before every test, but =
only once
>         before the suite runs.
>
> 5.      There are some not updated info in the Documentation, such as the
>         recommended command to run the tests:
>         $ ./tools/testing/kunit/kunit.py run --arch=3Dx86_64 \
>         --kunitconfig=3Ddrivers/gpu/drm/amd/display/tests
>         (it doesn't work since there is no .kunitconfig in
>         drivers/gpu/drm/amd/display/tests)
>
>
> [HOW]
>
> 1. Revise Config names and Help blocks.
>
> 2.      Change the path of the test file bw_fixed_test from
>         test/kunit/dc/dml/calcs/bw_fixed_test.c to test/kunit/dc/basics/b=
w_fixed_test.c
>         to make it consistent with the Documentation and the other displa=
y driver
>         tests. Make this same test file run by importing it conditionally=
 in the file
>         dc/basics/bw_fixed_test.c.
>
> 3.      Turn the test init function of the suite
>         dcn21_update_bw_bounding_box_test_suite into a suite init.
>
> 4.      Update Documentation
>
> Joao Paulo Pereira da Silva (4):
>   drm/amd/display: Refactor AMD display KUnit tests configs
>   drm/amd/display/test: Fix kunit test that is not running
>   drm/amd/display/test: Optimize kunit test suite
>     dml_dcn20_fpu_dcn21_update_bw_bounding_box_test
>   Documentation/gpu: Update AMD Display Core Unit Test documentation
>
>  .../gpu/amdgpu/display/display-test.rst       | 20 ++++++------
>  drivers/gpu/drm/amd/display/Kconfig           | 31 ++++++-------------
>  .../gpu/drm/amd/display/dc/basics/bw_fixed.c  |  3 ++
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  2 +-
>  .../dc/dml/dcn20/display_mode_vba_20.c        |  2 +-
>  .../dc/dml/dcn20/display_rq_dlg_calc_20.c     |  2 +-
>  .../drm/amd/display/test/kunit/.kunitconfig   |  7 ++---
>  .../gpu/drm/amd/display/test/kunit/Makefile   |  4 +--
>  .../dc/{dml/calcs =3D> basics}/bw_fixed_test.c  |  0
>  .../test/kunit/dc/dml/dcn20/dcn20_fpu_test.c  |  6 ++--
>  10 files changed, 32 insertions(+), 45 deletions(-)
>  rename drivers/gpu/drm/amd/display/test/kunit/dc/{dml/calcs =3D> basics}=
/bw_fixed_test.c (100%)
>
> --
> 2.44.0
>
